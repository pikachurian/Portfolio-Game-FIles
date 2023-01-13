/// @description Insert description here
// You can write your code in this editor
drawFps = -1//false

os = obj_stats

interactRange = 24//12
actTarget = noone

hspd = 0
hspd_fraction = 0
vspd = 0
vspd_fraction = 0
grav = 0.4
jspd = 7
vspdMax = 12//10
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
ropeRange = 240//120
ropeRangeV = 240
ropeRangeH = 60//120
ropeCd = 0
ropeCdV = 15 //30
ropeCdH = 7 // 15
ropeTarget = -4
ropeSwingSpd = 0.1//2
ropeRetractSpd = 1

hitInvinceTime = 30
hitInvinceTick = 0

hitByAttack = ds_list_create()

attackHDamage = 1
attackHKnockback = 2

spriteDir = 1

tmCollision = layer_tilemap_get_id("Collision")

state = PlayerState.active
lastState = PlayerState.active

camera = noone
if(!instance_exists(obj_camera))camera = instance_create_layer(x,y,"Player",obj_camera)

gui = noone
if(!instance_exists(obj_gui))gui = instance_create_layer(x,y,"Gui",obj_gui)