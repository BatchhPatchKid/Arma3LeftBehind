// Distance thresholds in meters
private _distanceThresholdPerson = 1000;
private _distanceThresholdObjects = 1000;
private _corpseThreshold = 1000;
private _distanceThresholdVehicle = 1000;

// Defining functions
fn_checkProximityToDesiredObject = {
    params ["_object", "_objectsCache", "_proximity"];
    {
        if (_object distance2D _x <= _proximity) then {
            _withinRange = true;
            break; // exit loop if one object is within range
        };
        sleep 0.01;
    } forEach _objectsCache;
    _withinRange;
};

fn_checkProximityToPlayer = {
    params ["_object", "_players", "_distanceThreshold"];
    {
        if (_object distance2D _x <= _distanceThreshold) then {
            _withinRange = true;
            break;
        };
        sleep 0.01;
    } forEach _players;
    _withinRange;
};

while { true } do {
    isEveryoneDead = true;
    {
        if (alive _x) then {
            isEveryoneDead = false;
        };
        sleep 0.01;
    } forEach allPlayers;
    
    _headlessClients = entities "HeadlessClient_F";
    
    _objectsCacheFlag = nearestObjects [middleOfMap, ["Flag_Red_F"], 17500];
    _objectsCacheStone = nearestObjects [middleOfMap, ["Land_BluntStone_01"], 17500];
    
    if (!(isEveryoneDead) or ((count allPlayers) >= (count _headlessClients))) then {
        _players = allPlayers - entities "HeadlessClient_F";
    
        // Delete units (AI) outside player range
        {
            sleep 0.01;
            _unit = _x;
            _withinRange = false;
            _withinRange = [_unit, _objectsCacheStone, 500] call fn_checkProximityToDesiredObject;
            if (_withinRange) then { continue };
            _withinRange = false;
            _withinRange = [_unit, _objectsCacheFlag, 150] call fn_checkProximityToDesiredObject;
            if (_withinRange) then { continue };
            _withinRange = [_unit, _players, _distanceThresholdPerson] call fn_checkProximityToPlayer;
            if (_withinRange) then { continue };
            // If the unit is near an air vehicle, skip deletion.
            _withinRange = (count nearestObjects [_unit, ["air"], 5]) != 0;
            if (_withinRange) then { continue };
            deleteVehicle _unit;
        } forEach allUnits;
    
        // Delete dead bodies (allDead) outside player range
        {
            sleep 0.01;
            _object = _x;
            _withinRange = false;
            _withinRange = [_object, _objectsCacheStone, 500] call fn_checkProximityToDesiredObject;
            if (_withinRange) then { continue };
            _withinRange = false;
            _withinRange = [_object, _objectsCacheFlag, 150] call fn_checkProximityToDesiredObject;
            if (_withinRange) then { continue };
            _withinRange = [_object, _players, _corpseThreshold] call fn_checkProximityToPlayer;
            if (_withinRange) then { continue };
            deleteVehicle _object;
        } forEach allDead;
    
        // Delete specific objects outside player range
        _objects = nearestObjects [middleOfMap, ["Campfire_burning_F","ACE_medicalSupplyCrate","Land_Axe_F","Land_CanisterFuel_F","VirtualReammoBox_small_F","Land_Laptop_device_F","CamoNet_wdl_open_F","Land_Laptop_03_black_F","Land_Router_01_olive_F","Land_MultiScreenComputer_01_closed_olive_F","Land_PortableLight_double_F","Land_Portable_generator_F","SatelliteAntenna_01_Black_F","Land_HBarrier_3_F","Land_Map_altis_F","Land_WoodenTable_02_large_F","CamoNet_BLUFOR_F","Land_Sink_F","RuggedTerminal_01_communications_F","Land_HBarrier_01_line_3_green_F","Land_CampingTable_small_F","Land_SolarPanel_04_olive_F","Land_HBarrier_01_line_5_green_F","Land_MultiScreenComputer_01_black_F","OmniDirectionalAntenna_01_black_F","Land_BagFence_01_corner_green_F","Land_SolarPanel_04_black_F","CamoNet_INDP_F","Land_HBarrier_5_F","I_C_HMG_02_high_F","Land_Shoot_House_Wall_Long_Crouch_F","Land_WoodenBox_F","rvg_dome_tent_gry","Land_PaperBox_closed_F","Land_TablePlastic_01_F","Land_Mound01_8m_F","Land_cargo_addon02_V1_F","Land_BagFence_01_round_green_F","Land_BagBunker_01_small_green_F","Land_CampingChair_V2_F","Land_TentDome_F","Land_WoodenLog_F","Land_WoodPile_F","Land_BagFence_01_long_green_F","Land_BagFence_01_short_green_F","Land_BagFence_01_round_F","Land_Razorwire_F","Land_TentA_F","Land_Sleeping_bag_F","CamoNet_OPFOR_F","Land_Camping_Light_F","Land_PortableLight_02_double_black_F","BloodPool_01_Large_New_F","BloodPool_01_Medium_New_F","BloodPool_01_Medium_Old_F","BloodSplatter_01_Large_New_F","BloodSplatter_01_Large_Old_F","BloodSplatter_01_Medium_New_F","BloodSplatter_01_Medium_Old_F","BloodSplatter_01_Small_New_F","BloodSplatter_01_Small_Old_F","BloodSpray_01_New_F","BloodSpray_01_Old_F","BloodTrail_01_Old_F"], 17500];
        {
            sleep 0.01;
            _object = _x;
            _withinRange = false;
            _withinRange = [_object, _objectsCacheStone, 500] call fn_checkProximityToDesiredObject;
            if (_withinRange) then { continue };
            _withinRange = false;
            _withinRange = [_object, _objectsCacheFlag, 150] call fn_checkProximityToDesiredObject;
            if (_withinRange) then { continue };
            _withinRange = [_object, _players, _distanceThresholdObjects] call fn_checkProximityToPlayer;
            if (_withinRange) then { continue };
            deleteVehicle _object;
        } forEach _objects;
    
        // Delete vehicles outside player range (excluding aircraft)
        _objectsVehicle = nearestObjects [middleOfMap, ["LandVehicle","air","ship"], 17500];
        {
            sleep 0.01;
            _vehicle = _x;
            // Exclude aircraft.
            if (_vehicle isKindOf "Air") then { continue; };
            _withinRange = false;
            _withinRange = [_vehicle, _objectsCacheStone, 500] call fn_checkProximityToDesiredObject;
            if (_withinRange) then { continue };
            _withinRange = false;
            _withinRange = [_vehicle, _objectsCacheFlag, 150] call fn_checkProximityToDesiredObject;
            if (_withinRange) then { continue };
            _withinRange = [_vehicle, _players, _distanceThresholdVehicle] call fn_checkProximityToPlayer;
            if (_withinRange) then { continue };
            deleteVehicle _vehicle;
        } forEach _objectsVehicle;
    };
    sleep 30;
};