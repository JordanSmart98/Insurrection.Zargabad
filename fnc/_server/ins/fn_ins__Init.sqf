[5] call server_fnc_ins_safehouseCreate;

missionNamespace setVariable["svr_insurgent1", 0, true];
missionNamespace setVariable["svr_insurgent2", 0, true];
missionNamespace setVariable["svr_insurgent3", 0, true];

[] spawn server_fnc_ins_dickersInit;