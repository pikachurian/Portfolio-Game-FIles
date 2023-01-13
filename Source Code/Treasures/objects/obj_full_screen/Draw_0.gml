/// @description
for(var _x = 0; _x<room_width; _x+=sprite_get_width(spr_pixelated_pope)) {
 for(var _y = 0; _y<room_height; _y+=sprite_get_height(spr_pixelated_pope)) {
   draw_sprite(spr_pixelated_pope,image_index,_x,_y)
 }
}