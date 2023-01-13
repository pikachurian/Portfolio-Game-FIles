// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/*function Macros(){

}*/
#macro CELL_WIDTH 24
#macro CELL_HEIGHT 24
#macro FLOOR -5
#macro WALL -6
#macro VOID -7
#macro ENTRANCE -8
#macro EXIT -9
#macro SPIKETRAP -10
#macro TENT -11//HOUSE -11
#macro CAVE -12
#macro TREASURE_RARE_OPEN -13
#macro TREASURE_RARE_CLOSE -14
#macro TREASURE_UNCOMMON_OPEN -15
#macro TREASURE_UNCOMMON_CLOSE -16
#macro TREASURE_COMMON_OPEN -17
#macro TREASURE_COMMON_CLOSE -18
#macro ENEMY_MINION -19

#macro NORTH 1
#macro WEST 2
#macro EAST 4
#macro SOUTH 8

enum PlayerState
{
	active,
	dead,
	swing,
	clipping,
	attackHorizontal,
	
	enumCount
}

enum WhipTarget
{
	null,
	wall,
	enemy,
	
	enumCount
}

enum Interactable 
{
	treasureRare,
	treasureUncommon,
	treasureCommon,
	Entrance,
	Exit,
	
	enumCount
}

enum ItemInfo
{
	value,
	weight,
	icon,
	effect,
	
	enumCount
}

enum FloorInfo
{
	grid,
	hue,
	
	enumCount
}

/*enum TitleMain
{
	start,
	help,
	credits
}*/

enum TitleMenu
{
	start,
	main,
	help,
	credits,
	
	enumCount
}