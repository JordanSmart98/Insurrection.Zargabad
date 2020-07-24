KeyFunctions = [//dik	//shift	//ctrl	//alt
		[[22, 	false,	false,	false], client_fnc_core_holsterWeapon], // U
		[[22, 	true,	false,	false], client_fnc_core_holsterWeapon], // Shift + U
		[[22, 	false,	false,	true], client_fnc_core_holsterWeapon],  // Alt + U
		[[22, 	true,	false,	true], client_fnc_core_holsterWeapon],
		[[35, 	false,	false,	false], client_fnc_core_holsterWeapon], // H
		[[35, 	true,	false,	false], client_fnc_core_holsterWeapon], // Shift + H
		[[35, 	false,	false,	true], client_fnc_core_holsterWeapon],  // Alt + H
		[[35, 	true,	false,	true], client_fnc_core_holsterWeapon]]; // Shift + Alt + H
		
while {isNull(findDisplay 46)} do {sleep 0};
(findDisplay 46) displayAddEventHandler ["KeyDown",
{
	private _kpd = _this select [1, 4];
	{_x params ["_key", "_scr"]; if (_key isEqualTo _kpd) exitWith {call _scr; true}; false;
	} forEach KeyFunctions;
}];