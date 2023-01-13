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
