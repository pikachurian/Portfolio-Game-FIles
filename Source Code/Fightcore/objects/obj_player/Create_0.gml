/// @description Insert description here
// You can write your code in this editor
input = obj_input
oLane = obj_lane
oScore = obj_score
beatM = obj_beat_master

hpMax = 100
hp = hpMax
//for lerping the hp bar
hpLerpPos = hpMax
hpLerpA = 0.15//0.1
hpPosOffY = 0
//hpPosTargetY = 

state = PS.active 
cam = view_camera[0]
camX = 0
camY = 0
camW = 0
camH = 0

zSpd = 4

//SetImageSizeLerp(0.5,1)

//Lane stuff
myLane = 1
laneOffY = -44

shadowOffY = 0

defaultSize = 0.5

image_xscale = 0.5
image_yscale = 0.5

noteHitX = 256//128
noteMissX = 64

noteHitRange = 0.8//0.5

hitSounds = [snd_hit_0,snd_hit_1]

scrollSpd = 0
framesDead = 0

//GamoverLoseText
gmText = [
	"Totally not radical!",
	"Wipeout!",
	"Don't give up stay DETERMINED",
	"sus",
	"Don't give up yet\nIt's not something we'd do\nI am error\nAnd you made a few",
	"I love the electric glove, it's so bad",
	"To win you must defeat Shen Long",
	"I'll add some more funny text when I think of more"
]

gmTextI = noone

//gmNoEnemies = false
gmNoEnemiesAndWaited = false

//Gameover background
gmBgWaitTime = room_speed * 1
gmBgWaitTick = gmBgWaitTime
gmBgA = 0
//Gameover failure
gmFWaitTime = room_speed * 2
gmFWaitTick = gmFWaitTime
gmFA = 0
gmFSizeA = 6
//Gameover help text
gmHTextA = 0
gmHTextWaitTime = room_speed * 2.5
gmHTextWaitTick = gmHTextWaitTime
//Gameover options
gmOpWaitTime = room_speed * 3//2.5
gmOpWaitTick = gmOpWaitTime
gmOpOn = -1
gmOptions = noone

//checks for playing audio
hitRight = false
hitLeft = false

UpdateCameraVars(cam)

function MoveZCenter(_amount)
{
	var _pX = camX + camW/2
	var _pY = camY + camH/2
	var _dir = point_direction(x,y,_pX,_pY)
	
	var _xx = lengthdir_x(_amount,_dir)
	var _yy = lengthdir_y(_amount,_dir)
	
	x += _xx
	y += _yy
}

function SetImageSizeLerp(_size,_amount)
{
	image_xscale = lerp(image_xscale,_size,_amount)
	image_yscale = lerp(image_yscale,_size,_amount)
}

function SetImageSize(_size)
{
	image_xscale = _size
	image_yscale = _size
}

function GetTargetLane()
{
	var _lane = 0
	
	if(input.lPunchP)
	{
		if(myLane = 1)_lane = 2
		else if(myLane = 5)_lane = 6
	}else
	{
		if(myLane = 1)_lane = 0
		else if(myLane = 5)_lane = 4
	}
	
	return _lane
}

function BeatInRange(_beat)//returns bool
{
	if(beatM.songPositionInBeats- noteHitRange <= _beat && _beat <= beatM.songPositionInBeats + noteHitRange)return true
	else return false
}

function GetTargetNote(_myLane, _targetLane)
{
	var _noteId = noone
	for(var i = 0;i < array_length(beatM.songs[beatM.songId].notes);i ++)
	{
		var _note = beatM.songs[beatM.songId].notes[i]
		if(_note.hasSpawned == true && _note.inst != noone)
		{
			if(_note.inst.myLane == _targetLane || _note.inst.myLane == _myLane)
			{
				var _beat = _note.inst.beat
				if(_noteId = noone)
				{
					if(BeatInRange(_beat))_noteId = i
				}else
				{
					if(_beat < beatM.songs[beatM.songId].notes[_noteId].inst.beat)
					{
						if(BeatInRange(_beat))_noteId = i
					}else if(_beat == beatM.songs[beatM.songId].notes[_noteId].inst.beat)
					{
						//If the notes are on the same beat, in the case of big notes
						if(BeatInRange(_beat) && _note.inst.myLane == _targetLane)_noteId = i
					}
				}
			}
		}
	}
	
	return _noteId
}

function TakeDamage(_amount)
{
	hp = max(hp - _amount,0)
	hpPosOffY = -32
}

function NoteMiss()
{
	if(!instance_exists(obj_score) || !instance_exists(obj_player))return noone
	with(obj_score)
	{
		missedNotes += 1
		combo = 0
		fire = 0
	}
	
	with(obj_player)
	{
		TakeDamage(10)
	}
}

function PlayRandomHitSound()
{
	/*var _i = irandom(array_length(hitSounds)-1)
	var _hitSound = audio_play_sound(hitSounds[_i],10,false)
	audio_sound_gain(_hitSound,10000*obj_gm.gameSettings.sfxLevel,0)*/
}

function PlayHitSoundRight(_snd,_hit)
{
	if(!_hit)_snd = snd_hit_right_whiff
	var _hitSound = audio_play_sound(_snd,0.9,false)//snd_hit_3,10,false)
	//audio_sound_gain(_hitSound,50*obj_gm.gameSettings.sfxLevel,0)
	audio_sound_gain(_hitSound,1*obj_gm.gameSettings.sfxLevel,0)
}

function PlayHitSoundLeft(_snd,_hit)
{
	if(!_hit)_snd = snd_hit_left_whiff
	var _hitSound = audio_play_sound(_snd,0.9,false)//snd_hit_3,10,false)
	//audio_sound_gain(_hitSound,50*obj_gm.gameSettings.sfxLevel,0)
	audio_sound_gain(_hitSound,1*obj_gm.gameSettings.sfxLevel,0)
}

function ScoreAndHit(_noteId,_targetBeat, _scoreX, _scoreY)
{
	//show_debug_message("You Hit the Enemy")
	//PlayRandomHitSound()
	//var _ex = beatM.songs[beatM.songId].notes[_noteId].inst.x
	//var _ey = beatM.songs[beatM.songId].notes[_noteId].inst.y
	var _inst = beatM.songs[beatM.songId].notes[_noteId].inst
	if(object_get_parent(_inst.object_index) == obj_enemy_big_parent)
	{
			if(_inst.beenHit = false)
			{
				//Score points
				oScore.ScoreHit(beatM.songPositionInBeats,_targetBeat,_scoreX,_scoreY)//8,320)
			}
		//Enemy Hit Script
		beatM.songs[beatM.songId].notes[_noteId].inst.Hit();
	}else
	{
		//Score points
		oScore.ScoreHit(beatM.songPositionInBeats,_targetBeat,_scoreX,_scoreY)//8,320)
		//Enemy Hit Script
		beatM.songs[beatM.songId].notes[_noteId].inst.Hit();
	}
}

function DrawHealthbar(_style)
{
	hpLerpPos = lerp(hpLerpPos,hp,hpLerpA)
	hpPosOffY = lerp(hpPosOffY,0,0.1)
	draw_sprite_ext(
		spr_healthbar_base,
		clamp(_style,0,sprite_get_number(_style)-1),
		camX+8+hpPosOffY,
		camY+8,
		4,
		4,
		0,
		c_white,
		1		
	)
	
	draw_sprite_part_ext(
		spr_healthbar,
		clamp(_style,0,sprite_get_number(_style)-1),
		14,
		5,
		47 * (hpLerpPos/hpMax),
		4,
		camX+8+56+hpPosOffY,
		camY+8+20,
		4,
		4,
		c_white,
		1		
	)
}

function DrawGameover()
{
	if(gmTextI == noone)gmTextI = irandom(array_length(gmText)-1)
	//if(gmTextI == noone)gmTextI = 4
	if(gmNoEnemiesAndWaited && obj_player.x >= room_width/2)
	{
		if(gmBgWaitTick <= 0)
		{
			draw_set_color(c_black)
			gmBgA = lerp(gmBgA,1,0.05)
			draw_set_alpha(gmBgA)
			draw_rectangle(0,0,room_width,room_height,false)
		
			draw_set_alpha(1)
			draw_set_color(c_white)
		}else gmBgWaitTick -- 
		
		if(gmFWaitTick <= 0)
		{
			gmFA = lerp(gmFA,1,0.05)
			gmFSizeA = lerp(gmFSizeA,4,0.05)
			draw_set_alpha(gmFA)
			draw_sprite_ext(
				spr_failure,
				0,
				camW/2,
				128,
				gmFSizeA,
				gmFSizeA,
				0,
				c_white,
				gmFA
			)
			draw_set_font(fnt_2p)
			draw_set_halign(fa_center)
			draw_set_color(c_white)
			draw_text(camW/2,240/*320*/,gmText[gmTextI])
			draw_set_font(Font1)
			draw_set_halign(fa_left)
		}else gmFWaitTick -- 
		
		//Draw the gameover menu options
		if(gmOptions != noone)
		{
			for(var i = 0;i < array_length(gmOptions);i ++)
			{
				var _inst = gmOptions[i]
				draw_sprite_ext(
					_inst.sprite_index,
					_inst.image_index,
					_inst.x,
					_inst.y,
					_inst.image_xscale,
					_inst.image_yscale,
					_inst.image_angle,
					c_white,
					_inst.image_alpha
				)
			}
		}
	}
	
	draw_self()
}

/*lane[1][LInfo.yPos] = 600
lane[1][LInfo.size] = 1//1.15

lane[2][LInfo.yPos] = 500
lane[2][LInfo.size] = 0.85//1

lane[3][LInfo.yPos] = 400
lane[3][LInfo.size] = 0.85*/