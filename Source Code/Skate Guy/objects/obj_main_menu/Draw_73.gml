/// @description Insert description here
// You can write your code in this editor
switch(p.state)
{
	case PS.menu:
		draw_sprite_ext(
			spr_title,
			0,
			p.camX+p.camW/2-110,
			p.camY+16,
			2,
			2,
			0,
			c_white,
			1
		)
		
		draw_sprite_ext(
			spr_play,
			sSelected,
			p.camX+p.camW/2-62,
			p.camY+160,
			2,
			2,
			0,
			c_white,
			1
		)
		
		draw_sprite_ext(
			spr_quit,
			qSelected,
			p.camX+p.camW/2-62,
			p.camY+210,
			2,
			2,
			0,
			c_white,
			1
		)
		
		draw_sprite_ext(
			spr_fullscreen,
			fsSelected,
			p.camX+p.camW/2-70,
			p.camY+260,
			1,
			1,
			0,
			c_white,
			1
		)
		
		var _tFrame = window_get_fullscreen()
		draw_sprite_ext(
			spr_tick,
			_tFrame,
			p.camX+p.camW/2+64,
			p.camY+260,
			2,
			2,
			0,
			c_white,
			1
		)
		
		draw_sprite_ext(
			spr_help_tap,
			0,
			p.camX+128,
			p.camY+332,
			2,
			2,
			0,
			c_white,
			1
		)
		
		draw_sprite_ext(
			spr_help_hold,
			0,
			p.camX+372,
			p.camY+332,
			2,
			2,
			0,
			c_white,
			1
		)
		break;
}
