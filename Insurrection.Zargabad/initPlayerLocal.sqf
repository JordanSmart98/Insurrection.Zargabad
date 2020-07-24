params ["_player", "_didJIP"];
waitUntil {!isNil "bis_fnc_init"};
waitUntil {!isNull player};

[true] call client_fnc_core_safety;
[] call client_fnc_core_keyDownHandler;
[] spawn client_fnc_core_briefing;

switch(side player) do {
    case west: {[] spawn client_fnc_blufor__Init;};
    case civilian: {[] spawn client_fnc_ins__Init;};
};

player enableStamina false;