if (((player getVariable ["cl_lastScan", 0]) + 60) <= time) then
{
	[] spawn
	{
		[player, "snd_effect_scanp1"] call client_fnc_core_say3DMP;
		sleep 3;
		[player, "snd_effect_scanp2"] call client_fnc_core_say3DMP;
		private _civilianPlayers = (civilian call server_fnc_core_getPlayers);
		{
            private _pos = getPosATL _x;
            private _px = floor ((_pos select 0) / 100);
            private _py = floor ((_pos select 1) / 100);
            private _markerName = format["grid_%1_%2", _px, _py];

            private _existingMarker = getMarkerPos _markerName;
            if (!(_existingMarker isEqualTo [0,0,0])) then {
                _markerName setMarkerAlpha ((markerAlpha _markerName) + 0.2);
            }
            else
            {
                private _marker = createMarker[_markerName, [(_px * 100) + 50, (_py * 100) + 50, 0]];
                _marker setMarkerShape "RECTANGLE";
                _marker setMarkerSize [50,50];
                _marker setMarkerColor "ColorRed";
                _marker setMarkerAlpha 0.2;
            };
		} forEach _civilianPlayers;
		{
            private _pos = getPosATL _x;
            private _px = floor ((_pos select 0) / 100);
            private _py = floor ((_pos select 1) / 100);
            private _markerName = format["grid_%1_%2", _px, _py];
            private _existingMarker = getMarkerPos _markerName;
            if (!(_existingMarker isEqualTo [0,0,0])) then {
                _markerName setMarkerAlpha ((markerAlpha _markerName) + 0.2);
            }
            else
            {
                private _marker = createMarker[_markerName, [(_px * 100) + 50, (_py * 100) + 50, 0]];
                _marker setMarkerShape "RECTANGLE";
                _marker setMarkerSize [50,50];
                _marker setMarkerColor "ColorRed";
                _marker setMarkerAlpha 0.2;
            };
		} forEach (missionNamespace getVariable["svr_satDecoyArray",[]]);
	};
	player setVariable ["cl_lastScan", time, true];
}
else
{
    ["<t font='PuristaBold' align='center' size='2'>Scan on cooldown</t>"] call client_fnc_core_displayStructuredText;
};

