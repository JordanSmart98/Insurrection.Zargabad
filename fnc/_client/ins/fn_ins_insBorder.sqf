fnc_borderCreatemarkers = {
    params["_markerCenter", "_boundIndex"];
    private _markerArray = [];
    private _markerArray3d = [];
    for "_i" from -5 to 5 do
    {
        private _inc = _i * 3;
        private _markerPos = switch (_boundIndex) do
        {
            case 0: {_markerCenter vectorAdd [0, _inc, 0]};
            case 1: {_markerCenter vectorAdd [0, _inc, 0]};
            case 2: {_markerCenter vectorAdd [_inc, 0, 0]};
            case 3: {_markerCenter vectorAdd [_inc, 0, 0]};
        };

        private _markerName = format["_wm_%1_%2", _i, _boundIndex];
        private _marker = createMarkerLocal [_markerName, _markerPos];
        _marker setMarkerAlphaLocal 0;
        _marker setMarkerTypeLocal "mil_warning";
        _marker setMarkerColorLocal "ColorBlue";
        _markername3d = [_marker] call BH_fnc_mkr3D;

        _markerArray pushBack _marker;
        _markerArray3d pushBack _markername3d;
    };
    [_markerArray, _markerArray3d];
};

fnc_borderGetBounds = {
    private _center = position civ_triggerPlayArea;
    private _area = triggerArea civ_triggerPlayArea;

    private _sizeX = _area select 0;
    private _sizeY = _area select 1;
    private _playerPos = position player;

    private _xU = _center vectorAdd [_sizeX, 0, 0];
    private _dxU = [_xU select 0, _playerPos select 1, 0];

    private _xL = _center vectorAdd [-_sizeX, 0, 0];
    private _dxL = [_xL select 0, _playerPos select 1, 0];

    private _yU = _center vectorAdd [0, _sizeY, 0];
    private _dyU = [_playerPos select 0, _yU select 1, 0];

    private _yL = _center vectorAdd [0, -_sizeY, 0];
    private _dyL = [_playerPos select 0, _yL select 1, 0];

    private _bounds = [];
    _bounds pushBack ([_dxU, player distance2D _dxU]);
    _bounds pushBack ([_dxL, player distance2D _dxL]);
    _bounds pushBack ([_dyU, player distance2D _dyU]);
    _bounds pushBack ([_dyL, player distance2D _dyL]);
    _bounds;
};

fnc_borderInRange = {
    params["_range"];
    private _bounds = call fnc_borderGetBounds;
    private _result = false;
    {
        _x params ["_borderPos", "_distance"];
        if (_distance < _range) then
        {
            _result = true;
        };
    } forEach _bounds;
    _result;
};

fnc_borderCreate = {
    private _bounds = call fnc_borderGetBounds;
    private _data = [];
    {
        _x params ["_borderPos", "_distance"];
        if (_distance < 30) then
        {
            private _markerData = [_borderPos, _forEachIndex] call fnc_borderCreatemarkers;
            if (!(count _data isEqualTo 0)) then
            {
                _data params ["_markerArray", "_markerArray3d"];
                _markerData params ["_mAppend", "_mAppend3d"];
                _markerArray append _mAppend;
                _markerArray3d append _mAppend3d;
                _data = [_markerArray, _markerArray3d];
            }
            else {_data = _markerData;};
        };
    } forEach _bounds;
    _data;
};

fnc_borderRemove3dMarker = {
    params["_objName"];
    _obj = uiNamespace getVariable _objName;

    if (isNull _obj) exitWith {};

    _type = (_obj getVariable "BH_UserMkr_Array");
    _array = uiNamespace getVariable _type;

    _index = _array find _obj;
    _array set [_index, objNull];

    uiNamespace setVariable [_type, _array];

    removeMissionEventHandler ["draw3D", _obj getVariable "BH_UserMkr_EH"];
    deleteVehicle _obj;
};

if (50 call fnc_borderInRange) then {
    ["<br/><t font='PuristaBold' align='center' size='2'>NEAR BORDER</t>", 4] call client_fnc_core_displayStructuredText;
    [] spawn {
        private _data = [];
        while {30 call fnc_borderInRange} do
        {
            private _oldPos = player getVariable["cl_borderPos", [0, 0 ,0]];
            private _notMoved = player inArea [_oldPos, 3, 3, 0, false];
            if (_notMoved) then
            {
                sleep 1;
            }
            else
            {
                player setVariable ["cl_borderPos", position player];

                _data params["_markerArray", "_markerArray3d"];
                if (!(isNil("_markerArray"))) then
                {
                    {deleteMarkerLocal _x;} forEach _markerArray;
                };

                if (!(isNil("_markerArray3d"))) then
                {
                    {_x call fnc_borderRemove3dMarker;} forEach _markerArray3d;
                };

                _data = call fnc_borderCreate;
                sleep 1;
            };
        };

        _data params["_markerArray", "_markerArray3d"];
        if (!(isNil("_markerArray"))) then
        {
            {deleteMarkerLocal _x;} forEach _markerArray;
        };

        if (!(isNil("_markerArray3d"))) then
        {
            {_x call fnc_borderRemove3dMarker;} forEach _markerArray3d;
        };
    };
};