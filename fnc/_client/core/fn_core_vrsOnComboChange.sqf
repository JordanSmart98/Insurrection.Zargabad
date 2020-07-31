disableSerialization;

private _itemIndex = lbCurSel 7902;
private _itemData = lbData [7902, _itemIndex];
private _curVehicleArray = switch (_itemData) do
{
    case "BluforLandVL": {BluforLandVL};
    case "BluforAirVL": {BluforAirVL};
    case "insBlackmarketVL": {insBlackmarketVL};
    case "insCivVL": {insCivVL};
}

lbClear 7901;
{
    private _displayName = getText (configFile >> "CfgVehicles" >> _x select 0 >> "displayName");
    private _displayIcon = getText(configFile >> "cfgVehicles" >> _x select 0 >> "picture");
    private _itemIndex = lbAdd [7901, format["  $%1  ", _x select 1] + _displayName];
    lbSetData [7901, _itemIndex, _x select 0];
    lbSetValue [7901, _itemIndex, _x select 1];
    lbSetPictureRight [7901, _itemIndex, _displayIcon];
    lbSetPictureRightColor [7901, _itemIndex, [1, 1, 1, 1]];
    lbSetPictureRightColorSelected [7901, _itemIndex, [1, 1, 1, 1]];
}forEach _curVehicleArray;
lbSortByValue 7901;
