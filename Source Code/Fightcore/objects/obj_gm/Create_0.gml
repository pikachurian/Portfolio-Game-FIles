 /// @description Insert description here
// You can write your code in this editor
global.paused = false
if(room == Setup)room_goto_next()

beatM = obj_beat_master
webVersion = false

randomize()

isStory = false
storyOn = 0
sWaitTime = room_speed * 5//1.5
sWaitTick = sWaitTime

introFrames = 0

sLevels[0] = SONG.punk
sLevels[1] = SONG.ncPunk
sLevels[2] = SONG.retroRock
sLevels[3] = SONG.ncRetroRock
sLevels[4] = SONG.yonslik
sLevels[5] = SONG.ncYonslik


gameSettings = {
	sfxLevel : 1,
	musicLevel : 1,
}

function StartSongLevel(_songId, _room)
{
	beatM.songId = _songId
	var _isNightcore = false
	if(storyOn = 1 || storyOn = 3 || storyOn = 5)_isNightcore = true
	TransitionStart(_room, sq_fade_out, sq_fade_in)
	beatM.isNightcore = _isNightcore
	audio_stop_all()
	//room_goto(rm_test)
}