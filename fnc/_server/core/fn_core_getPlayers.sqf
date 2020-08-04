params["_side"];
_array = [];
{
    if ((side _x) isEqualTo _side) then {_array pushBack _x}
} forEach allPlayers;
_array;