[5] call server_fnc_ins_safehouseCreate;

missionNamespace setVariable["svr_insurgent1", 0, true];
missionNamespace setVariable["svr_insurgent2", 0, true];
missionNamespace setVariable["svr_insurgent3", 0, true];

sleep 1;
waitUntil {missionNamespace getVariable["svr_missionTimer", 0] < 0};

call server_fnc_ins_dickersInit;