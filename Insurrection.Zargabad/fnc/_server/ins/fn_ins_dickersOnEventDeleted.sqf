private["_bufferArray", "_dickersArray", "_dickersCount", "_potentialCivs", "_potentialCiv", "_randomCiv"];

_dickersCount = missionNamespace getVariable "server_dickersCount";
_dickersArray = missionNamespace getVariable "server_dickersArray";

_bufferArray = [];
{
	if (alive _x && side _x == civilian AND !isPlayer _x AND !(_x in _bufferArray)) then
	{
		_bufferArray pushBack _x
	}
}foreach _dickersArray;

if (count _bufferArray < _dickersCount) then
{
	while {count _bufferArray < _dickersCount} do
	{
	 	_potentialCivs = nearestObjects[getMarkerPos "marker_0", ["CAManBase"], 600];	
		if (!isNil("_potentialCivs")) then
		{
			_randomCiv = random count _potentialCivs;
			_potentialCiv = _potentialCivs select _randomCiv;
			
			if (!isNil("_potentialCiv")) then
			{		
				if (alive _potentialCiv AND side _potentialCiv == civilian AND !isPlayer _potentialCiv AND !(_potentialCiv in _dickersArray)) then
				{
					_potentialCiv setVariable["local_insDicker", 1, true];
					_potentialCiv addEventHandler ["Deleted", {[] remoteExec["INS_fnc_dickers_handleDelete", 2];}];
					_potentialCiv addItem "ACE_Cellphone";
					_bufferArray pushBack _potentialCiv; //ADD MORE SHIT HERE FOR REGISTERING THESE CIVS AS DICKERS
				};
			};
		};
	};

	_dickersArray = _bufferArray;
	missionNamespace SetVariable["server_dickersCount", count _dickersArray, true];
	missionNamespace SetVariable["server_dickersArray", _dickersArray, true];
};