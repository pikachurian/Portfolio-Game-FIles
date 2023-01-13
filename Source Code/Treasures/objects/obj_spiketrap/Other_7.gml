/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case "activated":
	{
		state = "spikes"
		waitTick = waitTime
		image_speed = 0
		image_index = image_number - 1
	}break
	
	case "spikes":
	{
		state = "off"
		waitTick = waitTime
		image_speed = 0
		image_index = 0
	}break
}