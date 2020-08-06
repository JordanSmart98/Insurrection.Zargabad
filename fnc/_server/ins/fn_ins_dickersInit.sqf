private _fnc_dickerspersistence = {
    private _dickerCount = missionNamespace getVariable ["svr_dickersCount", 0];
    private _civCount = ({alive _x and side _x == civilian} count allUnits);
    private _civPercentage = missionNamespace getVariable["svr_dickersPopulation", 20];
    private _dickerPopulation = round(_civCount * (_civPercentage / 100));

    //diag_log format["dickers: dickerCount:%1, dickerPop:%2, civCount:%3", _dickerCount, _dickerPopulation, _civCount];
    if (_dickerCount < _dickerPopulation) then
    {
        //diag_log "dickers: count lower than wanted";
        private _dickersArray = missionNamespace getVariable ["svr_dickersArray", []];
        while {count _dickersArray < _dickerPopulation} do
        {
	        private _potentialCivs = nearestObjects[getMarkerPos "marker_0", ["CAManBase"], 600];
            private _indexRandom = random count _potentialCivs;
            private _pC = _potentialCivs select _indexRandom;
            if (!(isNil("_pC"))) then
            {
                private _isDicker = _pC getVariable["cl_insDicker", false];
                if (side _pC == civilian && !(isPlayer _pC) && !(_isDicker)) then
                {
                    //found a civ in the area that isnt a player and isnt a dicker
                    //while our pop is lower than wanted.
                    private _result = _dickersArray pushBackUnique _pC;
                    if (!(_result isEqualTo -1)) then
                    {
                        _pC setVariable ["cl_insDicker", true, true];
                        _pC addItem "ACE_Cellphone";
                        diag_log "dickers: set";
                    };
                };
            };
        };
        //Our population of dickers is now what it should be
        missionNamespace setVariable ["svr_dickersArray", _dickersArray, true];
        missionNamespace setVariable ["svr_dickersCount", count _dickersArray, true];
        //diag_log "dickers: population equalised";
    };
};

private _fnc_dickerscleanup = {
    private _dickerCount = missionNamespace getVariable ["svr_dickersCount", 0];
    private _civCount = ({alive _x and side _x == civilian} count allUnits);
    private _civPercentage = missionNamespace getVariable["svr_dickersPopulation", 20];
    private _dickerPopulation = round(_civCount * (_civPercentage / 100));

    if (_dickerCount > _dickerPopulation) then //TODO: change move to own function for calling when reducing dicker rate which is yet to be implemented.
    {
        //diag_log "dickers: dickers wiped";
        private _dickersArray = missionNamespace getVariable ["svr_dickersArray", []];
        {
            _x setVariable ["cl_insDicker", false, true];
            _x removeItem "ACE_Cellphone";
        } forEach _dickersArray;

        missionNamespace setVariable ["svr_dickersArray", [], true];
        missionNamespace setVariable ["svr_dickersCount", 0, true];
        call _fnc_dickerspersistence;
    }
    else
    {
        private _dickersArray = missionNamespace getVariable ["svr_dickersArray", []];
        private _cleanedArray = [];
        {   if (!(isNull _x) && alive _x) then
            {
                _x setVariable ["cl_insDicker", true, true];
                _cleanedArray pushBack _x;
            }
            else
            {
                _x setVariable ["cl_insDicker", false, true];
                //diag_log "dickers: unset";
            };
        } forEach _dickersArray;
        missionNamespace setVariable ["svr_dickersArray", _cleanedArray, true];
        missionNamespace setVariable ["svr_dickersCount", count _cleanedArray, true];
    };
};

private _fnc_dickersbehaviour = {
    while {true} do
    {
        private _dickersArray = missionNamespace getVariable ["svr_dickersArray", []];
        {
            private _xDicker = _x;
            private _lastDistance = 30;
            private _closestBluforPlayer = objNull;
            {
                if !((vehicle _x) isKindOf "AIR") then
                {
                    _currentDistance = _x distance _xDicker;
                    if (_currentDistance < _lastDistance) then
                    {
                        _closestBluforPlayer = _x;
                        _lastDistance = _currentDistance;
                    };
                };
            } forEach (west call server_fnc_core_getPlayers);

            if (isNull _closestBluforPlayer) then
            {
                _xDicker enableAI "Move";
            }
            else
            {
                private _lastDetect = _xDicker getVariable["cl_lastDetect", 0];
                if (_lastDetect + (30 + (random 10)) < time) then
                {
                    _xDicker setVariable ["cl_lastDetect", time, true];
                    _xDicker disableAI "move";
                    _xDicker lookAt _closestBluforPlayer;
                    [_xDicker, "AinvPercMstpSnonWnonDnon_G01"] remoteExec ["switchMove", 0, true];

                    private _civilianPlayers = (civilian call server_fnc_core_getPlayers);
                    ["DickerSpotted", ["An infidel has been spotted by our brothers!"]] remoteExec ["bis_fnc_showNotification", _civilianPlayers];

                    private _TimeHour = floor daytime;
                    private _TimeMinute = floor ((daytime - _TimeHour) * 60);
                    private _TimeSecond = floor (((((daytime) - (_TimeHour))*60) - _TimeMinute)*60);
                    private _Time24 = text format ["%1:%2:%3", _TimeHour, _TimeMinute, _TimeSecond];

                    private _markerArray = missionNamespace getVariable["svr_dickerSpottedArray", []];
                    private _markerArrayCount = missionNamespace getVariable["svr_dickerSpotC", 0];
                    if (_markerArrayCount == 0 || _markerArrayCount <= 4) then
                    {
                        _markerArray pushBack [_closestBluforPlayer, _Time24, (position _closestBluforPlayer)];
                        missionNamespace setVariable["svr_dickerSpottedArray", _markerArray, true];
                        missionNamespace setVariable["svr_dickerSpotC", count _markerArray, true];
                    }
                    else
                    {
                        _markerArray deleteAt 0;
                        _markerArray pushBack [_closestBluforPlayer, _Time24, (position _closestBluforPlayer)];
                        missionNamespace setVariable["svr_dickerSpottedArray", _markerArray, true];
                        missionNamespace setVariable["svr_dickerSpotC", count _markerArray, true];
                    };
                };
            };
        } forEach _dickersArray;
        sleep 1;
    };
};

[] spawn _fnc_dickersbehaviour;
while {true} do
{
    call _fnc_dickerspersistence;
    sleep 1;
    call _fnc_dickerscleanup;
    sleep 3;
};