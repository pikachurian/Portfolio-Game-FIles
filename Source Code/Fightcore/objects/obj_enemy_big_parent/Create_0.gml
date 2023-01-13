/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
//beatM = obj_beat_master

beenHit = false
combo = 0

hitstunTime = 1 * room_speed
hitstunTick = hitstunTime

resumeBeatOff = 1
resumeBeatTarget = 0

//Added to the songpositioninbeats to get the current beat
beatOffset = 0//not used

comboOffY = 0//0
comboLerpY = 0
comboLerpA = 0.1

comboAlpha = 0
comboAlphaA = 0.1


comboSizeMin = 3
comboSize = comboSizeMin
comboSizeA = 0.1

shieldPercent = 1
shieldPercentTarget = 1
shieldPercentA = 0
spLerp = shieldPercent

//The beat when hit
hitBeat = noone

function Hit()
{
	//beatM.songs[beatM.songId].notes[myNoteId].inst = noone
	instance_create_depth(x,y,depth-5,obj_hit_effect)
	//kbHspd = knockbackX
	//kbVspd = knockbackY
	beenHit = true
	//floorY = y
	//y -= 8
	hitstunTick = hitstunTime
	combo += 1
	comboLerpY -= 10
	
	comboSize += 0.5
	
	if(hitBeat = noone)hitBeat = beatM.songPositionInBeats
	
	//shieldPercentTarget = (beatM.songPositionInBeats / endBeat)
	shieldPercentA = (max(beatM.songPositionInBeats - hitBeat,0) / max(endBeat - hitBeat,0))
	
	
}