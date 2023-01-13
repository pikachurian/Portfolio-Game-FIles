/// @description Insert description here
// You can write your code in this editor
image_speed = 0

if(obj_player.state = "cutscene1")exit

draw_sprite_ext(spr_coin_1,0,64,64,2,2,1,c_white,1)

if(room = rm_1_0)
{
	draw_set_color(c_black)
	draw_text_ext_transformed(96,64,obj_player_stats.coins_level_0,1,1,2.5,2.5,1)
}

if(room = rm_1_1)
{
	draw_set_color(c_black)
	//draw_text_ext_transformed(32,32,"HELLO",2,2,2,2,1)
	draw_text_transformed(96,38,string(obj_player_stats.coins_level_1) + "/3",2,2,1)
	draw_set_color(c_white)
	//draw_text_ext_transformed(32,32,"HELLO",2,2,2,2,1)
	draw_text_transformed(99,40,string(obj_player_stats.coins_level_1) + "/3",2,2,1)
	//draw_text(32,32,"HELLO")
}

/*
if(room = rm_1_1)
{
	draw_set_color(c_black)
	//draw_text_ext_transformed(32,32,"HELLO",2,2,2,2,1)
	draw_text_transformed(96,38,obj_player_stats.coins_level_1,2.5,2.5,1)
	draw_set_color(c_white)
	//draw_text_ext_transformed(32,32,"HELLO",2,2,2,2,1)
	draw_text_transformed(97,42,obj_player_stats.coins_level_1,2,2,1)
	//draw_text(32,32,"HELLO")
}
*/