class dialog_LoadoutRequest
{
	idd = 5000;
	name= "lrs";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn client_fnc_core_lrsPopulate;";

	class ControlsBackground
	{
		class MainBackground : Life_RscText
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.34;
			y = 0.2 + (11 / 250);
			w = 0.34;
			h = 0.6 - (2 / 250);
		};
	};

	class Controls
	{
		class Title : Life_RscTitle
		{
			idc = -1;
			style = 2;
			text = "Loadout Request";
			colorBackground[] = {0.12, 0.12, 0.12, 0.9};
			x = 0.34;
			y = 0.2;
			w = 0.34;
			h = (1 / 25);
		};
		
		class MoneyText : Life_RscText
		{
			idc = 5001;
			style = 2;
			text = "$";
			sizeEx = 0.08;
			x = 0.34;
			y = 0.70;
			w = 0.34;
			h = (1 / 20);
		};

		class ItemList : Life_RscListBox
		{
			idc = 5002;
			text = "";
			sizeEx = 0.035;
			//onLBSelChanged = "call client_fnc_blufor_lrsOnSelectionChange;";
			x = 0.36;
			y = 0.26;
			w = 0.30;
			h = 0.4;
		};

		class CloseButton : Life_RscButtonMenu
		{
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x =  0.34;
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class PurchaseButton : Life_RscButtonMenu
		{
			idc = -1;
			text = "Request";
			onButtonClick = "call client_fnc_core_lrsRequest; closeDialog 0;";
			x = 0.522;
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};