/// @description Instructions
draw_instructions("RIGHT or LEFT to shift colors\nUP or DOWN to gradually change colors\nSPACE to hide code\nPress ENTER to go to next example");
draw_title("Full Screen Swap");
           
draw_palette(GUI_W * .05, GUI_H * .4,8,spr_pope_pal,current_pal);
if(keyboard_check(vk_space) || gamepad_button_check(0,gp_face1)) exit;
draw_code(GUI_W * .1, GUI_H * .5, GUI_W *.85,
          "---CREATE EVENT---\n"+
          "application_surface_draw_enable(false);\n"+

          "\n---DRAW EVENT---\n"+
          "for(var _x = 0; _x<room_width; _x+=sprite_get_width(spr_pixelated_pope)) {\n"+
          " for(var _y = 0; _y<room_height; _y+=sprite_get_height(spr_pixelated_pope)) {\n"+
          "   draw_sprite(spr_pixelated_pope,image_index,_x,_y)\n"+
          " }\n"+
          "}\n"+


          "\n---POST DRAW EVENT---\n"+
          "pal_swap_set(spr_pope_pal, "+string(current_pal)+ ", false);\n"+
          "draw_surface_stretched(application_surface,0,0,GUI_W,GUI_H);\n"+
          "pal_swap_reset();");


