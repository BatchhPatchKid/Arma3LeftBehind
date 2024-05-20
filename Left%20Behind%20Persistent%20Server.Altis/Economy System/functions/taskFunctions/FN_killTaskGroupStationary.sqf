params ["_container", "_caller", "_actionId"];
if (isNull (currentTask _caller)) then {
	hintSilent format ["The following group has had a bounty put on their leader. Eliminate them for a reward, %1", (name _caller)];
	_factionArray = ["Bandit", .50,"BB", .25,"SU", .25,"DT", .35,"NH", .35,"PF", .40,"ALF", .10,"WO", .10,"RC", .15,"TRB", .10,"US", .02,"RU", .02];
	_faction = _factionArray call BIS_fnc_selectRandomWeighted;
	_numUnits = ceil(random 7)+6;
	_minDist = 700;
	_maxDist = 2500;
	_pos = [getPos _caller, _minDist, _maxDist, 10, 0, 20, 0] call BIS_fnc_findSafePos;
	_posMarker = [_pos, 0, 300, 0, 0, 20, 0] call BIS_fnc_findSafePos;
	
	[_faction, _numUnits, _pos, "Camp", RESISTANCE] execVM "AISpawners\aiSubScripts\spawnAI.sqf";
	
	_flag = "Flag_Red_F" createVehicle _pos;
	
	_unitSkillsArray = [_faction, _pos] call compile preprocessFileLineNumbers "AISpawners\aiSubScripts\factionSideAndDifficulty.sqf";
	_side = RESISTANCE; // Must be hostile to the players no matter what
	_unit = _unitSkillsArray select 1;
	_aim = _unitSkillsArray select 2;
	_aimSpeed = _unitSkillsArray select 3;
	_spot = _unitSkillsArray select 4;
	_courage = _unitSkillsArray select 5;
	_aimShake = _unitSkillsArray select 6;
	_command = _unitSkillsArray select 7;
	_spotDist = _unitSkillsArray select 8;
	_reload = _unitSkillsArray select 9;

	_meleeChance = [_faction] call compile preprocessFileLineNumbers "AISpawners\aiSubScripts\meleeChance.sqf";

	_groupBandit = createGroup [_side, true];

	private ["_newAI"]; // instantiated so I don't get an error from it only being defined in 'if' statements

	_newAI = _groupBandit createUnit [_unit, _pos, [], 15, "NONE"];
	[_faction, _newAI, false, true] execVM "AISpawners\aiSubScripts\equipAI.sqf";
	_newAI setSkill ["aimingAccuracy", _aim];
	_newAI setSkill ["aimingSpeed", _aimSpeed];
	_newAI setSkill ["spotTime", _spot];
	_newAI setSkill ["courage", _courage];
	_newAI setSkill ["aimingShake", _aimShake];
	_newAI setSkill ["commanding", _command];
	_newAI setSkill ["spotDistance", _spotDist];
	_newAI setSkill ["reloadSpeed", _reload];
	
	_rndDouble = random 100;
	_rndTaskID = str (_rndDouble);

	[_caller, _rndTaskID, [format ["Eliminate the target to earn $120. The group is held up within 300 meters of the marker. It does not matter if you or someone else kills him, just make sure the job gets done. The faction the target is apart of is %1", _faction], "Eliminate the Stationary Target"], _posMarker, "ASSIGNED", 0, true, "kill", false] call BIS_fnc_taskCreate;
	sleep 5;
	while {true} do { // Checking to see if the task has been complete
		if ((isNull (currentTask _caller))) exitWith {
			deleteVehicle _flag;
		};
		if (not alive _newAI) exitWith {
			if (isNull _newAI) then {
				[_rndTaskID,"CANCELED"] call BIS_fnc_taskSetState; 
				[_rndTaskID, true] call BIS_fnc_deleteTask;
				hintSilent "We have lost the postion of the target. Thus, the contract has been canceled.";
				sleep 5;
				hintSilent "";
			} else {
				[_rndTaskID,"SUCCEEDED"] call BIS_fnc_taskSetState; 
				[_rndTaskID, true] call BIS_fnc_deleteTask;
				hintSilent "Task has been completed, receive your reward at the contractor's office";
				for "_i" from 1 to 120 do {
					if (_caller canAddItemToBackpack "rvg_money") then {
						_caller addItemToBackpack "rvg_money"; 
						hintSilent format ["All of the amount owed to you ($%2) has been put in your backpack, %1. Good work out there.", (name _caller), 120];
					} else {
						[_container, _caller, _actionId, "rvg_money", 1, (_moneyPayedBack-_i)+1] call FN_ammoBoxCheck;
						break;
					};
				};
				sleep 5;
				hintSilent "";
			};
		};
		if (not alive _caller) exitWith {
			[_rndTaskID,"CANCELED"] call BIS_fnc_taskSetState; 
			[_rndTaskID, true] call BIS_fnc_deleteTask;
			hintSilent "We have lost the postion of the target. Thus, the contract has been canceled.";
			sleep 5;
			hintSilent "";
		};
		sleep 5;
	};
	deleteVehicle _flag;
} else {
	hintSilent "Sorry, but it seems you already have a task assigned. Finish that one before accepting another.";
};