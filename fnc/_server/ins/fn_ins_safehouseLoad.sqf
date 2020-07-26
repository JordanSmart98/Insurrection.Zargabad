params["_typeBuilding", "_position", "_rotation"];
private _safehouseLocations = [
    ["Land_House_C_10_EP1", [-0.702,-4.849,4.224], [[0,1,0],[0,0,1]], [-0.549,-6.167,3.243], [[-0,-1,0],[0,0,1]], [-0.541,-7.505,3.244], [[-0,-1,0],[0,0,1]]],
    ["Land_House_C_9_EP1", [-4.05,3.067,4.601], [[0,1,0],[0,0,1]], [-3.897,1.749,3.605], [[-0,-1,0],[0,0,1]], [-3.889,0.411,3.605], [[-0,-1,0],[0,0,1]]],
    ["Land_House_C_4_EP1", [3.931,-3.623,4.634], [[1,-0,-0],[0,-0,1]], [2.607,-3.741,3.661], [[-1,0,0],[0,-0,1]], [1.269,-3.739,3.694], [[-1,0,0],[0,-0,1]]],
    ["Land_House_C_3_EP1", [1.142,-1.812,6.834], [[1,0,-0.027],[0.027,-0.001,1]], [-0.182,-1.93,5.849], [[-1,-0,0.027],[0.027,-0.001,1]], [-1.52,-1.927,5.883], [[-1,-0,0.027],[0.027,-0.001,1]]]
];

private _arrayToDetach = [];
private _fnc_CreateVehicle = {
    params["_type", "_centerObj", "_attachToOffset", "_vectorDirAndUp"];
    private _obj = createVehicle[_type, [0,0,0], [], 0, "CAN_COLLIDE"];
    _obj allowDamage false;
    _obj attachTo [_centerObj, _attachToOffset];
    _obj setVectorDirAndUp [_vectorDirAndUp select 0, _vectorDirAndUp select 1];
    _arrayToDetach pushBack _obj;
    [_obj, _type] call server_fnc_ins_safehouseEquipment;
    _obj;
};

private _dataArrays = [];
{
    private _name = _x select 0;
    if (_name == _typeBuilding) then {_dataArrays = _x;};
} forEach _safehouseLocations;

private _centerObj = createVehicle["Land_Bollard_01_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_centerObj allowDamage false;

private _obj1 = ["CUP_USSpecialWeapons_EP1", _centerObj, _dataArrays select 1, _dataArrays select 2] call _fnc_CreateVehicle;
private _obj2 = ["Box_CSAT_Equip_F", _centerObj, _dataArrays select 3, _dataArrays select 4] call _fnc_CreateVehicle;
private _obj3 = ["Box_CSAT_Uniforms_F", _centerObj, _dataArrays select 5, _dataArrays select 6] call _fnc_CreateVehicle;

private _safehouseData = [_position, _obj1, _obj2, _obj3];
private _safehouseDataArray = missionNamespace getVariable["server_safehouseData", []];
_safehouseDataArray pushBackUnique _safehouseData;

missionNamespace setVariable["server_safehouseData", _safehouseDataArray, true];
missionNamespace setVariable["server_safehouseDataCount", count _safehouseDataArray, true];

_centerObj setPos _position;
_centerObj setDir _rotation;

[_arrayToDetach, _centerObj] spawn
{
    params["_arrayToDetach", "_centerObj"];
    sleep 2;
    {detach _x; sleep 0.5; _x allowDamage true;} forEach _arrayToDetach;
    deleteVehicle _centerObj;
}
