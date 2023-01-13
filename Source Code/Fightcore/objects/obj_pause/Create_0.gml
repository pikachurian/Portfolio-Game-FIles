/// @description Insert description here
// You can write your code in this editor
cam = view_camera[0]

	camX = camera_get_view_x(cam)
	camY = camera_get_view_x(cam)
	
	camW = camera_get_view_width(cam)
	camH = camera_get_view_height(cam)
	
options[0] = "Restart"
options[1] = "Exit"

opOn = 0

depth = -room_height - 200

lerpPosX = 0
lerpPosXMax = room_width/2 - 128
lerpPosA = 0.1