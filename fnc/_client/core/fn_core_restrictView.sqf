switch (paramsArray select 2) do
{
    case 1:
    {
        while {sleep 0.1; true} do
        {
            if (cameraView == "External") then
            {
                if ((vehicle player) == player) then
                {
                    player switchCamera "Internal";
                };
            };
        };
    };
    case 2:
    {
        while {sleep 0.1; true} do
        {
            if (cameraView == "External") then
            {
                if ((vehicle player) != player) then
                {
                    (vehicle player) switchCamera "Internal";
                };
            };
        };
    };
    case 3:
    {
        while {sleep 0.1; true} do
        {
            if (cameraView == "External") then
            {
                if ((vehicle player) == cameraOn) then
                {
                    (vehicle player) switchCamera "Internal";
                };
            };
        };
    };
};