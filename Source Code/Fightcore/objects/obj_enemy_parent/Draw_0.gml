/// @description Insert description here
// You can write your code in this editor
//draw_self()
if(!instance_exists(obj_lane))exit
ResetDrawStuff()
//draw_text(x,y-16,string(beatM.songs[beatM.songId].notes[myNoteId].inst))

if(!isDead)
{
	var a = 0.75
	if(obj_player.myLane == 1)
	{
		if(myLane == 0 || myLane == 2)a = 1
	}else if(obj_player.myLane == 5)
	{
		if(myLane == 6 || myLane == 4)a = 1
	}

	//image_alpha = a

	#region
	/*if(a == 1)//OldOutline
	{
		gpu_set_fog(true,c_white,0,0)
		//image_blend = c_white
		draw_sprite_ext(
			sprite_index,
			image_index,
			x,
			y,
			image_xscale*1.1,//1.25,
			image_yscale*1.04,//1.25,
			0,
			c_white,
			1
		)
		gpu_set_fog(false,c_white,0,0)
	}*/
	#endregion

	//image_blend = c_white

	//shader outline
	/*
	if(a == 1)
	{
		shader_set(sh_outline)
		shader_set_uniform_f(upixelW,texelW);
		shader_set_uniform_f(upixelH,texelH);
		draw_self()
		shader_reset()
	}else draw_self()*/
	if(beatM.isNightcore == false)draw_sprite_ext(spr_shadow_0,0,x,y+shadowOffY,shadowSize,shadowSize,0,c_white,0.75)
	draw_self()

	//draw_text(x,y-32,string(myLane))
	//draw_text(640,8,string(a))
	/*draw_text(x,y-32,string(a))
	draw_text(x,y-16,"SpawnBeatOff "+string(spawnBeatOff))
	draw_text(x,y-0,"SpawnBeat "+string(spawnBeat))*/

	/*if(a == 1)
	{
		image_blend = c_red
		draw_sprite_ext(
			sprite_index,
			image_index,
			x,
			y,
			1.25,
			1.25,
			0,
			image_blend,
			1
		)
	}*/
}else
{
	if(framesDead >= startToFadeFrame)image_alpha -= fadeAmount
	if(image_alpha <= 0)instance_destroy()
	draw_self()
}