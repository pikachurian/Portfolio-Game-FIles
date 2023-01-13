// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AddItem(lowestValue, highestValue){
	if(instance_exists(obj_stats))
	{
		var _dsItem = ds_list_create()
		_dsItem[| ItemInfo.value] = irandom_range(lowestValue*obj_stats.level, highestValue*obj_stats.level)
		_dsItem[| ItemInfo.weight] = 1
		_dsItem[| ItemInfo.icon] = irandom(14)
		
		return _dsItem
	}
}