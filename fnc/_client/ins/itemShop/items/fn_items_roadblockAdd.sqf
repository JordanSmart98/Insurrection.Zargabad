private _roadblockCount = (player getVariable["cl_items_Roadblock", 0]) + 1;
player setVariable["cl_items_Roadblock", _roadblockCount];
if (_roadblockCount isEqualTo 1) then
{
    ['INS_PlaceRoadblock', 'Place Roadblock', 'hpp\images\insRoadblock.paa', 'call client_fnc_items_roadblockPlace;'] call client_fnc_itemShop_addAceAction;
}
else
{
    [player, 1, ["ACE_SelfActions", "INS_AceMenu", "INS_PlaceRoadblock"]] call ace_interact_menu_fnc_removeActionFromObject;
    ['INS_PlaceRoadblock', format["Place Roadblock x%1", _roadblockCount], 'hpp\images\insRoadblock.paa', 'call client_fnc_items_roadblockPlace;'] call client_fnc_itemShop_addAceAction;
};