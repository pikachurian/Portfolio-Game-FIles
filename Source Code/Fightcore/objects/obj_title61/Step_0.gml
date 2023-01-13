/// @description Insert description here
// You can write your code in this editor
switch(menuOn)
{
	case TS.title:
		//
		if(titleWaitTick <= 0)
		{
			titleImageAlpha = lerp(titleImageAlpha,0,titleImageAlphaA)
			if(titleImageAlpha <= 0.1)titleWordY = lerp(titleWordY,titleWordTargetY,titleWordYA)
			if(abs(titleWordTargetY - titleWordY) <= 32)titleStartAlpha = lerp(titleStartAlpha,1,titleStartAlphaA)
		}else titleWaitTick --
		break;
		
	case TS.main:
		//
		titleWaitTick = titleWaitTime
		titleImageAlpha = 1
		titleStartAlpha = 0
		titleWordY = -64
		MainBgStep()
		break;
}