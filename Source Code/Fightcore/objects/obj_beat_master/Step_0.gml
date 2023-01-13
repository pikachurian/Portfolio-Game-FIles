/// @description Insert description here
if(global.paused)
{
	StopSong()
	exit;
}

//determine how many seconds since the song started
songPosition = (get_timer()/MICROSECONDS) - dspSongTime - firstBeatOffset

//determine how many beats since the song started
songPositionInBeats = songPosition / secPerBeat  
songPositionInBeats += beatOffset
songPosition += beatOffset * secPerBeat

if(songStarted == SStarted.withCount)
{
	if(songPositionInBeats >= 0)
	{
		StartSong(songId)
	}
}

var _ncLogoA = songPositionInBeats+12 /  -12
ncLogoAlpha = lerp(ncLogoAlpha,0,0.1)

//OST stuff


if(ostTick <= 0)
{
	ostX = lerp(ostX,-1080,0.1)
	ostX2 = lerp(ostX2,-1080,0.1)
}else
{
	ostX = lerp(ostX,0,0.1)
	ostY = lerp(ostY,0,0.1)
	
	ostTick --
}

//Camera Thoomp

if(instance_exists(obj_player))if(obj_player.state != PS.dead)
{
	zoomLevel = lerp(zoomLevel,1,0.1)//1


	if(songs[songId].thoomps != noone)
	{
		for(var i = 0;i < array_length(songs[songId].thoomps); i ++)
		{
			if(variable_struct_exists(songs[songId].thoomps[i],"hasTriggered"))
			{
				if(songs[songId].thoomps[i].hasTriggered == false && songs[songId].thoomps[i].beat <= songPositionInBeats)
				{
					songs[songId].thoomps[i].hasTriggered = true
					zoomLevel = 0.9
					show_debug_message("THOOMP")
				}
			}
		}
	}
}else zoomLevel = 1

var _viewW = camera_get_view_width(view_camera[0])
var _viewH = camera_get_view_height(view_camera[0])

var _rate = 0.1


var _newW = lerp(_viewW,zoomLevel * defaultZoomWidth,_rate)
var _newH = lerp(_viewH,zoomLevel * defaultZoomHeight,_rate)

camera_set_view_size(view_camera[0],_newW,_newH)

camera_set_view_pos(view_camera[0],0,0)

var _vposX = camera_get_view_x(view_camera[0])
var _vposY = camera_get_view_y(view_camera[0])

var _newX = lerp(_vposX,_vposX+(_viewW - zoomLevel*defaultZoomWidth)/2,_rate)
var _newY = lerp(_vposY,_vposY+(_viewH - zoomLevel*defaultZoomHeight)/2,_rate)

camera_set_view_pos(view_camera[0],_newX,_newY)

//Finish Song
if(!audio_is_playing(songAudioId) && songPositionInBeats >= 2 && room = rm_test && instance_exists(obj_score) && obj_player.state != PS.dead)
{
	show_debug_message("SONG DONE")
	scoreInfo = {
		radNotes : obj_score.radNotes,
		sickNotes : obj_score.sickNotes,
		totalNotes : array_length(songs[songId].notes),
		lastRank : obj_score.rank,
		hp : obj_player.hp,
		hpMax : obj_player.hpMax,
		songScore : obj_score.songScore,
		missedNotes : obj_score.missedNotes,
		squareNotes : obj_score.squareNotes
	}
	
	/*scoreInfo = {
		radNotes : 5,
		sickNotes : 5,
		totalNotes : 12,
		lastRank : Rank.sick,
		hp : 70,
		hpMax : 100,
		songScore : 200
	}*/
	global.paused = false
	audio_stop_all()
	TransitionStart(rm_scoring,sq_fade_out,sq_fade_in)
}