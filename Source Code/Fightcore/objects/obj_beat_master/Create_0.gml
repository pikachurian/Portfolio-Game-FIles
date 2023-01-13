/// @description Insert description here
// You can write your code in this editor
function Song(_audio,_bpm,_firstBeatOffset,_songName,_notes,_dirName,_thoomps) constructor
{
	audio = _audio
	bpm = _bpm
	firstBeatOffset = _firstBeatOffset
	songName = _songName
	notes = _notes
	dirName = _dirName
	thoomps = _thoomps
}

songs[SONG.scarletFire] = new Song(sng_scarlet_fire,174,0,"Scarlet Fire",noone,"scarletFire",noone)
songs[SONG.toreador] = new Song(sng_toreador,108,0,"Toreador",noone,"toreador",noone)
songs[SONG.ruinedPiano] = new Song(sng_ruined_piano,140,0,"Ruined Piano",noone,"ruinedPiano",noone)
songs[SONG.punk] = new Song(sng_punk,130,0,"Punk",noone,"punk",noone)
songs[SONG.retroRock] = new Song(sng_retro_rock,160,0,"Retro Rock",noone,"retroRock",noone)
songs[SONG.yonslik] = new Song(sng_yonslik,140,0,"Yonslik of the Ruined Lands",noone,"yonslik",noone)


//--NIGHTCORE
songs[SONG.ncRuinedPiano] = new Song(sng_nc_ruined_piano,160,0,"Ruined Piano",noone,"NCruinedPiano",noone)
songs[SONG.ncPunk] = new Song(sng_nc_punk,160,0,"Punk Nightcore",noone,"NCpunk",noone)
songs[SONG.ncRetroRock] = new Song(sng_nc_retro_rock,200,0,"Retro Rock Nightcore",noone,"NCretroRock",noone)
songs[SONG.ncYonslik] = new Song(sng_nc_yonslik,280,0,"Yonslik of the Ruined Lands Nightcore",noone,"NCyonslik",noone)

//Clear song saves for opera gx version
if(obj_gm.webVersion)
{
	for(var i = 0;i < array_length(songs);i ++)
	{
		if(file_exists(songs[i].dirName+SDFILETYPE))
		{
			file_delete(songs[i].dirName+SDFILETYPE)
		}
	}
}

function CreateSongsDir()
{
	if(!directory_exists("songs/"))
	{
		directory_create("songs/")
		show_debug_message("dir songs/ Created")
	}show_debug_message("dir songs/ Exists")
}


//Loads the save of the current song
function LoadSong(_songId)
{
	var _song = songs[_songId]
	//if(file_exists("songs/"+_song.dirName+"/"+_song.dirName+SDFILETYPE))
	if(file_exists(_song.dirName+SDFILETYPE))
	{
		//show_debug_message("WAKIRIMASEN")
		show_debug_message(_song.dirName+SDFILETYPE+" Exists")
		//var _buffer = buffer_load(_song.dirName+SDFILETYPE)
		//var _string = buffer_read(_buffer, buffer_string)
		//buffer_delete(_buffer)
		var _file = file_text_open_read(_song.dirName+SDFILETYPE)
		var _string = file_text_read_string(_file)
		//var _song = songs[_songId]
		//var _sd = file_text_open_read(working_directory+"songs/"+_song.dirName+"/"+_song.dirName+SDFILETYPE)
		//if(_sd != -1)
		//{
			//var _string = file_text_read_string(_sd)
			var _data = json_parse(_string)
		
			songs[_songId].bpm = _data.sdBpm
			songs[_songId].firstBeatOffset = _data.sdFirstBeatOffset
			songs[_songId].songName = _data.sdSongName
			songs[_songId].notes = _data.sdNotes
			//songs[_songId].thoomps = _data.sdThoomps
			if(variable_struct_exists(_data,"sdThoomps"))
			{
				songs[_songId].thoomps = _data.sdThoomps
			}else songs[_songId].thoomps = noone
			/*else 
			{
			show_debug_message(songs[_songId].songName+" Failed to load thoomps")
				var _oldStruct = songs[_songId]
				var _struct = {
					audio : _oldStruct.audio,
					bpm : _oldStruct.bpm,
					firstBeatOffset : _oldStruct.firstBeatOffset,
					songName : _oldStruct.songName,
					notes : _oldStruct.notes,
					dirName : _oldStruct.dirName,
					thoomps : noone
				}
				
				songs[_songId] = _struct
			}*/
	
			show_debug_message(string(_string))
			//file_text_close(_sd)
			
		//--LOAD BACKGROUNDS--
		if(instance_exists(obj_bg))with(obj_bg)
		{
			if(_data.sdBgStatic != noone)
			{
				bgStatic.sprite = global.backgrounds[_data.sdBgStatic].sprite
				bgStatic.scriptCreate = global.backgrounds[_data.sdBgStatic].scriptCreate
				bgStatic.scriptStep = global.backgrounds[_data.sdBgStatic].scriptStep
				bgStatic.scriptDraw = global.backgrounds[_data.sdBgStatic].scriptDraw
			}//else bgStatic.sprite = noone
			
			if(_data.sdBgScrolling1 != noone)
			{
				bgScrolling1.sprite = global.backgrounds[_data.sdBgScrolling1].sprite
				bgScrolling1.scriptCreate = global.backgrounds[_data.sdBgScrolling1].scriptCreate
				bgScrolling1.scriptStep = global.backgrounds[_data.sdBgScrolling1].scriptStep
				bgScrolling1.scriptDraw = global.backgrounds[_data.sdBgScrolling1].scriptDraw
				bgScrolling1.ispd = sprite_get_speed(bgScrolling1.sprite)
			}//else bgScrolling1.sprite = noone
			
			if(_data.sdBgScrolling2 != noone)
			{
				bgScrolling2.sprite = global.backgrounds[_data.sdBgScrolling2].sprite
				bgScrolling2.scriptCreate = global.backgrounds[_data.sdBgScrolling2].scriptCreate
				bgScrolling2.scriptStep = global.backgrounds[_data.sdBgScrolling2].scriptStep
				bgScrolling2.scriptDraw = global.backgrounds[_data.sdBgScrolling2].scriptDraw
				bgScrolling2.ispd = sprite_get_speed(bgScrolling2.sprite)
				if(global.backgrounds[_data.sdBgScrolling2].scrollSpd != noone)bgScrolling2.scrollSpd = global.backgrounds[_data.sdBgScrolling2].scrollSpd
			}//else bgScrolling2.sprite = noone
		}
		file_text_close(_file)
		//}else show_debug_message("LOAD FAIL")
	}else
	{
		show_debug_message("No "+_song.dirName+SDFILETYPE+"?")
			/*var _eSong = songs[songId].dirName
			show_debug_message("FoundSongDir")
			songDir = "songs/"+_eSong+"/"
			if(!directory_exists(songDir))directory_create(songDir)
			//var _file = file_text_open_write(songDir+_eSong+SDFILETYPE)
			//file_text_write_string(_file, "Among us")
			//var _notes
			var _songData = 
			{
				sdSongName : songs[_songId].songName,
				sdBpm : songs[_songId].bpm,
				sdFirstBeatOffset : songs[_songId].firstBeatOffset,
				sdNotes : noone
			}
			var _json = json_stringify(_songData)
			var _buffer = buffer_create(string_byte_length(_json)+1,buffer_fixed,1)
			buffer_write(_buffer, buffer_string, _json)
			buffer_save(_buffer, songDir+_eSong+SDFILETYPE)
			buffer_delete(_buffer)
			//file_text_write_string(_file,_json)
			//file_text_close(_file)*/
	}
}

function LoadSongDatafiles(_songId)
{
	/*
	//show_debug_message("WAKIRIMASEN")
	var _song = songs[_songId]
	//var _sd = file_text_open_read(working_directory+"datafiles/"+"songs/"+_song.dirName+"/"+_song.dirName+SDFILETYPE)
	if(file_exists(working_directory+_song.dirName+SDFILETYPE))
	{
		var _buffer = buffer_load(working_directory+_song.dirName+SDFILETYPE)
		var _string = buffer_read(_buffer, buffer_string)
		buffer_delete(_buffer)
		var _data = json_parse(_string)
		
		songs[_songId].bpm = _data.sdBpm
		songs[_songId].firstBeatOffset = _data.sdFirstBeatOffset
		songs[_songId].songName = _data.sdSongName
		songs[_songId].notes = _data.sdNotes
	
		show_debug_message(string(_string))
		show_debug_message("LOAD YES")
	}else show_debug_message("LOAD FAIL")
	*/
}

function SaveSong(_songId)
{
		var _eSong = songs[_songId].dirName
		var _song = songs[_songId]
		//show_debug_message("FoundSongDir")
		songDir = "songs/"+_eSong+"/"
		//var _file = file_text_open_write(songDir+_eSong+SDFILETYPE)
		//file_text_write_string(_file, "Among us")
		//var _notes
		if(_song.notes != noone)
		{
			for(var i = 0;i < array_length(_song.notes);i ++)
			{
				notesToSave[i] = _song.notes[i]
			}
		}else notesToSave = noone
		var _songData = 
		{
			sdSongName : _song.songName,
			sdBpm : _song.bpm,
			sdFirstBeatOffset : _song.firstBeatOffset,
			sdNotes : notesToSave
		}
		var _json = json_stringify(_songData)
		/*var _buffer = buffer_create(string_byte_length(_json)+1,buffer_fixed,1)
		buffer_write(_buffer, buffer_string, _json)
		buffer_save(_buffer, songDir+_eSong+SDFILETYPE)
		buffer_delete(_buffer)*/
		var _file = file_text_open_write(_eSong+SDFILETYPE)
		file_text_write_string(_file,_json)
		file_text_close(_file)
	
}

#region
/*function LoadSongDatafiles(_songId)
{
	//show_debug_message("WAKIRIMASEN")
	var _song = songs[_songId]
	var _sd = file_text_open_read(working_directory+"datafiles/"+"songs/"+_song.dirName+"/"+_song.dirName+SDFILETYPE)
	if(_sd != -1)
	{
		var _string = file_text_read_string(_sd)
		var _data = json_parse(_string)
		
		songs[_songId].bpm = _data.sdBpm
		songs[_songId].firstBeatOffset = _data.sdFirstBeatOffset
		songs[_songId].songName = _data.sdSongName
		songs[_songId].notes = _data.sdNotes
	
		show_debug_message(string(_string))
		file_text_close(_sd)
	}else show_debug_message("LOAD FAIL")
}*/
#endregion

function LoadSongFromString(_songId, _json)
{
	//show_debug_message("WAKIRIMASEN")
	//var _song = songs[_songId]

		//var _string = file_text_read_string(_json)
		var _data = json_parse(_json)
		
		songs[_songId].bpm = _data.sdBpm
		songs[_songId].firstBeatOffset = _data.sdFirstBeatOffset
		songs[_songId].songName = _data.sdSongName
		songs[_songId].notes = _data.sdNotes
	
		show_debug_message(string(_json))
}

function SetSong(_songId)
{
	songId = _songId
	var _song = songs[songId]
	songAudio = _song.audio
	bpm = _song.bpm
	secPerBeat = room_speed/bpm
	//Record the when the music starts
	dspSongTime = get_timer()/MICROSECONDS
	
	firstBeatOffset = _song.firstBeatOffset
	songName = _song.songName
	
	
}

function StartSong(_songId)
{
	songStarted = SStarted.normal
	beatOffset = 0
	if(songAudioId != noone)audio_stop_sound(songAudioId)
	SetSong(_songId)
	songAudioId = audio_play_sound(songAudio,100,false)
	if(instance_exists(obj_score))obj_score.SetRankNotes(_songId)
	if(songAudioId != noone)audio_sound_pitch(songAudioId,1)
}

function StartSongWithCount(_songId,_beatOffset)
{
	songStarted = SStarted.withCount
	beatOffset = _beatOffset
	if(songAudioId != noone)audio_stop_sound(songAudioId)
	SetSong(_songId)
	//songAudioId = audio_play_sound(songAudio,100,false)
	if(instance_exists(obj_score))obj_score.SetRankNotes(_songId)
}

function SetSongWithCount(_songId)
{
	songId = _songId
	var _song = songs[songId]
	songAudio = _song.audio
	bpm = _song.bpm
	secPerBeat = room_speed/bpm
	//Record the when the music starts
	dspSongTime = get_timer()/MICROSECONDS
	
	firstBeatOffset = _song.firstBeatOffset
	songName = _song.songName
	
	
}

function StartSongPosition(_songId,_time)
{
	beatOffset = 0
	songStarted = SStarted.normal
	if(songAudioId != noone)audio_stop_sound(songAudioId)
	SetSong(_songId)
	songAudioId = audio_play_sound(songAudio,100,false)
	audio_sound_set_track_position(songAudioId,_time)
	dspSongTime -= _time
}

function StopSong()
{
	if(songAudio != noone)audio_stop_sound(songAudio)
	
	songPosition = 0
	songStarted = SStarted.false
}

function StopSongSlow(_amount)
{
	if(songAudio != noone)
	{
		if(!audio_sound_get_pitch(songAudio) <= 0)audio_sound_pitch(songAudio,audio_sound_get_pitch(songAudio)-_amount)
		else 
		{
			songPosition = 0
			songStarted = SStarted.false
			audio_sound_pitch(songAudio,1)
			audio_stop_sound(songAudio)
		}
	}
}


function BeatToSeconds(_beat)
{
	return _beat * secPerBeat
}

function DrawSongDebug()
{
	var _off = 16
	draw_set_color(c_white)
	draw_set_font(Font1)
	draw_text(8,8,"SongAudio "+string(songAudio))
	draw_text(8,8+_off*1,"SongPositionInSeconds "+string(songPosition))
	draw_text(8,8+_off*2,"SongPositionInBeats "+string(songPositionInBeats))
	if(floor(songPositionInBeats) % 4 = 0)
	{
		 draw_set_color(c_red)
		 draw_text(8,8+_off*3,"BEAT 1")
	}else
	{
		draw_set_color(c_white)
		draw_text(8,8+_off*3,"no beat :(")
	}
	draw_set_color(c_white)
	draw_text(8,8+_off*4,string(bpm))
}

CreateSongsDir()

//Load saves over songs
if(obj_gm.webVersion == false)
{
	for(var i = 0; i < array_length(songs);i ++)
	{
		//var _dir = songs[i].dirName
		//if(file_exists("songs/"+_dir+"/"+_dir+SDFILETYPE))
		//{
			LoadSong(i)
		//}else
		//{
		//	LoadSongDatafiles(i)
		//	SaveSong(i)
		//}
		
	}
}else
{
	/*for(var i = 0; i < array_length(songs);i ++)
	{
		LoadSongFromString(i,global.songJsons[i])
	}*/
	for(var i = 0; i < array_length(songs);i ++)LoadSong(i)
}

CreateSongsDir()

//Weird Loading from string
//LoadSongFromString(SONG.toreador,"{ \"sdNotes\": -4.0, \"sdBpm\": 74.0, \"sdFirstBeatOffset\": 0.0, \"sdSongName\": \"Toreador\" }")

//Beats per minute
bpm = 0
//Audio Object/resource 
songAudio = noone
//Seconds per beat
secPerBeat = 0
//Current song position in seconds
songPosition = 0
//Song Position in beats
songPositionInBeats = 0
//How many seconds have passed since the song started
dspSongTime = 0
//The offset to the first beat of the song in seconds
firstBeatOffset = 0
//The id of the songaudio playing
songAudioId = noone
//Mostly for looks
songName = noone
//The enum id of the current song
songId = SONG.scarletFire//noone
//Beat offset for count down
beatOffset = 0
//Notes in the song

//isNightcore
isNightcore = false
ncLogoAlpha = 1000

songStarted = SStarted.false
//StartSong(scarletFire)
songStopSlowA = 1

//Countdown size
cdSize = 3
cdOn = noone

//ost y
ostX = -128//0
ostX2 = 0//0
ostY = -128//0
//ostTargetY = //64
ostTime = room_speed * 3
ostTick = ostTime

//Thoomps
zoomLevel = 1//1//0.85

camera_set_view_size(view_camera[0],1280,720)
defaultZoomWidth = camera_get_view_width(view_camera[0])
defaultZoomHeight = camera_get_view_height(view_camera[0])

//Score struct
//scoreInfo = noone

	scoreInfo = {
		radNotes : 5,
		sickNotes : 5,
		totalNotes : 12,
		lastRank : Rank.sick,
		hp : 70,
		hpMax : 100,
		songScore : 200,
		missedNotes : 2,
		squareNotes : 1
	}