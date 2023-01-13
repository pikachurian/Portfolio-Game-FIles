/// @description Insert description here
// You can write your code in this editor
UpdateGridPos()
UpdateGridBeat()
UpdateMinMaxBeats()
UpdateDropoutOver()

switch(state)
{
	case ES.free:
		//
		//Save
		if(btnSave.isClicked)Save()
		//Change Page
		if(keyboard_check_pressed(vk_left)) pageOn = max(0,pageOn-1)
		if(keyboard_check_pressed(vk_right)) pageOn += 1
		
		//Selected Note if at spot, or add note if noone
		#region
		if(mouse_check_button_pressed(mb_left))
		{
			if(gridPosY >= 0 && gridPosY < gridRows) && (gridPosX >= 0 && gridPosX < minNoteDiv*measuresOnScreen)
			{
				var _noteOn = GetNote(gridPosY,gridBeat)
				if(_noteOn == noone)
				{
					AddNote(gridPosY,gridBeat,noteTypes[currentNoteType], currentNoteType)
					var _noteOn = GetNote(gridPosY,gridBeat)
					selectedNote = _noteOn[0]
				}else selectedNote = _noteOn[0]
			}
		}
		#endregion
		//Delete Selected Note
		#region
		if(mouse_check_button_pressed(mb_right))
		{
			var _noteOn = GetNote(gridPosY,gridBeat)
			if(_noteOn != noone)
			{
				selectedNote = noone
				ds_list_delete(dsNotes,_noteOn[1])
			}
		}
		#endregion
		//A and D to cycle through note types on selected note
		#region
		var _typeAxis = keyboard_check_pressed(ord("D")) - keyboard_check_pressed(ord("A"))
		if(_typeAxis != 0 && selectedNote != noone)
		{
			var _typeOn = selectedNote.noteTypeId
			if(_typeAxis = -1)
			{
				if(_typeOn-1 < 0)_typeOn = array_length(noteTypes)-1
				else _typeOn -= 1
			}else if(_typeAxis = 1)
			{
				if(_typeOn+1 > array_length(noteTypes)-1)_typeOn = 0
				else _typeOn += 1
			}
			SetSelectedNoteType(_typeOn)
		}
		#endregion
		//Note Type Dropout
		NoteTypeDropout()
		//Select Current Note Type Dropout
		NoteTypeCurrentDropout()
		//StartSongPosition
		SongPositionBar()
		if(keyboard_check_pressed(vk_space))
		{
			state = ES.songPlaying
			with(beatM)
			{
				StartSongPosition(songId,BeatToSeconds(other.sbBeat))
			}
		}
		//EditBpm
		EditBpmStuff()
		//Change the song being edited
		SelectSongDropout()
		//Press U to update note data, such as the spawn beat offset
		if(keyboard_check_pressed(ord("U")))UpdateNoteType()
		//Press R to go to beginning
		if(keyboard_check_pressed(ord("R")))GotoBeginning()
		break;
		
	case ES.bpmEdit:
		//
		EditBpmStuff()
		break;
		
		
	case ES.typeEdit:
		//
		break;
		
	case ES.songPlaying:
		//
		if(keyboard_check_pressed(vk_space))
		{
			with(beatM)StopSong()
			state = ES.free
			//sbBeat = minBeat
		}
		SongPositionBar()
		
		//Change Page
		//if(keyboard_check_pressed(vk_left)) pageOn = max(0,pageOn-1)
		//if(keyboard_check_pressed(vk_right)) pageOn += 1
		if(sbBeat >= maxBeat)pageOn += 1
		break;
}