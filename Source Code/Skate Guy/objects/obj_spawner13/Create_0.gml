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
	spawnTick : room_speed * 0.5
}

mid = {
	obs : [obj_ballon,obj_ballon,obj_bird],
	spawnTime : room_speed * 1,
	spawnTick : room_speed * 1
}

high = {
	obs : [obj_ballon,obj_ballon,obj_bird],
	spawnTime : room_speed * 2,
	spawnTick : room_speed * 2      
}

//lowObs = [obj_ballon,obj_ballon,obj_bird]

//midObs = [obj_ballon,obj_bird]

//highObs = [obj_ballon, obj_meteor, obj_meteor]

midThreshold = 0//220
highThresHold = -800

zone = low

function ZoneUpdate(_zone)
{
	if(zone.spawnTick <= 0)
	{
		var _roll = irandom(array_length(zone.obs)-1)
		var _inst = instance_create_depth(camX+camW+32,camY+camH/2,depth,zone.obs[_roll])
		with(_inst)
		{
			var _roll = random_range(-1,1)
			spd += _roll
			if(other.zone = other.low)_roll = random_range(obj_player.yy+128,obj_player.yy+other.camH-128)
			else _roll = random_range(obj_player.yy+172,obj_player.yy+other.camH+128)
			yy = _roll//other.camY+other.camH/2
		}
		/*_roll = irandom(array_length(zone.obs)-1)
	    _inst = instance_create_depth(camX+camW+32,camY+camH/2,depth,zone.obs[_roll])
		with(_inst)
		{
			var _roll = random_range(-1,1)
			spd += _roll
			if(other.zone = other.low)_roll = random_range(obj_player.yy+128,obj_player.yy+other.camH-128)
			else _roll = random_range(obj_player.yy+172,obj_player.yy+other.camH+128)
			yy = _roll//other.camY+other.camH/2
		}*/
		_roll = random_range(-0.25,0.25)
		zone.spawnTick = zone.spawnTime + (_roll*room_speed)
	}else zone.spawnTick --
}