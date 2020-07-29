waitUntil {!isNull (findDisplay 5000)};
disableSerialization;
private _display = findDisplay 5000;
private _Text_Fund = _display displayCtrl 5001;

private _bluforLoadoutList = [
    ["Rifleman", 250],
    ["Marksman", 250],
    ["Demolition Expert", 250]
];

private _insLoadoutList = [
    ["Gunner", 250],
    ["Sniper", 250],
    ["Rocketman", 250]
];

private _LoadoutList = switch (playerSide) do { case west: {_bluforLoadoutList;}; case civilian: {_insLoadoutList;}; };

private _moneyLocalVariable = switch (playerSide) do { case west: {"cl_money";}; case civilian: {"cl_money";}; };

{
    private _displayName = _x select 0;
    private _itemIndex = lbAdd [5002, _displayName + format[": %1$", _x select 1] ];
    lbSetValue [5002, _itemIndex, _x select 1];
    lbSetData [5002, _itemIndex, _x select 0];
}forEach _LoadoutList;

_Text_Fund ctrlSetText format["$%1", player getVariable [_moneyLocalVariable, 0]];
