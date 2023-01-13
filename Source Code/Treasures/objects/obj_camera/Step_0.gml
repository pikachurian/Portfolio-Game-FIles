/// @description Insert description here
// You can write your code in this editor
x += (xTo-x)/25
y += (yTo-y)/25

if(follow != noone)
{
	//xTo = follow.x
	//yTo = follow.y
	if(follow = obj_player)
	{
		var _hDir = -keyboard_check(ord("A")) + keyboard_check(ord("D")) 
		var _vDir = -keyboard_check(ord("W")) + keyboard_check(ord("S"))	
		
		
		xTo = follow.x+_hDir*72
		yTo = follow.y+_vDir*72
	}
}

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0)
camera_set_view_mat(camera,vm)