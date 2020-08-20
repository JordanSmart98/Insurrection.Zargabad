params ["_newUnit",	"_oldUnit",	"_respawn",	"_respawnDelay"];

if (hasInterface) then
{
    waitUntil { !isNull player };
    [] spawn client_fnc_core_unflipVehicleAddAction;
    if ((paramsArray select 1) == 1) then {player enableStamina false;};

    if (playerSide isEqualTo west) then
    {
        [] spawn {
            while {missionNamespace getVariable["svr_missionTimer", 0] > 0} do
                  {
                      if (!([blufor_triggerStartArea, (getPos player), false, false] call BIS_fnc_inTrigger)) then
                      {
                          player setDammage 1;
                      };
                  };
        };

        private _insKills = missionNamespace getVariable["svr_insKills", 0];
        private _insPlayers = (civilian call server_fnc_core_getPlayers);

        private _killer = missionNamespace getVariable["cl_reviveSource", objNull];
        private _deathState = missionNamespace getVariable["cl_reviveStatus", "empty"];
        switch (_deathState) do
        {
            case "EXECUTED":
            {
                systemChat format["executed, killer: %1", name _killer];
                _insKills = _insKills + 1;
                {
                    private _playerMoney = (_x getVariable ["cl_money", 0]);
                    _x setVariable ["cl_money", (_playerMoney + 1000), true];
                    "<t font='PuristaLight' align='center'>Infidel Killed</t><br/><t font='PuristaBold' align='center' size='2' color='#28b858'>+$1000</t>" remoteExec ["client_fnc_core_displayStructuredText", _x];
                } forEach _insPlayers;
            };
            case "RESPAWN":
            {
                systemChat format["forced respawn, killer: %1", name _killer];
                _insKills = _insKills + 1;
                {
                    private _playerMoney = (_x getVariable ["cl_money", 0]);
                    _x setVariable ["cl_money", (_playerMoney + 2000), true];
                    "<t font='PuristaLight' align='center'>Infidel Killed</t><br/><t font='PuristaBold' align='center' size='2' color='#28b858'>+$1000</t>" remoteExec ["client_fnc_core_displayStructuredText", _x];
                } forEach _insPlayers;
            };
            case "BLEEDOUT":
            {
                systemChat format["bleed out, killer: %1", name _killer];
                _insKills = _insKills + 1;
                {
                    private _playerMoney = (_x getVariable ["cl_money", 0]);
                    _x setVariable ["cl_money", (_playerMoney + 3000), true];
                    "<t font='PuristaLight' align='center'>Infidel Killed</t><br/><t font='PuristaBold' align='center' size='2' color='#28b858'>+$1000</t>" remoteExec ["client_fnc_core_displayStructuredText", _x];
                } forEach _insPlayers;
            };
        };
        missionNamespace setVariable["svr_insKills", _insKills, true];
        systemChat format["total kills: %1", _insKills];
        diag_log format["total kills: %1", _insKills];
    };
};