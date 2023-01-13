/// @description Insert description here
// You can write your code in this editor
SetImageScale(2)
input = obj_input

cam = view_camera[0]
camX = 0
camY = 0
camW = 0
camH = 0

UpdateCameraVariables(cam)

//Determines the angle of the board goes from 0, pointing up, to 1, pointing down
boardAngle = 0.5

rotSpdUp = 0.015//0.0085
rotSpdDown = 0.01

iMaxAngle = 20//45
iMinAngle = -45

fallSpdMin = 0.5
fallSpdMax = 2

yMax = camY + 360//camY + 140