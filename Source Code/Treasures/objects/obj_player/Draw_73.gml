/// @description Insert description here
// You can write your code in this editor
if(state = PlayerState.active)
{
	if(point_distance(x,y,actTarget.x,actTarget.y) <= interactRange)
	{
		draw_sprite(spr_e_0,0,x,y-16)
	}
}