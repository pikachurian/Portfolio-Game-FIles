/// @description Insert description here
function UpdateInputs()
{
left = keyboard_check(ord("A"))
right = keyboard_check(ord("D"))
up = keyboard_check(ord("W"))
down = keyboard_check(ord("S"))

hAxis = right - left
vAxis = down - up

leftP = keyboard_check_pressed(ord("A"))
rightP = keyboard_check_pressed(ord("D"))
upP = keyboard_check_pressed(ord("W"))
downP = keyboard_check_pressed(ord("S"))

lPunchP = max(
keyboard_check_pressed(ord("J")),
keyboard_check_pressed(vk_left),
keyboard_check_pressed(vk_up),
0
)
rPunchP = max(
	keyboard_check_pressed(ord("K")),
	keyboard_check_pressed(vk_right),
	keyboard_check_pressed(vk_down),
	0	
)

startP = keyboard_check_pressed(vk_enter)
selectP = keyboard_check_pressed(vk_tab)
}

UpdateInputs()