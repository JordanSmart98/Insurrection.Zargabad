private ["_pos","_px","_py","_nam","_col", "_lastScan", "_cooldown"];
GridMarkerList = [];

_lastScan = player getVariable ["local_bluforLastScanTime", 0];
if (_lastScan + 60 <= time) then
{
	[] spawn
	{
		[player, "snd_effect_scanp1"] call client_fnc_core_say3DMP;
		sleep 3;
		[player, "snd_effect_scanp2"] call client_fnc_core_say3DMP;

		{deleteMarkerLocal _x;} count GridMarkerList;
		GridMarkerList = [];
		{
			_isCiv = ((side _x) isEqualTo civilian);
			_isPlayer = (isPlayer _x);

			if (_isCiv && _isPlayer) then
			{
				_pos = getPosATL _x;
				_px = floor ((_pos select 0) / 100);
				_py = floor ((_pos select 1) / 100);
				_nam = format["grid_%1_%2",_px,_py];
				_col = "ColorRed";

				if ((markerShape _nam) isEqualTo "RECTANGLE") then
				{
					if (((markerColor _nam) isEqualTo _col)) then
					{
						_nam setMarkerAlpha ((markerAlpha _nam) + 0.2);
					}
					else
					{
						_nam setMarkerColor "ColorOrange";
						_nam setMarkerAlpha ((markerAlpha _nam) + 0.2);
					};
				}
				else
				{
					createMarker[_nam,[(_px*100)+50,(_py*100)+50,0]];
					_nam setMarkerShape "RECTANGLE";
					_nam setMarkerSize [50,50];
					_nam setMarkerColor _col;
					_nam setMarkerAlpha 0.4;
					GridMarkerList pushBack _nam;
				};
				true
			};
		} count allUnits;
	};
	player setVariable ["local_bluforLastScanTime", time, true];
}
else
{
	["ace_common_displayTextStructured", ["<t size='1.2'>Scan on cooldown</t>", 2, player], [player]] call CBA_fnc_targetEvent;
};