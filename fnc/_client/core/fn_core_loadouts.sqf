private ["_target", "_preset"];
_target = _this select 0;
_preset = _this select 1;

_loadout1 = {
    private ["_target"];
    _target = _this select 0;
    hint "Rifleman Loadout Equiped";

    // Paste Export below, replace this with _target
    comment "[!] UNIT MUST BE LOCAL [!]";
    if (!local _target) exitWith {};

    comment "Remove existing items";
    removeAllWeapons _target;
    removeAllItems _target;
    removeAllAssignedItems _target;
    removeUniform _target;
    removeVest _target;
    removeBackpack _target;
    removeHeadgear _target;
    removeGoggles _target;

    comment "Add weapons";
    _target addWeapon "CUP_arifle_L85A2_Elcan_Laser";
    _target addPrimaryWeaponItem "CUP_acc_LLM";
    _target addPrimaryWeaponItem "CUP_optic_Elcan_reflex";
    _target addPrimaryWeaponItem "CUP_30Rnd_556x45_Stanag_L85";
    _target addWeapon "CUP_hgun_Glock17_blk";
    _target addHandgunItem "CUP_17Rnd_9x19_glock17";

    comment "Add containers";
    _target forceAddUniform "CUP_U_B_BAF_DDPM_UBACSLONGKNEE";
    _target addVest "CUP_V_B_BAF_DDPM_Osprey_Mk3_Rifleman";

    comment "Add items to containers";
    _target addItemToUniform "CUP_NVG_HMNVS";
    for "_i" from 1 to 2 do {_target addItemToUniform "ACE_fieldDressing";};
    for "_i" from 1 to 2 do {_target addItemToUniform "ACE_packingBandage";};
    for "_i" from 1 to 2 do {_target addItemToUniform "ACE_morphine";};
    for "_i" from 1 to 2 do {_target addItemToUniform "ACE_tourniquet";};
    for "_i" from 1 to 9 do {_target addItemToVest "CUP_30Rnd_556x45_Stanag_L85";};
    for "_i" from 1 to 2 do {_target addItemToVest "CUP_17Rnd_9x19_glock17";};
    for "_i" from 1 to 3 do {_target addItemToVest "CUP_HandGrenade_L109A1_HE";};
    for "_i" from 1 to 3 do {_target addItemToVest "SmokeShell";};
    _target addItemToVest "SmokeShellGreen";
    _target addHeadgear "CUP_H_BAF_DDPM_Mk6_EMPTY_PRR";

    comment "Add items";
    _target linkItem "ItemMap";
    _target linkItem "ItemCompass";
    _target linkItem "ItemWatch";
    _target linkItem "ItemRadio";


};

_loadout2 = {
    private ["_target"];
    _target = _this select 0;
    hint "Marksman Loadout Equiped";

    // Paste Export below, replace this with _target
    comment "[!] UNIT MUST BE LOCAL [!]";
    if (!local _target) exitWith {};

    comment "Remove existing items";
    removeAllWeapons _target;
    removeAllItems _target;
    removeAllAssignedItems _target;
    removeUniform _target;
    removeVest _target;
    removeBackpack _target;
    removeHeadgear _target;
    removeGoggles _target;

    comment "Add weapons";
    _target addWeapon "CUP_srifle_L129A1_HG_Leupold_Bipod";
    _target addPrimaryWeaponItem "CUP_acc_LLM";
    _target addPrimaryWeaponItem "CUP_optic_Elcan_SpecterDR_KF";
    _target addPrimaryWeaponItem "CUP_20Rnd_762x51_L129_M";
    _target addPrimaryWeaponItem "CUP_bipod_Harris_1A2_L";
    _target addWeapon "CUP_hgun_Glock17_blk";
    _target addHandgunItem "CUP_17Rnd_9x19_glock17";

    comment "Add containers";
    _target forceAddUniform "CUP_U_B_BAF_DDPM_UBACSLONGKNEE";
    _target addVest "CUP_V_B_BAF_DDPM_Osprey_Mk3_Scout";

    comment "Add binoculars";
    _target addWeapon "CUP_Vector21Nite";

    comment "Add items to containers";
    _target addItemToUniform "CUP_NVG_HMNVS";
    _target addItemToUniform "ACE_fieldDressing";
    _target addItemToUniform "ACE_packingBandage";
    _target addItemToUniform "ACE_morphine";
    _target addItemToUniform "ACE_tourniquet";
    _target addItemToVest "ACE_EarPlugs";
    for "_i" from 1 to 3 do {_target addItemToUniform "CUP_HandGrenade_L109A1_HE";};
    for "_i" from 1 to 3 do {_target addItemToVest "SmokeShell";};
    for "_i" from 1 to 3 do {_target addItemToVest "CUP_17Rnd_9x19_glock17";};
    for "_i" from 1 to 6 do {_target addItemToVest "CUP_20Rnd_762x51_L129_M";};
    _target addHeadgear "CUP_H_BAF_DDPM_Mk6_NETTING_PRR";

    comment "Add items";
    _target linkItem "ItemMap";
    _target linkItem "ItemCompass";
    _target linkItem "ItemWatch";
    _target linkItem "ItemRadio";
    _target linkItem "ItemGPS";

};

_loadout3 = {
    private ["_target"];
    _target = _this select 0;
    hint "Demolition Loadout Equiped";

    // Paste Export below, replace this with _target
    comment "[!] UNIT MUST BE LOCAL [!]";
    if (!local _target) exitWith {};

    comment "Remove existing items";
    removeAllWeapons _target;
    removeAllItems _target;
    removeAllAssignedItems _target;
    removeUniform _target;
    removeVest _target;
    removeBackpack _target;
    removeHeadgear _target;
    removeGoggles _target;

    comment "Add weapons";
    _target addWeapon "CUP_arifle_L85A2_GL";
    _target addPrimaryWeaponItem "CUP_acc_LLM";
    _target addPrimaryWeaponItem "CUP_30Rnd_556x45_Stanag_L85";
    _target addPrimaryWeaponItem "CUP_1Rnd_HE_M203";

    comment "Add containers";
    _target forceAddUniform "CUP_U_B_BAF_DDPM_UBACSLONGKNEE";
    _target addVest "CUP_V_B_BAF_DDPM_Osprey_Mk3_Engineer";
    _target addBackpack "CUP_B_Predator_MTP";

    comment "Add items to containers";
    _target addItemToUniform "CUP_NVG_HMNVS";
    _target addItemToUniform "ACE_fieldDressing";
    _target addItemToUniform "ACE_packingBandage";
    _target addItemToUniform "ACE_morphine";
    _target addItemToUniform "ACE_tourniquet";
    _target addItemToVest "ACE_EarPlugs";
    _target addItemToVest "ACE_M26_Clacker";
    for "_i" from 1 to 5 do {_target addItemToVest "CUP_30Rnd_556x45_Stanag_L85";};
    for "_i" from 1 to 10 do {_target addItemToVest "CUP_1Rnd_HE_M203";};
    _target addItemToVest "CUP_1Rnd_SmokeGreen_M203";
    _target addItemToVest "CUP_1Rnd_SmokeRed_M203";
    for "_i" from 1 to 3 do {_target addItemToVest "CUP_1Rnd_Smoke_M203";};
    for "_i" from 1 to 3 do {_target addItemToVest "CUP_HandGrenade_L109A2_HE";};
    for "_i" from 1 to 2 do {_target addItemToVest "CUP_HandGrenade_L109A2_HE";};
    _target addItemToVest "SmokeShell";
    _target addItemToVest "SmokeShellGreen";
    _target addItemToBackpack "MineDetector";
    for "_i" from 1 to 5 do {_target addItemToBackpack "DemoCharge_Remote_Mag";};
    for "_i" from 1 to 2 do {_target addItemToBackpack "SatchelCharge_Remote_Mag";};
    _target addHeadgear "CUP_H_BAF_DDPM_Mk6_NETTING_PRR";

    comment "Add items";
    _target linkItem "ItemMap";
    _target linkItem "ItemCompass";
    _target linkItem "ItemWatch";
    _target linkItem "ItemRadio";


};

//Set Loadout
switch(_preset) do
{
    case "1":
    {
    [player] call _loadout1;
    };
    case "2":
    {
    [player] call _loadout2;
    };
    case "3":
    {
    [player] call _loadout3;
    };
};




