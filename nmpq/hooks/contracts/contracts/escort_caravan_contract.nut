::mod_nmpq.HooksMod.hook("scripts/contracts/contracts/escort_caravan_contract", function(q) {
  q.spawnCaravan = @(__original) function()
  {
    __original();
    this.spawnEnemies();
  }
});