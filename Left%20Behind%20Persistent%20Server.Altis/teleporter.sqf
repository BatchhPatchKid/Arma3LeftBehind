params ["_teleporter", "_player", "_actionId", "_typeOfTeleporter"];

sleep .1;

_factionSelected = "";

player setPos [24348.3,18140.4,0];

if (_typeOfTeleporter) then {

	// Loading their loadout upon respawn
	removeAllWeapons _player;
	removeGoggles _player;
	removeHeadgear _player;
	removeVest _player;
	removeUniform _player;
	removeAllAssignedItems _player;
	clearAllItemsFromBackpack _player;
	removeBackpack _player;


	_factionArray = ["BB",.25, "Bandit",.45, "DT",.25, "NH",.50, "PF",.15];
	_factionSelected = _factionArray call BIS_fnc_selectRandomWeighted;

	[_factionSelected, _player, false, true, false] call (missionNamespace getVariable "FN_equipAI");

	sleep 2;

	comment "Add items to containers";
	for "_i" from 1 to 5 do {
		_player addItemToBackpack "ACE_fieldDressing";
		sleep .01;
	};
	_player addItemToBackpack "ACE_bloodIV";
	_player addItemToBackpack "ACE_Fortify";
	for "_i" from 1 to 2 do {
		_player addItemToBackpack "ACE_epinephrine";
		sleep .01;
	};
	for "_i" from 1 to 2 do {
		_player addItemToBackpack "ACE_morphine";
		sleep .01;
	};

	_player addItemToUniform "rvg_matches";
	_player addItemToUniform "rvg_notepad";
	_player addItemToUniform "rvg_notepad";
	_player addItemToBackpack "rvg_beans";
	_player addItemToBackpack "rvg_plasticBottlePurified"; 
};

sleep 1;
[format ["<t size='.5'>Entering the zone in: 15 seconds</t>"], .8, 1, 1.5, .3, 0, 789] spawn BIS_fnc_dynamicText;
sleep 1;
[format ["<t size='.5'>Entering the zone in: 14 seconds</t>"], .8, 1, 1.5, .3, 0, 789] spawn BIS_fnc_dynamicText;
sleep 1;
[format ["<t size='.5'>Entering the zone in: 13 seconds</t>"], .8, 1, 1.5, .3, 0, 789] spawn BIS_fnc_dynamicText;
sleep 1;
[format ["<t size='.5'>Entering the zone in: 12 seconds</t>"], .8, 1, 1.5, .3, 0, 789] spawn BIS_fnc_dynamicText;
sleep 1;
[format ["<t size='.5'>Entering the zone in: 11 seconds</t>"], .8, 1, 1.5, .3, 0, 789] spawn BIS_fnc_dynamicText;
sleep 1;
[format ["<t size='.5'>Entering the zone in: 10 seconds</t>"], .8, 1, 1.5, .3, 0, 789] spawn BIS_fnc_dynamicText;
sleep 1;
[format ["<t size='.5'>Entering the zone in: 9 seconds</t>"], .8, 1, 1.5, .3, 0, 789] spawn BIS_fnc_dynamicText;
sleep 1;
[format ["<t size='.5'>Entering the zone in: 8 seconds</t>"], .8, 1, 1.5, .3, 0, 789] spawn BIS_fnc_dynamicText;
sleep 1;
[format ["<t size='.5'>Entering the zone in: 7 seconds</t>"], .8, 1, 1.5, .3, 0, 789] spawn BIS_fnc_dynamicText;
sleep 1;
[format ["<t size='.5'>Entering the zone in: 6 seconds</t>"], .8, 1, 1.5, .3, 0, 789] spawn BIS_fnc_dynamicText;
sleep 1;
[format ["<t size='.5'>Entering the zone in: 5 seconds</t>"], .8, 1, 1.5, .3, 0, 789] spawn BIS_fnc_dynamicText;
sleep 1;
[format ["<t size='.5'>Entering the zone in: 4 seconds</t>"], .8, 1, 1.5, .3, 0, 789] spawn BIS_fnc_dynamicText;
sleep 1;
[format ["<t color='#ff0000' size='.5'>Entering the zone in: 3 seconds</t>"], .8, 1, 1.5, .3, 0, 789] spawn BIS_fnc_dynamicText;
sleep 1;
[format ["<t color='#ff0000' size='.5'>Entering the zone in: 2 seconds</t>"], .8, 1, 1.5, .3, 0, 789] spawn BIS_fnc_dynamicText;
sleep 1;
[format ["<t color='#ff0000' size='.5'>Entering the zone in: 1 seconds</t>"], .8, 1, 1.5, .3, 0, 789] spawn BIS_fnc_dynamicText;
sleep 1;

switch (_factionSelected) do {
	case "BB": { _player setPos ([(getPos traderCache_BB), 50, 800, 5, 0, 20, 0, [], []] call BIS_fnc_findSafePos); };
	case "SU": { _player setPos ([(getPos traderCache_SU), 50, 600, 5, 0, 20, 0, [], []] call BIS_fnc_findSafePos); };
	case "DT": { _player setPos ([(getPos traderCache_DT), 50, 1500, 5, 0, 20, 0, [], []] call BIS_fnc_findSafePos); };
	case "NH": { _player setPos ([(getPos traderCache_NH), 50, 800, 5, 0, 20, 0, [], []] call BIS_fnc_findSafePos); };
	case "PF": { _player setPos ([(getPos traderCache_PF), 50, 800, 5, 0, 20, 0, [], []] call BIS_fnc_findSafePos); };
	case "Bandit": { _player setPos ([(getPos traderCache_Bandit), 50, 500, 5, 0, 20, 0, [], []] call BIS_fnc_findSafePos); };
	default { _player setPos ([[19855.2,9392.08,0], 150, 2000, 5, 0, 20, 0, [], []] call BIS_fnc_findSafePos); };
};