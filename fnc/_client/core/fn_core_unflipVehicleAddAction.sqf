if ( !canSuspend ) exitWith
{
	["Can not call this function, attempting to spawn it instead."] call BIS_fnc_error;
	[] spawn client_fnc_core_unflipVehicleAddAction;
};

private _vehicleUnflipRange = 10;
private _vehicle = objNull;
private _unflipVehicleActionID = -1;
private _isFlipped = { params [ ["_veh", objNull, [objNull] ] ]; if(isNull _veh)exitWith{false}; vectorUp _veh vectorCos surfaceNormal getPos _veh < 0.45 };

while { alive player } do
{
	uiSleep 0.5;
	private _vehicleToCheck = cursorTarget;
	
	if ( _unflipVehicleActionID < 0 && { isNull _vehicle } && { !isNull _vehicleToCheck } && { alive _vehicleToCheck } ) then 
	{
		if ( cameraOn isEqualTo player && { lifeState player in ["HEALTHY","INJURED"] } && { player distance _vehicleToCheck < _vehicleUnflipRange } ) then
		{
			if ( _vehicleToCheck isKindOf "LandVehicle" && { {alive _x}count crew _vehicleToCheck isEqualTo 0 || { _vehicleToCheck isKindOf "UGV_01_base_F" } } ) then
			{
				if ( _vehicleToCheck call _isFlipped ) then
				{
					_vehicle = _vehicleToCheck;
					private _vehicleName = (configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName") call BIS_fnc_GetCfgData;
					_unflipVehicleActionID = _vehicle addaction [format["<img image='hpp\images\action_unflip.paa' /><t color='#E5E500' shadow='2'>&#160;Unflip %1</t>", _vehicleName], "_this select 3 call client_fnc_core_unflipVehicle;", [_vehicle], 12, true, false, "", "isNull objectParent player", _vehicleUnflipRange];
				};
			};
		};
	}
	else
	{
		if ( _unflipVehicleActionID > -1 ) then // Action is added, check if we should remove it.
		{
			if ( !isNull _vehicle && { !( cursorTarget isEqualTo _vehicle ) || !( _vehicle call _isFlipped ) } ) then
			{
				_vehicle removeAction _unflipVehicleActionID;
				_unflipVehicleActionID = -1;
				_vehicle = objNull;
			};
		};
	};
};
if ( _unflipVehicleActionID > -1 && !isNull _vehicle ) then { _vehicle removeAction _unflipVehicleActionID };