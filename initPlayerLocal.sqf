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

if ((paramsArray select 1) == 1) then {player enableStamina false;};
if ((paramsArray select 2) != 4) then {[] spawn client_fnc_core_restrictView;};