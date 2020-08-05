params ["_oldUnit",	"_killer", "_respawn",	"_respawnDelay"];

private _bluforCount = west countSide allPlayers;
if (_bluforCount > 0) then
{
    player setVariable["cl_deathCount", ((player getVariable["cl_deathCount", 0]) + 1), true];
    private _deathTotal = 0;
    {
        if (side _x == west) then {_deathTotal = _deathTotal + (_x getVariable["cl_deathCount", 0]);};
    } forEach allPlayers;

    if ((_deathTotal mod _bluforCount) == 0) then {
        missionNamespace setVariable["svr_esclationPhase", ((missionNamespace getVariable["svr_esclationPhase", 0]) + 1), true];
        ["EsclationPhaseUp", ["The insurrection has escalated."]] remoteExec ["bis_fnc_showNotification", 0];

        private _civilianPlayers = (civilian call server_fnc_core_getPlayers);
        {
            _x setVariable ["cl_money", ((_x getVariable ["cl_money", 0]) + 2000), true];
            "<br/><t font='PuristaBold' align='center' size='2' color='#28b858'>+ $2000</t>" remoteExec ["client_fnc_core_displayStructuredText", _x];
        } forEach _civilianPlayers;
    }
};