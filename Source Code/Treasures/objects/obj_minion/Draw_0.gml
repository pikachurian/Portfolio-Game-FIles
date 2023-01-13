/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index,image_index,x,y,dir,1,0,c_white,1)
if(hitInvinceTick > 0)
{
	shader_set(sh_flash)
	draw_sprite_ext(sprite_index,image_index,x,y,dir,1,0,c_white,1)
	shader_reset()
}