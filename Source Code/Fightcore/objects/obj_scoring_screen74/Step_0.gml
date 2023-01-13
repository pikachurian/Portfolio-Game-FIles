/// @description Insert description here
// You can write your code in this editor
MainBgStep()

if(scoringFrame >= room_speed * 1)radPosY = lerp(radPosY,0,0.1)
if(scoringFrame >= room_speed * 1.25)sickPosY = lerp(sickPosY,0,0.1)
if(scoringFrame >= room_speed * 1.5)squarePosY = lerp(squarePosY,0,0.1)
if(scoringFrame >= room_speed * 1.75)missPosY = lerp(missPosY,0,0.1)
if(scoringFrame >= room_speed * 2.25)totalPosY = lerp(totalPosY,0,0.1)
if(scoringFrame >= room_speed * 3)
{
	totalRankAlpha = lerp(totalRankAlpha,1,0.1)
	totalRankSize = lerp(totalRankSize,4,0.1)
}
if(scoringFrame >= room_speed * 4)erPosY = lerp(erPosY,0,0.1)
if(scoringFrame >= room_speed * 4.75)
{
	erRankAlpha = lerp(erRankAlpha,1,0.1)
	erRankSize = lerp(erRankSize,4,0.1)
}
if(scoringFrame >= room_speed * 5.75)hpBonusPosY = lerp(hpBonusPosY,0,0.1)
if(scoringFrame >= room_speed * 7)
{
	tsAlpha = lerp(tsAlpha,1,0.1)
	tsSize = lerp(tsSize,2,0.1)
}


scoringFrame ++