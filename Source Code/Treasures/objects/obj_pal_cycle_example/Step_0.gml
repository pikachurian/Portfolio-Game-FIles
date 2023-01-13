/// @description

// Inherit the parent event
event_inherited();
if(keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0,gp_face1))
  smooth = !smooth;
  
current_pal =  sin_oscillate(1,steps-2,2);
current_pal = smooth? round(current_pal) : current_pal;

