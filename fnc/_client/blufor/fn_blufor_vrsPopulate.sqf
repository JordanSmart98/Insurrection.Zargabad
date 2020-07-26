waitUntil {!isNull (findDisplay 2900)};
disableSerialization;
private _display = findDisplay 2900;
private _Text_Fund = _display displayCtrl 2901;

private _bluforAirVehicleList = [
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
    ["CUP_B_MH47E_GB", 3000],
    ["CUP_B_AW159_RN_Blackcat", 5000]
];

private _bluforLandVehicleList = [
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
    ["CUP_B_Mastiff_HMG_GB_D", 3000],
    ["CUP_B_FV432_Bulldog_GB_D_RWS", 6000],
    ["CUP_B_FV510_GB_D", 6000],
    ["CUP_B_FV510_GB_D_SLAT", 6000],
    ["CUP_B_MCV80_GB_D", 6000],
    ["CUP_B_MCV80_GB_D_SLAT", 6000]
];

private _vehicleList = switch (player getVariable ["local_bluforVSType", -1]) do
{
    case 1: {_bluforAirVehicleList;};
    case 2: {_bluforLandVehicleList};
};

{
    private _displayName = getText (configFile >> "CfgVehicles" >> _x select 0 >> "displayName");
    private _itemIndex = lbAdd [2902, format["$%1: ", _x select 1] + _displayName];
    lbSetValue [2902, _itemIndex, _x select 1];
    lbSetData [2902, _itemIndex, _x select 0];
}forEach _vehicleList;

_Text_Fund ctrlSetText format["$%1", player getVariable ["local_bluforMoney", 0]];