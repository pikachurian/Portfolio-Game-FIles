/// @description Insert description here
// You can write your code in this editor
if(position_meeting(mouse_x,mouse_y,id) && mouse_check_button_pressed(mb_left))
{
	isMouseOver = true
	if(clickedFunction != noone)
	{
		if(cfArgs != noone)clickedFunction(cfArgs)
		else clickedFunction()
	}
}else if(position_meeting(mouse_x,mouse_y,id))
{
	isMouseOver = true
}else isMouseOver = false