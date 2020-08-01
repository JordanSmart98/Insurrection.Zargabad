params ["_newUnit",	"_oldUnit",	"_respawn",	"_respawnDelay"];

if (hasInterface) then
{
    waitUntil { !isNull player };
    [] spawn client_fnc_core_unflipVehicleAddAction;
    if ((paramsArray select 1) == 1) then {player enableStamina false;};
};