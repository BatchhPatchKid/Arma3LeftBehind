params ["_pos", "_triggerRadius", "_maxUnits"];
		
[_pos, _triggerRadius, _maxUnits] spawn {
	params ["_pos", "_triggerRadius", "_maxUnits"];
	
	[_pos, 2] execVM "AISpawners\lootSpawner.sqf";
	_maxDist = _triggerRadius / 4;
	_minDist = 10;
	horde = createGroup east;
	_i = 1;
	_Type = ["DSA_411", "DSA_Mindflayer", "DSA_Rake", "DSA_Shadowman", "DSA_Snatcher", "DSA_Vampire", "DSA_Wendigo"];
	_sZedsNum = count _Type;
	
	for "_i" from 1 to _maxUnits do {
		_ZedType = _Type select (floor(random _sZedsNum));
		hordeUnit = horde createUnit [_ZedType, [_pos, _minDist, _maxDist, 3, 0, 20, 0, [], []] call BIS_fnc_findSafePos, [], 1, "NONE"];
		sleep 0.5;
	};
};