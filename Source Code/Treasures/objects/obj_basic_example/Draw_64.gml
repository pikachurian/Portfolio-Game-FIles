/// @description Instructions
draw_instructions("RIGHT or LEFT to shift colors\nUP or DOWN to gradually change colors\nPress ENTER to go to next example");
draw_title("Basic Palette Swap");

//Draw Original for comparison.
draw_sprite_ext(sprite_index,image_index,GUI_W *.15,GUI_H*.55,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

///Draw With Palette Swap     
pal_swap_set(spr_pope_pal,current_pal,false);
    draw_sprite_ext(sprite_index,image_index,GUI_W * .45,GUI_H*.55,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
pal_swap_reset();
                     

draw_palette(GUI_W * .28, GUI_H * .4,8,spr_pope_pal,current_pal);

draw_code(GUI_W * .55, GUI_H * .6, GUI_W *.35, 
            "pal_swap_set(spr_pope_pal, "+string(current_pal)+ ", false);\n"+
            "draw_self();\n"+
            "pal_swap_reset();");

