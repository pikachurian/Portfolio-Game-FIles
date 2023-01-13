// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function room_goto_fade(_nextRoom,_roomRestart,_spd){
	with(instance_create_depth(0,0,-99999,obj_fade_inout))
	{
		spd = _spd
		nextRoom = _nextRoom
		roomRestart = _roomRestart
	}
}