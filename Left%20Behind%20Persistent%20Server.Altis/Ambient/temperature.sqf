// Initial variable declarations
bodyTemp = 98.6;
private _coldWeatherClothing = ["U_O_R_Gorka_01_F","U_O_R_Gorka_01_brown_F","U_O_R_Gorka_01_camo_F","U_O_R_Gorka_01_black_F"];
private _hotWeatherClothing = ["U_I_L_Uniform_01_deserter_F","U_FRITH_RUIN_SDR_Tshirt_blk_cyp","U_FRITH_RUIN_SDR_Tshirt_blk_boy","U_FRITH_RUIN_SDR_Tshirt_blk_drj","U_FRITH_RUIN_SDR_Tshirt_oli","U_FRITH_RUIN_SDR_Tshirt_oli_bet","U_FRITH_RUIN_SDR_Tshirt_cry","U_FRITH_RUIN_SDR_Tshirt_wht","U_FRITH_RUIN_SDR_Tshirt_wht_zap","U_FRITH_RUIN_SDR_Tshirt_wht_stk","U_I_L_Uniform_01_tshirt_black_F","U_I_L_Uniform_01_tshirt_olive_F","U_I_L_Uniform_01_tshirt_skull_F","U_I_L_Uniform_01_tshirt_sport_F","U_FRITH_RUIN_SDR_Tshirt_wht_fpk","U_FRITH_RUIN_TSH_wht_stk","U_FRITH_RUIN_TSH_wht_zap","U_FRITH_RUIN_TSH_wht","U_FRITH_RUIN_TSH_cry","U_FRITH_RUIN_TSH_oli_bet","U_FRITH_RUIN_TSH_oli","U_FRITH_RUIN_TSH_blk_drj","U_FRITH_RUIN_TSH_blk_boy","U_FRITH_RUIN_TSH_blk_cyp","U_FRITH_RUIN_TSH_wht_fpk","U_C_IDAP_Man_cargo_F","U_C_IDAP_Man_Jeans_F","U_C_IDAP_Man_casual_F","U_C_IDAP_Man_shorts_F","U_C_IDAP_Man_Tee_F","U_C_IDAP_Man_TeeShorts_F","U_I_C_Soldier_Bandit_4_F","U_I_C_Soldier_Bandit_1_F","U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_5_F","U_I_C_Soldier_Bandit_3_F","U_C_ArtTShirt_01_v6_F","U_C_ArtTShirt_01_v1_F","U_C_Man_casual_2_F","U_C_ArtTShirt_01_v2_F","U_C_ArtTShirt_01_v4_F","U_C_Man_casual_3_F","U_C_Man_casual_1_F","U_C_ArtTShirt_01_v5_F","U_C_ArtTShirt_01_v3_F","U_I_G_resistanceLeader_F","U_B_CombatUniform_mcam_tshirt","U_B_T_Soldier_AR_F","U_B_CombatUniform_tshirt_mcam_wdL_f","U_B_CTRG_2","U_B_CTRG_Soldier_2_F","U_B_CTRG_Soldier_2_Arid_F","U_B_CTRG_Soldier_urb_2_F","U_I_C_Soldier_Para_1_F","U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_Competitor","U_C_Uniform_Farmer_01_F","U_B_GEN_Soldier_F","U_I_G_Soldier_para_F","U_BG_Guerilla1_1","U_BG_Guerilla1_1_rvg","U_BG_Guerilla1_2_F","U_BG_Guerilla2_2","U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_C_Journalist","U_OrestesBody","U_Marshal","U_C_Mechanic_01_F","U_Rangemaster","rvg_shirt_bandit","rvg_shirt_check","rvg_shirt_kabeiroi","rvg_shirt_stripe","U_C_man_sport_1_F","U_C_man_sport_3_F","U_C_man_sport_2_F","U_C_Man_casual_6_F","U_C_Man_casual_4_F","U_C_Man_casual_5_F","U_B_survival_uniform","U_C_Poor_1","U_I_G_Story_Protagonist_F"];
private _coldWeatherGoggles = ["L_Shemagh_Gry","L_Shemagh_OD","L_Shemagh_Red","L_Shemagh_Tan","L_shemagh_white","LBG_Shemagh_Gry","LBG_Shemagh_Tan","LBG_Shemagh_White","LCG_Shemagh_Gry","LCG_Shemagh_OD","LCG_Shemagh_White","LOG_Shemagh_Gry","LOG_Shemagh_White","LOG_Shemagh_OD","PU_shemagh_OD","PU_shemagh_Tan","LOG_Shemagh_Tan","LCG_Shemagh_Tan","LBG_Shemagh_OD","PU_shemagh_White","PU_shemagh_GryBLK","PU_shemagh_ODBLK","PU_shemagh_TanBLK","PU_shemagh_WhiteBLK","PU_shemagh_GryCLR","PU_shemagh_ODCLR","PU_shemagh_TanCLR","PU_shemagh_WhiteCLR","PU_shemagh_GryO","PU_shemagh_ODO","PU_shemagh_WhiteO","NeckTight_Dmaripat","NeckTight_Gry","NeckTight_OD","NeckTight_Red","NeckTight_Tan","PU_shemagh_TanO","NeckTight","NeckTight_DMBLK","NeckTight_GryBLK","NeckTight_ODBLK","NeckTight_WhiteBLK","NeckTight_DMCLR","NeckTight_GryCLR","NeckTight_ODCLR","NeckTight_TanBLK","NeckTight_WhiteCLR","NeckTight_DMO","NeckTight_GryO","NeckTight_ODO","NeckTight_TanO","NeckTight_WhiteO","G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_oli","rvg_balaclava_2","rvg_balaclavaCombat_2","rvg_balaclavaLow_2","rvg_balaclava_5","rvg_balaclavaCombat_5","rvg_balaclavaLow_5","rvg_balaclava_3","rvg_balaclavaCombat_3","rvg_balaclavaLow_3","rvg_balaclava_1","rvg_balaclavaCombat_1","rvg_balaclavaLow_1","rvg_balaclavaCombat_4","rvg_balaclavaLow_4","G_Balaclava_TI_blk_F","G_Balaclava_TI_G_blk_F","G_Balaclava_TI_tna_F","G_Balaclava_TI_G_tna_F"];
private _coldWeatherHeadgear = ["NeckTight_TanCLR","H_Watchcap_blk","H_Watchcap_cbr","H_Watchcap_camo","H_Watchcap_khk","H_Shemag_olive","H_Shemag_olive_hs","H_ShemagOpen_tan","H_ShemagOpen_khk"];
private _coldVests = ["V_PlateCarrierGL_blk","V_PlateCarrierGL_rgr","V_PlateCarrierGL_mtp","V_PlateCarrierGL_tna_F","V_PlateCarrierGL_wdl","V_PlateCarrier1_blk","V_PlateCarrier1_rgr","V_PlateCarrier1_rgr_noflag_F","V_PlateCarrier1_tna_F","V_PlateCarrier1_wdl","V_PlateCarrier2_blk","V_PlateCarrier2_rgr","V_PlateCarrier2_rgr_noflag_F","V_PlateCarrier2_tna_F","V_PlateCarrier2_wdl","V_PlateCarrierSpec_blk","V_PlateCarrierSpec_mtp","V_PlateCarrierSpec_rgr","V_PlateCarrierSpec_tna_F","V_PlateCarrierSpec_wdl","V_PlateCarrierL_CTRG","V_PlateCarrierH_CTRG","V_EOD_blue_F","V_EOD_IDAP_blue_F","V_EOD_coyote_F","V_EOD_olive_F","FRITH_ruin_vestia_lite_ghm","FRITH_ruin_vestia_lite_grn","FRITH_ruin_vestia_lite_ltr","FRITH_ruin_vestia_lite_nja","FRITH_ruin_vestia_lite_tar","FRITH_ruin_vestia_ghm","FRITH_ruin_vestia_ltr","FRITH_ruin_vestia_nja","FRITH_ruin_vestia_tar","FRITH_ruin_vestiaGL_ghmchk","FRITH_ruin_vestia_grn","FRITH_ruin_vestiaGL_ghm","FRITH_ruin_vestiaGL_grnmtp","FRITH_ruin_vestiaGL_grn","FRITH_ruin_vestiaGL_ltrmtp","FRITH_ruin_vestiaGL_ltr","FRITH_ruin_vestiaGL_njadpm","FRITH_ruin_vestiaGL_nja","FRITH_ruin_vestiaGL_tartar","FRITH_ruin_vestiaGL_tar","V_PlateCarrierIAGL_dgtl","V_PlateCarrierIAGL_oli","V_PlateCarrierIA1_dgtl","V_PlateCarrierIA2_dgtl","V_CarrierRigKBT_01_heavy_EAF_F","V_CarrierRigKBT_01_heavy_Olive_F","V_CarrierRigKBT_01_light_EAF_F","V_CarrierRigKBT_01_light_Olive_F","V_CarrierRigKBT_01_EAF_F","V_CarrierRigKBT_01_Olive_F","rvg_eodvest_3","rvg_eodvest_2","rvg_eodvest_1","rvg_platecarrier_1","rvg_platecarrier_4","rvg_platecarrier_2","rvg_platecarrier_5","rvg_platecarrier_3","V_PlateCarrier_Kerry"];
private _coldUniform = 1; // lower is better
private _coldRain = 0; // higher is better
private _fireCancel = 1; // stops cold from being as brutal due to fire being close to player
private _inBuilding = false; // in-building increases fire warmth and decreases cold taken, as well as eliminates rain coldness multiplier
private _checkStats = false;
_bodyTempCalc = 0;
player setVariable ["Temp", 98.6, true];

FN_temperature = {
	_handle = 0 spawn {
		private _coldWeatherClothing = ["U_O_R_Gorka_01_F","U_O_R_Gorka_01_brown_F","U_O_R_Gorka_01_camo_F","U_O_R_Gorka_01_black_F"];
		private _hotWeatherClothing = ["U_I_L_Uniform_01_deserter_F","U_FRITH_RUIN_SDR_Tshirt_blk_cyp","U_FRITH_RUIN_SDR_Tshirt_blk_boy","U_FRITH_RUIN_SDR_Tshirt_blk_drj","U_FRITH_RUIN_SDR_Tshirt_oli","U_FRITH_RUIN_SDR_Tshirt_oli_bet","U_FRITH_RUIN_SDR_Tshirt_cry","U_FRITH_RUIN_SDR_Tshirt_wht","U_FRITH_RUIN_SDR_Tshirt_wht_zap","U_FRITH_RUIN_SDR_Tshirt_wht_stk","U_I_L_Uniform_01_tshirt_black_F","U_I_L_Uniform_01_tshirt_olive_F","U_I_L_Uniform_01_tshirt_skull_F","U_I_L_Uniform_01_tshirt_sport_F","U_FRITH_RUIN_SDR_Tshirt_wht_fpk","U_FRITH_RUIN_TSH_wht_stk","U_FRITH_RUIN_TSH_wht_zap","U_FRITH_RUIN_TSH_wht","U_FRITH_RUIN_TSH_cry","U_FRITH_RUIN_TSH_oli_bet","U_FRITH_RUIN_TSH_oli","U_FRITH_RUIN_TSH_blk_drj","U_FRITH_RUIN_TSH_blk_boy","U_FRITH_RUIN_TSH_blk_cyp","U_FRITH_RUIN_TSH_wht_fpk","U_C_IDAP_Man_cargo_F","U_C_IDAP_Man_Jeans_F","U_C_IDAP_Man_casual_F","U_C_IDAP_Man_shorts_F","U_C_IDAP_Man_Tee_F","U_C_IDAP_Man_TeeShorts_F","U_I_C_Soldier_Bandit_4_F","U_I_C_Soldier_Bandit_1_F","U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_5_F","U_I_C_Soldier_Bandit_3_F","U_C_ArtTShirt_01_v6_F","U_C_ArtTShirt_01_v1_F","U_C_Man_casual_2_F","U_C_ArtTShirt_01_v2_F","U_C_ArtTShirt_01_v4_F","U_C_Man_casual_3_F","U_C_Man_casual_1_F","U_C_ArtTShirt_01_v5_F","U_C_ArtTShirt_01_v3_F","U_I_G_resistanceLeader_F","U_B_CombatUniform_mcam_tshirt","U_B_T_Soldier_AR_F","U_B_CombatUniform_tshirt_mcam_wdL_f","U_B_CTRG_2","U_B_CTRG_Soldier_2_F","U_B_CTRG_Soldier_2_Arid_F","U_B_CTRG_Soldier_urb_2_F","U_I_C_Soldier_Para_1_F","U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_Competitor","U_C_Uniform_Farmer_01_F","U_B_GEN_Soldier_F","U_I_G_Soldier_para_F","U_BG_Guerilla1_1","U_BG_Guerilla1_1_rvg","U_BG_Guerilla1_2_F","U_BG_Guerilla2_2","U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_C_Journalist","U_OrestesBody","U_Marshal","U_C_Mechanic_01_F","U_Rangemaster","rvg_shirt_bandit","rvg_shirt_check","rvg_shirt_kabeiroi","rvg_shirt_stripe","U_C_man_sport_1_F","U_C_man_sport_3_F","U_C_man_sport_2_F","U_C_Man_casual_6_F","U_C_Man_casual_4_F","U_C_Man_casual_5_F","U_B_survival_uniform","U_C_Poor_1","U_I_G_Story_Protagonist_F"];
		private _coldWeatherGoggles = ["L_Shemagh_Gry","L_Shemagh_OD","L_Shemagh_Red","L_Shemagh_Tan","L_shemagh_white","LBG_Shemagh_Gry","LBG_Shemagh_Tan","LBG_Shemagh_White","LCG_Shemagh_Gry","LCG_Shemagh_OD","LCG_Shemagh_White","LOG_Shemagh_Gry","LOG_Shemagh_White","LOG_Shemagh_OD","PU_shemagh_OD","PU_shemagh_Tan","LOG_Shemagh_Tan","LCG_Shemagh_Tan","LBG_Shemagh_OD","PU_shemagh_White","PU_shemagh_GryBLK","PU_shemagh_ODBLK","PU_shemagh_TanBLK","PU_shemagh_WhiteBLK","PU_shemagh_GryCLR","PU_shemagh_ODCLR","PU_shemagh_TanCLR","PU_shemagh_WhiteCLR","PU_shemagh_GryO","PU_shemagh_ODO","PU_shemagh_WhiteO","NeckTight_Dmaripat","NeckTight_Gry","NeckTight_OD","NeckTight_Red","NeckTight_Tan","PU_shemagh_TanO","NeckTight","NeckTight_DMBLK","NeckTight_GryBLK","NeckTight_ODBLK","NeckTight_WhiteBLK","NeckTight_DMCLR","NeckTight_GryCLR","NeckTight_ODCLR","NeckTight_TanBLK","NeckTight_WhiteCLR","NeckTight_DMO","NeckTight_GryO","NeckTight_ODO","NeckTight_TanO","NeckTight_WhiteO","G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_oli","rvg_balaclava_2","rvg_balaclavaCombat_2","rvg_balaclavaLow_2","rvg_balaclava_5","rvg_balaclavaCombat_5","rvg_balaclavaLow_5","rvg_balaclava_3","rvg_balaclavaCombat_3","rvg_balaclavaLow_3","rvg_balaclava_1","rvg_balaclavaCombat_1","rvg_balaclavaLow_1","rvg_balaclavaCombat_4","rvg_balaclavaLow_4","G_Balaclava_TI_blk_F","G_Balaclava_TI_G_blk_F","G_Balaclava_TI_tna_F","G_Balaclava_TI_G_tna_F"];
		private _coldWeatherHeadgear = ["NeckTight_TanCLR","H_Watchcap_blk","H_Watchcap_cbr","H_Watchcap_camo","H_Watchcap_khk","H_Shemag_olive","H_Shemag_olive_hs","H_ShemagOpen_tan","H_ShemagOpen_khk"];
		private _coldVests = ["V_PlateCarrierGL_blk","V_PlateCarrierGL_rgr","V_PlateCarrierGL_mtp","V_PlateCarrierGL_tna_F","V_PlateCarrierGL_wdl","V_PlateCarrier1_blk","V_PlateCarrier1_rgr","V_PlateCarrier1_rgr_noflag_F","V_PlateCarrier1_tna_F","V_PlateCarrier1_wdl","V_PlateCarrier2_blk","V_PlateCarrier2_rgr","V_PlateCarrier2_rgr_noflag_F","V_PlateCarrier2_tna_F","V_PlateCarrier2_wdl","V_PlateCarrierSpec_blk","V_PlateCarrierSpec_mtp","V_PlateCarrierSpec_rgr","V_PlateCarrierSpec_tna_F","V_PlateCarrierSpec_wdl","V_PlateCarrierL_CTRG","V_PlateCarrierH_CTRG","V_EOD_blue_F","V_EOD_IDAP_blue_F","V_EOD_coyote_F","V_EOD_olive_F","FRITH_ruin_vestia_lite_ghm","FRITH_ruin_vestia_lite_grn","FRITH_ruin_vestia_lite_ltr","FRITH_ruin_vestia_lite_nja","FRITH_ruin_vestia_lite_tar","FRITH_ruin_vestia_ghm","FRITH_ruin_vestia_ltr","FRITH_ruin_vestia_nja","FRITH_ruin_vestia_tar","FRITH_ruin_vestiaGL_ghmchk","FRITH_ruin_vestia_grn","FRITH_ruin_vestiaGL_ghm","FRITH_ruin_vestiaGL_grnmtp","FRITH_ruin_vestiaGL_grn","FRITH_ruin_vestiaGL_ltrmtp","FRITH_ruin_vestiaGL_ltr","FRITH_ruin_vestiaGL_njadpm","FRITH_ruin_vestiaGL_nja","FRITH_ruin_vestiaGL_tartar","FRITH_ruin_vestiaGL_tar","V_PlateCarrierIAGL_dgtl","V_PlateCarrierIAGL_oli","V_PlateCarrierIA1_dgtl","V_PlateCarrierIA2_dgtl","V_CarrierRigKBT_01_heavy_EAF_F","V_CarrierRigKBT_01_heavy_Olive_F","V_CarrierRigKBT_01_light_EAF_F","V_CarrierRigKBT_01_light_Olive_F","V_CarrierRigKBT_01_EAF_F","V_CarrierRigKBT_01_Olive_F","rvg_eodvest_3","rvg_eodvest_2","rvg_eodvest_1","rvg_platecarrier_1","rvg_platecarrier_4","rvg_platecarrier_2","rvg_platecarrier_5","rvg_platecarrier_3","V_PlateCarrier_Kerry"];
		
		_playerUniform = uniform player;
		_playerHeadgear = headgear player;
		_playerGoggles = goggles player;
		_playerVest = vest player;
		_playerUniformText = "not cold nor hot weather capable";
		_playerHeadgearText = "not cold weather capable";
		_playerGogglesText = "not cold weather capable";
		_playerVestText = "does not add any warmth";
		
		if (_playerUniform == "") then { _playerUniformText = "not being worn at the moment"; };
		if (_playerUniform in _coldWeatherClothing) then { _playerUniformText = "cold weather capable"; };
		if (_playerUniform in _hotWeatherClothing) then { _playerUniformText = "hot weather capable"; };
		if (_playerHeadgear in _coldWeatherHeadgear) then { _playerHeadgearText = "cold weather capable"; };
		if (_playerGoggles in _coldWeatherGoggles) then { _playerGogglesText = "cold weather capable"; };
		if (_playerVest in _coldVests) then { _playerVestText = "adds some warmth"; };


		if (bodyTemp < 93) then {
			hintSilent parseText format["<t color='#0000FF' size='1'>Body Temp: %1<br/>Uniform is %2<br/> Headgear is %3<br/>Facewear is %4<br/>Vest %5</t>",bodyTemp,_playerUniformText, _playerHeadgearText, _playerGogglesText, _playerVestText];
		};
		if (bodyTemp > 100) then {
			hintSilent parseText format["<t color='#F38701' size='1'>Body Temp: %1<br/><t color='#ffffff' size='1'>Uniform is %2<br/> Headgear is %3<br/>Facewear is %4<br/>Vest %5</t>",bodyTemp,_playerUniformText, _playerHeadgearText, _playerGogglesText, _playerVestText];
		};
		if (bodyTemp <= 100 && bodyTemp >= 93) then {
			hintSilent parseText format["<t color='#ffffff' size='1'>Body Temp: %1<br/>Uniform is %2<br/> Headgear is %3<br/>Facewear is %4<br/>Vest %5</t>",bodyTemp,_playerUniformText, _playerHeadgearText, _playerGogglesText, _playerVestText];
		};
		sleep 6;
		hintSilent "";
	};
};

getCalculatedBodyTempAndHealth = {
    params ["_checkStats"];
    _coldUniform = 1; // lower is better
    _coldRain = 0; // higher is better
    _fireCancel = 1;
    _inBuilding = false;
    _bodyTempCalc = 0;
    _time = daytime;

    // Searching for fire
    _objectsNearPlayer = nearestObjects [player, ["Campfire_burning_F", "FirePlace_burning_F", "MetalBarrel_burning_F"], 5];
    _numObjects = count _objectsNearPlayer;
    _isFire = _numObjects > 0;

    // Getting altitude of player
    _playerAlt = (getPosASL player) select 2;

    // Getting uniform of player to decrease the cold if cold weather gear is being worn or increase the cold if hot weather clothing is being worn
    _playerUniform = uniform player;
	_playerHeadgear = headgear player;
	_playerGoggles = goggles player;
	_playerVest = vest player;
	
    if (_playerUniform == "") then { _coldUniform = 3.0 };
    if (_playerUniform in _coldWeatherClothing) then { _coldUniform = _coldUniform * 0.2 };
    if (_playerUniform in _hotWeatherClothing) then { _coldUniform = _coldUniform * 5.0 };
	if (_playerHeadgear in _coldWeatherHeadgear) then { _coldUniform = _coldUniform  * 0.75; };
	if (_playerGoggles in _coldWeatherGoggles) then { _coldUniform = _coldUniform  * 0.75; };
	if (_playerVest in _coldVests) then { _coldUniform = _coldUniform * 0.90 };

    // GET NEAREST BUILDING
    _nbuilding = nearestObjects [player, ["house"], 10];

    {
        if ((typeOf _x isEqualTo "Campfire_burning_F") or (typeOf _x isEqualTo "FirePlace_burning_F") or (typeOf _x isEqualTo "MetalBarrel_burning_F")) then {
            _nbuilding = _nbuilding - [_x];
        };
		sleep .01;
    } forEach _nbuilding;

    _inBuilding = false;
    if (count _nbuilding > 0) then { _inBuilding = true; } else { _inBuilding = false; };

    if !(_inBuilding) then {
        if (rain > .9) then { _coldRain = .3; };
        if (rain > .7 && rain <= .9) then { _coldRain = .09; };
        if (rain > .5 && rain <= .7) then { _coldRain = .07; };
        if (rain > .3 && rain <= .7) then { _coldRain = .05; };
        if (rain > .15 && rain <= .3) then { _coldRain = .03; };
        if (rain > 0.1 && rain <= .15) then { _coldRain = .01; };
        if (rain <= 0.1) then { _coldRain = 0; };
        _inBuilding = false;
    } else {
        _inBuilding = true;
    };

    if (_isFire) then {
        if (bodyTemp < 98.6) then {
            bodyTemp = bodyTemp + 0.25;
            if (_inBuilding) then { _fireCancel = .01; };
        } else {
            bodyTemp = bodyTemp + 0.005;
        };
    };

    if (_time < 4 || _time > 20) then { // Night time
        if (_playerAlt > 450) then { _bodyTempCalc = ((0.35 * _coldUniform) + _coldRain); };
        if (_playerAlt > 400 && _playerAlt <= 450) then { _bodyTempCalc = _fireCancel * ((0.033 * _coldUniform) + _coldRain); };
        if (_playerAlt > 300 && _playerAlt <= 350) then { _bodyTempCalc = _fireCancel * ((0.031 * _coldUniform) + _coldRain); };
        if (_playerAlt > 250 && _playerAlt <= 300) then { _bodyTempCalc = _fireCancel * ((0.029 * _coldUniform) + _coldRain); };
        if (_playerAlt > 200 && _playerAlt <= 250) then { _bodyTempCalc = _fireCancel * ((0.027 * _coldUniform) + _coldRain); };
        if (_playerAlt > 150 && _playerAlt <= 200) then { _bodyTempCalc = _fireCancel * ((0.025 * _coldUniform) + _coldRain); };
        if (_playerAlt > 100 && _playerAlt <= 150) then { _bodyTempCalc = _fireCancel * ((0.023 * _coldUniform) + _coldRain); };
        if (_playerAlt > 50 && _playerAlt <= 100) then { _bodyTempCalc = _fireCancel * ((0.021 * _coldUniform) + _coldRain); };
        if (_playerAlt > 0 && _playerAlt <= 50) then { _bodyTempCalc = _fireCancel * ((0.019 * _coldUniform) + _coldRain); };
    } else { // Day time
        if (_playerAlt > 450) then { _bodyTempCalc = ((0.021 * _coldUniform) + _coldRain); };
        if (_playerAlt > 400 && _playerAlt <= 450) then { _bodyTempCalc = _fireCancel * ((0.019 * _coldUniform) + _coldRain); };
        if (_playerAlt > 300 && _playerAlt <= 350) then { _bodyTempCalc = _fireCancel * ((0.017 * _coldUniform) + _coldRain); };
        if (_playerAlt > 250 && _playerAlt <= 300) then { _bodyTempCalc = _fireCancel * ((0.015 * _coldUniform) + _coldRain); };
        if (_playerAlt > 200 && _playerAlt <= 250) then { _bodyTempCalc = _fireCancel * ((0.013 * _coldUniform) + _coldRain); };
        if (_playerAlt > 150 && _playerAlt <= 200) then { _bodyTempCalc = _fireCancel * ((0.011 * _coldUniform) + _coldRain); };
        if (_playerAlt > 100 && _playerAlt <= 150) then { _bodyTempCalc = _fireCancel * ((0.009 * _coldUniform) + _coldRain); };
        if (_playerAlt > 50 && _playerAlt <= 100) then { _bodyTempCalc = _fireCancel * ((0.007 * _coldUniform) + _coldRain); };
        if (_playerAlt > 0 && _playerAlt <= 50) then { _bodyTempCalc = _fireCancel * ((0.005 * _coldUniform) + _coldRain); };
    };

    if (surfaceIsWater getPos player && isNull objectParent player && !(_checkStats)) then { // Checking to see if the player is in water and not in a boat
        bodyTemp = bodyTemp - 0.3;
    };
	
	if !(isNull objectParent player) then { _bodyTempCalc = _bodyTempCalc * .65; }; // if the player is in a vehicle, then have the body temperature slow down in either overheating or freezing
    
    if !(_checkStats) then {
		bodyTemp = bodyTemp - _bodyTempCalc;
        if (bodyTemp < 91) then {
            if (bodyTemp < 89) then {  player setDamage 1; };
            addCamShake [0.5, 1, 10];
           

            [format ["<t color='#0000FF' size='.5'>EXTREMELY LOW BODY TEMP<br/>Current Temp: %1</t>",bodyTemp], .8, 1, 1.5, .3, 0, 789] spawn BIS_fnc_dynamicText;

            if ((round (random 20)) == 1) then {
                [player, true, 15] call ace_medical_fnc_setUnconscious;
            };
        };
        if (bodyTemp > 106) then {
            if (bodyTemp > 108) then { player setDamage 1; };
            addCamShake [0.5, 1, 10];

            [format ["<t color='#F38701' size='.5'>EXTREMELY HIGH BODY TEMP<br/>Current Temp: %1</t>",bodyTemp], .8, 1, 1.5, .3, 0, 789] spawn BIS_fnc_dynamicText;
				
            if ((round (random 20)) == 1) then {
                [player, true, 15] call ace_medical_fnc_setUnconscious;
            };
        };
    };
    [bodyTemp, _bodyTempCalc];
};

while {true} do {
    while {alive player} do {
        _returnedValues = [false] call getCalculatedBodyTempAndHealth;
        bodyTemp = _returnedValues select 0;
        sleep 5;
    };
    // Once the player dies, reset the variables
    bodyTemp = 98.6;
    _coldUniform = 1; // lower is better
    _coldRain = 0; // higher is better
    _fireCancel = 1;
    _inBuilding = false;
    sleep 5;
};