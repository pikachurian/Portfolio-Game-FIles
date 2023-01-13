/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_fade_inout))exit

var _selectP = keyboard_check_pressed(vk_enter)

switch(state)
{
	case TitleMenu.start:
	{
		if(_selectP)
		{
			state = TitleMenu.main
			audio_play_sound(sfx_pickup,50,false)
		}
	}break
	
	case TitleMenu.main:
	{
		var _mDir = -keyboard_check_pressed(ord("W")) + keyboard_check_pressed(ord("S"))

		//if(menu[menuOn,menuItemOn+_mDir] == 0 ||menu[menuOn,menuItemOn+_mDir] == -4 || menu[menuOn,menuItemOn+_mDir] == -1)
		menuOn += _mDir
		if(menuOn >= array_length(menu))menuOn = 0
		if(menuOn < 0)menuOn = array_length(menu)-1
		
		if(_selectP)
		{
			switch(menuOn)
			{
				case 0: 
				{
					audio_play_sound(sfx_pickup,50,false)
					//room_goto(rm_level_1)
					room_goto_fade(rm_level_1,false,0.05)
					//with(instance_create_depth(0,0)
					audio_play_sound(sng_1,51,false)
				}break
				
				case 1:
				{
					audio_play_sound(sfx_pickup,50,false)
					state = TitleMenu.help
				}break
				
				case 2:
				{
					audio_play_sound(sfx_pickup,50,false)
					state = TitleMenu.credits
				}break
			}
		}
	}break
	
	case TitleMenu.help:
	{
		if(_selectP)
		{
			state = TitleMenu.main
			audio_play_sound(sfx_pickup,50,false)
		}
	}break
	
	case TitleMenu.credits:
	{
		if(_selectP)
		{
			state = TitleMenu.main
			audio_play_sound(sfx_pickup,50,false)
		}
	}break
}