waitUntil {!isNull (findDisplay 5000)};
disableSerialization;
_display = findDisplay 5000;
_Text_Fund = _display displayCtrl 5001;
_List_Loadouts = _display displayCtrl 5002;

private _bluforLoadoutList = [
    ["Rifleman", 1000],
    ["Marksman", 1000],
    ["Demolition Expert", 1000]
];

private _insLoadoutList = [
    ["Gunner", 1000],
    ["Sniper", 1000],
    ["Rocketman", 1000]
];

private _LoadoutList = switch (playerSide) do { case west: {_bluforLoadoutList;}; case civilian: {_insLoadoutList;}; };

private _moneyLocalVariable = switch (playerSide) do { case west: {"local_bluforMoney";}; case civilian: {"local_insMoney";}; };

{
    private _displayName = _x select 0;
    private _itemIndex = lbAdd [5002, _displayName + format[": %1$", _x select 1] ];
    lbSetValue [5002, _itemIndex, _x select 1];
    lbSetData [5002, _itemIndex, _x select 0];
}forEach _LoadoutList;

_Text_Fund ctrlSetText format["$%1", player getVariable [_moneyLocalVariable, 0]];

