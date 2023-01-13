/// @description Insert description here
// You can write your code in this editor
beatM = obj_beat_master
//Camera stuff
var _cam = view_camera[0]
	camX = camera_get_view_x(_cam)
	camY = camera_get_view_x(_cam)
	
	camW = camera_get_view_width(_cam)
	camH = camera_get_view_height(_cam)
	
songScore = 0
multiplier = 4//1
combo = 0
sickNotes = 0
radNotes = 0
missedNotes = 0
squareNotes = 0
fireMax = 55
fire = 0
rank = Rank.none

sickPoints = 5
radPoints = 10

squareRange = 0.8
sickRange = 0.4//0.5
radRange = 0.1 

//Multiplier Bar
multiplierMax = 4
multiplierMin = 1
mbLerpPos = multiplier
mbLerpA = 0.1

////Combo
cmLerpPos = 0
cmLerpA = 0.1
cmY = 128

//Rank
rA = 1
rAAmount = 0.1
rSizeMax = 6
rSizeMin = 4
rSize = 4
rSizeA = 0.1

rankNotes = {
	dull : 0,
	cool : 0,
	based : 0,
	ace : 0,
	sick : 0,
	rad : 0
}

image_speed = 0.2//sprite_get_speed(spr_multiplierbar)

//Add points to your score after multiplying them
function ScoreWithMultiplier(_points)
{
	songScore += _points * multiplier
}

function ScoreHit(_beatHit, _targetBeat, _x, _y)
{
	if(instance_exists(obj_player))if(obj_player.state == PS.dead)return noone
	var _pointsScored = 0
	var _sprite = noone
	show_debug_message("Note Hit Diff "+string(abs(_targetBeat - _beatHit)))
	if(abs(_targetBeat - _beatHit) <= radRange)
	{
		ScoreWithMultiplier(radPoints)
		combo += 2 //* multiplier
		fire = min(fire+2,fireMax)
		radNotes += 1
		_pointsScored = radPoints
		_sprite = spr_rad
	}
	else if(abs(_targetBeat - _beatHit) <= sickRange)
	{
		ScoreWithMultiplier(sickPoints)
		combo += 1 //* multiplier
		fire = min(fire+1,fireMax)
		sickNotes += 1
		_pointsScored = sickPoints
		_sprite = spr_sick
	}else if(abs(_targetBeat - _beatHit) <= squareRange)
	{
		combo = 0
		fire = 0
		squareNotes += 1
		_pointsScored = 0
		_sprite = spr_square
	}
	
	var _text = string(multiplier) + "x "+string(_pointsScored)
	with(instance_create_depth(_x,_y,-room_height - 25,obj_score_effect))
	{
		text = _text
		sprite = _sprite
		sprite_index = sprite
		image_xscale = 4
		image_yscale = 4
	}
	
	cmY -= 8
}

function SetRankNotes(_songId)
{
	if(!instance_exists(obj_beat_master))return noone
	
	with(obj_score)
	{
		var _notes = 0
		//if(beatM.songs[_songId].notes == noone)return noone
		if(beatM.songs[_songId].notes != noone)
		{
			_notes = array_length(beatM.songs[_songId].notes)
	
			rankNotes.dull = floor(_notes * 0.03)
			rankNotes.cool = floor(_notes * 0.8)
			rankNotes.based = floor(_notes * 0.16)
			rankNotes.ace = floor(_notes * 0.24)
			rankNotes.sick = floor(_notes * 0.32)
			rankNotes.rad = floor(_notes * 0.48)
		}
	}
}

function SetRank(_rank)
{
	rank = _rank
	rA = 0
	rSize = rSizeMax
}

//Draw Functions
function DrawMultiplierbar(_x, _y)
{
	draw_sprite_ext(
		spr_multiplierbar_base,
		0,
		camX+_x,
		camY+_y,
		4,
		4,
		0,
		c_white,
		1
	)
	
	mbLerpPos = lerp(mbLerpPos,multiplier-1,mbLerpA)
	//mbLerpPos = lerp(mbLerpPos,fire,mbLerpA)
	//show_debug_message("MultiplierBarLerpPos "+string(mbLerpPos))
	draw_sprite_part_ext(
		spr_multiplierbar,
		image_index,
		0,
		1,
		40 * (mbLerpPos/(multiplierMax-1)),//(fire / fireMax)
		9,
		camX+_x,
		camY+_y+4,
		4,
		4,
		c_white,
		1		
	)
}

function DrawComboMeter(_x, _y)
{
	draw_sprite_ext(
		spr_combo_meter_base,
		0,
		camX+_x,
		camY+_y,
		4,
		4,
		0,
		c_white,
		1
	)
	
	//mbLerpPos = lerp(mbLerpPos,multiplier-1,mbLerpA)
	//show_debug_message("MultiplierBarLerpPos "+string(mbLerpPos))
	//var _rank = 0
	var _target = 0
	var _boost = 0
	var _percent = 0
	switch(rank)
	{
		case Rank.none:
			_target = rankNotes.dull
			break;
			
		case Rank.dull:
			_boost = rankNotes.dull
			_target = rankNotes.cool
			break;
			
		case Rank.cool:
			_boost = rankNotes.cool
			_target = rankNotes.based
			break;
			
		case Rank.based:
			_boost = rankNotes.based
			_target = rankNotes.ace
			break;
			
		case Rank.ace:
			_boost = rankNotes.ace
			_target = rankNotes.sick
			break;
			
		case Rank.sick:
			_boost = rankNotes.sick
			_target = rankNotes.rad
			break;
			
		case Rank.rad:
			_boost = rankNotes.ace
			_target = rankNotes.rad
			break;
	}
	show_debug_message("Target "+string(_target))
	_percent = (combo - _boost) / (_target - _boost)
	draw_sprite_part_ext(
		spr_combo_meter,
		image_index,
		1,
		1,
		47 * _percent, //4* (mbLerpPos/(multiplierMax-1)),
		10,
		camX+_x+4,
		camY+_y+4,
		4,
		4,
		c_white,
		1		
	)
}

function DrawRank(_x, _y)
{
	var _rankI = rank
	
	rA = lerp(rA,1,rAAmount)
	rSize = lerp(rSize,rSizeMin,rSizeA)
	
	draw_sprite_ext(
		spr_rank,
		_rankI,
		_x,
		_y,
		rSize,
		rSize,
		0,
		c_white,
		rA
	)
}