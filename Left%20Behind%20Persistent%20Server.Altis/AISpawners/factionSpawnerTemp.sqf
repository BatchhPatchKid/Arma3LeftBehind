params ["_faction", "_numUnits", "_trigger"];
activate = true;
_triggerRadius = (triggerArea _trigger) select 0;

{ //checking to see if a player see if any players are too close to the spawn area of the trigger
	if ((getPos _x) distance (getPos _trigger) < (_triggerRadius - 50)) then { 
		activate = false;
		break;
	};
	sleep .01;
} forEach allPlayers;

// The crux of the spawn script is a rock. If this rock is present, then AI are NOT allowed to spawn. The garbage collector will clean it up, and when it does, the area is allowed to spawn more AI
if ((count nearestObjects [_trigger, ["Land_Cliff_stone_small_F"], 10] != 0) and isServer) then {
	activate = false;
} else {
	if (isServer) then {
		"Land_Cliff_stone_small_F" createVehicle (getPos _trigger);
	};
};

FN_huntingFaction = {
	params ["_pos", "_faction"];
	_posHuntingParty = "";
	_safePosFound = false;
	while {!_safePosFound} do { //trying to find a safe position 250 meters away from ever player
		_posHuntingParty = [_pos, 100, 500, 10, 0, 20, 0,[],[]] call BIS_fnc_findSafePos;
		_safePosFound = true;
		{
			if (_pos distance _x < 250) then {
				_safePosFound = false;
			};
			sleep .01;
		} forEach allPlayers;
	};
	
	_numOfHuntingParty = round (random [3, 5, 6]);
	
	_factionArray = ["Bandit", .75, "DT", .50, "NH", .50, "PF", .35, "ALF", .10, "WO", .10, "RC", .15, "TRB", .10, "US", .03, "RU", .03];
	_factionSelected = _factionArray call BIS_fnc_selectRandomWeighted;
	_factionGoAhead = false;
	while {!_factionGoAhead} do {
		if (_factionSelected != _faction) then { 
			_factionGoAhead = true; 
		} else {
			_factionSelected = _factionArray call BIS_fnc_selectRandomWeighted;
		};
		sleep .01;
	};
	_unitSkillsArray = [_factionSelected, _posHuntingParty] call compile preprocessFileLineNumbers "AISpawners\aiSubScripts\factionSideAndDifficulty.sqf";
	_side = _unitSkillsArray select 0;
	_unit = _unitSkillsArray select 1;
	if (_side == independent && _faction != "RU") then {
		_side = opfor;
		_unit = "O_G_Survivor_F";
	};
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
	
	_creepGroup = false;
	if ((random 1) > .25) then { //is the group crouching?
		_creepGroup = true;
	};
	_grp = createGroup _side;
	for "_i" from 1 to _numOfHuntingParty do {
		_newAI = _grp createUnit [_unit,([_posHuntingParty, 0, 10, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos),[],1,"NONE"];
		[_factionSelected, _newAI, false, false, _sfOverride] execVM "AISpawners\aiSubScripts\equipAI.sqf";
		[_newAI,_aim,_aimSpeed,_spot,_courage,_aimShake,_command,_spotDist,_reload] execVM "AISpawners\aiSubScripts\FN_setSkill.sqf";
		if (_creepGroup) then {
			_newAI setUnitPos "MIDDLE";
		};
		sleep .01;
	};
	
	_waypoint1 = _grp addWaypoint [_pos, 1];
	_waypoint1 setWaypointType "MOVE";
	_waypoint1 setWaypointSpeed "FULL";
	_waypoint1 setWaypointBehaviour "AWARE";
	
	_waypoint2 = _grp addWaypoint [_posHuntingParty, 2];
	_waypoint2 setWaypointType "CYCLE";
	_waypoint2 setWaypointSpeed "FULL";
	_waypoint2 setWaypointBehaviour "AWARE";
	_grp setCurrentWaypoint _waypoint1;
};

FN_wanderingFaction = {
	params ["_pos", "_sideOverride"];
	
	_posWanderingFaction = "";
	_safePosFound = false;
	while {!_safePosFound} do { //trying to find a safe position 250 meters away from ever player
		_posWanderingFaction = [_pos, 150, 500, 10, 0, 20, 0,[],[]] call BIS_fnc_findSafePos;
		_safePosFound = true;
		{
			if (_pos distance _x < 250) then {
				_safePosFound = false;
			};
			sleep .01;
		} forEach allPlayers;
	};
	
	_numOfWanderingFaction = round (random [3, 5, 8]);
	
	_factionArray = ["BB", .30, "SU", .40, "Bandit", .75, "DT", .50, "NH", .50, "PF", .35, "ALF", .10, "WO", .10, "RC", .15, "TRB", .10, "US", .03, "RU", .03];
	_factionSelected = _factionArray call BIS_fnc_selectRandomWeighted;
	_unitSkillsArray = [_factionSelected, _posWanderingFaction] call compile preprocessFileLineNumbers "AISpawners\aiSubScripts\factionSideAndDifficulty.sqf";
	_side = _unitSkillsArray select 0;
	_unit = _unitSkillsArray select 1;
	if (_side != WEST) then {
		switch (_sideOverride) do {
			case "independent": {
				_side = independent;
			};
			case "opfor": {
				_side = opfor;
				_unit = "O_G_Survivor_F";
			};
			default {
				_side = independent;
			};
		};
	};
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
	
	_creepGroup = false;
	if ((random 1) > .75) then { //is the group crouching?
		_creepGroup = true;
	};
	_grp = createGroup _side;
	for "_i" from 1 to _numOfWanderingFaction do {
		_newAI = _grp createUnit [_unit,([_posWanderingFaction, 0, 10, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos),[],1,"NONE"];
		[_factionSelected, _newAI, false, false, _sfOverride] execVM "AISpawners\aiSubScripts\equipAI.sqf";
		[_newAI,_aim,_aimSpeed,_spot,_courage,_aimShake,_command,_spotDist,_reload] execVM "AISpawners\aiSubScripts\FN_setSkill.sqf";
		if (_creepGroup) then {
			_newAI setUnitPos "MIDDLE";
		};
		sleep .01;
	};
	
	_posWP = [_pos, 200, 500, 10, 0, 20, 0] call BIS_fnc_findSafePos;
	_waypoint1 = _grp addWaypoint [_posWP, 1];
	_waypoint1 setWaypointType "MOVE";
	_waypoint1 setWaypointSpeed "FULL";
	_waypoint1 setWaypointBehaviour "AWARE";
	
	_posWP = [_pos, 200, 500, 10, 0, 20, 0] call BIS_fnc_findSafePos;
	_waypoint2 = _grp addWaypoint [_posWP, 2];
	_waypoint2 setWaypointType "MOVE";
	_waypoint2 setWaypointSpeed "FULL";
	_waypoint2 setWaypointBehaviour "AWARE";
	
	_posWP = [_pos, 200, 400, 10, 0, 20, 0] call BIS_fnc_findSafePos;
	_waypoint3 = _grp addWaypoint [_posWP, 3];
	_waypoint3 setWaypointType "CYCLE";
	_waypoint3 setWaypointSpeed "FULL";
	_waypoint3 setWaypointBehaviour "AWARE";
	
	_grp setCurrentWaypoint _waypoint1;
};

// Load bearing 'if' statement. If this does not activate, then the script does not activate
if (activate) then {
	_pos = getPos _trigger;
	
	//Spawning random vehicles
	if (isServer) then {
		[_pos, _triggerRadius] execVM "AISpawners\aiSubScripts\ambientVeh.sqf";
	};
	
	if (random 1 > .15) then {
		//Ambient Zombie Horde
		if (isServer) then {
			[_pos, 0, 50, (_triggerRadius-50), "spareZombies", _triggerRadius] execVM "AISpawners\mutantSpawners\ZTriggerSpawner.sqf";
		};
	};
	
	if (random 2 > .75) then {
		//Ambient Renegades
		if (isServer) then {
			for "_i" from 1 to (floor (random 3)) do {
				[([_pos, (_triggerRadius / 4), (_triggerRadius / 3), 3, 0, 20, 0, [], []] call BIS_fnc_findSafePos), 50, _triggerRadius] execVM "AISpawners\aiSubScripts\renegadeSpawner.sqf";
			};
		};
	};
	
	//Checking to see if location is random or predetermined
	if (_faction == "Rnd") then {
		
		// Selecting how many and what factions are at the location. It can either be mutants, zombies, or survivors
		
		//Selecting how many factions there are (80% chance for only 1)
		_numFactions = 1;
		_howManyFactions = random 1;
		if (_howManyFactions > .8 AND _howManyFactions < .95) then { // 2 faction
			_numFactions = 2;
		};
		if (_howManyFactions >= .95) then { // 3 faction
			_numFactions = 3;
		};
		
		_firstHumans = true; // this ensures the first humans to spawn in an area are put into the middle
		for "_i" from 1 to _numFactions do {
			_factionTypes = random 1;
			if (_factionTypes < .6) then { // Zombie
				if (isServer) then {
					_pos = [_pos, 20, 45, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos;
					["Zombie", _numUnits, _triggerRadius, _pos] execVM "AISpawners\aiSubScripts\factionSelector.sqf";
				};
				if ((random 1) > .80) then {
					if (isServer) then {
						[_pos, "independent"] call FN_wanderingFaction;
					};
				};
			};
			if (_factionTypes >= .6 AND _factionTypes <= .90) then { // Survivors
				if (isServer) then {
					if (!(_firstHumans)) then { //ensuring at least one faction is at the middle of the trigger area
						_safePosFound = false;
						while {!_safePosFound} do { //trying to find a safe position 300 meters away from ever player
							_pos = [_pos, 30, 100, 10, 0, 20, 0,[],[]] call BIS_fnc_findSafePos;
							_safePosFound = true;
							{
								if (_pos distance _x < 300) then {
									_safePosFound = false;
								};
							} forEach allPlayers;
						};
					} else {
						_firstHumans = false;
					};
					if ((random 1) > .75) then { //hunting party for the faction
						if (isServer) then {
							[_pos, _faction] call FN_huntingFaction;
						};
					};
					if ((random 1) > .80) then {
						if (isServer) then {
							[_pos, "opfor"] call FN_wanderingFaction;
						};
					};
					_factionArray = ["Bandit", .75, "BB", .25, "SU", .25, "DT", .50, "NH", .50, "PF", .35, "ALF", .10, "WO", .10, "RC", .15, "TRB", .10, "US", .03, "RU", .03, "PMC", .10, "ROA", .10];
					_factionSelected = _factionArray call BIS_fnc_selectRandomWeighted;
					[_factionSelected, _numUnits, _triggerRadius, _pos] execVM "AISpawners\aiSubScripts\factionSelector.sqf";
				};
			};
			if (_factionTypes > .90) then { // Mutants
				mutantArray = ["mutants",.35, "Skull", .25, "411", .15, "Abom", .05, "Mind", .15, "Rake", .10, "Shadow", .15, "Snatch", .20, "Tank", .005, "Vamp", .15, "Various", .005, "Wend", .25, "Bloater", .30, "Leaper", .35, "Screamer", .50];
				_factionSelected = mutantArray call BIS_fnc_selectRandomWeighted;
				_pos = [(getPos _trigger), 25, 75, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos;
				[_factionSelected, _numUnits, _triggerRadius, _pos] execVM "AISpawners\aiSubScripts\factionSelector.sqf";
				if ((random 1) > .80) then {
					if (isServer) then {
						[_pos, "independent"] call FN_wanderingFaction;
					};
				};
			};
			sleep .15;
		};
	} else { //Predetermined faction
		if ((random 1) > .75) then { //hunting party for the faction
			if (isServer) then {
				[_pos, _faction] call FN_huntingFaction;
			};
		};
		if ((random 1) > .80) then {
			if (isServer) then {
				if (_faction != "RU") then {
					[_pos, "opfor"] call FN_wanderingFaction;
				} else {
					[_pos, "independent"] call FN_wanderingFaction;
				};
			};
		};
		[_faction, _numUnits, _triggerRadius, _pos] execVM "AISpawners\aiSubScripts\factionSelector.sqf";
	};
};