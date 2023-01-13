/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

image_speed = 0
image_alpha = 0

startX = x

function On()
{
	var _onLast = on
	on = true
	if(_onLast != on)x += 32
	//When the button is highlight in a selection or 
	//by the mouse cursor
	size = lerp(size,4.5,sizeLerpA)
	image_index = 1
}

function Select()
{
	//This function triggers when the menu item is
	//selected/clicked
	audio_stop_all()
	//room_restart()
	TransitionStart(rm_test,sq_fade_out,sq_fade_in)
}

function Off()
{
	on = false
}