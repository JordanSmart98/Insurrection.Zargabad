waitUntil {!isNil "bis_fnc_init"};
[] spawn server_fnc_core_safeStartLoop;

_EndSplashScreen = {
    for "_x" from 1 to 19 do {
        sleep 3;
        [] remoteExec ["endLoadingScreen", 0];
    };
};

[] spawn _EndSplashScreen;

addMissionEventHandler ["EntityKilled", {_this remoteExec["server_fnc_core_mE_entityKilled", 2];}];

["ace_captiveStatusChanged", {call server_fnc_core_mE_aceCaptiveStatus}] call CBA_fnc_addEventHandler;

call server_fnc_ins__Init;
call server_fnc_blufor__Init;