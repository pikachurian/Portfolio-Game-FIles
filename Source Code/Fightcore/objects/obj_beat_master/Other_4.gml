/// @description Insert description here
// You can write your code in this editor
if(songAudioId != noone)audio_sound_pitch(songAudioId,1)
switch(room)
{
	case rm_test:
			
		//if(obj_gm.webVersion == false)LoadSong(songId)
		//else LoadSongFromString(songId,global.songJsons[songId])
		LoadSong(songId)
		//StartSong(songId)
		StartSongWithCount(songId,-16)//-16)//-6)
		//ost y
		ostX = -128//0
		ostX2 = 0//0
		ostY = -128//0
		//ostTargetY = //64
		ostTime = room_speed * 3
		ostTick = ostTime
		ncLogoAlpha = 1000
		break;
		
	case rm_edit:
		//
		break;
}