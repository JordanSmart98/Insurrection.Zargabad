missionNamespace setVariable["svr_missionTimer", 10, true];
while {missionNamespace getVariable["svr_missionTimer", 0] > 0} do
{
    private _curTime = missionNamespace getVariable["svr_missionTimer", 0];
    ["SafeStart", [format["Time Remaining: %1 seconds", (_curTime * 30)]]] remoteExec ["bis_fnc_showNotification", 0];
    uiSleep 30;
    missionNamespace setVariable["svr_missionTimer", (missionNamespace getVariable["svr_missionTimer", 0]) - 1, true];
};

[false] remoteExec ["client_fnc_core_safety", 0];
["SafeStartMissionStarting", ["Mission starting now!"]] remoteExec ["bis_fnc_showNotification", 0];
missionNamespace setVariable["svr_missionTimer", -1, true];

