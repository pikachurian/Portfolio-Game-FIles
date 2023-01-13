/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white)
draw_sprite(sprite_index,image_index,x,y)

//draw menu
switch(state)
{
	case TitleMenu.start:
	{
		draw_set_color(c_white)
		draw_set_font(fnt_pixel_0)
		draw_text(x+menuOffsetX,y+menuOffsetY,"PRESS ENTER")
	}break
	
	case TitleMenu.main:
	{
		draw_set_font(fnt_pixel_0)
		for(var _i = 0;_i<array_length(menu);_i++)
		{
			if(_i == menuOn)draw_set_color(c_orange)
			else draw_set_color(c_white)
			draw_text(x+menuOffsetX,y+menuOffsetY+12*_i,menu[_i])
		}
	}break
	
	case TitleMenu.help:
	{
		var _textHelp = "WASD to move.\nSpace to jump.\nK to attack.\nJ to use a your whip sword to grapple on to walls (you can only grapple when you're pressing a direction including diagonals).\nPress J again to zip up toward the end of the grapple.\nA and D to swing around when you deployed the whip sword.\nW and S to raise and lower the grapple when it's deployed.\nE to interact with doors and treasure.\nF4 for fullscreen.\nReturn back to the surface with your treasure to win./nRemember, there is a limit on how much treasure you can carry, and treasure is worth more the farther you go."
		draw_set_font(fnt_arial_small)
		draw_set_color(c_black)
		draw_rectangle(x,y,x+500,y+500,false)
		draw_set_color(c_white)
		draw_text_ext(x,y,_textHelp,12,300)
		draw_set_font(fnt_pixel_0)
		draw_text(x,y+220,"PRESS ENTER TO RETURN")
	}break
	
	case TitleMenu.credits:
	{
		var _textCredits = "Code by: pikachurian\nArt by: MC_Creeper\nSound by:Kirbybowwow"
		draw_set_font(fnt_arial_small)
		draw_set_color(c_black)
		draw_rectangle(x,y,x+500,y+500,false)
		draw_set_color(c_white)
		draw_text_ext(x,y,_textCredits,12,300)
		draw_set_font(fnt_pixel_0)
		draw_text(x,y+220,"PRESS ENTER TO RETURN")
	}break
}

draw_set_color(c_white)