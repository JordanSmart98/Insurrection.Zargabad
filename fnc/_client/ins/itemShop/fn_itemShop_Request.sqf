waitUntil {!isNull (findDisplay 4000)};
disableSerialization;

_display = findDisplay 4000;
_Text_Fund = _display displayCtrl 4002;

_itemIndex = lbCurSel 4001;
_itemValue = lbValue [4001, _itemIndex];
_itemData = lbData [4001, _itemIndex];

_playerMoney = player getVariable["local_insMoney", 0];
if (_playerMoney >= _itemValue) then
{
    _string = format["<t font='PuristaBold' align='center' size='2'>Purchased</t>
    <br/><t font='PuristaMedium' align='center' size='1.5' color='#FFA83B3B'>-%1$</t>", _itemValue];

    [_string] call client_fnc_core_displayStructuredText;

    player setVariable ["local_insMoney", _playerMoney - _itemValue, true];
    _Text_Fund ctrlSetStructuredText parseText format["$%1", player getVariable["local_insMoney", 0]];

    call compile _itemData;
};
