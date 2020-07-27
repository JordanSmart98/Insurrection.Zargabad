params ["_unit", "_killer", "_instigator", "_useEffects"];
diag_log "_EVENT_BOX_DESTROYED_";

private _safehouse = _unit getVariable ["local_safehouse", objNull];
private _safehouseDataArray = missionNamespace getVariable["server_safehouseData", []];
{
    if (_x select 0 == _safehouse) then
    {
        diag_log "TESTING";
        diag_log _x;
        //CHECK THE BOXES FOR LOOP?
    };
} forEach _safehouseDataArray;
