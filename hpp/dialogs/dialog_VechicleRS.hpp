#include "CustomControlClasses.h"
class MyDialog
{
	idd = 7900;
	
	class ControlsBackground
	{
		class BackgroundFrame
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.22444445;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 2+64;
			text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			font = "EtelkaNarrowMediumPro";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Background
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.22444445;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 0;
			text = "";
			colorBackground[] = {0,0.2,0.2,0.35};
			colorText[] = {0.9961,0.1373,0.5451,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			onLoad = "[] spawn client_fnc_core_vrsPopulate;";
			
		};
		class EditorPreviewFrame
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.505625;
			y = safeZoneY + safeZoneH * 0.22444445;
			w = safeZoneW * 0.200625;
			h = safeZoneH * 0.22222223;
			style = 0+64;
			text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			shadow = 1;
			
		};
<<<<<<< Updated upstream
		
=======
		class TitleText
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.29625;
			y = safeZoneY + safeZoneH * 0.22888889;
			w = safeZoneW * 0.20625;
			h = safeZoneH * 0.10555556;
			style = 2;
			text = "Vehicle Shop";
			colorBackground[] = {1,1,1,0};
			colorText[] = {0.949,0.949,0.949,1};
			font = "PuristaBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2.75);
			fixedWidth = false;
			lineSpacing = 2;
			shadow = 0;

		};

>>>>>>> Stashed changes
	};
	class Controls
	{
		class EditorPreview
		{
			type = 0;
<<<<<<< Updated upstream
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.22444445;
			w = safeZoneW * 0.17;
			h = safeZoneH * 0.19666667;
			style = 2+48;
			text = "I:\Bluekiller\Documents\Arma 3\Screenshots\EditorPreviews\@CUP Vehicles\CUP_B_T810_Reammo_CZ_WDL.png";
=======
			idc = 7910;
			x = safeZoneX + safeZoneW * 0.50625;
			y = safeZoneY + safeZoneH * 0.22555556;
			w = safeZoneW * 0.199375;
			h = safeZoneH * 0.22;
			style = 48;
			text = "";
>>>>>>> Stashed changes
			colorBackground[] = {0.7373,0.2667,0.0157,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class VehicleList
		{
			type = 5;
			idc = 7901;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.52;
			w = safeZoneW * 0.240625;
			h = safeZoneH * 0.25111112;
			style = 16;
			colorBackground[] = {0.1279,0.1309,0.1393,0.2};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {0.2,0.302,0.702,0.6};
			colorText[] = {0.6,0.302,0,1};
			font = "PuristaBold";
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
			colorSelectBackground[] = {1,1,1,0.2};
			onLBSelChanged = "[] spawn client_fnc_core_vrsOnSelChange;";
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class VehicleType
		{
			type = 4;
<<<<<<< Updated upstream
			idc = -1;
			x = safeZoneX + safeZoneW * 0.294375;
			y = safeZoneY + safeZoneH * 0.42222223;
			w = safeZoneW * 0.169375;
=======
			idc = 7902;
			x = safeZoneX + safeZoneW * 0.295;
			y = safeZoneY + safeZoneH * 0.41888889;
			w = safeZoneW * 0.210625;
>>>>>>> Stashed changes
			h = safeZoneH * 0.02888889;
			style = 16;
			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
			colorBackground[] = {0.1526,0.1175,0.2582,0.75};
			colorDisabled[] = {0.2,0.2,0.2,1};
<<<<<<< Updated upstream
			colorSelect[] = {0,0,0,1};
			colorSelectBackground[] = {0.102,0.102,0.102,0.25};
=======
			colorSelect[] = {1,1,1,1};
			colorSelectBackground[] = {0.1529,0.1176,0.2905,0.85};
>>>>>>> Stashed changes
			colorText[] = {1,1,1,1};
			font = "PuristaBold";
			maxHistoryDelay = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1.0};
			soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1.0};
			soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1.0};
			wholeHeight = 0.3;
			onLBSelChanged = "[] spawn client_fnc_core_vrsOnComboChange;";
			shadow = 2;
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";

			};

		};
<<<<<<< Updated upstream
		class Title1
		{
			type = 13;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.466875;
			y = safeZoneY + safeZoneH * 0.22888889;
			w = safeZoneW * 0.236875;
			h = safeZoneH * 0.11555556;
=======
		class PlayerMoney
		{
			type = 13;
			idc = 7903;
			x = safeZoneX + safeZoneW * 0.29625;
			y = safeZoneY + safeZoneH * 0.34222223;
			w = safeZoneW * 0.206875;
			h = safeZoneH * 0.06888889;
			style = 0;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {1,1,1,0};
			class Attributes
			{

			};

		};
		class Purchase
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.535;
			y = safeZoneY + safeZoneH * 0.72333334;
			w = safeZoneW * 0.170625;
			h = safeZoneH * 0.05;
			style = 0+2;
			text = "Purchase";
			borderSize = 0;
			colorBackground[] = {0.302,0.502,0.502,1};
			colorBackgroundActive[] = {0.2,0.4,0.4,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0.102,0.102,0.102,0.7059};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0.2,0.2,0.2};
			colorText[] = {1,1,1,1};
			font = "PuristaSemiBold";
			offsetPressedX = 0;
			offsetPressedY = 0.001;
			offsetX = 0;
			offsetY = 0.001;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			blinkingPeriod = -1;
			shadow = 0;

		};
		class VehicleInfoName
		{
			type = 13;
			idc = 7904;
			x = safeZoneX + safeZoneW * 0.498125;
			y = safeZoneY + safeZoneH * 0.45222223;
			w = safeZoneW * 0.205;
			h = safeZoneH * 0.06333334;
			style = 0;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {1,1,1,0};
			class Attributes
			{

			};

		};
		class VehicleInfoSpeed
		{
			type = 13;
			idc = 7905;
			x = safeZoneX + safeZoneW * 0.536875;
			y = safeZoneY + safeZoneH * 0.52444445;
			w = safeZoneW * 0.16625;
			h = safeZoneH * 0.02777778;
			style = 0;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {1,1,1,0};
			class Attributes
			{

			};

		};
		class VehicleInfoPassengers
		{
			type = 13;
			idc = 7906;
			x = safeZoneX + safeZoneW * 0.536875;
			y = safeZoneY + safeZoneH * 0.56;
			w = safeZoneW * 0.16625;
			h = safeZoneH * 0.02777778;
>>>>>>> Stashed changes
			style = 0;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {1,1,1,0};
			class Attributes
			{

			};

		};
		class VehicleInfoArmor
		{
			type = 13;
			idc = 7907;
			x = safeZoneX + safeZoneW * 0.536875;
			y = safeZoneY + safeZoneH * 0.59444445;
			w = safeZoneW * 0.16625;
			h = safeZoneH * 0.02777778;
			style = 0;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {1,1,1,0};
			class Attributes
			{

			};
			
		};
		
	};
	
};
