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
	    title = "Disable Stamina";
	    values[] = {0, 1};
	    texts[] = {$STR_DISABLED, $STR_ENABLED};
	    default = 1;
	};

    class marker3D//2
    {
        title = "3D markers";
        values[] = {0,1};
        texts[] = {$STR_DISABLED,$STR_ENABLED};
        default = 1;
        isGlobal = 1;
        function = "client_fnc_core_3Dmarkers";
    };
};