// Removes low-value contracts from the pool that settlements can offer:
//  - northern settlements: item delivery and discover location
//  - southern city states: item delivery
// ::Const.FactionTrait.Actions[trait] lists the contract actions a faction with that trait can offer.

local function removeAction( _trait, _script )
{
	local actions = ::Const.FactionTrait.Actions[_trait];
	local idx = actions.find(_script);
	if (idx != null)
		actions.remove(idx);
	else
		::logWarning(format("%s: contract action %s not found for faction trait %i", ::mod_nmpq.Name, _script, _trait));
}

removeAction(::Const.FactionTrait.Settlement, "scripts/factions/contracts/item_delivery_action");
removeAction(::Const.FactionTrait.Settlement, "scripts/factions/contracts/discover_location_action");
removeAction(::Const.FactionTrait.OrientalCityState, "scripts/factions/contracts/item_delivery_action");
