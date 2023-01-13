/// @description Insert description here
// You can write your code in this editor
if(global.paused)
{
	image_speed = 0
	exit;
}

hitRight = false
hitLeft = false

UpdateCameraVars(cam)
depth = -y
if(instance_exists(obj_score))noteHitRange = obj_score.squareRange//sickRange

//if(keyboard_check_pressed(ord("T")))TakeDamage(10)Removed in 1.2

switch(state)
{
	case PS.active:
		#region active
		//dead :(
		if(hp <= 0)
		{
			scrollSpd = (beatM.bpm / 100)*2
			state = PS.dead
			//sprite_index = spr_player_dead
		}
		//punching
		var _scoreX = 64
		var _scoreY = 128
		if(input.lPunchP && input.rPunchP)
		{
			#region
			//PlayHitSoundRight()
			//PlayHitSoundLeft()
			image_index = 0
			sprite_index = spr_player_lrpunch
			
			if(beatM.songs[beatM.songId].notes != noone)
			{
				//Repeat this once for each fist/lane
				//Get Target Beat
				var _targetLane = noone
				if(myLane = 1)_targetLane = 2
				else _targetLane = 6
				var _noteId = noone
				_noteId = GetTargetNote(myLane, _targetLane)
				if(_noteId != noone)
				{
					//show_debug_message("There is an enemy")
					//var _targetBeat = beatM.songs[beatM.songId].notes[_noteId].beat
					var _targetBeat = beatM.songs[beatM.songId].notes[_noteId].inst.beat
					if(beatM.songPositionInBeats- noteHitRange <= _targetBeat && _targetBeat <= beatM.songPositionInBeats + noteHitRange)
					{
						ScoreAndHit(_noteId, _targetBeat, _scoreX, _scoreY)
						hitLeft = true
					}
				}
				
				_targetLane = noone
				if(myLane = 1)_targetLane = 0
				else _targetLane = 4
				_noteId = noone
				_noteId = GetTargetNote(myLane, _targetLane)
				if(_noteId != noone)
				{
					//show_debug_message("There is an enemy")
					//PlayRandomHitSound()
					//_targetBeat = beatM.songs[beatM.songId].notes[_noteId].beat
					_targetBeat = beatM.songs[beatM.songId].notes[_noteId].inst.beat
					if(beatM.songPositionInBeats- noteHitRange <= _targetBeat && _targetBeat <= beatM.songPositionInBeats + noteHitRange)
					{
						ScoreAndHit(_noteId, _targetBeat, _scoreX, _scoreY)
						hitRight = true
					}
				}
				
			}
			#endregion
		}else if(input.lPunchP || input.rPunchP)
		{
			#region
			//if(input.lPunchP)PlayHitSoundLeft()
			//if(input.rPunchP)PlayHitSoundRight()
			image_index = 0
			if(input.lPunchP)sprite_index = spr_player_lpunch
			else sprite_index = spr_player_rpunch
			
			if(beatM.songs[beatM.songId].notes != noone)
			{
				//Get Target Beat
				var _targetLane = noone
				_targetLane = GetTargetLane()
				var _noteId = noone
				_noteId = GetTargetNote(myLane, _targetLane)
				if(_noteId != noone)
				{
					//show_debug_message("There is an enemy")
					//PlayRandomHitSound()
					//var _targetBeat = beatM.songs[beatM.songId].notes[_noteId].beat
					var _targetBeat = beatM.songs[beatM.songId].notes[_noteId].inst.beat
					if(beatM.songPositionInBeats- noteHitRange <= _targetBeat && _targetBeat <= beatM.songPositionInBeats + noteHitRange)
					{
						ScoreAndHit(_noteId, _targetBeat, _scoreX, _scoreY)
						if(input.lPunchP)hitLeft = true
						else hitRight = true
					}
				}
			}
			#endregion
		}
		
		//PlayHitAudio
		if(input.lPunchP)PlayHitSoundLeft(snd_hit_left,hitLeft)
		if(input.rPunchP)PlayHitSoundRight(snd_hit_right,hitRight)
		
		if(sprite_index = spr_player_lpunch || sprite_index = spr_player_rpunch || sprite_index = spr_player_lrpunch)
		{
			SetImageSize(0.52)
			laneOffY = -37
			shadowOffY = 84 - 16
			if(AnimationEnd())sprite_index = spr_player_walk
		}else 
		{
			SetImageSize(0.5)
			laneOffY = -44
			shadowOffY = 84
		}
	
		switch(input.vAxis)
		{
			case -1:
				myLane = 5
				break;
				
			case 1:
				myLane = 1
				break;
		}
		
		y = lerp(y,oLane.lane[myLane][LInfo.yPos],0.5)+laneOffY
		//SetImageSizeLerp(defaultSize+oLane.lane[myLane][LInfo.pSize],0.5)
		#endregion
		break;
		
	case PS.dead:
		#region
		with(beatM)
			{
				if(songStarted != SStarted.false)StopSongSlow(0.025)
			}
		if(framesDead >= room_speed * 0.25/*1*/)
		{
			if(input.rPunchP)
			{
				gmNoEnemiesAndWaited = true
				obj_player.x = room_width/2
				gmBgWaitTick = 0
				gmFWaitTick = 0
				gmOpWaitTick = 0
			}
		}
		if(!instance_exists(obj_enemy_parent) && framesDead >= room_speed * 3)gmNoEnemiesAndWaited = true
		if(gmNoEnemiesAndWaited == true) //&& floor(beatM.songPositionInBeats) % 12 == 0)
		{
			/*with(beatM)
			{
				if(songStarted != SStarted.false)StopSongSlow(0.001)
			}*/
			if(obj_bg.scrollBackToPlayer == false)obj_bg.scrollBackToPlayer = true
			if(obj_player.x <= room_width/2 )x += scrollSpd*2
			//x += scrollSpd
			sprite_index = spr_player_dead
			#region Gameover menu options
			if(obj_player.x >= room_width/2)
			{
				if(gmOpWaitTick <= 0)
				{
					if(gmOptions == noone)
					{
						gmOptions[0] = instance_create_depth(camW/2+320-32,camH-240,depth,obj_arcade_retry)//instance_create_depth(128,room_height-128,depth,obj_arcade_retry)
						gmOptions[1] = instance_create_depth(camW/2-320-32,camH-240,depth,obj_arcade_exit)//instance_create_depth(64,room_height-128,depth,obj_arcade_exit)
					}
					if(input.leftP)gmOpOn = 1
					else if(input.rightP)gmOpOn = 0
				
					for(var i = 0;i < array_length(gmOptions);i ++)
					{
						if(input.rPunchP && gmOpOn != -1 && gmOpOn == i)gmOptions[i].Select()
						else if(gmOpOn != -1 && gmOpOn == i)gmOptions[i].On()
						else gmOptions[i].Off()
					}
					//if(gmOpOn != -1)gmOptions[gmOpOn].On()
				}else gmOpWaitTick --
			}
			#endregion
		}else  x += -scrollSpd//if(obj_player.x >= -320)x += -scrollSpd
		framesDead ++
		//show_debug_message("player X "+string(x))
		//show_debug_message("dead frames "+string(framesDead))
		#endregion
		break;
}