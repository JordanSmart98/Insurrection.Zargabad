waitUntil {!isNull (findDisplay 2900)};
disableSerialization;
_display = findDisplay 2900;
_Text_Fund = _display displayCtrl 2901;
_List_Vehicles = _display displayCtrl 2902;

_itemIndex = lbCurSel 2902;
_itemValue = lbValue [2902, _itemIndex];
_itemData = lbData [2902, _itemIndex];

_playerMoney = player getVariable["local_bluforMoney", 0];
if (_playerMoney >= _itemValue) then
{
    _string = format["<t font='PuristaBold' align='center' size='2'>Purchased</t>
    <br/><t font='PuristaMedium' align='center' size='1.5' color='#FFA83B3B'>-%1$</t>", _itemValue];
    [_string] call client_fnc_core_displayStructuredText;

	player setVariable ["local_bluforMoney", _playerMoney - _itemValue, true];

	private _displayVehicle = player getVariable ["vrsVehicle", objNull];
	if (!(isNull _displayVehicle)) then {deleteVehicle _displayVehicle};

    [_itemData] spawn {
        params["_itemData"];
        _itemData createVehicle position (switch (player getVariable ["local_bluforVSType", -1]) do {case 1: {BLUFORvehicleSpawn_1};case 2: {BLUFORvehicleSpawn_2};});
    };
};