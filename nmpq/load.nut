//::include("mod_MODID/some_priority_script");	// This file needs priority
::logInfo("No More Pointless Quests Loading");
::includeFiles(::IO.enumerateFiles("nmpq/hooks"));		// This will load and execute all hooks

