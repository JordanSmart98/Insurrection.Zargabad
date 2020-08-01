private _carbombCount = (player getVariable["cl_items_Carbomb", 0]) + 1;
player setVariable["cl_items_Carbomb", _carbombCount];
if (_carbombCount isEqualTo 1) then
{
    ['INS_MountCarbomb', 'Mount Carbomb', 'hpp\images\insCarbombMount.paa', 'call client_fnc_items_carbombMount;'] call client_fnc_itemShop_addAceAction;
}
else
{
    [player, 1, ["ACE_SelfActions", "INS_AceMenu", "INS_MountCarbomb"]] call ace_interact_menu_fnc_removeActionFromObject;
    ['INS_MountCarbomb', format["Mount Carbomb x%1", _carbombCount], 'hpp\images\insCarbombMount.paa', 'call client_fnc_items_carbombMount;'] call client_fnc_itemShop_addAceAction;
};