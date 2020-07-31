private _roadBlock = "Land_Canal_Wall_10m_F" createVehicle position player;
_roadBlock attachTo [player, [0, 3, -3.1], "Pelvis"];
_roadBlock setDir 180;

fnc_addAction_Roadblock =
{
    params ["_target", "_caller", "_actionId", "_arguments"];

    _roadBlock = _arguments select 0;
    detach _roadBlock;
    [player, "AmovPercMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon", 1] call ace_common_fnc_doAnimation;
    [5,[_actionId, _roadBlock],
    {
        params["_parameters"];
        [player, "snd_effect_roadblock"] call client_fnc_core_say3DMP;
        player removeAction (_parameters select 0);
        private _roadBlock = (_parameters select 1);
        ["roadBlock", getPos _roadBlock, [0,0,0], (getDir _roadBlock + 180), false] remoteExec ["server_fnc_core_compSpawn", 2];
        deleteVehicle _roadBlock;

        "<t font='PuristaMedium' align='center' size='2'>Roadblock Placed</t>" call client_fnc_core_displayStructuredText;
        [_insPlayer, 1, ["ACE_SelfActions", "INS_AceMenu", "INS_PlaceRoadblock"]] call ace_interact_menu_fnc_removeActionFromObject;
    },
    {
        deleteVehicle (_this select 1);
        "<br/><t font='PuristaBold' align='center' size='2'>Interrupted</t>" call client_fnc_core_displayStructuredText;
    }, "Building"] call ace_common_fnc_progressBar;
};

player addAction ["Setup Roadblock", {_this call fnc_addAction_Roadblock}, [_roadBlock], 1, true, true, "", "(side _this == CIVILIAN)"];