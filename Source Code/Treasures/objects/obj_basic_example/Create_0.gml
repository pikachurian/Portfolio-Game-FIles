/// @description Object Properties
image_xscale = 3;
image_yscale = image_xscale;

current_pal = 1;


///@func cycle_pal()
cycle_pal = function(){
  current_pal = keyboard_check_pressed(vk_right)  || gamepad_button_check_pressed(0,gp_padr) ? round(current_pal+1) : current_pal;
  current_pal = keyboard_check_pressed(vk_left)  || gamepad_button_check_pressed(0,gp_padl) ? round(current_pal-1) : current_pal;
  current_pal += (keyboard_check(vk_up)  || gamepad_button_check(0,gp_padu)) * .01;
  current_pal -= (keyboard_check(vk_down)  || gamepad_button_check(0,gp_padd)) * .01;
  
  current_pal = wrap(current_pal,0,pal_swap_get_pal_count(spr_pope_pal)-1); 
}

///@func draw_instructions(instructions)
draw_instructions = function(_instructions){
  draw_set_font(fnt_instructions);
  draw_set_text_alignment(7,c_white);
  draw_text(20,20,_instructions); 
}

///@func draw_title(title)
draw_title = function(_title) {
  draw_set_font(fnt_title);						 
  draw_set_text_alignment(5,c_white);
  draw_text(GUI_W/2,GUI_H - 40,_title);
}

///@func draw_palette(x,y,scale,pal_sprite,pal_index,?isSurface)
draw_palette = function(_x, _y, _scale, _sprite, _index, _isSurface) {
  
  if(_isSurface == undefined || !_isSurface) {
    draw_set_color(c_lime);
    var _size = 10;
    var height = pal_swap_get_color_count(_sprite)*_scale;
    draw_rectangle(_x+_index*_scale,
                   _y-_size,
                   _x+(_index+1)*_scale+1,
                   _y+height+_size+1,
                   false);
    draw_sprite_ext(_sprite,0,_x,_y,_scale,_scale,0,c_white,1);
    
    //Draw a rectangle around the current palette.
    draw_rectangle(_x+_index*_scale,
                   _y,
                   _x+(_index+1)*_scale,
                   _y+height,
                   true);
  } else {
    draw_set_color(c_lime);
    var _size = 10;
    var _height = surface_get_height(_sprite)*_scale;
    draw_rectangle(_x+_index*_scale,
                   _y-_size,
                   _x+(_index+1)*_scale+1,
                   _y+_height+_size+1,
                   false);
    draw_surface_ext(_sprite,_x,_y,_scale,_scale,0,c_white,1);
    
    //Draw a rectangle around the current palette.
    draw_rectangle(_x+_index*_scale,
                   _y,
                   _x+(_index+1)*_scale,
                   _y+_height,
                   true);
  }
}

///@func draw_code(x,y,width,code)
draw_code = function(_x, _y, _box_width, _code){
  draw_set_font(fnt_code);
  var _w = string_width(_code);
  var _scale = _box_width/_w;
  var _h = string_height(_code) * _scale;
  _y -= _h/2;
  var _margin = 10;
  draw_set_color(c_black)
  draw_set_alpha(.5);
  draw_roundrect(_x-_margin, _y -_margin, _x+_box_width+_margin,_y+_h+_margin,false);
  draw_set_alpha(1);
  draw_set_color(c_white)
  draw_roundrect(_x-_margin, _y -_margin, _x+_box_width+_margin,_y+_h+_margin,true);
  draw_set_text_alignment(7,c_white);
  draw_text_transformed(_x, _y,_code,_scale,_scale,0);
}