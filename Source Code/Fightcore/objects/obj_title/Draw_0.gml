/// @description Insert description here
// You can write your code in this editor

switch(menuOn)
{
	case TS.title:
		//
		#region
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
		#region
		/*draw_text_transformed(
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
		)*/
		#endregion
		draw_set_color(c_white)
		draw_sprite_ext(
			spr_press_any_button,
			0,
			room_width/2-4,
			room_height-240+6,
			4,
			4,
			0,
			c_white,
			titleStartAlpha
		)
		/*draw_text_transformed(
			room_width/2,
			room_height-240,
			titleStartText,
			1.5,
			1.5,
			0
		)*/
		draw_set_alpha(1)
		draw_set_font(Font1)
		draw_set_halign(fa_left)
		#endregion
		break;
		
	case TS.main:
		#region
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
		
		draw_sprite_ext(
			spr_main_mc,
			0,
			room_width-320,
			540,
			2,
			2,
			0,
			c_white,
			1
		)
		#endregion
		break;

	case TS.freeplay:
		//
		#region
		if(isNightcore)freeplayColor = merge_color(freeplayColor,freeplayNightColor,0.1)
		else freeplayColor = merge_color(freeplayColor,freeplayDayColor,0.1)
		var _color = freeplayColor//make_color_rgb() //c_white

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
		
		ResetDrawStuff()
		draw_set_halign(fa_left)
		draw_set_font(fnt_2p)
		var _songsArray = noone
		if(isNightcore)_songsArray = fNCSongs
		else _songsArray = fSongs
		#region
		/*
		for(var i = -2; i < 3; i ++)
		{
			var _size = 1.5
			var _canDraw = true
			if(i == 0)_size = 1.75
			var _aI = i + opOn
			if(_aI < 0)_aI = array_length(_songsArray)+i
			if(_aI > array_length(_songsArray)-1)
			{
				_canDraw = false
			}
			if(_canDraw)draw_text_transformed(
				240,
				(room_height/2)+(i * 128),//(room_height/2-128)+(i * 128),
				bm.songs[_songsArray[_aI]].songName,//"Song Name",
				_size,
				_size,
				0
			)
		}*/
		
		fNamesY = lerp(fNamesY,opOn,0.1)
		draw_set_color(c_black)
		for(var i = 0; i < array_length(_songsArray); i++)
		{
			var _size = 1.5
			if(i == opOn)_size = 1.75
			//var _aI = i
			
			//show_debug_message("opOn "+string(opOn))
			draw_text_transformed(
				96+8,
				((room_height/2)+((i-fNamesY) * 128))+8,//(room_height/2-128)+(i * 128),
				bm.songs[_songsArray[i]].songName,//"Song Name",
				_size,
				_size,
				0
			)
		}
		draw_set_color(c_white)
		for(var i = 0; i < array_length(_songsArray); i++)
		{
			var _size = 1.5
			if(i == opOn)_size = 1.75
			//var _aI = i
			
			//show_debug_message("opOn "+string(opOn))
			draw_text_transformed(
				96,
				(room_height/2)+((i-fNamesY) * 128),//(room_height/2-128)+(i * 128),
				bm.songs[_songsArray[i]].songName,//"Song Name",
				_size,
				_size,
				0
			)
		}
		
		draw_set_halign(fa_right)
		draw_set_color(c_white)
		
		draw_text_transformed(
			room_width-96,//96,
			room_height-64,//32,
			"TOGGLE NIGHTCORE\nSELECT/TAB",
			1,
			1,
			0
		)
		var _ncI = 0
		if(isNightcore)_ncI = 1
		draw_sprite_ext(
			spr_nightcore_toggle,
			_ncI,
			room_width-48,
			room_height-48,
			2,
			2,
			0,
			c_white,
			1
		)
		#endregion
		
		draw_set_font(Font1)
		draw_set_halign(fa_left)
		ResetDrawStuff()
		#endregion
		break;
}