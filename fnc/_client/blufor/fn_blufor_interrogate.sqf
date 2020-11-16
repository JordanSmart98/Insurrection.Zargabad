params ["_target", "_player", "_params"];
[_player, "AmovPercMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon", 1] call ace_common_fnc_doAnimation;
[10,[_target],
{
    params ["_params"];
    private _target = _params select 0;
    private _random = round(random 100);
    if (_random < (missionNamespace getVariable["svr_dickersWill", 50])) then {
        if (missionNamespace getVariable["svr_safehouseCount", 0] <= 0) exitWith {
            ["<t font='PuristaMedium' align='center' size='1.55'>All safehouse have been destroyed</t>"] call client_fnc_core_displayStructuredText;
        };

        private _safehouseArray = missionNamespace getVariable["svr_safehouseArray", []];
        private _randomSafehouse = _safehouseArray select (round random (count _safehouseArray));

        private _randomPos = (getPos _randomSafehouse) vectorAdd [random 40, random 40, 0];
        private _intelLocations = missionNamespace getVariable["svr_bluforIntelArray", []];
        _intelLocations pushBackUnique _randomPos;

        missionNamespace setVariable["svr_bluforIntelArray", _intelLocations, true];
        missionNamespace setVariable["svr_bluforIntelCount", count _intelLocations, true];

        private _string = "<t font='PuristaBold' align='center' size='2'>Intel Added</t><br/><t font='PuristaMedium' align='center' size='1.5' color='#16ba3d'>+$1000</t>";
        [_string] call client_fnc_core_displayStructuredText;

        player setVariable ["cl_money", ((player getVariable ["cl_money", 0]) + 1000)];

        [_target, 0, ["ACE_MainActions", "BLU_Interrogate"]] call ace_interact_menu_fnc_removeActionFromObject;
        _target setVariable["cl_insDicker", false, true];
        _target removeItem "ACE_Cellphone";
    };
},
{
    "<br/><t font='PuristaBold' align='center' size='2'>Interrupted</t>" call client_fnc_core_displayStructuredText;
}, "Interrogating"] call ace_common_fnc_progressBar;