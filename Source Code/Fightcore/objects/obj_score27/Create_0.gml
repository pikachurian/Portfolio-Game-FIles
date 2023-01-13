/// @description Insert description here
// You can write your code in this editor
songScore = 0
multiplier = 1

sickPoints = 5
radPoints = 10

sickRange = 0.5
radRange = 0.1

//Add points to your score after multiplying them
function ScoreWithMultiplier(_points)
{
	songScore += _points * multiplier
}

function ScoreHit(_beatHit, _targetBeat)
{
	show_debug_message("Note Hit Diff "+string(abs(_targetBeat - _beatHit)))
	if(abs(_targetBeat - _beatHit) <= radRange)ScoreWithMultiplier(radPoints)
	else if(abs(_targetBeat - _beatHit) <= sickRange)ScoreWithMultiplier(sickPoints)
}