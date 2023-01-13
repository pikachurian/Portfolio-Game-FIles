/// @description Insert description here
// You can write your code in this editor

//Draw Lane Shadows
var _x = 256

var _y1 = 0
var _y2 = 0


if(state != PS.dead)
{
	if(myLane = 1)
	{
		_y1 = oLane.lane[0][LInfo.yPos]
		_y2 = oLane.lane[2][LInfo.yPos]
	}else
	{
		_y1 = oLane.lane[4][LInfo.yPos]
		_y2 = oLane.lane[6][LInfo.yPos]
	}

	if(beatM.isNightcore == false)
	{
		draw_sprite_ext(
			spr_shadow_outline,
			0,
			_x,
			_y1,
			4,
			4,
			0,
			c_white,
			1
		)

		draw_sprite_ext(
			spr_shadow_outline,
			0,
			_x,
			_y2,
			4,
			4,
			0,
			c_white,
			1
		)
	}
}

//Draw Player Shadow
if(beatM.isNightcore == false)draw_sprite_ext(
	spr_shadow_0,
	0,
	x,
	y+shadowOffY,
	4,
	4,
	0,
	c_white,
	0.75
)

draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,1)
//draw_self()

