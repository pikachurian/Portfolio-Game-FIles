/// @description Insert description here
// You can write your code in this editor

switch(state)
{
	case PlayerState.active:
	{
		//spd = Approach(spd,2,0.5)
		
		var _bbox_side

		var _dir = -keyboard_check(ord("A")) + keyboard_check(ord("D"))
		//vspd = -keyboard_check(ord("W")) + keyboard_check(ord("S"))
		hspd += _dir * accel
		//vspd *= spd
		
		if(_dir = 0)
		{
			var _hFriction = hFrictionGround
			if(!grounded) _hFriction = hFrictionAir
			hspd = Approach(hspd,0,_hFriction)
		}
		hspd = clamp(hspd,-spd,spd)

		coyoteTick = Approach(coyoteTick,0,1)

		if(tilemap_get_at_pixel(tmCollision,bbox_left,bbox_bottom+1) != 0) || (tilemap_get_at_pixel(tmCollision,bbox_right,bbox_bottom+1) != 0)
		{
			grounded = true
			coyoteTick = coyoteTime
			jumps = 1
		}else
		{
			grounded = false
			vspd = min(vspd+grav,vspdMax)
		}
		
		if(coyoteTick>0 && keyboard_check_pressed(vk_space) && jumps > 0) 
		{
			vspd = -jspd
			jumps -= 1
		}
	
		//if(mouse_check_button_pressed(mb_left))
		//if(keyboard_check_pressed(ord("J")))
		if(keyboard_check_pressed(ord("J")))
		{
			
			
			grappleX = mouse_x
			grappleY = mouse_y
			ropeX = x
			ropeY = y
			ropeAngleVelocity = 0
			ropeAngle = point_direction(grappleX,grappleY,x,y)
			ropeLength = point_distance(grappleX,grappleY,x,y)
			state = PlayerState.swing
			ropeRetractDir = 0
		}

		sprite_index = spr_player_idle_0
		if(sign(hspd) != 0)image_xscale = sign(hspd)
	}break;
	
	case PlayerState.swing:
	{
		var _ropeAngleAccel = -0.2 * dcos(ropeAngle)
		
		if(mouse_check_button_pressed(mb_left))ropeRetractDir = 1
		
		ropeRetractVelocity += ropeRetractAccel * ropeRetractDir
		ropeLength = max(ropeLength - ropeRetractVelocity, 5)
		
		ropeAngleVelocity += _ropeAngleAccel
		ropeAngle += ropeAngleVelocity
		ropeAngleVelocity *= 0.99
		
		ropeX = grappleX + lengthdir_x(ropeLength, ropeAngle)
		ropeY = grappleY + lengthdir_y(ropeLength, ropeAngle)
		
		hspd = ropeX - x
		vspd = ropeY - y 
		
		if(ropeLength = 5)
		{
			state = PlayerState.active
			vspd_fraction = 0
			hspd_fraction = 0
			//hspd = 10*grappleX - x
			//vspd = 10*grappleY - y
			vspd = -jspd
			ropeRetractDir = 0
			ropeRetractVelocity = 0
		}else if(keyboard_check_pressed(vk_space))
		{
			state = PlayerState.active
			vspd_fraction = 0
			vspd = -jspd
			//hspd += ropeAngleVelocity * 10
			//spd = 10
			ropeRetractDir = 0
			ropeRetractVelocity = 0
		}
		
		sprite_index = spr_player_swing_0
		image_xscale = sign(_ropeAngleAccel)
	}break
}

hspd += hspd_fraction
vspd += vspd_fraction

hspd_fraction = hspd - (floor(abs(hspd))) * sign(hspd)
hspd -= hspd_fraction
vspd_fraction = vspd - (floor(abs(vspd))) * sign(vspd)
vspd -= vspd_fraction



#region Collision
//Horizontal Collision
if(hspd > 0)_bbox_side = bbox_right
	else _bbox_side = bbox_left
if(tilemap_get_at_pixel(tmCollision,_bbox_side+hspd,bbox_top) != 0) || (tilemap_get_at_pixel(tmCollision,_bbox_side+hspd,bbox_bottom) != 0)
{
	var _collisionDir = sign(hspd)
	if(hspd>0) x = x - (x mod 24) + 23 - (bbox_right-x)
		else x = x - (x mod 24) - (bbox_left-x)
	hspd = 0
	if(state = PlayerState.swing)
	{
		ropeAngle = point_direction(grappleX,grappleY,x,y)
		ropeAngleVelocity = -_collisionDir// * 2
		if(ropeRetractDir != 0)
		{
			//state = PlayerState.active
			//vspd_fraction = 0
			//vspd = -jspd
			//hspd += ropeAngleVelocity * 10
			//spd = 10
			//ropeRetractDir = 0
			//ropeRetractVelocity = 0
		}
	}
}
x += hspd

//Vertical Collision
if(vspd > 0)_bbox_side = bbox_bottom
	else _bbox_side = bbox_top
if(tilemap_get_at_pixel(tmCollision,bbox_left,_bbox_side+vspd) != 0) || (tilemap_get_at_pixel(tmCollision,bbox_right,_bbox_side+vspd) != 0)
{
	var _collisionDir = sign(vspd)
	if(vspd>0) y = y - (y mod 24) + 23 - (bbox_bottom-y)
		else y = y - (y mod 24) - (bbox_top-y)
	vspd = 0
	if(state = PlayerState.swing)
	{
		ropeAngle = point_direction(grappleX,grappleY,x,y)
		ropeAngleVelocity = -_collisionDir //* 2
				if(ropeRetractDir != 0)
		{
			state = PlayerState.active
			//vspd_fraction = 0
			//vspd = -jspd
			//hspd += ropeAngleVelocity * 10
			//spd = 10
			ropeRetractDir = 0
			ropeRetractVelocity = 0
		}
	}
}
y += vspd
#endregion