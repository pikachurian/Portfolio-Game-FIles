/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_transition_fade_in))instance_destroy()

//x = lerp(x,targetX,a)
x += hspd

//if(abs(targetX - x) <= 32)instance_destroy()
if(x >= targetX)
{
	instance_create_depth(0,0,depth,obj_transition_fade_in)
}