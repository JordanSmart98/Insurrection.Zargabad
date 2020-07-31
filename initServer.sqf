waitUntil {!isNil "bis_fnc_init"};
[] spawn server_fnc_core_safeStartLoop;

addMissionEventHandler ["EntityKilled", {_this remoteExec["server_fnc_core_mE_entityKilled", 2];}];

["ace_captiveStatusChanged", {call server_fnc_core_mE_aceCaptiveStatus}] call CBA_fnc_addEventHandler;

call server_fnc_ins__Init;
call server_fnc_blufor__Init;