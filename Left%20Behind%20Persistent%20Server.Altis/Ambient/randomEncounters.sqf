private _factionArrayBanditCrazy = ["PF", .5,
"Bandit", .5,
"RC", .15,
"Renegade", .25];

private _factionArrayBanditNotCrazy = ["ALF", .10,
"WO", .15,
"DT", .55,
"NH", .55,
"RC", .25,
"TRB", 10];

execVM "ArrayDatabase.sqf";
sleep 5;

private _zedFast = ["fastZombie"] call FN_arrayReturn;

private _zombieTypesNATO = ["natoZombie"] call FN_arrayReturn;

private _heliArray = ["B_Heli_Light_01_dynamicLoadout_F", .20,
"B_Heli_Transport_03_unarmed_F", .35,
"B_Heli_Transport_01_F", .45,
"B_Plane_CAS_01_dynamicLoadout_F", .10,
"B_Plane_Fighter_01_F", .10];

private _ZedsSlow = ["slowZombie"] call FN_arrayReturn;

private _ZedsAmbush = ["slowZombie"] call FN_arrayReturn;

while {true} do {
	sleep 3;
	private _minDist = 350;
	private _maxDist = 600;
	
	private _sleepAmount = 1800 + floor(random (600 + count allPlayers));
	//_sleepAmount = 30; // for debugging
	sleep _sleepAmount;
	
	_rndEncounter = [1, 105] call BIS_fnc_randomInt;
	
	if (_rndEncounter < 15) then { //Bandit Ambush---------------------------------------------------------------------
		_faction = _factionArrayBanditCrazy call BIS_fnc_selectRandomWeighted;
		_meleeChance = [_faction] call compile preprocessFileLineNumbers "AISpawners\aiSubScripts\meleeChance.sqf";
		
		_pos = [getPos player, _minDist, _maxDist, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos;
		
		_unitSkillsArray = [_faction, _pos] call compile preprocessFileLineNumbers "AISpawners\aiSubScripts\factionSideAndDifficulty.sqf";

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
		
		_sfOverride = false;
		if (random _sfGroup < 1) then { _sfOverride = true; };
		
		_numUnits = random [6, 12, 14];
		
		_breakOut = false;
		while {!(_breakOut)} do {
			{
				if (_x distance _pos < _minDist) then { [getPos player, _minDist, _maxDist, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos; } else { _breakOut = true; break; };
			} forEach allPlayers;
		};
		_grpAmbush = createGroup independent;
		for "_i" from 0 to _numUnits do {
			if (random 1 > _meleeChance) then {
				_newAI = _grpAmbush createUnit ["I_G_Survivor_F",_pos,[],15,"NONE"];
				[_faction, _newAI, false, true, _sfOverride] execVM "AISpawners\aiSubScripts\equipAI.sqf";
				[_newAI,_aim,_aimSpeed,_spot,_courage,_aimShake,_command,_spotDist,_reload] execVM "AISpawners\aiSubScripts\FN_setSkill.sqf";
			} else {
				_grpTemp = createGroup east;
				_newAI = _grpTemp createUnit ["O_soldier_Melee_RUSH",([_pos, 0, 10, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos),[],1,"NONE"];
				[_faction, _newAI, true, false, false] execVM "AISpawners\aiSubScripts\equipAI.sqf";
				[_newAI,_aim,_aimSpeed,_spot,_courage,_aimShake,_command,_spotDist,_reload] execVM "AISpawners\aiSubScripts\FN_setSkill.sqf";
				[_newAI] joinSilent _grpAmbush;
			};
			sleep .01;
		};
		
		_waypoint1 = _grpAmbush addWaypoint [(getPos player), 0];
		_waypoint1 setWaypointType "MOVE";
		_waypoint1 setWaypointSpeed "FULL";
		_waypoint1 setWaypointBehaviour "AWARE";
		
		_grpAmbush enableGunLights "ForceOn";
		hint "Something feels off. Your instincts tell you to prepare for something...";
	};
	if (_rndEncounter < 30 && _rndEncounter >=15) then { //Zombie Ambush--------------------------------------------------------
		_minDist = 150;
		_maxDist = 200;
		_numUnits = round(random [12, 14, 16]);
		_pos = [getPos player, _minDist, _maxDist, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos;
		_breakOut = false;
		while {!(_breakOut)} do {
			{
				if (_x distance _pos < _minDist) then { [getPos player, _minDist, _maxDist, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos; } else { _breakOut = true; break; };
			} forEach allPlayers;
			sleep .01;
		};
		
		_grpAmbush = createGroup east;
		
		for "_i" from 0 to _numUnits do {
			_unit = _zedFast call BIS_fnc_selectRandomWeighted;
			_newAI = _grpAmbush createUnit [_unit,_pos,[],15,"NONE"];
			sleep .01;
		};
		
		sleep 8;

		_waypoint1 = _grpAmbush addWaypoint [(getPos player), 0];
		_waypoint1 setWaypointType "MOVE";			
		_waypoint1 setWaypointSpeed "FULL";
		_waypoint1 setWaypointBehaviour "AWARE";
			
			
		hint "Something feels off. Your instincts tell you to keep your eyes open for something dangerous...";
	};
	if (_rndEncounter < 35 && _rndEncounter >=30) then { //Zombie's fighting each other ----------------------------------
		_minDist = 300;
		_maxDist = 400;
		_numUnits = round(random [14, 18, 22]);
		_pos = [getPos player, _minDist-100, _maxDist-100, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos;
		_breakOut = false;
		while {!(_breakOut)} do {
		{
			if (_x distance _pos < _minDist-100) then { [getPos player, _minDist, _maxDist, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos; } else { _breakOut = true; break; };
		} forEach allPlayers;
		};
		_grpAmbush = createGroup independent;
		for "_i" from 0 to _numUnits do {
			_unit = _zedFast call BIS_fnc_selectRandomWeighted;
			_newAI = _grpAmbush createUnit [_unit,_pos,[],50,"NONE"];
			sleep .01;
		};
		hint "You hear odd screams off in the distance...";
	};
	if (_rndEncounter < 50 && _rndEncounter >=35) then { // Bandits fighting zombies ---------------------------------
		_faction = _factionArrayBanditNotCrazy call BIS_fnc_selectRandomWeighted;
		_numUnitsB = round(random [6, 10, 14]);
		_numUnits = round(random [14, 18, 22]);
		
		_posB = [getPos player, _minDist, _maxDist, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos;
		
		_breakOut = false;
		while {!(_breakOut)} do {
			{
				if (_x distance _posB < _minDist-100) then { _posB = [getPos player, _minDist, _maxDist, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos; } else { _breakOut = true; break; };
				sleep .01;
			} forEach allPlayers;
			sleep .01;
		};
		
		_posZ = [_posB, 50, 150, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos;
		
		_meleeChance = [_faction] call compile preprocessFileLineNumbers "AISpawners\aiSubScripts\meleeChance.sqf";
		
		_unitSkillsArray = [_faction, _posB] call compile preprocessFileLineNumbers "AISpawners\aiSubScripts\factionSideAndDifficulty.sqf";

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
		
		_sfOverride = false;
		if (random _sfGroup < 1) then { _sfOverride = true; };
		
		_grpAmbushB = createGroup independent;
		for "_i" from 0 to _numUnitsB do {
			if (random 1 > _meleeChance) then {
				_newAI = _grpAmbushB createUnit ["I_G_Survivor_F",_posB,[],15,"NONE"];
				[_faction, _newAI, false, true, _sfOverride] execVM "AISpawners\aiSubScripts\equipAI.sqf";
				[_newAI,_aim,_aimSpeed,_spot,_courage,_aimShake,_command,_spotDist,_reload] execVM "AISpawners\aiSubScripts\FN_setSkill.sqf";
			} else {
				_grpTemp = createGroup east;
				_newAI = _grpTemp createUnit ["O_soldier_Melee_RUSH",([_posB, 0, 10, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos),[],1,"NONE"];
				[_faction, _newAI, true, false, false] execVM "AISpawners\aiSubScripts\equipAI.sqf";
				[_newAI,_aim,_aimSpeed,_spot,_courage,_aimShake,_command,_spotDist,_reload] execVM "AISpawners\aiSubScripts\FN_setSkill.sqf";
				[_newAI] joinSilent _grpAmbushB;
			};
			sleep .01;
		};
		
		_grpAmbushB enableGunLights "ForceOn";
		
		_numUnitsZ = round (random [8, 12, 16]);
		
		_grpAmbushZ = createGroup east;
		
		for "_i" from 0 to _numUnits do {
			_unit = _zedFast call BIS_fnc_selectRandomWeighted;
			_newAI = _grpAmbushZ createUnit [_unit,_posZ,[],15,"NONE"];
			sleep .01;
		};
		
		sleep 8;

		_waypoint1 = _grpAmbushZ addWaypoint [_posB, 0];
		_waypoint1 setWaypointType "MOVE";			
		_waypoint1 setWaypointSpeed "FULL";
		_waypoint1 setWaypointBehaviour "AWARE";
		
		hint "You hear a lot of gunfire off in the distance. I wonder what could be happening...";
	};
	if (_rndEncounter < 60 && _rndEncounter >=50) then { // Bandits fighting other bandits ------------------------------
		_numUnitsB = round(random [6, 10, 12]);
		_numUnits2 = round(random [6, 10, 12]);
		_faction1 = _factionArrayBanditNotCrazy call BIS_fnc_selectRandomWeighted;
		_faction2 = _factionArrayBanditCrazy call BIS_fnc_selectRandomWeighted;
		
		_pos = [getPos player, _minDist, _maxDist, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos;
		_breakOut = false;
		while {!(_breakOut)} do {
			{
				if (_x distance _pos < _minDist) then { [getPos player, _minDist, _maxDist, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos; } else { _breakOut = true; break; };
				sleep .01;
			} forEach allPlayers;
			sleep .01;
		};
		
		_meleeChance = [_faction1] call compile preprocessFileLineNumbers "AISpawners\aiSubScripts\meleeChance.sqf";
		
		_unitSkillsArray = [_faction1, _pos] call compile preprocessFileLineNumbers "AISpawners\aiSubScripts\factionSideAndDifficulty.sqf";

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
		
		_sfOverride = false;
		if (random _sfGroup < 1) then { _sfOverride = true; };
		
		// First Group - Moving Group
		_grpAmbush = createGroup east;
		for "_i" from 0 to _numUnitsB do {
			if (random 1 > _meleeChance) then {
				_newAI = _grpAmbush createUnit ["I_G_Survivor_F",_pos,[],15,"NONE"];
				[_faction1, _newAI, false, true, _sfOverride] execVM "AISpawners\aiSubScripts\equipAI.sqf";
				[_newAI,_aim,_aimSpeed,_spot,_courage,_aimShake,_command,_spotDist,_reload] execVM "AISpawners\aiSubScripts\FN_setSkill.sqf";
			} else {
				_grpTemp = createGroup east;
				_newAI = _grpTemp createUnit ["O_soldier_Melee_RUSH",([_pos, 0, 10, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos),[],1,"NONE"];
				[_faction1, _newAI, true, false, false] execVM "AISpawners\aiSubScripts\equipAI.sqf";
				[_newAI,_aim,_aimSpeed,_spot,_courage,_aimShake,_command,_spotDist,_reload] execVM "AISpawners\aiSubScripts\FN_setSkill.sqf";
				[_newAI] joinSilent _grpAmbush;
			};
			sleep .01;
		};
		
		_meleeChance = [_faction2] call compile preprocessFileLineNumbers "AISpawners\aiSubScripts\meleeChance.sqf";
		
		_pos2 = [_pos, 150, 200, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos;
		
		_unitSkillsArray = [_faction2, _pos2] call compile preprocessFileLineNumbers "AISpawners\aiSubScripts\factionSideAndDifficulty.sqf";

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
		
		_sfOverride = false;
		if (random _sfGroup < 1) then { _sfOverride = true; };
		
		// Second Group - Stationary
		_grpAmbush2 = createGroup independent;
		for "_i" from 0 to _numUnits2 do {
			if (random 1 > _meleeChance) then {
				_newAI = _grpAmbush2 createUnit ["I_G_Survivor_F",_pos2,[],15,"NONE"];
				[_faction2, _newAI, false, true, _sfOverride] execVM "AISpawners\aiSubScripts\equipAI.sqf";
				[_newAI,_aim,_aimSpeed,_spot,_courage,_aimShake,_command,_spotDist,_reload] execVM "AISpawners\aiSubScripts\FN_setSkill.sqf";
			} else {
				_grpTemp = createGroup east;
				_newAI = _grpTemp createUnit ["O_soldier_Melee_RUSH",([_pos, 0, 10, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos),[],1,"NONE"];
				[_faction2, _newAI, true, false, false] execVM "AISpawners\aiSubScripts\equipAI.sqf";
				[_newAI,_aim,_aimSpeed,_spot,_courage,_aimShake,_command,_spotDist,_reload] execVM "AISpawners\aiSubScripts\FN_setSkill.sqf";
				[_newAI] joinSilent _grpAmbush;
			};
			sleep .01;
		};
		
		_waypoint1 = _grpAmbush addWaypoint [_pos2, 0];
		_waypoint1 setWaypointType "MOVE";
		_waypoint1 setWaypointSpeed "FULL";
		_waypoint1 setWaypointBehaviour "AWARE";
		
		_grpAmbush enableGunLights "ForceOn";
		_grpAmbush2 enableGunLights "ForceOn";
		hint "You hear a lot of gunfire off in the distance. I wonder what could be happening...";
	};
	if (_rndEncounter < 80 && _rndEncounter >=70) then { // Heli/Plane Crash -----------------------------------------------
		
		_pos = [getPos player, _minDist, _maxDist, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos;
		_breakOut = false;
		while {!(_breakOut)} do {
			{
				if (_x distance _pos < _minDist) then { [getPos player, _minDist, _maxDist, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos; } else { _breakOut = true; break; };
				sleep .01;
			} forEach allPlayers;
			sleep .01;
		};
		
		_heli = (_heliArray call BIS_fnc_selectRandomWeighted) createVehicle _pos;
		_heli setDamage 1;
		
		sleep 3;
		
		[_pos, 2] execVM "AISpawners\lootSpawner.sqf";
		
		//Bandits, Zombies, or Mutants?
		
		_rndNumCR = random 18;
		
		if (_rndNumCR <= 10) then {
			_grpAmbush = createGroup east;
			_numUnitsZ = round (random [15, 18, 21]);
			for "_i" from 0 to _numUnitsZ do {
				_unit = _zombieTypesNATO call BIS_fnc_selectRandomWeighted;
				_newAI = _grpAmbush createUnit [_unit,_pos,[],50,"NONE"];
				sleep .01;
			};
		};
		
		if (_rndNumCR >= 10) then {
			_grpAmbush = createGroup independent;
			_faction = _factionArrayBanditNotCrazy call BIS_fnc_selectRandomWeighted;
			_meleeChance = [_faction] call compile preprocessFileLineNumbers "AISpawners\aiSubScripts\meleeChance.sqf";
			
			_posB = [_pos, 200, 300, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos;
			
			_unitSkillsArray = [_faction, _posB] call compile preprocessFileLineNumbers "AISpawners\aiSubScripts\factionSideAndDifficulty.sqf";

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
			
			_sfOverride = false;
			if (random _sfGroup < 1) then { _sfOverride = true; };
			
			_numUnits = round (random [10, 14, 18]);
			
			for "_i" from 0 to _numUnits do {
				if (random 1 > _meleeChance) then {
					_newAI = _grpAmbush createUnit ["I_G_Survivor_F",_posB,[],15,"NONE"];
					[_faction, _newAI, false, true, _sfOverride] execVM "AISpawners\aiSubScripts\equipAI.sqf";
					[_newAI,_aim,_aimSpeed,_spot,_courage,_aimShake,_command,_spotDist,_reload] execVM "AISpawners\aiSubScripts\FN_setSkill.sqf";
				} else {
					_grpTemp = createGroup east;
					_newAI = _grpTemp createUnit ["O_soldier_Melee_RUSH",([_pos, 0, 10, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos),[],1,"NONE"];
					[_faction, _newAI, true, false, false] execVM "AISpawners\aiSubScripts\equipAI.sqf";
					[_newAI,_aim,_aimSpeed,_spot,_courage,_aimShake,_command,_spotDist,_reload] execVM "AISpawners\aiSubScripts\FN_setSkill.sqf";
					[_newAI] joinSilent _grpAmbush;
				};	
				sleep .01;
			};
		
			_waypoint1 = _grpAmbush addWaypoint [_pos, 0];
			_waypoint1 setWaypointType "MOVE";
			_waypoint1 setWaypointSpeed "FULL";
			_waypoint1 setWaypointBehaviour "AWARE";
		
			_grpAmbush enableGunLights "ForceOn";
		};
		
		hint "You hear a large explosion off in the distance. I wonder what that could be...";
		
	};
	if (_rndEncounter < 82 && _rndEncounter >=80) then { // Tank vs smasher -------------------------------------------
		_pos = [getPos player, _minDist, _maxDist, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos;
		_breakOut = false;
		while {!(_breakOut)} do {
			{
				if (_x distance _pos < _minDist) then { [getPos player, _minDist, _maxDist, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos; } else { _breakOut = true; break; };
				sleep .01;
			} forEach allPlayers;
			sleep .01;
		};
		
		//spawning tank
		_tank = "B_MBT_01_TUSK_F" createVehicle _pos;
		_tankGrp = createGroup independent;
		_unit1 = _tankGrp createUnit ["I_crew_F", _tank, [], 10, "CARGO"];
		["US", _unit1, false, true] execVM "AISpawners\aiSubScripts\equipAI.sqf";
		_unit2 = _tankGrp createUnit ["I_crew_F", _tank, [], 10, "CARGO"];
		["US", _unit2, false, true] execVM "AISpawners\aiSubScripts\equipAI.sqf";
		_unit3 = _tankGrp createUnit ["I_crew_F", _tank, [], 10, "CARGO"];
		["US", _unit3, false, true] execVM "AISpawners\aiSubScripts\equipAI.sqf";
		
		{_x moveInAny _tank} forEach units _tankGrp;
		
		clearWeaponCargoGlobal _tank;
		clearMagazineCargoGlobal _tank;
		clearItemCargoGlobal _tank;
		
		_posS = [_pos, 300, 400, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos;
		_waypoint1 = _tankGrp addWaypoint [_posS, 0];
		_waypoint1 setWaypointType "MOVE";
		_waypoint1 setWaypointSpeed "FULL";
		_waypoint1 setWaypointBehaviour "AWARE";
		
		//spawning smasher
		
		_smasherGrp = createGroup east;
		_smasher = _smasherGrp createUnit ["WBK_SpecialZombie_Smasher_3", _posS, [], 0, "NONE"];
		sleep 10;
		_waypoint1 = _smasherGrp addWaypoint [_pos, 0];
		_waypoint1 setWaypointType "MOVE";
		_waypoint1 setWaypointSpeed "FULL";
		_waypoint1 setWaypointBehaviour "AWARE";
		
		[4] spawn BIS_fnc_earthquake;
		
		hint "You hear huge explosions off in the distance followed by roars. I wonder what could be happening...";
		
		sleep 25; 
		
		_tank setDamage 1;
	};
	if (_rndEncounter < 90 && _rndEncounter >=82) then { // Being Hunted by a sniper ---------------------------
		_pos = [getPos player, _minDist, _maxDist, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos;
		_breakOut = false;
		while {!(_breakOut)} do {
			{
				if (_x distance _pos < _minDist) then { [getPos player, _minDist, _maxDist, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos; } else { _breakOut = true; break; };
				sleep .01;
			} forEach allPlayers;
			sleep .01;
		};
		
		_sniperGrp = createGroup east;
		_newAI = _sniperGrp createUnit ["O_G_Survivor_F",_pos,[],15,"NONE"];
		
		_newAI addGoggles (selectRandom ["G_Balaclava_oli","G_Balaclava_TI_blk_F","G_Balaclava_TI_G_blk_F","G_Balaclava_TI_tna_F","G_Balaclava_TI_G_tna_F","G_Balaclava_blk","G_Balaclava_lowprofile"]);
		_newAI addUniform (selectRandom ["U_I_FullGhillie_ard","U_O_FullGhillie_ard","U_B_FullGhillie_ard","U_O_T_FullGhillie_tna_F","U_B_T_FullGhillie_tna_F","U_I_FullGhillie_lsh","U_O_FullGhillie_lsh","U_B_FullGhillie_lsh","U_I_FullGhillie_sard","U_O_FullGhillie_sard","U_B_FullGhillie_sard"]);
		_newAI addVest (selectRandom ["V_SmershVest_01_radio_F","V_SmershVest_01_F"]);
		_rifle = selectRandom (["rhs_weap_t5000","rhs_weap_svds_npz","srifle_DMR_04_Tan_F","srifle_GM6_camo_F","rhs_weap_M107_w","rhs_weap_m14_wd","srifle_LRR_camo_F","rhs_weap_XM2010_sa","rhs_weap_m24sws_wd","rhs_weap_m40a5_wd","rhs_weap_sr25_ec_wd","rhs_weap_svdp_wd_npz"]);
		_scope = selectRandom (["optic_DMS","optic_DMS_weathered_Kir_F","optic_DMS_ghex_F","optic_DMS_weathered_F","optic_MRCO","ACE_optic_MRCO_2D","optic_KHS_hex","optic_KHS_old","optic_KHS_tan","optic_Hamr","optic_KHS_blk","ACE_optic_Hamr_2D","optic_Hamr_khk_F","ACE_optic_Hamr_PIP","optic_SOS","optic_SOS_khk_F","ACE_optic_SOS_PIP","optic_NVS","optic_AMS","rhsusf_acc_ACOG_RMR","optic_LRPS","rhsusf_acc_nxs_3515x50f1_md_sun","rhsusf_acc_nxs_5522x56_md_sun","rhsusf_acc_LEUPOLDMK4_2_mrds","rhsusf_acc_premier_low","rhsusf_acc_M8541_low","rhsusf_acc_ACOG3","rhsusf_acc_ACOG_USMC"]);
		
		if (round (random 10) == 5) then { _newAI linkItem "ACE_NVG_Gen1"; };
		
		[_newAI, _rifle, 5] call BIS_fnc_addWeapon;
		_newAI addPrimaryWeaponItem _scope;
		
		_aim = 1;
		_aimSpeed = 1;
		_spot = 1;
		_courage = 1;
		_aimShake = 1;
		_command = 1;
		_spotDist = 1;
		_reload = 1;
		
		_newAI setSkill ["aimingAccuracy", _aim];
		_newAI setSkill ["aimingSpeed", _aimSpeed];
		_newAI setSkill ["spotTime", _spot];
		_newAI setSkill ["courage", _courage];
		_newAI setSkill ["aimingShake", _aimShake];
		_newAI setSkill ["commanding", _command];
		_newAI setSkill ["spotDistance", _spotDist];
		_newAI setSkill ["reloadSpeed", _reload];
			
		_waypoint1 = _sniperGrp addWaypoint [(getPos player), 0];
		_waypoint1 setWaypointType "MOVE";
		_waypoint1 setWaypointSpeed "FULL";
		_waypoint1 setWaypointBehaviour "COMBAT";
		
		_newAI setUnitPos "MIDDLE";
		
		hint "Something feels off. Your instincts tell you to prepare for something...";
	};
	if (_rndEncounter < 95 && _rndEncounter >=90) then { // Randomly Teleported ----------------------------------------------
		hint "You feel a monstrous presence nearby. Your instincts tell you to prepare for something…";
		
		sleep 5;
		
		_wandGrp = createGroup civilian;
		_wanderer = _wandGrp createUnit ["C_man_p_beggar_F", (getPos player), [], 20, "NONE"];
		_wanderer allowDamage false;
		
		 PBright = 1;
		PCon = 1;
		PRGB = 1;
		PColor = 0;
		PBrightC = 0.5;
		PConC = 0.6;
		PR = 0.3;
		PColorC = 0.01;

		while {((PBright > PBrightC) or (PColor < PColorC) or (PCon > PConC) or (PRGB > PR))} do {
			"ColorInversion" ppEffectAdjust [PColor, PColor, PColor];
			"ColorInversion" ppEffectEnable TRUE;
			"ColorInversion" ppEffectCommit 0;
			if (PColor < PColorC) then {
				PColor = PColor + 0.01;
			};

			"colorCorrections" ppEffectAdjust [PBright, PCon, 0, [0.95, 0, 0, 0], [0.95, PRGB, PRGB, 0.5], [0.95, PRGB, PRGB, 1]];
			"colorCorrections" ppEffectEnable TRUE;
			"colorCorrections" ppEffectCommit 0;
			if (PBright > PBrightC) then {
				PBright = PBright - 0.0125;
			};
			if (PCon > PConC) then {
				PCon = PCon - 0.00625;
			};
			if (PRGB > PR) then {
				PRGB = PRGB - 0.05;
			};

			sleep 0.001;
		};
		
		sleep 5;
		deleteVehicle _wanderer;
		deleteGroup _wandGrp;
		
		sleep 5;
		
		player setPos ([getPos player, _minDist+300, _maxDist+500, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos);
		
		"colorCorrections" ppEffectAdjust [1, .8, 0, [0.0, 0.0, 0.0, 0.0], [.80, .75, .75, .4],  [0.2, 0.5, 0.5, 0.0]];
		"colorCorrections" ppEffectEnable true;
		"colorCorrections" ppEffectCommit 0;
		
		sleep 2;
		
		_wandGrp = createGroup east;
		
		for "_i" from 0 to 10 do {
			_wanderer = _wandGrp createUnit [(_ZedsSlow call BIS_fnc_selectRandomWeighted), (getPos player), [], 50, "NONE"];
			sleep .01;
		};
		
	};
	if (_rndEncounter < 100 && _rndEncounter >=95) then { // Tons of zombies spawn around the player -------------------
		hint "The ground shakes with a horrid smell coming from underneath. Your instincts tell you to run...";
		[1] spawn BIS_fnc_earthquake;
		
		sleep 5;
		
		_wandGrp = createGroup east;
		
		for "_i" from 0 to 20 do {
			_wanderer = _wandGrp createUnit [(selectRandom _ZedsAmbush), (getPos player), [], 50, "NONE"];
			sleep .01;
		};
		hintSilent "";
	};
	if (_rndEncounter < 105 && _rndEncounter >=100) then { // Tons of people spawn around the player only to be deleted -------------------
		hint "You feel a monstrous presence nearby. Your instincts tell you to prepare for something…";
		
		sleep 5;
		
		PBright = 1;
		PCon = 1;
		PRGB = 1;
		PColor = 0;
		PBrightC = 0.5;
		PConC = 0.6;
		PR = 0.3;
		PColorC = 0.01;

		while {((PBright > PBrightC) or (PColor < PColorC) or (PCon > PConC) or (PRGB > PR))} do {
        "ColorInversion" ppEffectAdjust [PColor, PColor, PColor];
        "ColorInversion" ppEffectEnable TRUE;
        "ColorInversion" ppEffectCommit 0;
        if (PColor < PColorC) then {
            PColor = PColor + 0.01;
        };

        "colorCorrections" ppEffectAdjust [PBright, PCon, 0, [0.95, 0, 0, 0], [0.95, PRGB, PRGB, 0.5], [0.95, PRGB, PRGB, 1]];
        "colorCorrections" ppEffectEnable TRUE;
        "colorCorrections" ppEffectCommit 0;
        if (PBright > PBrightC) then {
            PBright = PBright - 0.0125;
        };
        if (PCon > PConC) then {
            PCon = PCon - 0.00625;
        };
        if (PRGB > PR) then {
            PRGB = PRGB - 0.05;
        };

        sleep 0.001;
		};
		
		_wandGrp = createGroup civilian;
		
		for "_i" from 0 to 30 do {
			_wanderer = _wandGrp createUnit ["C_man_p_beggar_F", (getPos player), [], 50, "NONE"];
			_wanderer allowDamage false;
			sleep .01;
		};
		
		sleep 3;
		
		{ 
			deleteVehicle _x;
			sleep .01;
		} forEach units _wandGrp;
		
		"colorCorrections" ppEffectAdjust [1, .8, 0, [0.0, 0.0, 0.0, 0.0], [.80, .75, .75, .4],  [0.2, 0.5, 0.5, 0.0]];
		"colorCorrections" ppEffectEnable true;
		"colorCorrections" ppEffectCommit 0;
		hintSilent "";
		
	};
};