class cfgNotifications
{
	class SafeStart
	{
		title = "SAFE START";
		description = "%1";
		iconPicture="\A3\UI_F\data\IGUI\Cfg\Actions\settimer_ca.paa";
		duration = 2;
		priority = 0;
	};

	class SafeStartMissionStarting
	{
		title = "SAFE START";
		description = "%1";
		//iconPicture="\A3\UI_F\data\IGUI\Cfg\Actions\settimer_ca.paa";
		iconPicture="\A3\ui_f\data\GUI\Cfg\Notifications\tridentEnemy_ca.paa";
		duration = 2;
		priority = 9;
	};

	class CivilianKilled
	{
		title = "CIVILIAN KILLED";
		description = "%1";
		iconPicture="\A3\UI_F\data\map\mapcontrol\taskIconFailed_ca.paa";
		duration = 3;
		priority = 1;
	};
	
	class EsclationPhaseUp
	{
		title = "Escalation Phase";
		description = "%1";
		//iconPicture="\A3\ui_f\data\map\mapcontrol\taskIconCreated_ca.paa";
		iconPicture="\A3\ui_f\data\GUI\RscCommon\RscDebugConsole\warningcdc_ca.paa";
		duration = 3;
		priority = 2;
	};
	
	class SafehouseDestroyed
	{
		title = "Safehouse Destryoed";
		description = "%1";
		iconPicture="\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
		duration = 3;
		priority = 2;
	};

    class DickerSpotted
    {
        title = "Infidels Spotted";
        description = "%1";
        //iconPicture="\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\binoculars_ca.paa";
        iconPicture="\A3\ui_f\data\GUI\Cfg\Hints\Zooming_ca.paa";
        duration = 2;
        priority = 5;
    };
};