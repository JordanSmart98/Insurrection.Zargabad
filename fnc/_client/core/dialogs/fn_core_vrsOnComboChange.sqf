disableSerialization;

private _display = findDisplay 7900;
private _List_Vehicles = _display displayCtrl 7901;
private _Lb_Type = _display displayCtrl 7902;

private _itemIndex = lbCurSel _Lb_Type;
private _itemData = _Lb_Type lbData _itemIndex;
private _curVehicleArray = switch (_itemData) do
{
    case "BluforLandVL": {BluforLandVL};
    case "BluforAirVL": {BluforAirVL};
    case "insBlackmarketVL": {insBlackmarketVL};
    case "insCivVL": {insCivVL};
};

lbClear _List_Vehicles;
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
_List_Vehicles lbSetCurSel 0;