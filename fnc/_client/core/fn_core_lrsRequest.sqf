waitUntil {!isNull (findDisplay 5000)};
disableSerialization;

private _itemIndex = lbCurSel 5002;
private _itemValue = lbValue [5002, _itemIndex];

private _moneyLocalVariable = switch (playerSide) do{case west: {"cl_money";};case civilian: {"cl_money";};};
private _playerMoney = player getVariable[_moneyLocalVariable, 0];

if (_playerMoney >= _itemValue) then
{
    private _string = format["<t font='PuristaBold' align='center' size='2'>Purchased</t>
    <br/><t font='PuristaMedium' align='center' size='1.5' color='#FFA83B3B'>-%1$</t>", _itemValue];
    [_string] call client_fnc_core_displayStructuredText;

	player setVariable [_moneyLocalVariable, _playerMoney - _itemValue, true];

    [str(_itemIndex + 1)] call client_fnc_core_loadouts;
};