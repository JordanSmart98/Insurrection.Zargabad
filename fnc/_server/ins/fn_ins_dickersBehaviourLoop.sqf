#define DETECTION_COOLDOWN 30
[] spawn
{	
	while {true} do 
	{
		private ["_dickersArray", "_Dicker", "_CloseBluforPlayer", "_LastDistance", "_CurrentDistance"];
		_dickersArray = missionNamespace getVariable "svr_dickersArray";
		if (!isNil "_dickersArray") then
		{
			{
				_Dicker = _x;
				_CloseBluforPlayer = objNull;
				_LastDistance = 10;
				{
				   if(!((vehicle _x) isKindOf "AIR")) then
				   {
					   _CurrentDistance = _x distance _Dicker;
					   if((isPlayer _x && side _x != civilian) && (_CurrentDistance < _LastDistance)) then
					   {
						   _CloseBluforPlayer = _x;
						   _LastDistance = _CurrentDistance;
					   };
				   };
				} forEach allPlayers;
	
				if (isNull _CloseBluforPlayer) then
				{
					_Dicker enableAI "Move";
				}
				else
				{
					private _LastDetection = _Dicker getVariable["cl_lastDetect", 0];
					if (_LastDetection + (DETECTION_COOLDOWN + (random 10)) < time) then
					{
						_Dicker setVariable ["cl_lastDetect", time, true];
						_Dicker disableAI "move";
						_Dicker lookAt _CloseBluforPlayer;
						[_Dicker, "AinvPercMstpSnonWnonDnon_G01"] remoteExec ["switchMove", 0, true];
														
						private _TimeHour = floor daytime;
						private _TimeMinute = floor ((daytime - _TimeHour) * 60);
						private _TimeSecond = floor (((((daytime) - (_TimeHour))*60) - _TimeMinute)*60);
						private _Time24 = text format ["%1:%2:%3", _TimeHour, _TimeMinute, _TimeSecond];
												
						private _markerArray = missionNamespace getVariable["svr_dickerSpottedArray", []];
						private _markerArrayCount = missionNamespace getVariable["svr_dickerSpotC", 0];
						if (_markerArrayCount == 0 || _markerArrayCount <= 4) then
						{
							_markerArray pushBack [_CloseBluforPlayer, _Time24, (position _CloseBluforPlayer)];
							missionNamespace setVariable["svr_dickerSpottedArray", _markerArray, true];
							missionNamespace setVariable["svr_dickerSpotC", count _markerArray, true];
						}
						else
						{
                            _markerArray deleteAt 0;
                            _markerArray pushBack [_CloseBluforPlayer, _Time24, (position _CloseBluforPlayer)];
                            missionNamespace setVariable["svr_dickerSpottedArray", _markerArray, true];
                            missionNamespace setVariable["svr_dickerSpotC", count _markerArray, true];
						};
					};
				};
			} forEach _dickersArray;
		};
		
		sleep 3;
	};
};