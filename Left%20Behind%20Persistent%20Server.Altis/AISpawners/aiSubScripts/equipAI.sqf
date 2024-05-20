params ["_faction","_unit","_melee","_primaryOverride"];

importantItems = false;
money = false;
nvg= false;
primary = false;
optics = false;
muzzle = false;
firstAid = false;
water = false;
food = false;
rocket = false;
rndShitAmount = 3;
railAttachment = false;

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
	_facewearArraySelection = ["rvg_balaclavaLow_4", 0.04, "rvg_balaclavaCombat_4", 0.04, "rvg_balaclava_4", 0.04, "rvg_balaclavaLow_1", 0.04, "rvg_balaclavaCombat_1", 0.04, "rvg_balaclava_1", 0.04, "rvg_balaclavaLow_3", 0.04, "rvg_balaclavaCombat_3", 0.04, "rvg_balaclava_3", 0.04, "rvg_balaclavaCombat_5", 0.04, "rvg_balaclava_5", 0.04, "rvg_balaclavaLow_2", 0.04, "rvg_balaclavaCombat_2", 0.04, "rvg_balaclava_2", 0.04, "rvg_balaclavaLow_5", 0.04, "G_Balaclava_Tropentarn", 0.04, "G_Balaclava_Skull1", 0.04, "G_Balaclava_Scarecrow_01", 0.04, "G_Balaclava_Flames1", 0.04, "G_Balaclava_oli", 0.04, "G_Balaclava_lowprofile", 0.04, "G_Balaclava_Halloween_01", 0.04, "G_Balaclava_Flecktarn", 0.04, "G_Balaclava_combat", 0.04, "G_Balaclava_BlueStrips", 0.04, "G_Balaclava_blk", 0.04];
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
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 155 == 2) then {_headgearArraySelection = _headgearArraySelectionRare;};
	if (round random 155 == 2) then {_vestArraySelection = _vestArraySelectionRare;};
	if (round random 155 == 2) then {_backpackArraySelection = _backpackArraySelectionRare;};
	if (round random 170 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 175 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 185 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 100 == 2) then {_railArraySelection = _railArraySelectionRare;};
	if (round random 600 == 2) then {_nvgSelection = _rareNVG;};
	
	if (round random 200 == 2 && !_melee) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 7 == 3);
		nvg = (round random 5 == 2);
		primary = true;
		optics = true;
		muzzle = (round random 3 == 2);
		railAttachment = (round random 3 == 2);
		
		_headgearArraySelection = ["FRITH_ruin_modhat_ltrpntblk", 0.04, "FRITH_ruin_modhat_ltrpntgrn", 0.04];
		_vestArraySelection = ["V_PlateCarrier1_blk", 0.04, "V_PlateCarrier2_blk", 0.04, "FRITH_ruin_vestiaGL_tar", 0.04, "FRITH_ruin_vestiaGL_tartar", 0.04, "FRITH_ruin_vestiaGL_nja", 0.04, "FRITH_ruin_vestiaGL_njadpm", 0.04, "FRITH_ruin_vestiaGL_ltr", 0.04, "FRITH_ruin_vestiaGL_ltrmtp", 0.04, "FRITH_ruin_vestiaGL_grn", 0.04, "FRITH_ruin_vestiaGL_grnmtp", 0.04, "FRITH_ruin_vestiaGL_ghm", 0.04, "FRITH_ruin_vestiaGL_ghmchk", 0.04, "rvg_eodvest_3", 0.04];
		_rifleArraySelection = ["arifle_MX_F", 0.04, "arifle_MX_Black_F", 0.04, "arifle_MX_SW_F", 0.04, "arifle_MX_SW_Black_F", 0.04, "arifle_MX_SW_khk_F", 0.04, "arifle_MX_khk_F", 0.04, "arifle_MXM_F", 0.04, "arifle_MXM_Black_F", 0.04, "arifle_MXM_khk_F", 0.04, "LMG_Zafir_F", 0.04, "srifle_DMR_02_F", 0.04, "srifle_DMR_02_camo_F", 0.04, "srifle_DMR_02_sniper_F", 0.04, "arifle_CTARS_hex_F", 0.04, "arifle_CTARS_ghex_F", 0.04, "arifle_CTARS_blk_F", 0.04, "arifle_RPK12_F", 0.04, "arifle_RPK12_arid_F", 0.04, "arifle_RPK12_lush_F", 0.04, "srifle_DMR_03_F", 0.04, "srifle_DMR_03_multicam_F", 0.04, "srifle_DMR_03_khaki_F", 0.04, "srifle_DMR_03_tan_F", 0.04, "srifle_DMR_03_woodland_F", 0.04, "arifle_ARX_blk_F", 0.04, "arifle_ARX_ghex_F", 0.04, "arifle_ARX_hex_F", 0.04, "SMG_01_F", 0.04, "srifle_DMR_01_F", 0.04, "Rusty_LMG_Zafir_F", 0.04, "DSA_XTS", 0.04, "arifle_MSBS65_UBS_sand_F", 0.04, "arifle_MSBS65_UBS_camo_F", 0.04, "arifle_MSBS65_UBS_black_F", 0.04, "arifle_MSBS65_UBS_F", 0.04, "arifle_MSBS65_Mark_sand_F", 0.04, "arifle_MSBS65_Mark_camo_F", 0.04, "arifle_MSBS65_Mark_black_F", 0.04, "arifle_MSBS65_Mark_F", 0.04, "arifle_MSBS65_GL_sand_F", 0.04, "arifle_MSBS65_GL_camo_F", 0.04, "arifle_MSBS65_GL_black_F", 0.04, "arifle_MSBS65_GL_F", 0.04, "arifle_MSBS65_sand_F", 0.04, "arifle_MSBS65_camo_F", 0.04, "arifle_MSBS65_black_F", 0.04, "arifle_MSBS65_F", 0.04, "srifle_EBR_F", 0.04];
		_opticsArraySelection = ["optic_Holosight_arid_F", 0.04, "optic_Holosight_blk_F", 0.04, "optic_Holosight_khk_F", 0.04, "optic_Holosight_lush_F", 0.04, "optic_Holosight", 0.04, "optic_Holosight_smg_blk_F", 0.04, "optic_Holosight_smg_khk_F", 0.04, "optic_Holosight_smg", 0.04, "optic_MRCO", 0.04, "optic_KHS_old", 0.04, "optic_Hamr", 0.04, "optic_SOS", 0.04, "optic_ERCO_blk_F", 0.04, "optic_ERCO_khk_F", 0.04, "optic_ERCO_snd_F", 0.04, "optic_AMS", 0.04];
		_muzzleArraySelection = ["muzzle_snds_M", 0.04, "muzzle_snds_m_khk_F", 0.04, "muzzle_snds_m_snd_F", 0.04, "muzzle_snds_B", 0.04, "muzzle_snds_B_arid_F", 0.04, "muzzle_snds_B_khk_F", 0.04, "muzzle_snds_B_lush_F", 0.04, "muzzle_snds_B_snd_F", 0.04, "muzzle_snds_H_khk_F", 0.04, "muzzle_snds_H_snd_F", 0.04, "muzzle_snds_H", 0.04];
		if (round random 3 == 2) then {
			_backpackArraySelection = _backpackArraySelectionRare;
		};
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};
	
};
if (_faction == "Renegade") then {
	_headgearArraySelection = ["H_HeadBandage_stained_F", 0.04, "H_HeadBandage_bloody_F", 0.04, "H_HeadBandage_stained_F", 0.04, "H_HeadBandage_bloody_F", 0.04, "H_HeadBandage_stained_F", 0.04, "H_HeadBandage_bloody_F", 0.04, "H_HeadBandage_stained_F", 0.04, "H_HeadBandage_bloody_F", 0.04, "H_HeadBandage_stained_F", 0.04, "H_HeadBandage_bloody_F", 0.04, "H_HeadBandage_stained_F", 0.04, "H_HeadBandage_bloody_F", 0.04, "Axe_In_Head", 0.04, "Human_Face_Mask", 0.04];
	_uniformArraySelection = ["U_FRITH_RUIN_WKR_lite", 0.04, "U_FRITH_RUIN_WKR_tan", 0.04, "U_FRITH_RUIN_WKR_dark", 0.04, "U_FRITH_RUIN_TSH_wht_fpk", 0.04, "U_FRITH_RUIN_TSH_wht_stk", 0.04, "U_FRITH_RUIN_TSH_wht_zap", 0.04, "U_FRITH_RUIN_TSH_wht", 0.04, "U_FRITH_RUIN_TSH_cry", 0.04, "U_FRITH_RUIN_TSH_oli_bet", 0.04, "U_FRITH_RUIN_TSH_oli", 0.04, "U_FRITH_RUIN_TSH_blk_drj", 0.04, "U_FRITH_RUIN_TSH_blk_boy", 0.04, "U_FRITH_RUIN_TSH_blk_cyp", 0.04, "U_FRITH_RUIN_SDR_Tshirt_wht_fpk", 0.04, "U_FRITH_RUIN_SDR_Tshirt_wht_stk", 0.04, "U_FRITH_RUIN_SDR_Tshirt_wht_zap", 0.04, "U_FRITH_RUIN_SDR_Tshirt_wht", 0.04, "U_FRITH_RUIN_SDR_Tshirt_cry", 0.04, "U_FRITH_RUIN_SDR_Tshirt_oli_bet", 0.04, "U_FRITH_RUIN_SDR_Tshirt_oli", 0.04, "U_FRITH_RUIN_SDR_Tshirt_blk_drj", 0.04, "U_FRITH_RUIN_SDR_Tshirt_blk_boy", 0.04, "U_FRITH_RUIN_SDR_Tshirt_blk_cyp", 0.04];
	_facewearArraySelection = ["rvg_balaclava_2", 0.04, "rvg_balaclavaCombat_2", 0.04, "rvg_balaclavaLow_2", 0.04, "rvg_balaclava_5", 0.04, "rvg_balaclavaCombat_5", 0.04, "rvg_balaclavaLow_5", 0.04, "rvg_balaclava_3", 0.04, "rvg_balaclavaCombat_3", 0.04, "rvg_balaclavaLow_3", 0.04, "rvg_balaclava_1", 0.04, "rvg_balaclavaCombat_1", 0.04, "rvg_balaclavaLow_1", 0.04, "rvg_balaclava_4", 0.04, "rvg_balaclavaCombat_4", 0.04, "rvg_balaclavaLow_4", 0.04, "rvg_bandana_4", 0.04, "rvg_bandanaAvi_4", 0.04, "rvg_bandanaShades_4", 0.04, "rvg_bandanaSport_4", 0.04, "rvg_bandana_2", 0.04, "rvg_bandanaAvi_2", 0.04, "rvg_bandanaShades_2", 0.04, "rvg_bandanaSport_2", 0.04, "rvg_bandana_3", 0.04, "rvg_bandanaAvi_3", 0.04, "rvg_bandana_1", 0.04, "rvg_bandanaAvi_1", 0.04, "rvg_bandanaShades_1", 0.04, "rvg_bandanaSport_1", 0.04, "rvg_bandanaShades_3", 0.04, "rvg_bandanaSport_3", 0.04, "rvg_bandana_5", 0.04, "rvg_bandanaAvi_5", 0.04, "rvg_bandanaShades_5", 0.04, "rvg_bandanaSport_5", 0.04];
	firstAid = (round random 5 == 1);
	water = (round random 16 == 1);
	food = (round random 20 == 1);
	money = (round random 5 == 2);
	primary = TRUE;
	
	rndShitAmount = round random [1, 2, 5];
};
if (_faction == "BB") then {
	_headgearArraySelection = ["H_Booniehat_mgrn", 0.04, "H_Booniehat_khk_hs", 0.04, "H_Booniehat_khk", 0.04, "H_Booniehat_mcamo", 0.04, "H_Booniehat_oli", 0.04, "H_Booniehat_tan", 0.04, "H_Booniehat_taiga", 0.04, "H_Booniehat_tna_F", 0.04, "H_Booniehat_wdl", 0.04, "H_Booniehat_dgtl", 0.04, "H_Booniehat_eaf", 0.04];
	_facewearArraySelection = ["Mask_M40_OD", 0.04, "Mask_M40", 0.04, "Mask_M50", 0.04, "G_RegulatorMask_F", 0.04, "G_AirPurifyingRespirator_02_black_F", 0.04, "G_AirPurifyingRespirator_02_olive_F", 0.04, "G_AirPurifyingRespirator_02_sand_F", 0.04, "G_AirPurifyingRespirator_01_F", 0.04];
	_meleeSelection = ["WBK_ww1_Club", 0.04, "Sashka_Russian", 0.04, "Knife_kukri", 0.04, "Weap_melee_knife", 0.04, "WBK_Katana", 0.04, "IceAxe", 0.04, "WBK_survival_weapon_2", 0.04, "FireAxe", 0.04, "CrudeAxe", 0.04, "Crowbar", 0.04, "Bat_Spike", 0.04, "Bat_Clear", 0.04, "WBK_axe", 0.04, "Pipe_aluminium", 0.04];
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
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 500 == 2) then {_nvgSelection = _rareNVG;};
	if (round random 155 == 2) then {_vestArraySelection = _vestArraySelectionRare;};
	if (round random 155 == 2) then {_backpackArraySelection = _backpackArraySelectionRare;};
	if (round random 170 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 175 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 185 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 165 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (round random 200 == 2 && !_melee) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 7 == 3);
		primary = true;
		optics = true;
		muzzle = (round random 3 == 2);
		railAttachment = (round random 3 == 2);
		nvg = (round random 5 == 2);
		
		_vestArraySelection = ["FRITH_ruin_vestia_lite_ghm", 0.04, "FRITH_ruin_vestia_lite_grn", 0.04, "FRITH_ruin_vestia_lite_ltr", 0.04, "FRITH_ruin_vestia_lite_nja", 0.04, "FRITH_ruin_vestia_lite_tar", 0.04, "FRITH_ruin_vestia_ghm", 0.04, "FRITH_ruin_vestia_grn", 0.04, "FRITH_ruin_vestia_ltr", 0.04, "FRITH_ruin_vestia_nja", 0.04, "FRITH_ruin_vestia_tar", 0.04, "FRITH_ruin_vestiaGL_ghmchk", 0.04, "FRITH_ruin_vestiaGL_ghm", 0.04, "FRITH_ruin_vestiaGL_grnmtp", 0.04, "FRITH_ruin_vestiaGL_grn", 0.04, "FRITH_ruin_vestiaGL_ltrmtp", 0.04, "FRITH_ruin_vestiaGL_ltr", 0.04, "FRITH_ruin_vestiaGL_njadpm", 0.04, "FRITH_ruin_vestiaGL_nja", 0.04, "FRITH_ruin_vestiaGL_tartar", 0.04, "FRITH_ruin_vestiaGL_tar", 0.04];
		_rifleArraySelection = ["arifle_AK12_F", 0.04, "arifle_AK12_arid_F", 0.04, "arifle_AK12_lush_F", 0.04, "arifle_AK12_GL_F", 0.04, "arifle_AK12_GL_arid_F", 0.04, "arifle_AK12_GL_lush_F", 0.04, "arifle_AK12U_F", 0.04, "arifle_AK12U_arid_F", 0.04, "arifle_AK12U_lush_F", 0.04, "Rusty_srifle_DMR_04_F", 0.04, "srifle_DMR_06_camo_F", 0.04, "srifle_DMR_06_olive_F", 0.04, "Rusty_srifle_EBR_F", 0.04, "Rusty_srifle_DMR_03_F", 0.04, "arifle_MXM_Black_F", 0.04, "arifle_MXM_F", 0.04, "Rusty_LMG_Zafir_F", 0.04];
		_opticsArraySelection = ["optic_Hamr", 0.04, "optic_Holosight_smg", 0.04, "optic_Holosight_smg_khk_F", 0.04, "optic_Holosight_smg_blk_F", 0.04, "optic_Holosight", 0.04, "optic_Holosight_lush_F", 0.04, "optic_Holosight_khk_F", 0.04, "optic_Holosight_blk_F", 0.04, "optic_Holosight_arid_F", 0.04, "optic_Arco", 0.04, "optic_DMS", 0.04];
		_muzzleArraySelection = ["ACE_muzzle_mzls_L", 0.04, "ACE_muzzle_mzls_H", 0.04, "ACE_muzzle_mzls_B", 0.04, "muzzle_snds_M", 0.04, "muzzle_snds_m_khk_F", 0.04, "muzzle_snds_m_snd_F", 0.04, "muzzle_snds_H", 0.04, "muzzle_snds_H_khk_F", 0.04, "muzzle_snds_H_snd_F", 0.04, "muzzle_snds_B", 0.04, "muzzle_snds_B_arid_F", 0.04, "muzzle_snds_B_khk_F", 0.04, "muzzle_snds_B_lush_F", 0.04, "muzzle_snds_B_snd_F", 0.04];
		if (round random 3 == 2) then {
			_backpackArraySelection = _backpackArraySelectionRare;
		};
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};

}; 
if (_faction == "DT") then {
	_headgearArraySelection = ["H_Cap_blu", 0.04, "H_Bandanna_blu", 0.04, "H_MilCap_blue", 0.04];
	_facewearArraySelection = ["G_Respirator_blue_F", 0.04, "rvg_respirator_1", 0.04, "rvg_respirator_4", 0.04, "L_shemagh_white", 0.04, "LBG_Shemagh_White", 0.04, "LCG_Shemagh_White", 0.04, "PU_shemagh_White", 0.04, "PU_shemagh_WhiteBLK", 0.04, "PU_shemagh_WhiteCLR", 0.04, "PU_shemagh_WhiteO", 0.04, "NeckTight_WhiteBLK", 0.04, "NeckTight_WhiteCLR", 0.04, "NeckTight_WhiteO", 0.04, "G_Blindfold_01_white_F", 0.04, "G_Respirator_white_F", 0.04, "rvg_respirator_2", 0.04];
	_vestArraySelection = ["V_DeckCrew_blue_F", 0.04, "V_DeckCrew_white_F", 0.04, "V_Chestrig_blk", 0.04, "V_LegStrapBag_black_F", 0.04, "V_LegStrapBag_coyote_F", 0.04, "V_LegStrapBag_olive_F", 0.04, "rvg_legstrapbag_1", 0.04, "rvg_legstrapbag_2", 0.04, "rvg_legstrapbag_4", 0.04, "rvg_legstrapbag_3", 0.04];
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
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 600 == 2) then {_nvgSelection = _rareNVG;};
	if (round random 170 == 2) then {_headgearArraySelection = _headgearArraySelectionRare;};
	if (round random 170 == 2) then {_vestArraySelection = _vestArraySelectionRare;};
	if (round random 160 == 2) then {_backpackArraySelection = _backpackArraySelectionRare;};
	if (round random 180 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 185 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 195 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 175 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (round random 350 == 2 && !_melee) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 15 == 3);
		primary = true;
		optics = (round random 3 == 3);
		muzzle = (round random 5 == 2);
		railAttachment = (round random 3 == 2);
		nvg = (round random 10 == 2);
		
		_facewearArraySelection = ["G_Blindfold_01_black_F", 1];
		_vestArraySelection = ["FRITH_ruin_vestia_lite_ghm", 0.04, "FRITH_ruin_vestia_lite_grn", 0.04, "FRITH_ruin_vestia_lite_ltr", 0.04, "FRITH_ruin_vestia_lite_nja", 0.04, "FRITH_ruin_vestia_lite_tar", 0.04, "FRITH_ruin_vestia_ghm", 0.04, "FRITH_ruin_vestia_grn", 0.04, "FRITH_ruin_vestia_ltr", 0.04, "FRITH_ruin_vestia_nja", 0.04, "FRITH_ruin_vestia_tar", 0.04];
		_rifleArraySelection = ["srifle_DMR_07_blk_F", 0.04, "srifle_DMR_07_ghex_F", 0.04, "srifle_DMR_07_hex_F", 0.04, "arifle_CTAR_blk_F", 0.04, "arifle_CTAR_ghex_F", 0.04, "arifle_CTAR_hex_F", 0.04, "arifle_CTAR_GL_blk_F", 0.04, "arifle_CTAR_GL_ghex_F", 0.04, "arifle_CTAR_GL_hex_F", 0.04, "arifle_CTARS_blk_F", 0.04, "arifle_CTARS_ghex_F", 0.04, "arifle_CTARS_hex_F", 0.04];
		_opticsArraySelection = ["optic_ACO_grn", 0.04, "optic_Aco", 0.04, "optic_ACO_grn_smg", 0.04, "optic_Aco_smg", 0.04, "optic_Holosight_arid_F", 0.04, "optic_Holosight_blk_F", 0.04, "optic_Holosight_khk_F", 0.04, "optic_Holosight_lush_F", 0.04, "optic_Holosight", 0.04, "optic_Holosight_smg_blk_F", 0.04, "optic_Holosight_smg_khk_F", 0.04, "optic_Holosight_smg", 0.04, "optic_MRCO", 0.04, "optic_KHS_old", 0.04];
		_muzzleArraySelection = ["muzzle_snds_58_blk_F", 0.04, "muzzle_snds_58_ghex_F", 0.04, "muzzle_snds_58_hex_F", 0.04];
		if (round random 3 == 2) then {
			_backpackArraySelection = _backpackArraySelectionRare;
		};
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};

};
if (_faction == "NH") then {
	_headgearArraySelection = ["H_Shemag_olive",.04,"H_Shemag_olive_hs",.04];
	_facewearArraySelection = ["G_Aviator", 0.5, "G_Combat", 0.5, "G_Combat_Goggles_tna_F", 0.5, "G_Lowprofile", 0.5, "G_Shades_Black", 0.5, "G_Shades_Blue", 0.5, "G_Shades_Green", 0.5, "G_Shades_Red", 0.5, "G_Spectacles", 0.5, "G_Sport_Red", 0.5, "G_Sport_Blackyellow", 0.5, "G_Sport_Checkered", 0.5, "G_Sport_Blackred", 0.5, "G_Sport_Greenblack", 0.5, "G_Balaclava_TI_G_blk_F", 0.5, "G_Balaclava_TI_G_tna_F", 0.5, "G_Tactical_Clear", 0.5, "G_Tactical_Black", 0.5];
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
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 170 == 2) then {_vestArraySelection = _vestArraySelectionRare;};
	if (round random 160 == 2) then {_backpackArraySelection = _backpackArraySelectionRare;};
	if (round random 180 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 185 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 195 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 175 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (round random 300 == 2 && !_melee) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 7 == 3);
		primary = true;
		optics = true;
		muzzle = (round random 3 == 2);
		railAttachment = (round random 3 == 2);
		nvg = (round random 10 == 2);
		
		_headgearArraySelection = ["FRITH_ruin_modhat_metgrn", 0.04, "FRITH_ruin_modhat_ltrpntgrn", 0.04, "FRITH_ruin_modhat_fabaaf", 0.04];
		_facewearArraySelection = ["L_Shemagh_OD", 0.04, "LBG_Shemagh_OD", 0.04, "LCG_Shemagh_OD", 0.04, "LOG_Shemagh_OD", 0.04, "PU_shemagh_OD", 0.04, "PU_shemagh_ODBLK", 0.04, "PU_shemagh_ODCLR", 0.04, "PU_shemagh_ODO", 0.04, "NeckTight_OD", 0.04, "NeckTight_ODBLK", 0.04, "NeckTight_ODCLR", 0.04, "NeckTight_ODO", 0.04];
		_vestArraySelection = ["FRITH_ruin_vestiaGL_tar", 0.04, "FRITH_ruin_vestiaGL_tartar", 0.04, "FRITH_ruin_vestiaGL_nja", 0.04, "FRITH_ruin_vestiaGL_njadpm", 0.04, "FRITH_ruin_vestiaGL_ltr", 0.04, "FRITH_ruin_vestiaGL_ltrmtp", 0.04, "FRITH_ruin_vestiaGL_grn", 0.04, "FRITH_ruin_vestiaGL_grnmtp", 0.04, "FRITH_ruin_vestiaGL_ghm", 0.04, "FRITH_ruin_vestiaGL_ghmchk", 0.04, "FRITH_ruin_vestia_tar", 0.04, "FRITH_ruin_vestia_nja", 0.04, "FRITH_ruin_vestia_ltr", 0.04, "FRITH_ruin_vestia_grn", 0.04, "FRITH_ruin_vestia_ghm", 0.04, "FRITH_ruin_vestia_lite_tar", 0.04, "FRITH_ruin_vestia_lite_nja", 0.04, "FRITH_ruin_vestia_lite_ltr", 0.04, "FRITH_ruin_vestia_lite_grn", 0.04, "FRITH_ruin_vestia_lite_ghm", 0.04];
		_rifleArraySelection = ["arifle_Mk20_plain_F", 0.04, "arifle_Mk20_F", 0.04, "arifle_Mk20_GL_plain_F", 0.04, "arifle_Mk20_GL_F", 0.04, "arifle_Mk20C_plain_F", 0.04, "arifle_Mk20C_F", 0.04, "LMG_03_F", 0.04, "srifle_DMR_06_olive_F", 0.04];
		_opticsArraySelection = ["optic_ACO_grn", 0.04, "optic_Aco", 0.04, "optic_ACO_grn_smg", 0.04, "optic_Aco_smg", 0.04, "optic_Arco_blk_F", 0.04, "optic_Holosight_arid_F", 0.04, "optic_Holosight_blk_F", 0.04, "optic_Holosight_khk_F", 0.04, "optic_Holosight_lush_F", 0.04, "optic_Holosight", 0.04, "optic_Holosight_smg_blk_F", 0.04, "optic_Holosight_smg_khk_F", 0.04, "optic_Holosight_smg", 0.04, "optic_MRCO", 0.04];
		_muzzleArraySelection = ["muzzle_snds_M", 0.04, "muzzle_snds_m_khk_F", 0.04, "muzzle_snds_m_snd_F", 0.04];
		if (round random 3 == 2) then {
			_backpackArraySelection = _backpackArraySelectionRare;
		};
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};
};
if (_faction == "PF") then {
	_headgearArraySelection = ["Human_Face_Mask", 0.04, "H_Cap_red", 0.04, "H_Cap_red", 0.04, "H_Cap_red", 0.04, "Axe_In_Head", 0.04];
	_uniformArraySelection = ["U_FRITH_RUIN_sdr_ltrred", 0.04, "U_FRITH_RUIN_sdr_ltrred_rs", 0.04];
	_meleeSelection = ["Bat_Spike", 0.04, "FireAxe", 0.04, "IceAxe", 0.04, "Knife_kukri", 0.04, "WBK_survival_weapon_2", 0.04, "WBK_survival_weapon_1", 0.04, "WBK_survival_weapon_4_r", 0.04, "WBK_survival_weapon_3_r", 0.04];
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
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 170 == 2) then {_headgearArraySelection = _headgearArraySelectionRare;};
	if (round random 170 == 2) then {_vestArraySelection = _vestArraySelectionRare;};
	if (round random 160 == 2) then {_backpackArraySelection = _backpackArraySelectionRare;};
	if (round random 180 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 185 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 195 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 175 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (round random 150 == 2 && !_melee) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 5 == 3);
		primary = true;
		optics = true;
		muzzle = (round random 3 == 2);
		railAttachment = (round random 3 == 2);
		nvg = (round random 5 == 2);
		
		_headgearArraySelection = ["FRITH_ruin_modhat_ltrpntred",1];
		_vestArraySelection = ["V_PlateCarrier1_blk", 0.04, "V_PlateCarrier2_blk", 0.04, "FRITH_ruin_vestia_lite_nja", 0.04, "FRITH_ruin_vestia_nja", 0.04, "FRITH_ruin_vestiaGL_nja", 0.04, "rvg_platecarrier_3", 0.04, "rvg_platecarrier_2", 0.04, "rvg_platecarrier_1", 0.04, "rvg_eodvest_3", 0.04];
		_rifleArraySelection = ["arifle_MX_Black_F", 0.04, "arifle_MX_GL_Black_F", 0.04, "arifle_MX_SW_Black_F", 0.04, "arifle_MXC_Black_F", 0.04, "arifle_MXM_Black_F", 0.04, "srifle_DMR_03_F", 0.04, "arifle_ARX_blk_F", 0.04, "Rusty_srifle_DMR_03_F", 0.04, "arifle_Katiba_F", 0.04, "arifle_Katiba_GL_F", 0.04, "arifle_Katiba_C_F", 0.04];
		_opticsArraySelection = ["optic_ACO_grn", 0.04, "optic_Aco", 0.04, "optic_ACO_grn_smg", 0.04, "optic_Aco_smg", 0.04, "optic_Arco_blk_F", 0.04, "optic_Holosight_blk_F", 0.04, "optic_Holosight_smg_blk_F", 0.04, "optic_MRCO", 0.04, "optic_Hamr", 0.04];
		_muzzleArraySelection = ["muzzle_snds_M", 0.04, "muzzle_snds_H", 0.04, "muzzle_snds_B", 0.04, "muzzle_snds_65_TI_blk_F", 0.04];
		if (round random 3 == 2) then {
			_backpackArraySelection = _backpackArraySelectionRare;
		};
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};
};
if (_faction == "RC") then {
	_headgearArraySelection = ["H_Bandanna_gry", 0.04, "H_Beret_blk", 0.04, "H_Cap_blk", 0.04, "H_Cap_Black_IDAP_F", 0.04, "H_Cap_usblack", 0.04, "FRITH_ruin_modhat_ltrpntblk", 0.04];
	_facewearArraySelection = ["G_AirPurifyingRespirator_02_black_F", 0.1, "G_Balaclava_blk", 0.1, "G_Bandanna_blk", 0.1, "G_Balaclava_TI_blk_F", 0.1, "G_Balaclava_TI_G_blk_F", 0.1, "Mask_M40", 0.1, "rvg_balaclava_2", 0.1, "rvg_balaclavaCombat_2", 0.1, "rvg_balaclavaLow_2", 0.1];
	_vestArraySelection = ["rvg_bandolier_1", 0.1, "rvg_legstrapbag_1", 0.1, "rvg_platecarrier_1", 0.1, "rvg_rangemaster_1", 0.1, "rvg_ravenvest_1", 0.1, "V_PlateCarrier1_blk", 0.1, "V_PlateCarrier2_blk", 0.1, "V_Chestrig_blk", 0.1, "V_BandollierB_blk", 0.1, "V_TacVest_blk", 0.1, "V_LegStrapBag_black_F", 0.1];
	_meleeSelection = ["WBK_survival_weapon_3_r", 0.05, "WBK_survival_weapon_3", 0.05, "WBK_survival_weapon_4_r", 0.05, "WBK_survival_weapon_4", 0.05, "UNSC_Knife_reversed", 0.05, "UNSC_Knife", 0.05, "Shovel_Russian_Rotated", 0.05, "Shovel_Russian", 0.05, "Police_Bat", 0.05, "Knife_kukri", 0.05, "Weap_melee_knife", 0.05, "Knife_m3", 0.05];
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
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 150 == 2) then {_headgearArraySelection = _headgearArraySelectionRare;};
	if (round random 150 == 2) then {_vestArraySelection = _vestArraySelectionRare;};
	if (round random 145 == 2) then {_backpackArraySelection = _backpackArraySelectionRare;};
	if (round random 150 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 155 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 165 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 150 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (round random 150 == 2 && !_melee) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 7 == 3);
		primary = true;
		optics = true;
		muzzle = (round random 3 == 2);
		railAttachment = (round random 3 == 2);
		nvg = (round random 5 == 2);
		
		_uniformArraySelection = ;
		_headgearArraySelection = ["FRITH_ruin_modhat_ltrpntblk",1];
		_vestArraySelection = ["U_O_FullGhillie_sard", 0.04, "U_FRITH_RUIN_sdr_ltrdrk_rs", 0.04, "U_FRITH_RUIN_sdr_ltrdrk_rs", 0.04, "U_FRITH_RUIN_sdr_ltrdrk", 0.04];
		_rifleArraySelection = ["srifle_DMR_04_F", 0.04, "srifle_DMR_05_blk_F", 0.04, "arifle_SPAR_01_blk_F", 0.04, "arifle_SPAR_01_GL_blk_F", 0.04, "arifle_SPAR_02_blk_F", 0.04, "arifle_SPAR_03_blk_F", 0.04, "MMG_02_black_F", 0.04, "arifle_MSBS65_black_F", 0.04, "arifle_MSBS65_GL_black_F", 0.04, "arifle_MSBS65_Mark_black_F", 0.04, "arifle_MSBS65_UBS_black_F", 0.04, "arifle_MX_Black_F", 0.04, "arifle_MX_GL_Black_F", 0.04, "arifle_MX_SW_Black_F", 0.04, "arifle_MXC_Black_F", 0.04, "arifle_MXM_Black_F", 0.04, "srifle_DMR_02_F", 0.04, "srifle_DMR_07_blk_F", 0.04, "arifle_CTAR_blk_F", 0.04, "arifle_CTAR_GL_blk_F", 0.04, "arifle_CTARS_blk_F", 0.04, "srifle_DMR_03_F", 0.04, "Rusty_MMG_02_black_F", 0.04, "LMG_Mk200_black_F", 0.04, "arifle_ARX_blk_F", 0.04];
		_opticsArraySelection = ["optic_Arco_blk_F", 0.04, "optic_Holosight_blk_F", 0.04, "optic_Holosight_smg_blk_F", 0.04, "optic_KHS_blk", 0.04, "optic_AMS", 0.04, "optic_ERCO_blk_F", 0.04];
		_muzzleArraySelection = ["muzzle_snds_338_black", 0.04, "muzzle_snds_93mmg", 0.04, "muzzle_snds_58_blk_F", 0.04, "muzzle_snds_65_TI_blk_F", 0.04, "muzzle_snds_M", 0.04, "muzzle_snds_570", 0.04, "muzzle_snds_H", 0.04, "muzzle_snds_B", 0.04];
		if (round random 3 == 2) then {
			_backpackArraySelection = _backpackArraySelectionRare;
		};
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};
};
if (_faction == "TRB") then {
	_facewearArraySelection = ["Mask_M40_OD", 0.04, "Mask_M40", 0.04, "Mask_M50", 0.04, "G_RegulatorMask_F", 0.04, "G_AirPurifyingRespirator_02_black_F", 0.04, "G_AirPurifyingRespirator_02_olive_F", 0.04, "G_AirPurifyingRespirator_02_sand_F", 0.04, "G_AirPurifyingRespirator_01_F", 0.04];
	_uniformArraySelection = ["U_O_R_Gorka_01_black_F", 0.04, "U_O_R_Gorka_01_F", 0.04, "U_O_R_Gorka_01_brown_F", 0.04, "U_O_R_Gorka_01_camo_F", 0.04];
	_rifleArraySelection = ["arifle_AKM_F", 0.06, "arifle_AKS_F", 0.15, "hgun_PDW2000_F", 0.04, "SMG_05_F", 0.04, "SMG_03C_black", 0.04, "SMG_03C_camo", 0.04, "SMG_03_black", 0.04, "SMG_03_camo", 0.04];
	_headgearArraySelection = ["H_Cap_oli", 0.24, "H_Cap_oli_hs", 0.14, "H_Cap_blk", 0.14, "H_Cap_blk_Raven", 0.14, "H_Cap_brn_SPECOPS", 0.14, "H_Cap_grn", 0.14];
	_meleeSelection = ["WBK_survival_weapon_3_r", 0.04, "WBK_survival_weapon_3", 0.04, "WBK_survival_weapon_4_r", 0.04, "WBK_survival_weapon_4", 0.04, "UNSC_Knife_reversed", 0.04, "UNSC_Knife", 0.04, "Shovel_Russian_Rotated", 0.04, "Shovel_Russian", 0.04, "Police_Bat", 0.04, "Knife_kukri", 0.04, "Weap_melee_knife", 0.04, "Knife_m3", 0.04, "Bat_Clear", 0.04, "Bat_Spike", 0.04, "Crowbar", 0.04, "WBK_survival_weapon_2", 0.04, "Sashka_Russian", 0.04, "WBK_SmallHammer", 0.04, "Axe", 0.04, "WBK_ww1_Club", 0.04];
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
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 160 == 2) then {_headgearArraySelection = _headgearArraySelectionRare;};
	if (round random 160 == 2) then {_vestArraySelection = _vestArraySelectionRare;};
	if (round random 150 == 2) then {_backpackArraySelection = _backpackArraySelectionRare;};
	if (round random 170 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 175 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 185 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 165 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (round random 150 == 2 && !_melee) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 7 == 3);
		primary = true;
		optics = true;
		muzzle = (round random 3 == 2);
		railAttachment = (round random 3 == 2);
		nvg = (round random 5 == 2);
		
		_headgearArraySelection = ["H_Cap_headphones",1];
		_vestArraySelection = ["V_CarrierRigKBT_01_light_EAF_F", 0.04, "V_CarrierRigKBT_01_light_Olive_F", 0.04, "V_CarrierRigKBT_01_EAF_F", 0.04, "V_CarrierRigKBT_01_Olive_F", 0.04];
		_rifleArraySelection = ["arifle_AK12_F", 0.04, "arifle_AK12_arid_F", 0.04, "arifle_AK12_lush_F", 0.04, "arifle_AK12_GL_F", 0.04, "arifle_AK12_GL_arid_F", 0.04, "arifle_AK12_GL_lush_F", 0.04, "arifle_AK12U_F", 0.04, "arifle_AK12U_arid_F", 0.04, "arifle_AK12U_lush_F", 0.04, "Rusty_srifle_DMR_04_F", 0.04, "arifle_RPK12_F", 0.04, "arifle_RPK12_arid_F", 0.04, "arifle_RPK12_lush_F", 0.04];
		_opticsArraySelection = ["optic_Holosight_blk_F", 0.04, "optic_MRCO", 0.04, "optic_Hamr", 0.04, "optic_SOS", 0.04, "optic_ACO_grn", 0.04];
		_muzzleArraySelection = ["muzzle_snds_B",1];
		if (round random 3 == 2) then {
			_backpackArraySelection = _backpackArraySelectionRare;
		};
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};
};
if (_faction == "US") then {
	_headgearArraySelection = ["H_HelmetB", 0.15, "H_HelmetB_black", 0.04, "H_HelmetB_camo", 0.04, "H_HelmetB_desert", 0.04, "H_HelmetB_grass", 0.04, "H_HelmetB_sand", 0.04, "H_HelmetB_snakeskin", 0.04, "H_HelmetSpecB", 0.04, "H_HelmetSpecB_blk", 0.04, "H_HelmetSpecB_paint2", 0.04, "H_HelmetSpecB_paint1", 0.04, "H_HelmetSpecB_sand", 0.04, "H_HelmetSpecB_snakeskin", 0.04, "H_HelmetB_light", 0.04, "H_HelmetB_light_black", 0.04, "H_HelmetB_light_desert", 0.04, "H_HelmetB_light_grass", 0.04, "H_HelmetB_light_sand", 0.04, "H_HelmetB_light_snakeskin", 0.04];
	_facewearArraySelection = ["Mask_M40",.04,"Mask_M50",.04];
	_uniformArraySelection = ["U_B_CBRN_Suit_01_MTP_F",1];
	_vestArraySelection = ["V_PlateCarrier1_rgr", 0.30, "V_PlateCarrier2_rgr", 0.04, "V_PlateCarrier_Kerry", 0.04, "V_PlateCarrierGL_rgr", 0.04, "V_PlateCarrierGL_mtp", 0.04, "V_Chestrig_rgr", 0.04];
	_backpackArraySelection = ["B_AssaultPack_mcamo", 0.04, "B_AssaultPack_cbr", 0.04, "B_AssaultPack_blk", 0.04, "B_AssaultPack_rgr", 0.04, "B_AssaultPack_wdl_F", 0.04, "B_AssaultPack_tna_F", 0.04, "B_FieldPack_cbr", 0.04, "B_FieldPack_blk", 0.04, "B_TacticalPack_mcamo", 0.04, "B_TacticalPack_blk", 0.04];
	_rifleArraySelection = ["arifle_SPAR_01_blk_F", 0.40, "arifle_SPAR_01_GL_blk_F", 0.04, "arifle_SPAR_02_blk_F", 0.04, "arifle_SPAR_03_blk_F", 0.04, "MMG_02_sand_F", 0.04, "srifle_EBR_F", 0.04, "arifle_MX_F", 0.04, "srifle_DMR_03_tan_F", 0.04];
	_handgunArraySelection = ["hgun_Pistol_heavy_01_F",1];
	_launcherArraySelection = ["launch_MRAWS_green_rail_F", 0.04, "launch_MRAWS_olive_rail_F", 0.04, "launch_MRAWS_sand_rail_F", 0.04, "launch_MRAWS_green_F", 0.04, "launch_MRAWS_olive_F", 0.04, "launch_MRAWS_sand_F", 0.04];
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
	
	if (round random 45 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 55 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 35 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (round random 60 == 2 && !_melee) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 5 == 3);
		primary = true;
		optics = true;
		muzzle = true;
		railAttachment = true;
		nvg = true;
		
		_uniformArraySelection = ["U_B_FullGhillie_sard",.4,"U_B_CombatUniform_mcam",.6];
		_headgearArraySelection = ["H_HelmetSpecB", 0.04, "H_HelmetSpecB_blk", 0.04, "H_HelmetSpecB_paint2", 0.04, "H_HelmetSpecB_paint1", 0.04, "H_HelmetSpecB_sand", 0.04, "H_HelmetSpecB_snakeskin", 0.04];
		_vestArraySelection = ["V_PlateCarrierSpec_mtp", 0.5, "V_PlateCarrierGL_mtp", 0.5];
		_rifleArraySelection = ["arifle_MX_Black_F", 0.33, "arifle_MXM_Black_F", 0.33, "arifle_MXC_Black_F", 0.33];
		_opticsArraySelection = ["optic_Hamr", 0.25, "optic_Holosight_smg_blk_F", 0.25, "optic_MRCO", 0.25, "optic_ERCO_blk_F", 0.25];
		_muzzleArraySelection = ["muzzle_snds_H",1];
		if (round random 3 == 2) then {
			_backpackArraySelection = _backpackArraySelectionRare;
		};
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};
};
if (_faction == "SU") then {
	_facewearArraySelection = ["Mask_M40_OD", 0.04, "Mask_M40", 0.04, "Mask_M50", 0.04, "G_RegulatorMask_F", 0.04, "G_AirPurifyingRespirator_02_black_F", 0.04, "G_AirPurifyingRespirator_02_olive_F", 0.04, "G_AirPurifyingRespirator_02_sand_F", 0.04, "G_AirPurifyingRespirator_01_F", 0.04];
	_uniformArraySelection = ["rvg_shirt_stripe", 0.04, "rvg_shirt_kabeiroi", 0.04, "rvg_shirt_check", 0.04, "rvg_shirt_bandit", 0.04, "rvg_retro_red", 0.04, "rvg_retro_kabeiroi", 0.04, "rvg_retro_grey", 0.04, "rvg_retro_green", 0.04, "rvg_retro_bandit", 0.04, "rvg_hoodie_red", 0.04, "rvg_hoodie_kabeiroi", 0.04, "rvg_hoodie_grey", 0.04, "rvg_hoodie_blue", 0.04, "rvg_hoodie_bandit", 0.04, "U_FRITH_RUIN_offtan", 0.04, "U_FRITH_RUIN_offgrn", 0.04, "U_FRITH_RUIN_offdpm", 0.04];
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
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 170 == 2) then {_headgearArraySelection = _headgearArraySelectionRare;};
	if (round random 170 == 2) then {_vestArraySelection = _vestArraySelectionRare;};
	if (round random 160 == 2) then {_backpackArraySelection = _backpackArraySelectionRare;};
	if (round random 180 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 185 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 195 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 175 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (round random 300 == 2 && !_melee) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 7 == 3);
		primary = true;
		optics = true;
		muzzle = (round random 3 == 2);
		railAttachment = (round random 3 == 2);
		nvg = (round random 10 == 2);
		
		_headgearArraySelection = ["H_HelmetB_light", 0.1667, "H_HelmetB_light_black", 0.1667, "H_HelmetB_light_desert", 0.1667, "H_HelmetB_light_grass", 0.1667, "H_HelmetB_light_sand", 0.1667, "H_HelmetB_light_snakeskin", 0.1667];
		_vestArraySelection = ["rvg_platecarrier_4", 0.25, "rvg_platecarrier_2", 0.25, "rvg_platecarrier_5", 0.25, "rvg_platecarrier_3", 0.25];
		_rifleArraySelection = ["arifle_AK12_F", 0.17, "arifle_Mk20_plain_F", 0.17, "arifle_Mk20_F", 0.17, "arifle_SPAR_01_blk_F", 0.17, "srifle_EBR_F", 0.17, "srifle_DMR_03_F", 0.17];
		_opticsArraySelection = ["optic_ERCO_blk_F", 0.2, "optic_SOS", 0.2, "optic_Hamr", 0.2, "optic_Holosight_smg_blk_F", 0.2, "optic_Holosight_blk_F", 0.2];
		_muzzleArraySelection = ["muzzle_snds_M", 0.33, "muzzle_snds_H", 0.33, "muzzle_snds_B", 0.33];
		if (round random 3 == 2) then {
			_backpackArraySelection = _backpackArraySelectionRare;
		};
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};
};
if (_faction == "RU") then {
	_headgearArraySelection = ["H_HelmetAggressor_F", 0.04, "H_HelmetAggressor_cover_F", 0.04, "H_HelmetAggressor_cover_taiga_F", 0.04, "H_Booniehat_taiga", 0.04];
	_facewearArraySelection = ["G_Balaclava_TI_G_tna_F", 0.04, "G_Balaclava_TI_tna_F", 0.04, "G_Balaclava_TI_G_blk_F", 0.04, "G_Balaclava_TI_blk_F", 0.04];
	_uniformArraySelection = ["U_O_R_Gorka_01_camo_F",1];
	_vestArraySelection = ["V_CarrierRigKBT_01_light_Olive_F", 0.04, "V_CarrierRigKBT_01_light_EAF_F", 0.04, "V_CarrierRigKBT_01_heavy_Olive_F", 0.04, "V_CarrierRigKBT_01_heavy_EAF_F", 0.04, "V_CarrierRigKBT_01_EAF_F", 0.04, "V_CarrierRigKBT_01_Olive_F", 0.04];
	_backpackArraySelection = ["B_AssaultPack_rgr",.75,"B_Kitbag_rgr",.25];
	_rifleArraySelection = ["arifle_AK12U_lush_F", 0.04, "arifle_AK12U_F", 0.04, "arifle_AK12_F", 0.04, "arifle_AK12_lush_F", 0.04, "arifle_RPK12_F", 0.04, "srifle_DMR_04_F", 0.04];
	_handgunArraySelection = ["hgun_Pistol_01_F", 0.04, "hgun_Rook40_F", 0.04];
	_launcherArraySelection = ["launch_RPG7_F", 0.04, "launch_RPG32_green_F", 0.04, "launch_RPG32_ghex_F", 0.04, "launch_RPG32_F", 0.04];
	_muzzleArraySelection = ["ACE_muzzle_mzls_B", 0.04, "muzzle_snds_B", 0.04, "muzzle_snds_B_arid_F", 0.04, "muzzle_snds_B_khk_F", 0.04, "muzzle_snds_B_lush_F", 0.04, "muzzle_snds_B_snd_F", 0.04];
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
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 145 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 140 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 135 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (round random 60 == 2 && !_melee) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 5 == 3);
		primary = true;
		optics = true;
		muzzle = true;
		railAttachment = true;
		nvg = true;
		
		_uniformArraySelection = ["U_O_FullGhillie_sard",1];
		_rifleArraySelection = ["arifle_AK12_lush_F", 0.125, "arifle_AK12U_lush_F", 0.125, "srifle_DMR_05_blk_F", 0.125, "srifle_GM6_camo_F", 0.125, "arifle_RPK12_lush_F", 0.2, "arifle_AK12_F", 1.0, "arifle_AK12_GL_lush_F", 0.125, "arifle_AK12U_F", 0.75];
		_opticsArraySelection = ["optic_Arco_blk_F", 0.167, "optic_Arco_lush_F", 0.167, "optic_Arco_AK_lush_F", 0.167, "optic_MRCO", 0.167, "optic_Hamr_khk_F", 0.167, "optic_ERCO_khk_F", 0.167];
		_muzzleArraySelection = ["muzzle_snds_B_lush_F", 0.333, "muzzle_snds_B_khk_F", 0.333, "muzzle_snds_L", 0.333];
		if (round random 3 == 2) then {
			_backpackArraySelection = _backpackArraySelectionRare;
		};
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};
};
if (_faction == "ROA") then {
	_facewearArraySelection = ["G_AirPurifyingRespirator_02_black_F", 0.04, "G_AirPurifyingRespirator_02_olive_F", 0.04, "G_AirPurifyingRespirator_02_sand_F", 0.04, "G_AirPurifyingRespirator_01_F", 0.04, "G_Balaclava_blk", 0.04, "G_Balaclava_combat", 0.04, "G_Balaclava_lowprofile", 0.04, "G_Balaclava_oli", 0.04, "G_Bandanna_aviator", 0.04, "G_Bandanna_beast", 0.04, "G_Bandanna_blk", 0.04, "G_Bandanna_khk", 0.04, "G_Bandanna_oli", 0.04, "G_Bandanna_shades", 0.04, "G_Bandanna_sport", 0.04, "Mask_M40", 0.04, "Mask_M40_OD", 0.04, "Mask_M50", 0.04, "G_RegulatorMask_F", 0.04, "G_Balaclava_TI_blk_F", 0.04, "G_Balaclava_TI_G_blk_F", 0.04, "G_Balaclava_TI_tna_F", 0.04, "G_Balaclava_TI_G_tna_F", 0.04];
	_uniformArraySelection = ["rvg_independant", 0.30, "rvg_independant_1", 0.30, "rvg_survivor", 0.04, "rvg_survivor_1", 0.04];
	_vestArraySelection = ["V_TacVest_blk", 0.04, "V_TacVest_brn", 0.04, "V_TacVest_camo", 0.04, "V_TacVest_khk", 0.04, "V_TacVest_oli", 0.04, "V_TacVest_blk_POLICE", 0.04, "V_I_G_resistanceLeader_F", 0.04, "V_TacChestrig_oli_F", 0.04, "V_TacChestrig_grn_F", 0.40, "V_TacChestrig_cbr_F", 0.40, "rvg_tacvest_3", 0.04, "rvg_tacvest_1", 0.04, "rvg_tacvest_2", 0.04, "rvg_tacvest_4", 0.04, "rvg_chestrig", 0.40];
	_rifleArraySelection = ["arifle_SPAR_01_blk_F", 0.04, "arifle_SPAR_01_khk_F", 0.04, "arifle_SPAR_01_snd_F", 0.04, "arifle_SPAR_01_GL_blk_F", 0.04, "arifle_SPAR_01_GL_khk_F", 0.04, "arifle_SPAR_01_GL_snd_F", 0.04, "arifle_SPAR_02_blk_F", 0.04, "arifle_SPAR_02_khk_F", 0.04, "arifle_SPAR_02_snd_F", 0.04, "arifle_SPAR_03_blk_F", 0.04, "arifle_SPAR_03_khk_F", 0.04, "arifle_SPAR_03_snd_F", 0.04, "arifle_MX_SW_Black_F", 0.15, "arifle_MX_Black_F", 0.50, "arifle_MXM_Black_F", 0.15, "srifle_DMR_03_F", 0.04, "srifle_DMR_03_multicam_F", 0.04, "SMG_01_F", 0.04];
	_headgearArraySelection = ["H_Cap_blk", 0.04, "H_Cap_oli", 0.04, "H_Cap_oli_hs", 0.04, "H_Cap_tan", 0.04, "H_Cap_tan_specops_US", 0.04, "H_Cap_blk_Raven", 0.04, "H_MilCap_grn", 0.04, "H_MilCap_gry", 0.04, "H_MilCap_mcamo", 0.04, "H_MilCap_taiga", 0.04, "H_MilCap_wdl", 0.04, "H_MilCap_eaf", 0.04, "H_Cap_headphones", 0.04];
	_facewearArraySelection = ["G_Balaclava_TI_blk_F", 0.04, "G_Balaclava_TI_G_blk_F", 0.04, "G_Balaclava_TI_tna_F", 0.04, "G_Balaclava_TI_G_tna_F", 0.04, "Mask_M50", 0.04, "Mask_M40_OD", 0.04, "Mask_M40", 0.04, "G_Balaclava_lowprofile", 0.04, "G_Balaclava_oli", 0.04, "G_Balaclava_Flecktarn", 0.04, "G_Balaclava_blk", 0.04, "G_AirPurifyingRespirator_01_F", 0.04, "G_AirPurifyingRespirator_02_sand_F", 0.04, "G_AirPurifyingRespirator_02_olive_F", 0.04, "G_AirPurifyingRespirator_02_black_F", 0.04, "G_Aviator", 0.04];
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
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 170 == 2) then {_headgearArraySelection = _headgearArraySelectionRare;};
	if (round random 170 == 2) then {_vestArraySelection = _vestArraySelectionRare;};
	if (round random 160 == 2) then {_backpackArraySelection = _backpackArraySelectionRare;};
	if (round random 180 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 185 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 195 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 175 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (round random 100 == 2 && !_melee) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 7 == 3);
		primary = true;
		optics = true;
		muzzle = (round random 3 == 2);
		railAttachment = (round random 3 == 2);
		nvg = (round random 5 == 2);
		
		_headgearArraySelection = ["H_HelmetB", 0.083, "H_HelmetB_black", 0.083, "H_HelmetB_camo", 0.083, "H_HelmetB_desert", 0.083, "H_HelmetB_grass", 0.083, "H_HelmetB_sand", 0.083, "H_HelmetB_snakeskin", 0.083, "H_HelmetSpecB", 0.083, "H_HelmetSpecB_blk", 0.083, "H_HelmetSpecB_paint2", 0.083, "H_HelmetSpecB_paint1", 0.083, "H_HelmetSpecB_sand", 0.083, "H_HelmetSpecB_snakeskin", 0.083];
		_vestArraySelection = ["V_PlateCarrier1_rgr", 0.167, "V_PlateCarrier1_rgr_noflag_F", 0.167, "V_PlateCarrier1_wdl", 0.167, "V_PlateCarrier2_rgr", 0.167, "V_PlateCarrier2_rgr_noflag_F", 0.167, "V_PlateCarrier2_wdl", 0.167];
		_rifleArraySelection = ["arifle_SPAR_01_blk_F", 1.5, "arifle_SPAR_02_blk_F", 0.5, "arifle_SPAR_03_blk_F", 0.5, "srifle_DMR_02_F", 0.167, "srifle_DMR_03_F", 0.167, "LMG_03_F", 0.167];
		_opticsArraySelection = ["optic_Holosight_blk_F", 0.2, "optic_Holosight_smg_blk_F", 0.2, "optic_MRCO", 0.2, "optic_Hamr", 0.2, "optic_AMS", 0.2];
		_muzzleArraySelection = ["muzzle_snds_M",1];
		if (round random 3 == 2) then {
			_backpackArraySelection = _backpackArraySelectionRare;
		};
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};
};
if (_faction == "PMC") then {
	_headgearArraySelection = ["H_Cap_headphones", 0.04, "H_MilCap_eaf", 0.04, "H_MilCap_taiga", 0.04, "H_MilCap_wdl", 0.04, "H_HelmetSpecB_paint1", 0.04, "H_HelmetB_camo", 0.04, "H_Cap_blk_Raven", 0.04, "H_Cap_oli", 0.04, "H_Cap_oli_hs", 0.04, "H_Booniehat_tna_F", 0.04, "H_Booniehat_taiga", 0.04, "H_Booniehat_wdl", 0.04, "H_Booniehat_eaf", 0.04];
	_facewearArraySelection = ["G_Balaclava_TI_G_tna_F", 0.04, "G_Balaclava_TI_tna_F", 0.04, "G_Balaclava_TI_G_blk_F", 0.04, "G_Balaclava_TI_blk_F", 0.04, "Mask_M40_OD", 0.04, "G_AirPurifyingRespirator_02_olive_F", 0.04, "G_Balaclava_oli", 0.04];
	_uniformArraySelection = ["U_B_CTRG_1", 0.04, "U_B_CTRG_3", 0.04, "U_B_CTRG_2", 0.04, "U_B_CTRG_Soldier_F", 0.04, "U_B_CTRG_Soldier_Arid_F", 0.04, "U_B_CTRG_Soldier_3_F", 0.04, "U_B_CTRG_Soldier_3_Arid_F", 0.04, "U_B_CTRG_Soldier_2_F", 0.04, "U_B_CTRG_Soldier_2_Arid_F", 0.04, "U_B_CTRG_Soldier_urb_1_F", 0.04, "U_B_CTRG_Soldier_urb_3_F", 0.04, "U_B_CTRG_Soldier_urb_2_F", 0.04, "U_B_FullGhillie_sard", 0.04];
	_vestArraySelection = ["V_TacChestrig_oli_F", 0.04, "V_TacChestrig_grn_F", 0.04, "rvg_rangemaster_2", 0.04, "rvg_rangemaster_3", 0.04, "V_CarrierRigKBT_01_light_Olive_F", 0.04, "V_HarnessO_brn", 0.04, "V_HarnessO_ghex_F", 0.04, "V_HarnessOGL_ghex_F", 0.04, "V_SmershVest_01_radio_F", 0.04, "V_SmershVest_01_F", 0.04, "V_Chestrig_rgr", 0.04, "V_Chestrig_blk", 0.04, "V_PlateCarrier2_tna_F", 0.04, "V_PlateCarrier1_tna_F", 0.04];
	_rifleArraySelection = ["arifle_AK12_F", 0.50, "arifle_AK12_GL_F", 0.04, "arifle_AK12U_F", 0.04, "arifle_AKM_F", 0.40, "arifle_AKS_F", 0.40, "srifle_DMR_04_F", 0.02, "srifle_DMR_04_Tan_F", 0.02, "hgun_PDW2000_F", 0.04, "arifle_RPK12_F", 0.10, "srifle_DMR_01_F", 0.02];
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
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 170 == 2) then {_headgearArraySelection = _headgearArraySelectionRare;};
	if (round random 170 == 2) then {_vestArraySelection = _vestArraySelectionRare;};
	if (round random 160 == 2) then {_backpackArraySelection = _backpackArraySelectionRare;};
	if (round random 180 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 185 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 195 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 175 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (round random 100 == 2 && !_melee) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 7 == 3);
		primary = true;
		optics = true;
		muzzle = true;
		railAttachment = true;
		nvg = (round random 5 == 2);
		
		_headgearArraySelection = ["H_HelmetAggressor_F", 0.33, "H_HelmetAggressor_cover_F", 0.33, "H_HelmetAggressor_cover_taiga_F", 0.33];
		_vestArraySelection = ["V_PlateCarrierGL_rgr", 0.125, "V_PlateCarrier1_rgr", 0.125, "V_PlateCarrier1_rgr_noflag_F", 0.125, "V_PlateCarrier1_wdl", 0.125, "V_PlateCarrier2_rgr", 0.125, "V_PlateCarrier2_rgr_noflag_F", 0.125, "V_PlateCarrier2_wdl", 0.125, "V_PlateCarrierSpec_rgr", 0.125];
		_rifleArraySelection = ["arifle_AK12U_lush_F", 0.333, "arifle_AK12_GL_lush_F", 0.333, "arifle_AK12_lush_F", 0.333];
		_opticsArraySelection = ["optic_Holosight_khk_F", 0.2, "optic_Holosight_smg_khk_F", 0.2, "optic_Holosight_lush_F", 0.2, "optic_Arco_lush_F", 0.2, "optic_MRCO", 0.2];
		_muzzleArraySelection = ["muzzle_snds_B", 0.33, "muzzle_snds_B_khk_F", 0.33, "muzzle_snds_B_lush_F", 0.33];
		if (round random 3 == 2) then {
			_backpackArraySelection = _backpackArraySelectionRare;
		};
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};
};
if (_faction == "WO") then {
	_headgearArraySelection = ["H_Bandanna_gry", 0.04, "H_PASGT_basic_black_F", 0.04, "H_Beret_blk", 0.04, "H_Cap_blk", 0.04, "rvg_presshelmet_1", 0.04, "rvg_racing_1", 0.04, "H_HelmetB_light_black", 0.04, "FRITH_ruin_modhat_ltrpntblk", 0.04];
	_facewearArraySelection = ["G_Balaclava_TI_blk_F", 0.04, "G_Balaclava_TI_G_blk_F", 0.04, "G_Balaclava_TI_tna_F", 0.04, "G_Balaclava_TI_G_tna_F", 0.04, "Mask_M50", 0.04, "Mask_M40_OD", 0.04, "Mask_M40", 0.04, "G_Balaclava_lowprofile", 0.04, "G_Balaclava_oli", 0.04, "G_Balaclava_Flecktarn", 0.04, "G_Balaclava_blk", 0.04, "G_AirPurifyingRespirator_01_F", 0.04, "G_AirPurifyingRespirator_02_sand_F", 0.04, "G_AirPurifyingRespirator_02_olive_F", 0.04, "G_AirPurifyingRespirator_02_black_F", 0.04, "G_Aviator", 0.04];
	_uniformArraySelection = ["rvg_bandit", 0.04, "rvg_bandit_1", 0.04];
	_vestArraySelection = ["V_PlateCarrier1_blk", 0.04, "V_Chestrig_blk", 0.04, "V_LegStrapBag_black_F", 0.04, "V_BandollierB_blk", 0.04, "V_TacVest_blk", 0.04, "rvg_bandolier_1", 0.04, "rvg_legstrapbag_1", 0.04, "rvg_rangemaster_1", 0.04, "rvg_ravenvest_1", 0.04];
	_rifleArraySelection = ["arifle_Mk20_plain_F", 0.02,"arifle_Mk20_GL_plain_F", 0.01,"arifle_Mk20C_plain_F", 0.03,"arifle_MSBS65_sand_F", 0.25,"arifle_MSBS65_GL_sand_F", 0.01,"arifle_MSBS65_Mark_sand_F", 0.01,"arifle_MSBS65_UBS_sand_F", 0.01,"LMG_Mk200_F", 0.01];
	_backpackArraySelection = ["B_ViperLightHarness_blk_F", 0.04, "B_ViperHarness_blk_F", 0.04, "B_TacticalPack_blk", 0.04, "B_LegStrapBag_black_F", 0.04, "B_FieldPack_blk", 0.04, "B_AssaultPack_blk", 0.04, "B_CivilianBackpack_01_Everyday_Black_F", 0.04];
	_meleeSelection = ["WBK_survival_weapon_4", 0.04, "WBK_survival_weapon_4_r", 0.04, "Shovel_Russian", 0.04, "Shovel_Russian_Rotated", 0.04, "Police_Bat", 0.04, "Knife_m3", 0.04, "Knife_kukri", 0.04, "Weap_melee_knife", 0.04];
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
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 170 == 2) then {_headgearArraySelection = _headgearArraySelectionRare;};
	if (round random 170 == 2) then {_vestArraySelection = _vestArraySelectionRare;};
	if (round random 160 == 2) then {_backpackArraySelection = _backpackArraySelectionRare;};
	if (round random 180 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 185 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 195 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 175 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (round random 150 == 2 && !_melee) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 7 == 3);
		primary = true;
		optics = true;
		muzzle = (round random 3 == 2);
		railAttachment = (round random 3 == 2);
		nvg = (round random 5 == 2);
		
		_headgearArraySelection = ["rvg_presshelmet_1",1];
		_vestArraySelection = ["FRITH_ruin_vestiaGL_nja", 0.167, "FRITH_ruin_vestia_nja", 0.167, "FRITH_ruin_vestia_lite_nja", 0.167, "V_PlateCarrierSpec_blk", 0.167, "V_PlateCarrier2_blk", 0.167, "V_PlateCarrierGL_blk", 0.167];
		_rifleArraySelection = ["arifle_MSBS65_UBS_black_F", 0.1,"arifle_MSBS65_Mark_black_F", 0.1,"arifle_MSBS65_GL_black_F", 0.1,"arifle_MSBS65_black_F", 0.50,"srifle_DMR_02_F", 0.01,"srifle_DMR_03_F", 0.01,"srifle_LRR_F", 0.01];
		_opticsArraySelection = ["optic_Arco_AK_blk_F", 0.2, "optic_Holosight_smg_blk_F", 0.2, "optic_Holosight_blk_F", 0.2, "optic_MRCO", 0.2, "optic_Hamr", 0.2];
		_muzzleArraySelection = ["muzzle_snds_M", 0.33, "muzzle_snds_H", 0.33, "muzzle_snds_B", 0.33];
		if (round random 3 == 2) then {
			_backpackArraySelection = _backpackArraySelectionRare;
		};
		if (round random 3 == 2) then {
			_railArraySelection = _railArraySelectionRare;
		};
	};
};
if (_faction == "ALF") then {
	_uniformArraySelection = ["U_FRITH_RUIN_coffdpm", 0.04, "U_FRITH_RUIN_coffgrn", 0.04, "U_FRITH_RUIN_cofftan", 0.04];
	_vestArraySelection = ["V_PlateCarrier1_rgr", 0.04, "V_PlateCarrier1_rgr_noflag_F", 0.04, "V_PlateCarrier2_rgr", 0.04, "V_PlateCarrier2_rgr_noflag_F", 0.04, "V_Chestrig_blk", 0.04, "V_Chestrig_rgr", 0.04, "V_Chestrig_khk", 0.04, "V_Chestrig_oli", 0.04, "rvg_rangemaster_1", 0.04, "rvg_rangemaster_3", 0.04, "rvg_rangemaster_4", 0.04, "rvg_rangemaster_2", 0.04, "V_TacChestrig_cbr_F", 0.04, "V_TacChestrig_grn_F", 0.04, "V_TacChestrig_oli_F", 0.04, "V_TacVest_camo", 0.04, "V_TacVest_oli", 0.04, "V_TacVest_khk", 0.04, "V_I_G_resistanceLeader_F", 0.04, "V_PlateCarrier_Kerry", 0.04];
	_rifleArraySelection = ["hgun_PDW2000_F", 0.04, "SMG_05_F", 0.04, "SMG_03C_black", 0.04, "SMG_03C_camo", 0.04, "SMG_02_F", 0.04, "SMG_01_F", 0.04, "arifle_SPAR_01_blk_F", 0.15, "arifle_SPAR_01_GL_blk_F", 0.04, "arifle_SPAR_02_blk_F", 0.04, "arifle_SPAR_03_blk_F", 0.04, "arifle_Mk20_F", 1.0, "arifle_Mk20C_F", 0.04, "srifle_DMR_06_camo_F", 0.04, "SMG_03_black", 0.04, "SMG_03_camo", 0.04, "srifle_DMR_03_F", 0.04, "srifle_DMR_03_woodland_F", 0.04];
	_headgearArraySelection = ["H_Cap_blk", 0.04, "H_Beret_blk", 0.04, "H_Cap_usblack", 0.04, "H_Watchcap_cbr", 0.04, "H_Cap_tan", 0.04, "H_ShemagOpen_tan", 0.04, "H_Cap_oli", 0.04, "H_Cap_tan_specops_US", 0.04, "H_Cap_blk_Raven", 0.04, "H_Cap_oli_hs", 0.04, "H_MilCap_grn", 0.04, "H_MilCap_gry", 0.04];
	_facewearArraySelection = ["NeckTight_TanO", 0.04, "NeckTight_TanCLR", 0.04, "NeckTight_TanBLK", 0.04, "NeckTight_Tan", 0.04, "PU_shemagh_TanO", 0.04, "PU_shemagh_TanCLR", 0.04, "PU_shemagh_Tan", 0.04, "LOG_Shemagh_Tan", 0.04, "LCG_Shemagh_Tan", 0.04, "L_Shemagh_Tan", 0.04, "LBG_Shemagh_Tan", 0.04, "PU_shemagh_TanBLK", 0.04];
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
	
	rndShitAmount = round random [1, 2, 5];
	if (round random 170 == 2) then {_headgearArraySelection = _headgearArraySelectionRare;};
	if (round random 180 == 2) then {_rifleArraySelection = _rifleArraySelectionRare;};
	if (round random 185 == 2) then {_opticsArraySelection = _opticsArraySelectionRare;};
	if (round random 195 == 2) then {_muzzleArraySelection = _muzzleArraySelectionRare;};
	if (round random 175 == 2) then {_railArraySelection = _railArraySelectionRare;};
	
	if (round random 100 == 2 && !_melee) then { // how rare a special unit spawns 
		firstAid = true;
		water = true;
		food = true;
		money = true;
		rocket = (round random 7 == 3);
		primary = true;
		optics = true;
		muzzle = true;
		railAttachment = (round random 3 == 2);
		nvg = (round random 5 == 2);
		
		_uniformArraySelection = ["U_B_FullGhillie_sard", 0.33, "U_B_GhillieSuit", 0.33, "U_I_GhillieSuit", 0.33];
		_headgearArraySelection = ["H_HelmetB_camo", 0.125, "H_HelmetB", 0.125, "H_HelmetB_black", 0.125, "H_HelmetB_desert", 0.125, "H_HelmetB_grass", 0.125, "H_HelmetB_sand", 0.125, "H_HelmetB_snakeskin", 0.125, "H_HelmetB_tna_F", 0.125, "H_HelmetB_plain_wdl", 0.125];
		_vestArraySelection = ["V_PlateCarrier2_wdl", 0.25, "V_PlateCarrier1_wdl", 0.25, "V_PlateCarrierGL_wdl", 0.25, "V_PlateCarrierSpec_wdl", 0.25];
		_rifleArraySelection = ["arifle_SPAR_01_blk_F", 0.75, "arifle_SPAR_01_khk_F", 0.75, "arifle_SPAR_01_GL_blk_F", 0.125, "arifle_SPAR_01_GL_khk_F", 0.125, "arifle_SPAR_02_blk_F", 0.125, "arifle_SPAR_02_khk_F", 0.125, "arifle_SPAR_03_blk_F", 0.125, "arifle_SPAR_03_khk_F", 0.125];
		_opticsArraySelection = ["optic_ERCO_khk_F", 0.5, "optic_Hamr_khk_F", 0.5];
		_muzzleArraySelection = ["muzzle_snds_M", 0.5, "muzzle_snds_m_khk_F", 0.5];
		if (round random 3 == 2) then {
			_backpackArraySelection = _backpackArraySelectionRare;
		};
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
_backpack = _backpackArraySelection call BIS_fnc_selectRandomWeighted;
_handgun = _handgunArraySelection call BIS_fnc_selectRandomWeighted;
_launcher = _launcherArraySelection call BIS_fnc_selectRandomWeighted;
		
_unit addHeadgear _headgear;
_unit addGoggles _facewear;
_unit forceAddUniform _uniform;
_unit addVest _vest;
_unit addBackpack _backpack;

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

if (money) then {
	for "_j" from 1 to (round (random 5)) do {
		_unit addItemToVest "rvg_money";
		sleep .01;
	};
};

if (nvg) then {
	_unit linkItem (_nvgSelection call BIS_fnc_selectRandomWeighted);
};

if (_primaryOverride) then {
	primary = true;
};

if (_melee == false) then {
	if (primary) then {
		[_unit, _rifle, (round (random 7))+2] call BIS_fnc_addWeapon; 
		if (railAttachment) then {
			_unit addPrimaryWeaponItem (_railArraySelection call BIS_fnc_selectRandomWeighted);
		} else {
			_unit addPrimaryWeaponItem "acc_flashlight";
		};
	};
	//Adding sidearm
	[_unit, _handgun, (round (random 5))+2] call BIS_fnc_addWeapon;
	_unit addHandgunItem "acc_flashlight_pistol";
} else {
	_handgun = _meleeSelection call BIS_fnc_selectRandomWeighted;
	[_unit, _handgun, 0] call BIS_fnc_addWeapon;
};

if (optics) then {
	_unit addPrimaryWeaponItem (_opticsArraySelection call BIS_fnc_selectRandomWeighted);
};

if (muzzle) then {
	_unit addPrimaryWeaponItem (_muzzleArraySelection call BIS_fnc_selectRandomWeighted);
};

if (rocket) then {
	[_unit, _launcher, 3] call BIS_fnc_addWeapon;
};

if (muzzle) then {
	_unit addHandgunItem (_muzzleArraySelection call BIS_fnc_selectRandomWeighted);
};

for "_i" from 1 to rndShitAmount do {
	_unit addItemToBackpack (_rndShitArraySelection call BIS_fnc_selectRandomWeighted);
	sleep .01;
};