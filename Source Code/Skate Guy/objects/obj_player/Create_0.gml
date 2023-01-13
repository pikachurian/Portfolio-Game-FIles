/// @description Insert description here
// You can write your code in this editor
SetImageScale(2)
input = obj_input


cam = view_camera[0]
camX = 0
camY = 0
camW = 0
camH = 0

UpdateCameraVariables(cam)

//Determines the angle of the board goes from 0, pointing up, to 1, pointing down
boardAngle = 0.5   

rotSpdUp = 0.035//0.025//0.015//0.0085
rotSpdDown = 0.03//0.02//0.01

iMaxAngle = 20//45
iMinAngle = 0//-10//-45

gravMin = 0.075//0.05//0.1
gravMax = 0.2//0.2//0.5

floatSpd = 1

fallSpdMin = 1.5//1//2
fallSpdMax = 4.5//3.5//2//4

vspd = 0

yMin = camY + 96//camY + 32

yMax = camY+300//camY + 360//camY + 140

startVelocity = 10
buttonPresses = 0

bounceVelocity = 12//8//25//40//4
bounceVelocityGreat = 16

rampX = camX+camW+960
rampY = camY+camH-24
rampSpd = 8

xx = 0
yy = y

state = PS.menu//PS.start

buttonMashInst = noone

gmOpOn = 0
gmOptions = ["retry","back"]

mashStartPitch = 0.75
mashPitch = mashStartPitch//0.75
mashPitchAccel = 0.05

function StateActive()
{
	var _floatSpd = 0

	if(input.button)
	{
		boardAngle -= rotSpdUp
		image_index = 0
		_floatSpd = floatSpd
	}
	else
	{
		boardAngle += rotSpdDown
		image_index = 1
	}
	
	if(input.buttonR)
	{
		Stomp()
	}

	boardAngle = clamp(boardAngle,0,1)

	var _grav = 0
	if(vspd <= 0)_grav = gravMax
	else _grav = lerp(gravMax,gravMin,input.button)
	vspd += _grav
	//vspd = clamp(vspd,fallSpdMin,fallSpdMax)
	var _fallSpd = lerp(fallSpdMax,fallSpdMin,input.button)
	vspd = min(_fallSpd,vspd)
	yy += vspd
	y = clamp(yy,yMin,yMax)
	
	if(y >= yMax)
	{
		state = PS.dead
		obj_score.StopTimeCount()
		gmOpOn = 0
		audio_play_sound(snd_lose,30,false)
	}
	
	//yy = camY+camH/2
	//y = camY+camH/2
}

function StateStart()
{
	//if(buttonMashInst == noone)buttonMashInst = instance_create_depth(camX+camW/2,camY+camH/2,-9999,obj_button_mash)
	if(buttonMashInst == noone)buttonMashInst = instance_create_depth(x-24,camY+camH/2,-9999,obj_button_mash)
	
	sprite_index = spr_player_standing
	yy = camY+camH-64
	
	if(input.buttonP)
	{
		buttonPresses += 1
		mashPitch += mashPitchAccel
		var _audio = audio_play_sound(snd_jump,21,false)
		audio_sound_pitch(_audio,mashPitch)
	}
	
	rampX -= rampSpd
	if(x >= rampX)
	{
		sprite_index = spr_player
		vspd = -(startVelocity + (max(buttonPresses/10,0)))
		with(buttonMashInst)instance_destroy()
		buttonMashInst = noone
		boardAngle = 0
		state = PS.active
		obj_score.StartTimeCount()
		audio_play_sound(snd_ramp,20,false)
	}
	
	y = clamp(yy,yMin,yMax)
}

function StateMenu()
{
	sprite_index = spr_player_standing
	yy = camY+camH-64
	y = yy//clamp(yy,yMin,yMax)
}

function Stomp()
{
	var _inst = instance_place(x,y,obj_obstacle_parent)
	if(_inst != noone && vspd >= 0)
	{
		if(y <= _inst.y)
		{
			vspd -= bounceVelocityGreat
			audio_play_sound(snd_high_jump,25,false)
		}
		else 
		{
			vspd -= bounceVelocity
			audio_play_sound(snd_jump,27,false)
		}
	}
}

function StateDead()
{
	yy = camY+camH-64
	if(input.buttonR)
	{
		if(gmOpOn == 1)gmOpOn = 0
		else gmOpOn = 1
		audio_play_sound(snd_change_selection,20,false)
	}
	if(input.buttonHeld)
	{
		audio_play_sound(snd_make_selection,20,false)
		switch(gmOpOn)
		{
			case 0:
				//Retry
				obj_bg.StartGame()
				obj_spawner.StartGame()
				obj_score.Reset()
				state = PS.start
				Start()
				break;
			
			case 1:
				//Back
				obj_bg.StartGame()
				obj_spawner.StartGame()
				obj_score.Reset()
				state = PS.menu
				input.buttonFramesHeld = 0
				input.buttonHeld = false
				break;
		}
	}
	y += fallSpdMax*2//clamp(yy,yMin,yMax)
}

function Start()
{
	rampX = camX+camW+960
	buttonPresses = 0
	mashPitch = mashStartPitch//0.75
}
