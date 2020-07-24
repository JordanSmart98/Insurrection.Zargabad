/*
	author: Bluekiller
	description: client_fnc_core_say3DMP
	returns: nothing
*/
_speaker = _this select 0;
_sound 	= _this select 1;
[_speaker, _sound] remoteExec ["say3D"];