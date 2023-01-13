/// @description Insert description here
// You can write your code in this editor
var _yOff = 32
lane[0][LInfo.yPos] = 720 - 46 + _yOff
lane[0][LInfo.pSize] = 0.06
lane[1][LInfo.yPos] = 720 - 46*2 + _yOff
lane[1][LInfo.pSize] = 0.04
lane[2][LInfo.yPos] = 720 - 46*3 + _yOff
lane[2][LInfo.pSize] = 0.02
lane[3][LInfo.yPos] = 720 - 46*4 + _yOff
lane[3][LInfo.pSize] = 0
lane[4][LInfo.yPos] = 720 - 46*5 + _yOff
lane[4][LInfo.pSize] = -0.02
lane[5][LInfo.yPos] = 720 - 46*6 + _yOff
lane[5][LInfo.pSize] = -0.04
lane[6][LInfo.yPos] = 720 - 46*7 + _yOff
lane[6][LInfo.pSize] = -0.06

function DrawHitLine()
{
	draw_set_alpha(0.5)
	draw_set_color(c_black)
	draw_line_width(
	obj_player.noteHitX,
	0,//lane[6][LInfo.yPos]-32,
	obj_player.noteHitX,
	room_height,
	16
	)
	ResetDrawStuff()
}

function DrawLanes()
{
	draw_set_color(c_white)
	for(var i=0;i<array_length(lane);i++)
	{
		if(i == 1 || i == 5)draw_set_color(c_white)
		else draw_set_color(c_red)
		var _y = lane[i][LInfo.yPos]
		if(i != 3)draw_line(0,_y,1920,_y)
	}
}

function DrawLanes2(_color, _width, _alpha)
{
	draw_set_color(c_white)
	draw_set_alpha(_alpha)
	for(var i=0;i<array_length(lane);i++)
	{
		if(i == 1 || i == 5)draw_set_color(c_white)
		else draw_set_color(_color)
		var _y = lane[i][LInfo.yPos]
		if(i != 3 && i != 1 && i != 5)draw_line_width(0,_y,1920,_y,_width)
	}
	draw_set_alpha(1)
}