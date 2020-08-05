params ["_killedUnit", "_killer", "_triggerMan"];

if (isPlayer _killedUnit) exitWith {};
if (_killedUnit isKindOf "Man") then {
    switch (side _killedUnit) do
    {
        case west:
        {
            if (side _triggerMan isEqualTo west) exitWith
            {
                true;
            };

            if (side _triggerMan isEqualTo civilian) exitWith
            {
                true;
            };
        };

        case civilian:
        {
            private _isDicker = _killedUnit getVariable["cl_insDicker", false];
            if (side _triggerMan isEqualTo civilian) exitWith
            {
                if (_isDicker) then
                {
                    ["CivilianKilled", [format["Insurgent %1 killed a dicker.", name _triggerMan]]] remoteExec ["bis_fnc_showNotification"];
                };
            };
            if (side _triggerMan isEqualTo west) exitWith
            {
                if (_isDicker) then
                {
                    ["CivilianKilled", [format["%1 killed a dicker.", name _triggerMan]]] remoteExec ["bis_fnc_showNotification"];
                }
                else
                {
                    private _civKillCounter = missionNamespace getVariable["svr_civiliansKilled", 0];
                    _civKillCounter = _civKillCounter + 1;
                    ["CivilianKilled",[format["%1 killed a civilian. %2", name _triggerMan, _civKillCounter]]] remoteExec ["bis_fnc_showNotification"];
                    missionNamespace setVariable["svr_civiliansKilled", _civKillCounter, true];
                };
            };
        };
    };
};