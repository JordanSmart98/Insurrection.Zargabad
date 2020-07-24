_insClothes = [
	"CUP_O_TKI_Khet_Partug_01",
	"CUP_O_TKI_Khet_Partug_02",
	"CUP_O_TKI_Khet_Partug_03",
	"CUP_O_TKI_Khet_Partug_04",
	"CUP_O_TKI_Khet_Partug_05",
	"CUP_O_TKI_Khet_Partug_06",
	"CUP_O_TKI_Khet_Partug_07",
	"CUP_O_TKI_Khet_Partug_08",
	"CUP_V_OI_TKI_Jacket1_04",
	"CUP_V_OI_TKI_Jacket1_05",
	"CUP_V_OI_TKI_Jacket1_06",
	"CUP_V_OI_TKI_Jacket5_02",
	"CUP_V_OI_TKI_Jacket5_03",
	"CUP_V_OI_TKI_Jacket5_04",
	"CUP_V_OI_TKI_Jacket5_05",
	"CUP_V_OI_TKI_Jacket5_06",
	"CUP_V_OI_TKI_Jacket6_01",
	"CUP_V_OI_TKI_Jacket6_02",
	"CUP_V_OI_TKI_Jacket6_03",
	"CUP_V_OI_TKI_Jacket6_04",
	"CUP_V_OI_TKI_Jacket6_06"
];

_insHeadgear = [
	"CUP_H_TKI_SkullCap_01",
	"CUP_H_TKI_SkullCap_02",
	"CUP_H_TKI_SkullCap_03",
	"CUP_H_TKI_SkullCap_04",
	"CUP_H_TKI_SkullCap_05",
	"CUP_H_TKI_Lungee_Open_02",
	"CUP_H_TKI_Lungee_Open_03",
	"CUP_H_TKI_Lungee_Open_05",
	"CUP_H_TKI_Lungee_Open_06",
	"CUP_H_TKI_Pakol_1_01",
	"CUP_H_TKI_Pakol_1_03",
	"CUP_H_TKI_Pakol_1_04",
	"CUP_H_TKI_Pakol_2_01",
	"CUP_H_TKI_Pakol_2_02",
	"CUP_H_TKI_Pakol_2_03"
];

_insHead = [
    "PersianHead_A3_01",
    "PersianHead_A3_02",
    "PersianHead_A3_03"
];

player addWeapon "ItemMap";
openMap true;

createDialog "dialog_InsurgentSelection";
waitUntil {!((findDisplay 7000) isEqualTo displayNull)};
(findDisplay 7000) displaySetEventHandler ["KeyDown", "if ((_this select 1) == 1 || (_this select 1) == 57 || (_this select 1) == 28) then { true }"];

player setVariable ["local_insMoney", 10000, true];

private _playerUniform = _insClothes select round random ((count _insClothes)-1);
[player, _playerUniform] remoteExec ["addUniform", 0];

private _playerHeadGear = _insHeadgear select round random ((count _insHeadgear)-1);
[player, _playerHeadGear] remoteExec ["addHeadgear", 0];

if (["PersianHead_A3_01", "PersianHead_A3_02", "PersianHead_A3_03"] findIf { face player == _x } == -1) then
{
    private _playerHead = _insHead select round random ((count _insHead)-1);
    player remoteExec ["removeGoggles", 0];
    [player, _playerHead] remoteExec ["setFace", 0];
};

private _insActionMenu = ["INS_AceMenu","Insurrection Menu","",{nil},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _insActionMenu] call ace_interact_menu_fnc_addActionToObject;

_hook = ["INS_ItemShop", "Item Shop", "", {call client_fnc_itemShop_openShop;}, {true}, {}, []] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "INS_AceMenu"], _hook] call ace_interact_menu_fnc_addActionToObject;

[] spawn client_fnc_ins_markerManagerStatic;
[] spawn client_fnc_ins_markerManagerDynamic;
[] spawn {
    waitUntil {missionNamespace getVariable["server_safehouseDataCount", 0] > 0};
    sleep 1;
    _data = missionNamespace getVariable["server_safehouseData", []] select 0;
    _box = _data select 2;
    player attachTo [_box, [0, 0 ,0]];
    sleep 1;
    detach player;
};