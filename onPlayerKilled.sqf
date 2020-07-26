params ["_oldUnit",	"_killer", "_respawn",	"_respawnDelay"];

private _bluforCount = west countSide allPlayers;
if (_bluforCount > 0) then
{
    player setVariable["local_deathCount", ((player getVariable["local_deathCount", 0]) + 1), true];
    private _deathTotal = 0;
    {
        if (side _x == west) then {_deathTotal = _deathTotal + (_x getVariable["local_deathCount", 0]);};
    } forEach allPlayers;

    if ((_deathTotal mod _bluforCount) == 0) then {
        missionNamespace setVariable["server_esclationPhase", ((missionNamespace getVariable["server_esclationPhase", 0]) + 1)];
        ["EsclationPhaseUp", ["Blufor Phase Up"]] remoteExec ["bis_fnc_showNotification", 0];
        {
            if ((side _x == civilian) && (isPlayer _x)) then
            {
                _x setVariable ["local_insMoney", ((_x getVariable ["local_insMoney", 0]) + 2000)];
                "<t font='PuristaBold' align='center' size='2' color='#28b858'>+ $2000</t>" remoteExec ["client_fnc_core_displayStructuredText", _x];
            };
        } forEach allPlayers;
    }
};

//NEEDS MP TESTED