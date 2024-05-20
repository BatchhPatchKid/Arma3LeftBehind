if (isServer) then {
	 player setVariable ["Temp", bodyTemp, true];
	params ["_trigger", "_type"];

	private _coldWeatherClothing = ["U_O_R_Gorka_01_F","U_O_R_Gorka_01_brown_F","U_O_R_Gorka_01_camo_F","U_O_R_Gorka_01_black_F"];
	private _hotWeatherClothing = ["U_I_L_Uniform_01_deserter_F","U_FRITH_RUIN_SDR_Tshirt_blk_cyp","U_FRITH_RUIN_SDR_Tshirt_blk_boy","U_FRITH_RUIN_SDR_Tshirt_blk_drj","U_FRITH_RUIN_SDR_Tshirt_oli","U_FRITH_RUIN_SDR_Tshirt_oli_bet","U_FRITH_RUIN_SDR_Tshirt_cry","U_FRITH_RUIN_SDR_Tshirt_wht","U_FRITH_RUIN_SDR_Tshirt_wht_zap","U_FRITH_RUIN_SDR_Tshirt_wht_stk","U_I_L_Uniform_01_tshirt_black_F","U_I_L_Uniform_01_tshirt_olive_F","U_I_L_Uniform_01_tshirt_skull_F","U_I_L_Uniform_01_tshirt_sport_F","U_FRITH_RUIN_SDR_Tshirt_wht_fpk","U_FRITH_RUIN_TSH_wht_stk","U_FRITH_RUIN_TSH_wht_zap","U_FRITH_RUIN_TSH_wht","U_FRITH_RUIN_TSH_cry","U_FRITH_RUIN_TSH_oli_bet","U_FRITH_RUIN_TSH_oli","U_FRITH_RUIN_TSH_blk_drj","U_FRITH_RUIN_TSH_blk_boy","U_FRITH_RUIN_TSH_blk_cyp","U_FRITH_RUIN_TSH_wht_fpk","U_C_IDAP_Man_cargo_F","U_C_IDAP_Man_Jeans_F","U_C_IDAP_Man_casual_F","U_C_IDAP_Man_shorts_F","U_C_IDAP_Man_Tee_F","U_C_IDAP_Man_TeeShorts_F","U_I_C_Soldier_Bandit_4_F","U_I_C_Soldier_Bandit_1_F","U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_5_F","U_I_C_Soldier_Bandit_3_F","U_C_ArtTShirt_01_v6_F","U_C_ArtTShirt_01_v1_F","U_C_Man_casual_2_F","U_C_ArtTShirt_01_v2_F","U_C_ArtTShirt_01_v4_F","U_C_Man_casual_3_F","U_C_Man_casual_1_F","U_C_ArtTShirt_01_v5_F","U_C_ArtTShirt_01_v3_F","U_I_G_resistanceLeader_F","U_B_CombatUniform_mcam_tshirt","U_B_T_Soldier_AR_F","U_B_CombatUniform_tshirt_mcam_wdL_f","U_B_CTRG_2","U_B_CTRG_Soldier_2_F","U_B_CTRG_Soldier_2_Arid_F","U_B_CTRG_Soldier_urb_2_F","U_I_C_Soldier_Para_1_F","U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_Competitor","U_C_Uniform_Farmer_01_F","U_B_GEN_Soldier_F","U_I_G_Soldier_para_F","U_BG_Guerilla1_1","U_BG_Guerilla1_1_rvg","U_BG_Guerilla1_2_F","U_BG_Guerilla2_2","U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_C_Journalist","U_OrestesBody","U_Marshal","U_C_Mechanic_01_F","U_Rangemaster","rvg_shirt_bandit","rvg_shirt_check","rvg_shirt_kabeiroi","rvg_shirt_stripe","U_C_man_sport_1_F","U_C_man_sport_3_F","U_C_man_sport_2_F","U_C_Man_casual_6_F","U_C_Man_casual_4_F","U_C_Man_casual_5_F","U_B_survival_uniform","U_C_Poor_1","U_I_G_Story_Protagonist_F"];
	private _coldWeatherGoggles = ["NeckTight_TanCLR","L_Shemagh_Gry","L_Shemagh_OD","L_Shemagh_Red","L_Shemagh_Tan","L_shemagh_white","LBG_Shemagh_Gry","LBG_Shemagh_Tan","LBG_Shemagh_White","LCG_Shemagh_Gry","LCG_Shemagh_OD","LCG_Shemagh_White","LOG_Shemagh_Gry","LOG_Shemagh_White","LOG_Shemagh_OD","PU_shemagh_OD","PU_shemagh_Tan","LOG_Shemagh_Tan","LCG_Shemagh_Tan","LBG_Shemagh_OD","PU_shemagh_White","PU_shemagh_GryBLK","PU_shemagh_ODBLK","PU_shemagh_TanBLK","PU_shemagh_WhiteBLK","PU_shemagh_GryCLR","PU_shemagh_ODCLR","PU_shemagh_TanCLR","PU_shemagh_WhiteCLR","PU_shemagh_GryO","PU_shemagh_ODO","PU_shemagh_WhiteO","NeckTight_Dmaripat","NeckTight_Gry","NeckTight_OD","NeckTight_Red","NeckTight_Tan","PU_shemagh_TanO","NeckTight","NeckTight_DMBLK","NeckTight_GryBLK","NeckTight_ODBLK","NeckTight_WhiteBLK","NeckTight_DMCLR","NeckTight_GryCLR","NeckTight_ODCLR","NeckTight_TanBLK","NeckTight_WhiteCLR","NeckTight_DMO","NeckTight_GryO","NeckTight_ODO","NeckTight_TanO","NeckTight_WhiteO","G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_oli","rvg_balaclava_2","rvg_balaclavaCombat_2","rvg_balaclavaLow_2","rvg_balaclava_5","rvg_balaclavaCombat_5","rvg_balaclavaLow_5","rvg_balaclava_3","rvg_balaclavaCombat_3","rvg_balaclavaLow_3","rvg_balaclava_1","rvg_balaclavaCombat_1","rvg_balaclavaLow_1","rvg_balaclavaCombat_4","rvg_balaclavaLow_4","G_Balaclava_TI_blk_F","G_Balaclava_TI_G_blk_F","G_Balaclava_TI_tna_F","G_Balaclava_TI_G_tna_F"];
	private _coldWeatherHeadgear = ["H_Watchcap_blk","H_Watchcap_cbr","H_Watchcap_camo","H_Watchcap_khk","H_Shemag_olive","H_Shemag_olive_hs","H_ShemagOpen_tan","H_ShemagOpen_khk"];
	private _coldVests = ["V_PlateCarrierGL_blk","V_PlateCarrierGL_rgr","V_PlateCarrierGL_mtp","V_PlateCarrierGL_tna_F","V_PlateCarrierGL_wdl","V_PlateCarrier1_blk","V_PlateCarrier1_rgr","V_PlateCarrier1_rgr_noflag_F","V_PlateCarrier1_tna_F","V_PlateCarrier1_wdl","V_PlateCarrier2_blk","V_PlateCarrier2_rgr","V_PlateCarrier2_rgr_noflag_F","V_PlateCarrier2_tna_F","V_PlateCarrier2_wdl","V_PlateCarrierSpec_blk","V_PlateCarrierSpec_mtp","V_PlateCarrierSpec_rgr","V_PlateCarrierSpec_tna_F","V_PlateCarrierSpec_wdl","V_PlateCarrierL_CTRG","V_PlateCarrierH_CTRG","V_EOD_blue_F","V_EOD_IDAP_blue_F","V_EOD_coyote_F","V_EOD_olive_F","FRITH_ruin_vestia_lite_ghm","FRITH_ruin_vestia_lite_grn","FRITH_ruin_vestia_lite_ltr","FRITH_ruin_vestia_lite_nja","FRITH_ruin_vestia_lite_tar","FRITH_ruin_vestia_ghm","FRITH_ruin_vestia_ltr","FRITH_ruin_vestia_nja","FRITH_ruin_vestia_tar","FRITH_ruin_vestiaGL_ghmchk","FRITH_ruin_vestia_grn","FRITH_ruin_vestiaGL_ghm","FRITH_ruin_vestiaGL_grnmtp","FRITH_ruin_vestiaGL_grn","FRITH_ruin_vestiaGL_ltrmtp","FRITH_ruin_vestiaGL_ltr","FRITH_ruin_vestiaGL_njadpm","FRITH_ruin_vestiaGL_nja","FRITH_ruin_vestiaGL_tartar","FRITH_ruin_vestiaGL_tar","V_PlateCarrierIAGL_dgtl","V_PlateCarrierIAGL_oli","V_PlateCarrierIA1_dgtl","V_PlateCarrierIA2_dgtl","V_CarrierRigKBT_01_heavy_EAF_F","V_CarrierRigKBT_01_heavy_Olive_F","V_CarrierRigKBT_01_light_EAF_F","V_CarrierRigKBT_01_light_Olive_F","V_CarrierRigKBT_01_EAF_F","V_CarrierRigKBT_01_Olive_F","rvg_eodvest_3","rvg_eodvest_2","rvg_eodvest_1","rvg_platecarrier_1","rvg_platecarrier_4","rvg_platecarrier_2","rvg_platecarrier_5","rvg_platecarrier_3","V_PlateCarrier_Kerry"];
	private _weatherCoe = 1;

	private _playersInTrigger = [];
	private _index = 0;
	
	if (_type == "cold") then {
		while {true} do {
			_index = 0;
			private _players = allPlayers - entities "HeadlessClient_F";
			_playersInTrigger = [];
		
			{
				if (_x inArea _trigger) then { _index = _index + 1; _playersInTrigger = _playersInTrigger + [_x];};
				sleep .01;
			} forEach _players;
		
			if (_index == 0) then { break; };
			_index = 0;
			
			// Getting uniform of player to decrease the cold if cold weather gear is being worn or increase the cold if hot weather clothing is being worn
			_playerUniform = uniform player;
			_playerHeadgear = headgear player;
			_playerGoggles = goggles player;
			_playerVest = vest player;
			if (_playerUniform == "") then { _weatherCoe = _weatherCoe * 1.2; };
			if (_playerUniform in _coldWeatherClothing) then { _weatherCoe = _weatherCoe * 0.2; };
			if (_playerUniform in _hotWeatherClothing) then { _weatherCoe = _weatherCoe * 2.0; };
			if (_playerHeadgear in _coldWeatherHeadgear) then { _weatherCoe = _weatherCoe  * 0.75; };
			if (_playerGoggles in _coldWeatherGoggles) then { _weatherCoe = _weatherCoe  * 0.75; };
			if (_playerVest in _coldVests) then { _weatherCoe = _weatherCoe * 0.90 };
			
			
			{
				// Getting altitude of player
				_playerAlt = (getPosASL _x) select 2;
			
				if (_playerAlt < 100) then { bodyTemp = bodyTemp - (.25*_weatherCoe); };
				if (_playerAlt >= 100 AND _playerAlt < 200) then { bodyTemp = bodyTemp - (.3*_weatherCoe); };
				if (_playerAlt >= 200 AND _playerAlt < 300) then { bodyTemp = bodyTemp - (.4*_weatherCoe); };
				if (_playerAlt >= 300) then { bodyTemp = bodyTemp - (.5*_weatherCoe); };
				sleep .01;
			} forEach _playersInTrigger;
			_weatherCoe = 1;
			sleep 10;
		};
	} else { // Else == HOT
		while {true} do {
		
			_index = 0;
			private _players = allPlayers - entities "HeadlessClient_F";
			_playersInTrigger = [];
		
			{
				if (_x inArea _trigger) then { _index = _index + 1; _playersInTrigger = _playersInTrigger + [_x];};
				sleep .01;
			} forEach _players;
		
			if (_index == 0) then { break; };
			_index = 0;
			
			// Getting uniform of player to decrease the cold if cold weather gear is being worn or increase the freezing effect if hot weather clothing is being worn
			_playerUniform = uniform player;
			_playerHeadgear = headgear player;
			_playerGoggles = goggles player;
			_playerVest = vest player;
			if (_playerUniform == "") then { _weatherCoe = _weatherCoe * 0.5 };
			if (_playerUniform in _coldWeatherClothing) then { _weatherCoe = _weatherCoe * 1.75; };
			if (_playerUniform in _hotWeatherClothing) then { _weatherCoe = _weatherCoe * 0.05; };
			if (_playerHeadgear in _coldWeatherHeadgear) then { _weatherCoe = _weatherCoe  * 1.2; };
			if (_playerGoggles in _coldWeatherGoggles) then { _weatherCoe = _weatherCoe  * 1.5; };
			if (_playerVest in _coldVests) then { _weatherCoe = _weatherCoe * 1.15; };
			
			{
				// Getting altitude of player
				_playerAlt = (getPosASL _x) select 2;
			
				if (_playerAlt < 100) then { bodyTemp = bodyTemp + (.1*_weatherCoe); };
				if (_playerAlt >= 100 AND _playerAlt < 200) then { bodyTemp = bodyTemp + (.08*_weatherCoe); };
				if (_playerAlt >= 200 AND _playerAlt < 300) then { bodyTemp = bodyTemp + (.06*_weatherCoe); };
				if (_playerAlt >= 300) then { bodyTemp = bodyTemp + (.04*_weatherCoe); };
				sleep .01;
			} forEach _playersInTrigger;
			_weatherCoe = 1;
			sleep 10;
		};
	};
};