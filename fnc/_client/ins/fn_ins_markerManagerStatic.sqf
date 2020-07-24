private _staticMarkerList = [];
private _staticMarkedObjects = [];
while {true} do
{
    if (missionNamespace getVariable["server_safehouseCount", 0] != 0) then
    {
        private _safehouseArray = missionNamespace getVariable["server_safehouseArray", []];
        {
            if ((_staticMarkedObjects pushBackUnique _x) != -1) then
            {
                private _marker = createMarkerLocal[format["_local_safehousemarker_%1", _forEachIndex], position _x];
                _marker setMarkerColorLocal "ColorCIV";
                _marker setMarkerTypeLocal "loc_hospital";
                //_marker setMarkerTextLocal format["Safehouse: %1", _forEachIndex + 1];
                _staticMarkerList pushBack _marker;
            };
        } forEach _safehouseArray;
    };

    sleep 0.1;
};