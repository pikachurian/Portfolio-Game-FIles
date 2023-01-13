// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LevelGenScripts(){

}

function levelgenPlaceObjects()
{
	//Place Objects
	for(var _y = 1; _y < gHeight-1; _y++)
	{
		for(var _x = 1; _x < gWidth-1;_x++)
		{
			if(dsGrid[# _x, _y] == FLOOR)
			{
				//tilemap_set(_wallMapId, 0, _x, _y)
			}else 
			if(dsGrid[# _x, _y] == VOID)
			{
				instance_create_layer(_x*CELL_WIDTH,_y*CELL_HEIGHT,"ObjectCollisions",obj_wall)
			}else
			if(dsGrid[# _x, _y] == ENTRANCE) instance_create_layer(_x*CELL_WIDTH,_y*CELL_HEIGHT,"Interactables",obj_entrance)
			else
			if(dsGrid[# _x, _y] == EXIT) instance_create_layer(_x*CELL_WIDTH,_y*CELL_HEIGHT,"Interactables",obj_exit)
			else
			if(dsGrid[# _x, _y] == SPIKETRAP) instance_create_layer(_x*CELL_WIDTH,_y*CELL_HEIGHT,"ObjectForeground",obj_spiketrap)
			else
			if(dsGrid[# _x, _y] == TENT) instance_create_layer(_x*CELL_WIDTH,_y*CELL_HEIGHT,"Interactables",obj_tent)
			else
			if(dsGrid[# _x, _y] == CAVE) instance_create_layer(_x*CELL_WIDTH,_y*CELL_HEIGHT,"Interactables",obj_cave)
			else
			if(dsGrid[# _x, _y] == TREASURE_RARE_CLOSE) instance_create_layer(_x*CELL_WIDTH,_y*CELL_HEIGHT,"Interactables",obj_treasure_rare)
			else
			if(dsGrid[# _x, _y] == TREASURE_UNCOMMON_CLOSE) instance_create_layer(_x*CELL_WIDTH,_y*CELL_HEIGHT,"Interactables",obj_treasure_uncommon)
			else
			if(dsGrid[# _x, _y] == TREASURE_COMMON_CLOSE) instance_create_layer(_x*CELL_WIDTH,_y*CELL_HEIGHT,"Interactables",obj_treasure_common)
			else
			if(dsGrid[# _x, _y] == TREASURE_RARE_OPEN) instance_create_layer(_x*CELL_WIDTH,_y*CELL_HEIGHT,"Interactables",obj_treasure_rare_open)
			else
			if(dsGrid[# _x, _y] == TREASURE_UNCOMMON_OPEN) instance_create_layer(_x*CELL_WIDTH,_y*CELL_HEIGHT,"Interactables",obj_treasure_uncommon_open)
			else
			if(dsGrid[# _x, _y] == TREASURE_COMMON_OPEN) instance_create_layer(_x*CELL_WIDTH,_y*CELL_HEIGHT,"Interactables",obj_treasure_common_open)
			else
			if(dsGrid[# _x, _y] == ENEMY_MINION) instance_create_layer(_x*CELL_WIDTH+11,_y*CELL_HEIGHT+12,"ObjectForeground",obj_minion)
		}
	}
	#region descend
		/*for(var _y = 1; _y < gHeight-1; _y++)
	{
		for(var _x = 1; _x < gWidth-1;_x++)
		{
			if(dsGrid[# _x, _y] == FLOOR)
			{
				//tilemap_set(_wallMapId, 0, _x, _y)
			}else 
			if(dsGrid[# _x, _y] == VOID)
			{
				instance_create_layer(_x*CELL_WIDTH,_y*CELL_HEIGHT,"ObjectCollisions",obj_wall)
			}else
			if(dsGrid[# _x, _y] == ENTRANCE) instance_create_layer(_x*CELL_WIDTH,_y*CELL_HEIGHT,"Interactables",obj_entrance)
			else
			if(dsGrid[# _x, _y] == EXIT) instance_create_layer(_x*CELL_WIDTH,_y*CELL_HEIGHT,"Interactables",obj_exit)
			else
			if(dsGrid[# _x, _y] == SPIKETRAP) instance_create_layer(_x*CELL_WIDTH,_y*CELL_HEIGHT,"ObjectForeground",obj_spiketrap)
			else
			if(dsGrid[# _x, _y] == TENT) instance_create_layer(_x*CELL_WIDTH,_y*CELL_HEIGHT,"Interactables",obj_tent)
			else
			if(dsGrid[# _x, _y] == CAVE) instance_create_layer(_x*CELL_WIDTH,_y*CELL_HEIGHT,"Interactables",obj_cave)
			else
			if(dsGrid[# _x, _y] == TREASURE_RARE_CLOSE) instance_create_layer(_x*CELL_WIDTH,_y*CELL_HEIGHT,"Interactables",obj_treasure_rare)
			else
			if(dsGrid[# _x, _y] == TREASURE_UNCOMMON_CLOSE) instance_create_layer(_x*CELL_WIDTH,_y*CELL_HEIGHT,"Interactables",obj_treasure_uncommon)
			else
			if(dsGrid[# _x, _y] == TREASURE_COMMON_CLOSE) instance_create_layer(_x*CELL_WIDTH,_y*CELL_HEIGHT,"Interactables",obj_treasure_common)
			else
			if(dsGrid[# _x, _y] == ENEMY_MINION) instance_create_layer(_x*CELL_WIDTH+11,_y*CELL_HEIGHT+12,"ObjectForeground",obj_minion)
		}
	}*/
	#endregion
}

function levelgenPlaceTiles(_wallMapId)
{
		//Place Tiles
	for(var _y = 1; _y < gHeight-1; _y++)
	{
		for(var _x = 1; _x < gWidth-1;_x++)
		{
			if(dsGrid[# _x, _y] == FLOOR)
			{
				tilemap_set(_wallMapId, 18, _x, _y)
			}else 
			if(dsGrid[# _x, _y] == VOID)
			{
				//tilemap_set(_wallMapId, 1, _x, _y)
				//instance_create_layer()
				var _tileNorth = dsGrid[# _x,_y-1] != FLOOR
				var _tileWest = dsGrid[# _x-1,_y] != FLOOR//VOID
				var _tileEast = dsGrid[# _x+1,_y] != FLOOR
				var _tileSouth = dsGrid[# _x,_y+1] != FLOOR
			
				var _tileIndex = NORTH*_tileNorth + WEST*_tileWest + EAST*_tileEast + SOUTH*_tileSouth + 1
				tilemap_set(_wallMapId, _tileIndex, _x, _y)
			}
		}
	}
	
	#region
		//Place Tiles
	/*for(var _y = 1; _y < gHeight-1; _y++)
	{
		for(var _x = 1; _x < gWidth-1;_x++)
		{
			if(dsGrid[# _x, _y] == FLOOR)
			{
				tilemap_set(_wallMapId, 18, _x, _y)
			}else 
			if(dsGrid[# _x, _y] == VOID)
			{
				//tilemap_set(_wallMapId, 1, _x, _y)
				//instance_create_layer()
				var _tileNorth = dsGrid[# _x,_y-1] != FLOOR
				var _tileWest = dsGrid[# _x-1,_y] != FLOOR//VOID
				var _tileEast = dsGrid[# _x+1,_y] != FLOOR
				var _tileSouth = dsGrid[# _x,_y+1] != FLOOR
			
				var _tileIndex = NORTH*_tileNorth + WEST*_tileWest + EAST*_tileEast + SOUTH*_tileSouth + 1
				tilemap_set(_wallMapId, _tileIndex, _x, _y)
			}
		}
	}*/
	#endregion
}