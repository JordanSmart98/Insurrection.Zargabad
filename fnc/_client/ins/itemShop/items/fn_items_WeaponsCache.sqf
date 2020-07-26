params["_insPlayer"];

iedCache = "CUP_BAF_IEDBox" createVehicle getMarkerPos "marker_safespawn";
iedCache attachTo [_insPlayer, [0, 1, 0], "Pelvis"];
iedCache setDir 180;

clearItemCargoGlobal iedCache;
clearWeaponCargoGlobal iedCache;
clearBackpackCargoGlobal iedCache;
clearMagazineCargoGlobal iedCache;

//TODO REWORK -> SHOULD BE ABLE TO JUST PLACE THE CRATE AND IT GO THERE WITHOUT FUCKING EXPLODING
//just delete this trash

iedCache addItemCargoGlobal ["ACE_Cellphone", 40];
iedCache addItemCargoGlobal ["CUP_IED_V4_M", 10];
iedCache addItemCargoGlobal ["CUP_IED_V3_M", 10];
iedCache addItemCargoGlobal ["CUP_IED_V2_M", 10];
iedCache addItemCargoGlobal ["CUP_IED_V1_M", 10];
iedCache addBackpackCargoGlobal ["CUP_B_AlicePack_OD", 3];

ICAction = _insPlayer addAction ["Setup Cache",
    {
		params ["_target", "_insPlayer", "_actionId", "_arguments"];
        _insPlayer removeAction _actionId;
        detach iedCache;
		[_insPlayer, "AmovPercMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon", 1] call ace_common_fnc_doAnimation;
		
		[5,[_insPlayer],
		{
			params ["_params"];
			_insPlayer = _params select 0;

			[_insPlayer, "snd_effect_roadblock"] call client_fnc_core_say3DMP;

			["ace_common_displayTextStructured", ["<t size='1.5'>Cache placed and marked.</t>", 2, _insPlayer], [_insPlayer]] call CBA_fnc_targetEvent;
			[_insPlayer, 1, ["ACE_SelfActions", "INS_AceMenu","INS_PlaceIEDCache"]] call ace_interact_menu_fnc_removeActionFromObject;
		},
		{
			params ["_params"];
			_insPlayer = _params select 0;
			
			deleteVehicle iedCache;
			["ace_common_displayTextStructured", ["<t size='1.5'>Interrupted</t>", 2, _insPlayer], [_insPlayer]] call CBA_fnc_targetEvent;
		}, "Unpacking"] call ace_common_fnc_progressBar;
    },
    [],
    1,
    true, true, "", "(side _this == CIVILIAN)"];