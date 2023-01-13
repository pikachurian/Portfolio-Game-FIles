/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(obj_player))exit

switch(state)
{
	case "off":
	{
		if(place_meeting(x,y-1,obj_player))
		{
			state = "activated"
			waitTick = waitTime
		}
	}break
	
	case "activated":
	{		
		if(waitTick <= 0)
		{
			//state = "spikes"
			//waitTick = waitTime
			image_speed = ispd
		}else waitTick -= 1
	}break
	
	case "spikes":
	{
		if(place_meeting(x,y-1,obj_player))with(obj_player)Damage(other.damage)
		
		if(waitTick <= 0)
		{
			//state = "spikes"
			//waitTick = waitTime
			image_speed = -ispd
		}else waitTick -= 1
	}
}