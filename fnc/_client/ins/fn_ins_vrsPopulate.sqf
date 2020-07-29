waitUntil {!isNull (findDisplay 3000)};
disableSerialization;
private _display = findDisplay 3000;
private _Text_Fund = _display displayCtrl 3001;

private _civVehicleList = [
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

private _blackmarketVehicleList = [
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
private _vehicleList = switch (player getVariable ["local_insVSType", -1]) do
{
    case 1: {_civVehicleList;};
    case 2: {_blackmarketVehicleList};
};

{
    private _displayName = getText (configFile >> "CfgVehicles" >> _x select 0 >> "displayName");
    private _itemIndex = lbAdd [3002, format["$%1: ", _x select 1] + _displayName];
    lbSetValue [3002, _itemIndex, _x select 1];
    lbSetData [3002, _itemIndex, _x select 0];
}forEach _vehicleList;

_Text_Fund ctrlSetText format["$%1", player getVariable ["cl_money", 0]];