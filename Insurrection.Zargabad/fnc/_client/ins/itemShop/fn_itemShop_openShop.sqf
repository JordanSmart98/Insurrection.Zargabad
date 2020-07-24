/*
	author: Bluekiller
	description: none
	returns: nothing
*/
if (missionNamespace getVariable["server_safehouseCount", 0] != 0) then
{
    private _closest = -1;
    private _closestIndex = -1;
    private _safehouseArray = missionNamespace getVariable["server_safehouseArray", []];
    {
        private _dist = _x distance2D player;
        if (_closest > 0) then
        {
            if (_dist < _closest) then
            {
                _closest = _dist;
            };
        }
        else
        {
            _closest = _dist;
        };
    } forEach _safehouseArray;

    if (_closest < 10) then
    {
        createDialog 'dialog_InsurgentItemShop';
    }
    else
    {
        _string = "<t font='PuristaMedium' align='center' size='1.5'>You must be at a safehouse</t>";
        [_string] call client_fnc_core_displayStructuredText;
    };

}
else
{
    _string = "<t font='PuristaMedium' align='center' size='1.5'>You have no safehouses left</t>";
    [_string] call client_fnc_core_displayStructuredText;
}