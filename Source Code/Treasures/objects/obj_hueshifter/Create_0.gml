// You can use this depth based system to apply shader to graphics in your game if you don't want to use application_surface.
// Place _start object on a maximum depth that should be affected by a shader,
// place _end object on a minimum depth. Place objects that should be "shadered" between these depths.

// But you also can apply this shader to any sprite, background or surface (or application_surface) standardly.


u_position = shader_get_uniform(shd_hue, "u_Position"); // control shader

// radians: pi - half a hue circle, 2 * pi - full circle
pos = 0;

os = obj_stats

//hueShifter.pos = 0.5//random(1)
//Set Hue
if(os.ascend == false)
{
	if(os.sameHueOn <= 0)
	{
		pos = random(256)
		os.sameHueOn = os.sameHue
	}else if(os.level != 1)pos = os.dsFloor[# os.level-1,FloorInfo.hue]
	
}else
{
	//Set Hue
	pos = os.dsFloor[# os.level,FloorInfo.hue]

}