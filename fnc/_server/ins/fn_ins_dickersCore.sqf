#define DICKER_RANGE 30
#define DICKER_COOLDOWN 30

CurrentDickers = [];
CurrentSpots = [];

fnc_dickersBehaviour = {
    private _bluforPlayers = (west call server_fnc_core_getPlayers) select {!((vehicle _x) isKindOf "Air")};
    {
        private _closestPlayers = [_bluforPlayers, [_x], { _input0 distance _x }, "ASCEND"] call BIS_fnc_sortBy;
        private _closestPlayer = _closestPlayers select 0;
        if (!(isNil "_closestPlayer")) then {
            if ((_x distance _closestPlayer) < DICKER_RANGE) then {
                if (((_x getVariable ["cl_lastDetect", 0]) + DICKER_COOLDOWN) < time) then {
                    _x setVariable ["cl_lastDetect", time];
                    _x disableAI "move";
                    _x lookAt _closestPlayer;
                    [_x, "AinvPercMstpSnonWnonDnon_G01"] remoteExec ["switchMove", 0];
                    ["DickerSpotted", ["An infidel has been spotted by our brothers!"]] remoteExec ["bis_fnc_showNotification", (civilian call server_fnc_core_getPlayers)];

                    private _spotCount = count CurrentSpots;
                    if (_spotCount == 0 || _spotCount <= 4) then {
                        CurrentSpots pushBack [position _closestPlayer, daytime, name _closestPlayer];
                    }
                    else {
                        CurrentSpots deleteAt 0;
                        CurrentSpots pushBack [position _closestPlayer, daytime, name _closestPlayer];
                    };

                    missionNamespace setVariable["svr_dickerSpots", CurrentSpots, true];
                    missionNamespace setVariable["svr_dickerSpotCount", count CurrentSpots, true];
                };
            }
            else {
                _x enableAI "Move";
            };
        };
    } forEach CurrentDickers;
};

fnc_dickersPersist = {
    CurrentDickers = CurrentDickers select {!(isNull _x)  && alive _x};
    private _dickerCount = count CurrentDickers;

    private _cityMen = nearestObjects[getMarkerPos "marker_0", ["CAManBase"], 450];
    private _cityCivs = _cityMen select {side _x == civilian and !(isPlayer _x)};
    private _civCount = count _cityCivs;

    private _dickersPercent = missionNamespace getVariable["svr_dickersPercent", 20];
    private _dickerPop = round(_civCount * (_dickersPercent / 100));

    if (_civCount < 5) exitWith {sleep 1;};
    if (_dickerCount == _dickerPop) exitWith {[] call fnc_dickersBehaviour;};

    while {_dickerCount < _dickerPop} do {
        private _randomCiv = _cityCivs select (floor (random _civCount));
        if (!(_randomCiv getVariable["cl_insDicker", false])) then {
            _randomCiv setVariable ["cl_insDicker", true, true];
            _randomCiv addItem "ACE_Cellphone";

            _dickerCount = _dickerCount + 1;
            CurrentDickers pushBack _randomCiv;
        };
    };

    while {_dickerCount > _dickerPop} do {
        private _removedCiv = CurrentDickers deleteAt 0;
        _removedCiv setVariable ["cl_insDicker", false, true];
        _removedCiv removeItem "ACE_Cellphone";
        _dickerCount = _dickerCount - 1;
    };

    missionNamespace setVariable["svr_dickersArray", CurrentDickers, true];
    missionNamespace setVariable["svr_dickersCount", _dickerCount, true];
};

[] spawn {
    while {true} do {
        [] call fnc_dickersPersist;
        sleep 0.33;
    };
}