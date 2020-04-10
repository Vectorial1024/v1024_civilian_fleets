-- Powered by Right Click API
local ffi = require("ffi")
local C = ffi.C

--[[
As a quick deployment note, the relevant assignment Lua script is located at /ui/addons/ego_interactmenu/*.lua
]]--

local function initialize()
    DebugError("V1024 Civilian Fleets, UI component starting.")

    capi.RegisterAssignAction(V1024CF_CivilianAssignment)
end

function V1024CF_CivilianAssignment(menu)
    -- We need to verify whether the assignment is valid, before allowing the game to add in interaction contents.
    --DebugError("L1")
    if menu.numassignableships > 0 then
        --[[
        Mining ships can be assigned to other mining ships as Mining/Trading ship
        Trading ships can only be assigned to other Trading ships as Trading only
        (Currently we don't have hybrid-storage ships, but just be prepared.)
        ]]--

        --DebugError("L2")
        local isstation = C.IsComponentClass(menu.componentSlot.component, "station")
        local isship = C.IsComponentClass(menu.componentSlot.component, "ship")

        if (isship) then
            -- The mod only applies when assigning to ships.
            --DebugError("L3")
            
            local convertedComponent = ConvertStringTo64Bit(tostring(menu.componentSlot.component))

            --v3.0: every subordinate must belong to some battle groups
            local subordinates = GetSubordinates(convertedComponent)
            local groups = {}
            for _, subordinate in ipairs(subordinates) do
                local group = GetComponentData(subordinate, "subordinategroup")
                if group and group > 0 then
                    if groups[group] then
                        table.insert(groups[group].subordinates, subordinate)
                    else
                        groups[group] = { assignment = ffi.string(C.GetSubordinateGroupAssignment(menu.componentSlot.component, group)), subordinates = { subordinate } }
                    end
                end
            end

            local commanderCanMine = (GetComponentData(convertedComponent, "primarypurpose") == "mine")
            -- Intuitive.
            local selectedMiningShips = (menu.numassignableminingships > 0)
            -- It is known that Mining Ships are a subset of All Ships.
            -- Also, Mining and Trading are currently mutually-exclusive (v2.5).
            -- We can use this condition to easily check the presense of trading ships.
            local selectedTradingShips = (menu.numassignableships > menu.numassignableminingships)

            local enableMiningFleet = (commanderCanMine and selectedMiningShips)
            local enableTradingFleet = (((not commanderCanMine) and selectedTradingShips) or enableMiningFleet)
            --DebugError("Dumping vars: ." .. tostring(convertedComponent) .. ", " .. tostring(commanderCanMine) .. ", " .. tostring(selectedMiningShips) .. ", " .. tostring(enableMiningFleet) .. ", " .. tostring(enableTradingFleet) .. ";")
            -- Feature not unlocked yet.
            --enableMiningFleet = false

            --[[
                If Commander can mine, and we have selected some mining ships, then enable "Mining Fleet" *and* "Trading Fleet".
                We just do not know whether the Commander is running a trade script
                    (or so I may think, with my limited knowledge of the underlying UI language)
                If Commander cannot mine, and we have selected some non-mining ships, then enable "Trading Fleet".
            ]]--

            --We have a new fleet system in v3.0, so we rewrite this part
            --Luckily, this results in me having to do less work.
            --menu.insertAssignSubActions("selected_assignments_attack", "attack", menu.buttonAssignCommander, groups, isstation)
            if (enableMiningFleet) then
                menu.insertAssignSubActions("selected_assignments_mining", "mining", menu.buttonAssignCommander, groups, isstation)
            end
            if (enableTradingFleet) then
                menu.insertAssignSubActions("selected_assignments_trade", "trade", menu.buttonAssignCommander, groups, isstation)
            end
        end
	end
end

initialize()