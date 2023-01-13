/// @description Insert description here
// You can write your code in this editor
if(room = rm_gameover)
{
	//
}else	if(room = rm_victory)
{
	var _score = 0
	for(var i = 0;i< ds_list_size(dsInventory);i++)
	{
		var _itemOn = dsInventory[|i]
		_score += _itemOn[|ItemInfo.value]
	}
	draw_set_font(fnt_way)
	draw_text(8,0+96,"SCORE "+string(_score))
	draw_text(8,16+96,"Lowest Floor "+string(furthestLevel))
}else	if(room = rm_title)
{
	//draw_self()
}