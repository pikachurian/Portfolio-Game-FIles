/// @description Insert description here
// You can write your code in this editor
input = obj_input

state = PS.active 
cam = view_camera[0]
camX = 0
camY = 0
camW = 0
camH = 0

zSpd = 4

//Lane stuff
myLane = 1
lane[1][LInfo.yPos] = 600
lane[1][LInfo.size] = 1.15

lane[2][LInfo.yPos] = 500
lane[2][LInfo.size] = 1

lane[3][LInfo.yPos] = 400
lane[3][LInfo.size] = 0.85

UpdateCameraVars(cam)

function MoveZCenter(_amount)
{
	var _pX = camX + camW/2
	var _pY = camY + camH/2
	var _dir = point_direction(x,y,_pX,_pY)
	
	var _xx = lengthdir_x(_amount,_dir)
	var _yy = lengthdir_y(_amount,_dir)
	
	x += _xx
	y += _yy
}