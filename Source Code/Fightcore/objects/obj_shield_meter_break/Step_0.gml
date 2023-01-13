/// @description Insert description here
// You can write your code in this editor
a = lerp(a,0,0.05)

if(a <= 0.01)instance_destroy()

image_alpha = a

x += hspd
y += vspd

vspd += grav