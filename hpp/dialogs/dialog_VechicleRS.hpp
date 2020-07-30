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
			x = 0;
			y = 0;
			w = 1;
			h = 1;
			style = 0;
			text = "";
			colorBackground[] = {0,0.2,0.2,0.2};
			colorText[] = {0.9961,0.1373,0.5451,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			onLoad = "[] spawn client_fnc_core_vrsPopulate;";

		};
		class EditorPreviewFrame
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.22444445;
			w = safeZoneW * 0.17;
			h = safeZoneH * 0.19666667;
			style = 0+64;
			text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			shadow = 1;

		};

	};
	class Controls
	{
		class EditorPreview
		{
			type = 0;
			idc = 7900;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.22444445;
			w = safeZoneW * 0.17;
			h = safeZoneH * 0.19666667;
			style = 2+48;
			text = "I:\Bluekiller\Documents\Arma 3\Screenshots\EditorPreviews\@CUP Vehicles\CUP_B_T810_Reammo_CZ_WDL.png";
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
			w = safeZoneW * 0.170625;
			h = safeZoneH * 0.25333334;
			style = 16;
			colorBackground[] = {0.519,0.4238,0.4,0.5};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {1,0,0,1};
			colorText[] = {0.2157,0.9255,0.2235,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
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
			idc = 7902;
			x = safeZoneX + safeZoneW * 0.294375;
			y = safeZoneY + safeZoneH * 0.42222223;
			w = safeZoneW * 0.169375;
			h = safeZoneH * 0.02888889;
			style = 16;
			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
			colorBackground[] = {0.2,0.2,0.2,0.75};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {1,1,1,1};
			colorSelectBackground[] = {0.102,0.102,0.102,0.25};
			colorText[] = {1,1,1,1};
			font = "PuristaBold";
			maxHistoryDelay = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1.0};
			soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1.0};
			soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1.0};
			wholeHeight = 0.3;
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";

			};

		};
		class Title
		{
			type = 13;
			idc = 7903;
			x = safeZoneX + safeZoneW * 0.46875;
			y = safeZoneY + safeZoneH * 0.22444445;
			w = safeZoneW * 0.236875;
			h = safeZoneH * 0.11555556;
			style = 0;
			text = "<t size='5' font='PuristaBold' align='center'>VEHICLE SHOP</t>";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {1,1,1,0};
			class Attributes
			{
				font = "PuristaSemiBold";
				color = "#ffffff";
				align = center;
				shadowColor = "#1a1a1a";

			};

		};

	};

};
