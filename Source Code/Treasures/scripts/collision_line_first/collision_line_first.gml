// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function collision_line_first(x1,y1,x2,y2,object,prec,notme){
	/// @desc collision_line_first(x1,y1,x2,y2,object,prec,notme)

	var sx,sy,inst,i
	
	sx = x2 - x1
	sy = y2 - y1
	inst = collision_line(x1,y1,x2,y2,object,prec,notme)
	if(inst != noone)
	{
		while((abs(sx) >= 1) || (abs(sy) >= 1))
		{
			sx /= 2
			sy /= 2
			i = collision_line(x1,y1,x2,y2,object,prec,notme)
			if(i)
			{
				x2 -= sx
				y2 -= sy
				inst = i
			}else
			{
				x2 += sx
				y2 += sy
			}
		}
	}
	return inst;
}