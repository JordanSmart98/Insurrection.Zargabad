waitUntil {!isNull (findDisplay 4000)};
disableSerialization;
private _display = findDisplay 4000;
private _Text_Fund = _display displayCtrl 4002;
private _Text_Safehouses = _display displayCtrl 4003;
private _Text_Dickers = _display displayCtrl 4004;

private _itemList = [
    ["Roadblock Kit", 250, "call client_fnc_items_roadblockAdd;"],
    ["Carbomb Kit", 500, "call client_fnc_items_carbombAdd;"],
    ["Heal to full", 1000, "call client_fnc_items_AceHeal;"],
    ["Additonal Safehouse", 2000, "call client_fnc_items_Safehouse;"]
];

{
    private _itemIndex = lbAdd [4001, _x select 0];
    lbSetValue [4001, _itemIndex, _x select 1];
    lbSetData [4001, _itemIndex, _x select 2];
}forEach _itemList;

_Text_Fund ctrlSetStructuredText parseText format["$%1", player getVariable["cl_money", 0]];
_Text_Safehouses ctrlSetStructuredText parseText format["%1", missionNamespace getVariable ["svr_safehouseCount", 0]];
_Text_Dickers ctrlSetStructuredText parseText format["%1", missionNamespace getVariable ["svr_dickersCount", 0]];