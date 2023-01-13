/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white)//Delete this to make it flash red

/*draw_text(640,4,"gridPosX: "+string(gridPosX))
draw_text(640+128,4,"gridPosY: "+string(gridPosY))
draw_text(640,4+16,"GridBeat: "+string(gridBeat))
draw_text(640,4+32,"Notes: "+string(ds_list_size(dsNotes)))*/
draw_text(640+64,4,"gridPosX: "+string(gridPosX))
draw_text(640+128+64,4,"gridPosY: "+string(gridPosY))
draw_text(640+64,4+16,"GridBeat: "+string(gridBeat))
draw_text(640+64,4+32,"Notes: "+string(ds_list_size(dsNotes)))
draw_text(640+64,4+48,"Thoomps: "+string(ds_list_size(dsThoomps)))

var _measureOn = 1
for(var yy=0;yy<gridRows;yy++)
{
	for(var xx=0;xx<measuresOnScreen*minNoteDiv;xx++)
	{
		var _iIndex = 1
		if(yy == 1 || yy == 5)_iIndex = 0
		draw_sprite(
			spr_grid_beta,
			_iIndex,
			(gridSize*xx)+gridStartX,
			(gridSize*yy)+gridStartY
		)
		if(yy=0 && xx % 4 = 0)
		{
			draw_set_color(c_white)
			draw_line_width(
			(gridSize*xx)+gridStartX,
			gridStartY-16,
			(gridSize*xx)+gridStartX,
			540,//magical number
			4
			)
			draw_text((gridSize*xx)+gridStartX,gridStartY-32,string(_measureOn+(pageOn*(measuresOnScreen*4))))
			_measureOn ++
		}
	}
}

//In Memory of Drawthe notes in teh grid

draw_set_color(c_white)
draw_text(8,580,"Song Info")
draw_text(8,580+(1*16),"Song Name: "+string(songName))
draw_text(8,580+(2*16),"BPM: "+string(bpm))

//Drawing inspector
//draw_set_color(c_grey)
//draw_rectangle(1080,gridStartY,room_width,room_height,false)

//DRAW NOTE STUFF

if(selectedNote != noone)
{
	var _selectedNoteTypeSprite = selectedNote.noteType.sprite
	if(state == ES.typeEdit)
	{
		if(doTypeOptions != noone && dropoutOver != noone)_selectedNoteTypeSprite = noteTypes[dropoutOver].sprite
	}
	draw_sprite(_selectedNoteTypeSprite,0,640,580+(3*16))
	draw_text(640,580+(0*16),"SelectedNote: "+string(selectedNote.noteType.tName))//string(GetTypeName(selectedNote.noteType)))
	draw_text(640,580+(1*16),"Beat: "+string(selectedNote.beat))
	draw_text(640,580+(2*16),"Row: "+string(selectedNote.row))
	draw_text(720,580+(3*16),"SpawnBeatOff: "+string(selectedNote.spawnBeatOff))
	draw_text(720,580+(4*16),"SpawnBeat: "+string(selectedNote.spawnBeatOff+selectedNote.beat))
	draw_text(720,580+(5*16),"EndBeat: "+string(selectedNote.endBeat))
	if(selectedNote.beat != selectedNote.endBeat)
	{
		var posS = PosFromBeatRow(selectedNote.beat,selectedNote.row)
		var posE = PosFromBeatRow(selectedNote.endBeat,selectedNote.row)
		draw_line_width(
			posS[0],
			posS[1]+gridSize/2,
			posE[0]+gridSize/2,
			posE[1]+gridSize/2,
			3
		)
	}
}

//Draw The Notes in The Grid
DrawNotesInGrid()

//Draw SELECTED NOTE TYPE
var _123sprite = noteTypes[currentNoteType].sprite
if(state == ES.dropout || state == ES.doCurrentNoteType)
{
	if(doTypeOptions != noone && dropoutOver != noone)_123sprite = noteTypes[dropoutOver].sprite
}
draw_sprite_ext(
	_123sprite,
	0,
	obj_button_notetype.x+64,
	0,
	0.5,
	0.5,
	0,
	c_white,
	1
)

//DRAW SONG POSITION BAR
DrawSongPositionBar()

/*for(var i = 0;i<4*measuresOnScreen;i++)
{
	draw_set_color(c_white)
	draw_line_width(
	
	)
}