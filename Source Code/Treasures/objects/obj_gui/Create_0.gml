/// @description Insert description here
// You can write your code in this editor
drawFps = false
os = obj_stats
oPlayer = obj_player

cam = view_get_camera(view_camera[0])

vw = 320//camera_get_view_width(cam)
vh = 240//camera_get_view_height(cam)
//vx = camera_get_view_x(cam)
//vy = camera_get_view_y(cam)
vx = obj_camera.x
vy = obj_camera.y

healthbarWidth = 49
healthbarHeight = 12
healthbarX = (vx-vw/2)+17
healthbarY = (vy-vh/2)+10

//view_