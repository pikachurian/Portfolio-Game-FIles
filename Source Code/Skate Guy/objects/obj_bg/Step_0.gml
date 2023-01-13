/// @description Insert description here
// You can write your code in this editor
UpdateCameraVariables(cam)

if(obj_player.state != PS.dead)
{
	bg1.xx -= bg1.scrollSpd
	if(bg1.xx <= sprite_width)bg1.xx = sprite_width*2
	bg1.yy= (camY+camH*2.25)-obj_player.yy

	bg2.xx -= bg2.scrollSpd
	if(bg2.xx <= sprite_width)bg2.xx = sprite_width*2
	bg2.yy = (camY+camH*1)-(obj_player.yy/4)//(camY+camH*1.5)-(obj_player.yy/2)

	if(obj_player.state != PS.menu)
	{
		if(scrollSpdTick <= 0)
		{
			bg1.scrollSpd += scrollSpdAccel
			bg2.scrollSpd += scrollSpdAccel
	
			scrollSpdTick = scrollSpdTime
		}else scrollSpdTick --
	}
}
