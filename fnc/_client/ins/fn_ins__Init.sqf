private _insClothes = [
	"CUP_O_TKI_Khet_Partug_01",
	"CUP_O_TKI_Khet_Partug_02",
	"CUP_O_TKI_Khet_Partug_03",
	"CUP_O_TKI_Khet_Partug_04",
	"CUP_O_TKI_Khet_Partug_05",
	"CUP_O_TKI_Khet_Partug_06",
	"CUP_O_TKI_Khet_Partug_07",
	"CUP_O_TKI_Khet_Partug_08"
];

private _insVests = [
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

private _insHeadgear = [
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

private _insHead = [
    "PersianHead_A3_01",
    "PersianHead_A3_02",
    "PersianHead_A3_03"
];

player addWeapon "ItemMap";
openMap true;

createDialog "dialog_InsurgentSelection";
waitUntil {!((findDisplay 7000) isEqualTo displayNull)}; //Ensure the display is on screen, then prevent it from being accidentally closed.
(findDisplay 7000) displaySetEventHandler ["KeyDown", "if ((_this select 1) == 1 || (_this select 1) == 57 || (_this select 1) == 28) then { true }"];
waitUntil {(findDisplay 7000) isEqualTo displayNull}; //Wait until the display is closed.

player setVariable ["cl_money", 10000, true];

// Set random clothing for player
private _playerUniform = _insClothes select round random ((count _insClothes)-1);
[player, _playerUniform] remoteExec ["addUniform", 0];

private _playerVest = _insVests select round random ((count _insVests)-1);
[player, _playerVest] remoteExec ["addVest", 0];

private _playerHeadGear = _insHeadgear select round random ((count _insHeadgear)-1);
[player, _playerHeadGear] remoteExec ["addHeadgear", 0];

if (_insHead findIf { face player == _x } == -1) then
{
    private _playerHead = _insHead select round random ((count _insHead)-1);
    player remoteExec ["removeGoggles", 0];
    [player, _playerHead] remoteExec ["setFace", 0];
};

// Add INS Menu
private _insMenuAction = ["INS_AceMenu","Insurrection Menu","hpp\images\insIcon.paa",{nil},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _insMenuAction] call ace_interact_menu_fnc_addActionToObject;

// Add Itemshop to INS Menu
private _itemShopAction = ["INS_ItemShop", "Item Shop", "hpp\images\insShop.paa", {call client_fnc_itemShop_openShop;}, {true}, {}, []] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "INS_AceMenu"], _itemShopAction] call ace_interact_menu_fnc_addActionToObject;

private _vehicleShopAction = ["INS_VehicleShop", "Vehicle Shop", "", {createDialog "dialog_VehicleRS";}, {call client_fnc_core_vrsConditionCheck;}, {}, []] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "INS_AceMenu"], _vehicleShopAction] call ace_interact_menu_fnc_addActionToObject;

// Add Tunnel Option to INS Menu if Osama
// TODO Change Icon
if (player getVariable "cl_insChoice" == 1) then
{
    private _tunnelAction = ["INS_tunnelPlace", "Place Tunnel", "hpp\images\insTunnel.paa", {call client_fnc_abilities_tunnelPlace;}, {true}, {}, []] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions", "INS_AceMenu"], _tunnelAction] call ace_interact_menu_fnc_addActionToObject;
    player setVariable["local_insTunnelCount", 0, true];
};

[] spawn client_fnc_ins_markerManagerStatic;
[] spawn client_fnc_ins_markerManagerDynamic;
[] spawn {
    waitUntil {missionNamespace getVariable["svr_safehouseDataCount", 0] > 0};
    private _data = missionNamespace getVariable["svr_safehouseData", []] select 0;
    private _box = _data select 2;
    player attachTo [_box, [0, 0 ,0]];
    sleep 0.25;
    detach player;
    waitUntil { not visibleMap };
    ["Zargabad","Kandahar Region", format["%1/%2/%3", date select 2, date select 1, date select 0]] spawn BIS_fnc_infoText;
};