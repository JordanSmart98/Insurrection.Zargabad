class Params
{
	class Daytime
	{
		title = "Time";
		texts[] = {"Morning","Day","Evening","Night"};
		values[] = {6,12,18,0};
		default = 12;
		function = "BIS_fnc_paramDaytime"; // (Optional) [[Functions_Library_(Arma_3)|Function]] [[call]]ed when player joins, selected value is passed as an argument
		isGlobal = 1; // (Optional) 1 to execute script / function locally for every player who joins, 0 to do it only on server
	};
	class StaminaEnabled
	{
	    title = "Stamina?";
	    values[] = {0, 1};
	    texts[] = {"Disabled", "Enabled"};
	    default = 0;
	};
	class 3rdViewRestrictions
	{
		title = "3rd View Restrictions";
		values[] = {0,1};
		texts[] = {"Script Disabled","Script Enabled"};
		default = 0;
	};
};