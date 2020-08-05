class cfgFunctions {
    class client {
        class blufor {
            tag = "blufor";
            file = "fnc\_client\blufor";
            class blufor__Init;
            class blufor_interrogate;
            class blufor_markerManagerStatic;
            class blufor_scan;
            class blufor_createTask;
        };
        class core {
            tag = "core";
            file = "fnc\_client\core";
            class core_vrsConditionCheck {file = "fnc\_client\core\vrs\fn_core_vrsConditionCheck.sqf";};
            class core_vrsOnComboChange {file = "fnc\_client\core\vrs\fn_core_vrsOnComboChange.sqf";};
            class core_vrsOnSelChange {file = "fnc\_client\core\vrs\fn_core_vrsOnSelChange.sqf";};
            class core_vrsPopulate {file = "fnc\_client\core\vrs\fn_core_vrsPopulate.sqf";};
            class core_vrsRequest {file = "fnc\_client\core\vrs\fn_core_vrsRequest.sqf";};
            class core_briefing;
            class core_3Dmarkers;
            class core_displayStructuredText;
            class core_keyDownHandler;
            class core_safety;
            class core_say3DMP;
            class core_lrsLoadouts;
            class core_lrsPopulate;
            class core_lrsRequest;
            class core_restrictView;
            class core_unflipVehicle;
            class core_unflipVehicleAddAction;
        };
        class abilities {
            tag = "abilities";
            file = "fnc\_client\ins\abilities";
            class abilities_tunnelPlace;
            class abilities_satDecoyPlace;
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
            class items_AceHeal;
            class items_carbombAdd;
            class items_carbombDetonate;
            class items_carbombMount;
            class items_roadblockAdd;
            class items_roadblockPlace;
            class items_Safehouse;
        };
        class ins {
            tag = "ins";
            file = "fnc\_client\ins";
            class ins__Init;
            class ins_insOnClose;
            class ins_insPopulate;
            class ins_insRequest;
            class ins_insBorder;
            class ins_insurgentTeleport;
            class ins_markerManagerDynamic;
            class ins_markerManagerStatic;
        };
    };
	class server {
        class blufor {
            tag = "blufor";
            file = "fnc\_server\blufor";
            class blufor__Init;
        };
	    class core {
            file = "fnc\_server\core";
            class core_compCreate;
            class core_compSpawn;
            class core_drivingAi_main;
            class core_drivingAi_vehiclesAround;
            class core_drivingAi_vehicleSort;
            class core_getPlayers;
            class core_mE_aceCaptiveStatus;
            class core_mE_entityKilled;
            class core_safeStartLoop;
	    };
	    class ins {
	        tag = "ins";
	        file = "fnc\_server\ins";
            class ins__Init;
            class ins_dickersInit;
            class ins_safehouseCreate;
            class ins_safehouseEH;
            class ins_safehouseEquipment;
            class ins_safehouseLoad;
	    };
	};
};