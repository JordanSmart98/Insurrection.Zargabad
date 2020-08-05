private _staticMarkerList = [];
private _staticMarkedObjects = [];
while {true} do
{
    if (missionNamespace getVariable["svr_safehouseCount", 0] != 0) then
    {
        private _safehouseArray = missionNamespace getVariable["svr_safehouseArray", []];
        {
            if ((_staticMarkedObjects pushBackUnique _x) != -1) then
            {
                private _marker = createMarkerLocal[format["_cl_sh_marker_%1", _forEachIndex], position _x];
                _marker setMarkerColorLocal "ColorCIV";
                _marker setMarkerTypeLocal "loc_hospital";
                _marker setMarkerTextLocal format["%1", _forEachIndex];
                _staticMarkerList pushBack _marker;
                _x setVariable["cl_sh_index", _forEachIndex, true];
            };
        } forEach _safehouseArray;
    };

    sleep 1;
};
