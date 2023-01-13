/// @description Insert description here
// You can write your code in this editor
bm = obj_beat_master

spacing = 48

character = instance_create_depth(room_width/2-320,room_height-240,depth-10,obj_scoring_character)

cursor = instance_create_depth(-1000,0,depth-25,obj_punch_cursor)

bgColor = make_color_rgb(4,174,156)

missPosY = -64- (3 * spacing)
squarePosY = -64 - (2 * spacing)
sickPosY = -64 - (1 * spacing)
radPosY = -64 //-16
//missPosSprY = -16
//squarePosSprY = -16
//sickPosSprY = -16
//radPosSprY = -16
totalPosY = -64- (4 * spacing)

erPosY = -64- (8 * spacing)

input = obj_input

//rank lerp stuff
totalRankAlpha = 0
totalRankSize = 6

erRankAlpha = 0
erRankSize = 6

erRankAlpha = 0
erRankSize = 6

hpBonusPosY = -64 - (spacing * 12.75)

tsSize = 4
tsAlpha = 0

//Next
btnNextPosY = room_height+64

function GetRankScore(_rank)
{
	switch(_rank)
	{
		case Rank.dull:
			//
			return rankPoints.dull
			break;
			
		case Rank.cool:
			//
			return rankPoints.cool
			break;
			
		case Rank.based:
			//
			return rankPoints.based
			break;
			
		case Rank.ace:
			//
			return rankPoints.ace
			break;
			
		case Rank.sick:
			//
			return rankPoints.sick
			break;
			
		case Rank.rad:
			//
			return rankPoints.rad
			break;
	}
	return 5
}

notesHitGoals = {
	rad : 100,
	sick : 90,
	ace : 75,
	based : 50,
	cool : 25,
	dull : 0
}

rankPoints = {
	rad : 250,
	sick : 200,
	ace : 150,
	based : 100,
	cool : 50,
	dull : 10
}

//
sickNotesY = 0
radNotesY = 0
totalNotesY = 0

//
var _tnRank = 1
var _notesHit = ((bm.scoreInfo.radNotes+bm.scoreInfo.sickNotes)/bm.scoreInfo.totalNotes)*100
_notesHit = floor(_notesHit)
if(_notesHit >= notesHitGoals.rad)_tnRank = Rank.rad
else if(_notesHit >= notesHitGoals.sick)_tnRank = Rank.sick
else if(_notesHit >= notesHitGoals.ace)_tnRank = Rank.ace
else if(_notesHit >= notesHitGoals.based)_tnRank = Rank.based
else if(_notesHit >= notesHitGoals.cool)_tnRank = Rank.cool
else _tnRank = 1

tnRank = _tnRank

var _tnRankPoints = GetRankScore(_tnRank)
var _erRankPoints = GetRankScore(bm.scoreInfo.lastRank)

healthBonus = bm.scoreInfo.hp * 2

totalScore = bm.scoreInfo.songScore + _tnRankPoints + _erRankPoints + healthBonus

//healthBonus = bm.scoreInfo.hp * 2



scoringFrame = 0

function TitleBg(_spr,_sprW,_sprH,_x,_y,_hspd,_vspd,_vTiles,_hTiles) constructor
{
	spr = _spr
	sprW = _sprW
	sprH = _sprH
	x = _x
	y = _y
	hspd = _hspd
	vspd = _vspd
	vTiles = _vTiles
	hTiles = _hTiles

}

bg1 = new TitleBg(
	spr_fc_bg_1,
	sprite_get_width(spr_fc_bg_1),
	sprite_get_height(spr_fc_bg_1),
	0,
	0,
	-1.6*0.75,
	0.9*0.75,
	round(room_height / sprite_get_height(spr_fc_bg_1)),
	round(room_width / sprite_get_width(spr_fc_bg_1))
)

bg2 = new TitleBg(
	spr_fc_bg_2,
	sprite_get_width(spr_fc_bg_2),
	sprite_get_height(spr_fc_bg_2),
	0,
	0,
	-1.6*1.0,
	0.9*1.0,
	round(room_height / sprite_get_height(spr_fc_bg_2)),
	round(room_width / sprite_get_width(spr_fc_bg_2))
)

bg3 = new TitleBg(
	spr_fc_bg_3,
	sprite_get_width(spr_fc_bg_3),
	sprite_get_height(spr_fc_bg_3),
	0,
	0,
	-1.6*1.25,
	0.9*1.25,
	round(room_height / sprite_get_height(spr_fc_bg_3)),
	round(room_width / sprite_get_width(spr_fc_bg_3))
)


function MainBgStep()
{
	bg1.x += bg1.hspd
	bg1.y += bg1.vspd

	if(bg1.x < -((bg1.hTiles-1)*bg1.sprW))bg1.x = 0
	if(bg1.y > ((bg1.vTiles-1)*bg1.sprH))bg1.y = 0

	//
	bg2.x += bg2.hspd
	bg2.y += bg2.vspd

	if(bg2.x < -((bg2.hTiles-1)*bg2.sprW))bg2.x = 0
	if(bg2.y > ((bg2.vTiles-1)*bg2.sprH))bg2.y = 0

	//
	bg3.x += bg3.hspd
	bg3.y += bg3.vspd

	if(bg3.x < -((bg3.hTiles-1)*bg3.sprW))bg3.x = 0
	if(bg3.y > ((bg3.vTiles-1)*bg3.sprH))bg3.y = 0
}

function DrawBg(_bg,_x,_y,_color)
{

	for(var yy = 0; yy < _bg.vTiles; yy ++)
	{
		for(var xx = 0; xx < _bg.hTiles; xx ++)
		{
			draw_sprite_ext(
				_bg.spr,
				0,
				_x+_bg.sprW*xx,
				_y+_bg.sprH*yy,
				1,
				1,
				0,
				_color,
				1
			)
		}
	}
}

