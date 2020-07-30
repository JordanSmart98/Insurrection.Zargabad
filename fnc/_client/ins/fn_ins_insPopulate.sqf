waitUntil {!isNull (findDisplay 7000)};
disableSerialization;
private _display = findDisplay 7000;
[_display] spawn
{
    params["_display"];
    while {!isNull (findDisplay 7000)} do
    {
        if (missionNamespace getVariable["svr_insurgent1", 0] != 0) then
        {
            private _insurgentSelected1 = _display displayCtrl 7004;
            _insurgentSelected1 ctrlSetBackgroundColor [0.302,0.302,0.302,0.75];
            ctrlEnable [7001, false];
        };
        if (missionNamespace getVariable["svr_insurgent2", 0] != 0) then
        {
            private _insurgentSelected2 = _display displayCtrl 7005;
            _insurgentSelected2 ctrlSetBackgroundColor [0.302,0.302,0.302,0.75];
            ctrlEnable [7002, false];
        };
        if (missionNamespace getVariable["svr_insurgent3", 0] != 0) then
        {
            private _insurgentSelected3 = _display displayCtrl 7006;
            _insurgentSelected3 ctrlSetBackgroundColor [0.302,0.302,0.302,0.75];
            ctrlEnable [7003, false];
        };
        sleep 0.1;
    };
};