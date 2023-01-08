# Civilian Fleets: Mimicry Extension
Create civilian fleets to help manage your traders and miners.

![Assigning ships to form civilian fleets in v2.6](https://i.imgur.com/Avpw0Rk.png)

> Civilian Fleets: that's how simple it is! (the above screenshot was taken in X4 Foundations v2.6 with this mod active)

- The successor of Mining Trading Fleets
  - Their Nexus page: https://www.nexusmods.com/x4foundations/mods/191
  - Their EgoSoft page: https://forum.egosoft.com/viewtopic.php?f=181&t=410087
- Our GitHub repository: https://github.com/Vectorial1024/v1024_civilian_fleets
- Our Nexus page: https://www.nexusmods.com/x4foundations/mods/335
- Our EgoSoft Forums page: https://forum.egosoft.com/viewtopic.php?f=181&t=418144
- Our Steam Workshop page: https://steamcommunity.com/sharedfiles/filedetails/?id=2092839403

## Credits to the Community
Without the help from the community, this mod will not be available in other languages.
- French translation // Traduction en français par les membres de la communauté
  - GitHub user abouquet
  - EgoSoft Forums user o-papaya-o
- German translation // Deutsche Übersetzung von Community-Mitgliedern
  - GitHub user LeLeon
- Japanese translation // コミュニティメンバーによる日本語翻訳
  - GitHub user proudust
- Chinese translation // 自帶中文翻譯
  - Self-translated


## Quick Start Guide
You should check the Nexus page for more details, but, if you want to form/join a civilian fleet:

1. Set and confirm the default behavior of the fleet leader; the default behavior of the fleet leader will be applied to other members of the civilian fleet
2. Select and assign your other ships as "Mimic" role (refer to the attached pic above)
3. Setup complete
4. Forget about the fleet
5. ???
6. Profit.

## Requirements
- ~~Right Click API~~
  - No longer required! All things now rely on SirNukes Mod Supprot APIs, which is described below:
- SirNukes Mod Support APIs
  - Required: allows you to configure some parts of this mod
  - ~~Required: also allows adding the right-click menus~~ No longer used for this purpose since everything is now based on the Mimic assignment
  - Their Steam Workshop page: https://steamcommunity.com/sharedfiles/filedetails/?id=2042901274

## Built-In Cross-Mod Compatibility
This mod also supports the following civilian default behaviors from other mods as part of the built-in features:

- TaterTrade (maintained by DeadAirRT)
  - Their GitHub repository: https://github.com/DeadAirRT/TaterTrader
  - Their Steam Workshop page: https://steamcommunity.com/workshop/filedetails/?id=2082610969
- Mules and Warehouses Extended
  - Their GitHub repository: https://github.com/Misunderstood-Wookiee/Mules-and-Warehouses-Extended
  - Further instructions available at their GitHub readme
- Sanity: Sector Miner
  - Their GitHub repository: https://github.com/DeuxAlpha/sanity_sector-automine
  - Their Steam Workshop page: https://steamcommunity.com/sharedfiles/filedetails/?id=2098605344
  - Their EgoSoft Forums page: https://forum.egosoft.com/viewtopic.php?t=427342
- Factory Transporter
  - Their Steam Workshop page: https://steamcommunity.com/sharedfiles/filedetails/?id=2321672179

For mod makers, other mods can be made compatible to Civilian Fleets; more information below.

## Ensuring Compatibility with Civilian Fleets
Due to the way Civilian Fleets work, it cannot automatically detect other aiscript files that should also be used.

To make Civilian Fleets use your custom aiscript, do the following:

[Prerequisiets WIP]

### 1. Tell us the fleet name of your custom aiscript
Create a Mission Director file in `/md`, then do the following:

1. Listen to the "CivilianFleets_SettingUp" cue
2. Add your "aiscript ID"-"fleet name" pair to the Civilian Fleets global variable

For example:

```xml
<?xml version="1.0" encoding="utf-8" ?>
<mdscript name="External_RegisterCivilianFleetName" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="md.xsd">
  <cues>
    <!-- Example cue using the existing Sanity Miners compatibility code -->
    <cue name="CivilianFleets_SanityMinersCompat" instantiate="true">
      <conditions>
        <event_cue_signalled cue="md.V1024_CivilianFleets.CivilianFleets_SettingUp" />
      </conditions>
      <!-- Delay a bit to let the original cue complete its actions -->
      <delay exact="1s" />
      <actions>
        <!-- [$aiscriptId, $translationId] -->
        <append_to_list name="global.$civFleet_CmdTagPairs" exact="['Sanity_SectorAutoMine', {221024, 2001}]" />
      </actions>
    </cue>
  </cues>
</mdscript>
```

## Other Stuff
This serves as an important reminder to never skip steps, respect legacy methods, and never make breaking updates without auto-fixes.
