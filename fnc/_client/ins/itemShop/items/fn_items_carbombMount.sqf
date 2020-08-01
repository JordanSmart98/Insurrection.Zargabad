private _fnc_insMountCarbomb = {
    params ["_params"];
    "<br/><t font='PuristaMedium' align='center' size='2'>IED Armed</t>" call client_fnc_core_displayStructuredText;
    [player, "snd_effect_carbomb"] call client_fnc_core_say3DMP;

    private _car = _params select 0;
    private _bomb = createVehicle ["CUP_IED_V4", getPos _car, [], 0, "CAN_COLLIDE"];
    _bomb attachTo [_car, [0,0,0]];
    _bomb setVectorDirAndUp [[1,-0,-0],[0,0,1]];

    private _itemCount = (player getVariable["cl_items_Carbomb", 0]) - 1;
    player setVariable["cl_items_Carbomb", _itemCount];

    if (_itemCount isEqualTo 0) then {
        [player, 1, ["ACE_SelfActions", "INS_AceMenu", "INS_MountCarbomb"]] call ace_interact_menu_fnc_removeActionFromObject;
    };

    if (_itemCount isEqualTo 1) then {
        [player, 1, ["ACE_SelfActions", "INS_AceMenu", "INS_MountCarbomb"]] call ace_interact_menu_fnc_removeActionFromObject;
        ['INS_MountCarbomb', "Mount Carbomb", 'hpp\images\insCarbombMount.paa', 'call client_fnc_items_carbombMount;'] call client_fnc_itemShop_addAceAction;
    };

    if (_itemCount > 1) then {
        [player, 1, ["ACE_SelfActions", "INS_AceMenu", "INS_MountCarbomb"]] call ace_interact_menu_fnc_removeActionFromObject;
        ['INS_MountCarbomb', format["Mount Carbomb x%1", _itemCount], 'hpp\images\insCarbombMount.paa', 'call client_fnc_items_carbombMount;'] call client_fnc_itemShop_addAceAction;
    };

    _car call client_fnc_items_carbombDetonate;
    //_car addEventHandler ["Deleted", {[_this select 1, ]}]; create variables car + player, get car index select player re-add carbomb item;
};

private _objects = nearestObjects [player, ["LandVehicle"], 3.5];
if (count _objects isEqualTo 0) exitWith {
    "<br/><t font='PuristaMedium' align='center' size='1.5'>No valid vehicles</t>" call client_fnc_core_displayStructuredText;
};

[player, "AmovPercMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon", 1] call ace_common_fnc_doAnimation;

private _car = _objects select 0;
[5, [_car], _fnc_insMountCarbomb, {"<br/><t font='PuristaBold' align='center' size='2'>Interrupted</t>" call client_fnc_core_displayStructuredText;}, "Mounting"] call ace_common_fnc_progressBar;