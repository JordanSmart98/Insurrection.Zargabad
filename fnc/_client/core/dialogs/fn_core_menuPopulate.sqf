waitUntil {!isNull (findDisplay 4100)};
disableSerialization;

private _display = findDisplay 4100;
private _Text_Pop = _display displayCtrl 4101;
private _Text_Will = _display displayCtrl 4102;
private _Text_Money = _display displayCtrl 4103;

private _dickersPercent = missionNamespace getVariable["svr_dickersPercent", 20];
_Text_Pop ctrlSetText format["%1%2", _dickersPercent, "%"];

private _dickersWill = missionNamespace getVariable["svr_dickersWill", 50];
_Text_Will ctrlSetText format["%1%2", _dickersWill, "%"];

private _money = player getVariable ["cl_money", 0];
_Text_Money ctrlSetText format["$%1", _money];

private _Btn_IS = _display displayCtrl 4110;
private _Btn_VS = _display displayCtrl 4111;
private _Btn_PS = _display displayCtrl 4112;

if (call client_fnc_core_menuConditionCheck) then {
    switch (playerSide) do {
        case west: {_Btn_IS ctrlEnable false; _Btn_VS ctrlEnable true;};
        case civilian: {_Btn_IS ctrlEnable true; _Btn_VS ctrlEnable true;};
    };
    _Btn_PS ctrlEnable false;
}
else {
    switch (playerSide) do {
        case west: {_Btn_IS ctrlEnable false; _Btn_VS ctrlEnable false;};
        case civilian: {_Btn_IS ctrlEnable false; _Btn_VS ctrlEnable false;};
    };
    _Btn_PS ctrlEnable false;
};