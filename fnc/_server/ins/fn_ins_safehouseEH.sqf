params ["_unit", "_killer", "_instigator", "_useEffects"];

private _safehouse = _unit getVariable ["local_safehouse", objNull];
private _safehouseDataArray = missionNamespace getVariable["svr_safehouseData", []];
{
    if (_x select 0 == _safehouse) then
    {
        private _crate1 = (_x select 1);
        private _crate2 = (_x select 2);
        private _crate3 = (_x select 3);
        if (!(alive _crate1) && !(alive _crate2) && !(alive _crate3)) then
        {
            private _safehouseArray = missionNamespace getVariable["svr_safehouseArray", []];
            private _safehouseIndex = _safehouseArray findIf {_x == _safehouse};
            if (_safehouseIndex != -1) then
            {
                private _safehouseIndex = _safehouseArray find _safehouse;
                _safehouseArray deleteAt _safehouseIndex;
                missionNamespace setVariable ["svr_safehouseArray", _safehouseArray, true];
                // Set state of safehouse child task
                [format ["Destroy_Safehouse_%1_Task",_safehouseIndex+1],"SUCCEEDED"] call BIS_fnc_taskSetState;
                format["_local_safehousemarker_%1", _safehouseIndex] remoteExec ["deleteMarkerLocal", 0];
                ["SafehouseDestroyed", ["A safehouse has been destroyed."]] remoteExec ["bis_fnc_showNotification", 0];
                {
                    if ((side _x == west) && (isPlayer _x)) then
                    {
                        _x setVariable ["cl_money", ((_x getVariable ["cl_money", 0]) + 5000)];
                        "<br/><t font='PuristaBold' align='center' size='2' color='#28b858'>+$5000</t>" remoteExec ["client_fnc_core_displayStructuredText", _x];
                    };
                } forEach allPlayers;
            };
        };
    };
} forEach _safehouseDataArray;
