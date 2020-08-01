private _tunnel = "Land_KBud" createVehicle position player;
_tunnel attachTo [player, [0, 3, 0], "Pelvis"];

tunnelScriptFnc = {
    params ["_target", "_player", "_actionId", "_arguments"];
    _tunnel = _arguments select 0;
    detach _tunnel;
    [player, "AmovPercMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon", 1] call ace_common_fnc_doAnimation;

    [2,[_actionId, _tunnel],
    {
        params ["_params"];
        _actionId = _params select 0;
        _tunnel = _params select 1;

        // TODO Change Sound Effect
        [player, "snd_effect_roadblock"] call client_fnc_core_say3DMP;
        player removeAction _actionId;
        "<t font='PuristaMedium' align='center' size='2'>tunnel Placed</t>" call client_fnc_core_displayStructuredText;
        player setVariable["local_insTunnelCount",(player getVariable "local_insTunnelCount")+1,true];

        switch (player getVariable "local_insTunnelCount") do
        {
            case 1: {player setVariable["local_insTunnel1", _tunnel];};
            case 2: {player setVariable["local_insTunnel2", _tunnel];};
        };

        if (player getVariable "local_insTunnelCount" == 2) then
        {
             [(player getVariable "local_insTunnel2"), ["Enter Tunnels", {[10,[],{player setPos (getPos (player getVariable "local_insTunnel1"));},{["ace_common_displayTextStructured", ["<t size='1.5'>Interrupted</t>", 2, player], [player]] call CBA_fnc_targetEvent;},"Traveling..."] call ace_common_fnc_progressBar; },[],1,true,true,"","(side _this == CIVILIAN)",1,false,""]] remoteExec ["addAction", 0, true];
             [(player getVariable "local_insTunnel1"), ["Enter Tunnels", {[10,[],{player setPos (getPos (player getVariable "local_insTunnel2"));},{["ace_common_displayTextStructured", ["<t size='1.5'>Interrupted</t>", 2, player], [player]] call CBA_fnc_targetEvent;},"Traveling..."] call ace_common_fnc_progressBar; },[],1,true,true,"","(side _this == CIVILIAN)",1,false,""]] remoteExec ["addAction", 0, true];
             [player, 1, ["ACE_SelfActions", "INS_AceMenu", "INS_tunnelPlace"]] call ace_interact_menu_fnc_removeActionFromObject;
        };
    },
    {
        params ["_params"];
        _tunnel = _params select 1;
        deleteVehicle _tunnel;
        ["ace_common_displayTextStructured", ["<t size='1.5'>Interrupted</t>", 2, player], [player]] call CBA_fnc_targetEvent;
    },
    "Building"] call ace_common_fnc_progressBar;
};


// Place Tunnel Action
[player, ["Setup tunnel", {_this call tunnelScriptFnc},[_tunnel],1,true,true,"","(side _this == CIVILIAN)",50,false,"",""]] remoteExec ["addAction", 0, true];

