/// @description Insert description here
// You can write your code in this editor
a = clamp(a + fade*spd,0,1)

if(a == 1)
{	
	if(roomRestart)room_restart()
	else	room_goto(nextRoom)
	fade = -1
}

if(a == 0) && (fade == -1)
{
	instance_destroy()
}

draw_set_color(c_black)
draw_set_alpha(a)
//draw_rectangle(camera_get_view_x(cam),camera_get_view_y(cam),camera_get_view_x(cam)+500,camera_get_view_y(cam)+500,false)
draw_rectangle(0,0,3200,3200,false)
draw_set_alpha(1)
draw_set_color(c_white)
