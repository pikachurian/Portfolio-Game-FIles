/// @description Insert description here
// You can write your code in this editor
menuOn = TS.title//0
opOn = 0

bgColor = make_color_rgb(250,180,153)//make_color_rgb(250,208,153)//c_white

titleStartAlpha = 0
titleStartAlphaA = 0.1
titleStartText = "PRESS ANY BUTTON"

titleWaitTime = 1.5 * room_speed//3 * room_speed
titleWaitTick = titleWaitTime

titleImageAlpha = 1
titleImageAlphaA = 0.1

titleWordY = -64
titleWordTargetY = 200//240
titleWordYA = 0.05//0.1

function TitleBg(_spr,_sprW,_sprH,_x,_y,_hspd,_vspd,_vTiles,_hTiles) constructor
{
	spr = _spr
	sprW = _sprW
	sprH = _sprH
	x = _x
	y = _y
	hspd = _hspd
	vspd = _vspd
	vTiles = _vTiles
	hTiles = _hTiles

}

bg1 = new TitleBg(
	spr_fc_bg_1,
	sprite_get_width(spr_fc_bg_1),
	sprite_get_height(spr_fc_bg_1),
	0,
	0,
	-1.6*0.75,
	0.9*0.75,
	round(room_height / sprite_get_height(spr_fc_bg_1)),
	round(room_width / sprite_get_width(spr_fc_bg_1))
)

bg2 = new TitleBg(
	spr_fc_bg_2,
	sprite_get_width(spr_fc_bg_2),
	sprite_get_height(spr_fc_bg_2),
	0,
	0,
	-1.6*1.0,
	0.9*1.0,
	round(room_height / sprite_get_height(spr_fc_bg_2)),
	round(room_width / sprite_get_width(spr_fc_bg_2))
)

bg3 = new TitleBg(
	spr_fc_bg_3,
	sprite_get_width(spr_fc_bg_3),
	sprite_get_height(spr_fc_bg_3),
	0,
	0,
	-1.6*1.25,
	0.9*1.25,
	round(room_height / sprite_get_height(spr_fc_bg_3)),
	round(room_width / sprite_get_width(spr_fc_bg_3))
)

function MainBgStep()
{
	bg1.x += bg1.hspd
	bg1.y += bg1.vspd

	if(bg1.x < -((bg1.hTiles-1)*bg1.sprW))bg1.x = 0
	if(bg1.y > ((bg1.vTiles-1)*bg1.sprH))bg1.y = 0

	//
	bg2.x += bg2.hspd
	bg2.y += bg2.vspd

	if(bg2.x < -((bg2.hTiles-1)*bg2.sprW))bg2.x = 0
	if(bg2.y > ((bg2.vTiles-1)*bg2.sprH))bg2.y = 0

	//
	bg3.x += bg3.hspd
	bg3.y += bg3.vspd

	if(bg3.x < -((bg3.hTiles-1)*bg3.sprW))bg3.x = 0
	if(bg3.y > ((bg3.vTiles-1)*bg3.sprH))bg3.y = 0
}

function DrawBg(_bg,_x,_y,_color)
{

	for(var yy = 0; yy < _bg.vTiles; yy ++)
	{
		for(var xx = 0; xx < _bg.hTiles; xx ++)
		{
			draw_sprite_ext(
				_bg.spr,
				0,
				_x+_bg.sprW*xx,
				_y+_bg.sprH*yy,
				1,
				1,
				0,
				_color,
				1
			)
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

bg1 = {
	spr : spr_fc_bg_1,
	sprW : sprite_get_width(spr_fc_bg_1),
	sprH : sprite_get_height(spr_fc_bg_1),
	x : 0,
	y : 0,
	hspd : -1.6,
	vspd : 0.9,
	vTiles : round(room_height / sprite_get_height(spr_fc_bg_1)),
	hTiles : round(room_width / sprite_get_width(spr_fc_bg_1))
}