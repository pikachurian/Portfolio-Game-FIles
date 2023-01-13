/// @description Insert description here
// You can write your code in this editor
switch(p.state)
{
	case PS.menu:
		if(input.buttonR)
		{
			opOn += 1
			if(opOn >= array_length(options.main))opOn = 0
			
			audio_play_sound(snd_change_selection,20,false)
		}
		if(input.buttonHeld)
		{
			input.buttonHeld = false
			input.buttonFramesHeld = 0
			audio_play_sound(snd_make_selection,20,false)
			switch(opOn)
			{
				case 0:
					//Start/Play
					p.state = PS.start
					p.Start()
					break;
				
				case 1:
					//Quit
					game_end()
					break;
					
				case 2:
					//Fullscreen
					window_set_fullscreen(!window_get_fullscreen())
					break;
			}
		}
		
		if(options.main[opOn] == spr_play)sSelected = 1
		else sSelected = 0
		if(options.main[opOn] == spr_quit)qSelected = 1
		else qSelected = 0
		if(options.main[opOn] == spr_fullscreen)fsSelected = 1
		else fsSelected = 0
		break;
		
	case PS.start:
		//
		break;
		
	case PS.active:
		//
		break;
		
	case PS.dead:
		//
		break;
}
