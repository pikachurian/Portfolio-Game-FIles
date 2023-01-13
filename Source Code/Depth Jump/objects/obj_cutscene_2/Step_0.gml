/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x,y,obj_player) && obj_player.state = "active")
{
	//global.cutscene_2 = true	
	//instance_destroy()
	obj_player.state = "cutscene1"
	obj_player.cutscene_1_time = 17.5//18//20//14
	//obj_player.sprite_index = spr_player_idle
	obj_player.move = 0
	obj_player.last_dir = 1
	obj_player.sprite_index = spr_player_idle
}