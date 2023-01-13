/// @description Insert description here
// You can write your code in this editor
//x = lerp(x,targetX,a)
x += hspd

//if(abs(targetX - x) <= 32)instance_destroy()
if(x >= targetX)
{
	instance_destroy()
}