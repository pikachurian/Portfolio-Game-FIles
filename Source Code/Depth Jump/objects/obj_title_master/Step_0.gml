/// @description Insert description here
// You can write your code in this editor
if(room = rm_pl)
{
	if(keyboard_check_pressed(vk_enter))
	{
		audio_play_sound(sfx_select,2,false)
		room_goto(rm_1_0)	
	}
}

if(room = rm_chap1)
{
	if(keyboard_check_pressed(vk_enter))
	{
		audio_play_sound(sfx_select,2,false)
		room_goto(rm_1_1)	
	}
}

if(room = rm_chap2)
{
	if(keyboard_check_pressed(vk_enter))
	{
		audio_play_sound(sfx_select,2,false)
		room_goto(rm_2_1)	
	}
}

if(room = rm_title)
{
	if(keyboard_check_pressed(vk_enter))
	{
		audio_play_sound(sfx_select,2,false)
		room_goto(rm_pl)	
	}
}

if(room = rm_end)
{
	if(keyboard_check_pressed(vk_alt))
	{
		audio_play_sound(sfx_select,2,false)
		
		game_restart()	
	}
}