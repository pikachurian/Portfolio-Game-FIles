/// @description Insert description here
// You can write your code in this editor
vx = obj_camera.x
vy = obj_camera.y

var _upLeftX = vx-vw/2
var _upLeftY = vy-vh/2

healthbarX = (vx-vw/2)+16
healthbarY = (vy-vh/2)+8

//draw_sprite(spr_healthbar_border,0,_upLeftX+4,_upLeftY+4)
draw_sprite(spr_healthbar_border,0,_upLeftX+16,_upLeftY+8)
draw_sprite_stretched(spr_healthbar,0,healthbarX,healthbarY,(os.hp/os.hpMax)*healthbarWidth,healthbarHeight)
draw_set_font(fnt_way)
draw_set_color(c_white)
//draw_text(_upLeftX+72,_upLeftY+4,"Room "+string(os.level))
//draw_text(_upLeftX+72,_upLeftY+6,"Room "+string(os.level))
draw_text(_upLeftX+160,_upLeftY+6,"Room "+string(os.level))
draw_text(_upLeftX+72,_upLeftY+6,"HP "+string(os.hp)+" / "+string(os.hpMax))

//draw_text(_upLeftX+230,_upLeftY+6,"HP "+string(os.hp)+" / "+string(os.hpMax))
draw_sprite(spr_icon_weight, 0,_upLeftX+242,_upLeftY+6)
draw_text(_upLeftX+256,_upLeftY+6,string(os.weight)+" / "+string(os.weightMax))
//draw_text(x+32,y+32,string(vx))
//draw_text(x+32,y+40,string(vy))

var _score = 0
for(var i = 0;i< ds_list_size(os.dsInventory);i++)
{
	var _itemOn = os.dsInventory[|i]
	_score += _itemOn[|ItemInfo.value]
}

draw_text(_upLeftX+8,_upLeftY+24,"SCORE "+string(_score))
if(oPlayer.drawFps = 1)draw_text(_upLeftX+8,_upLeftY+36,"fps "+string(fps))

/*for(var i = 0;i < ds_list_size(os.dsInventory)-1;i++)
{
	game_restart()
	var _itemOn = os.dsInventory[|i]
	draw_sprite_ext(spr_item_icons_2,_itemOn[ItemInfo.icon],_upLeftX+8*i,_upLeftY+16,0.5,0.5,0,c_white,1)
}*/