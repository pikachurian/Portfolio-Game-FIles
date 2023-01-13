/// @description Insert description here
// You can write your code in this editor
//room_set_width(rm_level_test,1200 + 96 * obj_stats.level)
//room_set_height(rm_level_test,1200 + 96 * obj_stats.level)
room_width = 1200 //+ 96 * obj_stats.level
room_height = 1200 //+ 96 * obj_stats.level

//hueShifter = obj_hueshifter

var _bgTile = 18
var _borderTile = 16

randomize()

var _wallMapId = layer_tilemap_get_id("WallTiles")

tilemap_set_width(_wallMapId,room_width)
tilemap_set_height(_wallMapId,room_height)


// Set up the grid
gWidth = room_width div CELL_WIDTH
gHeight = room_height div CELL_HEIGHT
dsGrid = ds_grid_create(gWidth,gHeight)
ds_grid_set_region(dsGrid,0,0,gWidth,gHeight,VOID)

#region Fill in background tiles and border tiles
for(var _y = 0;_y < gHeight;_y++)
{
	for(var _x = 0;_x < gWidth;_x++)
	{
		tilemap_set(_wallMapId,_borderTile,_x,_y)
	}
}

for(var _y = 2;_y < gHeight-2;_y++)
{
	for(var _x = 2;_x < gWidth-2;_x++)
	{
		tilemap_set(_wallMapId,_bgTile,_x,_y)
	}
}
#endregion

lineLengthMax = 20//20//4
lineLength = 0



// Create walker
var _walkerX = gWidth div 2
var _walkerY = gHeight div 2
var _walkerDir = irandom(3)
var _steps = 1000//1000//400

var _entrances = 1
var _exits = 1
var _trapPoints = 10
var _houses = 4
var _treasures = 3
var _enemyPoints = 1 + obj_stats.level//10
var _eMinionCost = 1

var _dirChangeOdds = 1
var _trapOdds = 32//4
var _houseOdds = max(50,400 - obj_stats.level * 75)//240
var _tRareOdds = 500//100  //1000
var _tUncommonOdds = 160 //32  //250//500
var _tCommonOdds = 50  //100
var _eMinionOdds = 500 - obj_stats.level//250//100//24

if(obj_stats.ascend = false)
{
	
	repeat(_steps)
	{
		dsGrid[# _walkerX, _walkerY] = FLOOR
		var _walkerDirLast = _walkerDir
	
		if(irandom(_dirChangeOdds) == _dirChangeOdds)
		{
			_walkerDir = irandom(3)
		}
	
		if(_walkerDir = _walkerDirLast)lineLength += 1
		else	lineLength = 0
	
		if(lineLength>= lineLengthMax)
		{
			lineLength = 0
			while(_walkerDir = _walkerDirLast)_walkerDir = irandom(3)
		}
	
		//move the walker
		var _xDir = lengthdir_x(1, _walkerDir*90)
		var _yDir = lengthdir_y(1, _walkerDir*90)
		_walkerX += _xDir
		_walkerY += _yDir
	
		//
		if(_walkerX < 2 || _walkerX >= gWidth - 2)
		{    
			_walkerX += -_xDir * 2
		}
	
		if(_walkerY < 2 || _walkerY >= gWidth - 2)
		{    
			_walkerY += -_yDir * 2
		}
	
	}

	#region Place Entrances
	for(var _y = 1; _y < gHeight-1; _y++)
	{
		for(var _x = 1; _x < gWidth-1;_x++)
		{
			if(dsGrid[# _x, _y] == FLOOR)
			{
				var _tileSouth = dsGrid[# _x,_y+1] == VOID
				if(_tileSouth && _entrances > 0)
				{
					dsGrid[# _x, _y] = ENTRANCE
					_entrances -= 1
				}
			
				if(_entrances <= 0)break
			}
			if(_entrances <= 0)break
		}
		if(_entrances <= 0)break
	}
	#endregion

	#region //Place Exits
	for(var _y = gHeight-1; _y > 1; _y--)
	{
		for(var _x = gWidth-1; _x > 1;_x--)
		{
			if(dsGrid[# _x, _y] == FLOOR)
			{
				var _tileSouth = dsGrid[# _x,_y+1] == VOID
				if(_tileSouth && _exits > 0)
				{
					dsGrid[# _x, _y] = EXIT
					_exits -= 1
				}
			
				if(_exits <= 0)break
			}
			if(_exits <= 0)break
		}
		if(_exits <= 0)break
	}
	#endregion

	#region Place Houses
	for(var _y = 1; _y < gHeight-1; _y++)
	{
	
		for(var _x = 1; _x < gWidth-1;_x++)
		{
			var _tileSouthVoid = dsGrid[# _x,_y+1] == VOID
			var _tileSouthEastVoid = dsGrid[# _x+1,_y+1] == VOID
			var _tileEastVoid = dsGrid[# _x+1,_y] == VOID
			var _tileNEEHouse = dsGrid[# _x+2,_y-1] == TENT || CAVE
			var _tileNorthEastHouse = dsGrid[# _x+1,_y-1] == TENT || CAVE
			var _tileWestVoid = dsGrid[# _x-1,_y] == VOID
			var _tileNWWHouse = dsGrid[# _x-2,_y-1] == TENT || CAVE
			var _tileNWWWHouse = dsGrid[# _x-3,_y-1] == TENT || CAVE
			var _tileNorthFloor = dsGrid[# _x,_y-1] == FLOOR
			
			if(_houses > 0 && dsGrid[# _x,_y] = VOID)
			{
				if(_tileNorthFloor) && (_tileEastVoid || _tileWestVoid)
				{
					if(_tileEastVoid) 
					{
						if(irandom(_houseOdds) == _houseOdds) || (_tileNEEHouse || _tileNWWHouse)
						{
							dsGrid[# _x,_y-2] = FLOOR
							dsGrid[# _x+1,_y-1] = FLOOR
							dsGrid[# _x+1,_y-2] = FLOOR
							if(irandom(1) = 1)dsGrid[# _x,_y-1] = CAVE
							else dsGrid[# _x,_y-1] = TENT
							_houses -= 1
						}
					}else	if(_tileWestVoid)
					{
						if(irandom(_houseOdds) == _houseOdds) || (_tileNorthEastHouse || _tileNWWWHouse)
						{
							dsGrid[# _x-1,_y-2] = FLOOR
							dsGrid[# _x,_y-1] = FLOOR
							dsGrid[# _x,_y-2] = FLOOR
							if(irandom(1) = 1)dsGrid[# _x-1,_y-1] = CAVE
							else dsGrid[# _x-1,_y-1] = TENT
							_houses -= 1
						}
					}
				}
			}
			if(_houses <= 0) break
		}
		if(_houses <= 0) break
	
	}
	#endregion

	#region Place Traps
	for(var _y = 1; _y < gHeight-1; _y++)
	{
		for(var _x = 1; _x < gWidth-1;_x++)
		{
			if(_trapPoints > 0)
			{
				var _tileNorthFloor = dsGrid[# _x,_y-1] == FLOOR
				var _tileSouthFloor = dsGrid[# _x,_y+1] == FLOOR
				var _tileWestSt = dsGrid[# _x-1,_y] == SPIKETRAP
				var _tileEastSt = dsGrid[# _x+1,_y] == SPIKETRAP
			
				if(dsGrid[# _x, _y] = VOID)
				{
					if(_tileNorthFloor) && (irandom(1) = 1) &&(_tileEastSt || _tileWestSt) 
					{
						dsGrid[# _x, _y] = SPIKETRAP
						_trapPoints -= 1
					}else	if(irandom(round(_trapOdds/2)) == round(_trapOdds/2)) && (_tileNorthFloor) && (_tileSouthFloor)
					{
						dsGrid[# _x, _y] = SPIKETRAP//FLOOR
						//dsGrid[# _x,_y+1] = SPIKETRAP
						_trapPoints -= 1
					}else if(irandom(_trapOdds) == _trapOdds) && (_tileNorthFloor)
					{
						dsGrid[# _x, _y] = SPIKETRAP//FLOOR
						//dsGrid[# _x,_y+1] = SPIKETRAP
						_trapPoints -= 1
					}
				}
			}else break
			if(_trapPoints <= 0)break
		}
		if(_trapPoints <= 0)break
	}
	#endregion

	#region Place Treasure
	for(var _y = gHeight-1; _y > 1; _y--)
	{
	
		for(var _x = 1; _x < gWidth-1;_x++)
		{
			if(dsGrid[# _x, _y] == FLOOR && _treasures > 0)
			{
				var _tileSouth = dsGrid[# _x,_y+1] == VOID//!= FLOOR
				var _tileNorth = dsGrid[# _x,_y-1] == VOID
				var _tileWest = dsGrid[# _x-1,_y] == VOID
				var _tileWestFloor = dsGrid[# _x-1,_y] == FLOOR
				var _tileEast = dsGrid[# _x+1,_y] == VOID
				var _tileEastFloor = dsGrid[# _x-1,_y] == FLOOR
		
				if(_tileSouth && _tileEast && _tileWest)
				{
					if(irandom(round(_tRareOdds/2)) == round(_tRareOdds/2))dsGrid[# _x, _y] = TREASURE_RARE_CLOSE
					else	if(irandom(_tUncommonOdds) == _tUncommonOdds)dsGrid[# _x, _y] = TREASURE_UNCOMMON_CLOSE
				
					if(dsGrid[# _x, _y] != FLOOR)_treasures -= 1
				
				}else	if(_tileSouth) && (_tileNorth) && (_tileEast || _tileWest)
				{
					if(irandom(round(_tRareOdds/2)) >= round(_tRareOdds/2))dsGrid[# _x, _y] = TREASURE_RARE_CLOSE
					else	if(irandom(_tUncommonOdds) == _tUncommonOdds)dsGrid[# _x, _y] = TREASURE_UNCOMMON_CLOSE
				
					if(dsGrid[# _x, _y] != FLOOR)_treasures -= 1
				
				}else	if(_tileSouth) && (_tileEast = false) && (_tileWest = false) && (_tileWest = false)
				{
					if(irandom(_tRareOdds) == _tRareOdds)dsGrid[# _x, _y] = TREASURE_RARE_CLOSE
					else	if(irandom(_tUncommonOdds) == _tUncommonOdds)dsGrid[# _x, _y] = TREASURE_UNCOMMON_CLOSE
					else	if(irandom(_tCommonOdds) == _tCommonOdds)dsGrid[# _x, _y] = TREASURE_COMMON_CLOSE
				
					if(dsGrid[# _x, _y] != FLOOR)_treasures -= 1
				
				}/*else	/*if(_tileSouth) && (_tileEast == false || _tileWest == false)
				{
					if(irandom(_tUncommonOdds) == _tUncommonOdds)dsGrid[# _x, _y] = TREASURE_UNCOMMON_CLOSE
					else	if(irandom(_tCommonOdds) == _tCommonOdds)dsGrid[# _x, _y] = TREASURE_COMMON_CLOSE
				
					if(dsGrid[# _x, _y] != FLOOR)_treasures -= 1
				
				}
				if(_tileEast && _tileWestFloor && _tileSouth) || (_tileWest && _tileEastFloor&& _tileSouth)
				{
					
					var _spawnDir = 0
					if(_tileEast && _tileWest)_spawnDir = 1
					else _spawnDir = -_tileWest + _tileEast
					
					if(irandom(_tRareOdds) >= _tRareOdds)
					{
						dsGrid[# _x+_spawnDir, _y] = TREASURE_RARE_CLOSE
					}else	if(irandom(_tUncommonOdds) == _tUncommonOdds)
					{
						dsGrid[# _x+_spawnDir, _y] = TREASURE_UNCOMMON_CLOSE
					}
					if(dsGrid[# _x+_spawnDir, _y] != VOID)_treasures -= 1
					
				}else
				*/
			
				if(_treasures <= 0)break
			}
			if(_treasures <= 0)break
		}
		if(_treasures <= 0)break
	}
	#endregion

	#region Place Enemies
	for(var _y = 1; _y < gHeight-1; _y++)
	{
		for(var _x = 1; _x < gWidth-1;_x++)
		{
			if(dsGrid[# _x, _y] = FLOOR && _enemyPoints > 0)
			{
				var _tileSouth = dsGrid[# _x,_y+1] == VOID
				var _tileEast = dsGrid[# _x+1,_y] == VOID
				var _tileNorth = dsGrid[# _x,_y-1] == VOID
				var _tileWest = dsGrid[# _x-1,_y] == VOID
				var _tileSouthWest = dsGrid[# _x-1,_y+1] == VOID
				var _tileSouthEast = dsGrid[# _x+1,_y+1] == VOID
				
				if(_tileSouth) && (_tileSouthEast)  && (_tileSouthWest) && (_tileEast = false) && (_tileWest = false) && (_tileNorth = false)
				{
					dsGrid[# _x, _y] = ENEMY_MINION
					_enemyPoints -= _eMinionCost
				}else	if(_tileSouth) && (_tileSouthEast || _tileSouthWest)
				{
					if(irandom(_eMinionOdds) = _eMinionOdds)
					{
						dsGrid[# _x, _y] = ENEMY_MINION
						_enemyPoints -= _eMinionCost
					}
					
				}
			}
			
			if(_enemyPoints <= 0)break
		}	
		if(_enemyPoints <= 0)break
	}
	#endregion

	//Place Tiles
	levelgenPlaceTiles(_wallMapId)

	//Place Objects
	levelgenPlaceObjects()


	var _entrance = instance_nearest(0,0,obj_entrance)
	instance_create_layer(_entrance.x+11,_entrance.y+11,"Player",obj_player)
}else
{
	dsGrid = obj_stats.dsFloor[# obj_stats.level,FloorInfo.grid]
	
	//Place Tiles
	levelgenPlaceTiles(_wallMapId)

	//Place Objects
	levelgenPlaceObjects()


	var _entrance = instance_nearest(0,0,obj_exit)
	instance_create_layer(_entrance.x+11,_entrance.y+11,"Player",obj_player)
	
}