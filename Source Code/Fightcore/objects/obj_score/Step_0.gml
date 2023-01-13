/// @description Insert description here
// You can write your code in this editor
UpdateCameraVars(view_camera[0])

//Fire Bar
if(fire >= 55)multiplier = 4
else if(fire >= 25)multiplier = 3
else if(fire >= 10)multiplier = 2
else multiplier = 1

//Rank
//var _notesHit = sickNotes + radNotes
if(combo >= rankNotes.rad && combo >= 1)
{
	if(rank != Rank.rad)SetRank(Rank.rad)
}else if(combo >= rankNotes.sick && combo >= 1)
{
	if(rank != Rank.sick)SetRank(Rank.sick)
}else if(combo >= rankNotes.ace && combo >= 1)
{
	if(rank != Rank.ace)SetRank(Rank.ace)
}else if(combo >= rankNotes.based && combo >= 1)
{
	if(rank != Rank.based)SetRank(Rank.based)
}else if(combo >= rankNotes.cool && combo >= 1)
{
	if(rank != Rank.cool)SetRank(Rank.cool)
}else if(combo >= rankNotes.dull && combo >= 1)
{
	if(rank != Rank.dull)SetRank(Rank.dull)
}else SetRank(Rank.none)