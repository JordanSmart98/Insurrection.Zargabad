class cfgFunctions {
    class client {
        class blufor {
            tag = "blufor";
            file = "fnc\_client\blufor";
            class blufor__Init;
            class blufor_scan;
            class blufor_vrsOnSelectionChange;
            class blufor_vrsPopulate;
            class blufor_vrsRequest;
        };
        class core {
            tag = "core";
            file = "fnc\_client\core";
            class core_holsterWeapon;
            class core_safety;
            class core_say3DMP;
            class core_briefing;
            class core_keyDownHandler;
            class core_displayStructuredText;
        };
        class ins {
            tag = "ins";
            file = "fnc\_client\ins";
            class ins__Init;
            class ins_insRequest;
            class ins_insPopulate;
            class ins_insOnClose;
            class ins_insurgentTeleport;
            class ins_markerManagerDynamic;
            class ins_markerManagerStatic;
            class ins_vrsOnSelectionChange;
            class ins_vrsPopulate;
            class ins_vrsRequest;
        };
        class itemShop {
            tag = "itemShop";
            file = "fnc\_client\ins\itemShop";
            class itemShop_addAceAction;
            class itemShop_onSelChange;
            class itemShop_openShop;
            class itemShop_Populate;
            class itemShop_Request;
        };
        class items {
            tag = "items";
            file = "fnc\_client\ins\itemShop\items";
            class items_Carbomb;
            class items_CarbombDetonate;
            class items_Roadblock;
            class items_WeaponsCache;
            class items_Safehouse;
        };
    };
	class server {
        class blufor {
            tag = "blufor";
            file = "fnc\_server\blufor";
            class blufor__Init;
        };
	    class core {
            tag = "core";
            file = "fnc\_server\core";
            class core_missionEvent_entityKilled;
            class core_safeStartLoop;
            class core_spawnComp;
            class core_createComp;
            class core_drivingAi_main;
            class core_drivingAi_vehiclesAround;
            class core_drivingAi_vehicleSort;
	    };
	    class ins {
	        tag = "ins";
	        file = "fnc\_server\ins";
            class ins__Init;
            class ins_dickersInit;
            class ins_dickersOnEventDeleted;
            class ins_dickersBehaviourLoop;
            class ins_safehouseEquipment;
            class ins_safehouseCreate;
            class ins_safehouseLoad;
	    };
	};
};