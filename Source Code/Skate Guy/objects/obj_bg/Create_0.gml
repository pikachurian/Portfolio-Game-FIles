/// @description Insert description here
// You can write your code in this editor
cam = view_camera[0]
camX = 0
camY = 0
camW = 0
camH = 0
UpdateCameraVariables(cam)

bg1 = {
	xx : camX+(320-210),
	yy : (camY+camH*2.25),
	scrollSpd : 1,
	startScrollSpd : 1
}

bg2 = {
	xx : camX+(320-210),
	yy : (camY+camH*1.5),
	scrollSpd : 0.5,
	startScrollSpd : 0.5
}


SetImageScale(2)

image_speed = 0

scrollSpd = 1
scrollSpdAccel = 0.25

scrollSpdTime = 10 * room_speed
scrollSpdTick = scrollSpdTime

function StartGame()
{
	bg1.scrollSpd = bg1.startScrollSpd
	bg2.scrollSpd = bg2.startScrollSpd
}
