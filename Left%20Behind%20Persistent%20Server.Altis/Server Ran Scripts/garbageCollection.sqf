// Distance thresholds in meters
private _distanceThresholdPerson = 1000;
private _distanceThresholdObjects = 2000;
private _corpseThreshold = 1000;
private _distanceThresholdVehicle = 2000;

//Defining functions
fn_checkProximityToDesiredObject = {
	params ["_object","_objectsCache","_proximity"];
	{
		if(_object distance2D _x <= _proximity) then {
			// The unit is within range of at least one ammo box
            _withinRange = true;
            break; // Exit the loop as we don't need to check further
		};
		sleep .01;
	} forEach _objectsCache;
	_withinRange;
};

fn_checkProximityToPlayer = {
	params ["_object","_players","_distanceThreshold"];
	// Iterate through all players to check the distance
    {
		if (_object distance2D _x <= _distanceThreshold) then {
            // The object is within range of at least one ammo box
            _withinRange = true;
            break; // Exit the loop as we don't need to check further
        };
		sleep .01;
    } forEach _players;
	_withinRange;
};

while {true} do {
	isEveryoneDead = true;
    {
        if (alive _x) then {
			// at least one player is alive, return false
            isEveryoneDead =  false;
        };
		sleep .01;
    } forEach allPlayers;
	
	_headlessClients = entities "HeadlessClient_F";
	
	_objectsCacheFlag = nearestObjects [middleOfMap, ["Flag_Red_F"], 17500];
	_objectsCacheStone = nearestObjects [middleOfMap, ["Land_BluntStone_01"], 17500];
	
    if (!(isEveryoneDead) or ((count allPlayers) >= (count _headlessClients))) then {
        // Get all players on the server
        _players = allPlayers - entities "HeadlessClient_F";

        // Delete units (AI) outside player range
        {
            sleep .01;
			_unit = _x;
			
            _withinRange = false;
			_withinRange = [_unit, _objectsCacheStone, 500] call fn_checkProximityToDesiredObject;
			if (_withinRange) then {continue};
			
			_withinRange = false;
			_withinRange = [_unit, _objectsCacheFlag, 150] call fn_checkProximityToDesiredObject;
			if (_withinRange) then {continue};
			
			// Iterate through all players to check the distance
			_withinRange = [_unit, _players, _distanceThresholdPerson] call fn_checkProximityToPlayer;
			if (_withinRange) then {continue};

			// checking to see if the unit is in an air vehicle. If it is, then it will NOT delete the AI
			_withinRange = (count nearestObjects [_unit, ["air"], 5]) != 0;
			if (_withinRange) then {continue};
				
            // If the unit is not within range of any player, delete it
			deleteVehicle _unit;
        } forEach allUnits;

        // Delete dead bodies (allDead) outside player range
        {
            sleep .01;
			_object = _x;
			
			_withinRange = false;
			_withinRange = [_object, _objectsCacheStone, 500] call fn_checkProximityToDesiredObject;
			if (_withinRange) then {continue};
			
			_withinRange = false;
			_withinRange = [_object, _objectsCacheFlag, 150] call fn_checkProximityToDesiredObject;
			if (_withinRange) then {continue};
			
			// Iterate through all players to check the distance
			_withinRange = [_object, _players, _corpseThreshold] call fn_checkProximityToPlayer;
			if (_withinRange) then {continue};
			
			// If the vehicle is not within range of any player, delete it
            deleteVehicle _object;
        } forEach allDead;
		
		// Delete loot boxes outside player range
        _objects = nearestObjects [middleOfMap, ["ACE_medicalSupplyCrate"], 17500];
        {
            sleep .01;
			_object = _x;
			
			_withinRange = false;
			_withinRange = [_object, _objectsCacheStone, 500] call fn_checkProximityToDesiredObject;
			if (_withinRange) then {continue};
			
			_withinRange = false;
			_withinRange = [_object, _objectsCacheFlag, 150] call fn_checkProximityToDesiredObject;
			if (_withinRange) then {continue};
			
			// Iterate through all players to check the distance
			_withinRange = [_object, _players, _distanceThresholdPerson] call fn_checkProximityToPlayer;
			if (_withinRange) then {continue};
			
			// If the vehicle is not within range of any player, delete it
            deleteVehicle _object;
        } forEach _objects;

        // Delete specific objects outside player range
        _objects = nearestObjects [middleOfMap, ["VirtualReammoBox_small_F","Land_Laptop_device_F","CamoNet_wdl_open_F","Land_Laptop_03_black_F","Land_Router_01_olive_F","Land_MultiScreenComputer_01_closed_olive_F","Land_PortableLight_double_F","Land_Portable_generator_F","SatelliteAntenna_01_Black_F","Land_HBarrier_3_F","Land_Map_altis_F","Land_WoodenTable_02_large_F","CamoNet_BLUFOR_F","Land_Sink_F","RuggedTerminal_01_communications_F","Fridge_01_closed_F","Land_HBarrier_01_line_3_green_F","Land_PortableServer_01_olive_F","Land_Laptop_03_olive_F","Land_BagFence_01_corner_green_F","Land_SolarPanel_04_olive_F","Land_HBarrier_01_line_5_green_F","Land_MultiScreenComputer_01_black_F","OmniDirectionalAntenna_01_black_F","Land_CampingTable_small_F","Land_SolarPanel_04_black_F","CamoNet_INDP_F","Land_HBarrier_5_F","I_C_HMG_02_high_F","Land_Shoot_House_Wall_Long_Crouch_F","Land_WoodenBox_F","rvg_dome_tent_gry","Land_PaperBox_closed_F","Land_TablePlastic_01_F","Land_Mound01_8m_F","Land_cargo_addon02_V1_F","Land_BagFence_01_round_green_F","Land_BagBunker_01_small_green_F","Land_CampingChair_V2_F","Land_TentDome_F","Land_WoodenLog_F","Land_WoodPile_F","Land_BagFence_01_long_green_F","Land_BagFence_Round_F", "Land_BagBunker_Tower_F", "Land_BagBunker_Small_F","Land_MedicalTent_01_wdl_generic_outer_F","WBK_HeadLampLightObject","Land_Razorwire_F","APERSTripMine","K_Spine_SK", "K_Arms_1", "K_Pelvis_1", "K_Arms_SK","Land_Cliff_stone_small_F","Land_MedicalTent_01_wdl_generic_inner_F", "Land_DeconTent_01_wdl_F", "Land_IRMaskingCover_01_F", "Land_MedicalTent_01_NATO_tropic_generic_outer_F", "Land_MedicalTent_01_CSAT_greenhex_generic_outer_F", "Land_MedicalTent_01_CSAT_greenhex_generic_open_F", "Land_DeconTent_01_CSAT_greenhex_F", "Land_CampingTable_F", "Hand_White_old", "Hand_Finger4", "Hand_White", "Hand_Dark", "Right_Arm_white_old", "African_Head", "Asian_Head", "persian_Head", "Head_Brain", "Leg_Body_Part_Dark", "Leg_Body_Part_White", "Leg_Body_Part_Old", "no_skin_body", "cuttopHead", "Torso_bloody", "blood_pool_s", "impaled_skeleton", "impaled_body", "corpse_mass", "mass_parts", "no_skin_body_pos1", "no_skin_open_chest","BloodTrail_01_New_F","Land_CanOpener_F","CamoNet_INDP_open_F","BloodPool_01_Large_New_F","Land_Bodybag_01_black_F","Land_Camping_Light_F","Campfire_burning_F","rvg_dome_tent_grn","rvg_dome_tent_gry","rvg_dome_tent_blu","CamoNet_wdl_F","Land_MedicalTent_01_wdl_generic_open_F","CamoNet_BLUFOR_open_F","Land_MedicalTent_01_NATO_generic_inner_F","Land_MedicalTent_01_NATO_generic_outer_F","Land_Plank_01_4m_F","Land_Plank_01_8m_F","Land_SandbagBarricade_01_F","Land_SandbagBarricade_01_hole_F","Land_BagBunker_Small_F","Land_BagFence_Long_F","Land_BagFence_Short_F","Land_BagFence_Round_F","Land_Razorwire_F","Land_TentA_F","Land_Sleeping_bag_F","CamoNet_OPFOR_open_F","Land_Camping_Light_F","Land_PortableLight_02_double_black_F","BloodPool_01_Large_Old_F","BloodPool_01_Medium_New_F","BloodPool_01_Medium_Old_F","BloodSplatter_01_Large_New_F","BloodSplatter_01_Large_Old_F","BloodSplatter_01_Medium_New_F","BloodSplatter_01_Medium_Old_F","BloodSplatter_01_Small_New_F","BloodSplatter_01_Small_Old_F","BloodSpray_01_New_F","BloodSpray_01_Old_F","BloodTrail_01_Old_F"], 17500];
        {
            sleep .01;
			_object = _x;
			
			_withinRange = false;
			_withinRange = [_object, _objectsCacheStone, 500] call fn_checkProximityToDesiredObject;
			if (_withinRange) then {continue};
			
			_withinRange = false;
			_withinRange = [_object, _objectsCacheFlag, 150] call fn_checkProximityToDesiredObject;
			if (_withinRange) then {continue};
			
			// Iterate through all players to check the distance
			_withinRange = [_object, _players, _distanceThresholdObjects] call fn_checkProximityToPlayer;
			if (_withinRange) then {continue};
			
			// If the vehicle is not within range of any player, delete it
            deleteVehicle _object;
        } forEach _objects;
		
		// Delete specific objects outside player range
        _objectsVehicle = nearestObjects [middleOfMap, ["LandVehicle","air","ship"], 17500];
        {
            sleep .01;
			_vehicle = _x;
			
			_withinRange = false;
			_withinRange = [_vehicle, _objectsCacheStone, 500] call fn_checkProximityToDesiredObject;
			if (_withinRange) then {continue};
			
			_withinRange = false;
			_withinRange = [_vehicle, _objectsCacheFlag, 150] call fn_checkProximityToDesiredObject;
			if (_withinRange) then {continue};
			
			// Iterate through all players to check the distance
			_withinRange = [_vehicle, _players, _distanceThresholdVehicle] call fn_checkProximityToPlayer;
			if (_withinRange) then {continue};
			
			// checking to see if the air vehicle is near a unit. If it is, then it will NOT delete the vehicle
			if (_vehicle isKindOf "air") then {
				_withinRange = (_vehicle emptyPositions "Driver") == 0;
			};
			if (_withinRange) then {continue};
			
            // If the vehicle is not within range of any player, delete it
            deleteVehicle _vehicle;
        } forEach _objectsVehicle;
    };
	// Sleep at the end of the main loop to avoid excessive delays
    sleep 30;
};