/// @description Insert description here
// You can write your code in this editor
p = obj_player
cam = view_camera[0]
camX = 0
camY = 0
camW = 0
camH = 0

UpdateCameraVariables(cam)

low = {
	obs : [obj_ballon,obj_ballon,obj_ballon,obj_bird],
	spawnTime : room_speed * 0.5,
	spawnTick : room_speed * 0.5,
	spawnY1 : 750,//725,
	spawnY2 : -399
}

mid = {
	obs : [obj_ballon,obj_ballon,obj_bird],
	spawnTime : room_speed * 0.5,
	spawnTick : room_speed * 0.5,
	spawnY1 : -400,
	spawnY2  : -1799
}

high = {
	obs : [obj_meteor,obj_meteor,obj_meteor,obj_ballon],
	spawnTime : room_speed * 0.5,
	spawnTick : room_speed * 0.5,
	spawnY1 : -1800,
	spawnY2  : -3200
}

//lowObs = [obj_ballon,obj_ballon,obj_bird]

//midObs = [obj_ballon,obj_bird]

//highObs = [obj_ballon, obj_meteor, obj_meteor]

midThreshold = 0//220
highThresHold = -800

zone = low
spawningZone = low

spdBonus = 0
spdBonusAccel = 0.25
spdBonusTime = 10 * room_speed
spdBonusTick = spdBonusTime

function StartGame()
{
	spdBonus = 0
	spdBonusTick = spdBonusTime
}

function ZoneUpdate(_zone)
{
	if(_zone.spawnTick <= 0)
	{
		spawningZone = _zone
		var _roll = irandom(array_length(_zone.obs)-1)
		var _inst = instance_create_depth(camX+camW+32,camY+camH/2,depth,_zone.obs[_roll])
		with(_inst)
		{
			var _roll = random_range(-1,1)
			spd += _roll + other.spdBonus
			//if(other.zone = other.low)_roll = random_range(other.camY-320,other.camY+other.camH/2)
			//else _roll = random_range(other.camY-320,other.camY+other.camH/2)
			_roll = random_range(other.spawningZone.spawnY1,other.spawningZone.spawnY2)
			yy = _roll//other.camY+other.camH/2
		}
		/*_roll = irandom(array_length(zone.obs)-1)
	    _inst = instance_create_depth(camX+camW+32,camY+camH/2,depth,zone.obs[_roll])
		with(_inst)
		{
			var _roll = random_range(-1,1)
			spd += _roll
			if(other.zone = other.low)_roll = random_range(other.camY,other.camY+other.camH)
			else _roll = random_range(other.camY,other.camY+other.camH+240)
			yy = _roll//other.camY+other.camH/2
		}*/
		_roll = random_range(-0.25,0.25)
		_zone.spawnTick = _zone.spawnTime + (_roll*room_speed) - spdBonus
		_zone.spawnTick = max(_zone.spawnTick,0.1)
	}else _zone.spawnTick --
}