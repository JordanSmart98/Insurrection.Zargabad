class dialog_InsurgentItemShop
{
	idd = 4000;
	class ControlsBackground
	{
		class MainBackgroundFrame
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.22444445;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 64;
			text = "";
			colorBackground[] = {1,1,1,0.75};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			onLoad = "[4000] spawn client_fnc_core_menuConditionMet";
		};
		class MainBackground
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.22444445;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			style = 2;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,0.8};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			shadow = 0;

		};
		class MainBackgroundImageFlag
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.17;
			w = safeZoneW * 0.188125;
			h = safeZoneH * 0.25555556;
			style = 48;
			text = "hpp\images\coreDialogFlag.paa";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);

		};
		class MainTitleBackground
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.481875;
			y = safeZoneY + safeZoneH * 0.22555556;
			w = safeZoneW * 0.22375;
			h = safeZoneH * 0.14333334;
			style = 0;
			text = "";
			colorBackground[] = {0.4,0.302,0.702,0.25};
			colorText[] = {0,0,0,0};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);

		};
		class MainBackgroundTitle
		{
			type = 13;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.48625;
			y = safeZoneY + safeZoneH * 0.27111112;
			w = safeZoneW * 0.2125;
			h = safeZoneH * 0.06111112;
			style = 0;
			text = "Al-Qaeda Network";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {1,1,1,0};
			class Attributes
			{
				font = "PuristaBold";
				color = "#ffffff";
				align = center;
				shadowColor = "#b3b3b3";
				size = 2.35;

			};

		};
		class MainBackgroundTitleFrame
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.481875;
			y = safeZoneY + safeZoneH * 0.22444445;
			w = safeZoneW * 0.224375;
			h = safeZoneH * 0.14555556;
			style = 80+64;
			text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);

		};
		class MainBackgroundLabelFunds
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.48375;
			y = safeZoneY + safeZoneH * 0.37111112;
			w = safeZoneW * 0.0775;
			h = safeZoneH * 0.05;
			style = 2+64;
			text = "Funds";
			colorBackground[] = {0.702,0.502,0.702,0.5635};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			shadow = 1;

		};
		class MainBackgroundLabelDickers
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.63625;
			y = safeZoneY + safeZoneH * 0.37111112;
			w = safeZoneW * 0.066875;
			h = safeZoneH * 0.05;
			style = 2+64;
			text = "Dickers";
			colorBackground[] = {0.702,0.502,0.702,0.5635};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			shadow = 1;

		};
		class MainBackgroundLabelSafehouses
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.565625;
			y = safeZoneY + safeZoneH * 0.37111112;
			w = safeZoneW * 0.066875;
			h = safeZoneH * 0.05;
			style = 2+64;
			text = "Safehouses";
			colorBackground[] = {0.702,0.502,0.702,0.5635};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			shadow = 1;

		};

	};
	class Controls
	{
		class Listbox_Items
		{
			type = 5;
			idc = 4001;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.37111112;
			w = safeZoneW * 0.1875;
			h = safeZoneH * 0.40111112;
			style = 16;
			colorBackground[] = {0.28,0.28,0.28,0.28};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			maxHistoryDelay = 1;
			rowHeight = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
			colorSelect2[] = {1,1,1,1};
			colorSelectBackground[] = {0.95,0.95,0.95,0.5};
			colorSelectBackground2[] = {1,1,1,0.5};
			onLBSelChanged = "call client_fnc_itemShop_onSelChange;";
			onLoad = "[] spawn client_fnc_itemShop_Populate;";
			shadow = 0;
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";

			};

		};
		class Button_Purchase
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.48625;
			y = safeZoneY + safeZoneH * 0.72666667;
			w = safeZoneW * 0.100625;
			h = safeZoneH * 0.03666667;
			style = 2;
			text = "Purchase";
			borderSize = 0;
			colorBackground[] = {0.6,0.8,0.6,1};
			colorBackgroundActive[] = {0.702,0.902,0.702,1};
			colorBackgroundDisabled[] = {0,0,0,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.502,0.702,0.502,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaBold";
			offsetPressedX = 0.005;
			offsetPressedY = 0.005;
			offsetX = 0.005;
			offsetY = 0.005;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			colorFocused2[] = {0.702,0.902,0.702,1};
			onButtonClick = "call client_fnc_itemShop_Request;";
			shadow = 0;

		};
		class Button_Close
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.596875;
			y = safeZoneY + safeZoneH * 0.72666667;
			w = safeZoneW * 0.100625;
			h = safeZoneH * 0.03666667;
			style = 2;
			text = "Close";
			borderSize = 0;
			colorBackground[] = {1,0.502,0.502,1};
			colorBackgroundActive[] = {1,0.4,0.4,1};
			colorBackgroundDisabled[] = {0,0,0,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaBold";
			offsetPressedX = 0.005;
			offsetPressedY = 0.005;
			offsetX = 0.005;
			offsetY = 0.010.005;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			colorFocused2[] = {1,0.6,0.6,1};
			onButtonClick = "findDisplay 4000 closeDisplay 0;";
			shadow = 0;

		};
		class Text_Fund
		{
			type = 13;
			idc = 4002;
			x = safeZoneX + safeZoneW * 0.4875;
			y = safeZoneY + safeZoneH * 0.39333334;
			w = safeZoneW * 0.07125;
			h = safeZoneH * 0.03222223;
			style = 0;
			text = "$";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {0,0,0,0};
			class Attributes
			{
				font = "EtelkaMonospacePro";
				color = "#ffffff";
				align = center;
				shadowColor = "#333333";
				size = 1.35;

			};

		};
		class Text_Safehouses
		{
			type = 13;
			idc = 4003;
			x = safeZoneX + safeZoneW * 0.569375;
			y = safeZoneY + safeZoneH * 0.39222223;
			w = safeZoneW * 0.059375;
			h = safeZoneH * 0.03222223;
			style = 0;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {0,0,0,0};
			class Attributes
			{
				font = "EtelkaMonospacePro";
				color = "#ffffff";
				align = center;
				shadowColor = "#333333";
				size = 1.35;

			};

		};
		class Text_Dickers
		{
			type = 13;
			idc = 4004;
			x = safeZoneX + safeZoneW * 0.639375;
			y = safeZoneY + safeZoneH * 0.39222223;
			w = safeZoneW * 0.059375;
			h = safeZoneH * 0.03222223;
			style = 0;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {0,0,0,0};
			class Attributes
			{
				font = "EtelkaMonospacePro";
				color = "#ffffff";
				align = center;
				shadowColor = "#333333";
				size = 1.35;

			};

		};
		class Text_Description
		{
			type = 13;
			idc = 4005;
			x = safeZoneX + safeZoneW * 0.48875;
			y = safeZoneY + safeZoneH * 0.50444445;
			w = safeZoneW * 0.20625;
			h = safeZoneH * 0.21111112;
			style = 0;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {1,1,1,0};
			class Attributes
			{

			};
		};
		class Text_Price
        {
            type = 13;
			idc = 4006;
            x = safeZoneX + safeZoneW * 0.485625;
            y = safeZoneY + safeZoneH * 0.42777778;
            w = safeZoneW * 0.215;
            h = safeZoneH * 0.05888889;
            style = 0;
            text = "";
            size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
            colorBackground[] = {0,0,0,0};
            class Attributes
            {
                font = "EtelkaMonospacePro";
                color = "#994d66";
                align = center;
                shadowColor = "#333333";
                size = 3;
            };
        };
	};

};
