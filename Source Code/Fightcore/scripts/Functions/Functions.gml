// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Functions(){

}

function UpdateCameraVars(_cam)
{
	camX = camera_get_view_x(_cam)
	camY = camera_get_view_x(_cam)
	
	camW = camera_get_view_width(_cam)
	camH = camera_get_view_height(_cam)
}

function ResetDrawStuff()
{
	draw_set_color(c_white)
	draw_set_alpha(1)
	draw_set_halign(fa_left)
	draw_set_font(Font1)
}

function GlobalPlaySoundVolume(_sound, _baseVolume, _pitch, _priority, _loops)
{
	var _snd = audio_play_sound(_sound,_priority,_loops)
	audio_sound_gain(_snd,_baseVolume*obj_gm.gameSettings.sfxLevel,0)
	audio_sound_pitch(_snd, _pitch)
}

function AnimationEnd()
{
	/// @description animation_end(sprite_index,image_index, rate)
	/// @param {real} <sprite_index> The index of the sprite being animated
	/// @param {real} <image_index> The current frame value
	/// @param {real} <rate> -See Below-
	///		The rate of change in frames per step if not
	///		using built in image_index/image_speed.  
	///		Don't use if you don't think you need this.  You probably don't.

	//returns true if the animation will loop this step.

	//Script courtesy of PixellatedPope & Minty Python from the GameMaker subreddit discord 
	//https://www.reddit.com/r/gamemaker/wiki/discord

	var _sprite=sprite_index;
	var _image=image_index;
	if(argument_count > 0)	 _sprite=argument[0];
	if(argument_count > 1)	_image=argument[1];
	var _type=sprite_get_speed_type(sprite_index);
	var _spd=sprite_get_speed(sprite_index)*image_speed;
	if(_type == spritespeed_framespersecond)
		_spd = _spd/room_speed;
	if(argument_count > 2) _spd=argument[2];
	return _image+_spd >= sprite_get_number(_sprite);
}