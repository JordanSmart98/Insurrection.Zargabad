/* 
 * This file contains config parameters and a function call to start the civilian script.
 * The parameters in this file may be edited by the mission developer.
 *
 * See file Engima\Civilians\Documentation.txt for documentation and a full reference of 
 * how to customize and use Engima's Civilians.
 */
 
private ["_parameters"];

// Set civilian parameters.
_parameters = [
	["UNIT_CLASSES",
	       ["CUP_C_TK_Man_02",
            "CUP_C_TK_Man_04",
            "CUP_C_TK_Man_07",
            "CUP_C_TK_Man_08",
            "CUP_C_TK_Man_01_Coat",
            "CUP_C_TK_Man_03_Coat",
            "CUP_C_TK_Man_05_Coat",
            "CUP_C_TK_Man_06_Coat",
            "CUP_C_TK_Man_07_Coat",
            "CUP_C_TK_Man_01_Jack",
            "CUP_C_TK_Man_02_Jack",
            "CUP_C_TK_Man_03_Jack",
            "CUP_C_TK_Man_04_Jack",
            "CUP_C_TK_Man_05_Jack",
            "CUP_C_TK_Man_06_Jack",
            "CUP_C_TK_Man_08_Jack",
            "CUP_C_TK_Man_01_Waist",
            "CUP_C_TK_Man_02_Waist",
            "CUP_C_TK_Man_03_Waist",
            "CUP_C_TK_Man_04_Waist",
            "CUP_C_TK_Man_05_Waist",
            "CUP_C_TK_Man_06_Waist",
            "CUP_C_TK_Man_07_Waist",
            "CUP_C_TK_Man_08_Waist"]],
	["UNITS_PER_BUILDING", 0.4],
	["MAX_GROUPS_COUNT", 90],
	["MIN_SPAWN_DISTANCE", 50],
	["MAX_SPAWN_DISTANCE", 500],
	["BLACKLIST_MARKERS", []],
	["HIDE_BLACKLIST_MARKERS", true],
	["ON_UNIT_SPAWNED_CALLBACK", {}],
	["ON_UNIT_REMOVE_CALLBACK", { true }],
	["DEBUG", false]
];

// Start the script
_parameters spawn ENGIMA_CIVILIANS_StartCivilians;
