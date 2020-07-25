class Params
{
	class Daytime//0
	{
		title = "Time";
		texts[] = {"Morning","Day","Evening","Night"};
		values[] = {6,12,18,0};
		default = 12;
		function = "BIS_fnc_paramDaytime";
	};

	class StaminaEnabled//1
	{
	    title = "Stamina";
	    values[] = {0, 1};
	    texts[] = {"Disabled", "Enabled"};
	    default = 1;
	};

    class RestrictView//2
    {
        title = "Third-Person";
        values[] = {1, 2, 3, 4};
        texts[] = {"Vehicles only", "Infantry only", "Disabled", "Enabled"};
        default = 4;
    };
};