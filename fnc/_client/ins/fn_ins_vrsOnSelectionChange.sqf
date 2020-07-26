private _itemIndex = lbCurSel 3002;
private _itemData = lbData [3002, _itemIndex];
ctrlSetText[3003,(getText (configFile >> "CfgVehicles" >> _itemData >> "editorPreview"))];