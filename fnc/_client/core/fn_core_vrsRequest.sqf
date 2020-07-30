waitUntil {!isNull (findDisplay 2900)};
disableSerialization;

private _itemIndex = lbCurSel 2902;
private _itemValue = lbValue [2902, _itemIndex];
private _itemData = lbData [2902, _itemIndex];

private _playerMoney = player getVariable["cl_money", 0];
if (_playerMoney >= _itemValue) then
{
    private _string = format["<t font='PuristaBold' align='center' size='2'>Purchased</t>
    <br/><t font='PuristaMedium' align='center' size='1.5' color='#FFA83B3B'>-%1$</t>", _itemValue];
    [_string] call client_fnc_core_displayStructuredText;

	player setVariable ["cl_money", _playerMoney - _itemValue, true];

	private _displayVehicle = player getVariable ["vrsVehicle", objNull];
	if (!(isNull _displayVehicle)) then {deleteVehicle _displayVehicle};

    [_itemData] spawn {
        params["_itemData"];
        _itemData createVehicle position (switch (player getVariable ["local_bluforVSType", -1]) do {case 1: {BLUFORvehicleSpawn_1};case 2: {BLUFORvehicleSpawn_2};});
    };
};