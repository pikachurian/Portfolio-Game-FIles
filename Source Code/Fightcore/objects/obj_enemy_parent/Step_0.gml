/// @description Insert description here
// You can write your code in this editor
if(global.paused)
{
	image_speed = 0
	exit;
}
if(!instance_exists(obj_lane))exit
depth = -y

if(!isDead)
{
	y = obj_lane.lane[myLane][LInfo.yPos]+laneOffY

	a = max(beatM.songPositionInBeats-spawnBeat,0) / max(beat - spawnBeat,0)
	x = lerp(startX,hitX,a)
	//x = lerp(1280,0,a)

	#region For Debugging
	/*
	if(x >= hitX)
	{
		if(noteHitBeat == noone)noteHitBeat = beatM.songPositionInBeats
		show_debug_message("Note Hit Beat "+string(beatM.songPositionInBeats))
	}
	*/
	#endregion

	if(x < obj_player.noteMissX && hasMissed == false && obj_player.state != PS.dead)
	{
		obj_player.NoteMiss()
		hasMissed = true
		
		with(instance_create_depth(64,128,-room_height - 25,obj_score_effect))
		{
			//text = _text
			sprite = spr_miss
			sprite_index = sprite
			image_xscale = 4
			image_yscale = 4
		}
	}
	if(x < killzone)
	{
		beatM.songs[beatM.songId].notes[myNoteId].inst = noone
		instance_destroy()
	}

	//image_speed = iSpd + ((beatM.bpm / 100)*0.75)

	//show_debug_message(string("Spawn Beat "+string(spawnBeat)+" a "+string(a)+string(spawnBeat)+" beat "+string(beat)))
}else
{
	//kbHspd = max(kbHspd + kbDragX,0)
	//kbVspd = max(kbHspd + kbDragY,0)
	kbHspd -= kbDragX
	if(kbHspd <= -2)kbHspd = -2
	kbVspd += kbDragY
	if(y >= floorY)
	{
		kbVspd = 0//knockbackY/3
		//kbHspd = knockbackX
	}
	x += kbHspd
	y += kbVspd
	if(y >= floorY)y = floorY
	framesDead ++
}