// Initial variable declarations

execVM "ArrayDatabase.sqf";

radExposure = 0;
private _cbrnSUITS = ["cbrnSuits"] call FN_arrayReturn;
private _gasMasks = ["gasMasks"] call FN_arrayReturn;
private _playerCBRN = 1; // lower is better
private _playerGasMask = 1; // lower is better
private _radRain = 0; // higher is better
private _isUnderRoof = false; // in-building eliminates rad rain affects
private _radObjects = [""];
private _radMultiplier = 0;
private _radWater = 0;
player setVariable ["Rad", 0, true];

FN_radiation = {
	_handle = 0 spawn {
		_itemsPlayer = itemsWithMagazines player;
		if ("rvg_Geiger" in _itemsPlayer) then {
			player setVariable ["Rad", radExposure, true];
			if (radExposure > 50) then {
				hintSilent parseText format["<t color='#ff0000' size='1.2'>Rad Exposure: %1</t>",radExposure];
			} else {
				hintSilent parseText format["<t color='#ffffff' size='1'>Rad Exposure: %1</t>",radExposure];
			};
		} else {
			hintSilent parseText format["<t color='#ffffff' size='1.2'>Geiger Counter Required to Check</t>"];
		};
		sleep 3;
		hintSilent "";
	};
};

getCalculatedRadExposure = {
    params ["_radMultiplier","_radRain","_radWater"];
	
	// Getting uniform of player to decrease the cold if cold weather gear is being worn or increase the cold if hot weather clothing is being worn
    playerUniform = uniform player;
    if (playerUniform in _cbrnSUITS) then { _playerCBRN = 0.3 };
    
	playerGasMask = goggles player;
	if (playerGasMask in _gasMasks) then { _playerGasMask = .75 };
	
	if (_playerGasMask < 1 AND _playerCBRN < 1) then {
		_playerCBRN = .05;
		_playerGasMask = .2;
	};
	
	
	_radsTaken = ((.25*_radMultiplier) + _radRain + _radWater)*(_playerGasMask*_playerCBRN);
	radExposure = radExposure + _radsTaken;
	
	_itemsPlayer = itemsWithMagazines player;
	
	if ("rvg_Geiger" in _itemsPlayer) then {
	
		if (_radsTaken > 1) then {
			playSound3D [getMissionPath "sounds\rvg_geiger_3.ogg", player, false, getPosASL player, 5, 1, 30];
		};
		if (_radsTaken > .5 && _radsTaken <= 1) then {
			playSound3D [getMissionPath "sounds\rvg_geiger_0.ogg", player, false, getPosASL player, 4, 1, 30];
		};
		if (_radsTaken > .1 && _radsTaken <= .5) then {
			playSound3D [getMissionPath "sounds\rvg_geiger_2.ogg", player, false, getPosASL player, 3, 1, 30];
		};
		if (_radsTaken > .05 && _radsTaken <= .1) then {
			playSound3D [getMissionPath "sounds\rvg_geiger_1.ogg", player, false, getPosASL player, 1, 1, 30];
		};
		
		if (radExposure > 90) then {
			if (radExposure > 100) then { player setDamage 1; };
			addCamShake [0.5, 1, 10];
			if (radExposure > 95) then {
				[format ["<t color='#ff0000' size='.5'>RAD EXPOSURE TOO GREAT, DEATH IS IMMINENT<br/>Rads Taken: %1<br/>Total Rads: %2</t>",_radsTaken,radExposure], .8, 1, 1, .3, 0, 789] spawn BIS_fnc_dynamicText;
			} else {
				[format ["<t color='#ff0000' size='.5'>DANGEROUSLY HIGH RAD EXPOSURE<br/>Rads Taken: %1<br/>Total Rads: %2</t>",_radsTaken,radExposure], .8, 1, 1, .3, 0, 789] spawn BIS_fnc_dynamicText;
			};

			if ((random 10) == 1) then {
				[player, true, 15] call ace_medical_fnc_setUnconscious;
			};
		};
	} else {
		if (radExposure > 100) then { player setDamage 1; };
		

		if (radExposure > 90) then {
			["<t color='#ff0000' size='.5'>You're body feels like it's being cooked alive</t>", .8, 1, 1, .3, 0, 789] spawn BIS_fnc_dynamicText;
			addCamShake [0.5, 1, 10];
			if ((random 10) == 1) then {
				[player, true, 15] call ace_medical_fnc_setUnconscious;
			};
		};
	};
	//hint format ["Rad Exposure: %1, Wearing CBRN: %2, Wearing Mask: %3, Rain: %4, In Buidling: %5, Rad Multiplier: %6", radExposure,_playerCBRN,_playerGasMask,_radRain,isInBuilding,_radMultiplier];
	_radMultiplier = 0;
	radExposure;
};

getUnderBuildingStatus = {
	
	//	GET NEAREST BUILDING
	_nbuilding = nearestObjects [player, ["house"], 10];
	
	{
		if ((typeOf _x isEqualTo "Campfire_burning_F") or (typeOf _x isEqualTo "FirePlace_burning_F") or (typeOf _x isEqualTo "MetalBarrel_burning_F")) then {
			_nbuilding = _nbuilding - [_x];
		};
		sleep .01;
	} forEach _nbuilding;
	
	if (count _nbuilding > 0) then {true;} else {false;};
	
};

getRainRads = {
	if (rain > .9) then { _radRain = 0.30; };
	if (rain > .7 && rain <= .9) then { _radRain = 0.25; };
	if (rain > .5 && rain <= .7) then { _radRain = 0.20; };
	if (rain > .3 && rain <= .7) then { _radRain = 0.15; };
	if (rain > .15 && rain <= .3) then { _radRain = 0.10; };
	if (rain > 0.1 && rain <= 0.15) then { _radRain = 0.05; };
	_radRain;
};

while {true} do {
    while {alive player} do {
		_index = 0;
		_radMultiplier = 1;
		_radObjects = nearestObjects [player, ["Land_AncientStatue_02_F", "Land_AncientStatue_01_F", "Land_PalmTotem_01_F", "Land_PalmTotem_02_F", "DSA_Idol2", "DSA_Idol"], 500];
		{
			if (player distance _x < 500) then {
				_radMultiplier = _radMultiplier + (500 - (player distance _x));
			};
			sleep .01;
		} forEach _radObjects;
		
		if (count _radObjects > 0) then {
			_index = _index + 1;
			_radMultiplier = _radMultiplier/100;
		} else { _radMultiplier = 1; };
		
		_isUnderRoof = call getUnderBuildingStatus;
		if (rain < .1) then {
			_radRain = 0;
		} else {
			if (!(_isUnderRoof)) then {
				_radRain = call getRainRads;
				_index = _index + 1;
			};
		};
		
		if (surfaceIsWater getPos player && isNull objectParent player) then { // Checking to see if the player is in water and not in a boat
            _radWater = 3; _index = _index + 1;
		} else { _radWater = 0; };
		
		//hint format["Rad Rain: %1, Water: %2, Objects: %3, Under Roof: %4, Index: %5, Rain: %6", _radRain, _radWater, _radObjects, _isUnderRoof, _index, rain];
		
		if (_index > 0) then {
			radExposure = [_radMultiplier, _radRain, _radWater] call getCalculatedRadExposure;
		} else {
			if (radExposure > 0) then {
				radExposure = radExposure - 0.5;
			} else { radExposure = 0 };
		};
		
		sleep 5;
    };
    // Once the player dies, reset the variables
    radExposure = 0;
    _playerCBRN = 1; // lower is better
    _radRain = 0; // higher = more rads
    _isUnderRoof = false;
    sleep 5;
};