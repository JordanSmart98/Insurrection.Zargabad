waitUntil {!isNull (findDisplay 5000)};
disableSerialization;
_display = findDisplay 5000;
_Text_Fund = _display displayCtrl 5001;
_List_Loadout = _display displayCtrl 5002;

_itemIndex = lbCurSel 5002;
_itemValue = lbValue [5002, _itemIndex];
_itemData = lbData [5002, _itemIndex];

_playerMoney = player getVariable["local_bluforMoney", 0];
if (_playerMoney >= _itemValue) then
{
    _string = format["<t font='PuristaBold' align='center' size='2'>Purchased</t>
    <br/><t font='PuristaMedium' align='center' size='1.5' color='#FFA83B3B'>-%1$</t>", _itemValue];
    [_string] call client_fnc_core_displayStructuredText;

	player setVariable ["local_bluforMoney", _playerMoney - _itemValue, true];

    [player,str(_itemIndex+1)] call client_fnc_core_loadouts;

};