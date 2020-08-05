params ["_player", "_didJIP"];
waitUntil {!isNil "bis_fnc_init"};
waitUntil {!isNull player};

[] call client_fnc_core_keyDownHandler;
[] spawn client_fnc_core_briefing;

if (missionNamespace getVariable["svr_missionTimer", 0] > 0) then {
    [true] call client_fnc_core_safety;
};

private _bluforTeam = missionNamespace getVariable ["svr_allP_blufor", []];
private _civilianTeam = missionNamespace getVariable ["svr_allP_civ", []];

switch(side player) do {
    case west: {[] spawn client_fnc_blufor__Init; _bluforTeam pushBackUnique player;};
    case civilian: {[] spawn client_fnc_ins__Init; _civilianTeam pushBackUnique player;};
};

missionNamespace setVariable ["svr_allP_blufor", _bluforTeam, true];
missionNamespace setVariable ["svr_allP_civ", _civilianTeam, true];

if ((paramsArray select 1) == 1) then {player enableStamina false;};
if ((paramsArray select 2) != 4) then {[] spawn client_fnc_core_restrictView;};
setTerrainGrid 50;