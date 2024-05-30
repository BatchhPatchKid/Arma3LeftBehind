params ["_faction", "_numUnits", "_pos", "_typeOfLocationArea", "_side"];

if (_typeOfLocationArea == "Rnd" OR _typeOfLocationArea == "") then {
	_typeOfLocationArea = ["Patrol", .25, "Camp", .75, "Trucks", .15] call BIS_fnc_selectRandomWeighted;
};

execVM "ArrayDatabase.sqf";
_vehArray = ["defaultVeh"] call FN_arrayReturn;

// default
_buildingMain = "CamoNet_BLUFOR_open_F"; 
_turret = ["I_G_HMG_02_high_F", .80, "I_G_Mortar_01_F", .10, "I_E_Static_AT_F", .03];
_turretProb = .05;

_unitSkillsArray = [_faction, _pos] call compile preprocessFileLineNumbers "AISpawners\aiSubScripts\factionSideAndDifficulty.sqf";

if (isNil "_side") then { _side = _unitSkillsArray select 0; };
_unit = _unitSkillsArray select 1;
_aim = _unitSkillsArray select 2;
_aimSpeed = _unitSkillsArray select 3;
_spot = _unitSkillsArray select 4;
_courage = _unitSkillsArray select 5;
_aimShake = _unitSkillsArray select 6;
_command = _unitSkillsArray select 7;
_spotDist = _unitSkillsArray select 8;
_reload = _unitSkillsArray select 9;
_sfGroup = _unitSkillsArray select 10;

if (_side != WEST) then {
	switch (_faction) do {
		case "US": { [_pos, 2] execVM "AISpawners\lootSpawner.sqf"; }; 
		case "RU": { [_pos, 2] execVM "AISpawners\lootSpawner.sqf"; };
		case "TRB": { [_pos, 1] execVM "AISpawners\lootSpawner.sqf"; };
		case "PMC": { [_pos, 1] execVM "AISpawners\lootSpawner.sqf"; };
		case "ROA": { [_pos, 1] execVM "AISpawners\lootSpawner.sqf"; };
		case "ALF": { [_pos, 1] execVM "AISpawners\lootSpawner.sqf"; };
		default { [_pos, 0] execVM "AISpawners\lootSpawner.sqf"; };
	};
};

_newNumUnits = false;
if (_numUnits == 0) then { _newNumUnits = true };
_allUnits = _pos nearEntities ["Man", 500];
_players = _allUnits select {isPlayer _x};
_numPlayers = count _players;
_numUnits = _numUnits + _numPlayers;

	
if (_faction == "Bandit") then {
	if (_newNumUnits) then { _numUnits = _numUnits + round(random [6, 8, 10]); };
	_buildingMain = "CamoNet_BLUFOR_F";
};
if (_faction == "BB") then {
	if (_newNumUnits) then { _numUnits = _numUnits + round(random [6, 8, 10]); };
}; 
if (_faction == "DT") then {
	if (_newNumUnits) then { _numUnits = _numUnits + round(random [6, 10, 14]); };
	_buildingMain = "Land_cargo_addon02_V1_F";
};
if (_faction == "NH") then {
	if (_newNumUnits) then { _numUnits = _numUnits + round(random [6, 8, 10]); };
};
if (_faction == "PF") then {
	if (_newNumUnits) then { _numUnits = _numUnits + round(random [6, 10, 14]);	 };
	_buildingMain = "Land_cargo_addon02_V1_F";
};
if (_faction == "RC") then {
	if (_newNumUnits) then { _numUnits = _numUnits + round(random [6, 7, 8]); };
};
if (_faction == "TRB") then {
	_turretProb = .25;
	_buildingMain = "CamoNet_OPFOR_open_F";
	_vehArray = ["TRBVeh"] call FN_arrayReturn;
	if (_newNumUnits) then { _numUnits = _numUnits + round(random [6, 8, 10]); };
};
if (_faction == "US") then {
	_turretProb = .55;
	_turret = ["I_E_GMG_01_high_F", .55,"I_E_HMG_01_high_F", .75,"I_E_Static_AT_F", .35,"I_E_Mortar_01_F", .85];
	_buildingMain = "CamoNet_BLUFOR_open_F";
	_vehArray = ["USVeh"] call FN_arrayReturn;
	if (_newNumUnits) then { _numUnits = _numUnits + round(random [8, 12, 16]); };
};
if (_faction == "SU") then {
	if (_newNumUnits) then { _numUnits = _numUnits + round(random [6, 8, 10]); };
	_buildingMain = "CamoNet_BLUFOR_F";
};
if (_faction == "RU") then {
	_turretProb = .55;
	_turret = ["I_E_GMG_01_high_F", .55,"I_E_HMG_01_high_F", .75,"I_E_Static_AT_F", .15,"I_E_Mortar_01_F", .35];
	_buildingMain = "CamoNet_wdl_open_F";
	_vehArray = ["RUVeh"] call FN_arrayReturn;
	if (_newNumUnits) then { _numUnits = _numUnits + round(random [8, 12, 16]); };
};
if (_faction == "ROA") then {
	_turretProb = .35;
	_turret = ["I_E_GMG_01_high_F", .25,"I_E_HMG_01_high_F", .75,"I_E_Static_AT_F", .15,"I_E_Mortar_01_F", .35];
	_buildingMain = "CamoNet_INDP_F";
	_vehArray = ["ROAVeh"] call FN_arrayReturn;
	if (_newNumUnits) then { _numUnits = _numUnits + round(random [6, 8, 10]); };
};
if (_faction == "PMC") then {
	_turretProb = .35;
	_turret = ["I_E_GMG_01_high_F", .25,"I_E_HMG_01_high_F", .75,"I_E_Static_AT_F", .15,"I_E_Mortar_01_F", .35];
	_buildingMain = "CamoNet_INDP_open_F";
	_vehArray = ["PMCVeh"] call FN_arrayReturn;
	if (_newNumUnits) then { _numUnits = _numUnits + round(random [6, 8, 10]); };
};
if (_faction == "WO") then {
	_turretProb = .25;
	_vehArray = ["WOVeh"] call FN_arrayReturn;
	if (_newNumUnits) then { _numUnits = _numUnits + round(random [6, 8, 10]); };
	_buildingMain = "CamoNet_OPFOR_open_F";
};
if (_faction == "ALF") then {
	_turretProb = .35;
	_turret = ["I_E_GMG_01_high_F", .25,"I_E_HMG_01_high_F", .75,"I_E_Static_AT_F", .15,"I_E_Mortar_01_F", .35];
	_buildingMain = "CamoNet_OPFOR_open_F";
	_vehArray = ["ALFVeh"] call FN_arrayReturn;
	if (_newNumUnits) then { _numUnits = _numUnits + round(random [6, 8, 10]); };
};

FN_setWaypoints = {
	params ["_pos","_minDis","_maxDis","_grp"];
	_posWP = [_pos, _minDis, _maxDis, 3, 0, 20, 0] call BIS_fnc_findSafePos;
	_waypoint1 = _grp addWaypoint [_posWP, 2];
	_waypoint1 setWaypointType "MOVE";
	_waypoint1 setWaypointSpeed "FULL";
	_waypoint1 setWaypointBehaviour "AWARE";
	_posWP = [_pos, _minDis, _maxDis, 3, 0, 20, 0] call BIS_fnc_findSafePos;
	_waypoint2 = _grp addWaypoint [_posWP, 2];
	_waypoint2 setWaypointType "MOVE";
	_waypoint2 setWaypointSpeed "FULL";
	_waypoint2 setWaypointBehaviour "AWARE";
	_posWP = [_pos, _minDis, _maxDis, 3, 0, 20, 0] call BIS_fnc_findSafePos;
	_waypoint3 = _grp addWaypoint [_posWP, 2];
	_waypoint3 setWaypointType "CYCLE";
	_waypoint3 setWaypointSpeed "FULL";
	_waypoint3 setWaypointBehaviour "AWARE";
	_grp setCurrentWaypoint _waypoint1;
};

FN_setSkill = {
	params ["_newAI","_aim","_aimSpeed","_spot","_courage","_aimShake","_command","_spotDist","_reload"];
	_newAI setSkill ["aimingAccuracy", _aim];
	_newAI setSkill ["aimingSpeed", _aimSpeed];
	_newAI setSkill ["spotTime", _spot];
	_newAI setSkill ["courage", _courage];
	_newAI setSkill ["aimingShake", _aimShake];
	_newAI setSkill ["commanding", _command];
	_newAI setSkill ["spotDistance", _spotDist];
	_newAI setSkill ["reloadSpeed", _reload];
};

FN_carPatrol = {
	params["_vehArray","_numOfUnits"];
	if (round random [0, 2, 5] >= 2) then {
		_veh = (_vehArray call BIS_fnc_selectRandomWeighted) createVehicle ([_pos, 5, 50, 10, 0, 20, 0,[],[]] call BIS_fnc_findSafePos);
    
		clearWeaponCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		clearItemCargoGlobal _veh;
	
		_grpVeh = createGroup _side;
		
		_sfOverride = false;
		if (random _sfGroup < 1) then { _sfOverride = true; };
		
		for "_i" from 1 to _numOfUnits do {
			_newAI = _grpVeh createUnit [_unit,([_pos, 0, 10, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos),[],1,"NONE"];
			[_faction, _newAI, false, false, _sfOverride] execVM "AISpawners\aiSubScripts\equipAI.sqf";
			[_newAI,_aim,_aimSpeed,_spot,_courage,_aimShake,_command,_spotDist,_reload] call FN_setSkill;
			sleep .01;
		};
		
		{_x moveInAny _veh} forEach units _grpVeh;
	
		_veh setHitPointDamage ["HitL", 0]; // Ensure the left headlight is not damaged
		_veh setHitPointDamage ["HitR", 0]; // Ensure the right headlight is not damaged
		_veh setFuel (random [.03, .1, .3]);
		{
			_veh setHitPointDamage [_x, (random [.2, .45, .75])];
			sleep .01;
		} forEach ["hitengine","hithull","hitfuel","hitfueltank","hitengine1","hitglass1","hitglass10","hitglass3","hitlfwheel","hitlglass","hitlf2wheel","hitgear"];

		_veh setLightBrightness 10; // Set the brightness of the left headlight to maximum

		_veh setLightDayLight true; // Force the left headlight to be on during daylight
	
		// Create waypoints for the patrol
		[_pos,50,150,_grpVeh] call FN_setWaypoints;
	};
};
	
FN_spawnFortifications = {
	params ["_turret"];

	//_pos = player; //For debugging purposes 
	_turretPos = [_pos, 15, 40, 10, 0, 20, 0,[],[]] call BIS_fnc_findSafePos; 
	  
	_roundSandBag = createVehicle ["Land_BagFence_01_round_green_F", [0, 0, 0], [], 0, "CAN_COLLIDE"]; 
	_roundSandBag allowDamage false; 
	_roundSandBag setVectorDirAndUp [[0,1,0], (vectorUp _roundSandBag)]; 
	_roundSandBag setPosATL [_turretPos select 0, _turretPos select 1, 0]; 
	  
	_longBagLeft = createVehicle ["Land_BagFence_01_long_green_F", [0, 0, 0], [], 0, "CAN_COLLIDE"]; 
	_longBagLeft allowDamage false; 
	_longBagLeft setVectorDirAndUp [[-.923,-.336,0], (vectorUp _longBagLeft)]; 
	_longBagLeft setPosATL [(_turretPos select 0)-1.9, (_turretPos select 1)+1.8, 0];
	
	_longBagRight = createVehicle ["Land_BagFence_01_long_green_F", [0, 0, 0], [], 0, "CAN_COLLIDE"]; 
	_longBagRight allowDamage false; 
	_longBagRight setVectorDirAndUp [[-.897,.406,0], (vectorUp _longBagRight)]; 
	_longBagRight setPosATL [(_turretPos select 0)+1.9, (_turretPos select 1)+1.8, 0];
	
	_turretSelected = createVehicle [(_turret call BIS_fnc_selectRandomWeighted), [0, 0, 0], [], 0, "CAN_COLLIDE"]; 
	_turretSelected allowDamage false;
	_turretSelected setVectorDirAndUp [[0,-1,0], (vectorUp _turretSelected)]; 
	_turretSelected setPosATL [(_turretPos select 0), (_turretPos select 1)+2, 0];
	
	_grpTurret = createGroup _side;
	_grpTurret setBehaviour "SAFE";
	_newAI_Turret = _grpTurret createUnit [_unit,_pos,[],1,"NONE"];
	[_faction, _newAI_Turret, false, false, false] execVM "AISpawners\aiSubScripts\equipAI.sqf";
	[_newAI_Turret,_aim,_aimSpeed,_spot,_courage,_aimShake,_command,_spotDist,_reload] call FN_setSkill;
	_newAI_Turret moveInAny _turretSelected;
	
	_newAIBodyguard = _grpTurret createUnit [_unit,_pos,[],1,"NONE"];
	[_faction, _newAIBodyguard, false, true, false] execVM "AISpawners\aiSubScripts\equipAI.sqf";
	[_newAIBodyguard,_aim,_aimSpeed,_spot,_courage,_aimShake,_command,_spotDist,_reload] call FN_setSkill;
	_newAIBodyguard setVectorDirAndUp [[1,1,0], (vectorUp _newAIBodyguard)];  
	_newAIBodyguard setPosATL [(_turretPos select 0)+3, (_turretPos select 1)+2.5, 0];
};

FN_spawnGroups = {
	params ["_pos","_numUnits","_faction","_grp","_rndRandomAmountInGroup"];
	if (_rndRandomAmountInGroup == 0) then { _rndRandomAmountInGroup = round (random [2, 4, 6]); };
	
	_sfOverride = false;
	if (random _sfGroup < 1) then { _sfOverride = true; };
	
	for "_i" from 1 to _rndRandomAmountInGroup do {
		_aiUnits = allUnits select { _x isKindOf "CAManBase" && side _x != civilian && {_x distance (_pos) <= 100} };
		_numAI = _side countSide _aiUnits;
		if (_numAI >= _numUnits) exitWith {};
		_meleeChance = [_faction] call compile preprocessFileLineNumbers "AISpawners\aiSubScripts\meleeChance.sqf";
		if (random 1 > _meleeChance) then {
			_newAI = _grp createUnit [_unit,([_pos, 0, 10, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos),[],1,"NONE"];
			[_faction, _newAI, false, false, _sfOverride] execVM "AISpawners\aiSubScripts\equipAI.sqf";
			[_newAI,_aim,_aimSpeed,_spot,_courage,_aimShake,_command,_spotDist,_reload] call FN_setSkill;
		} else {
			_grpTemp = createGroup east;
			_newAI = _grpTemp createUnit ["O_soldier_Melee_RUSH",([_pos, 0, 10, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos),[],1,"NONE"];
			[_faction, _newAI, true, false, false] execVM "AISpawners\aiSubScripts\equipAI.sqf";
			[_newAI,_aim,_aimSpeed,_spot,_courage,_aimShake,_command,_spotDist,_reload] call FN_setSkill;
			[_newAI] joinSilent _grp;
		};
	};
};

[_faction, _buildingMain, _pos] execVM "AISpawners\aiSubScripts\spawnMainCamp.sqf";

if (_turretProb > random 1) then {
	[_turret] call FN_spawnFortifications;
};

if (_typeOfLocationArea == "Camp") then {

	//hint format ["Faction %1 | Unit %2 | # of Units %3 | Pos: %4", _faction, _unit, _numUnits, _pos];
	
	[_vehArray, 3] call FN_carPatrol;
	
	_grpCAMP = createGroup _side;
	[_pos,10,25,_grpCAMP] call FN_setWaypoints;
	[_pos,_numUnits,_faction,_grpCAMP,4] call FN_spawnGroups;
	_grpCAMP enableGunLights "ForceOn";

	_grp2 = createGroup _side;
	[_pos,20,40,_grp2] call FN_setWaypoints;
	[_pos,_numUnits,_faction,_grp2,0] call FN_spawnGroups;
	_grp2 enableGunLights "ForceOn";

	_grp3 = createGroup _side;
	[_pos,35,50,_grp3] call FN_setWaypoints;
	[_pos,_numUnits,_faction,_grp3,0] call FN_spawnGroups;
	_grp3 enableGunLights "ForceOn";
	
	_grp4 = createGroup _side;
	[_pos,20,30,_grp4] call FN_setWaypoints;
	[_pos,_numUnits,_faction,_grp4,_numUnits] call FN_spawnGroups;
	_grp4 enableGunLights "ForceOn";
};

if (_typeOfLocationArea == "Patrol") then {
	//hint format ["Faction %1 | Unit %2 | # of Units %3 | Pos: %4", _faction, _unit, _numUnits, _pos];

	[_vehArray, 3] call FN_carPatrol;
	
	_grpCAMP = createGroup _side;
	[_pos,10,25,_grpCAMP] call FN_setWaypoints;
	[_pos,_numUnits,_faction,_grpCAMP,4] call FN_spawnGroups;
	_grpCAMP enableGunLights "ForceOn";

	_grp1 = createGroup _side;
	[_pos,20,250,_grp1] call FN_setWaypoints;
	[_pos,_numUnits,_faction,_grp1,0] call FN_spawnGroups;
	_grp1 enableGunLights "ForceOn";

	_grp2 = createGroup _side;
	[_pos,20,200,_grp2] call FN_setWaypoints;
	[_pos,_numUnits,_faction,_grp2,0] call FN_spawnGroups;
	_grp2 enableGunLights "ForceOn";
	
	_grp3 = createGroup _side;
	[_pos,15,30,_grp3] call FN_setWaypoints;
	[_pos,_numUnits,_faction,_grp3,_numUnits] call FN_spawnGroups;
	_grp3 enableGunLights "ForceOn";
};

if (_typeOfLocationArea == "Trucks") then {
	_index = 0;
	
	_grpCAMP = createGroup _side;
	[_pos,10,25,_grpCAMP] call FN_setWaypoints;
	[_pos,_numUnits,_faction,_grpCAMP,4] call FN_spawnGroups;
	_grpCAMP enableGunLights "ForceOn";
	
	while {_index < (round (random 2)+2)} do {
		_index = _index + 1;
		[_vehArray, (round (random 3)+3)] call FN_carPatrol;
	};
};