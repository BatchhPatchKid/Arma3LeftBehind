params ["_pos", "_triggerRadius", "_maxUnits"];

[_pos, _triggerRadius, _maxUnits] spawn {
	params ["_pos", "_triggerRadius", "_maxUnits"];
	[_pos, 0] execVM "AISpawners\lootSpawner.sqf";
	_maxDist = _triggerRadius/4; 
	_minDist = 10; 
	horde = createGroup east; 
	_i = 1; 
	_Type = "DSA_Mindflayer";
	for "_i" from 1 to _maxUnits do {
		hordeUnit = horde createUnit [_Type, [_pos, _minDist, _maxDist, 3, 0, 20, 0, [], []] call BIS_fnc_findSafePos, [], 1, "NONE"];
		sleep 0.01;
	};
};