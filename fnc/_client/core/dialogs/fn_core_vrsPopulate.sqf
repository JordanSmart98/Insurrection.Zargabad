BluforAirVL = [
    ["CUP_B_MH6J_USA", 1000],
    ["CUP_O_UH1H_SLA", 1000],
    ["CUP_B_AW159_Unarmed_RN_Blackcat", 1000],
    ["CUP_B_SA330_Puma_HC1_BAF", 1000],
    ["CUP_B_SA330_Puma_HC2_BAF", 1000],
    ["CUP_B_Merlin_HC3_GB", 1500],
    ["CUP_B_Merlin_HC3_VIV_GB", 1500],
    ["CUP_B_Merlin_HC3_Armed_GB", 1750],
    ["CUP_B_CH47F_GB", 2500],
    ["CUP_B_CH47F_VIV_GB", 2500],
    ["CUP_B_MH47E_GB", 3000]
];

BluforLandVL = [
    ["CUP_B_M1030_USA", 50],
    ["CUP_B_LR_Ambulance_GB_D", 100],
    ["CUP_B_LR_Transport_GB_D", 100],
    ["CUP_B_MTVR_Ammo_BAF_DES", 500],
    ["CUP_B_MTVR_Refuel_BAF_DES", 500],
    ["CUP_B_MTVR_Repair_BAF_DES", 500],
    ["CUP_B_LR_MG_GB_D", 500],
    ["CUP_B_LR_Special_M2_GB_D", 750],
    ["CUP_B_BAF_Coyote_L2A1_D", 1000],
    ["CUP_B_Jackal2_L2A1_GB_D", 1250],
    ["CUP_B_Ridgback_LMG_GB_D", 2250],
    ["CUP_B_Ridgback_HMG_GB_D", 2250],
    ["CUP_B_Wolfhound_LMG_GB_D", 2500],
    ["CUP_B_Wolfhound_HMG_GB_D", 2500],
    ["CUP_B_Mastiff_LMG_GB_D", 3000],
    ["CUP_B_Mastiff_HMG_GB_D", 3000]
];

insCivVL = [
    ["CUP_C_Lada_GreenTK_CIV", 200],
    ["CUP_C_Lada_TK2_CIV", 200],
    ["CUP_C_S1203_CIV", 250],
    ["CUP_C_S1203_Ambulance_CIV", 250],
    ["CUP_C_Volha_Blue_TKCIV", 250],
    ["CUP_C_Volha_Limo_TKCIV", 250],
    ["CUP_C_Volha_Gray_TKCIV", 250],
    ["CUP_C_UAZ_Open_TK_CIV", 400],
    ["CUP_C_LR_Transport_CTK", 400],
    ["CUP_C_V3S_Open_TKC", 400],
    ["CUP_C_Ikarus_TKC", 500],
    ["CUP_C_V3S_Covered_TKC", 500],
    ["CUP_C_SUV_TK", 650],
    ["CUP_C_Ural_Civ_01", 800]
];

insBlackmarketVL = [
    ["CUP_I_Datsun_4seat_TK", 500],
    ["CUP_I_LR_Transport_RACS", 500],
    ["CUP_I_LR_Ambulance_RACS", 500],
    ["CUP_I_V3S_Open_TKG", 500],
    ["CUP_I_V3S_Covered_TKG", 500],
    ["CUP_I_V3S_Rearm_TKG", 500],
    ["CUP_I_V3S_Refuel_TKG", 500],
    ["CUP_I_Datsun_PK_TK", 750],
    ["CUP_I_Datsun_PK_TK_Random", 750],
    ["CUP_I_Hilux_unarmed_TK", 750],
    ["CUP_I_MTVR_Ammo_RACS", 750],
    ["CUP_I_MTVR_Refuel_RACS", 750],
    ["CUP_I_Hilux_M2_TK", 1000],
    ["CUP_I_Hilux_DSHKM_TK", 1000],
    ["CUP_I_LR_MG_RACS", 1000],
    ["CUP_I_Hilux_SPG9_TK", 2500],
    ["CUP_I_Hilux_metis_TK", 2500],
    ["CUP_I_Datsun_AA_TK", 2500],
    ["CUP_I_Hilux_igla_TK", 2500],
    ["CUP_I_BTR40_MG_TKG", 4000],
    ["CUP_I_Hilux_MLRS_TK", 4000],
    ["CUP_I_Hilux_BMP1_TK", 4000],
    ["CUP_I_Hilux_btr60_TK", 4000],
    ["CUP_I_BRDM2_TK_Gue", 6000],
    ["CUP_I_Ural_ZU23_TK_Gue", 6000],
    ["CUP_I_Hilux_zu23_TK", 6000]
];

waitUntil {!isNull (findDisplay 7900)};
disableSerialization;

private _display = findDisplay 7900;
private _Lb_Type = _display displayCtrl 7902;
private _Text_PlayerMoney = _display displayCtrl 7903;

private _money = player getVariable ["cl_money", 0];
_Text_PlayerMoney ctrlSetStructuredText parseText format["<t font='EtelkaMonospacePro' align='center' size='3' color='#5ED890'>$%1</t>", _money];

private _curVehicleArray = switch (playerSide) do
{
    case west:
    {
        private _itemIndex = _Lb_Type lbAdd "Land Vehicles";
        _Lb_Type lbSetData [_itemIndex, "BluforLandVL"];

        _Lb_Type lbSetCurSel _itemIndex;

        private _itemIndex = _Lb_Type lbAdd "Air Vehicles";
        _Lb_Type lbSetData [_itemIndex, "BluforAirVL"];

        BluforLandVL;
    };
    case civilian:
    {
        private _itemIndex = _Lb_Type lbAdd "Black Market Vehicles";
        _Lb_Type lbSetData [_itemIndex, "insBlackmarketVL"];

        _Lb_Type lbSetCurSel _itemIndex;

        private _itemIndex = _Lb_Type lbAdd "Civilian Vehicles";
        _Lb_Type lbSetData [_itemIndex, "insCivVL"];

        insBlackmarketVL;
    };
};

private _List_Vehicles = _display displayCtrl 7901;
{
    private _displayName = getText (configFile >> "CfgVehicles" >> _x select 0 >> "displayName");
    private _displayIcon = getText(configFile >> "cfgVehicles" >> _x select 0 >> "picture");
    private _itemIndex = _List_Vehicles lbAdd (format["  $%1  ", _x select 1] + _displayName);
    _List_Vehicles lbSetData [_itemIndex, _x select 0];
    _List_Vehicles lbSetValue [_itemIndex, _x select 1];
    _List_Vehicles lbSetPictureRight[_itemIndex, _displayIcon];
    _List_Vehicles lbSetPictureRightColor[_itemIndex, [1,1,1,1]];
    _List_Vehicles lbSetPictureRightColorSelected[_itemIndex, [1,1,1,1]];
} forEach _curVehicleArray;
lbSortByValue _List_Vehicles;