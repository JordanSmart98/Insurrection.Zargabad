params["_dbgText", "_pop", "_will"];
private _dickersPercent = missionNamespace getVariable["svr_dickersPercent", 20];
private _dickersWill = missionNamespace getVariable["svr_dickersWill", 50];
_dickersPercent = _dickersPercent + _pop;
_dickersWill = _dickersWill + _will;
missionNamespace setVariable["svr_dickersPercent", _dickersPercent];
missionNamespace setVariable["svr_dickersWill", _dickersWill];
format["%1(%2, %3) pop: %4, will: %5", _dbgText, _pop, _will, _dickersPercent, _dickersWill] remoteExec["systemChat"];