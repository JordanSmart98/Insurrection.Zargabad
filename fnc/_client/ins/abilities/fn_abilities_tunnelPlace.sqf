params["_insPlayer"];

[] remoteExec ["addAction", 0, true];

private _tunnel = "Land_KBud" createVehicle position _insPlayer;
_tunnel attachTo [_insPlayer, [0, 3, 0], "Pelvis"];

// Place Tunnel Action
[
    "Setup tunnel", // title
    {
        params ["_target", "_insPlayer", "_actionId", "_arguments"];

        _tunnel = _arguments select 0;
        detach _tunnel;
        [_insPlayer, "AmovPercMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon", 1] call ace_common_fnc_doAnimation;

        [2, //total time
        [_insPlayer, _actionId, _tunnel], // arguments
        {
            params ["_params"];
            _insPlayer = _params select 0;
            _actionId = _params select 1;
            _tunnel = _params select 2;
            // TODO Change Sound Effect
            [_insPlayer, "snd_effect_roadblock"] call client_fnc_core_say3DMP;
            _insPlayer removeAction _actionId;
            "<t font='PuristaMedium' align='center' size='2'>tunnel Placed</t>" call client_fnc_core_displayStruacturedText;
            _insPlayer setVariable["local_insTunnelCount",(_insPlayer getVariable "local_insTunnelCount")+1,true];
            switch (_insPlayer getVariable "local_insTunnelCount") do
            {
                case 1: {_insPlayer setVariable["local_insTunnel1",_tunnel];};
                case 2: {_insPlayer setVariable["local_insTunnel2",_tunnel];};
            };
            if (_insPlayer getVariable "local_insTunnelCount" == 2) then
                {
                     (_insPlayer getVariable "local_insTunnel1") addAction
                     ["Enter Tunnels",
                     { params ["_target", "_caller", "_actionId", "_arguments"];
                     _insPlayer = _arguments select 0;
                     _caller setPos (getPos (_insPlayer getVariable "local_insTunnel2"))
                     },
                     [_insPlayer], // arguments
                     1,		    // priority
                     true,		// showWindow
                     true,		// hideOnUse
                     "",			// shortcut
                     "(side _this == CIVILIAN)", 	// condition
                     50,			// radius
                     false,		// unconscious
                     ""			// selection
                     ];

                     (_insPlayer getVariable "local_insTunnel2") addAction
                     ["Enter Tunnels",
                     { params ["_target", "_caller", "_actionId", "_arguments"];
                     _insPlayer = _arguments select 0;
                     _caller setPos (getPos (_insPlayer getVariable "local_insTunnel1"))
                     },
                     [_insPlayer], // arguments
                     1,		    // priority
                     true,		// showWindow
                     true,		// hideOnUse
                     "",			// shortcut
                     "(side _this == CIVILIAN)", 	// condition
                     50,			// radius
                     false,		// unconscious
                     ""			// selection
                     ];
                     [_insPlayer, 1, ["ACE_SelfActions", "INS_AceMenu", "INS_tunnelPlace"]] call ace_interact_menu_fnc_removeActionFromObject;
                };
        }, // script on finish
        {
            params ["_params"];
            _insPlayer = _params select 0;
            _tunnel = _params select 2;
            deleteVehicle _tunnel;
            ["ace_common_displayTextStructured", ["<t size='1.5'>Interrupted</t>", 2, _insPlayer], [_insPlayer]] call CBA_fnc_targetEvent;
        }, // script on fail
        "Building" // localised title
        ]call ace_common_fnc_progressBar;

    },  // script
    [_tunnel], // arguments
    1,		    // priority
    true,		// showWindow
    true,		// hideOnUse
    "",			// shortcut
    "(side _this == CIVILIAN)", 	// condition
    50,			// radius
    false,		// unconscious
    "",			// selection
     ""			// memoryPoint
    ]remoteExec ["addAction", 0, true];

