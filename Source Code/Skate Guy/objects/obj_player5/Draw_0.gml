/// @description Insert description here
// You can write your code in this editor
var _iAngle = lerp(iMaxAngle,iMinAngle,boardAngle)
image_angle = _iAngle

draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y,
	image_xscale,
	image_yscale,
	image_angle,
	c_white,
	image_alpha
)