function LoadMap()
	
	global Map as Map
	` this map is the tiles which get shown, the grass, the walls, etc
	Map.Map[00] = [15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15]
	Map.Map[01] = [15, 21, 21, 21, 21, 21, 21, 21, 21, 21, 15]
	Map.Map[02] = [15, 21, 03, 03, 03, 21, 03, 03, 03, 21, 15]
	Map.Map[03] = [15, 21, 03, 03, 03, 21, 03, 03, 03, 21, 15]
	Map.Map[04] = [15, 21, 03, 03, 03, 21, 03, 03, 03, 21, 15]
	Map.Map[05] = [15, 21, 03, 03, 03, 21, 03, 03, 03, 21, 15]
	Map.Map[06] = [15, 21, 03, 03, 03, 21, 03, 03, 03, 21, 15]
	Map.Map[07] = [15, 21, 03, 03, 03, 21, 03, 03, 03, 21, 15]
	Map.Map[08] = [15, 24, 24, 03, 03, 21, 03, 03, 55, 55, 15]
	Map.Map[09] = [15, 24, 24, 21, 21, 21, 21, 21, 55, 55, 15]
	Map.Map[10] = [15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15]
	
	`the Cmap is the collision map, 0 represents spaces you can walk to, 1 the ones you can't
	Map.CMap[00] = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
	Map.CMap[01] = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
	Map.CMap[02] = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
	Map.CMap[03] = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
	Map.CMap[04] = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
	Map.CMap[05] = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
	Map.CMap[06] = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
	Map.CMap[07] = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
	Map.CMap[08] = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
	Map.CMap[09] = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
	Map.CMap[10] = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
	
	DrawMap()
endfunction

function DrawMap()
	
	`load assets
	LoadImage(2, "tileset.png")
	
	i = 100
	
	`get the # of images in the image atlas
	numimages = (GetImageWidth(2) / 64) * (GetImageHeight(2) / 64)
	
	`draw the image # of the Array[y, x] to the screen
	for y = 0 to Map.Map.length
		for x = 0 to Map.Map[1].length
			CreateSprite(i, 2)
			SetSpriteAnimation(i, 64, 64, numimages)
			SetSpriteFrame(i, Map.Map[y, x])
			SetSpritePosition(i, x * 64, y * 64)
			SetSpriteSnap(i, 1)
			SetSpriteDepth(i, 3)
			i = i + 1
		next x
	next y
	
endfunction

function UnloadMap()
	
	`delete the drawn map
	for x = 0 to ((Map.Map.length + 1) * (Map.Map[1].length + 1))
		DeleteSprite(x + 100)
	next x

endfunction