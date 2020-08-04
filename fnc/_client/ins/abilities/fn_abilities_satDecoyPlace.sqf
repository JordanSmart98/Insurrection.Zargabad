private _decoy = createVehicle["Land_SatelliteAntenna_01_F", position player, [], 0, "NONE"];
_decoy attachTo [player, [0, 2, 0.125], "Pelvis"];

satDecoyScriptFnc =
{
    params ["_target", "_caller", "_actionId", "_arguments"];
    private _decoy = _arguments select 0;
    detach _decoy;

    // Remove player actions
    player removeAction _actionId;
    [player, 1, ["ACE_SelfActions", "INS_AceMenu", "INS_satDecoyPlace"]] call ace_interact_menu_fnc_removeActionFromObject;

    // Store decoy data in missionNamespace variables
    private _sat_array = missionNamespace getVariable["cl_satDecoyArray",[]];
    _sat_array pushBack _decoy;
    missionNamespace setVariable ["cl_satDecoyArray", _sat_array, true];
    missionNamespace setVariable ["cl_satDecoyArrayCount", count _sat_array, true];

    // Add explosion event
    _decoy addEventHandler ["Explosion",
    {
    	params ["_vehicle", "_damage"];
    	deleteVehicle _vehicle;
    }];

    // Spawn audio on vehicle loop
    while{True} do
    {
        [_decoy] spawn
        {
             params ["_decoy"];
             [_decoy, "snd_effect_SatDecoy"] call client_fnc_core_say3DMP;
        };
        sleep 8;
    };

};

// Place Sat Decoy Action
[player, ["Setup sattelite scan decoy", {_this call satDecoyScriptFnc},[_decoy],1,true,true,"","(side _this == CIVILIAN)",50,false,"",""]] remoteExec ["addAction", 0, true];