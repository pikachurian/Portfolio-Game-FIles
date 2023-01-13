/// @description Insert description here
// You can write your code in this editor
if(target_point = 1)
{
	if(target_1.x > x)hspd = spd
	if(target_1.x < x)hspd = -spd
	if(target_1.x = x)hspd = 0
	
	if(target_1.y> y)vspd = spd
	if(target_1.y < y)vspd = -spd
	if(target_1.y = y)vspd = 0
	
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
	
	//if(place_meeting(x,y-1,obj_player) or place_meeting(x+sign(hspd),y,obj_player))
	if(place_meeting(x,y-1,obj_player)&& !place_meeting(x,y,obj_player))
	{
		obj_player.hspd_carry = hspd	
		obj_player.vspd_carry = vspd	
	}
	
	/*if(place_meeting(x+sign(hspd),y,obj_player))
	{
		obj_player.hspd_carry = hspd
	}*/
	
	x += hspd
	y += vspd
	exit;
	
}


if(target_point = 2)
{
	if(target_2.x > x)hspd = spd
	if(target_2.x < x)hspd = -spd
	if(target_2.x = x)hspd = 0
	
	if(target_2.y> y)vspd = spd
	if(target_2.y < y)vspd = -spd
	if(target_2.y = y)vspd = 0
	
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
	
	//Player_collisions
	
	//if(place_meeting(x,y-1,obj_player) or place_meeting(x+sign(hspd),y,obj_player))
	if(place_meeting(x,y-1,obj_player)&& !place_meeting(x,y,obj_player))
	{
		obj_player.hspd_carry = hspd	
		obj_player.vspd_carry = vspd	
	}
	
	/*if(place_meeting(x+sign(hspd),y,obj_player))
	{
		obj_player.hspd_carry = hspd
	}*/
	
	x += hspd
	y += vspd
	exit;
	
}