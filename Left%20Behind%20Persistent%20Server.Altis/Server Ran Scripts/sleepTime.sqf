sleep 5;

while {true} do {
	private _counter = 0;
	private _allPlayersNearSleepingBags = true;
	private _players = call BIS_fnc_listPlayers;
	{
		//hintSilent format ["%1 wants to sleep: %2", (name _x), (_x getVariable "wants_to_sleep")];
		if (_x getVariable "wants_to_sleep") then {
			_counter = _counter + 1;
		};
		
		_objects = nearestObjects [_x, ["Land_Sleeping_bag_F"], 5];
		if (count _objects == 0) then {
			_allPlayersNearSleepingBags = false;
		};
		sleep .1;
	} forEach _players;
	
	if (_counter == count _players) then {
		if (_allPlayersNearSleepingBags) then {
			cutText ["", "BLACK OUT", 2.5]; // Black screen
			
			sleep 5;
			[[2039,3,22,6,0]] remoteExec ["setDate"];
			
			{
				_x switchMove "AmovPpneMstpSrasWrflDnon";
				_x setVariable ["wants_to_sleep", false, true];
				sleep .1;
			} forEach _players;
			
			sleep 1;
			cutText ["", "BLACK IN", 5]; // and then, the black screen fade away...
		} else {
			hintSilent "Not all players are near their sleeping bags; however, all players are trying to sleep";
			sleep 5;
			hintSilent "";
		};
	};
	sleep 10;
};