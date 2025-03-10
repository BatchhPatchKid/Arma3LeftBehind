params ["_pos", "_triggerRadius", "_maxUnits"];
		
	
[_pos, 0] call (missionNamespace getVariable "FN_lootSpawner");

private _horde = createGroup east;

for "_i" from 1 to _maxUnits do {
	private _hordeUnit = _horde createUnit ["DSA_Vampire", [_pos, 10, (_triggerRadius / 4), 3, 0, 20, 0, [], []] call BIS_fnc_findSafePos, [], 1, "NONE"];
};
