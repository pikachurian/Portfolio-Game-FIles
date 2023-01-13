/// @description Insert description here
// You can write your code in this editor
state = "active"

cutscene_1_time = 27.5//28//10
cutscene_1_tick = 0

//cutscene_1_trolly_time = 10
//cutscene_1_trolly_tick = 0

start_x = x
start_y = y

dead_tick = 0
dead_time = 1

current_checkpoint = 0
foreground_depth = depth
background_depth = 300//200//100

hspd_carry = 0
vspd_carry = 0

plane = "foreground"

coin_1 = obj_coin_1_foreground
death_trigger = obj_death_trigger_foreground
spring = obj_spring_foreground
trolly = obj_trolly_foreground
wall = 0
max_spd = 3
accel = 1//0.5//0.1
jumpspeed = 9//7
drag = 1//0.5
grav = 0.5//0.25
hspd = 0
vspd = 0
spring_vspd_max = 10//6
move = 0
dash_max_spd = 5
max_max_spd = 3
canjump = 6
canjump_set = 6

accel_back = 0.5
max_spd_back = 1.5
max_max_spd_back = 1.5
jumpspeed_back = 4.5
drag_back = 0.5
grav_back = 0.25
dash_max_spd_back = 2.5
canjump_back = 3
canjump_set_back = 3


accel_fore = 1
max_spd_fore = 3
max_max_spd_fore = 3
jumpspeed_fore = 9
drag_fore = 1
grav_fore = 0.5
dash_max_spd_fore = 5
canjump_fore = 6
canjump_set_fore = 6

image_xscale = 2
image_yscale = 2

i_spd = image_speed

last_dir = 1

scale_max = 2.0//1.0
scale_min = 1.0//0.5

scale_mod = 0.1
scale_mod_2fore = 0.025//0.05
scale_mod_2back = 0.025//0.05

//image_xscale = 1.5
//image_yscale = 1.5