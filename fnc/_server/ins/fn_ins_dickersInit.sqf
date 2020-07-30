private _Popularity = 0;
{
	if (side _x == civilian && isPlayer _x) then {_Popularity = _Popularity + (_x getVariable["cl_insPop", 0]);};
}forEach allPlayers; 

private _civCount = ({alive _x and side _x == civilian} count allUnits);
private _dickerCount = round(_civCount * (((_Popularity * 10) / 100) + 0.1));

private _dickersArray = [];
while {count _dickersArray < _dickerCount} do
{
	private _potentialCivs = nearestObjects[getMarkerPos "marker_0", ["CAManBase"], 600];
	if (!isNil "_potentialCivs") then
	{
		private _randomCiv = random count _potentialCivs;
		private _potentialCiv = _potentialCivs select _randomCiv;
		if (!isNil "_potentialciv") then
		{		
			if (alive _potentialCiv and side _potentialCiv == civilian and !isPlayer _potentialCiv and !(_potentialCiv in _dickersArray)) then
			{
				_potentialCiv setVariable["cl_insDicker", 1, true];
				_potentialCiv addEventHandler ["Deleted", {[] remoteExec["server_fnc_ins_dickersOnEventDeleted", 2];}];
				_potentialCiv addEventHandler ["Killed", {[] remoteExec["server_fnc_ins_dickersOnEventDeleted", 2];}];
				_potentialCiv addItem "ACE_Cellphone";
				_dickersArray pushBack _potentialCiv;
			};
		};
	};
};

missionNamespace setVariable ["svr_dickersArray", _dickersArray, true];
missionNamespace setVariable ["svr_dickersCount", count _dickersArray, true];
call server_fnc_ins_dickersBehaviourLoop;