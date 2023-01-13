/// @description Insert description here
// You can write your code in this editor
if(global.paused)exit;
if(!instance_exists(obj_player))exit
if(obj_player.state == PS.dead)exit
var _songId = beatM.songId
if(beatM.songs[_songId].notes != noone)
{
	for(var i = 0;i < array_length(beatM.songs[_songId].notes);i ++)
	{
		var _note = beatM.songs[_songId].notes[i]
		var _startBeat = _note.beat + _note.spawnBeatOff
		if(beatM.songPositionInBeats >= _startBeat && _note.hasSpawned == false)
		{
			beatM.songs[_songId].notes[i].hasSpawned = true
			if(beatM.songs[_songId].notes[i].noteType.obj != noone)
			{
				var _obj = global.noteTypes[_note.noteTypeId].obj
				beatM.songs[_songId].notes[i].inst = instance_create_depth(x,y,depth,_obj)
				with(beatM.songs[_songId].notes[i].inst)
				{
					beat = other.beatM.songs[_songId].notes[i].beat
					myLane = other.beatM.songs[_songId].notes[i].row
					x = startX
					y = obj_lane.lane[myLane][LInfo.yPos]+laneOffY
					spawnBeat = beatM.songPositionInBeats//_startBeat
					spawnBeatOff = _note.spawnBeatOff
					endBeat = _note.endBeat
					
					myNoteId = i
				}
			}
		}
	}
}