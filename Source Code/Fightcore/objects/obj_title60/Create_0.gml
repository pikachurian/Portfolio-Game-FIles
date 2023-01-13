/// @description Insert description here
// You can write your code in this editor
menuOn = 0
opOn = 0

bg1 = {
	spr : spr_fc_bg_1,
	sprW : sprite_get_width(spr_fc_bg_1),
	sprH : sprite_get_height(spr_fc_bg_1),
	x : 0,
	y : 0,
	hspd : -1.6,
	vspd : 0.9,
	hTiles : room_height / bg1.sprH,
	vTiles : room_width / b1.sprW
}

function DrawBg(_bg,_x,_y)
{

	for(var yy = 0; yy < room_height / _bg.sprH; yy ++)
	{
		for(var xx = 0; xx < room_width / _bg.sprW; xx ++)
		{
			draw_sprite(_bg.spr,0,_x+_bg.sprW*xx,_y+_bg.sprH*yy)
		}
	}
}

/*spr1W = sprite_get_width(spr_fc_bg_1)
spr1H = sprite_get_height(spr_fc_bg_1)
bg1X = 0
bg1Y = 0
bg1Hspd = -1.6
bg1Vspd = 0.9
bg1HTiles = room_height / spr1H
bg1VTiles =room_width / spr1W