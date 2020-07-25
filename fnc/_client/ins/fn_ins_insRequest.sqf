waitUntil {!isNull (findDisplay 7000)};
disableSerialization;
params["_selectedInsurgent"];

switch (_selectedInsurgent) do
{
    case 1: {//Osama Bin Laden
        missionNamespace setVariable["server_insurgent1", 1, true];
        player setVariable["local_insSelected", 1, true];
        player setVariable["local_insPopularity", 3, true];
    };
    case 2: {//Rodall Juhziz
        missionNamespace setVariable["server_insurgent2", 1, true];
        player setVariable["local_insSelected", 2, true];
        player setVariable["local_insPopularity", 1, true];
    };
    case 3: {//Mustafa
        missionNamespace setVariable["server_insurgent3", 1, true];
        player setVariable["local_insSelected", 3, true];
        player setVariable["local_insPopularity", 2, true];
    };
};

player setVariable["local_insPlayer", _selectedInsurgent, true];

(findDisplay 7000) displayRemoveAllEventHandlers "KeyDown";
closeDialog 1;

["teleportSelf", "onMapSingleClick", {[_pos select 0, _pos select 1, 0] call client_fnc_ins_insurgentTeleport;}, [player]] call BIS_fnc_addStackedEventHandler;
[] spawn
{
    sleep 10;
    waitUntil {missionNamespace getVariable["server_missionTimer", 0] < 0};
    ["teleportSelf","onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
}