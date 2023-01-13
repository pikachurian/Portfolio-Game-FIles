/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if(global.paused)
{
	image_speed = 0
	exit;
}
if(!instance_exists(obj_lane))exit
depth = -y

if(!isDead && !beenHit)
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
}else if(isDead && !hitstunTick <= 0)
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
}else if(beenHit && !isDead)
{
	var _lastHitstunTick = hitstunTick
	if(hitstunTick > 0)hitstunTick --
	if(hitstunTick <= 0)
	{
		//Resume Walking towards player
		
		//Set the target beat offset if resumed walk this frame
		if(!_lastHitstunTick <= 0)
		{
			resumeBeatTarget = max((beatM.songPositionInBeats+resumeBeatOff) - spawnBeat,0)
		}
		
		y = obj_lane.lane[myLane][LInfo.yPos]+laneOffY

		a = max(beatM.songPositionInBeats-spawnBeat,0) / resumeBeatTarget
		x = lerp(startX,hitX,a)

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
	}else
	{
		//show_debug_message("Beat "+string(beat))
		beat = beatM.songPositionInBeats
	}
}else if(isDead && hitstunTick <= 0)
{
	var _lastHitstunTick = hitstunTick
	if(hitstunTick > 0)hitstunTick --
	if(hitstunTick <= 0)
	{
		//Resume Walking towards player
		
		//Set the target beat offset if resumed walk this frame
		if(!_lastHitstunTick <= 0)
		{
			resumeBeatTarget = max((beatM.songPositionInBeats+resumeBeatOff) - spawnBeat,0)
		}
		
		y = obj_lane.lane[myLane][LInfo.yPos]+laneOffY

		a = max(beatM.songPositionInBeats-spawnBeat,0) / resumeBeatTarget
		x = lerp(startX,hitX,a)

		if(x < obj_player.noteMissX && hasMissed == false && obj_player.state != PS.dead)
		{
			//obj_player.NoteMiss()
			//hasMissed = true
		}
		if(x < killzone)
		{
			beatM.songs[beatM.songId].notes[myNoteId].inst = noone
			instance_destroy()
		}
	}else
	{
		//show_debug_message("Beat "+string(beat))
		beat = beatM.songPositionInBeats
	}
}
//Die on end beat and if hit
if(beatM.songPositionInBeats >= endBeat && beenHit && !isDead)
{
	GlobalPlaySoundVolume(snd_break_0,1,1,15,false)
	
	beatM.songs[beatM.songId].notes[myNoteId].inst = noone
	instance_create_depth(x,y,depth-5,obj_hit_effect)
	//instance_destroy()
	kbHspd = knockbackX
	kbVspd = knockbackY
	isDead = true
	floorY = y
	y -= 8
	
	if(instance_exists(obj_score))
	{
		with(obj_score)
		{
			obj_score.ScoreWithMultiplier(other.combo)
		}
	}
	
	//Create Shield Break Effect
	with(instance_create_depth(	x+32,(comboLerpY-32)+(84*shieldPercent),depth-1000,obj_shield_meter_break))
	{
		image_index = 0
		hspd *= -1
		image_xscale = 4
		image_yscale = 4
	}
	
	with(instance_create_depth(	x+32,(comboLerpY-32)+(84*shieldPercent),depth-1000,obj_shield_meter_break))
	{
		image_index = 1
		hspd *= 1
		image_xscale = 4
		image_yscale = 4
	}
}