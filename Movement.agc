`===================================================================================================
`										MOVING
`===================================================================================================
function Moveplayer(p as Entity, tween, sprite)

	tpx = p.x
	tpy = p.y
	
	if(GetTweenSpritePlaying(tween, sprite) = 0)
		if(GetRawKeyState(87) = 1 AND Map.Cmap[p.y - 1, p.x] <> 1)
			p.y = p.y - 1
		elseif(GetRawKeyState(83) = 1 AND Map.CMap[p.y + 1, p.x] <> 1)
			p.y = p.y + 1
		elseif(GetRawKeyState(65) = 1 AND Map.CMap[p.y, p.x - 1] <> 1)
			p.x = p.x - 1
		elseif(GetRawKeyState(68) = 1 AND Map.CMap[p.y, p.x + 1] <> 1)
			p.x = p.x + 1
		elseif(GetRawKeyPressed(13) = 1)
			p = CheckMap(p)
		elseif(GetRawKeyState(81) = 1)
			p = HurtSelf(p)
		elseif(GetRawKeyState(69) = 1)
			p = HealSelf(p)
		endif
	
		if(tpx <> p.x OR tpy <> p.y)
			PlayTween(tween, sprite, p, tpx, tpy)
		endif
	else
		UpdateTweenSprite(tween, sprite, GetFrameTime())
	endif
	
endfunction p

function PlayTween(tween, sprite, p as Entity, tpx, tpy)
	
	SettweenSpriteX(tween, tpx * 64, p.x * 64, TweenLinear())
	SettweenSpriteY(tween, tpy * 64, p.y * 64, TweenLinear())
	PlayTweenSprite(tween, sprite, 0)
	
endfunction
`===================================================================================================
`										MOVING
`===================================================================================================

`===================================================================================================
`										INTERACTION
`===================================================================================================
`first we check what tile the player is standing on, if it's tile #55, a farm land tile we can eat it
function CheckMap(p as Entity)
	if(Map.Map[p.y, p.x] = 55)
		p = ChompGrass(p)
	elseif(Map.Map[p.y, p.x] = 24)
		p = DrinkWater(p)
	endif
endfunction p

`we want to make sure the max food is never over 100, after eating we want to reset the food timer
function ChompGrass(p as Entity)
	if p.cFood <= 79
		p.cFood = p.cFood + 20
	else
		p.cFood = 100
	endif
	TimerReset(1)
endfunction p

`same for water, never over 100, after we drank something we want to reset the drink timer
function DrinkWater(p as Entity)
	if p.cWater <= 79
		p.cWater = p.cWater + 20
	else
		p.cWater = 100
	endif
	TimerReset(2)
endfunction p

`this function is just mostly to show the game over screen as it has no other use but to hurt your own hp
function HurtSelf(p as Entity)
	if p.Chp > 0
		p.Chp = p.Chp - 10
	endif
endfunction p

`this function is to heal yourself, no idea why it's included.
`make sure the player can't have more than 100 hp
function HealSelf(p as Entity)
	if p.Chp <= 90
		p.Chp = p.Chp + 10
	else
		p.Chp = 100
	endif
endfunction p

`===================================================================================================
`										INTERACTION
`===================================================================================================