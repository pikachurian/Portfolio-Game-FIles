/// @description Insert description here
// You can write your code in this editor
beatM = obj_beat_master

noteTypes = global.noteTypes

bgs = global.backgrounds

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

function AddNote(_row,_beat,_type, _noteTypeId, _endBeat)
{
	var _note = {
		row : _row,
		beat : _beat,
		noteType : _type,
		noteTypeId : _noteTypeId,
		spawnBeatOff : noteTypes[_noteTypeId].spawnBeatOff,
		hasSpawned : false,
		inst : noone,
		endBeat : _endBeat
	}
	
	ds_list_add(dsNotes,_note)
}

function AddThoomp(_beat)
{
	var _thoomp = {
		row : 3,
		beat : _beat,
		spr : spr_thoomp,
		hasTriggered : false
	}
	
	ds_list_add(dsThoomps,_thoomp)
}

function GetThoomp(_beat)
{
	var _array
	for(var i =0;i<ds_list_size(dsThoomps);i++)
	{
		if(dsThoomps[| i].beat == _beat)
		{
			_array[0] = dsThoomps[| i]
			_array[1] = i
			return _array;
		}
	}
	return noone
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
	
	//load backgrounds
	var _bgDir = beatM.songs[beatM.songId].dirName
	if(file_exists(_bgDir+SDFILETYPE))
	{
		var _bgFile = file_text_open_read(_bgDir+SDFILETYPE)
		var _bgJson = file_text_read_string(_bgFile)
		var _bgData = json_parse(_bgJson)
		bgStatic = _bgData.sdBgStatic//Farthest back, dosen't scroll
		bgScrolling1 = _bgData.sdBgScrolling1//Main scrolling layer
		bgScrolling2 = _bgData.sdBgScrolling2//noone//Second farthest back, scrolls a little
		bgForeground = _bgData.sdBgForeground//Forground layer, scrolls?
		file_text_close(_bgFile)
	}else
	{
		bgStatic = noone//Farthest back, dosen't scroll
		bgScrolling1 = noone//Main scrolling layer
		bgScrolling2 = noone//Second farthest back, scrolls a little
		bgForeground = noone//Forground layer, scrolls?
	}
}

function LoadNotes()
{
	_song = beatM.songs[beatM.songId]
	if(file_exists(_song.dirName+SDFILETYPE))
	{
		ds_list_clear(dsNotes)
		ds_list_clear(dsThoomps)
		//dsNotes[0] = 0
		var _file = file_text_open_read(_song.dirName+SDFILETYPE)
		var _string = file_text_read_string(_file)
		var _data = json_parse(_string)
		var _notes = _data.sdNotes//beatM.songs[beatM.songId].notes
		for(var i = 0;i < array_length(_notes); i ++)
		{
			dsNotes[| i] = _notes[i]
		}
	
		//Load Thoomps
		//if(variable_struct_exists(beatM.songs[beatM.songId],"thoomps"))
		//{
			var _thoomps = _data.sdThoomps//beatM.songs[beatM.songId].thoomps
			for(var i = 0;i < array_length(_thoomps); i ++)//if(_thoomps != noone)
			{
				dsThoomps[| i] = _thoomps[i]
				dsThoomps[| i].hasTriggered = false
			}
		//}
		file_text_close(_file)
	}return false
}

function LoadSongData()
{
	with(beatM)
	{
		LoadSong(songId)
	}
	
	LoadNotes()
}

function ClearNotes()
{
	ds_list_clear(dsNotes)
}

function ClearThoomps()
{
	/*while(!ds_list_empty(dsThoomps))
	{
		for(var i = 0; i < ds_list_size(dsThoomps); i ++)
		{
			ds_list_delete(dsThoomps,i)
		}
	}*/
	ds_list_clear(dsThoomps)
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
btnBpm = instance_create_depth(8,632+28,depth-5,obj_button_bpm)//instance_create_depth(8,632,depth-5,obj_button_bpm)
btnSong = instance_create_depth(320-(64*2),0,depth-5,obj_button_song)
btnBgStatic = instance_create_depth(320+(64*2),0,depth-5,obj_button_bg_static)
btnBgScrolling2 = instance_create_depth(320+(64*3),0,depth-5,obj_button_bg_scrolling_2)
btnBgScrolling1 = instance_create_depth(320+(64*4),0,depth-5,obj_button_bg_scrolling)
btnBgForeground = instance_create_depth(320+(64*5),0,depth-5,obj_button_bg_foreground)
btnEndBeat = instance_create_depth(720,580+(6*16),depth-5,obj_button_end_beat)
btnName = instance_create_depth(8,632,depth-5,obj_button_name)
//Song

//asynce_load ID
bpmAl = 0
endBeatAl = 0
songNameAl = 0

var _bgDir = beatM.songs[beatM.songId].dirName
if(file_exists(_bgDir+SDFILETYPE))
{
	var _bgFile = file_text_open_read(_bgDir+SDFILETYPE)
	var _bgJson = file_text_read_string(_bgFile)
	var _bgData = json_parse(_bgJson)
	bgStatic = _bgData.sdBgStatic//Farthest back, dosen't scroll
	bgScrolling1 = _bgData.sdBgScrolling1//Main scrolling layer
	bgScrolling2 = _bgData.sdBgScrolling2//noone//Second farthest back, scrolls a little
	bgForeground = _bgData.sdBgForeground//Forground layer, scrolls?
	file_text_close(_bgFile)
}else
{
	bgStatic = noone//Farthest back, dosen't scroll
	bgScrolling1 = noone//Main scrolling layer
	bgScrolling2 = noone//Second farthest back, scrolls a little
	bgForeground = noone//Forground layer, scrolls?
}

//Thoomp Effect
dsThoomps = ds_list_create()
thoompsToSave[0] = 0
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

function UpdateEndBeat()
{
	for(var i = 0;i < ds_list_size(dsNotes);i ++)
	{
		if(!variable_struct_exists(dsNotes[| i],"endBeat"))
		{
			variable_struct_set(dsNotes[| i],"endBeat",dsNotes[| i].beat)
		}
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
		var _notesToSave = []
		if(!ds_list_empty(dsNotes))
		{
			for(var i = 0;i < ds_list_size(dsNotes);i ++)
			{
				_notesToSave[i] = dsNotes[| i]
			}
		}else _notesToSave = noone
		
		if(!ds_list_empty(dsThoomps))
		{
			//show_debug_message("dsThoomps Not Empty")
			for(var i = 0;i < ds_list_size(dsThoomps);i ++)
			{
				thoompsToSave[i] = dsThoomps[| i]
			}
		}else thoompsToSave = noone
		
		//show_debug_message("ThoompsToSave "+string(Tho))
		
		var _songData = 
		{
			sdSongName : songName,
			sdBpm : bpm,
			sdFirstBeatOffset : firstBeatOffset,
			sdNotes : _notesToSave,
			sdBgStatic : bgStatic,
			sdBgScrolling1 : bgScrolling1,
			sdBgScrolling2 : bgScrolling2,
			sdBgForeground : bgForeground,
			sdThoomps : thoompsToSave
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

#region BGStatic Dropout
function BgStaticDropout()
{
	if(btnBgStatic.isClicked == true)
	{
		state = ES.doBgStatic
		if(doTypeOptions == noone)
		{
			var _array
			var _spaceing = 16
			for(var i = 0;i < array_length(bgs);i ++)
			{
				if(i != 0)
				{
					_array[i] = instance_create_depth(btnBgStatic.x,btnBgStatic.sprite_height+(_spaceing*i),depth-10,obj_dropout)
					_array[i].text = bgs[i].tName
					_array[i].myId = i
					_array[i].clickedFunction = BgStaticDropoutSelected
					_array[i].cfArgs = [i]
				}else
				{
					_array[i] = instance_create_depth(btnBgStatic.x,btnBgStatic.sprite_height+(_spaceing*i),depth-10,obj_dropout)
					_array[i].text = "noone"
					_array[i].myId = i
					_array[i].clickedFunction = BgStaticDropoutSelected
					_array[i].cfArgs = [noone]
				}
			}
			doTypeOptions = _array
		}
	}
}

//Changes Static Background
function BgStaticDropoutSelected(_type)
{
	with(obj_song_editor)
	{
		bgStatic = _type[0]
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
#endregion

#region Bg Scrolling1 Dropout
function BgScrolling1Dropout()
{
	if(btnBgScrolling1.isClicked == true)
	{
		state = ES.doBgScrolling1
		if(doTypeOptions == noone)
		{
			var _array
			var _spaceing = 16
			for(var i = 0;i < array_length(bgs);i ++)
			{
				if(i != 0)
				{
					_array[i] = instance_create_depth(btnBgScrolling1.x,btnBgScrolling1.sprite_height+(_spaceing*i),depth-10,obj_dropout)
					_array[i].text = bgs[i].tName
					_array[i].myId = i
					_array[i].clickedFunction = BgScrolling1DropoutSelected
					_array[i].cfArgs = [i]
				}else
				{
					_array[i] = instance_create_depth(btnBgScrolling1.x,btnBgScrolling1.sprite_height+(_spaceing*i),depth-10,obj_dropout)
					_array[i].text = "noone"
					_array[i].myId = i
					_array[i].clickedFunction = BgScrolling1DropoutSelected
					_array[i].cfArgs = [noone]
				}
			}
			doTypeOptions = _array
		}
	}
}

//Changes Scrolling1 Background
function BgScrolling1DropoutSelected(_type)
{
	with(obj_song_editor)
	{
		bgScrolling1 = _type[0]
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
#endregion

#region Bg Scrolling2 Dropout
function BgScrolling2Dropout()
{
	if(btnBgScrolling2.isClicked == true)
	{
		state = ES.doBgScrolling2
		if(doTypeOptions == noone)
		{
			var _array
			var _spaceing = 16
			for(var i = 0;i < array_length(bgs);i ++)
			{
				if(i != 0)
				{
					_array[i] = instance_create_depth(btnBgScrolling2.x,btnBgScrolling2.sprite_height+(_spaceing*i),depth-10,obj_dropout)
					_array[i].text = bgs[i].tName
					_array[i].myId = i
					_array[i].clickedFunction = BgScrolling2DropoutSelected
					_array[i].cfArgs = [i]
				}else
				{
					_array[i] = instance_create_depth(btnBgScrolling2.x,btnBgScrolling2.sprite_height+(_spaceing*i),depth-10,obj_dropout)
					_array[i].text = "noone"
					_array[i].myId = i
					_array[i].clickedFunction = BgScrolling2DropoutSelected
					_array[i].cfArgs = [noone]
				}
			}
			doTypeOptions = _array
		}
	}
}

//Changes Scrolling2 Background
function BgScrolling2DropoutSelected(_type)
{
	with(obj_song_editor)
	{
		bgScrolling2 = _type[0]
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
#endregion


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
	show_debug_message("sbBeat "+string(sbBeat))
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

function EditEndBeatStuff()
{
	if(btnEndBeat.isClicked && state == ES.free && selectedNote != noone)
	{
		//state = ES.bpmEdit
		endBeatAl = get_integer_async("Set End Beat",selectedNote.endBeat)//"Set End nEata"
		
	}
	
	if(state == ES.endBeatEdit)
	{
		var _id = ds_map_find_value(async_load,"id")
		if (_id == endBeatAl)
		{
			if(ds_map_find_value(async_load,"status"))
			{
				selectedNote.endBeat = real(ds_map_find_value(async_load,"value"))
				state = ES.free
			}
		}
	}
}

function EditSongNameStuff()
{
	if(btnName.isClicked && state == ES.free)
	{
		//state = ES.bpmEdit
		songNameAl = get_string_async("Set Song Name",songName)
				
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
	
	if(state == ES.songNameEdit)
	{
		var _id = ds_map_find_value(async_load,"id")
				
		if (_id == songNameAl)
		{
			if(ds_map_find_value(async_load,"status"))
			{
				songName = string(ds_map_find_value(async_load,"result"))
				state = ES.free
			}
		}
	}
}

function DrawNotesInGrid()
{
	//This also draws the thoomps
	//Draw the notes in the grid
	var _minBeat = ((4*measuresOnScreen)*pageOn)
	var _maxBeat = ((4*measuresOnScreen)*pageOn)+4
	//show_debug_message(string(_minBeat))
	//show_debug_message(string(_maxBeat))
	for(var i = 0; i < ds_list_size(dsThoomps);i ++)
	{
		var _thoomp = dsThoomps[| i]
		if(_thoomp.beat >= _minBeat && _thoomp.beat < _maxBeat)
		{
			var _pos = PosFromBeatRow(_thoomp.beat,_thoomp.row)
			draw_sprite_ext(
				_thoomp.spr,
				0,
				_pos[0],
				_pos[1],
				1,
				1,
				0,
				c_white,
				1
			)
		}
	}
	
	for(var i = 0;i<ds_list_size(dsNotes);i++)
	{
		var _note = dsNotes[| i]
		if(_note.beat >= _minBeat && _note.beat < _maxBeat)
		{
			var _a = 0.5
			if(selectedNote != noone)
			{
				if(selectedNote.beat == _note.beat && selectedNote.row == _note.row)_a = 1
			}
			var _pos = PosFromBeatRow(_note.beat,_note.row)
			draw_sprite_ext(
				noteTypes[_note.noteTypeId].sprite,//_note.noteType.sprite,
				0,
				_pos[0],
				_pos[1],
				1,
				1,
				0,
				c_white,
				_a
			)
			show_debug_message(string(_pos[0]))
		}
	
	}
}