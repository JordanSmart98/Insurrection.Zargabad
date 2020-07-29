params ["_killedUnit", "_killer", "_triggerMan"];

switch (side _killedUnit) do
{
    case west:
    {
        if (_triggerMan isEqualTo west) exitWith {0};
        if (_triggerMan isEqualTo civilian) exitWith {1};
    };

    case civilian:
    {
        if (_triggerMan isEqualTo civilian) exitWith {1};
        if (_triggerMan isEqualTo west) exitWith {0};
    };
};

if (side _killedUnit isEqualTo civilian AND !isPlayer _killedUnit) then
{
	private _isDicker = _killedUnit getVariable["cl_insDicker", -1];
	if (side _triggerMan isEqualTo west) then
	{
		private _civKillCounter = missionNamespace getVariable["svr_civiliansKilled", 0];
		_civKillCounter = _civKillCounter + 1;
		[["CivilianKilled",[format["%1 killed a civilian. %2", name _triggerMan, _civKillCounter]]],"bis_fnc_showNotification",true] call BIS_fnc_MP;
		missionNamespace setVariable["svr_civiliansKilled", _civKillCounter, true];
	};
	
	if (side _triggerMan isEqualTo civilian) then
	{
		//systemChat "ins killed civi";
	};
	
	if (_isDicker == 1) then
	{
		 if (side _triggerMan isEqualTo west) then
		 {
		 	[["CivilianKilled", [format["%1 killed a dicker.", name _triggerMan]]], "bis_fnc_showNotification", true] call BIS_fnc_MP;
		 	//KILLED DICKER EVENT - BLUFOR
		 };
		 
		 if (side _triggerMan isEqualTo civilian) then
		 {
		 	[["CivilianKilled", [format["Insurgent %1 killed a dicker.", name _triggerMan]]], "bis_fnc_showNotification", true] call BIS_fnc_MP;
		 	//KILLED DICKER EVENT - INS
		 };
	};
	
	if (isNull _triggerMan AND side _killedUnit == civilian) then
	{
		//systemChat "ran over maybe lulw fix this!";
		//deleteVehicle _killedUnit;
		//WRITE A CIVI DEATH CLEANUP SCRIPT
	};
};