player action ["SWITCHWEAPON", player, player,-1];
waitUntil {currentWeapon player == "" or {primaryWeapon player == "" && handgunWeapon player == ""}};