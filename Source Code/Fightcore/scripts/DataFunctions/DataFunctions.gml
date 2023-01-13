// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DataFunctions(){

}

//This is information relating to the note type, such a sprite, and maybe behaviors
//The regular note constructor holds more general things, like the beat and type
function NoteType(_name, _sprite,_spawnBeatOff,_obj) constructor
{
	tName = _name
	sprite = _sprite
	spawnBeatOff = _spawnBeatOff
	obj = _obj
}

function Background(_name, _sprite, _scriptCreate, _scriptStep, _scriptDraw, _scrollSpd) constructor
{
	tName = _name
	sprite = _sprite
	scriptCreate = _scriptCreate
	scriptStep = _scriptStep
	scriptDraw = _scriptDraw
	scrollSpd = _scrollSpd
}

//Note Type
global.noteTypes[NType.mr0] = new NoteType("Mr 0",spr_editor_enemy_0,-8,noone)
global.noteTypes[NType.mr1] = new NoteType("Mr 1",spr_editor_enemy_1,-8,noone)
global.noteTypes[NType.draftpunk] = new NoteType("DraftPunk",spr_nt_draftpunk,-6/*-7*/,obj_draftpunk)
global.noteTypes[NType.dpmotorist] = new NoteType("dpMotorist",spr_nt_dpmotorist,-4,obj_dpmotorist)
global.noteTypes[NType.dpbuffguy] = new NoteType("dpBuffGuy",spr_nt_dpbuffguy,-8,obj_dp_buff_guy)
global.noteTypes[NType.runningMan] = new NoteType("RunningMan",spr_nt_running_man,-6,obj_running_man)
global.noteTypes[NType.skullDriver] = new NoteType("SkullDriver",spr_nt_skull_driver,-4,obj_skull_driver)
global.noteTypes[NType.mechaMan] = new NoteType("MechaMan",spr_nt_mecha_man,-8,obj_mecha_man)
global.noteTypes[NType.oldKnight] = new NoteType("OldKnight",spr_nt_old_knight,-6,obj_old_knight)
global.noteTypes[NType.klogoro] = new NoteType("Klogoro",spr_nt_klogoro,-4,obj_klogoro_lean)
global.noteTypes[NType.bigKnight] = new NoteType("BigKnight",spr_nt_big_knight,-8,obj_big_knight)
//Nightcore
global.noteTypes[NType.ncDraftpunk] = new NoteType("NcDraftPunk",spr_nt_nc_draftpunk,-6,obj_nc_draftpunk)
global.noteTypes[NType.ncDpmotorist] = new NoteType("NcDpMotorist",spr_nt_nc_dpmotorist,-4,obj_nc_dpmotorist)
global.noteTypes[NType.ncDpbuffguy] = new NoteType("NcDpBuffGuy",spr_nt_nc_dpbuffguy,-8,obj_nc_dp_buff_guy)
global.noteTypes[NType.ncRunningMan] = new NoteType("NcRunningMan",spr_nt_nc_running_man,-6,obj_nc_running_man)
global.noteTypes[NType.ncSkullDriver] = new NoteType("NcSkullDriver",spr_nt_nc_skull_driver,-4,obj_nc_skull_driver)
global.noteTypes[NType.ncMechaMan] = new NoteType("NcMechaMan",spr_nt_nc_mecha_man,-8,obj_nc_mecha_man)
global.noteTypes[NType.ncOldKnight] = new NoteType("NcOldKnight",spr_nt_nc_old_knight,-6,obj_nc_old_knight)
global.noteTypes[NType.ncKlogoro] = new NoteType("NcKlogoro",spr_nt_nc_klogoro,-4,obj_nc_klogoro_lean)
global.noteTypes[NType.ncBigKnight] = new NoteType("NcBigKnight",spr_nt_nc_big_knight,-8,obj_nc_big_knight)

//--Backgrounds--
global.backgrounds[0] = noone
global.backgrounds[1] = new Background("Sunset",spr_bg_sunset_big,noone,noone,noone,noone)
global.backgrounds[2] = new Background("City",spr_bg_city_big,noone,noone,noone,noone)
global.backgrounds[3] = new Background("Sky",spr_bg_sky_big,noone,noone,noone,noone)
global.backgrounds[4] = new Background("Castle Sky",spr_bg_castle_sky_big,noone,noone,noone,noone)
global.backgrounds[5] = new Background("Cloud Ground",spr_bg_sky_ground_big,noone,noone,noone,noone)
global.backgrounds[6] = new Background("Castle Ground",spr_bg_castle_ground_big,noone,noone,noone,noone)
global.backgrounds[7] = new Background("Cloud Ship",spr_bg_sky_ships_big,noone,noone,noone,1)
global.backgrounds[8] = new Background("Castle Pillars",spr_bg_castle_pillars_big,noone,noone,noone,4)
