while {true} do
{
    private _dynamicMarkerList = [];
    if (missionNamespace getVariable["svr_dickersCount", 0] != 0) then
    {
        private _dickersArray = missionNamespace getVariable["svr_dickersArray", []];
        {
            private _marker = createMarkerLocal[format["_local_dickermarker_%1", _forEachIndex], position _x];
            _marker setMarkerColorLocal "ColorRed";
            _marker setMarkerTypeLocal "mil_dot_noshadow";
            _dynamicMarkerList pushBackUnique _marker;
        } forEach _dickersArray;
    };

    if (missionNamespace getVariable["svr_dickerSpotCount", 0] != 0) then
    {
        private _spots = missionNamespace getVariable["svr_dickerSpots", []];
        {
            _x params["_position", "_time", "_name"];
            private _marker = createMarkerLocal[format["_local_dickerspot_%1", _forEachIndex], _position];
            _marker setMarkerShapeLocal "ICON";
            _marker setMarkerTypeLocal "mil_dot_noshadow";
            _marker setMarkerColorLocal "colorBLUFOR";

            private _spotTime = [_time] call BIS_fnc_timeToString;
            switch(player getVariable["cl_insChoice", 0]) do
            {
                case 1: {_marker setMarkerTextLocal format ["Inf: %1", _spotTime];};
                case 2: {_marker setMarkerTextLocal format ["Inf: %1", _spotTime];};
                case 3: {_marker setMarkerTextLocal format ["Inf: %2: %1", _spotTime, _name];};
            };
            _dynamicMarkerList pushBackUnique _marker;
        } forEach _spots;
    };

    sleep 0.1;
    {deleteMarker _x;} forEach _dynamicMarkerList;
};