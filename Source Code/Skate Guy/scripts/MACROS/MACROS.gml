// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MACROS(){

}

enum PS 
{
	start,
	active,
	dead,
	menu
}

enum OP
{
	play,
	quit,
	fullscreen
}

function UpdateCameraVariables(cam)
{
	camX = camera_get_view_x(cam)
	camY = camera_get_view_y(cam)
	
	camW = camera_get_view_width(cam)
	camH = camera_get_view_height(cam)
}

function SetImageScale(scale)
{
	image_xscale = scale
	image_yscale = scale
}