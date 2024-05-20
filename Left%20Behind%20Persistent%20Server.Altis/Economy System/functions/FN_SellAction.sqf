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

FN_RemoveItem = {
	params ["_container", "_caller", "_actionId", "_arrayToCheck", "_amountToSell", "_item"];
	if (_item in _arrayToCheck) then {
		_container removeItemFromBackpack _item;
	} else {
		_amountToSell = 0;
	};
	_amountToSell;
};

_moneyPayedBack = 0;
{
	if (_x != "rvg_money") then {
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, headgearArraySelectionRare, 10, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, gasArraySelection, 3, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, coolClothing, 10, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, monoNVG, 50, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, binoNVG, 75, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, quadNVG, 200, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, explosive, 20, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, thrownExplosives, 3, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, melee, 3, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, pistol, 3, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, autoPistol, 15, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, launcherArraySelection, 50, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, smg, 15, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, shotgun, 15, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, assualtRifle, 15, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, LMG, 30, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, DMR, 35, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, sniperRifle, 40, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, antiMaterial, 80, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, opticsArraySelection, 10, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, opticsArraySelectionRare, 30, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, railArraySelection, 3, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, railArraySelectionRare, 20, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, muzzleArraySelection, 10, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, muzzleArraySelectionRare, 50, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, backpackSelection, 10, _x] call FN_RemoveItem);
		_moneyPayedBack = _moneyPayedBack + ([_container, _caller, _actionId, backpackSelectionRare, 30, _x] call FN_RemoveItem);
		if (!(isNil "_x")) then {
			_container removeItemFromBackpack _x;
			_moneyPayedBack = _moneyPayedBack + 1;
		};
	};
} forEach (backpackItems _container);

_hadToCreateTempStorage = false;
_temporaryStorage = "";
for "_i" from 1 to _moneyPayedBack do {
	if (_caller canAddItemToBackpack "rvg_money") then {
		_caller addItemToBackpack "rvg_money"; 
		hintSilent format ["All of the amount owed to you ($%2) has been put in your backpack, %1. Good doing business with you.", (name _caller), _moneyPayedBack];
	} else {
		[_container, _caller, _actionId, "rvg_money", 1, (_moneyPayedBack-_i)+1] execVM "Economy System\functions\FN_ammoBoxCheck.sqf";
		break;
	};
};