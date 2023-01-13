/// @description Insert description here
// You can write your code in this editor
if(global.paused)
{
	lerpPosX = lerp(lerpPosX,lerpPosXMax,lerpPosA)
	draw_sprite_stretched_ext(
		spr_pixel_black,
		0,
		0,
		0,
		lerpPosX,
		room_height,
		c_white,
		0.5
	)
	
		ResetDrawStuff()
		draw_set_halign(fa_left)
		draw_set_font(fnt_2p)
	
	for(var i = 0;i < array_length(options);i ++)
	{
		var _size = 1.5
		var _color = c_white
		if(opOn = i)
		{
			_size = 2
			_color = c_orange
		}
		draw_set_color(_color)
		draw_text_transformed(
			128-(lerpPosXMax - lerpPosX),
			240+(i*96),
			options[i],
			_size,
			_size,
			0
		)
	}
	
	draw_set_halign(fa_left)
	draw_set_font(Font1)
}else
{
	
}