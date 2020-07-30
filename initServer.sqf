waitUntil {!isNil "bis_fnc_init"};
[] spawn server_fnc_core_safeStartLoop;

addMissionEventHandler ["EntityKilled", {_this remoteExec["server_fnc_core_mE_entityKilled", 2];}];

["ace_captiveStatusChanged", {call server_fnc_core_mE_aceCaptiveStatus}] call CBA_fnc_addEventHandler;

call server_fnc_ins__Init;
call server_fnc_blufor__Init;

sleep 1;
waitUntil {missionNamespace getVariable["svr_missionTimer", 0] < 0};

deleteVehicle blueNorth;
deleteVehicle blueEast;
deleteVehicle blueSouth;
deleteVehicle blueWest;