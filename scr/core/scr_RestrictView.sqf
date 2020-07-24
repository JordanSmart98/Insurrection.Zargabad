Params_CameraView=1;  ////uncomment this if you do not set up parameters on mission start
// ----------------------------------------------------------------------------
//                          MAIN ROUTINE
// ----------------------------------------------------------------------------

// no loop need, if third person view is not available anyway
if (difficultyEnabled "3rdPersonView") then
{
switch (Params_CameraView) do
{
	case 1://vehicles only
	{
		while {(true)} do
		{
			if (cameraView == "External") then
			{
				if ((vehicle player) == player) then
				{
					player switchCamera "Internal";
				};
			};
			sleep 0.1;
		};
	};
	case 2://infantry only
	{
		while {(true)} do
		{
			if (cameraView == "External") then
			{
				if ((vehicle player) != player) then
				{
					(vehicle player) switchCamera "Internal";
				};
			};
			sleep 0.1;
		};
	};
	case 3://disabled
	{
		while {(true)} do
		{
			if (cameraView == "External") then
			{
				if ((vehicle player) == cameraOn) then
				{
					(vehicle player) switchCamera "Internal";
				};
			};
			sleep 0.1;
		};
	};
};
};