params["_car"];
_statement = {
	params ["_target", "_player", "_actionParams"];
    [_target, _player, _actionParams] spawn
    {
        params ["_target", "_player", "_actionParams"];
        private _car = _actionParams select 0;
        private _activationRange = switch (_player getVariable["local_insSelected", 0]) do
        {
            case 1: {500};
            case 2: {1000};
            case 3: {200};
        };

        if ((_player distance2D _car) < _activationRange) then
        {
            _phoneNumber = format["0%1%2%3%4%5%6", round random 10, round random 10, round random 10, round random 10, round random 10, round random 10];
            1 cutRsc ["Phone_HUD", "PLAIN"];
            waitUntil {!isNull (uiNamespace getVariable "Phone_HUD")};
            _display = uiNamespace getVariable "Phone_HUD";
            _setText = _display displayCtrl 1186;
            _setText ctrlSetStructuredText (parseText "");

            [_player, "snd_effect_phonedialing"] call client_fnc_core_say3DMP;
            _timings = [0.69, 0.95, 0.76, 1.28, 0.49, 0.63, 0.69];
            _i = 0;
            {
                _i = _i + 1;
                sleep _x;
                _setText ctrlSetStructuredText (parseText format ["<t color='#2b2c2e' font='PuristaMedium' size='4'> %1 </t>", _phoneNumber select [0, _i]]);
            }forEach _timings;

            createVehicle ["Bo_GBU12_LGB", getPos _car, [], 0, "CAN_COLLIDE"];
            createVehicle ["Bo_GBU12_LGB", getPos _car, [], 0, "CAN_COLLIDE"];
            createVehicle ["Bo_GBU12_LGB", getPos _car, [], 0, "CAN_COLLIDE"];
            createVehicle ["Bo_GBU12_LGB", getPos _car, [], 0, "CAN_COLLIDE"];
            createVehicle ["Bo_GBU12_LGB", getPos _car, [], 0, "CAN_COLLIDE"];
            createVehicle ["Bo_GBU12_LGB", getPos _car, [], 0, "CAN_COLLIDE"];

            sleep 0.8;
            [_player, "snd_effect_allahuakbar"] call client_fnc_core_say3DMP;
            [_player, 1, ["ACE_SelfActions", "INS_AceMenu", "INS_DetonateCarbomb" + str (_actionParams select 1)]] call ace_interact_menu_fnc_removeActionFromObject;
        }
        else
        {
            1 cutRsc ["Phone_HUD", "PLAIN"];
            waitUntil {!isNull (uiNamespace getVariable "Phone_HUD")};
            _display = uiNamespace getVariable "Phone_HUD";
            _setText = _display displayCtrl 1186;
            _setText ctrlSetStructuredText (parseText "<t font='RobotoCondensedBold' align='center' size=3>No Signal</t>");
        };
    };
};

_modifierFunc = {
    params ["_target", "_player", "_params", "_actionData"];
    diag_log format ["_modifierFunc [%1, %2, %3]", _target, _player, _params];
    private _car = _params select 0;
    private _carType = typeOf _car;
    private _name = getText(configFile >> "CfgVehicles" >> _carType >> "displayName");
    _actionData set [1, format ["Detonate: %1 - %2 m", _name, str round (player distance2D _car)]];
};

_randomId = round random[0, 50, 100];
_hook = ["INS_DetonateCarbomb" + str _randomId, "_", "", _statement, {true}, {}, [_car, _randomId], "", 1, [false, false, false, false, false], _modifierFunc] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "INS_AceMenu"], _hook] call ace_interact_menu_fnc_addActionToObject;
