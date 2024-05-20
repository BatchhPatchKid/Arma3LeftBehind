params ["_pos","_levelGear"];
null = [_pos, _levelGear] spawn {
	params ["_pos","_levelGear"];
	private ["_CRVest","_CRWeapon","_CRHeadgear","_CRItems","_rndNumCR","_rndNum"];
	_i = 1; _rndNumCR = 0;

	execVM "ArrayDatabase.sqf";

	//loot arrays
	
	//Basic Selection of gear
	private _commonHeadgearLoot = ["headgearCommon"] call FN_arrayReturn;
	private _uniforms = ["uniformCommon"] call FN_arrayReturn;
	private _commonVestLoot = ["vestCommon"] call FN_arrayReturn;
	private _backpackItems = ["backpackCommon"] call FN_arrayReturn;
	private _commonWeaponLoot = ["primaryCommon"] call FN_arrayReturn;
	private _miscItems = ["randomCommon"] call FN_arrayReturn;
	private _nvgs = ["nvgCommon"] call FN_arrayReturn;
	private _waterSelection = ["waterCommon"] call FN_arrayReturn;
	private _foodSelection = ["foodCommon"] call FN_arrayReturn;
	private _firstAidSelection = ["medicalCommon"] call FN_arrayReturn;
	private _explosives = ["explosiveCommon"] call FN_arrayReturn;

	//Rare Items
	private _rareHeadgearLoot = ["headgearRare"] call FN_arrayReturn;
	private _rareVestLoot = ["vestRare"] call FN_arrayReturn;
	private _rareWeaponLoot = ["primaryRare"] call FN_arrayReturn;
	private _rareWeaponItems = ["muzzleRare"] call FN_arrayReturn;

	//spawning the loot box
	_box = createVehicle ["ACE_medicalSupplyCrate", [_pos, 5, 15, 3, 0, 20, 0,[],[]] call BIS_fnc_findSafePos];
	clearBackpackCargoGlobal _box;
	clearMagazineCargoGlobal _box;
	clearWeaponCargoGlobal _box;
	clearItemCargoGlobal _box;

	//Selecting how many will go into the crate and adding the items to the crate
	_rndNum = floor (random 3);
	for "_i" from 1 to _rndNum do {
		if (_levelGear == 0) then { _rndNumCR = [1, 20] call BIS_fnc_randomInt; };
		if (_levelGear == 1) then { _rndNumCR = [15, 20] call BIS_fnc_randomInt; };
		if (_levelGear == 2) then { _rndNumCR = 20; };
		if (_rndNumCR == 20) then { _CRVest = true } else { _CRVest = false };
		if (_CRVest) then {
			_box addItemCargoGlobal [(_rareVestLoot call BIS_fnc_selectRandomWeighted), 1];
		} else {
			_box addItemCargoGlobal [(_commonVestLoot call BIS_fnc_selectRandomWeighted), 1];
		};
		sleep .01;
	};

	for "_i" from 1 to _rndNum do {
		if (_levelGear == 0) then { _rndNumCR = [1, 20] call BIS_fnc_randomInt; };
		if (_levelGear == 1) then { _rndNumCR = [15, 20] call BIS_fnc_randomInt; };
		if (_levelGear == 2) then { _rndNumCR = 20; };
		if (_rndNumCR == 20) then { _CRWeapon = true } else { _CRWeapon = false };
		if (_CRWeapon) then {
			_rndWeapon = _rareWeaponLoot call BIS_fnc_selectRandomWeighted;
			_box addItemCargoGlobal [_rndWeapon, 1];
			_mags = _rndWeapon call BIS_fnc_compatibleMagazines;
			_rndMagNum = [1, 5] call BIS_fnc_randomInt;
			_box addItemCargoGlobal [(_mags select 0), _rndMagNum];
		} else {
			_rndWeapon = _commonWeaponLoot call BIS_fnc_selectRandomWeighted;
			_box addItemCargoGlobal [_rndWeapon, 1];
			_mags = _rndWeapon call BIS_fnc_compatibleMagazines;
			_rndMagNum = [1, 5] call BIS_fnc_randomInt;
			_box addItemCargoGlobal [(_mags select 0), _rndMagNum];
		};
		sleep .01;
	};

	_rndNum = floor (random 2);
	for "_i" from 1 to _rndNum do {
		if (_levelGear == 0) then { _rndNumCR = [1, 20] call BIS_fnc_randomInt; };
		if (_levelGear == 1) then { _rndNumCR = [15, 20] call BIS_fnc_randomInt; };
		if (_levelGear == 2) then { _rndNumCR = 20; };
		if (_rndNumCR == 20) then { _CRHeadgear = true } else { _CRHeadgear = false };
		if (_CRHeadgear) then {
			_box addItemCargoGlobal [(_rareHeadgearLoot call BIS_fnc_selectRandomWeighted), 1];
		} else {
			_box addItemCargoGlobal [(_commonHeadgearLoot call BIS_fnc_selectRandomWeighted), 1];
		};
	};

	if ((random 1) > .9) then {
		_rndNum = floor (random [1, 2, 4]);
		for "_i" from 1 to _rndNum do {
			_box addItemCargoGlobal [(_uniforms call BIS_fnc_selectRandomWeighted), 1];
		};
	};

	_rndNum = floor (random 3);
	for "_i" from 1 to _rndNum do {
		if (_levelGear == 0) then { _rndNumCR = [1, 20] call BIS_fnc_randomInt; };
		if (_levelGear == 1) then { _rndNumCR = [15, 20] call BIS_fnc_randomInt; };
		if (_levelGear == 2) then { _rndNumCR = 20; };
		if (_rndNumCR == 20) then { _CRHeadgear = true } else { _CRHeadgear = false };
		if (_CRHeadgear) then { _box addItemCargoGlobal [(_rareWeaponItems call BIS_fnc_selectRandomWeighted), 1]; };
	};

	_rndNum = floor (random 5);
	for "_i" from 1 to _rndNum do {
		_box addItemCargoGlobal [(_firstAidSelection call BIS_fnc_selectRandomWeighted), 1];
	};

	_rndNum = floor (random 2);
	for "_i" from 1 to _rndNum do {
		_box addItemCargoGlobal [(_waterSelection call BIS_fnc_selectRandomWeighted), 1];
	};

	_rndNum = floor (random 2);
	for "_i" from 1 to _rndNum do {
		_box addItemCargoGlobal [(_foodSelection call BIS_fnc_selectRandomWeighted), 1];
	};

	_rndNum = floor (random 2);
	for "_i" from 1 to _rndNum do {
		_box addItemCargoGlobal [(_explosives call BIS_fnc_selectRandomWeighted), 1];
	};

	_rndNum = floor (random [0, 2, 5]);
	for "_i" from 1 to _rndNum do {
		_box addItemCargoGlobal [(_miscItems call BIS_fnc_selectRandomWeighted), 1];
	};

	_rndNum = floor (random 2);
	for "_i" from 1 to _rndNum do {
		_box addItemCargoGlobal [(_backpackItems call BIS_fnc_selectRandomWeighted), 1];
	};

	if (_levelGear == 2 && (round(random 3) == 2)) then {
		_box addItemCargoGlobal [(_nvgs call BIS_fnc_selectRandomWeighted), 1];
	};

};