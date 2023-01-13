/// @description Insert description here
// You can write your code in this editor
beatM = obj_beat_master

cam = view_camera[0]

	camX = camera_get_view_x(cam)
	camY = camera_get_view_x(cam)
	
	camW = camera_get_view_width(cam)
	camH = camera_get_view_height(cam)

bgStatic = {
	sprite : noone,
	scriptCreate : noone,
	scriptStep : noone,
	scriptDraw : noone
}

bgScrolling1 = {
	sprite : noone,
	scriptCreate : noone,
	scriptStep : noone,
	scriptDraw : noone,
	ispd : 0.5,
	iIndex : 0,
	iBeat : -4
}

bgScrolling2 = {
	sprite : noone,
	scriptCreate : noone,
	scriptStep : noone,
	scriptDraw : noone,
	ispd : 0.5,
	iIndex : 0,
	iBeat : -4,
	scrollSpd : 1
}

function LoadBackgrounds()
{
	//if()
}

a = 0
a2 = 0
lerpStartBeat = 0

lerpStartBeat2 = 0

//for the loss cutscene
scrollBackToPlayer = false

//the t variable when stopped, for the loss cutscene
tWhenStopped = noone
tWhenStopped2 = noone

//scrolling1 animation image_speed

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

function DrawBgStatic()
{
	if(bgStatic.sprite != noone)
	{
		draw_sprite(bgStatic.sprite,0,camX,camY)
	}
}

function DrawBgScrolling2()
{
	if(bgScrolling2.sprite == noone)return noone
	var _t = beatM.songPositionInBeats - lerpStartBeat2
	var _sprite = bgScrolling2.sprite
	var _spriteW = sprite_get_width(_sprite)
	var _iIndex = 0//var _imageI = bgScrolling1.iIndex
	var _iBeatLast = bgScrolling2.iBeat
	if(instance_exists(beatM))
	{
		bgScrolling2.iBeat = floor(beatM.songPositionInBeats*100) % 4
		if(bgScrolling2.iBeat == 0 && bgScrolling2.iBeat != _iBeatLast)bgScrolling2.iIndex += 1
		if(bgScrolling2.iIndex >= sprite_get_number(_sprite))bgScrolling2.iIndex = 0
	}
	
	_iIndex = bgScrolling2.iIndex

	
	a2 = _t / 28

	//show_debug_message(string("a2"))

	var _x1 = lerp(room_width,0,a2)
	var _x2 = _x1 + _spriteW
	var _x3 = _x1 - _spriteW
	var _x4 = _x1 - _spriteW*2

	draw_sprite(_sprite,_iIndex,_x1,0)
	draw_sprite(_sprite,_iIndex,_x2,0)
	draw_sprite(_sprite,_iIndex,_x3,0)
	draw_sprite(_sprite,_iIndex,_x4,0)

	if(a2 >= 1)
	{
		lerpStartBeat2 = beatM.songPositionInBeats
	}

}

function DrawBgScrolling1()
{
	if(bgScrolling1.sprite == noone)return noone
	var _t = beatM.songPositionInBeats - lerpStartBeat
	var _sprite = bgScrolling1.sprite
	var _spriteW = sprite_get_width(_sprite)
	var _iIndex = 0//var _imageI = bgScrolling1.iIndex
	var _iBeatLast = bgScrolling1.iBeat
	if(instance_exists(beatM))
	{
		bgScrolling1.iBeat = floor(beatM.songPositionInBeats*100) % 4
		if(bgScrolling1.iBeat == 0 && bgScrolling1.iBeat != _iBeatLast)bgScrolling1.iIndex += 1
		if(bgScrolling1.iIndex >= sprite_get_number(_sprite))bgScrolling1.iIndex = 0
	}
	
	_iIndex = bgScrolling1.iIndex

	a = _t / 14

	var _x1 = lerp(room_width,0,a)
	var _x2 = _x1 + _spriteW
	var _x3 = _x1 - _spriteW
	var _x4 = _x1 - _spriteW*2
	var _x5 = _x1 - _spriteW*3

	draw_sprite(_sprite,_iIndex,_x1,0)
	draw_sprite(_sprite,_iIndex,_x2,0)
	draw_sprite(_sprite,_iIndex,_x3,0)
	draw_sprite(_sprite,_iIndex,_x4,0)
	draw_sprite(_sprite,_iIndex,_x5,0)

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

function DrawScrolling1ScrollToPlayer()
{
	if(bgScrolling1.sprite == noone)return noone
	var _sprite = bgScrolling1.sprite
	var _spriteW = sprite_get_width(_sprite)
	//Animation
	var _iIndex = 0//var _imageI = bgScrolling1.iIndex
	var _iBeatLast = bgScrolling1.iBeat
	if(instance_exists(beatM))
	{
		bgScrolling1.iBeat = floor(beatM.songPositionInBeats*100) % 4
		if(bgScrolling1.iBeat == 0 && bgScrolling1.iBeat != _iBeatLast)bgScrolling1.iIndex += 1
		if(bgScrolling1.iIndex >= sprite_get_number(_sprite))bgScrolling1.iIndex = 0
	}
	
	_iIndex = bgScrolling1.iIndex
	
	//
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
	var _x2 = _x1 + _spriteW
	var _x3 = _x1 - _spriteW
	var _x4 = _x1 - _spriteW*2

	draw_sprite(_sprite,_iIndex,_x1,0)
	draw_sprite(_sprite,_iIndex,_x2,0)
	draw_sprite(_sprite,_iIndex,_x3,0)
	draw_sprite(_sprite,_iIndex,_x4,0)

	if(a >= 1)
	{
		lerpStartBeat = beatM.songPositionInBeats
	}
}

function DrawScrolling2ScrollToPlayer()
{
	if(bgScrolling2.sprite == noone)return noone
	var _sprite = bgScrolling2.sprite
	var _spriteW = sprite_get_width(_sprite)
	
	//Animation
	var _iIndex = 0//var _imageI = bgScrolling1.iIndex
	var _iBeatLast = bgScrolling2.iBeat
	if(instance_exists(beatM))
	{
		bgScrolling2.iBeat = floor(beatM.songPositionInBeats*100) % 4
		if(bgScrolling2.iBeat == 0 && bgScrolling2.iBeat != _iBeatLast)bgScrolling2.iIndex += 1
		if(bgScrolling2.iIndex >= sprite_get_number(_sprite))bgScrolling2.iIndex = 0
	}
	
	_iIndex = bgScrolling2.iIndex
	
	//
	if(!instance_exists(obj_player))return noone
	
	if(obj_player.x >= room_width/2)
	{
		if(tWhenStopped2 == noone)tWhenStopped2 = beatM.songPositionInBeats - lerpStartBeat2
		a2 = tWhenStopped2 / 28
		a2 *= 2
	}else
	{
		var _t = beatM.songPositionInBeats - lerpStartBeat2

		a2 = _t / 28
		a2 *= 2
	}

	var _x1 = lerp(0,room_width,a2)
	var _x2 = _x1 + _spriteW
	var _x3 = _x1 - _spriteW
	var _x4 = _x1 - _spriteW*2

	draw_sprite(_sprite,_iIndex,_x1,0)
	draw_sprite(_sprite,_iIndex,_x2,0)
	draw_sprite(_sprite,_iIndex,_x3,0)
	draw_sprite(_sprite,_iIndex,_x4,0)

	if(a2 >= 1)
	{
		lerpStartBeat2 = beatM.songPositionInBeats
	}
}

/*function DrawScrollToPlayer()
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