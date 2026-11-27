// No More Pointless Quests - preload / registration
// Removes low-value contracts and makes caravan escorts eventful (see nmpq/hooks).

::mod_nmpq <- {
	ID = "mod_nmpq",
	Name = "No More Pointless Quests",
	Version = "0.2.0",	// keep in sync with the GitHub release tag
	GitHubURL = "https://github.com/Sile735/mod_no_more_pointless_quests"
};

// Only MSU is really needed; Reforged is listed so the changes apply on top of Reforged's
local requiredMods = [
	"mod_msu",
	"mod_reforged"
];

::mod_nmpq.HooksMod <- ::Hooks.register(::mod_nmpq.ID, ::mod_nmpq.Version, ::mod_nmpq.Name);
::mod_nmpq.HooksMod.require(requiredMods);

// ">" means "load AFTER that mod" ("<" would mean BEFORE). Version constraints are stripped down to the mod ID.
local queueLoadOrder = [];
foreach (requirement in requiredMods)
{
	local idx = requirement.find(" ");
	queueLoadOrder.push(">" + (idx == null ? requirement : requirement.slice(0, idx)));
}

::mod_nmpq.HooksMod.queue(queueLoadOrder, function() {
	::mod_nmpq.Mod <- ::MSU.Class.Mod(::mod_nmpq.ID, ::mod_nmpq.Version, ::mod_nmpq.Name);

	// In-game "new version available" notification via MSU
	::mod_nmpq.Mod.Registry.addModSource(::MSU.System.Registry.ModSourceDomain.GitHub, ::mod_nmpq.GitHubURL);
	::mod_nmpq.Mod.Registry.setUpdateSource(::MSU.System.Registry.ModSourceDomain.GitHub);
});

::mod_nmpq.HooksMod.queue(queueLoadOrder, function() {
	::include("nmpq/load.nut");
}, ::Hooks.QueueBucket.Late);
