player setVariable ["local_bluforMoney", 10000, true];
player setVariable ["local_bluforLastScanTime", time, true];

private _bluforActionMenu = ["BLU_AceMenu","Blufor Menu","hpp\images\bluforIcon.paa",{nil},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _bluforActionMenu] call ace_interact_menu_fnc_addActionToObject;

["FOB Price", "Kandahar Region", format["%1/%2/%3", date select 2, date select 1, date select 0]] spawn BIS_fnc_infoText;

waitUntil {missionNamespace getVariable["server_missionTimer", 0] < 0};

private _hook = ["BLU_SatelliteScan", "Satellite Scan",  "hpp\images\bluforScan.paa", {[player] call client_fnc_blufor_scan},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "BLU_AceMenu"], _hook] call ace_interact_menu_fnc_addActionToObject;

[] spawn client_fnc_blufor_markerManagerStatic;