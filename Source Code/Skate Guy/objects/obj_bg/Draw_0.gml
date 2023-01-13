/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(
	sprite_index,
	2,
	camX+(320-210),
	camY+camH,
	image_xscale,
	image_yscale,
	0,
	c_white,
	1
)

var _t = obj_player.yy / -10000
var _a = lerp(0,2,_t)
draw_set_alpha(_a)
draw_set_color(c_black)
draw_rectangle(camX,camY,camX+camW,camY+camH,false)
draw_set_color(c_white)
draw_set_alpha(1)

draw_sprite_ext(
	sprite_index,
	1,
	bg2.xx,
	bg2.yy,
	image_xscale,
	image_yscale,
	0,
	c_white,
	1
)

draw_sprite_ext(
	sprite_index,
	1,
	bg2.xx-sprite_width,
	bg2.yy,
	image_xscale,
	image_yscale,
	0,
	c_white,
	1
)

draw_sprite_ext(
	sprite_index,
	1,
	bg2.xx+sprite_width,
	bg2.yy,
	image_xscale,
	image_yscale,
	0,
	c_white,
	1
)

draw_sprite_ext(
	sprite_index,
	0,
	bg1.xx,
	bg1.yy,
	image_xscale,
	image_yscale,
	0,
	c_white,
	1
)

draw_sprite_ext(
	sprite_index,
	0,
	bg1.xx-sprite_width,
	bg1.yy,
	image_xscale,
	image_yscale,
	0,
	c_white,
	1
)

draw_sprite_ext(
	sprite_index,
	0,
	bg1.xx+sprite_width,
	bg1.yy,
	image_xscale,
	image_yscale,
	0,
	c_white,
	1
)
