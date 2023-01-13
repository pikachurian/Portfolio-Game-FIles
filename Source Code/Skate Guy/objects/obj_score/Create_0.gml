/// @description Insert description here
// You can write your code in this editor
cam = view_camera[0]
camX = 0
camY = 0
camW = 0
camH = 0

UpdateCameraVariables(cam)

timeScore = 0
time = 0
countTimeScore = false

function StartTimeCount()
{
	countTimeScore = true
	time = 0
	timeScore = 0
}

function StopTimeCount()
{
	countTimeScore = false
}

function DrawScore()
{
			draw_sprite_ext(
			spr_score,
			0,
			camX+8,
			camY + 8,
			2,
			2,
			0,
			c_white,
			1
		)
		
		draw_set_font(global.numberFont)
		draw_text_transformed(
			camX+8,
			camY+32,
			string(timeScore),
			2,
			2,
			0
		)
		draw_set_font(Font1)
}

function Reset()
{
	timeScore = 0
	time = 0
}
