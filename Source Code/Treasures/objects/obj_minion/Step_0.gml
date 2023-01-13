/// @description Insert description here
// You can write your code in this editor
function EnemyAttacked(xx,damage,knockback)
{
	//instance_destroy()
	if(hitInvinceTick <= 0)
	{
		hspd = sign(x - xx) * knockback
		audio_play_sound(sfx_enemy_hurt_2,5,false)
		hp -= damage
		hitInvinceTick = hitInvinceTime
		if(hp > 0)
		{
			//
		}else
		{
			//audio_play_sound(sfx_bug_death,20,false)
			instance_destroy()
		}
	}
}

hitInvinceTick = max(hitInvinceTick-1,0)

if(hitInvinceTick <= 0)
{
	hspd = dir * spd

	if(place_meeting(x,y,obj_player))
	{
		with(obj_player)Damage(1)
	}

}

#region Collision
	if(place_meeting(x+hspd,y,obj_wall))
	{
		while(!place_meeting(x+sign(hspd),y,obj_wall))x += sign(hspd)
	
		hspd = 0
		dir = -dir
	}
	if(!place_meeting(x+hspd,y+1,obj_wall))
	{
		while(place_meeting(x+sign(hspd),y+1,obj_wall))x += sign(hspd)
	
		hspd = 0
		dir = -dir
	}

#endregion
x += hspd