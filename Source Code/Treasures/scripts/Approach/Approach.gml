// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Approach(a, b, amount){
	/// @description Approach(a, b, amount)
	/// @param a
	/// @param b
	/// @param amount
	
	if(a < b)
	{
		a += amount	
		if(a > b)
			return b
	}else
	{
		a -= amount	
		if(a < b)
			return b
	}
	return a
	
}