class dialog_InsurgentSelection
{
	idd = 7000;
	onLoad = "[] spawn client_fnc_ins_insPopulate;";
	onUnload  = "call client_fnc_ins_insOnClose";
	enableSimulation = true;
	class ControlsBackground
	{
		class Background
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.24375;
			y = safeZoneY + safeZoneH * 0.18555556;
			w = safeZoneW * 0.5125;
			h = safeZoneH * 0.62333334;
			style = 0;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,0.7};
			colorText[] = {0.6,0.302,0.4,0.95};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class BackgroundFrame
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.243125;
			y = safeZoneY + safeZoneH * 0.18555556;
			w = safeZoneW * 0.513125;
			h = safeZoneH * 0.06666667;
			style = 64;
			text = "";
			colorBackground[] = {1,1,1,0};
			colorText[] = {0.302,0,0.102,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			shadow = 1;
			
		};
		class BackgroundTitle
		{
			type = 13;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.24375;
			y = safeZoneY + safeZoneH * 0.18333334;
			w = safeZoneW * 0.51125;
			h = safeZoneH * 0.06888889;
			style = 0;
			text = "<t size=3 shadow='2' font='Zeppelin32' align='center'>Available Insurgents</t>";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {1,1,1,0};
			class Attributes
			{
				
			};
			
		};
		class BackgroundFrameInsurgent1
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.243125;
			y = safeZoneY + safeZoneH * 0.25111112;
			w = safeZoneW * 0.17125;
			h = safeZoneH * 0.55888889;
			style = 0+64;
			text = "";
			colorBackground[] = {1,1,1,0};
			colorText[] = {0.302,0,0.102,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class BackgroundFrameInsurgent2
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.414375;
			y = safeZoneY + safeZoneH * 0.25111112;
			w = safeZoneW * 0.170625;
			h = safeZoneH * 0.55888889;
			style = 0+64;
			text = "";
			colorBackground[] = {1,1,1,0};
			colorText[] = {0.302,0,0.102,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class BackgroundFrameInsurgent3
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.585;
			y = safeZoneY + safeZoneH * 0.25111112;
			w = safeZoneW * 0.17125;
			h = safeZoneH * 0.55888889;
			style = 0+64;
			text = "";
			colorBackground[] = {1,1,1,0};
			colorText[] = {0.302,0,0.102,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Insurgent1Brief
		{
			type = 13;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.24625;
			y = safeZoneY + safeZoneH * 0.25666667;
			w = safeZoneW * 0.16625;
			h = safeZoneH * 0.48666667;
			style = 0;
			text = "<t size=2 shadow='2' font='Bitstream' align='center'>Osama Bin Laden</t><br/><br/><t font='PuristaLight' >Lead the people of Zargabadd through a holy Jihad against the infidels.</t><br/><br/><t size ='1' font='RobotoCondensed' align='left'>Placeable Tunnel</t><br/><br/><t size='1' font='Caveat' align='left'>Dickers: 40%<br/>Carbomb Range: 500m</t>";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {1,1,1,0};
			class Attributes
			{
				
			};

		};
		class Insurgent2Brief
		{
			type = 13;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.416875;
			y = safeZoneY + safeZoneH * 0.25555556;
			w = safeZoneW * 0.16625;
			h = safeZoneH * 0.48666667;
			style = 0;
			text = "<t size=2 shadow='2' font='Bitstream' align='center'>Rodall Juhziz</t><br/><br/><t font='PuristaLight' >It's quiet out there, general...you know what quiet means right? BOOM...HAHAHAHA!!</t><br/><br/><t size='1' font='Caveat' align='left'>Dickers: 20%<br/>Carbomb Range: 1000m</t>";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {1,1,1,0};
			class Attributes
			{
				
			};
			
		};
		class Insurgent3Brief
		{
			type = 13;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.5875;
			y = safeZoneY + safeZoneH * 0.25777778;
			w = safeZoneW * 0.16625;
			h = safeZoneH * 0.48666667;
			style = 0;
			text = "<t size=2 shadow='2' font='Bitstream' align='center'>Mustafa</t><br/><br/><t font='PuristaLight' >Juba sometimes spelled Joba, is the pseudonym of an alleged sniper involved in the Iraq War's insurgency, featured in several videos. The second of these videos shows Juba claiming to have shot 37 American soldiers.</t><br/><br/><t size='1' font='Caveat' align='left'>Dickers: 30%<br/>Carbomb Range: 200m<br/>Dickers will name who they spot.</t>";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {1,1,1,0};
			class Attributes
			{
				
			};
			
		};
		
	};
	class Controls
	{
		class Insurgent1
		{
			type = 1;
			idc = 7001;
			x = safeZoneX + safeZoneW * 0.26875;
			y = safeZoneY + safeZoneH * 0.75444445;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Select";
			borderSize = 0;
			colorBackground[] = {0.5,0.5,0.5,0.4};
			colorBackgroundActive[] = {0.1933,0.5725,0.5725,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,1};
			colorFocused[] = {0.102,0.302,0.302,0.8};
			colorShadow[] = {0,0.102,0.502,0};
			colorText[] = {1,1,1,1};
			font = "TahomaB";
			offsetPressedX = 0;
			offsetPressedY = 0;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			colorFocused2[] = {0.102,0.302,0.302,0.6};
			shadow = 1;
			onButtonClick = "[1] call client_fnc_ins_insRequest";
		};
		class Insurgent2
		{
			type = 1;
			idc = 7002;
			x = safeZoneX + safeZoneW * 0.44375;
			y = safeZoneY + safeZoneH * 0.75444445;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Select";
			borderSize = 0;
			colorBackground[] = {0.5,0.5,0.5,0.4};
			colorBackgroundActive[] = {0.1933,0.5725,0.5725,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,1};
			colorFocused[] = {0.102,0.302,0.302,0.8};
			colorShadow[] = {0,0.102,0.502,0};
			colorText[] = {1,1,1,1};
			font = "TahomaB";
			offsetPressedX = 0;
			offsetPressedY = 0;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			colorFocused2[] = {0.102,0.302,0.302,0.6};
			shadow = 1;
			onButtonClick = "[2] call client_fnc_ins_insRequest";
		};
		class Insurgent3
		{
			type = 1;
			idc = 7003;
			x = safeZoneX + safeZoneW * 0.61875;
			y = safeZoneY + safeZoneH * 0.75444445;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Select";
			borderSize = 0;
			colorBackground[] = {0.5,0.5,0.5,0.4};
			colorBackgroundActive[] = {0.1933,0.5725,0.5725,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,1};
			colorFocused[] = {0.102,0.302,0.302,0.8};
			colorShadow[] = {0,0.102,0.502,0};
			colorText[] = {1,1,1,1};
			font = "TahomaB";
			offsetPressedX = 0;
			offsetPressedY = 0;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			colorFocused2[] = {0.102,0.302,0.302,0.6};
			shadow = 1;
			onButtonClick = "[3] call client_fnc_ins_insRequest";
		};
		class InsurgentSelected1
		{
			type = 0;
			idc = 7004;
			x = safeZoneX + safeZoneW * 0.24375;
			y = safeZoneY + safeZoneH * 0.25222223;
			w = safeZoneW * 0.17;
			h = safeZoneH * 0.55666667;
			style = 0;
			text = "";
			colorBackground[] = {0.302,0.302,0.302,0};
			colorText[] = {0.302,0.302,0.302,0.5};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class InsurgentSelected2
		{
			type = 0;
			idc = 7005;
			x = safeZoneX + safeZoneW * 0.415;
			y = safeZoneY + safeZoneH * 0.25222223;
			w = safeZoneW * 0.17;
			h = safeZoneH * 0.55666667;
			style = 0;
			text = "";
			colorBackground[] = {0.302,0.302,0.302,0};
			colorText[] = {0.302,0.302,0.302,0.5};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class InsurgentSelected3
		{
			type = 0;
			idc = 7006;
			x = safeZoneX + safeZoneW * 0.585625;
			y = safeZoneY + safeZoneH * 0.25222223;
			w = safeZoneW * 0.17;
			h = safeZoneH * 0.55666667;
			style = 0;
			text = "";
			colorBackground[] = {0.302,0.302,0.302,0};
			colorText[] = {0.302,0.302,0.302,0.5};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
	};
	
};
