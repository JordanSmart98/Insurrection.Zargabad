params ["_target", "_player", "_params"];

[_player, "AmovPercMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon", 1] call ace_common_fnc_doAnimation;
[10,[_target, _PARAM2],
{
    params ["_params"];
    _target = _params select 0;

    if (missionNamespace getVariable["server_safehouseCount", 0] <= 0) exitWith {
        ["<t font='PuristaMedium' align='center' size='2'>No safehouse's</t>"] call client_fnc_core_displayStructuredText;
    };

    private _safehouseArray = missionNamespace getVariable["server_safehouseArray", []];
    private _randomSafehouse = _safehouseArray select (round random (count _safehouseArray));

    private _randomPos = (getPos _randomSafehouse) vectorAdd [random 40, random 40, 0];
    private _intelLocations = missionNamespace getVariable["server_bluforIntelArray", []];
    _intelLocations pushBackUnique _randomPos;

    missionNamespace setVariable["server_bluforIntelArray", _intelLocations, true];
    missionNamespace setVariable["server_bluforIntelCount", count _intelLocations, true];

    ["<t font='PuristaBold' align='center' size='2'>Intel Added</t>"] call client_fnc_core_displayStructuredText;


    [_target, 0, ["ACE_MainActions", "BLU_Interrogate"]] call ace_interact_menu_fnc_removeActionFromObject;

    _dickersArray = missionNamespace getVariable ["server_dickersArray", []];
    _dickersArray = _dickersArray - [_target];
    _target setVariable["local_insDicker", 0, true];
    _target removeItem "ACE_Cellphone";
    missionNamespace setVariable ["server_dickersArray", _dickersArray, true];
    missionNamespace setVariable ["server_dickersCount", count _dickersArray, true];
},
{
    ["<t font='PuristaBold' align='center' size='2'>Interrupted</t>"] call client_fnc_core_displayStructuredText;
}, "Interrogating"] call ace_common_fnc_progressBar;