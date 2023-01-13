/// @description Insert description here
// You can write your code in this editor
x = 0
y = 0

hp = 10
hpMax = 10

weight = 0
weightMax = 12

dsFloor = ds_grid_create(0,0)//= noone
dsFloor[# 0,0] = noone//noonea//Floor, Info
level = 1
furthestLevel = 1
sameHue = 3
sameHueOn = 3
ascend = false

dsInventory = ds_list_create()

ispd = image_speed
image_speed = 0

sprite_index = spr_title
image_index = 0

if(room = rm_setup)room_goto(rm_title)//room_goto_next()