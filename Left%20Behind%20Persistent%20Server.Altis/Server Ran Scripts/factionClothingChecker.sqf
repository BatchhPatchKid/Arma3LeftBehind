execVM "ArrayDatabase.sqf";
execVM "Server Ran Scripts\convertWeightedArray.sqf";

sleep 3;

//Calling the function to return a weighted array as a parameter for a function that converts that weighted array into a non-weighted array
headgearArraySelectionBB = [["headgearBB"] call FN_arrayReturn] call FN_convertWeightedArray;

headgearArraySelectionDT = [["headgearDT"] call FN_arrayReturn] call FN_convertWeightedArray;
facewearArraySelectionDT = [["facewearDT"] call FN_arrayReturn] call FN_convertWeightedArray;

headgearArraySelectionNH = [["headgearNH"] call FN_arrayReturn] call FN_convertWeightedArray;

headgearArraySelectionPF = [["headgearPF"] call FN_arrayReturn] call FN_convertWeightedArray;
uniformArraySelectionPF = [["uniformPF"] call FN_arrayReturn] call FN_convertWeightedArray;

headgearArraySelectionRC = [["headgearRC"] call FN_arrayReturn] call FN_convertWeightedArray;
facewearArraySelectionRC = [["facewearRC"] call FN_arrayReturn] call FN_convertWeightedArray;
uniformArraySelectionRC = [["uniformRC"] call FN_arrayReturn] call FN_convertWeightedArray;

facewearArraySelectionTRB = [["facewearTRB"] call FN_arrayReturn] call FN_convertWeightedArray;
uniformArraySelectionTRB = [["uniformTRB"] call FN_arrayReturn] call FN_convertWeightedArray;
headgearArraySelectionTRB = [["headgearTRB"] call FN_arrayReturn] call FN_convertWeightedArray;

headgearArraySelectionUS = [["headgearUS"] call FN_arrayReturn] call FN_convertWeightedArray;
facewearArraySelectionUS = [["facewearUS"] call FN_arrayReturn] call FN_convertWeightedArray;
uniformArraySelectionUS = [["uniformUS"] call FN_arrayReturn] call FN_convertWeightedArray;

headgearArraySelectionRU = [["headgearRU"] call FN_arrayReturn] call FN_convertWeightedArray;
uniformArraySelectionRU = [["uniformRU"] call FN_arrayReturn] call FN_convertWeightedArray;

uniformArraySelectionROA = [["uniformROA"] call FN_arrayReturn] call FN_convertWeightedArray;
headgearArraySelectionROA = [["headgearROA"] call FN_arrayReturn] call FN_convertWeightedArray;

uniformArraySelectionPMC = [["uniformPMC"] call FN_arrayReturn] call FN_convertWeightedArray;
headgearArraySelectionPMC = [["headgearPMC"] call FN_arrayReturn] call FN_convertWeightedArray;
facewearArraySelectionPMC = [["facewearPMC"] call FN_arrayReturn] call FN_convertWeightedArray;

headgearArraySelectionWO = [["headgearWO"] call FN_arrayReturn] call FN_convertWeightedArray;
uniformArraySelectionWO = [["uniformWO"] call FN_arrayReturn] call FN_convertWeightedArray;

uniformArraySelectionALF = [["uniformALF"] call FN_arrayReturn] call FN_convertWeightedArray;
facewearArraySelectionALF = [["facewearALF"] call FN_arrayReturn] call FN_convertWeightedArray;
headgearArraySelectionALF = [["headgearALF"] call FN_arrayReturn] call FN_convertWeightedArray;

while {true} do {
	{
		_playerUniform = uniform _x;
		_playerHeadgear = headgear _x;
		_playerGoggles = goggles _x;
		
		switch true do {
			case (_playerHeadgear in headgearArraySelectionBB): {
				_x setVariable ["SU_Relation",true,true];
				_x setVariable ["BB_Relation",true,true];
				_x setVariable ["PF_Relation",false,true];
				_x setVariable ["ALF_Relation",false,true];
				_x setVariable ["WO_Relation",false,true];
				_x setVariable ["RU_Relation",false,true];
				_x setVariable ["US_Relation",false,true];
				_x setVariable ["NH_Relation",false,true];
				_x setVariable ["TRB_Relation",false,true];
				_x setVariable ["RC_Relation",false,true];
				_x setVariable ["DT_Relation",false,true];
				_x setVariable ["ROA_Relation",false,true];
				_x setVariable ["PMC_Relation",false,true];
				_x setVariable ["Bandit_Relation",false,true];
				_x setVariable ["Renegade_Relation",false,true];
			};	
			
			//DT
			case (_playerHeadgear in headgearArraySelectionDT AND _playerGoggles in facewearArraySelectionDT): {
				_x setVariable ["SU_Relation",FALSE,true];
				_x setVariable ["BB_Relation",FALSE,true];
				_x setVariable ["PF_Relation",FALSE,true];
				_x setVariable ["ALF_Relation",FALSE,true];
				_x setVariable ["WO_Relation",FALSE,true];
				_x setVariable ["RU_Relation",FALSE,true];
				_x setVariable ["US_Relation",FALSE,true];
				_x setVariable ["NH_Relation",true,true];
				_x setVariable ["TRB_Relation",FALSE,true];
				_x setVariable ["RC_Relation",FALSE,true];
				_x setVariable ["DT_Relation",true,true];
				_x setVariable ["ROA_Relation",FALSE,true];
				_x setVariable ["PMC_Relation",FALSE,true];
				_x setVariable ["Bandit_Relation",FALSE,true];
				_x setVariable ["Renegade_Relation",FALSE,true];
			};
			
			//NH
			case (_playerHeadgear in headgearArraySelectionNH): {
				_x setVariable ["SU_Relation",FALSE,true];
				_x setVariable ["BB_Relation",FALSE,true];
				_x setVariable ["PF_Relation",FALSE,true];
				_x setVariable ["ALF_Relation",FALSE,true];
				_x setVariable ["WO_Relation",FALSE,true];
				_x setVariable ["RU_Relation",FALSE,true];
				_x setVariable ["US_Relation",FALSE,true];
				_x setVariable ["NH_Relation",true,true];
				_x setVariable ["TRB_Relation",FALSE,true];
				_x setVariable ["RC_Relation",FALSE,true];
				_x setVariable ["DT_Relation",true,true];
				_x setVariable ["ROA_Relation",FALSE,true];
				_x setVariable ["PMC_Relation",FALSE,true];
				_x setVariable ["Bandit_Relation",FALSE,true];
				_x setVariable ["Renegade_Relation",FALSE,true];
			};
			
			//PF
			case (_playerHeadgear in headgearArraySelectionPF AND _playerUniform in uniformArraySelectionPF): {
				_x setVariable ["SU_Relation",FALSE,true];
				_x setVariable ["BB_Relation",FALSE,true];
				_x setVariable ["PF_Relation",true,true];
				_x setVariable ["ALF_Relation",FALSE,true];
				_x setVariable ["WO_Relation",FALSE,true];
				_x setVariable ["RU_Relation",FALSE,true];
				_x setVariable ["US_Relation",FALSE,true];
				_x setVariable ["NH_Relation",FALSE,true];
				_x setVariable ["TRB_Relation",FALSE,true];
				_x setVariable ["RC_Relation",FALSE,true];
				_x setVariable ["DT_Relation",FALSE,true];
				_x setVariable ["ROA_Relation",FALSE,true];
				_x setVariable ["PMC_Relation",FALSE,true];
				_x setVariable ["Bandit_Relation",FALSE,true];
				_x setVariable ["Renegade_Relation",FALSE,true];
			};
			
			//RC
			case (_playerHeadgear in headgearArraySelectionRC AND _playerGoggles in facewearArraySelectionRC AND _playerUniform in uniformArraySelectionRC): {
				_x setVariable ["SU_Relation",FALSE,true];
				_x setVariable ["BB_Relation",FALSE,true];
				_x setVariable ["PF_Relation",FALSE,true];
				_x setVariable ["ALF_Relation",FALSE,true];
				_x setVariable ["WO_Relation",FALSE,true];
				_x setVariable ["RU_Relation",FALSE,true];
				_x setVariable ["US_Relation",FALSE,true];
				_x setVariable ["NH_Relation",FALSE,true];
				_x setVariable ["TRB_Relation",true,true];
				_x setVariable ["RC_Relation",true,true];
				_x setVariable ["DT_Relation",FALSE,true];
				_x setVariable ["ROA_Relation",FALSE,true];
				_x setVariable ["PMC_Relation",FALSE,true];
				_x setVariable ["Bandit_Relation",FALSE,true];
				_x setVariable ["Renegade_Relation",FALSE,true];
			};
			
			//TRB
			case (_playerUniform in uniformArraySelectionTRB AND _playerGoggles in facewearArraySelectionTRB AND _playerHeadgear in headgearArraySelectionTRB): {
				_x setVariable ["SU_Relation",FALSE,true];
				_x setVariable ["BB_Relation",FALSE,true];
				_x setVariable ["PF_Relation",FALSE,true];
				_x setVariable ["ALF_Relation",FALSE,true];
				_x setVariable ["WO_Relation",FALSE,true];
				_x setVariable ["RU_Relation",FALSE,true];
				_x setVariable ["US_Relation",FALSE,true];
				_x setVariable ["NH_Relation",FALSE,true];
				_x setVariable ["TRB_Relation",true,true];
				_x setVariable ["RC_Relation",true,true];
				_x setVariable ["DT_Relation",FALSE,true];
				_x setVariable ["ROA_Relation",FALSE,true];
				_x setVariable ["PMC_Relation",FALSE,true];
				_x setVariable ["Bandit_Relation",FALSE,true];
				_x setVariable ["Renegade_Relation",FALSE,true];
			};
			
			//US
			case (_playerHeadgear in headgearArraySelectionUS AND _playerUniform in uniformArraySelectionUS AND _playerGoggles in facewearArraySelectionUS): {
				_x setVariable ["SU_Relation",FALSE,true];
				_x setVariable ["BB_Relation",FALSE,true];
				_x setVariable ["PF_Relation",FALSE,true];
				_x setVariable ["ALF_Relation",FALSE,true];
				_x setVariable ["WO_Relation",FALSE,true];
				_x setVariable ["RU_Relation",FALSE,true];
				_x setVariable ["US_Relation",true,true];
				_x setVariable ["NH_Relation",FALSE,true];
				_x setVariable ["TRB_Relation",FALSE,true];
				_x setVariable ["RC_Relation",FALSE,true];
				_x setVariable ["DT_Relation",FALSE,true];
				_x setVariable ["ROA_Relation",FALSE,true];
				_x setVariable ["PMC_Relation",FALSE,true];
				_x setVariable ["Bandit_Relation",FALSE,true];
				_x setVariable ["Renegade_Relation",FALSE,true];
			};
			
			//RU
			case (_playerHeadgear in headgearArraySelectionRU AND _playerUniform in uniformArraySelectionRU): {
				_x setVariable ["SU_Relation",FALSE,true];
				_x setVariable ["BB_Relation",FALSE,true];
				_x setVariable ["PF_Relation",FALSE,true];
				_x setVariable ["ALF_Relation",FALSE,true];
				_x setVariable ["WO_Relation",FALSE,true];
				_x setVariable ["RU_Relation",true,true];
				_x setVariable ["US_Relation",FALSE,true];
				_x setVariable ["NH_Relation",FALSE,true];
				_x setVariable ["TRB_Relation",FALSE,true];
				_x setVariable ["RC_Relation",FALSE,true];
				_x setVariable ["DT_Relation",FALSE,true];
				_x setVariable ["ROA_Relation",FALSE,true];
				_x setVariable ["PMC_Relation",FALSE,true];
				_x setVariable ["Bandit_Relation",FALSE,true];
				_x setVariable ["Renegade_Relation",FALSE,true];
			};
			
			//ROA
			case (_playerHeadgear in headgearArraySelectionROA AND _playerUniform in uniformArraySelectionROA): {
				_x setVariable ["SU_Relation",true,true];
				_x setVariable ["BB_Relation",FALSE,true];
				_x setVariable ["PF_Relation",FALSE,true];
				_x setVariable ["ALF_Relation",FALSE,true];
				_x setVariable ["WO_Relation",FALSE,true];
				_x setVariable ["RU_Relation",FALSE,true];
				_x setVariable ["US_Relation",FALSE,true];
				_x setVariable ["NH_Relation",FALSE,true];
				_x setVariable ["TRB_Relation",FALSE,true];
				_x setVariable ["RC_Relation",FALSE,true];
				_x setVariable ["DT_Relation",FALSE,true];
				_x setVariable ["ROA_Relation",true,true];
				_x setVariable ["PMC_Relation",FALSE,true];
				_x setVariable ["Bandit_Relation",FALSE,true];
				_x setVariable ["Renegade_Relation",FALSE,true];
			};
			
			//PMC
			case (_playerUniform in uniformArraySelectionPMC AND _playerGoggles in facewearArraySelectionPMC AND _playerHeadgear in headgearArraySelectionPMC): {
				_x setVariable ["SU_Relation",FALSE,true];
				_x setVariable ["BB_Relation",FALSE,true];
				_x setVariable ["PF_Relation",FALSE,true];
				_x setVariable ["ALF_Relation",FALSE,true];
				_x setVariable ["WO_Relation",FALSE,true];
				_x setVariable ["RU_Relation",FALSE,true];
				_x setVariable ["US_Relation",FALSE,true];
				_x setVariable ["NH_Relation",FALSE,true];
				_x setVariable ["TRB_Relation",FALSE,true];
				_x setVariable ["RC_Relation",FALSE,true];
				_x setVariable ["DT_Relation",FALSE,true];
				_x setVariable ["ROA_Relation",FALSE,true];
				_x setVariable ["PMC_Relation",true,true];
				_x setVariable ["Bandit_Relation",FALSE,true];
				_x setVariable ["Renegade_Relation",FALSE,true];
			};
			
			//WO
			case (_playerHeadgear in headgearArraySelectionWO AND _playerUniform in uniformArraySelectionWO): {
				_x setVariable ["SU_Relation",FALSE,true];
				_x setVariable ["BB_Relation",FALSE,true];
				_x setVariable ["PF_Relation",FALSE,true];
				_x setVariable ["ALF_Relation",FALSE,true];
				_x setVariable ["WO_Relation",true,true];
				_x setVariable ["RU_Relation",FALSE,true];
				_x setVariable ["US_Relation",FALSE,true];
				_x setVariable ["NH_Relation",FALSE,true];
				_x setVariable ["TRB_Relation",FALSE,true];
				_x setVariable ["RC_Relation",FALSE,true];
				_x setVariable ["DT_Relation",FALSE,true];
				_x setVariable ["ROA_Relation",FALSE,true];
				_x setVariable ["PMC_Relation",FALSE,true];
				_x setVariable ["Bandit_Relation",FALSE,true];
				_x setVariable ["Renegade_Relation",FALSE,true];
			};
			
			//ALF
			case (_playerUniform in uniformArraySelectionALF AND _playerGoggles in facewearArraySelectionALF AND _playerHeadgear in headgearArraySelectionALF): {
				_x setVariable ["SU_Relation",FALSE,true];
				_x setVariable ["BB_Relation",FALSE,true];
				_x setVariable ["PF_Relation",FALSE,true];
				_x setVariable ["ALF_Relation",true,true];
				_x setVariable ["WO_Relation",FALSE,true];
				_x setVariable ["RU_Relation",FALSE,true];
				_x setVariable ["US_Relation",FALSE,true];
				_x setVariable ["NH_Relation",FALSE,true];
				_x setVariable ["TRB_Relation",FALSE,true];
				_x setVariable ["RC_Relation",FALSE,true];
				_x setVariable ["DT_Relation",FALSE,true];
				_x setVariable ["ROA_Relation",FALSE,true];
				_x setVariable ["PMC_Relation",FALSE,true];
				_x setVariable ["Bandit_Relation",FALSE,true];
				_x setVariable ["Renegade_Relation",FALSE,true];
			};
			default {
				_x setVariable ["SU_Relation",true,true];
				_x setVariable ["BB_Relation",true,true];
				_x setVariable ["PF_Relation",FALSE,true];
				_x setVariable ["ALF_Relation",FALSE,true];
				_x setVariable ["WO_Relation",FALSE,true];
				_x setVariable ["RU_Relation",FALSE,true];
				_x setVariable ["US_Relation",FALSE,true];
				_x setVariable ["NH_Relation",FALSE,true];
				_x setVariable ["TRB_Relation",FALSE,true];
				_x setVariable ["RC_Relation",FALSE,true];
				_x setVariable ["DT_Relation",FALSE,true];
				_x setVariable ["ROA_Relation",FALSE,true];
				_x setVariable ["PMC_Relation",FALSE,true];
				_x setVariable ["Bandit_Relation",FALSE,true];
				_x setVariable ["Renegade_Relation",FALSE,true];
			};
		};
		sleep 3;
	} forEach allPlayers;
	sleep 15;
};