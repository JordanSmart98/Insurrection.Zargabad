waitUntil {!isNull (findDisplay 4000)};
disableSerialization;

private _display = findDisplay 4000;
private _Text_ItemDescription = _display displayCtrl 4005;
private _Text_ItemPrice = _display displayCtrl 4006;

private _itemIndex = lbCurSel 4001;
private _itemName = lbText[4001, _itemIndex];
private _itemPrice = lbValue[4001, _itemIndex];

_Text_ItemPrice ctrlSetStructuredText parseText format["$%1", _itemPrice];

if (_itemName == "Roadblock Kit") then
{
    _Text_ItemDescription ctrlSetStructuredText parseText "<t font='PuristaLight' align='center'> Ace Self Interaction -> Insurrection Menu -> Place roadblock</t>
    </br><t font='PuristaMedium' align='left'> Placeable barricade</t>";
};

if (_itemName == "Carbomb Kit")then
{
    _Text_ItemDescription ctrlSetStructuredText parseText "<t font='PuristaLight' align='center'> Ace Self Interaction -> Insurrection Menu -> Mount carbomb</t>
    </br><t font='PuristaMedium' align='left'>Must be within 5m of car center to mount</t>
    </br><t font='PuristaMedium' align='left'>50-100m kill radius</t>";
};

if (_itemName == "Additonal Safehouse")then
{
    _Text_ItemDescription ctrlSetStructuredText parseText "<t font='PuristaLight' align='center'>+1 Safehouses</t>
    </br><t font='PuristaMedium' align='left'>Instantly create an additional safehouse </t>";
};