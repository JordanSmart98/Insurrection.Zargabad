_EndSplashScreen = {
    for "_x" from 1 to 19 do {
        sleep 3;
        [] remoteExec ["endLoadingScreen", 0];
    };
};

[] spawn _EndSplashScreen;

waitUntil {!isNil "bis_fnc_init"};

call compile preprocessFileLineNumbers "Engima\Civilians\Init.sqf";
call compile preprocessFileLineNumbers "Engima\Traffic\Init.sqf";