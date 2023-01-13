/// @description Instructions
draw_instructions("Dynamically created surface palette\nSPACE to toggle smooth transitions\nPress ENTER to go to next example");
draw_title("Palette Cycle");

//Draw Original for comparison.
draw_sprite_ext(sprite_index,image_index,GUI_W *.15,GUI_H*.55,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

//Create Surface pal
if(!surface_exists(pal_surface)){
  var _height = pal_swap_get_color_count(spr_pope_pal)
  pal_surface = surface_create(steps + 1,_height);
  surface_set_target(pal_surface);
  draw_clear_alpha(0,0);
  pal_swap_draw_palette(spr_pope_pal,0,0,0);
  draw_rectangle_color(1,0,steps-2,_height-1,c_red,c_yellow,c_red,c_yellow,false)
  surface_reset_target();
}

draw_palette(GUI_W * .25, GUI_H * .4,8,pal_surface,current_pal,true);


///Draw With Palette Swap
pal_swap_set(pal_surface,smooth ? current_pal : round(current_pal),true);
    draw_sprite_ext(sprite_index, image_index, 
                    GUI_W * .45, GUI_H*.55, 
                    image_xscale, image_yscale, 
                    image_angle, image_blend, image_alpha);
pal_swap_reset();
                    
draw_code(GUI_W * .55, GUI_H * .6, GUI_W *.35, 
            "if(!surface_exists(pal_surface)){\n"+
            "  var _height = pal_swap_get_color_count(spr_pope_pal)\n"+
            "  pal_surface = surface_create(steps + 1,_height);\n"+
            "  surface_set_target(pal_surface);\n"+
            "  draw_clear_alpha(0,0);\n"+
            "  pal_swap_draw_palette(spr_pope_pal,0,0,0);\n"+
            "  draw_rectangle_color(1,0,steps-2,_height-1,\n"+
            "                       c_red,\n"+
            "                       c_yellow,\n"+
            "                       c_red,\n"+
            "                       c_yellow,\n"+
            "                       false)\n"+
            "  surface_reset_target();\n"+
            "}\n\n"+
            "pal_swap_set(pal_surface, "+string(current_pal) + ", true);\n"+
            "draw_self();\n"+
            "pal_swap_reset();");

