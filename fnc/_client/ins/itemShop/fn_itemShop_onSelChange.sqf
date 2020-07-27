waitUntil {!isNull (findDisplay 4000)};
disableSerialization;

private _display = findDisplay 4000;
private _Text_ItemDescription = _display displayCtrl 4005;
private _Text_ItemPrice = _display displayCtrl 4006;

private _itemIndex = lbCurSel 4001;
private _itemName = lbText[4001, _itemIndex];
private _itemPrice = lbValue[4001, _itemIndex];

private _text = switch (_itemName) do
{
    case "Roadblock Kit": {"<t font='PuristaLight' align='center'>Ace Self Interaction -> Insurrection Menu -> Place roadblock</t><br/><br/><t font='PuristaMedium' align='left'>Placeable barricade intended to stop vehicles</t>"};
    case "Carbomb Kit": {"<t font='PuristaLight' align='center'>Ace Self Interaction -> Insurrection Menu -> Mount carbomb</t><br/><br/><t font='PuristaMedium' align='left'>Must be within 5m of car center to mount</t><br/><t font='PuristaMedium' align='left'>50-100m Kill radius, walls severely impact effectiveness</t>"};
    case "Heal to full": {"<t font='PuristaLight' align='center'>Instant</t><br/><br/><t font='PuristaMedium' align='left'>Fully restore your hp</t>"};
    case "Additonal Safehouse": {"<t font='PuristaLight' align='center'>+1 Safehouses</t><br/><br/><t font='PuristaMedium' align='left'>Instantly create an additional safehouse</t>";};
};

_Text_ItemPrice ctrlSetStructuredText parseText format["$%1", _itemPrice];
_Text_ItemDescription ctrlSetStructuredText parseText _text;