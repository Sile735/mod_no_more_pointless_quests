// Escort Caravan: the ambushers are spawned as soon as the caravan sets out.
// In vanilla they are only spawned later during the trip, which often makes the contract an uneventful walk.
::mod_nmpq.HooksMod.hook("scripts/contracts/contracts/escort_caravan_contract", function(q) {
	q.spawnCaravan = @(__original) { function spawnCaravan()
	{
		__original();
		this.spawnEnemies();
	}}.spawnCaravan;
});
