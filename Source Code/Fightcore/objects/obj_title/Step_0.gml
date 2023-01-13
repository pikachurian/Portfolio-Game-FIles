/// @description Insert description here
// You can write your code in this editor
//if(!instance_exists(obj_transition_fade_out))midTransition = false
//else midTransition = true
//if(global.midTransition) exit
if(midTransition)
{
	if(instance_exists(obj_transition_parent))
	{
		if(instance_exists(obj_transition_fade_in))
		{
			menuOn = nextMenu
			opOn = 0
			isNightcore = false
		}
	}else midTransition = false
}

if(mainOptions != noone && menuOn != TS.main)
{
	for(var i = 0; i < array_length(mainOptions); i ++)
	{
		with(mainOptions[i])instance_destroy()
	}
	
	mainOptions = noone
}

switch(menuOn)
{
	case TS.title:
		//
		#region
		if(titleWaitTick <= 0)
		{
			titleImageAlpha = lerp(titleImageAlpha,0,titleImageAlphaA)
			if(titleImageAlpha <= 0.1)titleWordY = lerp(titleWordY,titleWordTargetY,titleWordYA)
			if(abs(titleWordTargetY - titleWordY) <= 32)titleStartAlpha = lerp(titleStartAlpha,1,titleStartAlphaA)
			if(instance_exists(obj_input) && titleStartAlpha >= 0.7 && midTransition = false && global.midTransition == false)
			{
				if(obj_input.startP || obj_input.selectP || obj_input.lPunchP || obj_input.rPunchP)
				{
					//menuOn = TS.main
					instance_create_depth(0,0,-9998,obj_transition_fade_out)
					midTransition = true
					nextMenu = TS.main
					opOn = 0
					PlaySoundVolume(snd_select,1,1,20,false)
				}
			}
		}else titleWaitTick --
		#endregion
		break;
		
	
		
	case TS.main:
		//
		#region
		titleWaitTick = titleWaitTime
		titleImageAlpha = 1
		titleStartAlpha = 0
		titleWordY = -64
		MainBgStep()
		
		if(mainOptions == noone)
		{
			for(var i = 0; i < array_length(mainOpObjs); i ++)
			{
				//mainOptions[i] = instance_create_layer(room_width/2,128 + (i * 128),"Instances",mainOpObjs[i])
				mainOptions[i] = instance_create_layer(240,128 + (i * 128),"Instances",mainOpObjs[i])
			}
			
			//mainOptions[2] = instance_create_layer(128,540,"Instances",obj_btn_settings)
			mainOptions[2] = instance_create_layer(128,640,"Instances",obj_btn_quit)
		}
		
		if(instance_exists(obj_input) && midTransition == false && global.midTransition == false)
		{
			opOn += input.downP - input.upP
			if(opOn < 0)opOn = array_length(mainOptions)-1
			if(opOn > array_length(mainOptions)-1)opOn = 0
			
			if(input.lPunchP)
			{
				instance_create_depth(0,0,-9998,obj_transition_fade_out)
				midTransition = true
				nextMenu = TS.title
				//opOn = 0
				PlaySoundVolume(snd_select,1,0.9,20,false)
			}else if(input.rPunchP)
			{
				switch(opOn)
				{
					case 0:
						//STORY
						obj_gm.isStory = true
						obj_gm.storyOn = 0
						audio_stop_all()
						room_goto(rm_story)
						break;
						
					case 1:
						//FREEPLAY
						ChangeMenuTransition(TS.freeplay)
						PlaySoundVolume(snd_select,1,1,20,false)
						break;
					
					case 3:
						//SETTINGS
						break;
						
					case 2:
						//QUIT
						PlaySoundVolume(snd_select,1,1,20,false)
						game_end()
						break; 
				}
			}
		}
		
		for(var i = 0; i < array_length(mainOptions); i ++)
		{
			if(opOn = i)with(mainOptions[i])
			{
				On()
			}
		}
		
		//show_debug_message(string(opOn))
		#endregion
		break;
		
	case TS.freeplay:
		//
		#region
		MainBgStep()
		
		if(instance_exists(obj_input) && midTransition == false && global.midTransition == false)
		{
		
			//if(opOn < 0)opOn = array_length(mainOptions)-1
			//if(opOn > array_length(mainOptions)-1)opOn = 0
			var _songsArray = noone
			if(isNightcore)_songsArray = fNCSongs
			else _songsArray = fSongs
			
			opOn += input.downP - input.upP
			if(opOn < 0)opOn = array_length(_songsArray)-1
			else if(opOn > array_length(_songsArray)-1)opOn = 0
			
			if(input.lPunchP)
			{
				ChangeMenuTransition(TS.main)
				PlaySoundVolume(snd_select,1,0.9,20,false)
			}else if(input.rPunchP)
			{
				StartSongLevel(_songsArray[opOn],rm_test)
			}else if(input.selectP)
			{
				isNightcore = !isNightcore
				PlaySoundVolume(snd_select, 1, 0.75, 20, false)
			}
		}
		#endregion
		break;
}