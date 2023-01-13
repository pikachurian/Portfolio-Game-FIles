/// @description Insert description here
// You can write your code in this editor
//draw_self()

if(state = PlayerState.active)
{
	//spriteDir = 1
	
	//sprite_index = spr_player_idle_0
	if(sign(hspd) != 0)
	{
		spriteDir = sign(hspd)
		sprite_index = spr_player_walk_0
	}else sprite_index = spr_player_idle_0
	draw_sprite_ext(sprite_index,image_index,x,y,spriteDir,1,0,c_white,1)
	
	/*if(point_distance(x,y,actTarget.x,actTarget.y) <= interactRange)
	{
		draw_sprite(spr_e_0,0,x,y-16)
	}*/
	
}else if(state = PlayerState.swing)
{
	//draw_sprite_part(spr_whip_0,0,3,0,3,3,ropeX-lengthdir_x(_i*3,ropeAngle),ropeY-lengthdir_y(_i*3,ropeAngle))
	//draw_line_width(grappleX,grappleY,ropeX,ropeY,2)
	var _ropeSegments = ropeLength div 3
	for(var _i = 1;_i<_ropeSegments;_i++)
	{
		
		if(_i >= 1 && _i <= 2) draw_sprite_general(spr_whip_2,0,0,0,3,3,ropeX-lengthdir_x(_i*3,ropeAngle),ropeY-lengthdir_y(_i*3,ropeAngle),-1,1,ropeAngle,c_white,c_white,c_white,c_white,1)
		else
		if(_i = 3)draw_sprite_general(spr_whip_2,0,3,0,3,3,ropeX-lengthdir_x(_i*3,ropeAngle),ropeY-lengthdir_y(_i*3,ropeAngle),-1,1,ropeAngle,c_white,c_white,c_white,c_white,1)
		else
		if(_i = 4) draw_sprite_general(spr_whip_0,0,0,0,3,3,ropeX-lengthdir_x(_i*3,ropeAngle),ropeY-lengthdir_y(_i*3,ropeAngle),-1,1,ropeAngle,c_white,c_white,c_white,c_white,1)
		else
		if(_i = _ropeSegments-1) draw_sprite_general(spr_whip_0,0,6,0,3,3,ropeX-lengthdir_x(_i*3,ropeAngle),ropeY-lengthdir_y(_i*3,ropeAngle),-1,1,ropeAngle,c_white,c_white,c_white,c_white,1)
		else draw_sprite_general(spr_whip_0,0,3,0,3,3,ropeX-lengthdir_x(_i*3,ropeAngle),ropeY-lengthdir_y(_i*3,ropeAngle),-1,1,ropeAngle,c_white,c_white,c_white,c_white,1)
		
		//if(place_meeting(ropeX-lengthdir_x(_i*1.5,ropeAngle),ropeY-lengthdir_y(_i*1.5,ropeAngle),obj_wall))break
		
		//draw_sprite_part(spr_whip_0,0,0,0,3,3,ropeX-lengthdir_x(_i*3,ropeAngle),ropeY-lengthdir_y(_i*3,ropeAngle))
	}
	
	//draw_text(8,8,string(_ropeSegments))
	
	sprite_index = spr_player_swing_0
	//image_xscale = sign(_ropeAngleAccel)
	if(sign(ropeAngleVelocity) != 0)spriteDir = sign(ropeAngleVelocity)
	draw_sprite_ext(sprite_index,image_index,x,y,spriteDir,1,0,c_white,1)
}else if(state = PlayerState.clipping)
{
	draw_sprite_ext(sprite_index,image_index,x,y,sign(hspd),1,0,c_white,1)
}else if(state = PlayerState.attackHorizontal)
{
	draw_sprite_ext(sprite_index,image_index,x,y,spriteDir,1,0,c_white,1)
	//draw_self()
}else if(state == PlayerState.dead)
{
	draw_self()
}

if(hitInvinceTick > 0)
{
	shader_set(sh_flash)
	draw_sprite_ext(sprite_index,image_index,x,y,spriteDir,1,0,c_white,1)
	shader_reset()
}

//draw_set_color(c_white)
//draw_self()
//draw_text(8,16,"X"+string(x))
//draw_text(8,24,"Y"+string(y))
//draw_text(8,32,"GX"+string(grappleX))
//draw_text(8,40,"GY"+string(grappleY))
///draw_text(8,48,"Len"+string(ropeLength))

//if(ropeTarget != -4)draw_text(8,32,"Target"+string(ropeTarget.id))

//draw_line(x,y,x+sign(hspd)*10,y+sign(vspd)*10)
////draw_text(8,32,"State"+string(state))

//draw_text(x-16,y-24,"HP: "+string(os.hp))
//draw_text(x-24,y-24,"Lv: "+string(os.level))