while {true} do
{
    private _dynamicMarkerList = [];
    if (missionNamespace getVariable["server_dickersCount", 0] != 0) then
    {
        private _dickersArray = missionNamespace getVariable["server_dickersArray", []];
        {
            private _marker = createMarkerLocal[format["_local_dickermarker_%1", _forEachIndex], position _x];
            _marker setMarkerColorLocal "ColorRed";
            _marker setMarkerTypeLocal "mil_dot_noshadow";
            _dynamicMarkerList pushBackUnique _marker;
        } forEach _dickersArray;
    };

        if (missionNamespace getVariable["server_dickerSpottedCount", 0] != 0) then
        {
            private _dickerSpottedData = missionNamespace getVariable["server_dickerSpottedArray", []];
            {
                private _marker = createMarkerLocal[format["_local_dickerspottedmarker_%1", _forEachIndex], _x select 2];
                _marker setMarkerShapeLocal "ICON";
                _marker setMarkerTypeLocal "mil_dot_noshadow";
                _marker setMarkerColorLocal "colorBLUFOR";

                switch(player getVariable["local_insSelected", 0]) do
                {
                    case 1: {_marker setMarkerTextLocal format ["Spotted: %1", _x select 1];};
                    case 2: {_marker setMarkerTextLocal format ["Spotted: %1", _x select 1];};
                    case 3: {_marker setMarkerTextLocal format ["Spotted: %1 - %2", _x select 1, name (_x select 0)];};
                };
                _dynamicMarkerList pushBack _marker;
            } forEach _dickerSpottedData;
        };

    if (missionNamespace getVariable["server_insPlayerCount", 0] != 0) then
    {
        //Create insurgent markers
    };

    sleep 0.1;
    {deleteMarker _x;} forEach _dynamicMarkerList;
};