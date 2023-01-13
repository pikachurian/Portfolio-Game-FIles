/// @description Insert description here
beatM = obj_beat_master

myNoteId = noone

startX = room_width+128
spawnBeatOff =  -8//Edit me in song editor script
beat = 4
hitX = obj_player.noteHitX//128

spawnBeat = 0

killzone = -128

laneOffY = 0//-56

myLane = 4//3

spd = 0

a = 0

iSpd = image_speed

noteHitBeat = noone

shadowOffY = 0
shadowSize = 1

upixelH = shader_get_uniform(sh_outline, "pixelH")
upixelW = shader_get_uniform(sh_outline, "pixelW")
texelW = 8*texture_get_texel_width(sprite_get_texture(sprite_index,0))
texelH = 8*texture_get_texel_height(sprite_get_texture(sprite_index,0))

function Hit()
{
	beatM.songs[beatM.songId].notes[myNoteId].inst = noone
	instance_create_depth(x,y,depth-5,obj_hit_effect)
	instance_destroy()
}