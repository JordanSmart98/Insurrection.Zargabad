waitUntil {!isNull (findDisplay 7000)};
disableSerialization;
params["_selectedInsurgent"];

switch (_selectedInsurgent) do
{
    case 1: {//Osama Bin Laden
        missionNamespace setVariable["svr_insurgent1", 1, true];
        player setVariable["cl_insChoice", 1, true];
        player setVariable["cl_insPop", 3, true];
    };
    case 2: {//Rodall Juhziz
        missionNamespace setVariable["svr_insurgent2", 1, true];
        player setVariable["cl_insChoice", 2, true];
        player setVariable["cl_insPop", 1, true];
    };
    case 3: {//Mustafa
        missionNamespace setVariable["svr_insurgent3", 1, true];
        player setVariable["cl_insChoice", 3, true];
        player setVariable["cl_insPop", 2, true];
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