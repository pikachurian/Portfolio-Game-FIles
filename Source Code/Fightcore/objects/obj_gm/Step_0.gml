/// @description Insert description here
// You can write your code in this editor
if(!global.midTransition)
if(room = rm_story)
{
	if(storyOn == 1 || storyOn == 3 || storyOn == 5)
	{
		StartSongLevel(sLevels[storyOn],rm_test)
		storyOn += 1
	}
	if(sWaitTick <= 0)
	{
		if(storyOn != 6)
		{
			StartSongLevel(sLevels[storyOn],rm_test)
			storyOn += 1
			//show_debug_message("StoryOn "+string(storyOn))
		}else
		{
			isStory = false
			storyOn = 0
			TransitionStart(rm_title,sq_fade_out,sq_fade_in)
		}
	}else sWaitTick --
}else if(room = rm_intro)
{
	introFrames ++
	if(introFrames >= room_speed * 1.5)room_goto(rm_title)
}