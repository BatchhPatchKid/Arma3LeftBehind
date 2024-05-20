// Initial variable declarations
radExposure = 0;
private _cbrnSUITS = ["acp_A2_CDF_contact_U_C_CBRN_Suit_01_A2_CDF_F","acp_A2_ChDKZ_contact_U_C_CBRN_Suit_01_A2_ChDKZ_F","acp_A3_AAF_contact_U_C_CBRN_Suit_01_A3_AAF_F","acp_A3_CSAT_GHex_contact_U_C_CBRN_Suit_01_A3_CSAT_GHex_F","acp_A3_CSAT_Hex_contact_U_C_CBRN_Suit_01_A3_CSAT_Hex_F","acp_A3_CSAT_UHex_contact_U_C_CBRN_Suit_01_A3_CSAT_UHex_F","acp_A3_CTRG_G_contact_U_C_CBRN_Suit_01_A3_CTRG_G_F","acp_A3_CTRG_contact_U_C_CBRN_Suit_01_A3_CTRG_F","acp_A3_LDF_contact_U_C_CBRN_Suit_01_A3_LDF_F","acp_A3_Multicam_Woodland_contact_U_C_CBRN_Suit_01_A3_Multicam_Woodland_F","acp_A3_RUS_Taiga_contact_U_C_CBRN_Suit_01_A3_RUS_Taiga_F","acp_A3_Syndikat_contact_U_C_CBRN_Suit_01_A3_Syndikat_F","acp_ATACS_contact_U_C_CBRN_Suit_01_ATACS_F","acp_AUS_AUSCAM_contact_U_C_CBRN_Suit_01_AUS_AUSCAM_F","acp_BEL_Jigsaw_contact_U_C_CBRN_Suit_01_BEL_Jigsaw_F","acp_CA_CADPAT_Arctic_contact_U_C_CBRN_Suit_01_CA_CADPAT_Arctic_F","acp_CA_CADPAT_MT_contact_U_C_CBRN_Suit_01_CA_CADPAT_MT_F","acp_CA_CADPAT_contact_U_C_CBRN_Suit_01_CA_CADPAT_F","acp_CH_Alpenflage_contact_U_C_CBRN_Suit_01_CH_Alpenflage_F","acp_CH_Taz90_contact_U_C_CBRN_Suit_01_CH_Taz90_F","acp_CN_Type_07_Universal_contact_U_C_CBRN_Suit_01_CN_Type_07_Universal_F","acp_CN_Type_07_Urban_contact_U_C_CBRN_Suit_01_CN_Type_07_Urban_F","acp_CN_Xingkong_A_contact_U_C_CBRN_Suit_01_CN_Xingkong_A_F","acp_CN_Xingkong_W_contact_U_C_CBRN_Suit_01_CN_Xingkong_W_F","acp_CZ_vz95_Desert_contact_U_C_CBRN_Suit_01_CZ_vz95_Desert_F","acp_CZ_vz95_contact_U_C_CBRN_Suit_01_CZ_vz95_F","acp_DE_Flecktarn_contact_U_C_CBRN_Suit_01_DE_Flecktarn_F","acp_DE_Multitarn_contact_U_C_CBRN_Suit_01_DE_Multitarn_F","acp_DE_Tropentarn_contact_U_C_CBRN_Suit_01_DE_Tropentarn_F","acp_EG_Egg_contact_U_C_CBRN_Suit_01_EG_Egg_F","acp_FI_M05_Desert_contact_U_C_CBRN_Suit_01_FI_M05_Desert_F","acp_FI_M05_Relish_contact_U_C_CBRN_Suit_01_FI_M05_Relish_F","acp_FI_M05_Snow_contact_U_C_CBRN_Suit_01_FI_M05_Snow_F","acp_FR_BME_contact_U_C_CBRN_Suit_01_FR_BME_F","acp_FR_CE_contact_U_C_CBRN_Suit_01_FR_CE_F","acp_FR_Daguet_contact_U_C_CBRN_Suit_01_FR_Daguet_F","acp_GA_Gabon_Army_contact_U_C_CBRN_Suit_01_GA_Gabon_Army_F","acp_GB_DDPM_contact_U_C_CBRN_Suit_01_GB_DDPM_F","acp_GB_DPM95_contact_U_C_CBRN_Suit_01_GB_DPM95_F","acp_GB_MTP_contact_U_C_CBRN_Suit_01_GB_MTP_F","acp_GR_Lizard_contact_U_C_CBRN_Suit_01_GR_Lizard_F","acp_HR_CROPAT_contact_U_C_CBRN_Suit_01_HR_CROPAT_F","acp_IDN_Kopassus_contact_U_C_CBRN_Suit_01_IDN_Kopassus_F","acp_IE_DPM_contact_U_C_CBRN_Suit_01_IE_DPM_F","acp_IT_Vegetato_contact_U_C_CBRN_Suit_01_IT_Vegetato_F","acp_JP_Jietai_contact_U_C_CBRN_Suit_01_JP_Jietai_F","acp_LU_Waldtarndruck_contact_U_C_CBRN_Suit_01_LU_Waldtarndruck_F","acp_LV_LATPAT_contact_U_C_CBRN_Suit_01_LV_LATPAT_F","acp_MM_Tatmadaw_contact_U_C_CBRN_Suit_01_MM_Tatmadaw_F","acp_Multicam_Snow_contact_U_C_CBRN_Suit_01_Multicam_Snow_F","acp_Multicam_contact_U_C_CBRN_Suit_01_Multicam_F","acp_MX_US4CES_contact_U_C_CBRN_Suit_01_MX_US4CES_F","acp_NG_M14_contact_U_C_CBRN_Suit_01_NG_M14_F","acp_NL_NFP_G_contact_U_C_CBRN_Suit_01_NL_NFP_G_F","acp_NL_NFP_M_contact_U_C_CBRN_Suit_01_NL_NFP_M_F","acp_NL_NFP_T_contact_U_C_CBRN_Suit_01_NL_NFP_T_F","acp_POL_wz93_desert_contact_U_C_CBRN_Suit_01_POL_wz93_desert_F","acp_POL_wz93_contact_U_C_CBRN_Suit_01_POL_wz93_F","acp_PT_M18_contact_U_C_CBRN_Suit_01_PT_M18_F","acp_ROK_Granite_contact_U_C_CBRN_Suit_01_ROK_Granite_F","acp_ROK_Marine_Tigerstripe_contact_U_C_CBRN_Suit_01_ROK_Marine_Tigerstripe_F","acp_RS_MDU10_contact_U_C_CBRN_Suit_01_RS_MDU10_F","acp_RUS_EMR_contact_U_C_CBRN_Suit_01_RUS_EMR_F","acp_RUS_Flora_contact_U_C_CBRN_Suit_01_RUS_Flora_F","acp_RUS_Les_contact_U_C_CBRN_Suit_01_RUS_Les_F","acp_RUS_SS_Leto_contact_U_C_CBRN_Suit_01_RUS_SS_Leto_F","acp_RUS_Surpat_contact_U_C_CBRN_Suit_01_RUS_Surpat_F","acp_RUS_VSR93_contact_U_C_CBRN_Suit_01_RUS_VSR93_F","acp_SE_M90_contact_U_C_CBRN_Suit_01_SE_M90_F","acp_Secret_Snow_contact_U_C_CBRN_Suit_01_Secret_Snow_F","acp_Solid_Black_contact_U_C_CBRN_Suit_01_Solid_Black_F","acp_Solid_CoyoteBrown_contact_U_C_CBRN_Suit_01_Solid_CoyoteBrown_F","acp_Solid_Navy_contact_U_C_CBRN_Suit_01_Solid_Navy_F","acp_Solid_Olive_contact_U_C_CBRN_Suit_01_Solid_Olive_F","acp_Solid_Ranger_Green_contact_U_C_CBRN_Suit_01_Solid_Ranger_Green_F","acp_Solid_Red_contact_U_C_CBRN_Suit_01_Solid_Red_F","acp_Solid_Tan_contact_U_C_CBRN_Suit_01_Solid_Tan_F","acp_Solid_White_contact_U_C_CBRN_Suit_01_Solid_White_F","acp_SU_KLMK_Winter_contact_U_C_CBRN_Suit_01_SU_KLMK_Winter_F","acp_SU_KLMK_contact_U_C_CBRN_Suit_01_SU_KLMK_F","acp_SU_TTsKO_contact_U_C_CBRN_Suit_01_SU_TTsKO_F","acp_SY_WDL_contact_U_C_CBRN_Suit_01_SY_WDL_F","acp_TH_ThaiArmy_contact_U_C_CBRN_Suit_01_TH_ThaiArmy_F","acp_TUN_GTS_contact_U_C_CBRN_Suit_01_TUN_GTS_F","acp_TUR_TLF_contact_U_C_CBRN_Suit_01_TUR_TLF_F","acp_UA_MM14_Tan_contact_U_C_CBRN_Suit_01_UA_MM14_Tan_F","acp_UA_MM14_contact_U_C_CBRN_Suit_01_UA_MM14_F","acp_US_6CD_contact_U_C_CBRN_Suit_01_US_6CD_F","acp_US_DCU_contact_U_C_CBRN_Suit_01_US_DCU_F","acp_US_M81_contact_U_C_CBRN_Suit_01_US_M81_F","acp_US_MARPAT_D_contact_U_C_CBRN_Suit_01_US_MARPAT_D_F","acp_US_MARPAT_contact_U_C_CBRN_Suit_01_US_MARPAT_F","acp_US_OCP_contact_U_C_CBRN_Suit_01_US_OCP_F","acp_US_Tigerstripe_contact_U_C_CBRN_Suit_01_US_Tigerstripe_F","acp_US_UCP_contact_U_C_CBRN_Suit_01_US_UCP_F","acp_YU_MD89_contact_U_C_CBRN_Suit_01_YU_MD89_F","U_C_CBRN_Suit_01_Blue_F","U_B_CBRN_Suit_01_MTP_F","U_B_CBRN_Suit_01_Tropic_F","U_C_CBRN_Suit_01_White_F","U_B_CBRN_Suit_01_Wdl_F","U_I_CBRN_Suit_01_AAF_F","U_I_E_CBRN_Suit_01_EAF_F"];
private _gasMasks = ["Mask_M40","Mask_M40_OD","Mask_M50","G_AirPurifyingRespirator_02_black_F","G_AirPurifyingRespirator_02_olive_F","G_AirPurifyingRespirator_02_sand_F","G_AirPurifyingRespirator_01_F","G_RegulatorMask_F"];
private _playerCBRN = 1; // lower is better
private _playerGasMask = 1; // lower is better
private _radRain = 0; // higher is better
private _isUnderRoof = false; // in-building eliminates rad rain affects
private _radObjects = [""];
private _radMultiplier = 0;
private _radWater = 0;
private _sounds = ["geiger0","geiger1","geiger2","geiger3"];
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
	
		playSound (selectRandom _sounds);
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
		} else {
			[format ["<t color='#fffff' size='.5'>+%1 Rads</t>",_radsTaken], .8, 1, 1, .3, 0, 789] spawn BIS_fnc_dynamicText;
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
    _radRain = 0; // higher is better
    _isUnderRoof = false;
    sleep 5;
};