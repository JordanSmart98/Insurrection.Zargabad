/*
	author: Bluekiller
	description: none
	returns: nothing
*/
params ["_structuredText"];
private ["_display", "_setText"];

playSound "snd_effect_click";

1 cutRsc ["Insurrection_Message", "PLAIN"];
waitUntil {!isNull (uiNamespace getVariable "Insurrection_Message")};
_display = uiNamespace getVariable "Insurrection_Message";
_setText = _display displayCtrl 501;
_setText ctrlSetStructuredText parseText _structuredText;