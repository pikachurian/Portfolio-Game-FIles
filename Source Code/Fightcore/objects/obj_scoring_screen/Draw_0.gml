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
		
		//Next
		draw_sprite_ext(
			spr_button_next,
			0,
			room_width-160,
			room_height-54+btnNextPosY,
			6,
			6,
			0,
			c_white,
			1
		)
		
		//Cursor
		cursor.x = room_width-232
		cursor.y = room_height-50+btnNextPosY
		
		draw_set_halign(fa_right)
		var _spacing = spacing//48//128
		draw_sprite_ext(spr_rad,0,room_width-144,16+radPosY,4,4,0,c_white,1)
		draw_set_color(c_black)
		draw_text_transformed(
			room_width-152+4,//-116,
			radPosY+22+4,
			string(bm.scoreInfo.radNotes),
			1.25,
			1.25,
			0
		)
		draw_set_color(c_white)
		draw_text_transformed(
			room_width-152,//-116,
			radPosY+22,
			string(bm.scoreInfo.radNotes),
			1.25,
			1.25,
			0
		)
		
		draw_sprite_ext(spr_sick,0,room_width-144,16+(_spacing * 1)+sickPosY,4,4,0,c_white,1)
		draw_set_color(c_black)
		draw_text_transformed(
			room_width-152+4,//-116,
			sickPosY+22+(_spacing * 1)+4,
			string(bm.scoreInfo.sickNotes),
			1.25,
			1.25,
			0
		)
		
		draw_set_color(c_white)
		draw_text_transformed(
			room_width-152,//-116,
			sickPosY+22+(_spacing * 1),
			string(bm.scoreInfo.sickNotes),
			1.25,
			1.25,
			0
		)
		
		draw_sprite_ext(spr_square,0,room_width-144,16+(_spacing * 2)+squarePosY,4,4,0,c_white,1)
		draw_set_color(c_black)
		draw_text_transformed(
			room_width-152+4,
			22+(_spacing * 2)+4+squarePosY,
			string(bm.scoreInfo.squareNotes),
			1.25,
			1.25,
			0
		)
		
		draw_set_color(c_white)
		draw_text_transformed(
			room_width-152,
			22+(_spacing * 2)+squarePosY,
			string(bm.scoreInfo.squareNotes),
			1.25,
			1.25,
			0
		)
		
		draw_sprite_ext(spr_miss,0,room_width-144,16+(_spacing * 3)+missPosY,4,4,0,c_white,1)
		draw_set_color(c_black)
		draw_text_transformed(
			room_width-152+4,
			22+(_spacing * 3)+4+missPosY,
			string(bm.scoreInfo.missedNotes),
			1.25,
			1.25,
			0
		)
		
		draw_set_color(c_white)
		draw_text_transformed(
			room_width-152,
			22+(_spacing * 3)+missPosY,
			string(bm.scoreInfo.missedNotes),
			1.25,
			1.25,
			0
		)
		
		var _notesHit = ((bm.scoreInfo.radNotes+bm.scoreInfo.sickNotes)/bm.scoreInfo.totalNotes)*100
		//draw_sprite_ext(spr_rad,0,room_width-96,16+(_spacing * 1),4,4,0,c_white,1)
		draw_set_color(c_black)
		draw_text_transformed(
			room_width-24+4,
			22+(_spacing * 4)+4+totalPosY,
			""+string(_notesHit) + "% NOTES HIT",
			1.25,
			1.25,
			0
		)
		draw_set_color(c_white)
		draw_text_transformed(
			room_width-24,
			22+(_spacing * 4)+totalPosY,
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
			260,
			totalRankSize,//4,
			totalRankSize,//4,
			0,
			c_white,
			totalRankAlpha
		)
		draw_set_color(c_black)
		draw_text_transformed(
			room_width-24+4,
			22+(_spacing * 8)+4+erPosY,
			"EXIT RANK",
			1.25,
			1.25,
			0
		)
		draw_set_color(c_white)
		draw_text_transformed(
			room_width-24,
			22+(_spacing * 8)+erPosY,
			"EXIT RANK",
			1.25,
			1.25,
			0
		)
		
			draw_sprite_ext(
			spr_rank,
			bm.scoreInfo.lastRank,
			room_width-380,
			450,
			erRankSize,
			erRankSize,
			0,
			c_white,
			erRankAlpha
		)
		draw_set_color(c_black)
		draw_text_transformed(
			room_width-24+4,
			22+(_spacing * 12.75)+4+hpBonusPosY,
			"HP BONUS "+string(healthBonus),
			1.25,
			1.25,
			0
		)
		draw_set_color(c_white)
		draw_text_transformed(
			room_width-24,
			22+(_spacing * 12.75)+hpBonusPosY,
			"HP BONUS "+string(healthBonus),
			1.25,
			1.25,
			0
		)
		
		draw_set_halign(fa_center)
		draw_set_color(c_black)
		draw_set_alpha(tsAlpha)
		draw_text_transformed(
			room_width/2+4,
			64+4,
			string(totalScore),
			tsSize,
			tsSize,
			0
		)
		
		draw_set_color(c_white)
		draw_text_transformed(
			room_width/2,
			64,
			string(totalScore),
			tsSize,//2,
			tsSize,//2,
			0
		)
		draw_set_alpha(1)
		draw_set_halign(fa_left)
		draw_set_font(Font1)