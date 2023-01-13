/// @description Insert description here
// You can write your code in this editor
beatM = obj_beat_master

//This is information relating to the note type, such a sprite, and maybe behaviors
//The regular note constructor holds more general things, like the beat and type
function NoteType(_name, _sprite,_spawnBeatOff,_obj) constructor
{
	tName = _name
	sprite = _sprite
	spawnBeatOff = _spawnBeatOff
	obj = _obj
}
//Note Type
noteTypes[NType.mr0] = new NoteType("Mr 0",spr_editor_enemy_0,-8,noone)
noteTypes[NType.mr1] = new NoteType("Mr 1",spr_editor_enemy_1,-8,noone)
noteTypes[NType.draftpunk] = new NoteType("DraftPunk",spr_nt_draftpunk,-7,obj_draftpunk)
noteTypes[NType.dpmotorist] = new NoteType("dpMotorist",spr_nt_dpmotorist,-8,noone)
noteTypes[NType.dpbuffguy] = new NoteType("dpBuffGuy",spr_nt_dpbuffguy,-8,noone)


function UpdateGridPos()
{
	gridPosX = floor((mouse_x-gridStartX) / gridSize)
	gridPosY = (gridRows-1)-floor((mouse_y-gridStartY) / gridSize)
}

function PosFromBeatRow(_beat, _row)
{
	var _x = 0
	var _y = 0
	var _pos
	//_beat = _beat - (pageOn * measuresOnScreen)
	_x = (_beat-pageOn*(4*measuresOnScreen))/(1/(4*measuresOnScreen))
	_x = _x*gridSize+(gridSize)
	_y = (((gridRows-1)-_row)*gridSize+(gridSize))//+gridStartY//((_row - (gridRows-1)) * gridSize)
	_pos[0] = _x
	_pos[1] = _y
	return _pos
}

function UpdateGridBeat()
{
	gridBeat = (gridPosX*(1/(4*measuresOnScreen)))+(pageOn*(measuresOnScreen*4))
}

function GetNote(_row,_beat)
{
	var _array
	for(var i =0;i<ds_list_size(dsNotes);i++)
	{
		if(dsNotes[| i].row == _row && dsNotes[| i].beat == _beat)
		{
			_array[0] = dsNotes[| i]
			_array[1] = i
			return _array;
		}
	}
	return noone
}

function AddNote(_row,_beat,_type, _noteTypeId)
{
	var _note = {
		row : _row,
		beat : _beat,
		noteType : _type,
		noteTypeId : _noteTypeId,
		spawnBeatOff : noteTypes[_noteTypeId].spawnBeatOff,
		hasSpawned : false
	}
	
	ds_list_add(dsNotes,_note)
}

function GetTypeName(_type)
{
	switch(_type)
	{
		default:
			return "No Type?"
		break;
		
		/*case NType.normal:
			return "Normal"
		break;*/
		
		case NType.mr0:
			return "Mr. 0"
		break;
		
		case NType.mr1:
			return "Mr 1"
		break;
	}
}

function GetTypeSprite(_type)
{
	switch(_type)
	{
		default:
			return spr_editor_enemy_0
		break;
		
		/*case NType.normal:
			return spr_editor_enemy_0
		break;*/
		
		case NType.mr0:
			return spr_editor_enemy_0
		break;
		
		case NType.mr1:
			return spr_editor_enemy_1
		break;
	}
}

function SetSelectedNoteType(_type)
{
	selectedNote.noteTypeId = _type
	selectedNote.noteType = noteTypes[_type]
}

//Changes the note type of the SELECTED NOTE
function NoteTypeDropoutSelected(_type)
{
	with(obj_song_editor)
	{
		SetSelectedNoteType(_type[0])
		//Delete the dropout options
		if(doTypeOptions != noone)
		{
			for(var i = 0;i < array_length(doTypeOptions);i ++)
			{
				with(doTypeOptions[i])instance_destroy()
			}
			doTypeOptions = noone
		}
		state = ES.free
	}
}

//Changes the note type of your "brush"
function NoteTypeCurrentSelected(_type)
{
	with(obj_song_editor)
	{
		currentNoteType = _type[0]
		//Delete the dropout options
		if(doTypeOptions != noone)
		{
			for(var i = 0;i < array_length(doTypeOptions);i ++)
			{
				with(doTypeOptions[i])instance_destroy()
			}
			doTypeOptions = noone
		}
		state = ES.free
	}
}

//Changes the song being edited
function SongSelected(_songId)
{
	with(obj_beat_master)songId = _songId[0]
	with(obj_song_editor)
	{
		UpdateSongInfo()
		//Delete the dropout options
		if(doTypeOptions != noone)
		{
			for(var i = 0;i < array_length(doTypeOptions);i ++)
			{
				with(doTypeOptions[i])instance_destroy()
			}
			doTypeOptions = noone
		}
		state = ES.free
		LoadNotes()
	}
}

function UpdateMinMaxBeats()
{
	var _array
	var _minBeat = ((4*measuresOnScreen)*pageOn)
	var _maxBeat = ((4*measuresOnScreen)*pageOn)+4
	minBeat = _minBeat
	maxBeat = _maxBeat
}

//Updates dropoutOver, or which dropout option is the mouse hovering over
function UpdateDropoutOver()
{
	if(doTypeOptions != noone)
	{
		for(var i = 0;i < array_length(doTypeOptions);i ++)
		{
			if(doTypeOptions[i].isMouseOver)
			{
				dropoutOver = i
				return;
			}
		}
	}
}

//Load the song info
function UpdateSongInfo()
{
	songName = beatM.songs[beatM.songId].songName
	bpm = beatM.songs[beatM.songId].bpm
	firstBeatOffset = beatM.songs[beatM.songId].firstBeatOffset
}

 function LoadNotes()
{
	ds_list_clear(dsNotes)
	//dsNotes[0] = 0
	var _notes = beatM.songs[beatM.songId].notes
	for(var i = 0;i < array_length(_notes); i ++)
	{
		dsNotes[| i] = _notes[i]
	}
}

function LoadSongData()
{
	with(beatM)
	{
		LoadSong(songId)
	}
	
	LoadNotes()
}



beatM = obj_beat_master

state = ES.free

//SONG INFO
songDir = ""
//editingSong = "scarletFire"

songName = beatM.songs[beatM.songId].songName//"Scarlet Fire"
bpm = beatM.songs[beatM.songId].bpm//40
firstBeatOffset = beatM.songs[beatM.songId].firstBeatOffset//0


gridSize = 64
minNoteDiv = 16//shortest notes are 16th notes
measuresOnScreen = 1//2

pageOn = 0

gridStartX = 64
gridStartY = 64
gridRows = 7

gridPosX = 0
gridPosY = 0
gridBeat = 0

selectedNote = noone

//do is short for dropout
doTypeOptions = noone

//Song Position Bar
sbBeat = 0
sbTopY = gridStartY-16
sbBottomY = 540
sbWidth = 8//4
sbColor = c_yellow //c_teal

minBeat = 0
maxBeat = 0

//Current Note Type
currentNoteType = NType.mr0

dropoutOver = noone

//Menu Buttons
btnNoteType = instance_create_depth(320,0,depth-5,obj_button_notetype)
btnSave = instance_create_depth(320-(64),0,depth-5,obj_button_save)
btnBpm = instance_create_depth(8,632,depth-5,obj_button_bpm)
btnSong = instance_create_depth(320-(64*2),0,depth-5,obj_button_song)
//Song

//asynce_load ID

bpmAl = 0

//Notes and Stuff
dsNotes = ds_list_create()
notesToSave[0] = 0

LoadSongData()


//Methods
function UpdateNoteType()
{
	for(var i = 0;i < ds_list_size(dsNotes);i ++)
	{
		dsNotes[| i].spawnBeatOff = noteTypes[dsNotes[| i].noteTypeId].spawnBeatOff
		//dsNotes[| i].spawnBeatOff = noteTypes[dsNotes[| i].noteTypeId].spawnBeatOff
	}
}

function Save()
{
	//if(directory_exists(working_directory+"songs/"))
	//{
		var _eSong = beatM.songs[beatM.songId].dirName
		//show_debug_message("FoundSongDir")
		//songDir = working_directory+"songs/"+_eSong+"/"
		var _file = file_text_open_write(_eSong+SDFILETYPE)
		//file_text_write_string(_file, "Among us")
		//var _notes
		if(!ds_list_empty(dsNotes))
		{
			for(var i = 0;i < ds_list_size(dsNotes);i ++)
			{
				notesToSave[i] = dsNotes[| i]
			}
		}else notesToSave = noone
		var _songData = 
		{
			sdSongName : songName,
			sdBpm : bpm,
			sdFirstBeatOffset : firstBeatOffset,
			sdNotes : notesToSave
		}
		var _json = json_stringify(_songData)
		/*var _buffer = buffer_create(string_byte_length(_json)+1,buffer_fixed,1)
		buffer_write(_buffer, buffer_string, _json)
		buffer_save(_buffer, songDir+_eSong+SDFILETYPE)
		buffer_delete(_buffer)*/
		file_text_write_string(_file,_json)
		file_text_close(_file)
	//}
	

	LoadSongData()
}


function NoteTypeDropout()
{
	if(state != ES.typeEdit)
	{
		if(mouse_x >= 640 && mouse_x <= 640+64) && (mouse_y >= 580+(3*16) && mouse_y <= 64+(580+(3*16))) && (mouse_check_button_pressed(mb_left))
		{
			state = ES.typeEdit
			if(doTypeOptions == noone)
			{
				var _array
				var _spaceing = 16
				for(var i = 0;i < array_length(noteTypes);i ++)
				{
					_array[i] = instance_create_depth(580,(580+(3*16))-(_spaceing*i),depth-10,obj_dropout)
					_array[i].text = noteTypes[i].tName
					_array[i].myId = i
					_array[i].clickedFunction = NoteTypeDropoutSelected
					_array[i].cfArgs = [i]
				}
				doTypeOptions = _array
			}
		}
	}else
	{/*
		if(doTypeOptions != noone)
		{
			for(var i = 0;i < array_length(doTypeOptions);i ++)
			{
				with(doTypeOptions[i])instance_destroy()
			}
			doTypeOptions = noone
		}*/
	}
}

function NoteTypeCurrentDropout()
{
	if(btnNoteType.isClicked == true)
	{
		state = ES.doCurrentNoteType
		if(doTypeOptions == noone)
		{
			var _array
			var _spaceing = 16
			for(var i = 0;i < array_length(noteTypes);i ++)
			{
				_array[i] = instance_create_depth(btnNoteType.x,btnNoteType.sprite_height+(_spaceing*i),depth-10,obj_dropout)
				_array[i].text = noteTypes[i].tName
				_array[i].myId = i
				_array[i].clickedFunction = NoteTypeCurrentSelected
				_array[i].cfArgs = [i]
			}
			doTypeOptions = _array
		}
	}
}

function SelectSongDropout()
{
	if(btnSong.isClicked)
	{
		state = ES.doSelectSong
		if(doTypeOptions == noone)
		{
			var _array
			var _spaceing = 16
			for(var i = 0;i < array_length(beatM.songs);i ++)
			{
				_array[i] = instance_create_depth(btnSong.x,btnSong.sprite_height+(_spaceing*i),depth-10,obj_dropout)
				_array[i].text = beatM.songs[i].songName
				_array[i].myId = i
				_array[i].clickedFunction = SongSelected
				_array[i].cfArgs = [i]
			}
			doTypeOptions = _array
		}
	}
}

function SongPositionBar()
{
	if(mouse_check_button_pressed(mb_middle))
	{
		/*state = ES.songPlaying
		with(beatM)
		{
			StartSongPosition(songId,BeatToSeconds(other.gridBeat))
		}*/
		sbBeat = gridBeat
	}
	
	if(state == ES.songPlaying)sbBeat = beatM.songPositionInBeats
	//else sbBeat = 0 + (pageOn*measuresOnScreen)
	
	//PauseSong
}

function DrawSongPositionBar()
{
	var _pos = PosFromBeatRow(sbBeat, 0)
	draw_line_width_color(
		_pos[0],
		sbTopY,
		_pos[0],
		sbBottomY,
		sbWidth,
		sbColor,
		sbColor
	)
}

function GotoBeginning()
{
	pageOn = 0
	sbBeat = 0
}

function EditBpmStuff()
{
	if(btnBpm.isClicked && state == ES.free)
	{
		//state = ES.bpmEdit
		bpmAl = get_integer_async("Set BPM",bpm)
				
		/*var _id = ds_map_find_value(async_load,"id")
		if (_id == bpmAl)
		{
			if(ds_map_find_value(async_load,"status"))
			{
				bpm = real(ds_map_find_value(async_load,"value"))
				state = ES.free
			}
		}*/
	}
	
	if(state == ES.bpmEdit)
	{
		var _id = ds_map_find_value(async_load,"id")
		if (_id == bpmAl)
		{
			if(ds_map_find_value(async_load,"status"))
			{
				bpm = real(ds_map_find_value(async_load,"value"))
				state = ES.free
			}
		}
	}
}