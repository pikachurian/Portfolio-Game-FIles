/// @description Insert description here
// You can write your code in this editor
down_hold = keyboard_check(ord("S"))
down_released = keyboard_check_released(ord("S"))

if(down_hold && hold_tick >= hold_time*room_speed)
{
		
}

if(instance_exists(follow))
{
	xto = follow.x
	yto = follow.y-64
}

if(down_hold && hold_tick >= hold_time*room_speed)
{
	yto = follow.y + 32
}else if(down_hold)hold_tick ++

if(down_released)hold_tick = 0

x += (xto -x) /25
y += (yto - y)/25

x = clamp(x,view_w_half,room_width-view_w_half)
y = clamp(y,view_h_half,room_height-view_h_half)

camera_set_view_pos(cam,x-view_w_half,y-view_h_half)

/*if(layer_exists("background"))
{
	 layer_x("background",x/2)
}*/