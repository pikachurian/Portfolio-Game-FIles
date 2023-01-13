/// @description Insert description here
// You can write your code in this editor
//if(instance_exists(obj_fade_inout))exit

function Damage(amount)
{
	if(hitInvinceTick <= 0 && state != PlayerState.dead)
	{
		os.hp = Approach(os.hp,0,amount)
		audio_play_sound(sfx_player_hurt,10,false)
		hitInvinceTick = hitInvinceTime
		
		if(os.hp <= 0)//room_goto(rm_gameover)
		{
			state = PlayerState.dead
			//room_goto_fade(rm_gameover,false,0.01)
			room_goto(rm_gameover)
		}
	}
}

var _iLeft = keyboard_check(ord("A"))
var _iRight = keyboard_check(ord("D"))
var _iUp = keyboard_check(ord("W"))
var _iDown = keyboard_check(ord("S"))
var _iJump = keyboard_check(vk_space)
var _iJumpP = keyboard_check_pressed(vk_space)
var _iRopeP = keyboard_check_pressed(ord("J"))
var _iAttackP = keyboard_check_pressed(ord("K"))
var _iActP = keyboard_check_pressed(ord("E"))

hitInvinceTick = Approach(hitInvinceTick,0,1)

if(keyboard_check_pressed(ord("F")))drawFps = -drawFps

switch(state)
{
	case PlayerState.active:
	{
		//if(instance_exists(obj_fade_inout))break
		//hitInvinceTick = Approach(hitInvinceTick,0,1)
		
		//if(keyboard_check_pressed(vk_enter))//Damage(1)
		
		//spd = Approach(spd,2,0.5)
		
		//var _bbox_side
		
		//Horizontal Movement
		var _hDir = -_iLeft + _iRight
		//vspd = -keyboard_check(ord("W")) + keyboard_check(ord("S"))
		hspd += _hDir * accel
		//vspd *= spd
		
		if(_hDir = 0)
		{
			var _hFriction = hFrictionGround
			if(!grounded) _hFriction = hFrictionAir
			hspd = Approach(hspd,0,_hFriction)
		}
		hspd = clamp(hspd,-spd,spd)

		//Vertical Movement
		var _vDir = -_iUp + _iDown
		
		coyoteTick = Approach(coyoteTick,0,1)

		if(place_meeting(x,y+1,obj_wall))
		{
			grounded = true
			coyoteTick = coyoteTime
			jumps = 1
		}else
		{
			grounded = false
			vspd = min(vspd+grav,vspdMax)
		}
		
		if(coyoteTick>0 && _iJumpP && jumps > 0) 
		{
			vspd = -jspd
			jumps -= 1
		}
		
		//Interactable
		actTarget = instance_nearest(x,y,obj_interactable_parent)
		if(point_distance(x,y,actTarget.x,actTarget.y) <= interactRange)
		{
			if(_iActP)
			{
				switch(actTarget.actId)
				{
					case Interactable.treasureCommon:	with(actTarget)ActEvent()
					break
					
					case Interactable.treasureUncommon:	with(actTarget)ActEvent()
					break
					
					case Interactable.treasureRare:	with(actTarget)ActEvent()
					break
					
					case Interactable.Exit: with(actTarget)ActEvent()
					break
					
					case Interactable.Entrance: with(actTarget)ActEvent()
					break
				}
			}
		}
		
		#region Attack
		if(_iAttackP)
		{
			state = PlayerState.attackHorizontal
			audio_play_sound(sfx_player_attack,8,false)
		}
		#endregion
	
		//Rope swing
		#region
		//if(mouse_check_button_pressed(mb_left))
		//if(keyboard_check_pressed(ord("J")))
		ropeCd = max(ropeCd - 1,0)
		if(_iRopeP && ropeCd <= 0)
		{
			var _ropeLaunchAngle = point_direction(x,y,x+_hDir,y+_vDir)
			if(_ropeLaunchAngle >= 44 && _ropeLaunchAngle <= 134)
			{
				ropeRange = ropeRangeV
				ropeCd = ropeCdV
			}
			else 
			{
				ropeRange  = ropeRangeH
				ropeCd = ropeCdH
			}			
			
			//var _ropeTarget = collision_line_first(x,y,x+lengthdir_x(ropeRange,_ropeLaunchAngle),y+lengthdir_y(ropeRange,_ropeLaunchAngle),obj_wall,false,true)
			ropeTarget = collision_line_first(x,y,x+lengthdir_x(ropeRange,_ropeLaunchAngle),y+lengthdir_y(ropeRange,_ropeLaunchAngle),obj_wall,false,true)
			if(ropeTarget != noone)
			{
				if(ropeTarget.whipId = WhipTarget.wall && ropeTarget.y < y)
				{
					audio_play_sound(sfx_grapple,30,false)
					//with(_ropeTarget)y = 0
					grappleX = ropeTarget.x+11//mouse_x
					grappleY = ropeTarget.y+11//mouse_y
					ropeX = x
					ropeY = y
					ropeAngleVelocity = 0
					ropeAngle = point_direction(grappleX,grappleY,x,y)
					ropeLength = point_distance(grappleX,grappleY,x,y)
					state = PlayerState.swing
					ropeRetractDir = 0
				}
			}
		}
		#endregion

		//sprite_index = spr_player_idle_0
		//if(sign(hspd) != 0)image_xscale = sign(hspd)
	}break;
	
	case PlayerState.swing:
	{
		var _ropeAngleAccel = -0.2 * dcos(ropeAngle)
		var _hDir = -_iLeft + _iRight//-keyboard_check(ord("A")) + keyboard_check(ord("D"))
		var _vDir = -_iUp + _iDown//-keyboard_check(ord("W")) + keyboard_check(ord("S"))
		
		//if(mouse_check_button_pressed(mb_left))ropeRetractDir = 1
		if(_iRopeP)
		{
			ropeRetractDir = 1
			audio_play_sound(sfx_zip,30,false)
		}
		
		ropeRetractVelocity += ropeRetractAccel * ropeRetractDir
		//if(!place_meeting(x,y+1,obj_wall))ropeLength += _vDir * ropeRetractSpd
		if(_vDir = 1 && !place_meeting(x,y+2,obj_wall))ropeLength += _vDir * ropeRetractSpd
		else if(_vDir = -1 && !place_meeting(x,y-2,obj_wall))ropeLength += _vDir * ropeRetractSpd
		
		ropeLength = clamp(ropeLength,12,ropeRange)
		ropeLength = max(ropeLength - ropeRetractVelocity, 5)
		
		ropeAngleVelocity += _ropeAngleAccel + ropeSwingSpd * _hDir
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
		}else if(_iJumpP)
		{
			state = PlayerState.active
			vspd_fraction = 0
			vspd = -jspd
			//hspd += ropeAngleVelocity * 10
			//spd = 10
			ropeRetractDir = 0
			ropeRetractVelocity = 0
		}
		
		//sprite_index = spr_player_swing_0
		//image_xscale = sign(_ropeAngleAccel)
	}break
		
	case PlayerState.clipping:
	{
		for(var _i = 0;_i<51;_i++)
		{
			if(!place_meeting(x+_i,y,obj_wall) || !place_meeting(x-_i,y,obj_wall))
			{
				hspd = sign(_i)
				break
			}
			
		}
		
		//while(place_meeting(x,y,obj_wall)) x += hspd
		repeat(50)
		{
			if(!place_meeting(x,y,obj_wall))break
			else	x += hspd
		}
		
		for(var _i = 0;_i<51;_i++)
		{
			if(!place_meeting(x,y+_i,obj_wall) || !place_meeting(x,y-_i,obj_wall))
			{
				vspd = sign(_i)
				break
			}
		}
		
		//while(place_meeting(x,y,obj_wall)) y += vspd
		repeat(50)
		{
			if(!place_meeting(x,y,obj_wall))break
			else	y += vspd
		}
		
		hspd = 0
		vspd = 0
		state = lastState
	}break
		
	case PlayerState.attackHorizontal:
	{
		var _hDir = -_iLeft + _iRight//-keyboard_check(ord("A")) + keyboard_check(ord("D"))
		//vspd = -keyboard_check(ord("W")) + keyboard_check(ord("S"))
		hspd += _hDir * accel
		//vspd *= spd
		//vspd
		
		if(_hDir = 0)
		{
			var _hFriction = hFrictionGround
			if(!grounded) _hFriction = hFrictionAir
			hspd = Approach(hspd,0,_hFriction)
		}
		hspd = clamp(hspd,-spd,spd)
		
		if(place_meeting(x,y+1,obj_wall))
		{
			grounded = true
			coyoteTick = coyoteTime
			jumps = 1
		}else
		{
			grounded = false
			vspd = min(vspd+grav,vspdMax)
		}
		
		//Start of attack
		if(sprite_index != spr_player_attackh)
		{
			sprite_index = spr_player_attackh
			image_index = 0
			ds_list_clear(hitByAttack)
		}
		//Use Attack Hitbox & Check for Hits
		image_xscale = spriteDir
		mask_index = spr_player_attackh_hbox_right
		//if(spriteDir = 1)mask_index = spr_player_attackh_hbox_right
		//else mask_index = spr_player_attackh_hbox_left
		
		var _hitByAttackNow = ds_list_create()
		var _hits = instance_place_list(x,y,obj_enemy_parent,_hitByAttackNow,false)
		if(_hits > 0)
		{
			for(var i = 0; i < _hits; i++)
			{
				//If this instance has not yet been hit by this attack
				var _hitId = _hitByAttackNow[| i];
				if(ds_list_find_index(hitByAttack,_hitId) == -1)
				{
					ds_list_add(hitByAttack,_hitId)
					with(_hitId)
					{
						EnemyAttacked(other.x,other.attackHDamage,other.attackHKnockback);
						//audio_play_sound(sfx_enemy_hurt,11,false)
						//instance_destroy()
					}
				}
			}
		}
		ds_list_destroy(_hitByAttackNow)
		mask_index = spr_player_idle_0
		
		if(animation_end_2())
		{
			sprite_index = spr_player_idle_0
			state = PlayerState.active
		}
		
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
#region tileCollision X
/*
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
*/
#endregion

//Object Collision
if(place_meeting(x+hspd,y,obj_wall))
{
	var _collisionDir = sign(hspd)
	
	while(!place_meeting(x+sign(hspd),y,obj_wall))x += sign(hspd)
	
	//while(place_meeting(x,y,obj_wall))x -= sign(hspd)
	
	hspd = 0
	
	if(state = PlayerState.swing)
	{
		//if(_collisionDir = 1 && sign(ropeAngleVelocity) = 1) || (_collisionDir = -1 && sign(ropeAngleVelocity) = -1)
		ropeAngle = point_direction(grappleX,grappleY,x,y)
		ropeAngleVelocity = 0//-_collisionDir// * 2
		ropeX = x
		ropeY = y
		if(ropeRetractDir != 0)
		{
			//if(_collisionDir = 1 && grappleX>x) || (_collisionDir = -1 && grappleX<x)
			//{
				state = PlayerState.active
				//hspd = -_collisionDir
				#region
				//vspd_fraction = 0
				//vspd = -jspd
				//hspd += ropeAngleVelocity * 10
				//spd = 10
				#endregion
			
				ropeRetractDir = 0
				ropeRetractVelocity = 0
				
				hspd = -_collisionDir
				hspd_fraction = 0
			//}
		}
	}
}

x += hspd

//Vertical Collision
#region TileCollision
/*
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
*/
#endregion
//Object Collision
if(place_meeting(x,y+vspd,obj_wall))
{
	var _collisionDir = sign(vspd)
	while(!place_meeting(x,y+sign(vspd),obj_wall))y += sign(vspd)
	//while(place_meeting(x,y,obj_wall))y -= sign(vspd)
	
	if(_collisionDir = 1 && vspd >= vspdMax)Damage(1)
	
	vspd = 0
	
	if(state = PlayerState.swing)
	{
		//if(_collisionDir = 1 && sign(ropeAngleVelocity) = 1) || (_collisionDir = -1 && sign(ropeAngleVelocity) = -1)
		ropeAngle = point_direction(grappleX,grappleY,x,y)
		ropeAngleVelocity = 0//-_collisionDir //* 2
		ropeX = x
		ropeY = y
		if(ropeRetractDir != 0) //&& ropeY>y)
		{
			//if(_collisionDir = 1 && grappleY>y) || (_collisionDir = -1 && grappleY<y)
			//{
				state = PlayerState.active
				//vspd = -_collisionDir
				#region
				//vspd_fraction = 0
				//vspd = -jspd
				//hspd += ropeAngleVelocity * 10
				//spd = 10
				#endregion
			
				ropeRetractDir = 0
				ropeRetractVelocity = 0
				
				vspd = -_collisionDir
				vspd_fraction = 0
			//}
		}
	}
}
y += vspd

if(place_meeting(x,y,obj_wall))
{
	lastState = state
	state = PlayerState.clipping
	hspd = 0 
	vspd = 0
}
#endregion