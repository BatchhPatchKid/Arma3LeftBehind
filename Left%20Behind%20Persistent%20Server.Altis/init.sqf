waitUntil {!isNull player};
sleep 3;

player enableStamina false;

if (side player != civilian && (hasInterface or isDedicated)) then {
	player execVM "Ambient\temperature.sqf"; // maybe 1 frame loss
	player execVM "Ambient\ZSpawner.sqf"; // no frame loss
	player execVM "Ambient\BanditSpawner.sqf"; // 1 fps loss on average
	player execVM "Ambient\radSystem.sqf"; // maybe 1 frame loss
};

"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1, .9, 0, [0.0, 0.0, 0.0, 0.0], [.80, .75, .75, .6], [0.2, 0.5, 0.5, 0.0]];
"colorCorrections" ppEffectCommit 0;

_actionMain = ["Main","Scenario Actions","",{},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"], _actionMain] call ace_interact_menu_fnc_addActionToClass;

_action = ["Arsenal","Open the Arsenal","",{[player, player, true] call ace_arsenal_fnc_openBox;},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","Main"], _action] call ace_interact_menu_fnc_addActionToClass;

_actionRad = ["radiation","Check Rad Exposure","",{call FN_radiation},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","Main"], _actionRad] call ace_interact_menu_fnc_addActionToClass;

_actionTemp = ["temperature","Check Temperature","",{call FN_temperature},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","Main"], _actionTemp] call ace_interact_menu_fnc_addActionToClass;

_actionFaction = ["faction","Check Faction Affiliation","",{call FN_checkFaction},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","Main"], _actionFaction] call ace_interact_menu_fnc_addActionToClass;

_actionSleep = ["sleep","Lay Down Sleeping Bag","",{call FN_sleep},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","Main"], _actionSleep] call ace_interact_menu_fnc_addActionToClass;

_actionFlag = ["base","Set Down Base Flag","",{call FN_setDownBaseCache},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","Main"], _actionFlag] call ace_interact_menu_fnc_addActionToClass;

player setVariable ["SU_Relation",true,true];
player setVariable ["BB_Relation",true,true];
player setVariable ["PF_Relation",false,true];
player setVariable ["ALF_Relation",false,true];
player setVariable ["WO_Relation",false,true];
player setVariable ["RU_Relation",false,true];
player setVariable ["US_Relation",false,true];
player setVariable ["NH_Relation",false,true];
player setVariable ["TRB_Relation",false,true];
player setVariable ["RC_Relation",false,true];
player setVariable ["DT_Relation",false,true];
player setVariable ["ROA_Relation",false,true];
player setVariable ["PMC_Relation",false,true];
player setVariable ["Bandit_Relation",false,true];
player setVariable ["Renegade_Relation",false,true];
player setVariable ["wants_to_sleep", false, true];

FN_setDownBaseCache = {
	// Check if there's already a flag placed
	if (!isNil "baseFlagObject") then {
		deleteVehicle baseFlagObject; // Delete the existing sleeping bag
	};

	// Create and position the new sleeping bag
	_flag = "Flag_Red_F" createVehicle [(getPosATL player select 0), (getPosATL player select 1), (getPosATL player select 2)];
	_flag setPos [(getPosATL player select 0), (getPosATL player select 1), (getPosATL player select 2)];
	_flag setDir (getDir player);
	
	// Assign the new sleeping bag object to a global variable for tracking
	baseFlagObject = _flag;
	hintSilent "Flag has been planted. Everything in a radius of a 150m is your base and will now not despawn.";
	
	[
		{
			baseFlagObject addAction
			[
				"Take down flag pole",	// title
				{
					params ["_target", "_caller", "_actionId", "_arguments"]; // script
					deleteVehicle _target;
				},
				nil,		// arguments
				1.5,		// priority
				true,		// showWindow
				true,		// hideOnUse
				"",			// shortcut
				"true",		// condition
				3,			// radius
				false,		// unconscious
				"",			// selection
				""			// memoryPoint
			];
		}
	] remoteExec ["call", 0];
};

FN_sleep = { //player actions for the sleeping function of the game
	[] spawn {
		// Check if there's already a sleeping bag placed
		if (!isNil "sleepingBagObject") then {
			deleteVehicle sleepingBagObject; // Delete the existing sleeping bag
		};

		// Create and position the new sleeping bag
		_sleepingBag = "Land_Sleeping_bag_F" createVehicle [(getPosATL player select 0), (getPosATL player select 1), (getPosATL player select 2)];
		_sleepingBag setPos [(getPosATL player select 0), (getPosATL player select 1), (getPosATL player select 2) + 0.02];
		_sleepingBag setDir (getDir player);
		
		
		// Assign the new sleeping bag object to a global variable for tracking
		sleepingBagObject = _sleepingBag;
		
		sleepingBagObject addAction
			[
				"Try to sleep",	// title
				{
					params ["_target", "_caller", "_actionId", "_arguments"]; // script
					if (daytime < 6 || daytime > 20) then {
						_caller setVariable ["wants_to_sleep", true, true];
						hintSilent "You are now trying to sleep.";
						sleep 3;
						hintSilent "";
					} else {
						_caller setVariable ["wants_to_sleep", false, true];
						hintSilent "It's too early to sleep. Your bedtime is from 20:00 to 06:00.";
						sleep 3;
						hintSilent "";
					};
				},
				nil,		// arguments
				1.5,		// priority
				true,		// showWindow
				true,		// hideOnUse
				"",			// shortcut
				"true",		// condition
				3,			// radius
				false,		// unconscious
				"",			// selection
				""			// memoryPoint
			];
			sleepingBagObject addAction
			[
				"Stop trying to sleep",	// title
				{
					params ["_target", "_caller", "_actionId", "_arguments"]; // script
					if (_caller getVariable "wants_to_sleep") then {
						_caller setVariable ["wants_to_sleep", false, true];
						hintSilent "You are no longer trying to sleep.";
						sleep 3;
						hintSilent "";
					} else {
						hintSilent "You weren't trying to sleep.";
						sleep 3;
						hintSilent "";
					};
				},
				nil,		// arguments
				1.5,		// priority
				true,		// showWindow
				true,		// hideOnUse
				"",			// shortcut
				"true",		// condition
				3,			// radius
				false,		// unconscious
				"",			// selection
				""			// memoryPoint
			];
			sleepingBagObject addAction
			[
				"Roll up sleeping bag",	// title
				{
					params ["_target", "_caller", "_actionId", "_arguments"]; // script
					_caller setVariable ["wants_to_sleep", false, true];
					deleteVehicle _target;
				},
				nil,		// arguments
				1.5,		// priority
				true,		// showWindow
				true,		// hideOnUse
				"",			// shortcut
				"true",		// condition
				3,			// radius
				false,		// unconscious
				"",			// selection
				""			// memoryPoint
			];
	};
};

FN_checkFaction = {
	_handle = 0 spawn {
		_relation = "";
		_firstFaction = true;
		if (player getVariable "BB_Relation") then {
			if (_firstFaction) then {
				_relation = _relation + "Boonie Boys (BB)";
				_firstFaction = false;
			} else {
				_relation = _relation + " and Boonie Boys (BB)";
			};
		};
		if (player getVariable "SU_Relation") then {
			if (_firstFaction) then { 
				_relation = _relation + "Survivors Union (SU)";
				_firstFaction = false;
			} else {
				_relation = _relation + " and Survivors Union (SU)";
			};
		};
		if (player getVariable "PF_Relation") then {
			if (_firstFaction) then { 
				_relation = _relation + "Pigs Flesh (PF)";
				_firstFaction = false;
			} else {
				_relation = _relation + " and Pigs Flesh (PF)";
			};
		};
		if (player getVariable "ALF_Relation") then {
			if (_firstFaction) then { 
				_relation = _relation + "Altis Liberation Front (ALF)";
				_firstFaction = false;
			} else {
				_relation = _relation + " and Altis Liberation Front (ALF)";
			};
		};
		if (player getVariable "WO_Relation") then {
			if (_firstFaction) then { 
				_relation = _relation + "World Order (WO)";
				_firstFaction = false;
			} else {
				_relation = _relation + " and World Order (WO)";
			};
		};
		if (player getVariable "RU_Relation") then {
			if (_firstFaction) then { 
				_relation = _relation + "Russian Federation (RU)";
				_firstFaction = false;
			} else {
				_relation = _relation + " and Russian Federation (RU)";
			};
		};
		if (player getVariable "US_Relation") then {
			if (_firstFaction) then { 
				_relation = _relation + "United States Army (US)";
				_firstFaction = false;
			} else {
				_relation = _relation + " and United States Army (US)";
			};
		};	
		if (player getVariable "NH_Relation") then {
			if (_firstFaction) then { 
				_relation = _relation + "New Horizon (NH)";
				_firstFaction = false;
			} else {
				_relation = _relation + " and New Horizon (NH)";
			};
		};	
		if (player getVariable "TRB_Relation") then {
			if (_firstFaction) then { 
				_relation = _relation + "The Red Bullet (TRB)";
				_firstFaction = false;
			} else {
				_relation = _relation + " and The Red Bullet (TRB)";
			};
		};	
		if (player getVariable "RC_Relation") then {
			if (_firstFaction) then { 
				_relation = _relation + "Ravens Cloak (RC)";
				_firstFaction = false;
			} else {
				_relation = _relation + " and Ravens Cloak (RC)";
			};
		};	
		if (player getVariable "DT_Relation") then {
			if (_firstFaction) then { 
				_relation = _relation + "Deadmans Trident (DT)";
				_firstFaction = false;
			} else {
				_relation = _relation + " and Deadmans Trident (DT)";
			};
		};	
		if (player getVariable "ROA_Relation") then {
			if (_firstFaction) then { 
				_relation = _relation + "Republic of Altis (ROA)";
				_firstFaction = false;
			} else {
				_relation = _relation + " and Republic of Altis (ROA)";
			};
		};	
		if (player getVariable "PMC_Relation") then {
			if (_firstFaction) then { 
				_relation = _relation + "PMC Group Alpha (PMC)";
				_firstFaction = false;
			} else {
				_relation = _relation + " and PMC Group Alpha (PMC)";
			};
		};	
		if (player getVariable "Bandit_Relation") then {
			if (_firstFaction) then { 
				_relation = _relation + "Bandits";
				_firstFaction = false;
			} else {
				_relation = _relation + " and Bandits";
			};
		};	
		if (player getVariable "Renegade_Relation") then {
			if (_firstFaction) then { 
				_relation = _relation + "Renegades";
				_firstFaction = false;
			} else {
				_relation = _relation + " and Renegades";
			};
		};	
		
		hint format ["You are friendly with factions: %1 ", _relation];
		sleep 6;
		hintSilent "";
	};
};