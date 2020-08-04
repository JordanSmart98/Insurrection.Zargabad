// Get safehouse data
private _safehouseArray = missionNamespace getVariable["svr_safehouseArray", []];

// Safehouse Parent Task
[WEST, ["Destroy_Safehouses_Task"], ["The enemy insurgents are resupplying at safehouses in the town. Destroy them!", "Safehouses"], objNull,"Created",9,true,"",true] call BIS_fnc_taskCreate;
{
    // Safehouse Child Task
    [WEST, [format ["Destroy_Safehouse_%1_Task",_forEachIndex+1],"Destroy_Safehouses_Task"], ["Destroy Insurgent Safehouse", format ["Destroy Safehouse %1",_forEachIndex+1]], objNull,"",9,true,"Attack",true] call BIS_fnc_taskCreate;
} forEach _safehouseArray;

// Player Parent Task
[WEST, ["EliminateInsurgents"], ["Eliminate Insurgents in Zargabad", "Eliminate Insurgents"], objNull,"Created",10,true,"Attack",true] call BIS_fnc_taskCreate; // Task without a map location