disableSerialization;

private _display = findDisplay 7900;
private _Lb_List = _display displayCtrl 7901;

private _itemIndex = lbCurSel _Lb_List;
private _itemData = _Lb_List lbData _itemIndex;

private _displayName = getText (configFile >> "CfgVehicles" >> _itemData >> "displayName");
private _maxSpeed = getNumber (configFile >> "CfgVehicles" >> _itemData >> "maxSpeed");
private _maxPassengers = [_itemData, true] call BIS_fnc_crewCount;
private _armor = getNumber (configFile >> "CfgVehicles" >> _itemData >> "armor");
private _editorPreview = getText (configFile >> "CfgVehicles" >> _itemData >> "editorPreview");

private _Text_InfoName = _display displayCtrl 7904;
private _Text_InfoSpeed = _display displayCtrl 7905;
private _Text_InfoPassengers = _display displayCtrl 7906;
private _Text_InfoArmor = _display displayCtrl 7907;
private _Image_Vehicle = _display displayCtrl 7910;

_Text_InfoName ctrlSetStructuredText parseText format["<t font='Zeppelin33' align='right' size='1'>%1</t>", _displayName];
_Text_InfoSpeed ctrlSetStructuredText parseText format["<t font='Zeppelin33' align='right' size='1.15'>Speed: %1</t>", _maxSpeed];
_Text_InfoPassengers ctrlSetStructuredText parseText format["<t font='Zeppelin33' align='right' size='1.15'>Passengers: %1</t>", _maxPassengers];
_Text_InfoArmor ctrlSetStructuredText parseText format["<t font='Zeppelin33' align='right' size='1.15'>Armor: %1</t>", _armor];

_Image_Vehicle ctrlSetText _editorPreview;
