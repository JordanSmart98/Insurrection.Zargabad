fnc_dickerspersistence = {
    private _dickerCount = missionNamespace getVariable ["svr_dickersCount", 0];
    private _civCount = ({alive _x and side _x == civilian} count allUnits);
    private _civPercentage = missionNamespace getVariable["svr_dickersPopulation", 20];
    private _dickerPopulation = round(_civCount * (_civPercentage / 100));

    diag_log format["dickers: civCount:%1, dickerPop:%2", _civCount, _dickerPopulation];
    if (_dickerCount < _dickerPopulation) then
    {
        diag_log "dickers: persistenting";
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
                    if (_result == -1) then
                    {
                        _pC setVariable ["cl_insDicker", true];
                        _pC addItem "ACE_Cellphone";
                    }
                    else {diag_log "dickers: duplicate entry";};
                };
            };
        };
        //Our population of dickers is now what it should be
        missionNamespace setVariable ["svr_dickersArray", _dickersArray, true];
        missionNamespace setVariable ["svr_dickersCount", count _dickersArray, true];
    };
};

fnc_dickerscleanup = {
    private _dickerCount = missionNamespace getVariable ["svr_dickersCount", 0];
    private _civCount = ({alive _x and side _x == civilian} count allUnits);
    private _civPercentage = missionNamespace getVariable["svr_dickersPopulation", 20];
    private _dickerPopulation = round(_civCount * (_civPercentage / 100));

    if (_dickerCount > _dickerPopulation) then
    {
        systemChat "dickers: wiping";
        diag_log "dickers: wiping";
        private _dickersArray = missionNamespace getVariable ["svr_dickersArray", []];
        {
            _x setVariable ["cl_insDicker", false];
            _x removeItem "ACE_Cellphone";
        } forEach _dickersArray;

        missionNamespace setVariable ["svr_dickersArray", [], true];
        missionNamespace setVariable ["svr_dickersCount", 0, true];
        call fnc_dickerspersistence;
    }
    else
    {
        private _dickersArray = missionNamespace getVariable ["svr_dickersArray", []];
        private _cleanedArray = [];
        {   if (!(isNull _x) && alive _x) then
            {
                _x setVariable ["cl_insDicker", false];
                _x removeItem "ACE_Cellphone";
                _cleanedArray pushBack _x;
            }
        } forEach _dickersArray;
        missionNamespace setVariable ["svr_dickersArray", _cleanedArray, true];
        missionNamespace setVariable ["svr_dickersCount", count _cleanedArray, true];
    };
};

fnc_dickersbehaviour =
{
    private _dickersArray = missionNamespace getVariable ["svr_dickersArray", []];
    {
        _Dicker = _x;
        _CloseBluforPlayer = objNull;
        _LastDistance = 10;
        {
           if(!((vehicle _x) isKindOf "AIR")) then
           {
               _CurrentDistance = _x distance _Dicker;
               if((isPlayer _x && side _x != civilian) && (_CurrentDistance < _LastDistance)) then
               {
                   _CloseBluforPlayer = _x;
                   _LastDistance = _CurrentDistance;
               };
           };
        } forEach allPlayers;

        if (isNull _CloseBluforPlayer) then
        {
            _Dicker enableAI "Move";
        }
        else
        {
            private _LastDetection = _Dicker getVariable["cl_lastDetect", 0];
            if (_LastDetection + (30 + (random 10)) < time) then
            {
                _Dicker setVariable ["cl_lastDetect", time, true];
                _Dicker disableAI "move";
                _Dicker lookAt _CloseBluforPlayer;
                [_Dicker, "AinvPercMstpSnonWnonDnon_G01"] remoteExec ["switchMove", 0, true];

                private _TimeHour = floor daytime;
                private _TimeMinute = floor ((daytime - _TimeHour) * 60);
                private _TimeSecond = floor (((((daytime) - (_TimeHour))*60) - _TimeMinute)*60);
                private _Time24 = text format ["%1:%2:%3", _TimeHour, _TimeMinute, _TimeSecond];

                private _markerArray = missionNamespace getVariable["svr_dickerSpottedArray", []];
                private _markerArrayCount = missionNamespace getVariable["svr_dickerSpotC", 0];
                if (_markerArrayCount == 0 || _markerArrayCount <= 4) then
                {
                    _markerArray pushBack [_CloseBluforPlayer, _Time24, (position _CloseBluforPlayer)];
                    missionNamespace setVariable["svr_dickerSpottedArray", _markerArray, true];
                    missionNamespace setVariable["svr_dickerSpotC", count _markerArray, true];
                }
                else
                {
                    _markerArray deleteAt 0;
                    _markerArray pushBack [_CloseBluforPlayer, _Time24, (position _CloseBluforPlayer)];
                    missionNamespace setVariable["svr_dickerSpottedArray", _markerArray, true];
                    missionNamespace setVariable["svr_dickerSpotC", count _markerArray, true];
                };
            };
        };
    } forEach _dickersArray;
};

while {true} do
{
    call fnc_dickerscleanup;
    call fnc_dickerspersistence;
    call fnc_dickersbehaviour;
    sleep 5;
}