/// @description Insert description here
// You can write your code in this editor
ResetDrawStuff()
draw_set_font(fnt_2p)
draw_set_halign(fa_center)

draw_set_alpha(a)
//draw_text(x,y,text)
if(sprite != noone)
{
	draw_sprite_ext(
		sprite,
		0,
		x,
		y,
		4,
		4,
		0,
		c_white,
		a
	)
	//draw_self()
}

a += fadeRate

y += vspd

if(a <= 0)instance_destroy()

draw_set_font(Font1)
draw_set_halign(fa_left)
draw_set_alpha(1)