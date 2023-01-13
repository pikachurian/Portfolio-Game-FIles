/// @description Insert description here
// You can write your code in this editor
beatM = obj_beat_master

a = 0
lerpStartBeat = 0

scrollBackToPlayer = false

tWhenStopped = noone

function DrawBg()
{
	var _t = beatM.songPositionInBeats - lerpStartBeat

	a = _t / 14

	var _x1 = lerp(room_width,0,a)
	var _x2 = _x1 + sprite_width
	var _x3 = _x1 - sprite_width
	var _x4 = _x1 - sprite_width*2

	draw_sprite(sprite_index,image_index,_x1,0)
	draw_sprite(sprite_index,image_index,_x2,0)
	draw_sprite(sprite_index,image_index,_x3,0)
	draw_sprite(sprite_index,image_index,_x4,0)

	if(a >= 1)
	{
		lerpStartBeat = beatM.songPositionInBeats
	}

	/*var _t = beatM.songPositionInBeats - lerpStartBeat

	a = _t / 4

	var _x1 = lerp(room_width,0,a)
	var _x2 = lerp(0,room_width,a)

	draw_sprite(sprite_index,image_index,_x1,0)
	draw_sprite(sprite_index,image_index,_x2,0)

	if(a >= 1)
	{
		lerpStartBeat = beatM.songPositionInBeats
	}*/
}

function DrawScrollToPlayer()
{
	if(!instance_exists(obj_player))return noone
	
	if(obj_player.x >= room_width/2)
	{
		if(tWhenStopped == noone)tWhenStopped = beatM.songPositionInBeats - lerpStartBeat
		a = tWhenStopped / 14
		a *= 2
	}else
	{
		var _t = beatM.songPositionInBeats - lerpStartBeat

		a = _t / 14
		a *= 2
	}

	var _x1 = lerp(0,room_width,a)
	var _x2 = _x1 + sprite_width
	var _x3 = _x1 - sprite_width
	var _x4 = _x1 - sprite_width*2

	draw_sprite(sprite_index,image_index,_x1,0)
	draw_sprite(sprite_index,image_index,_x2,0)
	draw_sprite(sprite_index,image_index,_x3,0)
	draw_sprite(sprite_index,image_index,_x4,0)

	if(a >= 1)
	{
		lerpStartBeat = beatM.songPositionInBeats
	}
}