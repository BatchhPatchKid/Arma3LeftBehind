if (isServer) then {
	params ["_faction", "_trigger"];
	
	_meleeChance = [_faction] call compile preprocessFileLineNumbers "AISpawners\aiSubScripts\meleeChance.sqf";
	
	private _vehArray = ["I_C_Offroad_02_LMG_F",.1,
	"I_G_Offroad_01_armed_F",.1,
	"C_Van_01_fuel_F",.2,
	"C_Hatchback_01_F",.25,
	"C_Offroad_02_unarmed_F",.5,
	"C_Truck_02_box_F",.15,
	"C_Truck_02_transport_F",.35,
	"C_Truck_02_covered_F",.25,
	"C_Offroad_01_covered_F",.5,
	"C_Offroad_01_comms_F",.5,
	"C_Offroad_01_covered_F",.75,
	"C_Offroad_01_repair_F",.15,
	"C_Quadbike_01_F",.1,
	"C_SUV_01_F",.25,
	"C_Van_01_transport_F",.15,
	"C_Van_01_box_F",.10,
	"B_LSV_01_unarmed_F",.15];
	
	private _playersInTrigger = [];
	private _index = 0;
	private _minDist = 350;
	private _maxDist = 800;
	private _vehicleBoolean = false;
	
	while {true} do {
		_index = 0;
		private _players = allPlayers - entities "HeadlessClient_F";
		_playersInTrigger= [];
		
		{
			if (_x inArea _trigger) then { _index = _index + 1; _playersInTrigger = _playersInTrigger + [_x];};
			sleep .01;
		} forEach _players;
		
		if (_index == 0) then { break; };
		
		_playerSelected = selectRandom _playersInTrigger;
		
		_pos = [(getPos _playerSelected), _minDist, _maxDist, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos;
		
		sleep 1; //waiting for the player to have their faction update incase if it isnt already
		
		_unitSkillsArray = [_faction, _pos] call compile preprocessFileLineNumbers "AISpawners\aiSubScripts\factionSideAndDifficulty.sqf";

		_side = _unitSkillsArray select 0;
		_unit = _unitSkillsArray select 1;
		_aim = _unitSkillsArray select 2;
		_aimSpeed = _unitSkillsArray select 3;
		_spot = _unitSkillsArray select 4;
		_courage = _unitSkillsArray select 5;
		_aimShake = _unitSkillsArray select 6;
		_command = _unitSkillsArray select 7;
		_spotDist = _unitSkillsArray select 8;
		_reload = _unitSkillsArray select 9;
			
		_breakOut = false;
		while {!(_breakOut)} do {
			{
				if (_playerSelected distance _pos < _minDist) then { [getPos _playerSelected, _minDist, _maxDist, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos; } else { _breakOut = true; break; };
				sleep .01;
			} forEach allPlayers;
			sleep .01;
		};
		
		_vehicleBoolean = random 1 > 0.75;
			
		_grpAmbush = createGroup _side;
		
		_trader = false;

		if (_side == WEST) then {
			_trader = TRUE;
		};
			
		if (_vehicleBoolean) then {
			_vehSelection = _vehArray call BIS_fnc_selectRandomWeighted;
			 _veh = _vehSelection createVehicle ([_pos, 5, 15, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos);
			
			clearWeaponCargoGlobal _veh;
			clearMagazineCargoGlobal _veh;
			clearItemCargoGlobal _veh;
				
			_numUnits = ceil (random 2)+1;
			for "_i" from 0 to _numUnits do {
				_newAI = _grpAmbush createUnit [_unit,_pos,[],15,"NONE"];
				[_faction, _newAI, false, false] execVM "AISpawners\aiSubScripts\equipAI.sqf";
				_newAI setSkill ["aimingAccuracy", _aim];
				_newAI setSkill ["aimingSpeed", _aimSpeed];
				_newAI setSkill ["spotTime", _spot];
				_newAI setSkill ["courage", _courage];
				_newAI setSkill ["aimingShake", _aimShake];
				_newAI setSkill ["commanding", _command];
				_newAI setSkill ["spotDistance", _spotDist];
				_newAI setSkill ["reloadSpeed", _reload];
				_newAI moveInAny _veh;
				sleep .01;
			};
		} else {
			_numUnits = random [2, 3, 4];
			for "_i" from 0 to _numUnits do {
				if (random 1 > _meleeChance) then {
					_newAI = _grpAmbush createUnit [_unit,_pos,[],15,"NONE"];
					[_faction, _newAI, false, false] execVM "AISpawners\aiSubScripts\equipAI.sqf";
					_newAI setSkill ["aimingAccuracy", _aim];
					_newAI setSkill ["aimingSpeed", _aimSpeed];
					_newAI setSkill ["spotTime", _spot];
					_newAI setSkill ["courage", _courage];
					_newAI setSkill ["aimingShake", _aimShake];
					_newAI setSkill ["commanding", _command];
					_newAI setSkill ["spotDistance", _spotDist];
					_newAI setSkill ["reloadSpeed", _reload];		
					if (_trader AND (random 1 > .75)) then {
						[_newAI] execVM "Economy System\economySystem.sqf";
					};					
				} else {
					grpTemp = createGroup east;
					_newAI = grpTemp createUnit ["O_soldier_Melee_RUSH", _pos, [], 1, "NONE"];
					[_faction, _newAI, true, false] execVM "AISpawners\aiSubScripts\equipAI.sqf";
					[_newAI] joinSilent _grpAmbush;
					_newAI setSkill ["aimingAccuracy", _aim];
					_newAI setSkill ["aimingSpeed", _aimSpeed];
					_newAI setSkill ["spotTime", _spot];
					_newAI setSkill ["courage", _courage];
					_newAI setSkill ["aimingShake", _aimShake];
					_newAI setSkill ["commanding", _command];
					_newAI setSkill ["spotDistance", _spotDist];
					_newAI setSkill ["reloadSpeed", _reload];					
				};
				sleep .01;
			};
		};
			
		_pos = [getPos _playerSelected, _minDist-250, _maxDist-300, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos;
		_waypoint1 = _grpAmbush addWaypoint [_pos, 0];
		_waypoint1 setWaypointType "MOVE";
		_waypoint1 setWaypointSpeed "FULL";
		_waypoint1 setWaypointBehaviour "AWARE";
			
		_pos = [getPos _playerSelected, _minDist-250, _maxDist-300, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos;
		_waypoint1 = _grpAmbush addWaypoint [_pos, 1];
		_waypoint1 setWaypointType "MOVE";
		_waypoint1 setWaypointSpeed "FULL";
		_waypoint1 setWaypointBehaviour "AWARE";
		
		_pos = [getPos _playerSelected, _minDist-250, _maxDist-300, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos;
		_waypoint1 = _grpAmbush addWaypoint [_pos, 2];
		_waypoint1 setWaypointType "CYCLE";
		_waypoint1 setWaypointSpeed "FULL";
		_waypoint1 setWaypointBehaviour "AWARE";
			
		_grpAmbush enableGunLights "ForceOn";
	
		sleep (random 1800)+600;
		
		_index = 0;
		
		{
			if (_x inArea _trigger) then { _index = _index + 1;};
		} forEach _players;
		
		if (_index == 0) then { break; };
	
		sleep .01;
	};
};