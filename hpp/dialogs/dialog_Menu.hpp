class dialog_Menu
{
	idd = 4100;
	enableSimulation = true;
	
	class ControlsBackground
	{
		class Background
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.41875;
			y = safeZoneY + safeZoneH * 0.32222223;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.20777778;
			style = 0;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,0.8};
			colorText[] = {0.9922,0.9059,0.9922,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			onLoad = "[] spawn client_fnc_core_menuPopulate;";
			
		};
		class BackgroundLower
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.39375;
			y = safeZoneY + safeZoneH * 0.26444445;
			w = safeZoneW * 0.2125;
			h = safeZoneH * 0.05777778;
			style = 0;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,0.8};
			colorText[] = {0.9922,0.9059,0.9922,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class TitlePop
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.400625;
			y = safeZoneY + safeZoneH * 0.27333334;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03666667;
			style = 0;
			text = "Popularity : ";
			colorBackground[] = {1,1,1,0.18};
			colorText[] = {1,1,1,1};
			font = RobotoCondensedLight;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class TitleWill
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.500625;
			y = safeZoneY + safeZoneH * 0.27333334;
			w = safeZoneW * 0.09875;
			h = safeZoneH * 0.03666667;
			style = 1;
			text = ": Willingness";
			colorBackground[] = {1,1,1,0.18};
			colorText[] = {1,1,1,1};
			font = RobotoCondensedLight;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
	};
	class Controls
	{
		class ItemShop
		{
			type = 1;
			idc = 4110;
			x = safeZoneX + safeZoneW * 0.44375;
			y = safeZoneY + safeZoneH * 0.37111112;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.04444445;
			style = 0+2;
			text = "Item Shop";
			borderSize = 0;
			colorBackground[] = {0.709,0.4326,0.1598,0.5059};
			colorBackgroundActive[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "EtelkaMonospaceProBold";
			offsetPressedX = 0;
			offsetPressedY = 0;
			offsetX = 0;
			offsetY = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "0 call client_fnc_core_menuClick";
			shadow = 0;
			
		};
		class VehicleShop
		{
			type = 1;
			idc = 4111;
			x = safeZoneX + safeZoneW * 0.44375;
			y = safeZoneY + safeZoneH * 0.42;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.04444445;
			style = 0+2;
			text = "Vehicle Shop";
			borderSize = 0;
			colorBackground[] = {0.709,0.4326,0.1598,0.5059};
			colorBackgroundActive[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "EtelkaMonospaceProBold";
			offsetPressedX = 0;
			offsetPressedY = 0;
			offsetX = 0;
			offsetY = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "1 call client_fnc_core_menuClick";
			shadow = 0;

		};
		class PerkShop
		{
			type = 1;
			idc = 4112;
			x = safeZoneX + safeZoneW * 0.44375;
			y = safeZoneY + safeZoneH * 0.46888889;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.04444445;
			style = 0+2;
			text = "Perk Shop";
			borderSize = 0;
			colorBackground[] = {0.709,0.4326,0.1598,0.5059};
			colorBackgroundActive[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "EtelkaMonospaceProBold";
			offsetPressedX = 0;
			offsetPressedY = 0;
			offsetX = 0;
			offsetY = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "2 call client_fnc_core_menuClick";
			shadow = 0;
			
		};
		class Pop
		{
			type = 0;
			idc = 4101;
			x = safeZoneX + safeZoneW * 0.453125;
			y = safeZoneY + safeZoneH * 0.27333334;
			w = safeZoneW * 0.04625;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "";
			colorBackground[] = {0,0,0,0.1059};
			colorText[] = {0.702,0.498,0.5294,1};
			font = "PuristaSemiBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Will
		{
			type = 0;
			idc = 4102;
			x = safeZoneX + safeZoneW * 0.500625;
			y = safeZoneY + safeZoneH * 0.27333334;
			w = safeZoneW * 0.04625;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "";
			colorBackground[] = {0,0,0,0.1059};
			colorText[] = {0.702,0.498,0.5294,1};
			font = "PuristaSemiBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Money
		{
			type = 0;
			idc = 4103;
			x = safeZoneX + safeZoneW * 0.435625;
			y = safeZoneY + safeZoneH * 0.31888889;
			w = safeZoneW * 0.131875;
			h = safeZoneH * 0.04333334;
			style = 2;
			text = "$2000";
			colorBackground[] = {0,0,0,0.1059};
			colorText[] = {0.4895,0.791,0.4895,1};
			font = "PuristaSemiBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
			shadow = 1;
			
		};
		
	};
	
};
