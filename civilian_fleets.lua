-- Powered by Right Click API

local function initialize()
    DebugError("V1024 Civilian Fleets, UI component starting.")

    capi.RegisterAssignAction(V1024CF_CivilianAssignment)
end

function V1024CF_CivilianAssignment(menu)
    -- We need to verify whether the assignment is valid, before allowing the game to add in interaction contents.
    if menu.numassignableships > 0 then
        --[[
        Mining ships can be assigned to other mining ships as Mining/Trading ship
        Trading ships can only be assigned to other Trading ships as Trading only
        (Currently we don't have hybrid-storage ships, but just be prepared.)
        ]]--

        local convertedComponent = ConvertStringTo64Bit(tostring(menu.componentSlot.component))
        local commanderCanMine = (GetComponentData(convertedComponent, "primarypurpose") == "mine")
        -- Intuitive.
        local selectedMiningShips = (menu.numassignableminingships > 0)
        -- It is known that Mining Ships are a subset of All Ships.
        -- Also, Mining and Trading are currently mutually-exclusive (v2.5).
        -- We can use this condition to easily check the presense of trading ships.
        local selectedTradingShips = (menu.numassignableships > menu.numassignableminingships)

        local enableMiningFleet = (commanderCanMine and selectedMiningShips)
        local enableTradingFleet = (((not commanderCanMine) and selectedTradingShips) or enableMiningFleet)

        -- Feature not unlocked yet.
        enableMiningFleet = false

        --[[
            If Commander can mine, and we have selected some mining ships, then enable "Mining Fleet" *and* "Trading Fleet".
            We just do not know whether the Commander is running a trade script
                (or so I may think, with my limited knowledge of the underlying UI language)
            If Commander cannot mine, and we have selected some non-mining ships, then enable "Trading Fleet".
        ]]--

        --menu.insertInteractionContent("selected_assignments", { type = actiontype, text =  "[" .. ReadText(1001, 7814) .. "] " .. ReadText(20208, 40303), text2 = Helper.convertColorToText(menu.holomapcolor.playercolor) .. ((menu.numassignableships == 1) and ReadText(1001, 7851) or string.format(ReadText(1001, 7801), menu.numassignableships)), script = function () menu.buttonAssignCommander("defence") end })
        menu.insertInteractionContent("selected_assignments", { type = actiontype, text = "Form/join trading fleet", text2 = Helper.convertColorToText(menu.holomapcolor.playercolor) .. ((menu.numassignableships == 1) and ReadText(1001, 7851) or string.format(ReadText(1001, 7801), menu.numassignableships)), script = function () menu.buttonAssignCommander("trade") end, active = enableTradingFleet })
        menu.insertInteractionContent("selected_assignments", { type = actiontype, text = "Form/join mining fleet", text2 = Helper.convertColorToText(menu.holomapcolor.playercolor) .. ((menu.numassignableships == 1) and ReadText(1001, 7851) or string.format(ReadText(1001, 7801), menu.numassignableships)), script = function () menu.buttonAssignCommander("mining") end, active = enableMiningFleet })
        --menu.insertInteractionContent("selected_assignments", { type = actiontype, text = "Form/join mining fleet", text2 = tostring(commanderCanMine) .. " " .. tostring(selectedMiningShips), script = function () menu.buttonAssignCommander("mining") end, active = enableMiningFleet })
	end
end

initialize()