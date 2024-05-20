params ["_pos", "_triggerRadius"];

execVM "ArrayDatabase.sqf";
_vehArray = ["defaultVeh"] call FN_arrayReturn;
_roadPosition = [0,0,0];

for "_i" from 0 to (round(random [1, 2, 4])) do { // possibly spawning 0 to 4 vehicles
	if ((round(random [1, 5, 10])) >= 5) then {
		_roadPositions = nearestTerrainObjects [_pos, ["ROAD","MAIN ROAD","TRAIL"], (_triggerRadius / 1.5)];
		if (count _roadPositions > 0 && !(isNil "_roadPositions")) then {
			while {true} do {
				_roadPosition = getPos (selectRandom _roadPositions);
				_collisionObjects = nearestObjects [_roadPosition, ["empty","car"], 5];
				if (player distance _roadPosition > 100 && (count _collisionObjects) < 1) exitWith {};
				sleep .01;
			};
		} else {
			while {true} do {
				_roadPosition = [_pos, 15, 200, 3, 0, 20, 0, [], []] call BIS_fnc_findSafePos;
				_collisionObjects = nearestObjects [_roadPosition, ["empty","car"], 5];
				if (player distance _roadPosition > 100 && (count _collisionObjects) < 1) exitWith {};
				sleep .01;
			};
		};
	_veh = (_vehArray call BIS_fnc_selectRandomWeighted) createVehicle _roadPosition;
	_veh setDir (random 360);
	
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearItemCargoGlobal _veh;
		
	{
		_veh setHitPointDamage [_x, (random [.5, .8, 1])];
		sleep .01;
	} forEach ["HitEngine","HitFuel","HitHRotor","HitVRotor","HitHull","wheel_1_1_steering","wheel_1_2_steering","wheel_2_1_steering","wheel_2_2_steering","wheel_1_3_steering","wheel_2_3_steering","wheel_1_4_steering","wheel_2_4_steering"];
	
	_veh setFuel (random [0, .03, .05]);
	_veh setHitPointDamage ["HitL", 0]; // Ensure the left headlight is not damaged
	_veh setHitPointDamage ["HitR", 0]; // Ensure the right headlight is not damaged

	_veh setLightBrightness 10; // Set the brightness of the left headlight to maximum

	_veh setLightDayLight true; // Force the left headlight to be on during daylight
	
	};
	sleep .01;
};