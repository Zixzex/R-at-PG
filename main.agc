`ASSETS https://store.steampowered.com/app/410531/AppGameKit__Giant_Asset_Pack_2/

`include
#include "map.agc"
#include "Types.agc"
#include "Movement.agc"
#include "GUI.agc"
#include "Timer.agc"

`window settings
SetWindowTitle("R[at]PG")
SetVirtualResolution(1024, 768)
SetWindowSize(1024, 768, 0)
SetClearColor(255, 255, 255)

gosub init

do
	if GetTextExists(1)
		SetTextString(1, "HP: " + str(player.Chp) + "/" + str(player.Mhp))
	endif
	
	if TimerTime(watertimer) >= 2
		if Player.Cwater >= 1
			Player.Cwater = Player.Cwater - 1
		endif
		TimerReset(watertimer)
	endif
	
	if TimerTime(foodtimer) >= 4
		if Player.Cfood >= 1
			player.Cfood = player.Cfood - 1
		endif
		if (Player.Cfood = 0 OR player.Cwater = 0) AND Player.Chp >= 1
			Player.Chp = Player.Chp - 1
		endif
		TimerReset(foodtimer)
		ResetAllTimers()
	endif
	
	if Player.Chp <= 0
		GameOverScreen()
	endif
	
	if(GetSpriteExists(1) AND GetTweenExists(1))
		Player = Moveplayer(Player, 1, 1)
		GUIbars(Player)
	endif
	
	/* under the hood, if you want to print the values of water, food and the food / water timers
	print(player.Cfood)
	print(player.Cwater)
	print("ID: " + str(foodtimer) + "  " + str(TimerTime(foodtimer)))
	print("ID: " + str(watertimer) + "  " + str(TimerTime(watertimer)))
	*/
		
	Sync()
loop

init: 
	`player
	LoadImage(1, "rat.png")
	Player as Entity
	Player.x = 5
	Player.y = 5
	Player.Chp = 100
	Player.Mhp = 100
	Player.CWater = 100
	Player.Cfood = 100

	`tween
	CreateTweenSprite(1, 0.3)

	`sprite
	CreateSprite(1, 1)

	`spriteanimation
	numimages = (GetImageWidth(1) / 64) * (GetImageHeight(1) / 64)
	SetSpriteAnimation(1, 64, 64, numimages)

	`setspriteframe
	SetSpriteFrame(1, 38)

	`setspritedepth
	SetSpriteDepth(1, 0)

	`set player position
	SetSpritePosition(1, Player.x * 64, Player.y * 64)

	`load the map
	LoadMap()

	`createtext
	CreateText(1, "HP: " + str(player.Chp) + "/" + str(player.Mhp))
	SetTextColor(1, 0, 0, 0, 255)
	SetTextSize(1, 30)
	SetTextPosition(1, 12 * 64, 1 * 64)

	`timers
	foodtimer = CreateTimer()
	watertimer = CreateTimer()
	
return

` ASSETS https://store.steampowered.com/app/410531/AppGameKit__Giant_Asset_Pack_2/