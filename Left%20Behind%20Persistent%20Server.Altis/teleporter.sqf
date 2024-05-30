params ["_teleporter", "_player", "_actionId", "_typeOfTeleporter"];

sleep .1;

_factionSelected = "";

player setPos [24002.6,16939,0];

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


	_factionArray = ["BB",.5,"SU",.35,"RC",.15,"TRB",.15,"DT",.35,"NH",.30,"PF",.20];
	_factionSelected = _factionArray call BIS_fnc_selectRandomWeighted;

	[_factionSelected, _player, false, true, false] execVM "AISpawners\aiSubScripts\equipAI.sqf";

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

	comment "Add essential items";
	_player linkItem "ItemMap";
	_player linkItem "ItemCompass";
	_player linkItem "ItemWatch";
	_player linkItem "ItemRadio";

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
	case "BB": { _player setPos ([[20772.3,12975.8,0], 50, 800, 3, 0, 20, 0, [], []] call BIS_fnc_findSafePos); };
	case "SU": { _player setPos ([[22252.3,16834.8,0], 50, 600, 3, 0, 20, 0, [], []] call BIS_fnc_findSafePos); };
	case "RC": { _player setPos ([[9363.33,18735.7,0], 50, 500, 3, 0, 20, 0, [], []] call BIS_fnc_findSafePos); };
	case "TRB": { _player setPos ([[20301.1,18998.7,0], 50, 800, 3, 0, 20, 0, [], []] call BIS_fnc_findSafePos); };
	case "DT": { _player setPos ([[15345.5,11100.2,0], 50, 1500, 3, 0, 20, 0, [], []] call BIS_fnc_findSafePos); };
	case "NH": { _player setPos ([[18659.4,8843.31,0], 50, 800, 3, 0, 20, 0, [], []] call BIS_fnc_findSafePos); };
	case "PF": { _player setPos ([[8374.39,14694.3,0], 50, 500, 3, 0, 20, 0, [], []] call BIS_fnc_findSafePos); };
	default { _player setPos ([[10229,16362.9,0], 150, 2000, 3, 0, 20, 0, [], []] call BIS_fnc_findSafePos); };
};