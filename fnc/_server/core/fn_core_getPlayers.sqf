params["_side"];
switch(_side) do {
    case west: {
        missionNamespace getVariable ["svr_allP_blufor", []];
    };
    case civilian: {
        missionNamespace getVariable ["svr_allP_civ", []];
    };
};