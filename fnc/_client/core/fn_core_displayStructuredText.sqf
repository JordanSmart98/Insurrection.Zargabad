params ["_structuredText"];

playSound "snd_effect_click";

1 cutRsc ["Insurrection_Message", "PLAIN"];
waitUntil {!isNull (uiNamespace getVariable "Insurrection_Message")};
private _display = uiNamespace getVariable "Insurrection_Message";
private _setText = _display displayCtrl 501;
_setText ctrlSetStructuredText parseText _structuredText;