/// @description Insert description here
// You can write your code in this editor
hspd = 0
hspd_fraction = 0
vspd = 0
vspd_fraction = 0
grav = 0.4
jspd = 7
vspdMax = 10
spd = 2//3
accel = 1

coyoteTime = 8//1 * room_speed
coyoteTick = 0
jumps = 1

grounded = false;

hFrictionGround = 1//0.5
hFrictionAir = 1//0

grappleX = 0//mouse_x
grappleY = 0//mouse_y
ropeX = 0//x
ropeY = 0//y
ropeAngle = 0
ropeAngleVelocity = 0
ropeLength = 0
ropeRetractDir = 0
ropeRetractAccel = 0.1
ropeRetractVelocity = 0

tmCollision = layer_tilemap_get_id("Collision")

state = PlayerState.active