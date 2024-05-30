params ["_faction","_unit","_melee","_primaryOverride", "_sfOverride"];

importantItems = false;
money = false;
nvg= false;
primary = false;
secondary = true;
optics = false;
muzzle = false;
firstAid = false;
water = false;
food = false;
rocket = false;
rndShitAmount = 3;
railAttachment = false;
grenades = false;

execVM "ArrayDatabase.sqf";

//Basic Selection of gear
_headgearArraySelection = ["headgearCommon"] call FN_arrayReturn;
_facewearArraySelection = ["facewearCommon"] call FN_arrayReturn;
_uniformArraySelection = ["uniformCommon"] call FN_arrayReturn;
_vestArraySelection = ["vestCommon"] call FN_arrayReturn;
_backpackArraySelection = ["backpackCommon"] call FN_arrayReturn;
_rifleArraySelection = ["primaryCommon"] call FN_arrayReturn;
_handgunArraySelection = ["handgunCommon"] call FN_arrayReturn;
_launcherArraySelection = ["launcherCommon"] call FN_arrayReturn;
_rndShitArraySelection = ["randomCommon"] call FN_arrayReturn;
_opticsArraySelection = ["opticsCommon"] call FN_arrayReturn;
_muzzleArraySelection = ["muzzleCommon"] call FN_arrayReturn;
_railArraySelection = ["bipodCommon"] call FN_arrayReturn;
_nvgSelection = ["nvgCommon"] call FN_arrayReturn;
_waterSelection = ["waterCommon"] call FN_arrayReturn;
_foodSelection = ["foodCommon"] call FN_arrayReturn;
_meleeSelection = ["meleeCommon"] call FN_arrayReturn;
_firstAidSelection = ["medicalCommon"] call FN_arrayReturn;
_glWeapons = ["glWeapons"] call FN_arrayReturn;
_grenades = ["grenades"] call FN_arrayReturn;

//Rare Items
_rareNVG = ["nvgRare"] call FN_arrayReturn;
_headgearArraySelectionRare = ["headgearRare"] call FN_arrayReturn;
_vestArraySelectionRare = ["vestRare"] call FN_arrayReturn;
_backpackArraySelectionRare = ["backpackRare"] call FN_arrayReturn;
_rifleArraySelectionRare = ["primaryRare"] call FN_arrayReturn;
_handgunArraySelectionRare = ["handgunRare"] call FN_arrayReturn;
_opticsArraySelectionRare = ["opticsRare"] call FN_arrayReturn;
_muzzleArraySelectionRare = ["muzzleRare"] call FN_arrayReturn;
_railArraySelectionRare = ["railRare"] call FN_arrayReturn;

if (_faction == "Bandit") then {
	_facewearArraySelection = ["facewearBandit"] call FN_arrayReturn;
	firstAid = (round random 5 == 1);
	water = (round random 16 == 1);
	food = (round random 20 == 1);
	money = (round random 5 == 2);
	nvg = (round random 300 == 3);
	rocket = (round random 300 == 3);
	primary = (round random 3 == 2);
	optics = (round random 15 == 2);
	muzzle = (round random 10 == 2);
	railAttachment = (round random 20 == 2);
	grenades = (round random 15 == 2);
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 155 == 2) then {_headgearArraySelection = _headgearArraySelectionRare;};
	if (round random 155 == 2) then {_vestArraySelection = _vestArraySelectionRare;};
	if (round random 155 == 2) then {_backpackArraySelection = _backpackArraySelectionRare;};
	if (round random 170 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 175 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 185 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 100 == 2) then {_railArraySelection = _railArraySelectionRare;};
	if (round random 600 == 2) then {_nvgSelection = _rareNVG;};
	
	if (random 50 < 1 && !_melee || _sfOverride) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 14 == 3);
		nvg = (round random 20 == 2);
		primary = true;
		secondary= false;
		optics = true;
		muzzle = (round random 6 == 2);
		railAttachment = (round random 6 == 2);
		
		_headgearArraySelection = ["headgearBandit_SF"] call FN_arrayReturn;
		_vestArraySelection = ["vestBandit_SF"] call FN_arrayReturn;
		
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};
	
};
if (_faction == "Renegade") then {
	_headgearArraySelection = ["headgearRenegade"] call FN_arrayReturn;
	_uniformArraySelection = ["uniformRenegade"] call FN_arrayReturn;
	_facewearArraySelection = ["facewearRenegade"] call FN_arrayReturn;
	firstAid = (round random 5 == 1);
	water = (round random 16 == 1);
	food = (round random 20 == 1);
	money = (round random 5 == 2);
	grenades = (round random 10 == 2);
	primary = TRUE;
	
	rndShitAmount = round random [1, 2, 5];
};
if (_faction == "BB") then {
	_headgearArraySelection = ["headgearBB"] call FN_arrayReturn;
	_facewearArraySelection = ["facewearSU"] call FN_arrayReturn;
	_meleeSelection = ["meleeBB"] call FN_arrayReturn;
	_rifleArraySelection= ["rifleBB"] call FN_arrayReturn;
	firstAid = (round random 5 == 1);
	water = (round random 16 == 1);
	food = (round random 20 == 1);
	money = (round random 5 == 2);
	nvg = (round random 300 == 3);
	rocket = (round random 300 == 3);
	primary = true;
	optics = (round random 20 == 2);
	muzzle = (round random 15 == 2);
	railAttachment = (round random 20 == 2);
	grenades = (round random 15 == 2);
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 500 == 2) then {_nvgSelection = _rareNVG;};
	if (round random 155 == 2) then {_vestArraySelection = _vestArraySelectionRare;};
	if (round random 155 == 2) then {_backpackArraySelection = _backpackArraySelectionRare;};
	if (round random 170 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 175 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 185 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 165 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (random 50 < 1 && !_melee || _sfOverride) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 30 == 3);
		primary = true;
		secondary= false;
		optics = true;
		muzzle = (round random 6 == 2);
		railAttachment = (round random 6 == 2);
		nvg = (round random 10 == 2);
		
		_vestArraySelection = ["vestBB_SF"] call FN_arrayReturn;
		_rifleArraySelection = ["rifleBB_SF"] call FN_arrayReturn;
		_opticsArraySelection = ["opticsBB_SF"] call FN_arrayReturn;
		_muzzleArraySelection = ["muzzleBB_SF"] call FN_arrayReturn;
		_uniformArraySelection = ["uniformBB_SF"] call FN_arrayReturn;
		
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};

}; 
if (_faction == "DT") then {
	_headgearArraySelection = ["headgearDT"] call FN_arrayReturn;
	_facewearArraySelection = ["facewearDT"] call FN_arrayReturn;
	firstAid = (round random 5 == 1);
	water = (round random 16 == 1);
	food = (round random 20 == 1);
	money = (round random 6 == 2);
	nvg = (round random 300 == 3);
	rocket = (round random 300 == 3);
	primary = (round random 4 == 2);
	optics = (round random 30 == 2);
	muzzle = (round random 25 == 2);
	railAttachment = (round random 20 == 2);
	grenades = (round random 20 == 2);
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 600 == 2) then {_nvgSelection = _rareNVG;};
	if (round random 170 == 2) then {_headgearArraySelection = _headgearArraySelectionRare;};
	if (round random 170 == 2) then {_vestArraySelection = _vestArraySelectionRare;};
	if (round random 160 == 2) then {_backpackArraySelection = _backpackArraySelectionRare;};
	if (round random 180 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 185 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 195 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 175 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (random 50 < 1 && !_melee || _sfOverride) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 30 == 3);
		primary = true;
		secondary= false;
		optics = (round random 6 == 3);
		muzzle = (round random 10 == 2);
		railAttachment = (round random 6 == 2);
		nvg = (round random 20 == 2);
		
		_facewearArraySelection = ["facewearDT_SF"] call FN_arrayReturn;
		_vestArraySelection = ["vestBandit_SF"] call FN_arrayReturn;
		_rifleArraySelection = ["rifleDT_SF"] call FN_arrayReturn;
		_opticsArraySelection = ["opticsDT_SF"] call FN_arrayReturn;
		_muzzleArraySelection = ["muzzleDT_SF"] call FN_arrayReturn;
		
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};

};
if (_faction == "NH") then {
	_headgearArraySelection = ["headgearNH"] call FN_arrayReturn;
	_facewearArraySelection = ["facewearNH"] call FN_arrayReturn;
	if (round random 600 == 2) then {_nvgSelection = _rareNVG;};
	firstAid = (round random 5 == 1);
	water = (round random 16 == 1);
	food = (round random 20 == 1);
	money = (round random 6 == 2);
	nvg = (round random 300 == 3);
	rocket = (round random 300 == 3);
	primary = (round random 3 == 2);
	optics = (round random 30 == 2);
	muzzle = (round random 25 == 2);
	railAttachment = (round random 20 == 2);
	grenades = (round random 17 == 2);
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 170 == 2) then {_vestArraySelection = _vestArraySelectionRare;};
	if (round random 160 == 2) then {_backpackArraySelection = _backpackArraySelectionRare;};
	if (round random 180 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 185 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 195 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 175 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (random 50 < 1 && !_melee || _sfOverride) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 30 == 3);
		primary = true;
		secondary= false;
		optics = true;
		muzzle = (round random 6 == 2);
		railAttachment = (round random 6 == 2);
		nvg = (round random 20 == 2);
		
		_facewearArraySelection = ["facewearNH_SF"] call FN_arrayReturn;
		_vestArraySelection = ["vestBandit_SF"] call FN_arrayReturn;
		_rifleArraySelection = ["rifleNH_SF"] call FN_arrayReturn;
		_opticsArraySelection = ["opticsNH_SF"] call FN_arrayReturn;
		_muzzleArraySelection = ["muzzleNH_SF"] call FN_arrayReturn;
		
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};
};
if (_faction == "PF") then {
	_headgearArraySelection = ["headgearPF"] call FN_arrayReturn;
	_uniformArraySelection = ["uniformPF"] call FN_arrayReturn;
	_meleeSelection = ["meleePF"] call FN_arrayReturn;
	if (round random 500 == 2) then {_nvgSelection = _rareNVG;};
	firstAid = (round random 5 == 1);
	water = (round random 16 == 1);
	food = (round random 20 == 1);
	money = (round random 6 == 2);
	nvg = (round random 300 == 3);
	rocket = (round random 250 == 3);
	primary = (round random 2 == 1);
	optics = (round random 30 == 2);
	muzzle = (round random 25 == 2);
	railAttachment = (round random 20 == 2);
	grenades = (round random 7 == 2);
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 170 == 2) then {_headgearArraySelection = _headgearArraySelectionRare;};
	if (round random 170 == 2) then {_vestArraySelection = _vestArraySelectionRare;};
	if (round random 160 == 2) then {_backpackArraySelection = _backpackArraySelectionRare;};
	if (round random 180 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 185 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 195 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 175 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (random 30 < 1 && !_melee || _sfOverride) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 30 == 3);
		primary = true;
		secondary= false;
		optics = true;
		muzzle = (round random 6 == 2);
		railAttachment = (round random 6 == 2);
		nvg = (round random 10 == 2);
		
		_headgearArraySelection = ["headgearPF_SF"] call FN_arrayReturn;
		_vestArraySelection = ["vestPF_SF"] call FN_arrayReturn;
		_rifleArraySelection = ["riflePF_SF"] call FN_arrayReturn;
		
		
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};
};
if (_faction == "RC") then {
	_headgearArraySelection = ["headgearRC"] call FN_arrayReturn;
	_facewearArraySelection = ["facewearRC"] call FN_arrayReturn;
	_vestArraySelection = ["vestRC"] call FN_arrayReturn;
	_meleeSelection = ["meleeRC"] call FN_arrayReturn;
	_uniformArraySelection = ["uniformRC"] call FN_arrayReturn;
	if (round random 500 == 2) then {_nvgSelection = _rareNVG;};
	firstAid = (round random 4 == 1);
	water = (round random 16 == 1);
	food = (round random 20 == 1);
	money = (round random 4 == 2);
	nvg = (round random 250 == 3);
	rocket = (round random 250 == 3);
	primary = true;
	optics = (round random 10 == 2);
	muzzle = (round random 15 == 2);
	railAttachment = (round random 20 == 2);
	grenades = (round random 15 == 2);
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 150 == 2) then {_headgearArraySelection = _headgearArraySelectionRare;};
	if (round random 150 == 2) then {_vestArraySelection = _vestArraySelectionRare;};
	if (round random 145 == 2) then {_backpackArraySelection = _backpackArraySelectionRare;};
	if (round random 150 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 155 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 165 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 150 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (random 40 < 1 && !_melee || _sfOverride) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 30 == 3);
		primary = true;
		secondary= false;
		optics = true;
		muzzle = (round random 6 == 2);
		railAttachment = (round random 6 == 2);
		nvg = (round random 10 == 2);
		
		_headgearArraySelection = ["headgearRC_SF"] call FN_arrayReturn;
		_uniformArraySelection = ["uniformRC_SF"] call FN_arrayReturn;
		_vestArraySelection = ["vestRC_SF"] call FN_arrayReturn;
		_rifleArraySelection = ["rifleRC_SF"] call FN_arrayReturn;
		_opticsArraySelection = ["opticsRC_SF"] call FN_arrayReturn;
		_muzzleArraySelection = ["muzzleRC_SF"] call FN_arrayReturn;
		
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};
};
if (_faction == "TRB") then {
	_facewearArraySelection = ["facewearTRB"] call FN_arrayReturn;
	_uniformArraySelection = ["uniformTRB"] call FN_arrayReturn;
	_rifleArraySelection = ["rifleTRB"] call FN_arrayReturn;
	_headgearArraySelection = ["headgearTRB"] call FN_arrayReturn;
	_meleeSelection = ["meleeTRB"] call FN_arrayReturn;
	_opticsArraySelection = ["russianOptic"] call FN_arrayReturn;
	_muzzleArraySelection = ["russianMuzzle"] call FN_arrayReturn;
	if (round random 500 == 2) then {_nvgSelection = _rareNVG;};
	firstAid = (round random 4 == 1);
	water = (round random 16 == 1);
	food = (round random 20 == 1);
	money = (round random 4 == 2);
	nvg = (round random 250 == 3);
	rocket = (round random 250 == 3);
	primary = true;
	optics = (round random 15 == 2);
	muzzle = (round random 10 == 2);
	railAttachment = (round random 20 == 2);
	grenades = (round random 15 == 2);
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 160 == 2) then {_headgearArraySelection = _headgearArraySelectionRare;};
	if (round random 160 == 2) then {_vestArraySelection = _vestArraySelectionRare;};
	if (round random 150 == 2) then {_backpackArraySelection = _backpackArraySelectionRare;};
	if (round random 170 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 175 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 185 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 165 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (random 30 < 1 && !_melee || _sfOverride) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 30 == 3);
		primary = true;
		secondary= false;
		optics = true;
		muzzle = (round random 6 == 2);
		railAttachment = (round random 6 == 2);
		nvg = (round random 10 == 2);
		
		_headgearArraySelection = ["headgearTRB_SF"] call FN_arrayReturn;
		_vestArraySelection = ["vestTRB_SF"] call FN_arrayReturn;
		_rifleArraySelection = ["rifleTRB_SF"] call FN_arrayReturn;
		
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};
};
if (_faction == "US") then {
	_headgearArraySelection = ["headgearUS"] call FN_arrayReturn;
	_facewearArraySelection = ["facewearUS"] call FN_arrayReturn;
	_uniformArraySelection = ["uniformUS"] call FN_arrayReturn;
	_vestArraySelection = ["vestUS"] call FN_arrayReturn;
	_backpackArraySelection = ["backpackUS"] call FN_arrayReturn;
	_rifleArraySelection = ["rifleUS"] call FN_arrayReturn;
	_handgunArraySelection = ["handgunUS"] call FN_arrayReturn;
	_launcherArraySelection = ["launcherUS"] call FN_arrayReturn;
	firstAid = (round random 3 == 1);
	water = (round random 16 == 1);
	food = (round random 20 == 1);
	if (round random 300 == 2) then {_nvgSelection = _rareNVG;};
	money = (round random 2 == 2);
	nvg = (round random 150 == 3);
	rocket = (round random 150 == 3);
	primary = true;
	optics = (round random 2 == 1);
	muzzle = (round random 10 == 2);
	railAttachment = (round random 20 == 2);
	grenades = (round random 5 == 2);
	
	if (round random 45 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 55 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 35 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	//Ranger
	if (random 10 < 1 && !_melee || _sfOverride) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 30 == 3);
		primary = true;
		secondary= false;
		optics = true;
		muzzle = true;
		railAttachment = true;
		nvg = true;
		
		_uniformArraySelection = ["uniformUS_Ranger_SF"] call FN_arrayReturn;
		_headgearArraySelection = ["headgearUS_Ranger_SF"] call FN_arrayReturn;
		_vestArraySelection = ["vestUS_Ranger_SF"] call FN_arrayReturn;
		_rifleArraySelection = ["rifleUS_Ranger_SF"] call FN_arrayReturn;
		_opticsArraySelection = ["opticsUS_Ranger_SF"] call FN_arrayReturn;
		_muzzleArraySelection = ["muzzleUS_Ranger_SF"] call FN_arrayReturn;
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};
	//marine
	//sniper
};
if (_faction == "SU") then {
	_facewearArraySelection = ["facewearSU"] call FN_arrayReturn;
	_uniformArraySelection = ["uniformSU"] call FN_arrayReturn;
	firstAid = (round random 5 == 1);
	water = (round random 16 == 1);
	food = (round random 20 == 1);
	if (round random 600 == 2) then {_nvgSelection = _rareNVG;};
	money = (round random 4 == 2);
	nvg = (round random 300 == 3);
	rocket = (round random 300 == 3);
	primary = true;
	optics = (round random 30 == 2);
	muzzle = (round random 25 == 2);
	railAttachment = (round random 20 == 2);
	grenades = (round random 20 == 2);
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 170 == 2) then {_headgearArraySelection = _headgearArraySelectionRare;};
	if (round random 170 == 2) then {_vestArraySelection = _vestArraySelectionRare;};
	if (round random 160 == 2) then {_backpackArraySelection = _backpackArraySelectionRare;};
	if (round random 180 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 185 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 195 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 175 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (random 50 < 1 && !_melee || _sfOverride) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 30 == 3);
		primary = true;
		secondary= false;
		optics = true;
		muzzle = (round random 6 == 2);
		railAttachment = (round random 6 == 2);
		nvg = (round random 20 == 2);
		
		_headgearArraySelection = ["headgearSU_SF"] call FN_arrayReturn;
		_vestArraySelection = ["vestSU_SF"] call FN_arrayReturn;
		_rifleArraySelection = ["rifleSU_SF"] call FN_arrayReturn;
		
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};
};
if (_faction == "RU") then {
	_headgearArraySelection = ["headgearRU"] call FN_arrayReturn;
	_uniformArraySelection = ["uniformRU"] call FN_arrayReturn;
	_vestArraySelection = ["vestRU"] call FN_arrayReturn;
	_backpackArraySelection = ["backpackRU"] call FN_arrayReturn;
	_rifleArraySelection = ["rifleRU"] call FN_arrayReturn;
	_handgunArraySelection = ["handgunRU"] call FN_arrayReturn;
	_launcherArraySelection = ["launcherRU"] call FN_arrayReturn;
	_muzzleArraySelection = ["muzzleRU"] call FN_arrayReturn;
	_opticsArraySelection = ["russianOptic"] call FN_arrayReturn;
	_muzzleArraySelection = ["russianMuzzle"] call FN_arrayReturn;
	_facewearArraySelection = ["facewearRU"] call FN_arrayReturn;
	firstAid = (round random 3 == 1);
	water = (round random 16 == 1);
	food = (round random 20 == 1);
	if (round random 360 == 2) then {_nvgSelection = _rareNVG;};
	money = (round random 4 == 2);
	nvg = (round random 180 == 3);
	rocket = (round random 180 == 3);
	primary = true;
	optics = true;
	muzzle = (round random 7 == 2);
	railAttachment = (round random 20 == 2);
	grenades = (round random 8 == 2);
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 145 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 140 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 135 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (random 15 < 1 && !_melee || _sfOverride) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 30 == 3);
		primary = true;
		secondary= false;
		optics = true;
		muzzle = true;
		railAttachment = true;
		nvg = true;
		
		_uniformArraySelection = ["uniformRU_SF"] call FN_arrayReturn;
		_rifleArraySelection = ["rifleRU_SF"] call FN_arrayReturn;
		_headgearArraySelection = ["headgearRU_SF"] call FN_arrayReturn;
		_vestArraySelection = ["vestRU_SF"] call FN_arrayReturn;
		_muzzleArraySelection = ["muzzleRU_SF"] call FN_arrayReturn;
		
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};
};
if (_faction == "ROA") then {
	_facewearArraySelection = ["facewearROA"] call FN_arrayReturn;
	_uniformArraySelection = ["uniformROA"] call FN_arrayReturn;
	_vestArraySelection = ["vestROA"] call FN_arrayReturn;
	_rifleArraySelection = ["rifleROA"] call FN_arrayReturn;
	_headgearArraySelection = ["headgearROA"] call FN_arrayReturn;
	firstAid = (round random 3 == 1);
	water = (round random 16 == 1);
	food = (round random 20 == 1);
	if (round random 400 == 2) then {_nvgSelection = _rareNVG;};
	money = (round random 4 == 2);
	nvg = (round random 200 == 3);
	rocket = (round random 200 == 3);
	primary = true;
	optics = (round random 3 == 2);
	muzzle = (round random 5 == 2);
	railAttachment = (round random 20 == 2);
	grenades = (round random 20 == 2);
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 170 == 2) then {_headgearArraySelection = _headgearArraySelectionRare;};
	if (round random 170 == 2) then {_vestArraySelection = _vestArraySelectionRare;};
	if (round random 160 == 2) then {_backpackArraySelection = _backpackArraySelectionRare;};
	if (round random 180 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 185 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 195 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 175 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (random 20 < 1 && !_melee || _sfOverride) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 30 == 3);
		primary = true;
		secondary= false;
		optics = true;
		muzzle = (round random 6 == 2);
		railAttachment = (round random 6 == 2);
		nvg = (round random 10 == 2);
		
		_headgearArraySelection = ["headgearROA_SF"] call FN_arrayReturn;
		_vestArraySelection = ["vestROA_SF"] call FN_arrayReturn;
		_muzzleArraySelection = ["muzzleROA_SF"] call FN_arrayReturn;
		
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};
};
if (_faction == "PMC") then {
	_headgearArraySelection = ["headgearPMC"] call FN_arrayReturn;
	_facewearArraySelection = ["facewearPMC"] call FN_arrayReturn;
	_uniformArraySelection = ["uniformPMC"] call FN_arrayReturn;
	_vestArraySelection = ["vestPMC"] call FN_arrayReturn;
	_rifleArraySelection = ["riflePMC"] call FN_arrayReturn;
	_opticsArraySelection = ["russianOptic"] call FN_arrayReturn;
	_muzzleArraySelection = ["russianMuzzle"] call FN_arrayReturn;
	firstAid = (round random 3 == 1);
	water = (round random 16 == 1);
	food = (round random 20 == 1);
	if (round random 400 == 2) then {_nvgSelection = _rareNVG;};
	money = (round random 4 == 2);
	nvg = (round random 200 == 3);
	rocket = (round random 200 == 3);
	primary = true;
	optics = (round random 2 == 1);
	muzzle = (round random 25 == 2);
	railAttachment = (round random 20 == 2);
	grenades = (round random 20 == 2);
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 170 == 2) then {_headgearArraySelection = _headgearArraySelectionRare;};
	if (round random 170 == 2) then {_vestArraySelection = _vestArraySelectionRare;};
	if (round random 160 == 2) then {_backpackArraySelection = _backpackArraySelectionRare;};
	if (round random 180 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 185 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 195 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 175 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (random 20 < 1 && !_melee || _sfOverride) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 30 == 3);
		primary = true;
		secondary= false;
		optics = true;
		muzzle = true;
		railAttachment = true;
		nvg = (round random 10 == 2);
		
		_facewearArraySelection = ["facewearPMC_SF"] call FN_arrayReturn;
		_uniformArraySelection = ["uniformPMC_SF"] call FN_arrayReturn;
		_rifleArraySelection = ["riflePMC_SF"] call FN_arrayReturn;
		_muzzleArraySelection = ["muzzlePMC_SF"] call FN_arrayReturn;
		
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};
};
if (_faction == "WO") then {
	_headgearArraySelection = ["headgearWO"] call FN_arrayReturn;
	_facewearArraySelection = ["facewearWO"] call FN_arrayReturn;
	_uniformArraySelection = ["uniformWO"] call FN_arrayReturn;
	_vestArraySelection = ["vestWO"] call FN_arrayReturn;
	_rifleArraySelection = ["rifleWO"] call FN_arrayReturn;
	_backpackArraySelection = ["backpackWO"] call FN_arrayReturn;
	_meleeSelection = ["meleeWO"] call FN_arrayReturn;
	firstAid = (round random 4 == 1);
	water = (round random 16 == 1);
	food = (round random 20 == 1);
	if (round random 500 == 2) then {_nvgSelection = _rareNVG;};
	money = (round random 4 == 2);
	nvg = (round random 250 == 3);
	rocket = (round random 250 == 3);
	primary = (round random 2 == 1);
	optics = (round random 30 == 2);
	muzzle = (round random 25 == 2);
	railAttachment = (round random 20 == 2);
	grenades = (round random 15 == 2);
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 170 == 2) then {_headgearArraySelection = _headgearArraySelectionRare;};
	if (round random 170 == 2) then {_vestArraySelection = _vestArraySelectionRare;};
	if (round random 160 == 2) then {_backpackArraySelection = _backpackArraySelectionRare;};
	if (round random 180 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 185 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 195 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 175 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (random 40 < 1 && !_melee || _sfOverride) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 30 == 3);
		primary = true;
		secondary= false;
		optics = true;
		muzzle = (round random 6 == 2);
		railAttachment = (round random 6 == 2);
		nvg = (round random 10 == 2);
		
		_headgearArraySelection = ["headgearWO_SF"] call FN_arrayReturn;
		_vestArraySelection = ["vestWO_SF"] call FN_arrayReturn;
		_rifleArraySelection = ["rifleWO_SF"] call FN_arrayReturn;
		_opticsArraySelection = ["opticsWO_SF"] call FN_arrayReturn;
		_muzzleArraySelection = ["muzzleWO_SF"] call FN_arrayReturn;
		
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};
};
if (_faction == "ALF") then {
	_uniformArraySelection = ["uniformALF"] call FN_arrayReturn;
	_vestArraySelection = ["vestALF"] call FN_arrayReturn;
	_rifleArraySelection = ["rifleALF"] call FN_arrayReturn;
	_headgearArraySelection = ["headgearALF"] call FN_arrayReturn;
	_facewearArraySelection = ["facewearALF"] call FN_arrayReturn;
	firstAid = (round random 4 == 1);
	water = (round random 16 == 1);
	food = (round random 20 == 1);
	if (round random 500 == 2) then {_nvgSelection = _rareNVG;};
	money = (round random 4 == 2);
	nvg = (round random 250 == 3);
	rocket = (round random 250 == 3);
	primary = true;
	optics = (round random 30 == 2);
	muzzle = (round random 25 == 2);
	railAttachment = (round random 20 == 2);
	grenades = (round random 15 == 2);
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 170 == 2) then {_headgearArraySelection = _headgearArraySelectionRare;};
	if (round random 180 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 185 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 195 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 175 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (random 30 < 1 && !_melee || _sfOverride) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 30 == 3);
		primary = true;
		secondary= false;
		optics = true;
		muzzle = true;
		railAttachment = (round random 6 == 2);
		nvg = (round random 10 == 2);
		
		_headgearArraySelection = ["headgearALF_SF"] call FN_arrayReturn;
		_vestArraySelection = ["vestALF_SF"] call FN_arrayReturn;
		_rifleArraySelection = ["rifleALF_SF"] call FN_arrayReturn;
		_opticsArraySelection = ["opticsALF_SF"] call FN_arrayReturn;
		_muzzleArraySelection = ["muzzleALF_SF"] call FN_arrayReturn;
		
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};
};

_headgear = _headgearArraySelection call BIS_fnc_selectRandomWeighted;
_facewear = _facewearArraySelection call BIS_fnc_selectRandomWeighted;
_rifle = _rifleArraySelection call BIS_fnc_selectRandomWeighted;
_uniform = _uniformArraySelection call BIS_fnc_selectRandomWeighted;
_vest = _vestArraySelection call BIS_fnc_selectRandomWeighted;
_handgun = _handgunArraySelection call BIS_fnc_selectRandomWeighted;
_launcher = _launcherArraySelection call BIS_fnc_selectRandomWeighted;
		
_unit addHeadgear _headgear;
_unit addGoggles _facewear;
_unit forceAddUniform _uniform;
_unit addVest _vest;

if (rocket) then {
	_backpackArraySelection = _backpackArraySelectionRare;
	_backpack = _backpackArraySelection call BIS_fnc_selectRandomWeighted;
	_unit addBackpack _backpack;
	[_unit, _launcher, 2+(round random 3)] call BIS_fnc_addWeapon;
} else {
	_backpack = _backpackArraySelection call BIS_fnc_selectRandomWeighted;
	_unit addBackpack _backpack;
};

_unit addItemToBackpack "WBK_HeadLampItem";
	
if (round random 2 == 1) then {
	for "_j" from 1 to (round (random 5)) do {
		_unit addItemToVest "ACE_fieldDressing";
		.01;
	};
};
	
if (firstAid) then {
	_unit addItemToBackpack (_firstAidSelection call BIS_fnc_selectRandomWeighted);
};

if (water) then {
	_unit addItemToBackpack (_waterSelection call BIS_fnc_selectRandomWeighted);
};

if (food) then {
	_unit addItemToBackpack (_foodSelection call BIS_fnc_selectRandomWeighted);
};

if (grenades) then {
	_unit addItemToBackpack (_grenades call BIS_fnc_selectRandomWeighted);
};

if (money) then {
	for "_j" from 1 to (round (random 5)) do {
		_unit addItemToVest "rvg_money";
		sleep .01;
	};
};

if (nvg) then {
	_unit linkItem (_nvgSelection call BIS_fnc_selectRandomWeighted);
};

if (_melee == false) then {
	if (primary || _primaryOverride || _sfOverride) then {
		[_unit, _rifle, (round (random 7))+2] call BIS_fnc_addWeapon; 
		if (railAttachment) then {
			_unit addPrimaryWeaponItem (_railArraySelection call BIS_fnc_selectRandomWeighted);
		} else {
			_unit addPrimaryWeaponItem "acc_flashlight";
		};
		if (optics) then {
			_opticSelected = _opticsArraySelection call BIS_fnc_selectRandomWeighted;
			_longRangeWeapons = ["longRangeWeapon"] call FN_arrayReturn;
			_longRangeScope = ["longRangeScope"] call FN_arrayReturn;
			if (_rifle in _longRangeWeapons) then { //series of if statements to ensure that long range weapons have long range scopes
				if (_opticSelected in _longRangeScope) then {
					_unit addPrimaryWeaponItem _opticSelected; //optic is good to put onto a sniper
				} else {
					_longRangeScopeWeight = ["longRangeScopeWeight"] call FN_arrayReturn;
					_unit addPrimaryWeaponItem (_longRangeScopeWeight call BIS_fnc_selectRandomWeighted); 
				};
			} else {
				_unit addPrimaryWeaponItem _opticSelected;
			};
		};
		if (muzzle) then {
			_unit addPrimaryWeaponItem (_muzzleArraySelection call BIS_fnc_selectRandomWeighted);
		};
	};
	//Adding sidearm
	[_unit, _handgun, (round (random 5))+2] call BIS_fnc_addWeapon;
	_unit addHandgunItem "acc_flashlight_pistol";
} else {
	_handgun = _meleeSelection call BIS_fnc_selectRandomWeighted;
	[_unit, _handgun, 0] call BIS_fnc_addWeapon;
};

if (_rifle in _glWeapons) then {
	_mxGL = ["arifle_MX_GL_F","arifle_MX_GL_Black_F","arifle_MX_GL_khk_F"];
	_glRussian = ["glRussian"] call FN_arrayReturn;
	if (_rifle in _glRussian) then {
		_glRounds = ["glRoundsRussian"] call FN_arrayReturn;
		_numRounds = round random [3, 5, 8];
		for "_i" from 1 to _numRounds do {
			_unit addItemToBackpack (_glRounds call BIS_fnc_selectRandomWeighted);
		};
	} else {
		if (_rifle in _mxGL) then {
			_glRounds = ["3Rnd_SmokeYellow_Grenade_shell", 0.1,"3Rnd_Smoke_Grenade_shell", 0.1,"3Rnd_SmokeRed_Grenade_shell", 0.1,"3Rnd_SmokePurple_Grenade_shell", 0.1,"3Rnd_SmokeOrange_Grenade_shell", 0.1,"3Rnd_SmokeGreen_Grenade_shell", 0.1,"3Rnd_SmokeBlue_Grenade_shell", 0.1,"3Rnd_UGL_FlareYellow_F", 0.05,"3Rnd_UGL_FlareWhite_F", 0.05,"3Rnd_UGL_FlareRed_F", 0.05,"3Rnd_UGL_FlareCIR_F", 0.05,"3Rnd_UGL_FlareGreen_F", 0.05,"3Rnd_HE_Grenade_shell", 0.6];
			_numRounds = round random [3, 5, 8];
			for "_i" from 1 to _numRounds do {
				_unit addItemToBackpack (_glRounds call BIS_fnc_selectRandomWeighted);
			};
		} else {
			_glRounds = ["glRounds"] call FN_arrayReturn;
			_numRounds = round random [3, 5, 8];
			for "_i" from 1 to _numRounds do {
				_unit addItemToBackpack (_glRounds call BIS_fnc_selectRandomWeighted);
			};
		};
	};
};

if (muzzle) then {
	_unit addHandgunItem (_muzzleArraySelection call BIS_fnc_selectRandomWeighted);
};

for "_i" from 1 to rndShitAmount do {
	_unit addItemToBackpack (_rndShitArraySelection call BIS_fnc_selectRandomWeighted);
	sleep .01;
};