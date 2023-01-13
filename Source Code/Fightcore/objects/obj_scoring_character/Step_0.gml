/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case SC.idle:
		//
		sprite_index = spr_player_results_idle
		image_speed = ispd
		break;
		
	case SC.look:
		//
		if(sprite_index != spr_player_results_look)
		{
			sprite_index = spr_player_results_look
			image_speed = ispd
			image_index = 0
		}
		else if(sprite_index == spr_player_results_look && AnimationEnd())image_speed = 0
		break;
		
	case SC.think:
		//
		if(sprite_index != spr_player_results_think)
		{
			image_speed = ispd
			sprite_index = spr_player_results_think
		}else if(sprite_index == spr_player_results_think && AnimationEnd())image_speed = 0
		break;
		
	case SC.blink:
		//
		if(sprite_index != spr_player_results_closed)
		{
			image_speed = ispd
			sprite_index = spr_player_results_closed
		}else if(sprite_index == spr_player_results_closed && AnimationEnd())
		{
			//sprite_index = spr_player_results_cheer
			state = SC.cheer
			break;
		}
		break;
		
	case SC.cheer:
		//
		if(sprite_index != spr_player_results_cheer)
		{
			image_speed = ispd
			sprite_index = spr_player_results_cheer
		}else if(sprite_index == spr_player_results_cheer && AnimationEnd())
		{
			//state = SC.idle
			//sprite_index = spr_player_results_idle
			//show_debug_message("Goto idle")
		}
		break;
		
	case SC.dead:
		//
		if(sprite_index != spr_player_dead)
		{
			image_speed = 0
			sprite_index = spr_player_dead
		}
		break;
}