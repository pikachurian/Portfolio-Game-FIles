/// @description Insert description here
// You can write your code in this editor

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
		
		//Scoring
		//if(scoringFrame >= room_speed)sickNotesY = lerp(sickNotesY,)
		
		ResetDrawStuff()
		draw_set_font(fnt_2p)
		
		/*draw_sprite_ext(spr_sick,0,16,16,4,4,0,c_white,1)
		draw_text_transformed(
			100,
			22,
			string(bm.scoreInfo.sickNotes),
			1.25,
			1.25,
			0
		)*/
		
		draw_set_halign(fa_right)
		var _spacing = 48//128
		draw_sprite_ext(spr_rad,0,room_width-144,16,4,4,0,c_white,1)
		draw_text_transformed(
			room_width-152,//-116,
			22,
			string(bm.scoreInfo.radNotes),
			1.25,
			1.25,
			0
		)
		
		draw_sprite_ext(spr_sick,0,room_width-144,16+(_spacing * 1),4,4,0,c_white,1)
		draw_text_transformed(
			room_width-152,//-116,
			22+(_spacing * 1),
			string(bm.scoreInfo.sickNotes),
			1.25,
			1.25,
			0
		)
		
		draw_sprite_ext(spr_square,0,room_width-144,16+(_spacing * 2),4,4,0,c_white,1)
		draw_text_transformed(
			room_width-152,
			22+(_spacing * 2),
			string(bm.scoreInfo.squareNotes),
			1.25,
			1.25,
			0
		)
		
			draw_sprite_ext(spr_miss,0,room_width-144,16+(_spacing * 3),4,4,0,c_white,1)
		draw_text_transformed(
			room_width-152,
			22+(_spacing * 3),
			string(bm.scoreInfo.missedNotes),
			1.25,
			1.25,
			0
		)
		
		var _notesHit = ((bm.scoreInfo.radNotes+bm.scoreInfo.sickNotes)/bm.scoreInfo.totalNotes)*100
		//draw_sprite_ext(spr_rad,0,room_width-96,16+(_spacing * 1),4,4,0,c_white,1)
		draw_text_transformed(
			room_width-24,
			22+(_spacing * 4),
			""+string(_notesHit) + "% NOTES HIT",
			1.25,
			1.25,
			0
		)
		var _tnRankSpr = 1
		_notesHit = floor(_notesHit)
		if(_notesHit >= notesHitGoals.rad)_tnRankSpr = Rank.rad
		else if(_notesHit >= notesHitGoals.sick)_tnRankSpr = Rank.sick
		else if(_notesHit >= notesHitGoals.ace)_tnRankSpr = Rank.ace
		else if(_notesHit >= notesHitGoals.based)_tnRankSpr = Rank.based
		else if(_notesHit >= notesHitGoals.cool)_tnRankSpr = Rank.cool
		else _tnRankSpr = 1
		
		draw_sprite_ext(
			spr_rank,
			_tnRankSpr,
			room_width-380,
			64,
			4,
			4,
			0,
			c_white,
			1
		)
		
		draw_text_transformed(
			room_width-24,
			22+(_spacing * 6),
			"EXIT RANK",
			1.25,
			1.25,
			0
		)
		
			draw_sprite_ext(
			spr_rank,
			bm.scoreInfo.lastRank,
			room_width-380,
			360,
			4,
			4,
			0,
			c_white,
			1
		)
		
		draw_set_halign(fa_left)
		draw_set_font(Font1)