params ["_faction", "_pos"];

_side = independent;
_unit = "I_G_Survivor_F";
_aim = 0;
_aimSpeed = 0;
_spot = 0;
_courage = 1;
_aimShake = 0;
_command = 0;
_spotDist = 0;
_reload = 0;
_sfGroup = 100;
_playersRelationArray = [];

_distForAllyToTakeEffect = 1500;

if (_faction == "Bandit") then {
	_aim = 0.3;
	_aimSpeed = 0.5;
	_spot = 0.4;
	_courage = 1;
	_aimShake = 0.4;
	_command = .9;
	_spotDist = 0.5;
	_reload = 0.6;
	_sfGroup = 50;
	{
		if (_x distance _pos < _distForAllyToTakeEffect) then {
			_relation = _x getVariable "Bandit_Relation";
			_playersRelationArray = _playersRelationArray + [_relation];
		};
		sleep .01;
	} forEach allPlayers;
	
	if (_playersRelationArray find true > -1) then {
		_unit = "B_G_Survivor_F";
		_side = west
	} else {
		_unit = "I_G_Survivor_F";
		_side = independent;
	};
};
if (_faction == "BB") then {
	_aim = 0.8;
	_aimSpeed = 0.8;
	_spot = 0.75;
	_courage = 1;
	_aimShake = 0.4;
	_command = 1;
	_spotDist = 0.5;
	_reload = 0.6;
	_sfGroup = 50;
	{
		if (_x distance _pos < _distForAllyToTakeEffect) then {
			_relation = _x getVariable "BB_Relation";
			_playersRelationArray = _playersRelationArray + [_relation];
		};
		sleep .01;
	} forEach allPlayers;
	
	if (_playersRelationArray find true > -1) then {
		_unit = "B_G_Survivor_F";
		_side = west
	} else {
		_unit = "I_G_Survivor_F";
		_side = independent;
	};
}; 
if (_faction == "DT") then {
	_aim = 0.2;
	_aimSpeed = 0.2;
	_spot = 0.4;
	_courage = 1;
	_aimShake = 0.2;
	_command = .75;
	_spotDist = 0.5;
	_reload = 0.4;
	_sfGroup = 50;
	{
		if (_x distance _pos < _distForAllyToTakeEffect) then {
			_relation = _x getVariable "DT_Relation";
			_playersRelationArray = _playersRelationArray + [_relation];
		};
		sleep .01;
	} forEach allPlayers;
	
	if (_playersRelationArray find true > -1) then {
		_unit = "B_G_Survivor_F";
		_side = west
	} else {
		_unit = "I_G_Survivor_F";
		_side = independent;
	};
};
if (_faction == "NH") then {
	_aim = 0.3;
	_aimSpeed = 0.5;
	_spot = 0.4;
	_courage = 1;
	_aimShake = 0.4;
	_command = .9;
	_spotDist = 0.5;
	_reload = 0.6;
	_sfGroup = 50;
	{
		if (_x distance _pos < _distForAllyToTakeEffect) then {
			_relation = _x getVariable "NH_Relation";
			_playersRelationArray = _playersRelationArray + [_relation];
		};
		sleep .01;
	} forEach allPlayers;
	
	if (_playersRelationArray find true > -1) then {
		_unit = "B_G_Survivor_F";
		_side = west
	} else {
		_unit = "I_G_Survivor_F";
		_side = independent;
	};
};
if (_faction == "PF") then {
	_aim = 0.2;
	_aimSpeed = 0.6;
	_spot = 0.4;
	_courage = 1;
	_aimShake = 0.4;
	_command = 1;
	_spotDist = 0.5;
	_reload = 0.6;
	_sfGroup = 35;
	{
		if (_x distance _pos < _distForAllyToTakeEffect) then {
			_relation = _x getVariable "PF_Relation";
			_playersRelationArray = _playersRelationArray + [_relation];
		};
		sleep .01;
	} forEach allPlayers;
	
	if (_playersRelationArray find true > -1) then {
		_unit = "B_G_Survivor_F";
		_side = west
	} else {
		_unit = "I_G_Survivor_F";
		_side = independent;
	};
};
if (_faction == "RC") then {
	_aim = 0.7;
	_aimSpeed = 0.7;
	_spot = 0.6;
	_courage = 1;
	_aimShake = 0.6;
	_command = .9;
	_spotDist = 0.5;
	_reload = 1;
	_sfGroup = 35;
	{
		if (_x distance _pos < _distForAllyToTakeEffect) then {
			_relation = _x getVariable "RC_Relation";
			_playersRelationArray = _playersRelationArray + [_relation];
		};
		sleep .01;
	} forEach allPlayers;
	
	if (_playersRelationArray find true > -1) then {
		_unit = "B_G_Survivor_F";
		_side = west
	} else {
		_unit = "I_G_Survivor_F";
		_side = independent;
	};
};
if (_faction == "TRB") then {
	_aim = 0.5;
	_aimSpeed = 0.5;
	_spot = 0.4;
	_courage = 1;
	_aimShake = 0.4;
	_command = .9;
	_spotDist = 0.5;
	_reload = 0.6;
	_sfGroup = 35;
	{
		if (_x distance _pos < _distForAllyToTakeEffect) then {
			_relation = _x getVariable "TRB_Relation";
			_playersRelationArray = _playersRelationArray + [_relation];
		};
		sleep .01;
	} forEach allPlayers;
	
	if (_playersRelationArray find true > -1) then {
		_unit = "B_G_Survivor_F";
		_side = west
	} else {
		_unit = "I_G_Survivor_F";
		_side = independent;
	};
};
if (_faction == "US") then {
	_aim = 0.9;
	_aimSpeed = 0.9;
	_spot = 0.9;
	_courage = 1;
	_aimShake = 0.9;
	_command = 0.9;
	_spotDist = 0.5;
	_reload = 0.75;
	_sfGroup = 10;
	{
		if (_x distance _pos < _distForAllyToTakeEffect) then {
			_relation = _x getVariable "US_Relation";
			_playersRelationArray = _playersRelationArray + [_relation];
		};
		sleep .01;
	} forEach allPlayers;
	
	if (_playersRelationArray find true > -1) then {
		_unit = "B_G_Survivor_F";
		_side = west
	} else {
		_unit = "I_G_Survivor_F";
		_side = independent;
	};
};
if (_faction == "SU") then {
	_aim = 0.8;
	_aimSpeed = 0.8;
	_spot = 0.75;
	_courage = 1;
	_aimShake = 0.4;
	_command = 1;
	_spotDist = 0.5;
	_reload = 0.6;
	_sfGroup = 40;
	{
		if (_x distance _pos < _distForAllyToTakeEffect) then {
			_relation = _x getVariable "SU_Relation";
			_playersRelationArray = _playersRelationArray + [_relation];
		};
		sleep .01;
	} forEach allPlayers;
	
	if (_playersRelationArray find true > -1) then {
		_unit = "B_G_Survivor_F";
		_side = west
	} else {
		_unit = "I_G_Survivor_F";
		_side = independent;
	};
};
if (_faction == "RU") then {
	_aim = 0.8;
	_aimSpeed = 0.8;
	_spot = 0.75;
	_courage = 1;
	_aimShake = 0.4;
	_command = 1;
	_spotDist = 0.5;
	_reload = 0.6;
	_sfGroup = 10;
	{
		if (_x distance _pos < _distForAllyToTakeEffect) then {
			_relation = _x getVariable "RU_Relation";
			_playersRelationArray = _playersRelationArray + [_relation];
		};
		sleep .01;
	} forEach allPlayers;
	
	if (_playersRelationArray find true > -1) then {
		_unit = "B_G_Survivor_F";
		_side = west
	} else {
		_unit = "O_G_Survivor_F";
		_side = east;
	};
};
if (_faction == "ROA") then {
	_aim = 0.95;
	_aimSpeed = 0.8;
	_spot = 0.75;
	_courage = 1;
	_aimShake = 0.4;
	_command = 1;
	_spotDist = 0.5;
	_reload = 0.6;
	_sfGroup = 20;
	{
		if (_x distance _pos < _distForAllyToTakeEffect) then {
			_relation = _x getVariable "ROA_Relation";
			_playersRelationArray = _playersRelationArray + [_relation];
		};
	} forEach allPlayers;
	
	if (_playersRelationArray find true > -1) then {
		_unit = "B_G_Survivor_F";
		_side = west
	} else {
		_unit = "I_G_Survivor_F";
		_side = independent;
	};
};
if (_faction == "PMC") then {
	_aim = 0.95;
	_aimSpeed = 0.8;
	_spot = 0.75;
	_courage = 1;
	_aimShake = 0.4;
	_command = 1;
	_spotDist = 0.5;
	_reload = 0.6;
	_sfGroup = 20;
	{
		if (_x distance _pos < _distForAllyToTakeEffect) then {
			_relation = _x getVariable "PMC_Relation";
			_playersRelationArray = _playersRelationArray + [_relation];
		};
		sleep .01;
	} forEach allPlayers;
	
	if (_playersRelationArray find true > -1) then {
		_unit = "B_G_Survivor_F";
		_side = west
	} else {
		_unit = "I_G_Survivor_F";
		_side = independent;
	};
};
if (_faction == "WO") then {
	_aim = 0.5;
	_aimSpeed = 0.5;
	_spot = 0.4;
	_courage = 1;
	_aimShake = 0.4;
	_command = .9;
	_spotDist = 0.5;
	_reload = 0.6;
	_sfGroup = 35;
	{
		if (_x distance _pos < _distForAllyToTakeEffect) then {
			_relation = _x getVariable "WO_Relation";
			_playersRelationArray = _playersRelationArray + [_relation];
		};
		sleep .01;
	} forEach allPlayers;
	
	if (_playersRelationArray find true > -1) then {
		_unit = "B_G_Survivor_F";
		_side = west
	} else {
		_unit = "I_G_Survivor_F";
		_side = independent;
	};
};
if (_faction == "ALF") then {
	_aim = 0.65;
	_aimSpeed = 0.5;
	_spot = 0.6;
	_courage = 1;
	_aimShake = 0.4;
	_command = .9;
	_spotDist = 0.5;
	_reload = 0.6;
	_sfGroup = 25;
	{
		if (_x distance _pos < _distForAllyToTakeEffect) then {
			_relation = _x getVariable "ALF_Relation";
			_playersRelationArray = _playersRelationArray + [_relation];
		};
		sleep .01;
	} forEach allPlayers;
	
	if (_playersRelationArray find true > -1) then {
		_unit = "B_G_Survivor_F";
		_side = west
	} else {
		_unit = "I_G_Survivor_F";
		_side = independent;
	};
};

[_side, _unit, _aim, _aimSpeed, _spot, _courage, _aimShake, _command, _spotDist, _reload, _sfGroup];