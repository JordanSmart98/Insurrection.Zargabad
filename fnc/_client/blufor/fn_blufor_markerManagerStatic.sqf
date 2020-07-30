private _staticMarkerList = [];
private _staticMarkedObjects = [];
while {true} do
{
    if (missionNamespace getVariable["svr_bluforIntelCount", 0] != 0) then
    {
        private _intelArray = missionNamespace getVariable["svr_bluforIntelArray", []];
        {
            if ((_staticMarkedObjects pushBackUnique _x) != -1) then
            {
                private _marker = createMarkerLocal[format["_local_intelmarker_%1", _forEachIndex], _x];
                _marker setMarkerColorLocal "colorBLUFOR";
                _marker setMarkerTypeLocal "hd_unknown";
                _staticMarkerList pushBack _marker;
            };
        } forEach _intelArray;
    };

    sleep 1;
};