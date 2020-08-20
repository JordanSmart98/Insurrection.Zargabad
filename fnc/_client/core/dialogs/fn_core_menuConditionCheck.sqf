switch (playerSide) do {
    case west:
    {
        [blufor_triggerStartArea, (getPos player), false, false] call BIS_fnc_inTrigger
    };
    case civilian:
    {
        b3525325 = false;
        {if ((_x distance2D player) <= 10) exitWith {b3525325 = true;};} forEach (missionNamespace getVariable["svr_safehouseArray", []]);
        b3525325;
    };
}