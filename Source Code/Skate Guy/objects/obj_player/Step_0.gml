/// @description Insert description here
// You can write your code in this editor
UpdateCameraVariables(cam)

switch(state)
{
	case PS.start:
		StateStart()
		break;
		
	case PS.active:
		StateActive()
		break;
		
	case PS.dead:
		StateDead()
		break;
		
	case PS.menu:
		StateMenu()
		break;
}