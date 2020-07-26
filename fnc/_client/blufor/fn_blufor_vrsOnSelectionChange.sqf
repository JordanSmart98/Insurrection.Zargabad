private _itemIndex = lbCurSel 2902;
private _itemData = lbData [2902, _itemIndex];
private _displayVehicle = player getVariable["vrsVehicle", objNull];

if (!(isNull _displayVehicle)) then {deleteVehicle _displayVehicle};

_displayVehicle = _itemData createVehicleLocal position (switch (player getVariable ["local_bluforVSType", -1]) do {case 1: {BLUFORvehicleSpawn_1};case 2: {BLUFORvehicleSpawn_2};});

private _position = getPosWorld _displayVehicle;
private _vectorDirUp = [vectorDir _displayVehicle, vectorUp _displayVehicle];
private _model = getModelInfo _displayVehicle select 1;
deleteVehicle _displayVehicle;

private _simpleVehicle = createSimpleObject [_model, _position];
_simpleVehicle setVectorDirAndUp _vectorDirUp;

private _trigger = createTrigger["EmptyDetector", getPos player];
_trigger setTriggerArea [5, 5, 0, false, 5];
_trigger triggerAttachVehicle [player];
_trigger setTriggerActivation ["VEHICLE", "NOT PRESENT", true];
_trigger setTriggerStatements ["this", "_displayVehicle = player getVariable 'vrsVehicle'; if (typeName _displayVehicle == 'OBJECT') then {deleteVehicle _displayVehicle};", ""];

player setVariable ["vrsVehicle", _simpleVehicle, true];

ctrlSetText[2903,(getText (configFile >> "CfgVehicles" >> _itemData >> "editorPreview"))];