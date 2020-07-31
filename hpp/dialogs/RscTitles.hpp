class RscTitles
{
    class Default
    {
        idd = -1;
        fadein = 0;
        fadeout = 0;
        duration = 0;
    }

    class Phone_HUD
    {
        idd = 1014;
        movingEnable = 0;
        enableSimulation = 1;
        enableDisplay = 1;
        fadein = 0;
        fadeout = 0;
        duration = 6;
        name = "Phone_HUD";
        onLoad = "with uiNameSpace do { Phone_HUD = _this select 0 }";
        class Controls
        {
            class PhoneImage
            {
                type = 0;
                idc = 0;
                x = safeZoneX + safeZoneW * 0.593125;
			    y = safeZoneY + safeZoneH * 0.45333334;
                w = safeZoneW * 0.4125;
                h = safeZoneH * 0.55;
                style = 48;
                text = "hpp\images\insPhone.paa";
                colorBackground[] = {1,1,1,1};
                colorText[] = {1,1,1,1};
                font = "PuristaMedium";
                sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
            };
            class ScreenStructuredText
            {
                idc = 1186;
                type = 13;
                style = 0;
                colorBackground[] = {0,0,0,0};
                x = safeZoneX + safeZoneW * 0.75625;
                y = safeZoneY + safeZoneH * 0.64666667;
                w = safeZoneW * 0.0875;
                h = safeZoneH * 0.06111112;
                size = 0.018;
                text = "";
            };
        };
    };

    class Insurrection_Message
    {
    	idd = 500;
        movingEnable = 0;
        enableSimulation = 1;
        enableDisplay = 1;
        fadein = 0;
        fadeout = 0;
        duration = 2;
        name = "Insurrection_Message";
        onLoad = "with uiNameSpace do { Insurrection_Message = _this select 0 }";
    	class Controls
    	{
            class Background
            {
                type = 0;
                idc = -1;
                x = safeZoneX + safeZoneW * 0.84375;
                y = safeZoneY + safeZoneH * 0.20444445;
                w = safeZoneW * 0.1375;
                h = safeZoneH * 0.10666667;
                style = 0;
                text = "";
                colorBackground[] = {0.102,0.102,0.102,0.5};
                colorText[] = {0.102,0.102,0.102,0.95};
                font = "PuristaMedium";
                sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
            };
            class StructuredText
            {
                type = 13;
                idc = 501;
                x = safeZoneX + safeZoneW * 0.84625;
                y = safeZoneY + safeZoneH * 0.20777778;
                w = safeZoneW * 0.1325;
                h = safeZoneH * 0.11111112;
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
};