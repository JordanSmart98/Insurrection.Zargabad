private _dickersCount = missionNamespace getVariable "svr_dickersCount";
private _dickersArray = missionNamespace getVariable "svr_dickersArray";

private _bufferArray = [];
{
	if (alive _x && side _x == civilian and !isPlayer _x and !(_x in _bufferArray)) then
	{
		_bufferArray pushBack _x
	}
}forEach _dickersArray;

while {count _bufferArray < _dickersCount} do
{
    private _potentialCivs = nearestObjects[getMarkerPos "marker_0", ["CAManBase"], 600];
    if (!isNil "_potentialCivs") then
    {
        private _randomCiv = random count _potentialCivs;
        private _potentialCiv = _potentialCivs select _randomCiv;
        if (!isNil "_potentialCiv") then
        {
            if (alive _potentialCiv and side _potentialCiv == civilian and !isPlayer _potentialCiv and !(_potentialCiv in _dickersArray)) then
            {
                _potentialCiv setVariable["cl_insDicker", 1, true];
                _potentialCiv addEventHandler ["Deleted", {[] remoteExec["INS_fnc_dickers_handleDelete", 2];}];
                _potentialCiv addEventHandler ["Killed", {[] remoteExec["server_fnc_ins_dickersOnEventDeleted", 2];}];
                _potentialCiv addItem "ACE_Cellphone";
                _bufferArray pushBack _potentialCiv;
            };
        };
    };
};

_dickersArray = _bufferArray;
missionNamespace setVariable["svr_dickersCount", count _dickersArray, true];
missionNamespace setVariable["svr_dickersArray", _dickersArray, true];