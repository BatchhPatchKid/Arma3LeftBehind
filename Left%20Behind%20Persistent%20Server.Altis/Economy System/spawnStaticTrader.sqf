params ["_faction", "_trigger"];

if (isServer) then {
	
	_grpTrader = createGroup WEST;
	_trader = _grpTrader createUnit ["B_G_Survivor_F",(getPos _trigger),[],1,"NONE"];
	[_faction, _trader, false, true, false] execVM "AISpawners\aiSubScripts\equipAI.sqf";
	_trader disableAI "ANIM";
	sleep .5;
	removeBackpackGlobal _trader;
	sleep .5;

	[_trader] execVM "Economy System\economySystem.sqf";

	_wp1 = _grpTrader addWaypoint [(getPos _trigger), 0];
	_wp1 setWaypointType "HOLD";
	_grpTrader enableGunLights "ForceOn";



	_trader addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator"];
		if (isPlayer _killer) then {
			hintSilent parseText format ["<t size='1.25' color='#ff0000'> *ATTENTION*<br/><br/></t><t>Trader has been killed by %1. The trader's protection agency has been called...</t>", (name _killer)];
			{
				if (_x inArea [_killer, 100, 100, 0, false]) then {
					_x allowDamage true;
				};
			} forEach allPlayers;
			
			_units = nearestObjects [player, ["CAManBase"], 100];
			_aiUnits = [];
			
			{
				if (!isPlayer _x AND alive _x) then {
					_aiUnits pushBack _x;
				};
			} forEach _units;	
			
			if (count _aiUnits != 0) then {
				_grpBetray = _aiUnits joinSilent createGroup independent;
				_wp1 = _grpBetray addWaypoint [(getPos _killer), 0];
				_wp1 setWaypointType "MOVE";
			};
			
			_pos = [_killer, 200, 300, 5, 0, 20, 0,[],[]] call BIS_fnc_findSafePos;
			
			_unitSkillsArray = ["ROA", _pos] call compile preprocessFileLineNumbers "AISpawners\aiSubScripts\factionSideAndDifficulty.sqf";
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
			
			_grpAmbush = createGroup independent;
			for "_i" from 1 to (7 + round(random 7)) do {
				_newAI = _grpAmbush createUnit ["I_G_Survivor_F",([_pos, 0, 10, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos),[],1,"NONE"];
				["ROA", _newAI, false, true, _sfOverride] execVM "AISpawners\aiSubScripts\equipAI.sqf";
				
				[_newAI,_aim,_aimSpeed,_spot,_courage,_aimShake,_command,_spotDist,_reload] call FN_setSkill;
			};
			_wp1_ambush = _grpAmbush addWaypoint [(getPos _killer), 0];
			_wp1_ambush setWaypointType "MOVE";
		}
	}];
	
	while {true} do { //checking to see if all players have left the trader zone (if so, then exit loop)
		_playerInside = false;
		{
			if (_x inArea _trigger) then {
				_playerInside = true;
			};
			sleep .01;
		} forEach allPlayers;
		if (!_playerInside) then {
			deleteVehicle _trader;
			break;
		};
		sleep 5;
	};
};