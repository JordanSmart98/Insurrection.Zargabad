waitUntil {!isNull (findDisplay 3000)};
disableSerialization;

private _itemIndex = lbCurSel 3002;
private _itemValue = lbValue [3002, _itemIndex];
private _itemData = lbData [3002, _itemIndex];

private _playerMoney = player getVariable["local_insMoney", 0];
if (_playerMoney >= _itemValue) then
{
    private _string = format["<t font='PuristaBold' align='center' size='2'>Purchased</t>
    <br/><t font='PuristaMedium' align='center' size='1.5' color='#FFA83B3B'>-%1$</t>", _itemValue];
    [_string] call client_fnc_core_displayStructuredText;

	player setVariable ["local_insMoney", _playerMoney - _itemValue, true];

	private _displayVehicle = player getVariable ["vrsVehicle", objNull];
	if (!(isNull _displayVehicle)) then {deleteVehicle _displayVehicle};

    [_itemData] spawn {
        params["_itemData"];
        _itemData createVehicle position (switch (player getVariable ["local_insVSType", -1]) do {case 1:{INSvehicleSpawn_1}; case 2:{INSvehicleSpawn_2};});
    };
};