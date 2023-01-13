/// @description Insert description here
// You can write your code in this editor
MainBgStep()

//Input
if(instance_exists(input) && !global.midTransition)
{
	if(input.rPunchP)
	{
		if(scoringFrame >= room_speed * 9)
		{
			if(obj_gm.isStory = false)
			{
				cursor.image_speed = cursor.ispd
				audio_stop_all()
				global.loadTitleMenu = TS.freeplay
				TransitionStart(rm_title,sq_fade_out,sq_fade_in)
			}else
			{
				cursor.image_speed = cursor.ispd
				audio_stop_all()
				//global.loadTitleMenu = TS.freeplay
				TransitionStart(rm_story,sq_fade_out,sq_fade_in)
			}
		}else if(scoringFrame >= room_speed * 1)
		{
			scoringFrame = 9999
		}
	}
}

if(scoringFrame >= room_speed * 1)
{
	radPosY = lerp(radPosY,0,0.1)
	//character.state = SC.look
}
//tif(scoringFrame == room_speed * 1)character.state = SC.look
if(scoringFrame >= room_speed * 1.25)sickPosY = lerp(sickPosY,0,0.1)
if(scoringFrame >= room_speed * 1.5)squarePosY = lerp(squarePosY,0,0.1)
if(scoringFrame >= room_speed * 1.75)missPosY = lerp(missPosY,0,0.1)
if(scoringFrame == room_speed * 2.25)character.state = SC.think
if(scoringFrame >= room_speed * 3.5)totalPosY = lerp(totalPosY,0,0.1)
if(scoringFrame >= room_speed * 4)
{
	totalRankAlpha = lerp(totalRankAlpha,1,0.1)
	totalRankSize = lerp(totalRankSize,4,0.1)
}
if(scoringFrame == room_speed * 4.5)
{
	if(tnRank == Rank.dull || tnRank == Rank.none)character.state = SC.dead
	else character.state = SC.look
}
if(scoringFrame >= room_speed * 6)erPosY = lerp(erPosY,0,0.1)
if(scoringFrame == room_speed * 6.25)character.state = SC.think
if(scoringFrame >= room_speed * 7.25)
{
	erRankAlpha = lerp(erRankAlpha,1,0.1)
	erRankSize = lerp(erRankSize,4,0.1)
}
if(scoringFrame == room_speed * 7.25)
{
	if(bm.scoreInfo.lastRank == Rank.dull || bm.scoreInfo.lastRank == Rank.none)character.state = SC.dead
	else character.state = SC.blink
	
}
if(scoringFrame >= room_speed * 7.75)hpBonusPosY = lerp(hpBonusPosY,0,0.1)
if(scoringFrame >= room_speed * 8)
{
	tsAlpha = lerp(tsAlpha,1,0.1)
	tsSize = lerp(tsSize,2,0.1)
}
if(scoringFrame >= room_speed * 8)character.state = SC.cheer
if(scoringFrame >= room_speed * 8.5)btnNextPosY = lerp(btnNextPosY,0,0.1)


scoringFrame ++