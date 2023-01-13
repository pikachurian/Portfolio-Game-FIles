// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ItemScripts(){

}

function ItemActEvent(_objOpen, _macroOpen)
{
	if(obj_stats.weight >= obj_stats.weightMax)exit
	obj_level.dsGrid[# x/CELL_WIDTH,y/CELL_HEIGHT] = _macroOpen
	instance_create_depth(x,y,depth,_objOpen)
	//instance_destroy()
		y = -1000//-100
	x = -1000//-100
	audio_play_sound(sfx_pickup,15,false)
	with(obj_stats)
	{
		weight += 1
		ds_list_add(dsInventory,other.item)
	}
	/*
		if(obj_stats.weight >= obj_stats.weightMax)exit
	obj_level.dsGrid[# x/CELL_WIDTH,y/CELL_HEIGHT] = TREASURE_COMMON_OPEN
	instance_create_depth(x,y,depth,obj_treasure_common_open)
	//instance_destroy()
	y = -1000
	x = -1000
	audio_play_sound(sfx_pickup,15,false)
	with(obj_stats)
	{
		weight += 1
		ds_list_add(dsInventory,other.item)
	}*/
}

function ItemDraw()
{
	if(place_meeting(x,y,obj_player))
	{
		var _offsetY = -64
		var _vx = obj_camera.x 
		var _vy = obj_camera.y+ _offsetY
		var _vw = 320
		var _vh = 240

		var _upLeftX = _vx-_vw/2
		var _upLeftY = _vy-_vh/2
	
		draw_set_color(c_black)
		//draw_set_font(fnt_arial)
		draw_set_font(fnt_pixel_0)
		//aw_rectangle(_vx-64,_vy-48,_vx+64,_vy+48,false)
		draw_sprite_ext(spr_item_icons_2,item[| ItemInfo.icon],x-16,y-48,1,1,0,c_white,1)
		draw_set_color(c_white)
		//draw_text(_vx-32,_vy,"VALUE "+string(item[| ItemInfo.value]))
		draw_text(x-32,y-16,"VALUE "+string(item[| ItemInfo.value]))
		//draw_sprite(spr_e_0,0,_vx,_vy+32)
	
		draw_set_color(c_white)
	}
}