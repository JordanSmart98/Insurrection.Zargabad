private _objects = nearestObjects [player, ["LandVehicle"], 3.5];
if (count _objects == 0) exitWith {["<t font='PuristaLight' align='center' size='1'>No valid vehicles in range</t>"] call client_fnc_core_displayStructuredText;};

[player, "AmovPercMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon", 1] call ace_common_fnc_doAnimation;
private _statementOnSuccess = {
    params ["_params"];
    ["<t font='PuristaMedium' align='center' size='2'>IED Armed</t>"] call client_fnc_core_displayStructuredText;
    [player, "snd_effect_carbomb"] call client_fnc_core_say3DMP;

    private _car = _params select 0;
    private _bomb = createVehicle ["CUP_IED_V4", getPos _car, [], 0, "CAN_COLLIDE"];
    _bomb attachTo [_car, [0,0,0]];
    _bomb setVectorDirAndUp [[1,-0,-0],[0,0,1]];

    [player, 1, ["ACE_SelfActions", "INS_AceMenu", "INS_MountCarbomb"]] call ace_interact_menu_fnc_removeActionFromObject;
    _car call client_fnc_items_CarbombDetonate;
    //_car addEventHandler ["Deleted", {[_this select 1, ]}]; create variables car + player, get car index select player re-add carbomb item;
};

private _statementOnFailure = {
    ["<t font='PuristaMedium' align='center' size='2'>Interrupted</t>"] call client_fnc_core_displayStructuredText;
};

private _car = _objects select 0;
[5, [_car], _statementOnSuccess, _statementOnFailure, "Mounting"] call ace_common_fnc_progressBar;