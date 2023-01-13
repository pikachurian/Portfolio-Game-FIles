/// @description Insert description here
// You can write your code in this editor
if(global.midTransition)exit
if(room = rm_story)
{
	if(!instance_exists(obj_beat_master))exit
	
	var _text = "i am error"
	if(storyOn != 6)
	{
		
		switch(storyOn)
		{
			case 0:
				_text = "World 1 PUNK CITY"		
				break;
			
			case 2:
				_text = "World 2 CLOUD TOWN"		
				break;
			
			case 4:
				_text = "World 3 CASTLE REALLY HIGH"		
				break;
		}
	}else
	{
		draw_sprite(spr_ending,0,0,0)
		_text = "Your journey has ended for now\nYet, the dude in the blue bandana is nowhere in sight..."
	}
	draw_set_font(fnt_2p)
	draw_set_halign(fa_center)
	draw_set_color(c_black)
	
	if(storyOn != 1 || storyOn != 3 || storyOn != 5)
	{
		draw_text(room_width/2,room_height/2-128,_text)
		draw_set_color(c_white)
		draw_text(room_width/2+4,room_height/2-128+4,_text)
	}
	
	draw_set_font(Font1)
	draw_set_halign(fa_left)
	draw_set_color(c_white)
}else if(room = rm_intro)
{
	draw_set_font(fnt_2p)
	draw_set_halign(fa_center)
	draw_set_color(c_black)
	
	var _text = "A GAME BY PIKACHURIAN MC_CREEPER KIRBYBOWWOW"
	draw_text(room_width/2,room_height/2-128,_text)
	draw_set_color(c_white)
	draw_text(room_width/2+4,room_height/2-128+4,_text)
	
	draw_set_font(Font1)
	draw_set_halign(fa_left)
	draw_set_color(c_white)
}