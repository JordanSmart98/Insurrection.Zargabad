waitUntil {!isNull (findDisplay 7000)};
disableSerialization;
params["_selectedInsurgent"];

switch (_selectedInsurgent) do
{
    case 1: {//Osama Bin Laden
        missionNamespace setVariable["svr_insurgent1", 1, true];
        player setVariable["cl_insChoice", 1, true];
        missionNamespace setVariable["svr_dickersPercent", 30, true];
        missionNamespace setVariable["svr_dickersWill", 25, true];

        private _tunnelAction = ["INS_tunnelPlace", "Place Tunnel", "hpp\images\insTunnel.paa", {call client_fnc_abilities_tunnelPlace;}, {true}, {}, []] call ace_interact_menu_fnc_createAction;
        [player, 1, ["ACE_SelfActions", "INS_AceMenu"], _tunnelAction] call ace_interact_menu_fnc_addActionToObject;
        player setVariable["local_insTunnelCount", 0, true];

        private _satDecoyAction = ["INS_satDecoyPlace", "Place Sat Decoy", "hpp\images\insSatDecoy.paa", {call client_fnc_abilities_satDecoyPlace;}, {true}, {}, []] call ace_interact_menu_fnc_createAction;
        [player, 1, ["ACE_SelfActions", "INS_AceMenu"], _satDecoyAction] call ace_interact_menu_fnc_addActionToObject;
        player setVariable["cl_insSatDecoyPlaced", 0, true];
    };
    case 2: {//Rodall Juhziz
        missionNamespace setVariable["svr_insurgent2", 1, true];
        player setVariable["cl_insChoice", 2, true];
        missionNamespace setVariable["svr_dickersPercent", 10, true];
        missionNamespace setVariable["svr_dickersWill", 80, true];
    };
    case 3: {//Mustafa
        missionNamespace setVariable["svr_insurgent3", 1, true];
        player setVariable["cl_insChoice", 3, true];
        missionNamespace setVariable["svr_dickersPercent", 20, true];
        missionNamespace setVariable["svr_dickersWill", 30, true];
    };
};

(findDisplay 7000) displayRemoveAllEventHandlers "KeyDown";
closeDialog 1;

["teleportSelf", "onMapSingleClick", {[_pos select 0, _pos select 1, 0] call client_fnc_ins_insurgentTeleport;}, [player]] call BIS_fnc_addStackedEventHandler;
[] spawn
{
    sleep 10;
    waitUntil {missionNamespace getVariable["svr_missionTimer", 0] < 0};
    ["teleportSelf","onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
}