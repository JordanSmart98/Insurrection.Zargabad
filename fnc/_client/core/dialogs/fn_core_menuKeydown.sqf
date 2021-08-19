_display = (findDisplay 46) createDisplay "dialog_Menu";
_display displayAddEventHandler ["KeyDown", {if ((_this select 1) == 48) then {(_this select 0) closeDisplay 1;}; true}]