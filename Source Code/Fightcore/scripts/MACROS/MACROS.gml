// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MACROS(){

}

#macro MICROSECONDS 1000000
#macro SDFILETYPE ".sd"

global.paused = false
global.loadInFreeplay = false//This determins wheather to
//start rm_title in freeplay
global.loadTitleMenu = noone//A better more flexable
//version of the previous variable that stores
//Either a menu enum or noone

enum PS
{
	active,
	dead,
	
	enumCount
}

enum LInfo
{
	xPos,
	yPos,
	size,
	pSize,
	
	enumCount
}

enum SONG 
{
	punk,
	ncPunk,
	retroRock,
	ncRetroRock,
	yonslik,
	ncYonslik,
	scarletFire,
	toreador,
	ruinedPiano,
	ncRuinedPiano,
	
	enumCount
}

enum SStarted
{
	false,
	normal,
	withCount,
	
	enumCount
}

enum ES 
{
	free,
	bpmEdit,
	typeEdit,
	songPlaying,
	doCurrentNoteType,
	dropout,
	doSelectSong,
	doBgStatic,
	doBgScrolling2,
	doBgScrolling1,
	doBgForeground,
	endBeatEdit,
	songNameEdit,
	
	enumCount
}

enum RSS
{
	rad,
	sick,
	square,
	
	enumCount
}

enum NType 
{
	//normal,
	mr0,
	mr1,
	draftpunk,
	dpmotorist,
	dpbuffguy,
	runningMan,
	skullDriver,
	mechaMan,
	oldKnight,
	klogoro,
	bigKnight,
	ncDraftpunk,
	ncDpmotorist,
	ncDpbuffguy,
	ncRunningMan,
	ncSkullDriver,
	ncMechaMan,
	ncOldKnight,
	ncKlogoro,
	ncBigKnight,
	
	enumCount
}

enum Rank 
{
	none,
	dull,
	cool,
	based,
	ace,
	sick,
	rad,
	
	enumCount
}

enum TS 
{
	title,
	main,
	midTransition,
	freeplay,
	
	enumCount
}

enum SC //Scoring Character State
{
	idle,
	look,
	think,
	blink,
	cheer,
	dead,
	
	enumCount
}

/*enum NTheme
{
	square,
	circle,
	
	enumCount
}*/