private ["_hook"];
params ["_actionTag", "_actionText", "_actionIcon", "_stringFncToCall"];

_fnc = compile _stringFncToCall;
_hook = [_actionTag, _actionText,  _actionIcon, _fnc, {true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "INS_AceMenu"], _hook] call ace_interact_menu_fnc_addActionToObject;