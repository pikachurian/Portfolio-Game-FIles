/// @description Insert description here
// You can write your code in this editor
if(combo != 0 && !isDead && !hitstunTick <= 0)
{
	var _comboStr = ""
	_comboStr = string(combo)
	comboLerpY = lerp(comboLerpY,y+comboOffY,comboLerpA)
	comboSize = lerp(comboSize,comboSizeMin,comboSizeA)
	comboAlpha = lerp(comboAlpha, 1, comboAlphaA)
	for(var i = 0; i < string_length(_comboStr); i ++)
	{
		var _l = string_char_at(_comboStr,string_length(_comboStr)-i)
		//show_debug_message(_l)
		var _r = real(_l)
		draw_sprite_ext(
			spr_combo_numbers,
			_r,
			x-(i*(sprite_get_width(spr_combo_numbers)))-32,
			comboLerpY,
			comboSize,
			comboSize,
			0,
			c_white,
			comboAlpha
		)
	}
	
	//draw shield
	draw_sprite_ext(
		spr_shield_meter_base,
		0,
		x+32,
		comboLerpY-32,
		4,
		4,
		0,
		c_white,
		1
	)
	
	//shieldPercent = lerp(shieldPercent,shieldPercentTarget,0.1)
	//shieldPercent = 1
	shieldPercent = lerp(1, 0, shieldPercentA)
	spLerp = lerp(spLerp,shieldPercent,0.1)
	
	draw_sprite_part_ext(
		spr_shield_meter,
		0,
		0,
		21-21*spLerp,
		22,
		21,
		x+32,
		(comboLerpY+52)+(84*-spLerp),//(comboLerpY-32)+(84*shieldPercent),
		4,
		4,
		c_white,
		1
	)
	//show_debug_message(_comboStr)
}else if(combo != 0)
{
	var _comboStr = ""
	_comboStr = string(combo)
	comboLerpY = lerp(comboLerpY,y+comboOffY,comboLerpA)
	comboSize = lerp(comboSize,comboSizeMin,comboSizeA)
	comboAlpha = lerp(comboAlpha, 0, comboAlphaA)
	for(var i = 0; i < string_length(_comboStr); i ++)
	{
		var _l = string_char_at(_comboStr,string_length(_comboStr)-i)
		//show_debug_message(_l)
		var _r = real(_l)
		draw_sprite_ext(
			spr_combo_numbers,
			_r,
			x-(i*(sprite_get_width(spr_combo_numbers))),
			comboLerpY,
			comboSize,
			comboSize,
			0,
			c_white,
			comboAlpha
		)
	}
}