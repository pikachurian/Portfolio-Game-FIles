/// @description Insert description here
// You can write your code in this editor
switch(room)
{
	case rm_title:
		isStory = false
		storyOn = 0
		break;
		
	case rm_story:
		audio_play_sound(snd_select,5,false)
		sWaitTick = sWaitTime
		break;
}