/// @description Insert description here
// You can write your code in this editor
/*
if(target_point = 1)
{
	//if(point_distance(x+hspd,y+vspd,point_1_x,point_1_y) <= 12)
	
	#region PointCollisions
	
	if(place_meeting(x+hspd,y+vspd,target_1))
	{
		while(!place_meeting(x+sign(hspd),y+sign(vspd),target_1))	
		{
			if(!place_meeting(x+sign(hspd),y,target_1))
			{
				x += sign(hspd)	
			}
			
			if(!place_meeting(x,y+sign(vspd),target_1))
			{
				y += sign(hspd)	
			}
		}
		hspd = 0
		vspd = 0
		target_point = 2
	}
	#endregion
	
	x += hspd
	y += vspd
	exit;
	
}


if(target_point = 2)
{

	
	//if(point_distance(x+hspd,y+vspd,point_1_x,point_1_y) <= 12)
	#region PointCollisions
	if(place_meeting(x+hspd,y+vspd,target_2))
	{
		while(!place_meeting(x+sign(hspd),y+sign(vspd),target_2))	
		{
			if(!place_meeting(x+sign(hspd),y,target_2))
			{
				x += sign(hspd)	
			}
			
			if(!place_meeting(x,y+sign(vspd),target_2))
			{
				y += sign(hspd)	
			}
		}
		hspd = 0
		vspd = 0
		target_point = 1
	}
	#endregion
	
	
	x += hspd
	y += vspd
	exit;
	
}