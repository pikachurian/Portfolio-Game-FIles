/// @description Insert description here
// You can write your code in this editor

switch(menuOn)
{
	case TS.title:
		//
		draw_sprite(spr_title_blurred,0,0,0)
		draw_sprite_ext(
			spr_title,
			0,
			0,
			0,
			1,
			1,
			0,
			c_white,
			titleImageAlpha
		)
		
		draw_sprite_ext(
			spr_fightcore,
			0,
			room_width/2,
			titleWordY,
			6,
			6,
			0,
			c_white,
			1
		)
		
		ResetDrawStuff()
		draw_set_font(fnt_2p)
		draw_set_halign(fa_center)
		draw_set_alpha(titleStartAlpha)
		draw_set_color(c_black)
		
		draw_text_transformed(
			room_width/2-4,
			room_height-240+6,
			titleStartText,
			1.5,
			1.5,
			0
		)
		draw_text_transformed(
			room_width/2+4,
			room_height-240+6,
			titleStartText,
			1.5,
			1.5,
			0
		)
				draw_text_transformed(
			room_width/2,
			room_height-240-6,
			titleStartText,
			1.5,
			1.5,
			0
		)
		draw_set_color(c_white)
		
		draw_text_transformed(
			room_width/2,
			room_height-240,
			titleStartText,
			1.5,
			1.5,
			0
		)
		draw_set_alpha(1)
		draw_set_font(Font1)
		draw_set_halign(fa_left)
		break;
		
	case TS.main:
		
		//DrawBg1(bg1X+room_width,bg1Y-room_height)
		var _color = bgColor//make_color_rgb() //c_white

		DrawBg(bg1,bg1.x,bg1.y,_color)
		DrawBg(bg1,bg1.x,bg1.y-(bg1.vTiles*bg1.sprH),_color)
		DrawBg(bg1,bg1.x+(bg1.hTiles*bg1.sprW),bg1.y,_color)
		//DrawBg(bg1,bg1.x+(bg1.hTiles*room_width),bg1.y-(bg1.vTiles*room_height))
		DrawBg(bg1,bg1.x+(bg1.hTiles*bg1.sprW),bg1.y-(bg1.vTiles*bg1.sprH),_color)

		DrawBg(bg2,bg2.x,bg2.y,_color)
		DrawBg(bg2,bg2.x,bg2.y-(bg2.vTiles*bg2.sprH),_color)
		DrawBg(bg2,bg2.x+(bg2.hTiles*bg2.sprW),bg2.y,_color)
		DrawBg(bg2,bg2.x+(bg2.hTiles*bg2.sprW),bg2.y-(bg2.vTiles*bg2.sprH),_color)

		DrawBg(bg3,bg3.x,bg3.y,_color)
		DrawBg(bg3,bg3.x,bg3.y-(bg3.vTiles*bg3.sprH),_color)
		DrawBg(bg3,bg3.x+(bg3.hTiles*bg3.sprW),bg3.y,_color)
		DrawBg(bg3,bg3.x+(bg3.hTiles*bg3.sprW),bg3.y-(bg3.vTiles*bg3.sprH),_color)
		break;

}