params ["_container", "_caller", "_actionId"];
[_container, ["Purchase NV Goggles (Gen 1): $250", "Economy System\functions\FN_PurchaseItem.sqf", ["ACE_NVG_Gen1_Brown",250],1.5,true,false,"","true",3]] remoteExec ['addAction', 0, _container];
[_container, ["Purchase NV Goggles (Gen 2): $350", "Economy System\functions\FN_PurchaseItem.sqf", ["ACE_NVG_Gen2_Brown",350],1.5,true,false,"","true",3]] remoteExec ['addAction', 0, _container];
[_container, ["Purchase NV Goggles (Gen 3): $400", "Economy System\functions\FN_PurchaseItem.sqf", ["ACE_NVGoggles_WP",400],1.5,true,false,"","true",3]] remoteExec ['addAction', 0, _container];
[_container, ["Purchase NV Goggles (Gen 4): $450", "Economy System\functions\FN_PurchaseItem.sqf", ["ACE_NVG_Gen4_Black",450],1.5,true,false,"","true",3]] remoteExec ['addAction', 0, _container];
[_container, ["Purchase ENVG-II: $1,000", "Economy System\functions\FN_PurchaseItem.sqf", ["NVGogglesB_blk_F",1000],1.5,true,false,"","true",3]] remoteExec ['addAction', 0, _container];