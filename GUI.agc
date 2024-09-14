`===================================================================================================
`										GAME OVER
`===================================================================================================
function GameOverScreen()
	UnloadMap() `unloads the map
	DeleteSprite(1) `= the sprite of the player
	DeleteTween(1) `= the tween of the player
	DeleteText(1) `= the text of the hp
	DeleteImage(1) `= the image of the player
	DeleteImage(2) `= the tileset of the map
	`Delete all existing timers
	for x = 0 to Timers.length
		Timers.remove(x)
	next x
	
	`create the game over text
	CreateText(2, "GAME OVER")
	SetTextSize(2, 30)
	SetTextPosition(2, GetWindowWidth() / 2 - 50, GetWindowHeight() / 2)
	SetTextColor(2, 255, 0, 0, 255)
	
	`create option 1
	CreateText(3, "retry")
	SetTextSize(3, 20)
	SetTextPosition(3, GetTextX(2) + 50, GetTextY(2) + 50)
	SetTextColor(3, 255, 0, 0, 255)
	
	`create option 2
	CreateText(4, "quit")
	SetTextSize(4, 20)
	SetTextPosition(4, GetTextX(3), GetTextY(3) + 30)
	SetTextColor(4, 255, 0, 0, 255)
	
	`create pointer
	CreateText(1, ">")
	SetTextSize(1, 30)
	SetTextPosition(1, GetTextX(2), GetTextY(3) - 5)
	SetTextColor(1, 255, 0, 0, 255)
	
	`array for the decisions
	decisions as integer[2]
	decisions[1] = 0
	decisions[2] = 1
	
	`while the user has not chosen an option we won't go anywhere else	
	do
		if decisions[1] = 0
			decisions = GameOverScreenControls(decisions)
			sync()
		elseif decisions[1] = 1
			for x = 1 to 4
				DeleteText(x)
			next x
			gosub init
			exitfunction
		elseif decisions[1] = 2
			end
		endif
	loop
	
endfunction

` handles the controls of the game over screen, W, S and enter
function GameOverScreenControls(decisions as integer[])
	
	if(GetRawKeyPressed(87) = 1 AND decisions[2] <> 1)
		`moves up the decision
		decisions[2] = decisions[2] - 1
		SetTextPosition(1, GetTextX(2), GetTextY(decisions[2] + 2) - 5)
	elseif (GetRawKeyPressed(83) = 1 AND decisions[2] <> 2)
		`moves down the decision
		decisions[2] = decisions[2] + 1
		SetTextPosition(1, GetTextX(2), GetTextY(decisions[2] + 2) - 5)
	elseif (GetRawKeyPressed(13) = 1)
		`pressing the enter key will confirm the decision
		decisions[1] = decisions[2]
	endif
	
endfunction decisions

`===================================================================================================
`										GAME OVER
`===================================================================================================


`===================================================================================================
`										GUI BARS
`===================================================================================================

`draw + update all the bars in 1 function
function GUIbars(p as Entity)
	
	DrawHealthBar(p)
	DrawFoodBar(p)
	DrawWaterBar(p)
	
endfunction

`draw the hp bar
function DrawHealthBar(p as Entity)
	
	`color(s)
	Grey = MakeColor(50, 50, 50)
	
	`color in the health bar
	UpdateHealthBar(p)
	
	`border of the health bar
	DrawBox(12 * 64, 2 * 64 - 32, 15 * 64 + 32, 2 * 64, Grey, Grey, Grey, Grey, 0)
	
endfunction

function UpdateHealthBar(p as Entity)
	`health bar reduces in the X direction
	` the width of the health bar = 3 * 64 + 32 = [224] = 100% (2.24px per %)
	
	Green = MakeColor(0, 150, 0)
	DrawBox(12 * 64, 2 * 64 - 32, (12 * 64) + (p.cHp * 2.24), 2 * 64, Green, Green, Green, Green, 1)
	
endfunction

function DrawFoodBar(p as Entity)
	
	`color(s)
	Gray = MakeColor(50, 50, 50)
	
	`color in the food bar
	UpdateFoodBar(p)
	
	`border of the food bar
	DrawBox(12 * 64, 3 * 64, 12 * 64 + 32, 6 * 64 + 32, Gray, Gray, Gray, Gray, 0)
	
endfunction

function UpdateFoodBar(p as Entity)
	`food bar reduces in the Y direction
	` the height of the food bar = 3 * 64 + 32 = [224] = 100% (2.24px per %)
	
	Brown = MakeColor(181, 101, 29)
	DrawBox(12 * 64, 6 * 64 + 32, 12 * 64 + 32, (6 * 64 + 32) - (p.cfood * 2.24), Brown, Brown, Brown, Brown, 1)
	
endfunction

function DrawWaterBar(p as Entity)
	
	`color(s)
	Grey = MakeColor(50, 50, 50)
	
	`color in the water bar
	UpdateWaterBar(p)
	
	`border of the water bar
	DrawBox(13.5 * 64, 3 * 64, 13.5 * 64 + 32, 6 * 64 + 32, Grey, Grey, Grey, Grey, 0)
	
endfunction

function UpdateWaterBar(p as Entity)
	`water reduces in the Y direction
	` the height of the water bar = 3 * 64 + 32 = [224] = 100% (2.24px per %)
	
	Blue = MakeColor(0, 0, 150)
	DrawBox(13.5 * 64, 6 * 64 + 32, 13.5 * 64 + 32, (6 * 64 + 32) - (p.cWater * 2.24), Blue, Blue, Blue, Blue, 1)
	
endfunction
`===================================================================================================
`										GUI BARS
`===================================================================================================