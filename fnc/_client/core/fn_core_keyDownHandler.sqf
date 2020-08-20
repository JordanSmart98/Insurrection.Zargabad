KeyFunctions = [
[[48,false,false,false], client_fnc_core_menuKeydown],
[[48,true,false,false], client_fnc_core_menuKeydown],
[[48,false,false,true], client_fnc_core_menuKeydown],
[[48,true,false,true], client_fnc_core_menuKeydown]
];//dik//shift//ctrl//alt

while {isNull(findDisplay 46)} do {sleep 0};
(findDisplay 46) displayAddEventHandler ["KeyDown", {private _kpd = _this select [1, 4];
	{
        _x params ["_key", "_scr"];
        if (_key isEqualTo _kpd) exitWith {[_kpd] spawn _scr; true;};
        false;
	} forEach KeyFunctions;
}];