local gt = this.getroottable();

function removeByValue(arr, val) {
    local idx = arr.find(val);
    if ( idx != null ) {  // found
        arr.remove(idx);
    }
    else{
    	::logInfo("item not found " + val)
    }
}

function logArray(arr){
	foreach (item in arr)
	{
		::logInfo(item);
	}
}

::logInfo("No More pointless quests removing")
removeByValue(gt.Const.FactionTrait.Actions[10], "scripts/factions/contracts/item_delivery_action");
removeByValue(gt.Const.FactionTrait.Actions[10], "scripts/factions/contracts/discover_location_action");
removeByValue(gt.Const.FactionTrait.Actions[18], "scripts/factions/contracts/item_delivery_action");
::logInfo("removed the pointless quests");

