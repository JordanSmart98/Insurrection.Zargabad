private _decoy = "SatPhone" createVehicle position player;
_decoy attachTo [player, [0, 3, 0], "Pelvis"];




ScriptFnc = {
    params ["_target", "_player", "_actionId", "_arguments"];
    private _decoy = _arguments select 0;
    detach _decoy;
    player setVariable["local_insSatDecoy", _decoy];
    [_decoy] spawn {while{true} do {[(_this select 0), "snd_effect_SatDecoy"] call client_fnc_core_say3DMP;sleep 8;};};
    player removeAction _actionId;
};

// Place Sat Decoy Action
[player, ["Setup sattelite scan decoy", {_this call ScriptFnc},[_decoy],1,true,true,"","(side _this == CIVILIAN)",50,false,"",""]] remoteExec ["addAction", 0, true];
[player, ["local_insSatDecoyPlaced", 1, true]] remoteExec ["setVariable", 0, true];


