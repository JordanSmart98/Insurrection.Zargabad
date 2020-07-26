switch (_this select 0) do
{
    case true:
    {
        if (isNil "f_eh_safetyMan") then
        {
            f_eh_safetyMan = player addEventHandler["Fired",
            {
                params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];

                deleteVehicle _projectile;
                "safeStartTextLayer" cutText ["SAFESTART ACTIVE", "PLAIN", 0];
                "safeStartTextLayer" cutFadeOut 3;
                if (_weapon isEqualTo "Throw" || {_weapon isEqualTo "Put"}) then
                {
                    player addMagazine _magazine;
                }
                else
                {
                    private _ammo = player ammo _weapon;
                    if (_ammo > 0) then
                    {
                        player setAmmo [_weapon, _ammo+1];
                    }
                    else
                    {
                        player addMagazine _magazine;
                        player removeWeapon _weapon;
                        player addWeapon _weapon;
                    };
                };
            }];
        };

        if (vehicle player != player && {player in [gunner vehicle player,driver vehicle player,commander vehicle player]}) then
        {
            player setVariable ["f_var_safetyVeh", vehicle player];
            (player getVariable "f_var_safetyVeh") allowDamage false;

            if (isNil "f_eh_safetyVeh") then
            {
                f_eh_safetyVeh = (player getVariable "f_var_safetyVeh") addEventHandler["Fired", {deleteVehicle (_this select 6);}];
            };
        };

        player allowDamage false;
    };
    case false:
    {
        if (!(isNil "f_eh_safetyMan")) then
        {
            player removeEventHandler ["Fired", f_eh_safetyMan];
            f_eh_safetyMan = nil;
        };

        if (!(isNull(player getVariable ["f_var_safetyVeh",objNull]))) then
        {
            (player getVariable "f_var_safetyVeh") allowDamage true;

            if (!(isNil "f_eh_safetyVeh")) then
            {
                (player getVariable "f_var_safetyVeh") removeEventHandler ["Fired", f_eh_safetyVeh];
                f_eh_safetyVeh = nil;
            };
            player setVariable ["f_var_safetyVeh",nil];
        };

        player allowDamage true;
		{deleteVehicle _x;} forEach playableUnits;
    };
};