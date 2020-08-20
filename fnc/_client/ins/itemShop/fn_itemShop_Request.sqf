waitUntil {!isNull (findDisplay 4000)};
disableSerialization;

private _display = findDisplay 4000;
private _Lb_List = _display displayCtrl 4001;
private _Text_Fund = _display displayCtrl 4002;

private _itemIndex = lbCurSel _Lb_List;
private _itemValue = _Lb_List lbValue _itemIndex;
private _itemData = _Lb_List lbData _itemIndex;

private _playerMoney = player getVariable["cl_money", 0];
if (_playerMoney >= _itemValue) then
{
    private _string = format["<t font='PuristaBold' align='center' size='2'>Purchased</t>
    <br/><t font='PuristaMedium' align='center' size='1.5' color='#FFA83B3B'>-%1$</t>", _itemValue];
    [_string] call client_fnc_core_displayStructuredText;

    player setVariable ["cl_money", _playerMoney - _itemValue, true];
    _Text_Fund ctrlSetStructuredText parseText format["$%1", player getVariable["cl_money", 0]];

    call compile _itemData;
};
