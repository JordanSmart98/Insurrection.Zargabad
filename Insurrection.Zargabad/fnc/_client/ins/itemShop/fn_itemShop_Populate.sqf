waitUntil {!isNull (findDisplay 4000)};
disableSerialization;
_display = findDisplay 4000;
_Text_Fund = _display displayCtrl 4002;
_Text_Safehouses = _display displayCtrl 4003;
_Text_Dickers = _display displayCtrl 4004;

_itemList = [
    ["Roadblock Kit", 501, "['INS_PlaceRoadblock', 'Place Roadblock', '', '[player] call client_fnc_items_RoadBlock;'] call client_fnc_itemShop_addAceAction;"],
    ["Carbomb Kit", 502, "['INS_MountCarbomb', 'Mount Carbomb', '', 'call client_fnc_items_Carbomb;'] call client_fnc_itemShop_addAceAction;"],
    ["Additonal Safehouse", 503, "call client_fnc_items_Safehouse;"]
];

{
    _itemIndex = lbAdd [4001, _x select 0];
    lbSetValue [4001, _itemIndex, _x select 1];
    lbSetData [4001, _itemIndex, _x select 2];
}forEach _itemList;

_Text_Fund ctrlSetStructuredText parseText format["$%1", player getVariable["local_insMoney", 0]];

_safehouseArray = missionNamespace getVariable ["server_insSafehouseMarkers", []];
_Text_Safehouses ctrlSetStructuredText parseText format["%1", count _safehouseArray];

_dickersArray = missionNamespace getVariable ["server_dickersArray", []];
_Text_Dickers ctrlSetStructuredText parseText format["%1", count _dickersArray];
