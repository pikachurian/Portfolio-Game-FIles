/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case PS.start:
		//image_angle = 0
		draw_self()
		draw_sprite_ext(
			spr_ramp,
			0,
			rampX,
			rampY,
			2,
			2,
			0,
			c_white,
			1
		)
		
		break;
	case PS.active:
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
		break;
		
	case PS.dead:
				
		image_angle = 0		
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
		var _rSelected = 0
		var _bSelected = 0
		if(gmOpOn == 0)
		{
			_rSelected = 1
			_bSelected = 0
		}else
		{
			_rSelected = 0
			_bSelected = 1
		}
		draw_sprite_ext(
			spr_retry,
			_rSelected,
			camX+camW/2-60,
			camY+140,//128,
			2,
			2,
			0,
			c_white,
			1
		)
		
		draw_sprite_ext(
			spr_back,
			_bSelected,
			camX+camW/2-70,
			camY+240,
			2,
			2,
			0,
			c_white,
			1
		)
		
		draw_sprite_ext(
			spr_gameover,
			0,
			camX+camW/2-160,
			camY+64,
			2,
			2,
			0,
			c_white,
			1
		)
		
	case PS.menu:
		image_angle = 0		
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
		break;
}

//show_debug_message(string(vspd))
show_debug_message("yy "+string(yy))