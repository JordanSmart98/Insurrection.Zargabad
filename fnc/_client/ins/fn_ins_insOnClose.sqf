disableSerialization;
if (player getVariable["local_insSelected", 0] == 0) then
{
    createDialog "dialog_InsurgentSelection";
    waitUntil {!((findDisplay 7000) isEqualTo displayNull)};
    (findDisplay 7000) displaySetEventHandler ["KeyDown", "if ((_this select 1) == 1 || (_this select 1) == 57 || (_this select 1) == 28) then { true }"];
};