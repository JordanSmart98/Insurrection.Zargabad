private["_ItemPos", "_ItemData", "_displayVehicle", "_position", "_vectorDirUp", "_model", "_simpleVehicle", "_trigger"];

_itemIndex = lbCurSel 2902;
_itemData = lbData [2902, _itemIndex];
_displayVehicle = player getVariable["vrsVehicle", objNull];

if (!(isNull _displayVehicle)) then {deleteVehicle _displayVehicle};

_displayVehicle = _itemData createVehicleLocal position (switch (player getVariable ["local_bluforVSType", -1]) do {case 1: {BLUFORvehicleSpawn_1};case 2: {BLUFORvehicleSpawn_2};});

_position = getPosWorld _displayVehicle;
_vectorDirUp = [vectorDir _displayVehicle, vectorUp _displayVehicle];
_model = getModelInfo _displayVehicle select 1;
deleteVehicle _displayVehicle;

_simpleVehicle = createSimpleObject [_model, _position];
_simpleVehicle setVectorDirAndUp _vectorDirUp;

_trigger = createTrigger["EmptyDetector", getPos player];
_trigger setTriggerArea [5, 5, 0, false, 5];
_trigger triggerAttachVehicle [player];
_trigger setTriggerActivation ["VEHICLE", "NOT PRESENT", true];
_trigger setTriggerStatements ["this", "_displayVehicle = player getVariable 'vrsVehicle'; if (typeName _displayVehicle == 'OBJECT') then {deleteVehicle _displayVehicle};", ""];

player setVariable ["vrsVehicle", _simpleVehicle, true];