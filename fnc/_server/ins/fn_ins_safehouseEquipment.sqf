params ["_crate", "_type"];

private _insClothes = [
	["CUP_O_TKI_Khet_Partug_01", 3],
	["CUP_O_TKI_Khet_Partug_02", 3],
	["CUP_O_TKI_Khet_Partug_03", 3],
	["CUP_O_TKI_Khet_Partug_04", 3],
	["CUP_O_TKI_Khet_Partug_05", 3],
	["CUP_O_TKI_Khet_Partug_06", 3],
	["CUP_O_TKI_Khet_Partug_07", 3],
	["CUP_O_TKI_Khet_Partug_08", 3],
	["CUP_V_OI_TKI_Jacket1_04", 3],
	["CUP_V_OI_TKI_Jacket1_05", 3],
	["CUP_V_OI_TKI_Jacket1_06", 3],
	["CUP_V_OI_TKI_Jacket5_02", 3],
	["CUP_V_OI_TKI_Jacket5_03", 3],
	["CUP_V_OI_TKI_Jacket5_04", 3],
	["CUP_V_OI_TKI_Jacket5_05", 3],
	["CUP_V_OI_TKI_Jacket5_06", 3],
	["CUP_V_OI_TKI_Jacket6_01", 3],
	["CUP_V_OI_TKI_Jacket6_02", 3],
	["CUP_V_OI_TKI_Jacket6_03", 3],
	["CUP_V_OI_TKI_Jacket6_04", 3],
	["CUP_V_OI_TKI_Jacket6_06", 3]
];

private _insHeadgear = [
	["CUP_H_TKI_SkullCap_01", 3],
	["CUP_H_TKI_SkullCap_02", 3],
	["CUP_H_TKI_SkullCap_03", 3],
	["CUP_H_TKI_SkullCap_04", 3],
	["CUP_H_TKI_SkullCap_05", 3],
	["CUP_H_TKI_Lungee_Open_02", 3],
	["CUP_H_TKI_Lungee_Open_03", 3],
	["CUP_H_TKI_Lungee_Open_05", 3],
	["CUP_H_TKI_Lungee_Open_06", 3],
	["CUP_H_TKI_Pakol_1_01", 3],
	["CUP_H_TKI_Pakol_1_03", 3],
	["CUP_H_TKI_Pakol_1_04", 3],
	["CUP_H_TKI_Pakol_2_01", 3],
	["CUP_H_TKI_Pakol_2_02", 3],
	["CUP_H_TKI_Pakol_2_03", 3]
];

private _insAceEquipment = [
	["ACE_EarPlugs", 3],
	["ACE_CableTie", 3],
	["ACE_ConcertinaWireCoil", 3],
	["ACE_Cellphone", 3],
	["ACE_DefusalKit", 3],
	["ACE_DeadManSwitch", 3],
	["ACE_wirecutter", 3],
	["ACE_MapTools", 3],
	["ACE_fieldDressing", 50],
	["ACE_morphine", 20],
	["ACE_epinephrine", 20],
	["ACE_bloodIV_250", 10],
	["ACE_bloodIV_500", 10],
	["ACE_tourniquet", 10],
	["ACE_personalAidKit", 3]
];

_insClothes = _insClothes + _insHeadgear;
clearItemCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearMagazineCargo _crate;
clearBackpackCargoGlobal _crate;
switch(_type) do
{
    case "CUP_USSpecialWeapons_EP1":{[_crate, true] call ace_arsenal_fnc_initBox; [_crate, ["<t color='#B570E8C9'>Loadout</t>", { createDialog "dialog_LoadoutRequest" },"",6,true,false,"","(side player == civilian)"]] remoteExec ["addAction"];};
    case "Box_CSAT_Equip_F": {{_crate addItemCargoGlobal [_x select 0, _x select 1]}forEach _insAceEquipment};
    case "Box_CSAT_Uniforms_F": {{_crate addItemCargoGlobal [_x select 0, _x select 1]}forEach _insClothes};
};