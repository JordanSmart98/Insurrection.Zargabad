private _decoy = createVehicle["Land_SatelliteAntenna_01_F", position player, [], 0, "NONE"];
_decoy attachTo [player, [0, 2, 0.125], "Pelvis"];

// Script that executes when Satellite Decoy Action is completed
satDecoyScriptFnc =
{
    params ["_target", "_caller", "_actionId", "_arguments"];
    private _decoy = _arguments select 0;
    detach _decoy;

    // Remove player actions
    player removeAction _actionId;
    [player, 1, ["ACE_SelfActions", "INS_AceMenu", "INS_satDecoyPlace"]] call ace_interact_menu_fnc_removeActionFromObject;


    // Store Sat Decoy data in missionNamespace variables
    private _sat_array = missionNamespace getVariable["cl_satDecoyArray",[]];
    _sat_array pushBack _decoy;
    missionNamespace setVariable ["cl_satDecoyArray", _sat_array, true];
    missionNamespace setVariable ["cl_satDecoyArrayCount", count _sat_array, true];

    // Add explosion event handler
    _decoy addEventHandler
    ["Explosion",
    {
    	params ["_vehicle", "_damage"];
    	private _decoy = _vehicle;
    	private _sat_array = missionNamespace getVariable["cl_satDecoyArray",[]];

    	// Delete vehicle and update global Sat Decoy variables
    	deleteVehicle _decoy;
        _sat_array deleteAt (_sat_array find _decoy);
        missionNamespace setVariable ["cl_satDecoyArray", _sat_array, true];
        missionNamespace setVariable ["cl_satDecoyArrayCount", count _sat_array, true];

        // Add reward
        {
            if ((side _x == west) && (isPlayer _x)) then
            {
                _x setVariable ["cl_money", ((_x getVariable ["cl_money", 0]) + 2000)];
                "<br/><t font='PuristaBold' align='center' size='2' color='#28b858'>+$2000</t>" remoteExec ["client_fnc_core_displayStructuredText", _x];
            };
        } forEach allPlayers;
    }
    ];

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


// Place Satellite Decoy Action
[player, ["Place Satellite Scan decoy", {_this call satDecoyScriptFnc},[_decoy],1,true,true,"","(side _this == CIVILIAN)",50,false,"",""]] remoteExec ["addAction", 0, true];

