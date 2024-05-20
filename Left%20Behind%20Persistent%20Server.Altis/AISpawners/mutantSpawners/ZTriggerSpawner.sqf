params ["_pos", "_numUnits", "_minDist", "_maxDist", "_faction", "_triggerRadius"];

_ZedArray = [];

FN_setNumUnits = { // sets the random number of units
	params ["_numUnitsMin","_numUnitsMid","_numUnitsMax"];
	_numUnits = round (random [_numUnitsMin, _numUnitsMid, _numUnitsMax]);

	{
		if (_x distance _pos < _triggerRadius + 50) then {
			_numUnits = _numUnits + 1;
		};
		sleep .01;
	} forEach allPlayers;
	_numUnits;
};

FN_spawnSpecialInfected = {
	params ["_ZedArray", "_minDist", "_maxDist", "_pos", "lvl_loot", "_minUnits", "_midUnits", "_maxUnits", "_numUnits"];
	
	if (_numUnits == 0) then {
			_numUnits = [_minUnits, _midUnits, _maxUnits] call FN_setNumUnits;
		};
	
	[_pos, lvl_loot] execVM "AISpawners\lootSpawner.sqf"; 
	
	horde = createGroup east;	
			
	for "_i" from 1 to _numUnits do {
		_ZedType = _ZedArray call BIS_fnc_selectRandomWeighted;
		hordeUnit = horde createUnit [_ZedType, [_pos, _minDist, _maxDist, 3, 0, 20, 0, [], []] call BIS_fnc_findSafePos, [], 1, "NONE"];
		sleep .01;
	};
};

FN_getZombieArray = {
	params ["_type"];
	
	_ZedArray = [];
	execVM "ArrayDatabase.sqf";
	switch (_type) do {
		case 1: { // faster zombie array
			_ZedArray = ["fastZombie"] call FN_arrayReturn;
		};
		case 2: { // mutant array
			_ZedArray = ["mutantZombie"] call FN_arrayReturn;
		};
		default { // default is normal slow zombie array
			_ZedArray = ["slowZombie"] call FN_arrayReturn;
		};
	};
	_ZedArray;
};

switch (_faction) do { //Going throuigh each zombie faction to spawn the appropriate one
	case "Bloater": {
		_minUnits = 2;
		_midUnits = 4;
		_maxUnits = 8;
		_ZedArray = ["Zombie_Special_OPFOR_Boomer"];
		lvl_loot = 1;
			
		[_ZedArray, _minDist, _maxDist, _pos, lvl_loot, _minUnits, _midUnits, _maxUnits, _numUnits] call FN_spawnSpecialInfected;
	};
	case "Leaper": {
		_minUnits = 2;
		_midUnits = 3;
		_maxUnits = 6;
		_ZedArray = ["Zombie_Special_OPFOR_Leaper_1","Zombie_Special_OPFOR_Leaper_2"];
		lvl_loot = 1;
			
		[_ZedArray, _minDist, _maxDist, _pos, lvl_loot, _minUnits, _midUnits, _maxUnits, _numUnits] call FN_spawnSpecialInfected;
	};
	case "Screamer": {
		_minUnits = 2;
		_midUnits = 4;
		_maxUnits = 5;
		_ZedArray = ["Zombie_Special_OPFOR_Screamer"];
		lvl_loot = 1;
			
		[_ZedArray, _minDist, _maxDist, _pos, lvl_loot, _minUnits, _midUnits, _maxUnits, _numUnits] call FN_spawnSpecialInfected;
	};
	case "mutants": {
		_minUnits = 1;
		_midUnits = 2;
		_maxUnits = 4;
		_ZedArray = [2] call FN_getZombieArray;
		lvl_loot = 2;
			
		[_ZedArray, _minDist, _maxDist, _pos, lvl_loot, _minUnits, _midUnits, _maxUnits, _numUnits] call FN_spawnSpecialInfected;
	};
	case "demon": {
		_minUnits = 1;
		_midUnits = 3;
		_maxUnits = 5;
		_ZedArray = ["RyanZombieboss1Opfor","RyanZombieboss2Opfor","RyanZombieboss3Opfor","RyanZombieboss4Opfor","RyanZombieboss5Opfor","RyanZombieboss6Opfor","RyanZombieboss7Opfor","RyanZombieboss8Opfor","RyanZombieboss9Opfor","RyanZombieboss10Opfor","RyanZombieboss11Opfor","RyanZombieboss12Opfor","RyanZombieboss13Opfor","RyanZombieboss14Opfor","RyanZombieboss15Opfor","RyanZombieboss16Opfor","RyanZombieboss17Opfor","RyanZombieboss18Opfor","RyanZombieboss19Opfor","RyanZombieboss20Opfor","RyanZombieboss21Opfor","RyanZombieboss22Opfor","RyanZombieboss23Opfor","RyanZombieboss24Opfor","RyanZombieboss25Opfor","RyanZombieboss26Opfor","RyanZombieboss27Opfor","RyanZombieboss28Opfor","RyanZombieboss29Opfor","RyanZombieboss30Opfor","RyanZombieboss31Opfor","RyanZombieboss32Opfor"];
		lvl_loot = 2;
			
		[_ZedArray, _minDist, _maxDist, _pos, lvl_loot, _minUnits, _midUnits, _maxUnits, _numUnits] call FN_spawnSpecialInfected;
	};
	case "spareZombies": { // ambient zombies around a location
		if (_numUnits == 0) then {
			_numUnits = [5, 8, 10] call FN_setNumUnits;
		};
		
		if (daytime < 4 || daytime > 20) then {
			_ZedArray = [1] call FN_getZombieArray;
			_numUnits = _numUnits + 3;
		} else {
			_ZedArray = [0] call FN_getZombieArray;
		};
		
		horde = createGroup east;
		for "_i" from 1 to _numUnits do { // scattered group
			_ZedType = _ZedArray call BIS_fnc_selectRandomWeighted; 
			hordeUnit = horde createUnit [_ZedType, [_pos, _minDist, _triggerRadius-75, 3, 0, 20, 0, [], []] call BIS_fnc_findSafePos, [], 20, "NONE"];
			sleep .01;
		};
	};
	default { // Default is zombies
		if (_numUnits == 0) then {
			_numUnits = [6, 10, 13] call FN_setNumUnits;
		};

		if (_numUnits > 21) then {
			[_pos, 1] execVM "AISpawners\lootSpawner.sqf";
		} else { [_pos, 0] execVM "AISpawners\lootSpawner.sqf"; };
		
		
		if (daytime < 4 || daytime > 20) then {
			_ZedArray = [1] call FN_getZombieArray;
			_numUnits = _numUnits + 3;
		} else {
			_ZedArray = [0] call FN_getZombieArray;
		};
		
		horde = createGroup east;
		for "_i" from 1 to _numUnits/4 do { // centered group
			_ZedType = _ZedArray call BIS_fnc_selectRandomWeighted; 
			hordeUnit = horde createUnit [_ZedType, [_pos, 0, 10, 3, 0, 20, 0, [], []] call BIS_fnc_findSafePos, [], 20, "NONE"];
			sleep .01;
		};
		
		_groupPos = [_pos, _minDist, _maxDist/2, 3, 0, 20, 0, [], []] call BIS_fnc_findSafePos;
		horde = createGroup east;
		for "_i" from 1 to _numUnits/3 do { // one cluster
			_ZedType = _ZedArray call BIS_fnc_selectRandomWeighted; 
			hordeUnit = horde createUnit [_ZedType, [_groupPos, 2, 10, 3, 0, 20, 0, [], []] call BIS_fnc_findSafePos, [], 20, "NONE"];
			sleep .01;
		};
		
		_groupPos = [_pos, _minDist, _maxDist/2, 3, 0, 20, 0, [], []] call BIS_fnc_findSafePos;
		horde = createGroup east;
		for "_i" from 1 to _numUnits/3 do { // second cluster
			_ZedType = _ZedArray call BIS_fnc_selectRandomWeighted; 
			hordeUnit = horde createUnit [_ZedType, [_groupPos, 2, 10, 3, 0, 20, 0, [], []] call BIS_fnc_findSafePos, [], 20, "NONE"];
			sleep .01;
		};	
	};
};