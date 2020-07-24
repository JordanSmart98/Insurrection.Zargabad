switch (paramsArray select 2) do
{
    case 1:
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
    case 2:
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
    case 3:
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