params["_x1", "_y1", "_z1"];
private _pos = [_x1, _y1, _z1];
if (missionNamespace getVariable["MissionTimer", 0] > 0) then
{
	if (_pos inArea civ_triggerPlayArea) then
	{
		vehicle player setPos _pos;
		openMap false;
	};
}
else
{
	["teleportSelf","onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
};