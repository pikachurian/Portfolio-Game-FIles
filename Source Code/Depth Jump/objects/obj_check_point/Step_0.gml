/// @description Insert description here
// You can write your code in this editor
if(checkpoint_on = true)
{
	sprite_index = spr_checkpoint_on	
}else 
{
	sprite_index = spr_checkpoint_off
	if(place_meeting(x,y,obj_player))audio_play_sound(sfx_coin_get,2,false)
}