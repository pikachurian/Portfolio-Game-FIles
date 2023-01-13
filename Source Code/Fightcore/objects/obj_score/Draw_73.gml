/// @description Insert description here
// You can write your code in this editor
/*fire = 55
rank = Rank.based
rA = 1
rSize = 4*/
//show_debug_message("Missed Notes "+string(missedNotes))
if(obj_player.state != PS.dead)
{
	DrawMultiplierbar(8,84)
	cmY = lerp(cmY,128,0.1)
	DrawComboMeter(8,cmY)
	//DrawRank(32+32,128+32)
	//DrawRank(32+170,128-72)
	DrawRank(32+172,128-72)
	draw_set_font(fnt_2p)
	draw_set_halign(fa_left)
	//draw_text(room_width/2,32,"SCORE\n"+string(songScore))
	draw_set_color(c_black)
	draw_text(280+4,27+4,"SCORE "+string(songScore))
	draw_set_color(c_white)
	draw_text(280,27,"SCORE "+string(songScore))

	draw_set_font(Font1)
	draw_set_halign(fa_left)
}else
{
	
}