private["_Popularity", "_dickersArray", "_CivCount", "_randomCiv", "_potentialCivs", "_DickerCount"];

_Popularity = 0;
{
	if (side _x == CIVILIAN && isPlayer _x) then
	{
		private _insPopularity = _x getVariable["local_insPopularity", 0];
		_Popularity = _Popularity + _insPopularity;
	};
}forEach allPlayers; 

_CivCount = ({alive _x AND side _x == civilian} count allUnits);
_DickerCount = round(_CivCount * (((_Popularity * 10) / 100) + 0.1));

_dickersArray = [];
while {count _dickersArray < _DickerCount} do
{
	_potentialCivs = nearestObjects[getMarkerPos "marker_0", ["CAManBase"], 600];	
	if (!isNil("_potentialCivs")) then
	{
		_randomCiv = random count _potentialCivs;
		private _potentialCiv = _potentialCivs select _randomCiv;
		if (!isNil("_potentialciv")) then
		{		
			if (alive _potentialCiv AND side _potentialCiv == civilian AND !isPlayer _potentialCiv AND !(_potentialCiv in _dickersArray)) then
			{
				_potentialCiv setVariable["local_insDicker", 1, true];
				_potentialCiv addEventHandler ["Deleted", {[] remoteExec["server_fnc_ins_dickersOnEventDeleted", 2];}];
				_potentialCiv addItem "ACE_Cellphone";
				_dickersArray pushBack _potentialCiv; //ADD MORE SHIT HERE FOR REGISTERING THESE CIVS AS DICKERS
			};
		};
	};
};

missionNamespace setVariable ["server_dickersArray", _dickersArray, true];
missionNamespace setVariable ["server_dickersCount", count _dickersArray, true];
call server_fnc_ins_dickersBehaviourLoop;