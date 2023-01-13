/// @description Insert description here
// You can write your code in this editor
var _bbox_side

hspd = -keyboard_check(ord("A")) + keyboard_check(ord("D"))
vspd = -keyboard_check(ord("W")) + keyboard_check(ord("S"))
hspd *= spd
vspd *= spd

//Horizontal Collision
if(hspd > 0)_bbox_side = bbox_right
	else _bbox_side = bbox_left
if(tilemap_get_at_pixel(tmCollision,_bbox_side+hspd,bbox_top) != 0) || (tilemap_get_at_pixel(tmCollision,_bbox_side+hspd,bbox_bottom) != 0)
{
	if(hspd>0) x = x - (x mod 32) + 31 - (bbox_right-x)
		else x = x - (x mod 32) - (bbox_right-x)
}
x += hspd

//Vertical Collision
if(vspd > 0)_bbox_side = bbox_bottom
	else _bbox_side = bbox_top
if(tilemap_get_at_pixel(tmCollision,bbox_right,_bbox_side+hspd) != 0) || (tilemap_get_at_pixel(tmCollision,bbox_right,_bbox_side+vspd) != 0)
{
	if(vspd>0) y = y - (y mod 32) + 31 - (bbox_bottom-y)
		else y = y - (y mod 32) - (bbox_top-y)
}
y += vspd