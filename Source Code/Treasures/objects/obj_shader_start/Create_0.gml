// You can use this depth based system to apply shader to graphics in your game if you don't want to use application_surface.
// Place _start object on a maximum depth that should be affected by a shader,
// place _end object on a minimum depth. Place objects that should be "shadered" between these depths.

// But you also can apply this shader to any sprite, background or surface (or application_surface) standardly.


u_position = shader_get_uniform(shd_hue, "u_Position"); // control shader

// radians: pi - half a hue circle, 2 * pi - full circle
pos = 0;

