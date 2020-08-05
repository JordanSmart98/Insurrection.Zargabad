params ["_unit", "_state", "_reason"];
private _isDicker = _unit getVariable["cl_insDicker", false];
if (_isDicker) then {
    private _hook = ["BLU_Interrogate", "Interrogate Prisoner", "hpp\images\bluforInt.paa", {call client_fnc_blufor_interrogate;}, {true}] call ace_interact_menu_fnc_createAction;
    [_unit, 0, ["ACE_MainActions"], _hook] remoteExec ["ace_interact_menu_fnc_addActionToObject"];
};