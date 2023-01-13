/// @description Insert description here
// You can write your code in this editor
UpdateCameraVariables(cam)

var _lastZone = zone

if(p.yy <= highThresHold)zone = high
else if(p.yy <= midThreshold)zone = mid
else zone = low

if(_lastZone != zone)
{
	//zone.spawnTick = zone.spawnTime	
}

ZoneUpdate()

//show_debug_message("zone "+string(zone))