params ["_pos", "_triggerRadius", "_maxUnits"];

[_pos, _triggerRadius, _maxUnits] spawn {
	params ["_pos", "_triggerRadius", "_maxUnits"];
	[_pos, 0] call (missionNamespace getVariable "FN_lootSpawner");
	
	private _horde = createGroup east;
	
	_Type = "DSA_Snatcher";
	for "_i" from 1 to _maxUnits do {
		private _hordeUnit = _horde createUnit ["DSA_Snatcher", [_pos, 10, (_triggerRadius/4), 3, 0, 20, 0, [], []] call BIS_fnc_findSafePos, [], 1, "NONE"];
		sleep 0.5;
	};
};