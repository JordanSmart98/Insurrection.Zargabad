waitUntil {!isNull (findDisplay 4100)};
disableSerialization;
params["_index"];

private _displayMenu = findDisplay 4100;
private _test = switch (_index) do
{
    case 0:
    {
        if (call client_fnc_core_menuConditionCheck) then {
            [] spawn {findDisplay 46 createDisplay "dialog_InsurgentItemShop"};
        };
    };
    case 1:
    {
        if (call client_fnc_core_menuConditionCheck) then {
            [] spawn {findDisplay 46 createDisplay "dialog_VehicleRS"};
        };
    };
    case 2:
    {};
};