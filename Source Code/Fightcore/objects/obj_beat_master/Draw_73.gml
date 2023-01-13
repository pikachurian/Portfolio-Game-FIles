/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(obj_player))exit
var _camX = obj_player.camX
var _camY = obj_player.camY
var _camW = obj_player.camW
var _camH = obj_player.camH
if(songStarted == SStarted.withCount)
{
	var _cdSprite = noone
	var _cdOnLast = cdOn
	var _cdAlpha = 1
	
	if(songPositionInBeats > -4 && songPositionInBeats < -3)
	{
		_cdSprite = spr_cd_fight
		cdOn = 0
	}
	else if(songPositionInBeats > -6 && songPositionInBeats < -5)
	{
		_cdSprite = spr_cd_1
		cdOn = 1
	}else if(songPositionInBeats > -8 && songPositionInBeats < -7)
	{
		_cdSprite = spr_cd_2
		cdOn = 2
	}
	else if(songPositionInBeats > -10 && songPositionInBeats < -9)
	{
		_cdSprite = spr_cd_3
		cdOn = 3
	}else if(songPositionInBeats > -16 && songPositionInBeats < -11 && isNightcore)//Draw "Night Incoming"if nightcore
	{
		_cdSprite = spr_night_logo//spr_cd_3
		cdOn = 4
		_cdAlpha = ncLogoAlpha
	}else cdSize = 3
	
	if(_cdOnLast != cdOn)cdSize = 3
	
	if(cdOn = 0)cdSize = lerp(cdSize,5,0.1)
	else cdSize = lerp(cdSize,4,0.1)
	
	if(_cdSprite != noone)draw_sprite_ext(
		_cdSprite,
		0,
		_camX+_camW/2,
		_camY+_camH/2,
		cdSize,
		cdSize,
		0,
		c_white,
		_cdAlpha
	)
}

//Ost
if(ostTick >= -room_speed)
{
	draw_set_font(fnt_2p)
	draw_set_color(c_white)
	draw_sprite_ext(
		spr_note,
		0,
		32+ostX,
		room_height-64,
		3,
		3,
		0,
		c_white,
		1
	)

	draw_text_transformed(
		96+ostX2,
		room_height-48+ostY,
		songs[songId].songName,
		1,
		1,
		0
	)

	draw_set_font(Font1)
}