/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(obj_lane))exit
depth = -y
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

if(x < killzone)
{
	beatM.songs[beatM.songId].notes[myNoteId].inst = noone
	instance_destroy()
}

//image_speed = iSpd + ((beatM.bpm / 100)*0.75)

//show_debug_message(string("Spawn Beat "+string(spawnBeat)+" a "+string(a)+string(spawnBeat)+" beat "+string(beat)))