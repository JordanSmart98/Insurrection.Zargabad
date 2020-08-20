disableSerialization;

private _display = findDisplay 7900;
private _Text_PlayerMoney = _display displayCtrl 7903;
private _Checkbox_AsDriver = _display displayCtrl 7908;

private _List_Vehicles = _display displayCtrl 7901;
private _vehicleListIndex = lbCurSel _List_Vehicles;
private _vehicleValue = _List_Vehicles lbValue _vehicleListIndex;
private _vehicleData = _List_Vehicles lbData _vehicleListIndex;

private _Combo_Type = _display displayCtrl 7902;
private _typeComboIndex = lbCurSel _Combo_Type;
private _typeData = _Combo_Type lbData _typeComboIndex;

private _playerMoney = player getVariable["cl_money", 0];

if (_playerMoney < _vehicleValue) exitWith {"<br/><t font='PuristaBold' align='center' size='2'>Too expensive</t>" call client_fnc_core_displayStructuredText};

private _spawnPos = (getPos player) findEmptyPosition [2, 50, _vehicleData];
private _vehicle = createVehicle [_vehicleData, _spawnPos, [], 0, "NONE"];

if (_Checkbox_AsDriver ctrlChecked 0) then {
    player moveInDriver _vehicle;
    closeDialog 0;
};

[format["<t font='PuristaBold' align='center' size='2'>Purchased</t><br/><t font='PuristaMedium' align='center' size='1.5' color='#FFA83B3B'>-%1$</t>", _vehicleValue]] call client_fnc_core_displayStructuredText;
player setVariable ["cl_money", _playerMoney - _vehicleValue, true];

private _money = player getVariable ["cl_money", 0];
_Text_PlayerMoney ctrlSetStructuredText parseText format["<t font='EtelkaMonospacePro' align='center' size='3' color='#5ED890'>$%1</t>", _money];