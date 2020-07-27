params ["_unit", "_killer", "_instigator", "_useEffects"];
diag_log "_EVENT_BOX_DESTROYED_";

private _safehouse = _unit getVariable ["local_safehouse", objNull];
private _safehouseDataArray = missionNamespace getVariable["server_safehouseData", []];
{
    if (_x select 0 == _safehouse) then
    {
        private _crate1 = (_x select 1);
        private _crate2 = (_x select 2);
        private _crate3 = (_x select 3);
        if (!(alive _crate1) && !(alive _crate2) && !(alive _crate3)) then
        {
            private _safehouseArray = missionNamespace getVariable["server_safehouseArray", []];
            private _safehouseIndex = _safehouseArray findIf {_x == _safehouse};
            if (_safehouseIndex != -1) then
            {
                _safehouseArray = _safehouseArray - [_safehouse];
                missionNamespace setVariable ["server_safehouseArray", _safehouseArray, true];
                format["_local_safehousemarker_%1", _safehouseIndex] remoteExec ["deleteMarkerLocal", 0];
                ["SafehouseDestroyed", ["A safehouse has been destroyed."]] remoteExec ["bis_fnc_showNotification", 0];
                {
                    if ((side _x == west) && (isPlayer _x)) then
                    {
                        _x setVariable ["local_bluforMoney", ((_x getVariable ["local_bluforMoney", 0]) + 5000)];
                        "<br/><t font='PuristaBold' align='center' size='2' color='#28b858'>+$5000</t>" remoteExec ["client_fnc_core_displayStructuredText", _x];
                    };
                } forEach allPlayers;
            };
        };
    };
} forEach _safehouseDataArray;