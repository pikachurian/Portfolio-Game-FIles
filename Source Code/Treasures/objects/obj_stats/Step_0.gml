/// @description Insert description here
// You can write your code in this editor
if(room = rm_gameover)
{
	//sprite_index = noone
	if(keyboard_check_pressed(vk_enter))game_restart()
	audio_pause_all()
}else	if(room = rm_victory)
{
	//sprite_index = noone
	//audio_pause_all()
	if(keyboard_check_pressed(vk_enter))game_restart()
}else	if(room = rm_title)
{
	/*if(keyboard_check_pressed(vk_enter))
	{
		audio_play_sound(sng_1,50,true)
		//room_goto(rm_level_test)
		image_speed = ispd
	}*/
}else sprite_index = noone