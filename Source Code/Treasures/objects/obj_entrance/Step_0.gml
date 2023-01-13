/// @description Insert description here
// You can write your code in this editor
function ActEvent()
{
	if(obj_stats.level > 1)
	{
		with(obj_stats)
		{
			if(ascend = true)ds_grid_destroy(dsFloor[# level,FloorInfo.grid])
			else furthestLevel = level
			ascend = true
			level -= 1
		}
		//room_restart()
		room_goto_fade(rm_title,true,0.05)
	}else	if(obj_stats.level = 1)
	{
		with(obj_stats)
		{
			if(ascend = true)ds_grid_destroy(dsFloor[# level,FloorInfo.grid])
			else furthestLevel = level
			ascend = true
			//level -= 1
			room_goto_fade(rm_victory,false,0.05)
			audio_pause_all()
			audio_play_sound(sng_victory,50,false)
		}
	}
}