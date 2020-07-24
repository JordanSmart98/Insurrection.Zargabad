[5] call server_fnc_ins_safehouseCreate;

missionNamespace setVariable["server_insurgent1", 0, true];
missionNamespace setVariable["server_insurgent2", 0, true];
missionNamespace setVariable["server_insurgent3", 0, true];

sleep 1;
waitUntil {missionNamespace getVariable["MissionTimer", 0] < 0};

call server_fnc_ins_dickersInit;