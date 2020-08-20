//broadcasted unit variables
#define VAR_TRANSFER_STATE				"#rev"
#define VAR_TRANSFER_FORCING_RESPAWN	"#revF"
#define VAR_TRANSFER_BEING_REVIVED		"#revB"
#define VAR_BLOOD_LEVEL					"#revL"

params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

if (isNil("_unit") || isNil("_source")) exitWith {};
if (!(isPlayer _unit) || !(isPlayer _source)) exitWith {};

if (side _source isEqualTo civilian) then
{
    if (!(missionNamespace getVariable["cl_reviveWatched", false])) then
    {
        missionNamespace setVariable["cl_reviveWatched", true, true];
        missionNamespace setVariable["cl_reviveSource", _source];
        [] spawn
        {
            private _spawnTime = time;
            while {true} do
            {
                if ((incapacitatedState player) isEqualTo "UNCONSCIOUS") exitWith
                {
                    [] spawn
                    {
                        missionNamespace setVariable["cl_reviveStatus", "empty"];
                        while {true} do
                        {
                            if (!((incapacitatedState player) isEqualTo "UNCONSCIOUS")) exitWith {diag_log "REVIVE: players not unconcious - 2"};

                            private _isBeingRevived = player getVariable [VAR_TRANSFER_BEING_REVIVED, false];
                            if (_isBeingRevived) then {missionNamespace setVariable["cl_reviveStatus", "REVIVE"];};

                            private _isForcingRespawn = player getVariable [VAR_TRANSFER_FORCING_RESPAWN, false];
                            if (_isForcingRespawn) then {missionNamespace setVariable["cl_reviveStatus", "RESPAWN"];};

                            private _blood = player getVariable [VAR_BLOOD_LEVEL, -1];
                            if (_blood isEqualTo 0) then {missionNamespace setVariable["cl_reviveStatus", "BLEEDOUT"];};

                            sleep 0.1;
                        };

                        private _status = missionNamespace getVariable["cl_reviveStatus", "empty"];
                        if (_status isEqualTo "empty") then {
                            missionNamespace setVariable["cl_reviveStatus", "EXECUTED"];
                        };
                        missionNamespace setVariable["cl_reviveWatched", false, true];
                    }
                };

                if ((_spawnTime + 5) <= time) exitWith {
                    missionNamespace setVariable["cl_reviveWatched", false, true];
                };
                sleep 0.1;
            };
        };
    };
};

//systemChat format ["%1:%2:%3:%4:%5:%6:%7:%8", _unit, _selection, _damage, _source, _projectile, _hitIndex, _instigator, _hitPoint];
//diag_log format ["DAMAGE %1:%2:%3:%4:%5:%6:%7:%8", _unit, _selection, _damage, _source, _projectile, _hitIndex, _instigator, _hitPoint];


/*
    diag_log "spawning";
    [_source] spawn {
        params ["_source"];
        private _spawnTime = time;
        while {true} do
        {
            if ((_spawnTime + 180) <= time) exitWith {diag_log "HD: time exit"};
            if (!(alive player)) exitWith {diag_log format["player died after being killed by %1", _source]};

            if ((incapacitatedState player) isEqualTo "UNCONSCIOUS") then
            {
                diag_log format["player is UNCONSCIOUS but not dead after being shot by %1", _source]
            };
            //incapacitatedState player; "UNCONSCIOUS"
            sleep 0.33;
        };
    };
*/

//_unit bis_o2_8224

//body

//1.87146e-007

//C Alpha 1-1:1 (Bluekiller (2)) REMOTE

//CUP_B_762x51_Tracer_White

//11

// Alpha 1-1:1 (Bluekiller (2)) REMOTE

//incapacitated