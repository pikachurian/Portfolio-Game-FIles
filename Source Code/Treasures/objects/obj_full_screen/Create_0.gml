/// @description Turn off app surface drawing

// Inherit the parent event
event_inherited();
current_pal = 0;
application_surface_draw_enable(false);


