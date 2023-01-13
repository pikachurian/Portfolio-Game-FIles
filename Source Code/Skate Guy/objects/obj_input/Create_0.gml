/// @description Insert description here
// You can write your code in this editor
function UpdateInputs()
{
	//fullscreen = 0
	//if(keyboard_check_pressed(vk_f4))full
	
	buttonP = keyboard_check_pressed(vk_anykey)
	button = keyboard_check(vk_anykey)
	buttonR = keyboard_check_released(vk_anykey)
	buttonHeld = false
	
	if(button)buttonFramesHeld ++
	if(buttonR)buttonFramesHeld = 0
	if(buttonFramesHeld >= room_speed * 1)//room_speed * 2)
	{
		buttonHeld = true
		buttonFramesHeld = 0
	}
}

buttonFramesHeld = 0

UpdateInputs()