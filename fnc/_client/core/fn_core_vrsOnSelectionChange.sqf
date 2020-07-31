private _itemIndex = lbCurSel 2902;
private _itemData = lbData [2902, _itemIndex];
ctrlSetText[2903,(getText (configFile >> "CfgVehicles" >> _itemData >> "editorPreview"))];