/// @description Insert description here
// You can write your code in this editor
x -= spd
y = (yy+offsetY) - (obj_player.yy)
if(x <= obj_player.camX-128)instance_destroy()
else if(obj_player.state == PS.dead)instance_destroy()
