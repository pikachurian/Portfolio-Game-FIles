/// @description Insert description here
// You can write your code in this editor
		var _id = ds_map_find_value(async_load,"id")
		if (_id == bpmAl)
		{
			if(ds_map_find_value(async_load,"status"))
			{
				bpm = real(ds_map_find_value(async_load,"value"))
				state = ES.free
			}
		}
		
		if (_id == endBeatAl)
		{
			if(ds_map_find_value(async_load,"status"))
			{
				selectedNote.endBeat = max(real(ds_map_find_value(async_load,"value")),selectedNote.beat)
				state = ES.free
			}
		}
		
				
		if (_id == songNameAl)
		{
			if(ds_map_find_value(async_load,"status"))
			{
				songName = string(ds_map_find_value(async_load,"result"))
				state = ES.free
			}
		}