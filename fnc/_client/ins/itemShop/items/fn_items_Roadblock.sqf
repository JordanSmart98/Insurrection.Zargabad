params["_insPlayer"];

_roadBlock = "Land_Canal_Wall_10m_F" createVehicle position _insPlayer;
_roadBlock attachTo [_insPlayer, [0, 3, -3.1], "Pelvis"];
_roadBlock setDir 180;

_insPlayer addAction [ "Setup Roadblock",
{		
	params ["_target", "_insPlayer", "_actionId", "_arguments"];
	
	_roadBlock = _arguments select 0;
	detach _roadBlock;
	[_insPlayer, "AmovPercMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon", 1] call ace_common_fnc_doAnimation;
	[5,[_insPlayer, _actionId, _roadBlock],
	{
		params ["_params"];
		_insPlayer = _params select 0;
		_actionId = _params select 1;
		_roadBlock = _params select 2;

		[_insPlayer, "snd_effect_roadblock"] call client_fnc_core_say3DMP;

		_insPlayer removeAction _actionId;
		
		_dir = getDir _roadBlock + 180;

		["roadBlock", getPos _roadBlock, [0,0,0], _dir, false] remoteExec ["server_fnc_core_spawnComp", 2];
		
		deleteVehicle _roadBlock;

        _string = "<t font='PuristaBold' align='center' size='2'>Roadblock Placed</t>";
        [_string] call client_fnc_core_displayStructuredText;

		[_insPlayer, 1, ["ACE_SelfActions", "INS_AceMenu", "INS_PlaceRoadblock"]] call ace_interact_menu_fnc_removeActionFromObject;
	},
	{
		params ["_params"];
		_insPlayer = _params select 0;
		_roadBlock = _params select 2;
		
		deleteVehicle _roadBlock;
		["ace_common_displayTextStructured", ["<t size='1.5'>Interrupted</t>", 2, _insPlayer], [_insPlayer]] call CBA_fnc_targetEvent;
	}, "Building"] call ace_common_fnc_progressBar;
},
[_roadBlock],
1,
true, true, "", "(side _this == CIVILIAN)"];