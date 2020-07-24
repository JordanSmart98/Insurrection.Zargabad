player setVariable ["local_bluforMoney", 10000, true];
player setVariable ["local_bluforLastScanTime", time, true];

private _bluforActionMenu = ["BLU_AceMenu","Blufor Menu","",{nil},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _bluforActionMenu] call ace_interact_menu_fnc_addActionToObject;

waitUntil {missionNamespace getVariable["MissionTimer", 0] < 0};

private _hook = ["BLU_SatelliteScan", "Satellite Scan",  "", {[player] call client_fnc_blufor_scan},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "BLU_AceMenu"], _hook] call ace_interact_menu_fnc_addActionToObject;
