params [ ["_vehicle", objNull, [objNull]] ];

if ( isNull _vehicle ) exitWith { false };

private _vectorDiff = vectorUp _vehicle vectorDotProduct surfaceNormal getPos _vehicle;
private _upsideDown = _vectorDiff < -0.75; 
private _vehicleBank = _vehicle call BIS_fnc_getPitchBank select 1;
private _turnLeft = [false, true] select ( _vehicleBank >= 0 );


if ( _upsideDown ) then
{
	_turnLeft = [true, false] select _turnLeft;
};


private _forceParams = [ [1.5, 5], [2.5, 6] ] select ( _vehicle isKindOf "MRAP_03_base_F" );
_forceParams = [ _forceParams, [1.2, 8] ] select ( _vehicle isKindOf "B_APC_Tracked_01_base_F" || { _vehicle isKindOf "MBT_01_base_F" } );

private _force = getMass _vehicle * (_forceParams select _upsideDown);

private _addForcePointX = boundingBoxReal _vehicle select ([0, 1] select _turnLeft) select 0;
private _addForcePointZ = boundingBoxReal _vehicle select ([1, 0] select _upsideDown) select 2;

_vehicle addForce [_vehicle vectorModelToWorld [[_force, - _force]select _turnLeft, 0, 0], [_addForcePointX, 0, _addForcePointZ]];

true