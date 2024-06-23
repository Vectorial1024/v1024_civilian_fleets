# Closing Thoughts

TL/DR: The X4 7.0 Mimic now matches the core functionality of this mod. After considering various reasons (see below), it is concluded that no updates or replacements shall be made, and this mod has completed its course as a helpful QoL mod. This mod shall be archived. Some information is also provided on how to transition to the X4 7.0 mimic fleets.

## How We Got Here

Civilian Fleets is actually a bugfix to the OG mod Mining Trading Fleets (see readme), which was made for X4 1.0 (2018). It turns out the idea of conveniently managing and scaling civilian fleets (mining fleets and trading fleets) is quite popular, and EgoSoft must have caught wind of this.

In X4 4.0 (2021), the Mimic default behavior was introduced. This feature allowed players to create fleets that mimic commander's behavior, exactly the feature that this mod was providing. However, this feature was incomplete as the mimic fleet would stand still if the commander was lost, so this mod still made some sense.

But later in X4 7.0 (2024), Mimic was updated to allow "recreating" the mimicked default behavior in case the commander was somehow lost. This means the vanilla Mimic was now functionally equivalent to the features of this mod (albeit with some very minor differences).

It is my policy that when the base game has something very similar to my mods, I will retire my mods, because this indicates official support of a feature, and I can be freed up to do something else. And here, the decision is made: Civilian Fleets has completed its course, and will be retired.

## What will happen to my CivFleet Mimic fleets?

You will need to know about the intricate differences between vanilla Mimic and CivFleets Mimic.

One significant difference is that vanilla Mimic requires subordinates to be able to execute the mimicked default behavior by themselves. For instance, trader pilots MUST have 3 stars to do AutoTrade, before they are accepted for AutoTrade Mimic.

This is different from CivFleet Mimic: for legacy reasons (back in the days, there was no "Expert" AutoTrade), CivFleet has always allowed fleet members to have less skill than fleet commanders; the subordinates would e.g. simply have less range compared to the commander, but will still run AutoTrade just fine.

With this, depending on your fleet composition, after uninstalling this mod, some CivFleet subordinates may stop Mimic-ing, and instead fall back to following their commanders. This may be a "mass unemployment" event that you will have to manage: for example, "unemployed" ships may need to be reassigned to stations.

## How about CivFleet auto-renaming?

This is actually a feature of the OG Mining Trading Fleet, and CivFleet only inherited it.

You may notice that CivFleet allows you to disable fleet auto-renaming; this was added due to popular request.

There is actually no clean way to restore fleet names in case the fleet is to be disbanded/to be stopped. Mining Trading Fleets did it by remembering the previous fleet names, but clearly, this means if I removed MTF suddenly, then fleet names would be stuck (X4 1.0 did not have manual fleet renaming).

The proper course of action to replace CivFleet is to create a new mod that does not have the CivFleet Mimic but retain the fleet renaming, so CivFleet users may migrate to the new mod by their own pacing. However, creating a mod just to have fleet autorenaming is simply not worth it. when fleet autorenaming is not a universally demanded feature.

## How about the CivFleet playstyle?

The CivFleet playstyle (at least in my opinion) is, after getting enough credits for the first few ships, to create a trade fleet and earn money by letting the trade fleet trade for you. This earns you some money and keeps the economy going (for some reason there is not really enough NPC traders to move wares).

You can still reasonably emulate the above playstyle by using e.g. [Faster Crew Leveling](https://forum.egosoft.com/viewtopic.php?t=424312) (I myself also use it); the scaling-up would be slower because fleet subordinates would need to also skill up, but you may still scale up.

However, I have gradually come to believe, this playstyle is "wrong", for the following reasons.

### Use Repeat Orders!

You should use Repeat Orders to ensure there is always some delivery between key stations, e.g. a delivery line from an Ore Refinery station to a Hull Parts station.

These delivery lines are hardly duplicated; 1 ship for 1 A->B supply line should be enough.

### Trading is temporary

This is not to discredit trading by itself, but borrowing Factorio's concepts and wisdoms, increasing transport capacity and balancing wares across the universe does NOT address the fact that there is a lack of ware production.

Trading can help with easing the immediate ware demand, but going too deep into trading would create a dependency on trading, and severely delay entering the station-building phase, which I consider the beginning of mid-game.

### Stations are "the thing"

It is easy to see why stations are important:
- Station managers handle and execute trade deals for you
- Station trade range depends on manager; poor pilots can shine under a good station manager
- Key QoL mods (e.g. Player Restock Subordinates) work best on stations
- Supply chains keep the wares flowing; this is best done via trade stations (or via experimental mod Station Logistics Network)
- Stations with only S/M dockyards are actually dirt cheap (do you really need that L/XL dock when you don't even have any L/XL ships?)

Sidenote: supposedly, there should be improved overall freight efficiency by centralizing wares onto trade stations and separating trade ships into 2 categories: low-capacity local traders, and high-capacity regional traders.

### By the time you ...

By the time you actually have enough high-star pilots to do free-roaming civilian fleets, you most probably have a few stations running, and those stations are earning you a stable income with much less attention and stress.

I noticed myself consistently looking at each CivFleet to see if any ships were "slacking off", i.e., got nothing to do because the relevant ware market was exhausted. This created too much stress. Would not recommend.

## Conclusion

So yeah. For various reasons listed above, there is no real good modded alternatives to CivFleet when the base game is already this good, and I have noticed the flaws in my previous playstyle.

Therefore, I am sunsetting and archiving this mod.
