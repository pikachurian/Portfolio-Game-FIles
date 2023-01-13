/// @description Insert description here
// You can write your code in this editor
UpdateCameraVariables(cam)



if(input.button)
{
	boardAngle -= rotSpdUp
	image_index = 0
}
else
{
	boardAngle += rotSpdDown
	image_index = 1
}

boardAngle = clamp(boardAngle,0,1)

var _fallSpd = lerp(fallSpdMin,fallSpdMax,boardAngle)
y += _fallSpd
y = min(y,yMax)