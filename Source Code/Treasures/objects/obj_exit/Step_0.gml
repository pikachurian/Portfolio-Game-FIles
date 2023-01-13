/// @description Insert description here
// You can write your code in this editor
function ActEvent()
{
	if(obj_stats.ascend = false)
	{
		with(obj_stats)
		{
			ds_grid_resize(dsFloor,level+1,FloorInfo.enumCount)
			ds_grid_add(dsFloor,level,FloorInfo.grid,other.levelGen.dsGrid)
			ds_grid_add(dsFloor,level,FloorInfo.hue,other.hueShifter.pos)
			level += 1
			sameHueOn -= 1
		}
		//room_restart()
		room_goto_fade(rm_title,true,0.05)
	}
}

if(obj_stats.ascend = true)sprite_index = spr_exit_closed