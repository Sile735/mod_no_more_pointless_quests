::mod_nmpq <- {
	ID = "mod_nmpq",
	Name = "No More Pointless Quests",
	Version = "0.1.0",
	// GitHubURL = "https://github.com/YOURNAME/mod_MODID",
}

local requiredMods = [   
	"mod_dynamic_perks",
	"mod_reforged",
	"mod_stack_based_skills"  
];
::mod_nmpq.HooksMod <- ::Hooks.register(::mod_nmpq.ID, ::mod_nmpq.Version, ::mod_nmpq.Name);
::mod_nmpq.HooksMod.require(requiredMods);
local queueLoadOrder = [];
foreach (requirement in requiredMods)
{
	local idx = requirement.find(" ");
	queueLoadOrder.push("<" + (idx == null ? requirement : requirement.slice(0, idx)));
}
::mod_nmpq.HooksMod.queue(queueLoadOrder, function() {
	::mod_nmpq.Mod <- ::MSU.Class.Mod(::mod_nmpq.ID, ::mod_nmpq.Version, ::mod_nmpq.Name);
});

::mod_nmpq.HooksMod.queue(queueLoadOrder, function() {
    ::include("nmpq/load.nut");
}, ::Hooks.QueueBucket.Late);
