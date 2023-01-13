/// @description Insert description here
// You can write your code in this editor
UpdateCameraVars(cam)
if(global.paused)
{
	if(!instance_exists(obj_input))exit;
	var _opDir = obj_input.downP - obj_input.upP
	opOn += _opDir
	if(opOn >= array_length(options))opOn = 0
	if(opOn < 0)opOn = array_length(options)-1
	
	//Check button press
	if(obj_input.rPunchP)
	{
		switch(opOn)
		{
			case 0://restart
				global.paused = false
				audio_stop_all()
				room_restart()
				//TransitionStart(rm_test,sq_fade_out,sq_fade_in)
				break;
			
			case 1://exit
				//
				global.paused = false
				global.loadTitleMenu = TS.main
				audio_stop_all()
				TransitionStart(rm_title,sq_fade_out,sq_fade_in)
				break;
		}
	}
	
}else
{
	if(instance_exists(obj_input) && instance_exists(obj_player))
	{
		if(obj_input.startP && obj_player.state != PS.dead)
		{
			global.paused = true
			opOn = 0
		}
	}
}