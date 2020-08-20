params ["_oldUnit",	"_killer", "_respawn",	"_respawnDelay"];

//Add code to be called on event
//[ missionNamespace, "reviveIncapacitated", {_unit = _this select 0; _revivor = _this select 1;} ] call BIS_fnc_addScriptedEventHandler;

//onExplosion is local, each client could count this themselves

//event handler for animation change -> spawn a function that watches what happens to that player
//> revived, bleed out, executed, forced respawn etc

//setVariable on player isWatched -> if the player is watched when onPlayerKilled we can get data

/*
private _bluforCount = west countSide allPlayers;
if (_bluforCount > 0) then
{
    player setVariable["cl_deathCount", ((player getVariable["cl_deathCount", 0]) + 1), true];
    private _bluforTotalDeaths = 0;
    private _bluforPlayers = (west call server_fnc_core_getPlayers);
    {
        _bluforTotalDeaths = _bluforTotalDeaths + (_x getVariable["cl_deathCount", 0]);
    } forEach _bluforPlayers;

    if ((_bluforTotalDeaths mod _bluforCount) == 0) then {
        missionNamespace setVariable["svr_esclationPhase", ((missionNamespace getVariable["svr_esclationPhase", 0]) + 1), true];
        ["EsclationPhaseUp", ["The insurrection has escalated."]] remoteExec ["bis_fnc_showNotification", 0];

        private _civilianPlayers = (civilian call server_fnc_core_getPlayers);
        {
            _x setVariable ["cl_money", ((_x getVariable ["cl_money", 0]) + 2000), true];
            "<br/><t font='PuristaBold' align='center' size='2' color='#28b858'>+ $2000</t>" remoteExec ["client_fnc_core_displayStructuredText", _x];
        } forEach _civilianPlayers;
    }
};*/