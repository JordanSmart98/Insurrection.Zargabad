private _KeyFunctions = [
    [[22, 	false,	false,	false], ""], // U
    [[22, 	true,	false,	false], ""], // Shift + U
    [[22, 	false,	false,	true], ""],  // Alt + U
    [[22, 	true,	false,	true], ""]]; // Shift + Alt + U
    //dik	//shift	//ctrl	//alt

while {isNull(findDisplay 46)} do {sleep 0};
(findDisplay 46) displayAddEventHandler ["KeyDown", {private _kpd = _this select [1, 4];
	{
        _x params ["_key", "_scr"];
        if (_key isEqualTo _kpd) exitWith {call _scr; true;};
        false;
	} forEach _KeyFunctions;
}];