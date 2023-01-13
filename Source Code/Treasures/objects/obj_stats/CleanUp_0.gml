/// @description Insert description here
// You can write your code in this editor
/*for(var _i = 0;_i<ds_grid_width(dsFloor);_i++)
{
	//if(ds_grid_)ds_grid_destroy(dsFloor[# _i,FloorInfo.grid])
}*/
ds_grid_destroy(dsFloor)

for(var _i = 0;_i<ds_list_size(dsInventory);_i++)
{
	if(dsInventory[| _i]  != noone)ds_list_destroy(dsInventory[| _i])
}
ds_list_destroy(dsInventory)