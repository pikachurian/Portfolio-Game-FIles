/// @description Insert description here
// You can write your code in this editor
//draw_self()

if(state = PlayerState.swing)
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
		
		//draw_sprite_part(spr_whip_0,0,0,0,3,3,ropeX-lengthdir_x(_i*3,ropeAngle),ropeY-lengthdir_y(_i*3,ropeAngle))
	}
	
	//draw_text(8,8,string(_ropeSegments))
}
//draw_set_color(c_white)
draw_self()
draw_text(8,16,"X"+string(x))
draw_text(8,24,"Y"+string(y))