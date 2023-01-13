/// @description Insert description here
// You can write your code in this editor
//MUSIC



if(state = "active")
#region
{
	move = -keyboard_check(ord("A")) + keyboard_check(ord("D"))
	jump = max(keyboard_check_pressed(ord("K")), keyboard_check_pressed(vk_space),0)
	jump_held = max(keyboard_check(ord("K")), keyboard_check(vk_space),0)
	dash_held = max(keyboard_check(ord("J")), keyboard_check(vk_rshift),0)
	
	if(plane = "foreground")wall = obj_wall_foreground
	if(plane = "background")wall = obj_wall_background
	
	if(place_meeting(x,y+1,spring) && jump && !place_meeting(x,y+1,obj_moving_platform))
	{
		vspd = 0
		if(plane = "foreground")vspd -= 16//32
		if(plane = "background")vspd -= 10//8//16
		
		if(plane = "foreground")state = "fore2back"
		if(plane = "background")state = "back2fore"
		last_dir = 1
		if(last_dir = 1 && sign(image_xscale) != 1)image_xscale = image_xscale * -1
		
		exit
	}
	
	if(dash_held)
	{
		//max_spd = 5
		max_spd = dash_max_spd
		
	}else
	{
		//max_spd = 3	
		max_spd = max_max_spd
	}
	
	
	if(move = 1 or move = -1)//if(!move = 0)
	{
		last_dir = move
		
		hspd += move * accel
		
		if(hspd > max_spd)hspd = max_spd
		if(hspd < -max_spd)hspd = -max_spd
	}else
	{
		//hspd -= move * drag
		if(hspd > 0)hspd -= drag
		if(hspd < 0)hspd += drag
	}
	
	//Jumping And Grav
	/*if(!place_meeting(x,y+1,wall))
	{
		vspd += grav	
	}else vspd = -jumpspeed * jump*/	
	if(canjump > 0 and jump)
	{
		vspd = -jumpspeed	
	}else vspd += grav
	
	canjump -= 1
	
	
	
	if(vspd < 0) && (!jump_held) vspd = max(vspd,-jumpspeed/2)
	
	var _hspd_final = hspd + hspd_carry
	hspd_carry = 0
	
	var _vspd_final = vspd + vspd_carry
	vspd_carry = 0
	
	//Collisions
	//X
	if(place_meeting(x+_hspd_final,y,wall))
	{
		while(!place_meeting(x+sign(_hspd_final),y,wall))x += sign(_hspd_final)	
		_hspd_final = 0
		hspd = 0
	}
	
	x += _hspd_final
	
	//Y
	if(place_meeting(x,y+vspd,wall))
	{
		while(!place_meeting(x,y+sign(vspd),wall))y += sign(vspd)	
		vspd = 0
		canjump = canjump_set
	}
	
	y += vspd
	
	//ANIMATIONS
	
	//image_xscale = image_xscale * last_dir
	//image_speed = 7
	
	//if(sign(image_xscale) != last_dir)image_xscale = image_xscale * last_dir
	
	if(last_dir = 1 && sign(image_xscale) != 1)image_xscale = image_xscale * -1
	if(last_dir = -1 && sign(image_xscale) != -1)image_xscale = image_xscale * -1
	
	if(image_speed = 0)image_speed = i_spd
	
	if(!place_meeting(x,y+1,wall))
	{
		sprite_index = spr_player_jump
		//image_xscale = image_xscale * last_dir
		//if(image_index = 4)image_speed = 0
		//else image_speed = 10
		//if(image_index = 3)
		//{
			image_speed = 0
			if(vspd > 0)image_index = 4
			else image_index = 2
		//}
		//else image_speed = i_spd
		exit
	}
	
	if(move = 1 or move = -1)
	{
		sprite_index = spr_player_walk
		//image_xscale = image_xscale * last_dir
		//image_speed = 6
		exit
	}else
	{
		if(last_dir = 1)sprite_index = spr_player_idle
		else sprite_index = spr_player_idle_left
		//image_xscale = image_xscale * last_dir
		//image_speed = 7
	}
	
	exit;
}
#endregion

if(state = "fore2back")
#region
{
	image_xscale -= scale_mod_2back//scale_mod
	if(image_xscale < scale_min)image_xscale = scale_min
	
	image_yscale -= scale_mod_2back//scale_mod
	if(image_yscale < scale_min)image_yscale = scale_min
	
	//depth = background_depth
	
	sprite_index = spr_player_jump
	image_index = 2
	image_speed = 0
	
	if(vspd < spring_vspd_max)vspd += grav
	if(vspd >= spring_vspd_max)vspd = spring_vspd_max
	
	//
	if(place_meeting(x,y+vspd,obj_wall_background)&& vspd > 0)
	{
		while(!place_meeting(x,y+sign(vspd),obj_wall_background))y+= sign(vspd)	
		
		vspd = 0
		
		depth = background_depth
		
		accel = accel_back
		max_spd = max_spd_back
		max_max_spd = max_max_spd_back
		jumpspeed = jumpspeed_back
		drag = drag_back
		grav = grav_back
		dash_max_spd = dash_max_spd_back
		canjump_set = canjump_set_back
		canjump = canjump_set
		spring = obj_spring_background
		hspd = 0
		image_speed = i_spd
		
		plane = "background"
		state = "active"
		exit;
	}
	
	y += vspd
}
#endregion

if(state = "back2fore")
#region
{
	image_xscale += scale_mod_2fore //scale_mod
	if(image_xscale > scale_max)image_xscale = scale_max
	
	image_yscale += scale_mod_2fore//scale_mod
	if(image_yscale > scale_max)image_yscale = scale_max
	
	//depth = background_depth
	
	sprite_index = spr_player_jump
	image_index = 1
	image_speed = 0
	
	//if(vspd > 0)grav = grav_fore
	
	if(vspd < spring_vspd_max)vspd += grav
	if(vspd >= spring_vspd_max)vspd = spring_vspd_max
	
	//if(vspd > 0)grav = grav_fore
	grav = grav_fore
	
	//
	if(place_meeting(x,y+vspd,obj_wall_foreground)&& vspd > 0)
	{
		while(!place_meeting(x,y+sign(vspd),obj_wall_foreground))y+= sign(vspd)	
		
		vspd = 0
		
		depth = foreground_depth
		
		accel = accel_fore
		max_spd = max_spd_fore
		max_max_spd = max_max_spd_fore
		jumpspeed = jumpspeed_fore
		drag = drag_fore
		//grav = grav_fore
		dash_max_spd = dash_max_spd_fore
		canjump_set = canjump_set_fore
		canjump = canjump_set
		spring = obj_spring_foreground
		hspd = 0
		image_speed = i_spd
		
		plane = "foreground"
		state = "active"
		exit;
	}
	
	y += vspd
}
#endregion