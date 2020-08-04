waitUntil {!isNil "bis_fnc_init"};

call compile preprocessFileLineNumbers "Engima\Civilians\Init.sqf";
call compile preprocessFileLineNumbers "Engima\Traffic\Init.sqf";

_EndSplashScreen = {
    for "_x" from 1 to 19 do {
        sleep 3;
        endLoadingScreen;
    };
};

[] spawn _EndSplashScreen;