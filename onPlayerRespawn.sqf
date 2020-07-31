params ["_newUnit",	"_oldUnit",	"_respawn",	"_respawnDelay"];

if ((paramsArray select 1) == 1) then {_newUnit enableStamina false;};

/*
Vehicle Unflip
Spawn the Vehicle Unflip Script Loop.
*/
if ( hasInterface ) then
{
waitUntil { !isNull player };
[] spawn client_fnc_core_unflipVehicleAddAction;
};