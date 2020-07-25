params["_amount"];
private _selectedBuildings = missionNamespace getVariable ["server_safehouseArray", []];
private _count = missionNamespace getVariable ["server_safehouseCount", 0];
while {count _selectedBuildings != _count + _amount} do
{
	private _pos = "marker_1" call BIS_fnc_randomPosTrigger;
	private _objBuildings = nearestObjects [_pos, ["Land_House_C_10_EP1", "Land_House_C_9_EP1", "Land_House_C_4_EP1", "Land_House_C_3_EP1"], 200];
	if (count _objBuildings > 0) then
	{
		private _randomBuilding = _objBuildings select 0;
		private _position = getPos _randomBuilding;
		if (_position inArea "marker_0") then
		{
			if ((_selectedBuildings pushBackUnique _randomBuilding) != -1) then
			{
                [typeOf _randomBuilding, getPos _randomBuilding, getDir _randomBuilding] call server_fnc_ins_safehouseLoad;
			};
		};
	};
};

missionNamespace setVariable ["server_safehouseArray", _selectedBuildings, true];
missionNamespace setVariable ["server_safehouseCount", count _selectedBuildings, true];