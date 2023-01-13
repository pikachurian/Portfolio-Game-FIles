/// @description Insert description here
// You can write your code in this editor
lane[0][LInfo.yPos] = 720 - 52
lane[0][LInfo.pSize] = 0.06
lane[1][LInfo.yPos] = 720 - 52*2
lane[1][LInfo.pSize] = 0.04
lane[2][LInfo.yPos] = 720 - 52*3
lane[2][LInfo.pSize] = 0.02
lane[3][LInfo.yPos] = 720 - 52*4
lane[3][LInfo.pSize] = 0
lane[4][LInfo.yPos] = 720 - 52*5
lane[4][LInfo.pSize] = -0.02
lane[5][LInfo.yPos] = 720 - 52*6
lane[5][LInfo.pSize] = -0.04
lane[6][LInfo.yPos] = 720 - 52*7
lane[6][LInfo.pSize] = -0.06



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