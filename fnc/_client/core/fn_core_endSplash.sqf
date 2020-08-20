_EndSplashScreen = {
    for "_x" from 1 to 19 do {
        sleep 3;
        [] remoteExec ["endLoadingScreen", 0];
    };
};

[] spawn _EndSplashScreen;