params ["_container"];

//Selling Items in _Crate
_containerSellAction = _container addAction ["Sell Items in Crate", FN_SellAction_Crate,[],1.5,true,false,"","true",3];

//purchasing
_containerAction = _container addAction ["--------------PURCHASING MENU--------------",{},[],1.5,true,false,"","true",3];
_clothingAction = _container addAction ["ACCESS CLOTHING CATALOGUE", FN_clothing_Crate,[],1.5,true,false,"","true",3];
FN_clothing_Crate = {
	params ["_container", "_caller", "_actionId"];
	containerAction1 = _container addAction ["Purchase Hot Weather Clothing: $5", FN_PurchaseItem_Crate, ["U_FRITH_RUIN_SDR_Tshirt_blk_cyp",5],1.5,true,false,"","true",3];
	containerAction2 = _container addAction ["Purchase Moderate Weather Clothing: $10", FN_PurchaseItem_Crate, ["U_FRITH_RUIN_sdr_fabtan",10],1.5,true,false,"","true",3];
	containerAction3 = _container addAction ["Purchase CBRN Suit: $100", FN_PurchaseItem_Crate, ["U_I_CBRN_Suit_01_AAF_F",100],1.5,true,false,"","true",3];
	containerAction4 = _container addAction ["Purchase Ghille Suit: $100", FN_PurchaseItem_Crate, ["U_B_FullGhillie_sard",100],1.5,true,false,"","true",3];
	containerAction5 = _container addAction ["Purchase Cold Weather Granit Suit: $100", FN_PurchaseItem_Crate, ["U_O_R_Gorka_01_brown_F",100],1.5,true,false,"","true",3];
	containerAction6 = _container addAction ["Purchase Cold Weather Shemagh: $10", FN_PurchaseItem_Crate, ["H_ShemagOpen_tan",10],1.5,true,false,"","true",3];
	containerAction7 = _container addAction ["Purchase Light Combat Helmet: $25", FN_PurchaseItem_Crate, ["H_HelmetB_light",25],1.5,true,false,"","true",3];
	containerAction8 = _container addAction ["Purchase Combat Helmet: $50", FN_PurchaseItem_Crate, ["H_HelmetB",50],1.5,true,false,"","true",3];
	containerAction9 = _container addAction ["Purchase Enhanced Combat Helmet: $300", FN_PurchaseItem_Crate, ["H_HelmetSpecB",300],1.5,true,false,"","true",3];
	containerAction10 = _container addAction ["Purchase Special Purpose Helmet: $4,000", FN_PurchaseItem_Crate, ["H_HelmetO_ViperSP_hex_F",4000],1.5,true,false,"","true",3];
	containerAction11 = _container addAction ["Purchase Cold Weather Balaclava: $10", FN_PurchaseItem_Crate, ["G_Balaclava_blk",10],1.5,true,false,"","true",3];
	containerAction12 = _container addAction ["Purchase Gas Mask: $20", FN_PurchaseItem_Crate, ["G_RegulatorMask_F",20],1.5,true,false,"","true",3];
};

_containerAction = _container addAction ["ACCESS CHEST RIG CATALOGUE", FN_chestRig_Crate,[],1.5,true,false,"","true",3];
FN_chestRig_Crate = {
	params ["_container", "_caller", "_actionId"];
	_containerAction = _container addAction ["Purchase Recce Rig(No Armor): $10", FN_PurchaseItem_Crate, ["V_SmershVest_01_radio_F",10],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase Tactical Vest(Level 1 Armor): $25", FN_PurchaseItem_Crate, ["rvg_tacvest_2",25],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase Carrier Lite (Level 3 Armor): $100", FN_PurchaseItem_Crate, ["V_PlateCarrier1_rgr",100],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase Carrier Rig (Level 4 Armor): $300", FN_PurchaseItem_Crate, ["V_PlateCarrier2_rgr",300],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase Carrier Special Rig: $500", FN_PurchaseItem_Crate, ["V_PlateCarrierSpec_blk",500],1.5,true,false,"","true",3];
};
_containerAction = _container addAction ["ACCESS BACKPACK CATALOGUE", FN_backPack_Crate,[],1.5,true,false,"","true",3];
FN_backPack_Crate = {
	params ["_container", "_caller", "_actionId"];
	_containerAction = _container addAction ["Purchase Messenger Bag: $3", FN_PurchaseItem_Crate, ["B_Messenger_Black_F",3],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase Leg Strap Pack: $5", FN_PurchaseItem_Crate, ["rvg_legstrappack_1",5],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase Assault Pack: $15", FN_PurchaseItem_Crate, ["B_AssaultPack_cbr",15],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase Field Pack: $20", FN_PurchaseItem_Crate, ["B_FieldPack_cbr",20],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase Tactical Backpack: $30", FN_PurchaseItem_Crate, ["rvg_tactical",30],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase Viper Harness Light: $40", FN_PurchaseItem_Crate, ["B_ViperLightHarness_khk_F",40],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase Kitbag: $50", FN_PurchaseItem_Crate, ["B_Kitbag_cbr",50],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase Viper Harness: $75", FN_PurchaseItem_Crate, ["B_ViperHarness_khk_F",75],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase Carryall: $100", FN_PurchaseItem_Crate, ["rvg_carryall_1",100],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase Radio Pack: $150", FN_PurchaseItem_Crate, ["TFAR_rt1523g_rhs",150],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase Bergen: $300", FN_PurchaseItem_Crate, ["rvg_bergan",300],1.5,true,false,"","true",3];
};
_containerAction = _container addAction ["ACCESS PRIMARY WEAPON CATALOGUE", FN_primary_Crate,[],1.5,true,false,"","true",3];
FN_primary_Crate = {
	params ["_container", "_caller", "_actionId"];
	_containerAction = _container addAction ["Purchase AK-15: $350", FN_PurchaseItem_Crate, ["arifle_AK12_F",350],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase AKM: $175", FN_PurchaseItem_Crate, ["arifle_AKM_F",175],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase AKS-74U: $80", FN_PurchaseItem_Crate, ["arifle_AKS_F",80],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase ASP-1 KIR: $750", FN_PurchaseItem_Crate, ["srifle_DMR_04_F",750],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase CPW: $45", FN_PurchaseItem_Crate, ["hgun_PDW2000_F",45],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase CTAR-21: $175", FN_PurchaseItem_Crate, ["arifle_TRG20_F",175],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase CYRUS: $1,250", FN_PurchaseItem_Crate, ["Rusty_DMR_05_base_F",1250],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase F2000: $275", FN_PurchaseItem_Crate, ["arifle_Mk20_F",275],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase F2000 TACTICAL: $250", FN_PurchaseItem_Crate, ["arifle_Mk20C_F",250],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase FN MINIMI SPW: $500", FN_PurchaseItem_Crate, ["LMG_03_F",500],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase GM6 LYNX: $1,750", FN_PurchaseItem_Crate, ["srifle_GM6_F",1750],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase HK121: $1,500", FN_PurchaseItem_Crate, ["MMG_01_tan_F",1500],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase HK416A5 11IN: $285", FN_PurchaseItem_Crate, ["arifle_SPAR_01_blk_F",285],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase HK416A5 14.5IN: $300", FN_PurchaseItem_Crate, ["arifle_SPAR_02_blk_F",300],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase HK417A5 20IN: $500", FN_PurchaseItem_Crate, ["arifle_SPAR_03_blk_F",500],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase KH2002 SAMA: $400", FN_PurchaseItem_Crate, ["arifle_Katiba_F",400],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase KH2002C SAMA: $380", FN_PurchaseItem_Crate, ["arifle_Katiba_C_F",380],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase KOZLICE 12G: $30", FN_PurchaseItem_Crate, ["sgun_HunterShotgun_01_F",30],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase LWMMG: $1,500", FN_PurchaseItem_Crate, ["MMG_02_black_F",1500],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase M14: $350", FN_PurchaseItem_Crate, ["srifle_DMR_06_hunter_F",350],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase M14 DMR: $650", FN_PurchaseItem_Crate, ["srifle_DMR_06_camo_F",650],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase M200 INTERVENTION: $1,600", FN_PurchaseItem_Crate, ["srifle_LRR_camo_F",1600],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase MAR 10: $1,000", FN_PurchaseItem_Crate, ["Rusty_srifle_DMR_02_F",1000],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase MK-I EMR: $450", FN_PurchaseItem_Crate, ["Rusty_srifle_DMR_03_F",450],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase MP5K: $75", FN_PurchaseItem_Crate, ["SMG_05_F",75],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase MSBS GROT: $400", FN_PurchaseItem_Crate, ["arifle_MSBS65_black_F",400],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase MSBS GROT MR: $500", FN_PurchaseItem_Crate, ["arifle_MSBS65_Mark_F",500],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase MSBSGROT SG: $500", FN_PurchaseItem_Crate, ["arifle_MSBS65_UBS_F",500],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase MX: $400", FN_PurchaseItem_Crate, ["arifle_MX_Black_F",400],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase MX LSW: $500", FN_PurchaseItem_Crate, ["arifle_MX_SW_Black_F",500],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase MXC: $325", FN_PurchaseItem_Crate, ["arifle_MXC_Black_F",325],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase MXM: $450", FN_PurchaseItem_Crate, ["arifle_MXM_Black_F",450],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase NAVID 9.3: $1,750", FN_PurchaseItem_Crate, ["Rusty_MMG_01_tan_F",1750],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase NOREEN ULR: $800", FN_PurchaseItem_Crate, ["srifle_DMR_02_camo_F",800],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase P90: $60", FN_PurchaseItem_Crate, ["SMG_03C_black",60],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase PS90: $70", FN_PurchaseItem_Crate, ["SMG_03_black",70],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase QBU-88: $425", FN_PurchaseItem_Crate, ["srifle_DMR_07_blk_F",425],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase QBZ-95-1: $350", FN_PurchaseItem_Crate, ["arifle_CTAR_blk_F",350],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase RFB SDAR: $200", FN_PurchaseItem_Crate, ["arifle_SDAR_F",200],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase RPK: $500", FN_PurchaseItem_Crate, ["arifle_RPK12_F",500],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase SIG 556: $400", FN_PurchaseItem_Crate, ["srifle_DMR_03_woodland_F",400],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase STONER 99 LMG: $600", FN_PurchaseItem_Crate, ["LMG_Mk200_F",600],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase TAR-21: $300", FN_PurchaseItem_Crate, ["arifle_TRG21_F",300],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase VECTOR SMG: $50", FN_PurchaseItem_Crate, ["SMG_01_F",50],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase VS-121: $350", FN_PurchaseItem_Crate, ["srifle_DMR_01_F",350],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase XTS: $1,500", FN_PurchaseItem_Crate, ["DSA_XTS",500],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase ZAFIR: $500", FN_PurchaseItem_Crate, ["Rusty_LMG_Zafir_F",500],1.5,true,false,"","true",3];
};
_containerAction = _container addAction ["ACCESS SIDEARM CATALOGUE", FN_sidearms_Crate,[],1.5,true,false,"","true",3];
FN_sidearms_Crate = {
	params ["_container", "_caller", "_actionId"];
	_containerAction = _container addAction ["Purchase .45 MACHINE PISTOL: $300", FN_PurchaseItem_Crate, ["DSA_MachinePistol45",300],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase 9MM MACHINE PISTOL: $250", FN_PurchaseItem_Crate, ["DSA_MachinePistol9mm",250],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase ALUMINUM PIPE: $20", FN_PurchaseItem_Crate, ["Pipe_aluminium",20],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase AX: $30", FN_PurchaseItem_Crate, ["WBK_axe",30],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase BAT: $20", FN_PurchaseItem_Crate, ["Bat_Clear",20],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase BAT SPIKED: $30", FN_PurchaseItem_Crate, ["Bat_Spike",30],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase BRASS KNUCKLES: $10", FN_PurchaseItem_Crate, ["WBK_BrassKnuckles",10],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase BRUSH AX: $30", FN_PurchaseItem_Crate, ["WBK_brush_axe",30],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase CHIAPPA RHINO 60DS: $100", FN_PurchaseItem_Crate, ["hgun_Pistol_heavy_02_F",100],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase CRAFTED AX: $30", FN_PurchaseItem_Crate, ["WBK_craftedAxe",30],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase CROWBAR: $20", FN_PurchaseItem_Crate, ["Crowbar",20],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase CUSTOM CONVERT II: $100", FN_PurchaseItem_Crate, ["hgun_ACPC2_F",100],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase FIRE AX: $30", FN_PurchaseItem_Crate, ["FireAxe",30],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase FNX-45 TACTICAL: $200", FN_PurchaseItem_Crate, ["hgun_Pistol_heavy_01_F",200],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase HAMMER: $50", FN_PurchaseItem_Crate, ["WBK_survival_weapon_2",50],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase HEINZ MACE: $25", FN_PurchaseItem_Crate, ["WBK_survival_weapon_1",25],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase ICE AX: $40", FN_PurchaseItem_Crate, ["IceAxe",40],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase KATANA: $75", FN_PurchaseItem_Crate, ["WBK_Katana",75],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase KERABIT: $30", FN_PurchaseItem_Crate, ["Weap_melee_knife",30],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase M3 KNIFE: $30", FN_PurchaseItem_Crate, ["Knife_m3",30],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase P99: $125", FN_PurchaseItem_Crate, ["hgun_P07_F",125],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase PIPE STYLED SWORD: $30", FN_PurchaseItem_Crate, ["WBK_pipeStyledSword",30],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase POLICE BAT: $30", FN_PurchaseItem_Crate, ["Police_Bat",30],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase ROD: $20", FN_PurchaseItem_Crate, ["Rod",20],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase RUSSIAN CAVALRY SWORD: $90", FN_PurchaseItem_Crate, ["Sashka_Russian",90],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase SAPPER SHOVEL: $20", FN_PurchaseItem_Crate, ["Shovel_Russian",20],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase SMALL AX: $30", FN_PurchaseItem_Crate, ["Axe",30],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase SMALL HAMMER: $20", FN_PurchaseItem_Crate, ["WBK_SmallHammer",20],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase SPECTRUM DEVICE: $5", FN_PurchaseItem_Crate, ["hgun_esd_01_F",5],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase SPIKED CLUB: $30", FN_PurchaseItem_Crate, ["WBK_ww1_Club",30],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase TAURUS JUDGE: $5", FN_PurchaseItem_Crate, ["hgun_Pistol_Signal_F",5],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase UNSC KNIFE: $20", FN_PurchaseItem_Crate, ["UNSC_Knife",20],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase VMH3: $5", FN_PurchaseItem_Crate, ["ACE_VMH3",5],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase WW2 GERMAN KNIFE: $20", FN_PurchaseItem_Crate, ["WBK_survival_weapon_4",20],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase WW2 RUSSIAN KNIFE: $20", FN_PurchaseItem_Crate, ["WBK_survival_weapon_3",20],1.5,true,false,"","true",3];
};
_containerAction = _container addAction ["ACCESS LAUNCHER CATALOGUE", FN_launchers_Crate,[],1.5,true,false,"","true",3];
FN_launchers_Crate = {
	params ["_container", "_caller", "_actionId"];
	_containerAction = _container addAction ["Purchase MAAWS MK4 MOD 0: $800", FN_PurchaseItem_Crate, ["launch_MRAWS_green_rail_F",800],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase MAAWS MK4 MOD 1: $1,000", FN_PurchaseItem_Crate, ["launch_MRAWS_green_F",1000],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase METIS-M: $1,300", FN_PurchaseItem_Crate, ["launch_O_Vorona_green_F",1300],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase NLAW: $1,000", FN_PurchaseItem_Crate, ["launch_NLAW_F",1000],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase RPG-32: $1,000", FN_PurchaseItem_Crate, ["launch_RPG32_F",1000],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase RPG-7: $800", FN_PurchaseItem_Crate, ["launch_RPG7_F",800],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase TITAN MPRL: $1,000", FN_PurchaseItem_Crate, ["launch_I_Titan_F",1000],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase TITAN MPRL COMPACT: $800", FN_PurchaseItem_Crate, ["launch_O_Titan_short_F",800],1.5,true,false,"","true",3];
};
_containerAction = _container addAction ["ACCESS AMMO CATALOGUE", FN_mags_Crate,[],1.5,true,false,"","true",3];
FN_mags_Crate = {
	params ["_container", "_caller", "_actionId"];
	_containerAction = _container addAction ["Purchase Primary Compatible Magazine: $10", FN_PurchaseMag_Crate,[0, 10],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase Secondary Compatible Magazine: $5", FN_PurchaseMag_Crate,[2, 5],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase Launcher Compatible Magazine: $30", FN_PurchaseMag_Crate,[1, 30],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase GL ROUND: $10", FN_PurchaseItem_Crate, ["1Rnd_HE_Grenade_shell",10],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase 3 HE GL ROUND: $15", FN_PurchaseItem_Crate, ["3Rnd_HE_Grenade_shell",15],1.5,true,false,"","true",3];
};

_containerAction = _container addAction ["ACCESS OPTIC CATALOGUE", FN_optics_Crate,[],1.5,true,false,"","true",3];
FN_optics_Crate = {
	params ["_container", "_caller", "_actionId"];
	_containerAction = _container addAction ["Purchase BURRIS FASTFIRE 2: $30", FN_PurchaseItem_Crate, ["optic_Yorris",30],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase Holosight: $50", FN_PurchaseItem_Crate, ["optic_Holosight",50],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase IOR-Valdada Pitbull 2: $75", FN_PurchaseItem_Crate, ["optic_MRCO",75],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase ELCAN SpecterOS: $400", FN_PurchaseItem_Crate, ["optic_Arco",400],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase Leupold Mark 4 HAMR: $400", FN_PurchaseItem_Crate, ["optic_Hamr",400],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase Burris XTR II: $500", FN_PurchaseItem_Crate, ["optic_DMS",500],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase KAHLES Helia: $550", FN_PurchaseItem_Crate, ["optic_KHS_blk",550],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase Nightforce NXS: $650", FN_PurchaseItem_Crate, ["optic_LRPS",650],1.5,true,false,"","true",3];
	
};
_containerAction = _container addAction ["ACCESS RAIL ATTACHMENT CATALOGUE", FN_rail_Crate,[],1.5,true,false,"","true",3];
FN_rail_Crate = {
	params ["_container", "_caller", "_actionId"];
	_containerAction = _container addAction ["Purchase UTG Defender 126: $5", FN_PurchaseItem_Crate, ["acc_flashlight",5],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase UTG Defender 126 (SMG): $5", FN_PurchaseItem_Crate, ["acc_flashlight_smg_01",5],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase Pistol Flashlight: $5", FN_PurchaseItem_Crate, ["acc_flashlight_pistol",150],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase Laser Pointer: $150", FN_PurchaseItem_Crate, ["acc_pointer_IR",150],1.5,true,false,"","true",3];
};

_containerAction = _container addAction ["ACCESS MUZZLE ATTACHMENT CATALOGUE", FN_muzzle_Crate,[],1.5,true,false,"","true",3];
FN_muzzle_Crate = {
	params ["_container", "_caller", "_actionId"];
	_containerAction = _container addAction ["Purchase FLASH SUPPRESSOR (7.62): $75", FN_PurchaseItem_Crate, ["ACE_muzzle_mzls_B",75],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase SOUND SUPPRESSOR (7.62): $300", FN_PurchaseItem_Crate, ["muzzle_snds_B",300],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase FLASH SUPPRESSOR (9MM): $25", FN_PurchaseItem_Crate, ["ACE_muzzle_mzls_smg_02",25],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase SOUND SUPPRESSOR (9MM): $100", FN_PurchaseItem_Crate, ["muzzle_snds_L",100],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase FLASH SUPPRESSOR (5.56): $60", FN_PurchaseItem_Crate, ["ACE_muzzle_mzls_L",60],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase FLASH SUPPRESSOR (9.3MM): $450", FN_PurchaseItem_Crate, ["ACE_muzzle_mzls_93mmg",450],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase SOUND SUPPRESSOR MG: $400", FN_PurchaseItem_Crate, ["muzzle_snds_H_MG_blk_F",400],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase FLASH SUPPRESSOR (6.5MM): $50", FN_PurchaseItem_Crate, ["ACE_muzzle_mzls_H",50],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase SOUND SUPPRESSOR (6.5MM): $300", FN_PurchaseItem_Crate, ["muzzle_snds_H",300],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase FLASH SUPPRESSOR (.338): $100", FN_PurchaseItem_Crate, ["ACE_muzzle_mzls_338",100],1.5,true,false,"","true",3];	
	_containerAction = _container addAction ["Purchase SOUND SUPPRESSOR (.338): $400", FN_PurchaseItem_Crate, ["muzzle_snds_338_black",400],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase SOUND SUPPRESSOR (5.7MM): $200", FN_PurchaseItem_Crate, ["muzzle_snds_570",200],1.5,true,false,"","true",3];	
	_containerAction = _container addAction ["Purchase STEALTH SUPPRESSOR (5.8MM): $300", FN_PurchaseItem_Crate, ["muzzle_snds_58_blk_F",300],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase FLASH SUPPRESSOR (.45 ACP): $30", FN_PurchaseItem_Crate, ["ACE_muzzle_mzls_smg_01",30],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase SOUND SUPPRESSOR (.45 ACP): $125", FN_PurchaseItem_Crate, ["muzzle_snds_acp",125],1.5,true,false,"","true",3];
};

_containerAction = _container addAction ["ACCESS UNDERRAIL ATTACHMENT CATALOGUE", FN_UNDERRAIL_Crate,[],1.5,true,false,"","true",3];
FN_UNDERRAIL_Crate = {
	params ["_container", "_caller", "_actionId"];
	_containerAction = _container addAction ["Purchase HARRIS BIPOD (Black): $25", FN_PurchaseItem_Crate, ["bipod_01_F_blk",25],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase HARRIS BIPOD (Multicam): $30", FN_PurchaseItem_Crate, ["bipod_01_F_mtp",30],1.5,true,false,"","true",3];
};

_containerAction = _container addAction ["ACCESS GRENADES CATALOGUE", FN_GRENADES_Crate,[],1.5,true,false,"","true",3];
FN_GRENADES_Crate = {
	params ["_container", "_caller", "_actionId"];
	_containerAction = _container addAction ["Purchase CHEMLIGHT HI GREEN: $3", FN_PurchaseItem_Crate, ["ACE_Chemlight_HiGreen",3],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase HAND HELD SIGNAL (RED): $5", FN_PurchaseItem_Crate, ["ACE_HandFlare_Red",5],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase M18 BLUE SMOKE: $10", FN_PurchaseItem_Crate, ["SmokeShellBlue",10],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase M67 FRAG GRENADE: $20", FN_PurchaseItem_Crate, ["HandGrenade",20],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase V40 MINI GRENADE: $15", FN_PurchaseItem_Crate, ["MiniGrenade",15],1.5,true,false,"","true",3];
};

_containerAction = _container addAction ["ACCESS EXPLOSIVES CATALOGUE", FN_EXPLOSIVE_Crate,[],1.5,true,false,"","true",3];
FN_EXPLOSIVE_Crate = {
	params ["_container", "_caller", "_actionId"];
	_containerAction = _container addAction ["Purchase LARGE IED (DUG-IN): $200", FN_PurchaseItem_Crate, ["IEDLandBig_Remote_Mag",200],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase M183 DEMO CHARGE: $250", FN_PurchaseItem_Crate, ["SatchelCharge_Remote_Mag",250],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase M26 ANTI-PERSONNEL MINE: $100", FN_PurchaseItem_Crate, ["APERSBoundingMine_Range_Mag",100],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase M112 DEMO BLOCK: $150", FN_PurchaseItem_Crate, ["DemoCharge_Remote_Mag",150],1.5,true,false,"","true",3];
};

_containerAction = _container addAction ["ACCESS NVG CATALOGUE", FN_NVG_Crate,[],1.5,true,false,"","true",3];
FN_NVG_Crate = {
	params ["_container", "_caller", "_actionId"];
	_containerAction = _container addAction ["Purchase NV Goggles (Gen 1): $250", FN_PurchaseItem_Crate, ["ACE_NVG_Gen1_Brown",250],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase NV Goggles (Gen 2)", FN_PurchaseItem_Crate, ["ACE_NVG_Gen2_Brown",350],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase NV Goggles (Gen 3)", FN_PurchaseItem_Crate, ["ACE_NVGoggles_WP",400],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase NV Goggles (Gen 4): $450", FN_PurchaseItem_Crate, ["ACE_NVG_Gen4_Black",450],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase ENVG-II: $1,000", FN_PurchaseItem_Crate, ["NVGogglesB_blk_F",1000],1.5,true,false,"","true",3];
};

_containerAction = _container addAction ["ACCESS BINO CATALOGUE", FN_BINO_Crate,[],1.5,true,false,"","true",3];
FN_BINO_Crate = {
	params ["_container", "_caller", "_actionId"];
	_containerAction = _container addAction ["Purchase BINOCULARS: $5", FN_PurchaseItem_Crate, ["Binocular",5],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase LAZER DESIGNATOR: $100", FN_PurchaseItem_Crate, ["Laserdesignator_03",100],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase RANGEFINDER: $100", FN_PurchaseItem_Crate, ["Rangefinder",100],1.5,true,false,"","true",3];
};

_containerAction = _container addAction ["ACCESS MISC. CATALOGUE", FN_MISC_Crate,[],1.5,true,false,"","true",3];
FN_MISC_Crate = {
	params ["_container", "_caller", "_actionId"];
	_containerAction = _container addAction ["Purchase TOOLBOX: $100", FN_PurchaseItem_Crate, ["rvg_toolkit",100],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase ADENSONIE: $2", FN_PurchaseItem_Crate, ["ACE_adenosine",2],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase ATRAGMX: $25", FN_PurchaseItem_Crate, ["ACE_ATragMX",25],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase FIELD DRESSING: $3", FN_PurchaseItem_Crate, ["ACE_fieldDressing",3],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase BLOOD .25L: $10", FN_PurchaseItem_Crate, ["ACE_bloodIV_250",10],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase BLOOD .5L: $15", FN_PurchaseItem_Crate, ["ACE_bloodIV_500",15],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase BLOOD 1L: $20", FN_PurchaseItem_Crate, ["ACE_bloodIV",20],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase CABLE TIE: $3", FN_PurchaseItem_Crate, ["ACE_CableTie",3],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase CELLPHONE: $5", FN_PurchaseItem_Crate, ["ACE_Cellphone",5],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase DAGR: $25", FN_PurchaseItem_Crate, ["ACE_DAGR",25],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase DEAD MAN'S SWITCH: $5", FN_PurchaseItem_Crate, ["ACE_DeadManSwitch",5],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase DEFUSAL KIT: $15", FN_PurchaseItem_Crate, ["ACE_DefusalKit",15],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase ENTRENCHING TOOL: $15", FN_PurchaseItem_Crate, ["ACE_EntrenchingTool",15],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase EPINEPHRINE: $2", FN_PurchaseItem_Crate, ["ACE_epinephrine",2],1.5,true,false,"","true",3];	
	_containerAction = _container addAction ["Purchase FORTIFY TOOL: $1", FN_PurchaseItem_Crate, ["ACE_Fortify",1],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase FULTON MX-991: $5", FN_PurchaseItem_Crate, ["ACE_Flashlight_MX991",5],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase HUNTIR MONITOR: $25", FN_PurchaseItem_Crate, ["ACE_HuntIR_monitor",25],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase IR STROBE: $3", FN_PurchaseItem_Crate, ["ACE_IR_Strobe_Item",3],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase KESTREL 4500NV: $20", FN_PurchaseItem_Crate, ["ACE_Kestrel4500",20],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase KSF-1: $10", FN_PurchaseItem_Crate, ["ACE_Flashlight_KSF1",10],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase M152 FIRING DEVICE: $5", FN_PurchaseItem_Crate, ["ACE_M26_Clacker",5],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase MAP TOOLS: $3", FN_PurchaseItem_Crate, ["ACE_MapTools",3],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase MICRODAGR GPS: $25", FN_PurchaseItem_Crate, ["ACE_microDAGR",25],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase MORPHINE: $2", FN_PurchaseItem_Crate, ["ACE_morphine",2],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase PERSONAL AID KIT: $30", FN_PurchaseItem_Crate, ["ACE_personalAidKit",30],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase PLASMA .25L: $10", FN_PurchaseItem_Crate, ["ACE_plasmaIV_250",10],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase PLASMA .5L: $15", FN_PurchaseItem_Crate, ["ACE_plasmaIV_500",15],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase PLASMA 1L: $20", FN_PurchaseItem_Crate, ["ACE_plasmaIV",20],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase RANGE CARD: $5", FN_PurchaseItem_Crate, ["ACE_RangeCard",5],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase SALINE 1L: $15", FN_PurchaseItem_Crate, ["ACE_salineIV_250",15],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase SPLINT: $5", FN_PurchaseItem_Crate, ["ACE_splint",5],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase SPOTTING SCOPE: $20", FN_PurchaseItem_Crate, ["ACE_SpottingScope",20],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase SSWT KIT: $15", FN_PurchaseItem_Crate, ["ACE_Tripod",15],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase SURGICAL KIT: $35", FN_PurchaseItem_Crate, ["ACE_surgicalKit",35],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase TOURNIQUET: $5", FN_PurchaseItem_Crate, ["ACE_tourniquet",5],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase WIRECUTTER: $5", FN_PurchaseItem_Crate, ["ACE_wirecutter",5],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase ANTIVIRUS PILLS: $25", FN_PurchaseItem_Crate, ["RyanZombiesAntiVirusTemporary_Item",25],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase ANTIVIRUS INJECTOR: $100", FN_PurchaseItem_Crate, ["RyanZombiesAntiVirusCure_Item",100],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase HEADLAMP: $1", FN_PurchaseItem_Crate, ["WBK_HeadLampItem",1],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase BAKED BEANS: $15", FN_PurchaseItem_Crate, ["rvg_beans",15],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase BOX OF MATCHES: $20", FN_PurchaseItem_Crate, ["rvg_matches",20],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase CAN OPENER: $15", FN_PurchaseItem_Crate, ["rvg_canOpener",15],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase CANTEEN: $20", FN_PurchaseItem_Crate, ["rvg_canteen",20],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase CANTEEN (CLEANED): $30", FN_PurchaseItem_Crate, ["rvg_canteenPurified",30],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase FUEL CANISTER: $40", FN_PurchaseItem_Crate, ["rvg_canisterFuel",40],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase GEIGER MULLER COUNTER: $50", FN_PurchaseItem_Crate, ["rvg_Geiger",50],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase GUTTING KNIFE: $25", FN_PurchaseItem_Crate, ["rvg_guttingKnife",25],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase HOSE: $15", FN_PurchaseItem_Crate, ["rvg_hose",15],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase NOTEPAD: $2", FN_PurchaseItem_Crate, ["rvg_notepad",2],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase TIRE: $25", FN_PurchaseItem_Crate, ["rvg_tire",25],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase WATER PURIFICATION TABLETS: $10", FN_PurchaseItem_Crate, ["rvg_purificationTablets",10],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase GPS: $25", FN_PurchaseItem_Crate, ["ItemGPS",25],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["Purchase ANOMALY DETECTOR: $30", FN_PurchaseItem_Crate, ["DSA_Detector",30],1.5,true,false,"","true",3];
};

_containerAction = _container addAction ["RESET CATALOGUES", FN_ResetMenu_Crate,[],1.5,true,false,"","true",3];
FN_ResetMenu_Crate = {
	params ["_container", "_caller", "_actionId"];
	removeAllActions _container;
	_containerSellAction = _container addAction ["Sell Items in Crate", FN_SellAction_Crate];
	_containerAction = _container addAction ["--------------PURCHASING MENU--------------",{}];
	_clothingAction = _container addAction ["ACCESS CLOTHING CATALOGUE", FN_clothing_Crate,[],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["ACCESS CHEST RIG CATALOGUE", FN_chestRig_Crate,[],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["ACCESS BACKPACK CATALOGUE", FN_backPack_Crate,[],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["ACCESS PRIMARY WEAPON CATALOGUE", FN_primary_Crate,[],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["ACCESS SIDEARM CATALOGUE", FN_sidearms_Crate,[],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["ACCESS LAUNCHER CATALOGUE", FN_launchers_Crate,[],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["ACCESS AMMO CATALOGUE", FN_mags_Crate,[],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["ACCESS OPTIC CATALOGUE", FN_optics_Crate,[],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["ACCESS RAIL ATTACHMENT CATALOGUE", FN_rail_Crate,[],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["ACCESS MUZZLE ATTACHMENT CATALOGUE", FN_muzzle_Crate,[],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["ACCESS UNDERRAIL ATTACHMENT CATALOGUE", FN_UNDERRAIL_Crate,[],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["ACCESS GRENADES CATALOGUE", FN_GRENADES_Crate,[],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["ACCESS EXPLOSIVES CATALOGUE", FN_EXPLOSIVE_Crate,[],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["ACCESS NVG CATALOGUE", FN_NVG_Crate,[],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["ACCESS BINO CATALOGUE", FN_BINO_Crate,[],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["ACCESS MISC. CATALOGUE", FN_MISC_Crate,[],1.5,true,false,"","true",3];
	_containerAction = _container addAction ["RESET CATALOGUES", FN_ResetMenu_Crate,[],1.5,true,false,"","true",3];
};

FN_PurchaseMag_Crate = {
	params ["_target", "_caller", "_actionId", "_args"];
	
	_bankNotesCount = { _x == "rvg_money" } count magazines _caller;
	
	if (_bankNotesCount == 0) then {
		hintSilent "Sorry, but yo ass broke";
		sleep 3;
		hintSilent "";
	};
	if (_bankNotesCount < (_args select 1) AND _bankNotesCount != 0) then {
		hintSilent "Sorry, not enough money to purchase item";
		sleep 3;
		hintSilent "";
	} else {
		_primaryWeapon = primaryWeapon _caller;
		_secondaryWeapon = secondaryWeapon _caller;
		_handgunWeapon = handgunWeapon _caller;
		if (!("" == _primaryWeapon) AND (_args select 0) == 0) then {

			_index = 0;
			while {_index < (_args select 1)} do {
				_caller removeItem "rvg_money";
				_index = _index + 1;
			};
			
			// Get the available magazines for the primary weapon
			_magazines = compatibleMagazines _primaryWeapon;
			if (count _magazines != 0) then {
				_target addMagazineCargoGlobal [(_magazines select 0), 1];
				hintSilent "magazine successfully purchased";
				sleep 3;
				hintSilent "";
			} else {
				hintSilent "Sorry, but we weren't able to find any magazines in stock for that weapon.";
			};
		};
		if (!("" == _secondaryWeapon) AND (_args select 0) == 1) then {
			_index = 0;
			while {_index < (_args select 1)} do {
				_caller removeItem "rvg_money";
				_index = _index + 1;
			};
			// Get the available magazines for the launcher weapon
			_magazines = compatibleMagazines _secondaryWeapon;
			if (count _magazines != 0) then {
				_target addMagazineCargoGlobal [(_magazines select 0), 1];
				hintSilent "magazine successfully purchased";
				sleep 3;
				hintSilent "";
			} else {
				hintSilent "Sorry, but we weren't able to find any magazines in stock for that weapon.";
			};
		};
		if (!("" == _handgunWeapon) AND (_args select 0) == 2) then {
			_index = 0;
			while {_index < (_args select 1)} do {
				_caller removeItem "rvg_money";
				_index = _index + 1;
			};
			// Get the available magazines for the handgun weapon
			_magazines = compatibleMagazines _handgunWeapon;
			if (count _magazines != 0) then {
				_target addMagazineCargoGlobal [(_magazines select 0), 1];
				hintSilent "magazine successfully purchased";
				sleep 3;
				hintSilent "";
			} else {
				hintSilent "Sorry, but we weren't able to find any magazines in stock for that weapon.";
			};
		};
	};
};
 
FN_PurchaseItem_Crate = {
	params ["_target", "_caller", "_actionId", "_args"];
	
	execVM "ArrayDatabase.sqf";
	backpackSelection = ["backpack"] call FN_arrayReturn;
	backpackSelectionRare = ["backpackExpensive"] call FN_arrayReturn;

	_itemsPlayer = itemsWithMagazines _target;

	_bankNotesCount = { _x == "rvg_money" } count magazines _caller;

	if (_bankNotesCount == 0) then {
		hintSilent "Sorry, but yo ass broke";
		sleep 3;
		hintSilent "";
	};
	if (_bankNotesCount < _args select 1 AND _bankNotesCount != 0) then {
		hintSilent "Sorry, not enough money to purchase item";
		sleep 3;
		hintSilent "";
	} else {
		_index = 0;
		while {_index < _args select 1} do {
			_caller removeItem "rvg_money";
			_index = _index + 1;
		};
		if ((_args select 0) in backpackSelection or (_args select 0) in backpackSelectionRare) then {
			_target addBackpackCargoGlobal [(_args select 0), 1];
			hintSilent "item successfully purchased";
			sleep 3;
			hintSilent "";
		} else {
			_target addItemCargoGlobal [_args select 0, 1];
			hintSilent "item successfully purchased";
			sleep 3;
			hintSilent "";
		};
	};
};

// SELLING ________________________________________________________________________________________________________________

FN_addMoney = {
	params ["_container", "_caller", "_actionId", "_arrayToCheck", "_amountToSell", "_item"];
	_defaultItem = true;
	if (_item in _arrayToCheck) then {
		_container addMagazineCargoGlobal ["rvg_money", _amountToSell];
		_defaultItem = false;
	};
	_defaultItem;
};

FN_SellAction_Crate =  {
	params ["_container", "_caller", "_actionId", "_arguments"];

	execVM "ArrayDatabase.sqf";
	headgearArraySelectionRare = ["headgear"] call FN_arrayReturn;
	gasArraySelection = ["gas"] call FN_arrayReturn;
	coolClothing = ["clothingExpensive"] call FN_arrayReturn;
	monoNVG = ["monoNVG"] call FN_arrayReturn;
	binoNVG = ["binoNVG"] call FN_arrayReturn;
	quadNVG = ["quadNVG"] call FN_arrayReturn;
	explosive = ["explosive"] call FN_arrayReturn;
	thrownExplosives = ["thrownExplosives"] call FN_arrayReturn;
	melee = ["melee"] call FN_arrayReturn;
	pistol = ["pistol"] call FN_arrayReturn;
	autoPistol = ["autoPistol"] call FN_arrayReturn;
	launcherArraySelection = ["launcher"] call FN_arrayReturn;
	smg = ["smg"] call FN_arrayReturn;
	shotgun = ["shotgun"] call FN_arrayReturn;
	assualtRifle = ["assualtRifle"] call FN_arrayReturn;
	LMG = ["LMG"] call FN_arrayReturn;
	DMR = ["DMR"] call FN_arrayReturn;
	sniperRifle = ["sniperRifle"] call FN_arrayReturn;
	antiMaterial = ["antiMaterial"] call FN_arrayReturn;
	opticsArraySelection = ["optics"] call FN_arrayReturn;
	opticsArraySelectionRare = ["opticsExpensive"] call FN_arrayReturn;
	muzzleArraySelection = ["muzzle"] call FN_arrayReturn;
	muzzleArraySelectionRare = ["muzzleExpensive"] call FN_arrayReturn;
	railArraySelection = ["rail"] call FN_arrayReturn;
	railArraySelectionRare = ["railExpensive"] call FN_arrayReturn;
	backpackSelection = ["backpack"] call FN_arrayReturn;
	backpackSelectionRare = ["backpackExpensive"] call FN_arrayReturn;

	private _presetContents = [];
	private _selectedItem = "";
	private _moneyTracker = 0;

	{
		_presetContents pushBack [(_x select 0), 1];
		sleep .01;
	} forEach weaponsItemsCargo _container;

	private _backpackCargo = getBackpackCargo _container;

	{
		_presetContents pushBack [_x, (_backpackCargo select 1) select _forEachIndex]; // [name, count]
		sleep .01;
	} forEach (_backpackCargo select 0);

	private _magazineCargo = getMagazineCargo _container;

	{
		_presetContents pushBack [_x, (_magazineCargo select 1) select _forEachIndex]; // [name, count]
		sleep .01;
	} forEach (_magazineCargo select 0);

	private _itemCargo = getItemCargo _container;

	{
		_presetContents pushBack [_x, (_itemCargo select 1) select _forEachIndex];  // [name, count]
		sleep .01;
	} forEach (_itemCargo select 0);


	{
		private _defaultItem = true;
		_selectedItem = _x select 0;
		if (_selectedItem != "rvg_money") then {
			_defaultItem = ([_container, _caller, _actionId, gasArraySelection, 3, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, coolClothing, 10, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, monoNVG, 50, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, binoNVG, 75, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, quadNVG, 200, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, explosive, 20, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, thrownExplosives, 3, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, melee, 3, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, pistol, 3, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, autoPistol, 15, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, launcherArraySelection, 50, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, smg, 15, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, shotgun, 15, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, assualtRifle, 15, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, LMG, 30, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, DMR, 35, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, sniperRifle, 40, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, antiMaterial, 80, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, opticsArraySelection, 10, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, opticsArraySelectionRare, 30, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, railArraySelection, 3, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, railArraySelectionRare, 20, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, muzzleArraySelection, 10, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, muzzleArraySelectionRare, 50, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, backpackSelection, 10, _selectedItem] call FN_addMoney);
			_defaultItem = ([_container, _caller, _actionId, backpackSelectionRare, 30, _selectedItem] call FN_addMoney);
			if (_defaultItem) then {
				_container addMagazineCargoGlobal ["rvg_money", _x select 1];
			};
		};
		sleep .01;
	} forEach _presetContents;

	_presetContents = [];

	private _magazineCargo = getMagazineCargo _container;

	{
		_presetContents pushBack [_x, (_magazineCargo select 1) select _forEachIndex]; // [name, count]
		sleep .01;
	} forEach (_magazineCargo select 0);

	{
		if ((_x select 0) == "rvg_money") then {
			_moneyTracker = _x select 1;
		};
		sleep .01;
	} forEach _presetContents;

	clearItemCargoGlobal _container;
	clearMagazineCargoGlobal _container;
	clearWeaponCargoGlobal _container;
	clearBackpackCargoGlobal _container;

	_container addMagazineCargoGlobal ["rvg_money", _moneyTracker];
	if (_moneyTracker == 0) then {
		hintSilent format ["What was the point of trying to sell nothing %1?", name _caller];
	} else {
		hintSilent format ["%1$ has been added to the crate. Pleasure doing business with you %2", _moneyTracker, name _caller];
	};
	
	_moneyTracker = 0;
};