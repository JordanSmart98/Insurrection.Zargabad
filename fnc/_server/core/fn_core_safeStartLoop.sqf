missionNamespace setVariable["MissionTimer", 10, true];
while {missionNamespace getVariable["MissionTimer", 0] > 0} do
{
    private _curTime = missionNamespace getVariable["MissionTimer", 0];
    [["SafeStart", [format["Time Remaining: %1 seconds", (_curTime * 30)]]], "bis_fnc_showNotification", true] call BIS_fnc_MP;
    uiSleep 30;
    missionNamespace setVariable["MissionTimer", _curTime - 1, true];
};

[[false], "client_fnc_core_safety", allUnits] call BIS_fnc_MP;
[["SafeStartMissionStarting", ["Mission starting now!"]], "bis_fnc_showNotification", true] call BIS_fnc_MP;
missionNamespace setVariable["MissionTimer", -1, true];

