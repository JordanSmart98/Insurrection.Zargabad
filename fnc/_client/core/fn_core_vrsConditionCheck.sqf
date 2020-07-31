private _civCondition = {

};

switch (playerSide) do {
    case west: {[blufor_triggerStartArea, (getPos player), false, false] call BIS_fnc_inTrigger};
    case civilian: {_civCondition};
}