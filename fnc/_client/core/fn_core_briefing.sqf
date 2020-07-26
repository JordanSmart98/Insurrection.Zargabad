INS_Diary = player createDiarySubject ["INS_Diary", "|Insurrection Info|"];
player createDiaryRecord ["INS_Diary", ["Rules", "fckup"]];
player createDiaryRecord ["INS_Diary", ["Rules", "5. "]];
player createDiaryRecord ["INS_Diary", ["Rules", "4. "]];
player createDiaryRecord ["INS_Diary", ["Rules", "3. "]];
player createDiaryRecord ["INS_Diary", ["Rules", "2. "]];
player createDiaryRecord ["INS_Diary", ["Rules", "1. "]];

player createDiaryRecord ["INS_Diary", ["How to play", "fckup"]];
player createDiaryRecord ["INS_Diary", ["How to play", "5. All Insurgents receive dickers that spot Blufor players."]];
player createDiaryRecord ["INS_Diary", ["How to play", "4. Martial Law can be declared by Blufor by negotiating with <marker name='mm_ColAziz'>Col. Aziz</marker>."]];
player createDiaryRecord ["INS_Diary", ["How to play", "3. Civilians are present in Zargabadd until Martial Law is declared."]];
player createDiaryRecord ["INS_Diary", ["How to play", "2. Insurgents are given guerrilla abilities that should be used to repel the invaders."]];
player createDiaryRecord ["INS_Diary", ["How to play", "1. The game ends when all insurgent players are killed."]];

sleep 5;
if (serverCommandAvailable "#kick" || true) then
{
	private _briefing ="
    <br/>
    <font size='18'>ADMIN SECTION</font><br/>
    This briefing section can only be seen by the current admin.
    <br/><br/>
    ";

    _briefing = _briefing + "
    <font size='18'>SAFE START CONTROL</font><br/>
    |- <execute expression=""missionNamespace setVariable['server_missionTimer', ((missionNamespace getVariable['MissionTimer', 0]) + 1), true]; Format ['Safe Start timer increased by %1 to %2', name vehicle player, MissionTimer * 30] remoteExec ['hintSilent', 0];"">
    Increase Safe Start timer by 30 seconds</execute><br/>

    |- <execute expression=""missionNamespace setVariable['server_missionTimer', ((missionNamespace getVariable['MissionTimer', 0]) - 1), true]; Format ['Safe Start timer decreased by %1 to %2', name vehicle player, MissionTimer * 30] remoteExec ['hintSilent', 0];"">
    Decrease Safe Start timer by 30 seconds</execute><br/>

    |- <execute expression=""missionNamespace setVariable['server_missionTimer', -1, true]; [false] remoteExec ['client_fnc_core_safety', 0]; Format ['Safe Start ended by %1', name vehicle player] remoteExec ['hintSilent', 0];"">
    End Safe Start timer</execute><br/>
    ";

    player createDiaryRecord ["INS_Diary", ["Admin Menu", _briefing]];
};