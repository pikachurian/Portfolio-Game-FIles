/// @description Insert description here
// You can write your code in this editor
size = 4
sizeLerpA = 0.1
on = false

ispd = image_speed

function On()
{
	//When the button is highlight in a selection or 
	//by the mouse cursor
	size = lerp(size,5,sizeLerpA)
	on = true
	
	image_speed = ispd
	image_blend = c_white
}

function Select()
{
	//This function triggers when the menu item is
	//selected/clicked
}