private _decoy = "SatPhone" createVehicle position player;
_decoy attachTo [player, [0, 3, 0], "Pelvis"];

satDecoyScriptFnc =
{
    params ["_target", "_caller", "_actionId", "_arguments"];
    private _decoy = _arguments select 0;
    player setVariable["local_insSatDecoy", _decoy];

    [_decoy] spawn
    {
        params ["_decoy"];
        while{true} do
        {
            [_decoy, "snd_effect_SatDecoy"] call client_fnc_core_say3DMP;
            sleep 8;
        };
    };
    player removeAction _actionId;
    private _sat_array = missionNamespace getVariable["cl_satDecoyArray",[]];
    _sat_array pushBack _decoy;
    detach _Decoy;
    missionNamespace setVariable ["cl_satDecoyArray", _sat_array, true];
    missionNamespace setVariable ["cl_satDecoyArrayCount", count _sat_array, true];
    [player, 1, ["ACE_SelfActions", "INS_AceMenu", "INS_satDecoyPlace"]] call ace_interact_menu_fnc_removeActionFromObject;
};

// Place Sat Decoy Action
[player, ["Setup sattelite scan decoy", {_this call satDecoyScriptFnc},[_decoy],1,true,true,"","(side _this == CIVILIAN)",50,false,"",""]] remoteExec ["addAction", 0, true];
[player, ["local_insSatDecoyPlaced", 1, true]] remoteExec ["setVariable", 0, true];