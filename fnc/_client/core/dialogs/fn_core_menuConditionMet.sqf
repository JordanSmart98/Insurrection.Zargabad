disableSerialization;
params["_idd"];

while {!isNull(findDisplay _idd)} do {
    if (call client_fnc_core_menuConditionCheck) then {
        sleep 1;
    }
    else {
        findDisplay _idd closeDisplay 0;
    };
};