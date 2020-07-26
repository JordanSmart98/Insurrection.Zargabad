class dialog_InsurgentVehicleRequest
{
	idd = 3000;
	name= "vrsINS";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn client_fnc_ins_vrsPopulate;";

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
			text = "Vehicle Shop";
			colorBackground[] = {0.12, 0.12, 0.12, 0.9};
			x = 0.34;
			y = 0.2;
			w = 0.34;
			h = (1 / 25);
		};

		class MoneyText : Life_RscText
		{
			idc = 3001;
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
			idc = 3002;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "call client_fnc_ins_vrsOnSelectionChange;";
			x = 0.36;
			y = 0.26;
			w = 0.30;
			h = 0.4;
		};

		class CloseButton : Life_RscButtonMenu
		{
			idc = -1;
			text = "Close";
			onButtonClick = "_displayVehicle = player getVariable 'vrsVehicle'; if (typeName _displayVehicle == 'OBJECT') then {deleteVehicle _displayVehicle};closeDialog 0;";
			x =  0.34;
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class PurchaseButton : Life_RscButtonMenu
		{
			idc = -1;
			text = "Purchase";
			onButtonClick = "call client_fnc_ins_vrsRequest; closeDialog 0;";
			x = 0.522;
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

        class Display : life_RscPicture
        {
            idc = 3003;
            text = "";
            x = 0.683;
            y = 0.2 + (11 / 250);
            w = 0.4;
            h = 0.6 - (2 / 250);
        };
	};
};