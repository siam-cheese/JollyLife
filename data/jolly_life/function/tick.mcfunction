execute as @a[tag=!hl] run scoreboard players set @s HLives 300
execute as @a[tag=!hl] run tag @s add hl


# trigger start
scoreboard players enable @a lifeCount
scoreboard players enable @a withDrawLife
scoreboard players enable @a[tag=hitMen] claimAssasinKill

execute as @a[scores={lifeCount=1..}] run function jolly_life:get_life_count
execute as @a[scores={withDrawLife=1..,HLives=..1}] run tellraw @s {"text":"You cannot withdraw your final life.","color": "red"}
execute as @a[scores={withDrawLife=1..,HLives=2..}] at @s run function jolly_life:withdraw_life

execute as @a[scores={claimAssasinKill=1..},tag=hitMen] at @s run function jolly_life:hitmen_success

scoreboard players set @a lifeCount 0
scoreboard players set @a withDrawLife 0
scoreboard players set @a claimAssasinKill 0
#trigger end

execute as @a[nbt={active_effects:[{"id":"minecraft:mining_fatigue","amplifier":24b}]}] at @s run function jolly_life:gain_life

#Start lives
execute as @a[scores={startRoll=0..},tag=rolling] run scoreboard players operation @s startRoll -= #1 numbers
execute as @a[scores={startRoll=0..},tag=rolling] run scoreboard players operation @s reRoll = @s startRoll
execute as @a[scores={startRoll=0..},tag=rolling] run scoreboard players operation @s reRoll %= spinRate numbers

execute as @a[scores={reRoll=0,startRoll=1..},tag=rolling] at @s run function jolly_life:show_lives

execute as @a[scores={startRoll=0},tag=rolling] at @s run playsound block.end_portal.spawn master @s ~ ~ ~
execute as @a[scores={startRoll=-1},tag=rolling] run scoreboard players set @s reRoll -1

execute as @a if score @s startRoll matches 250 run scoreboard players set spinRate numbers 3
execute as @a if score @s startRoll matches 200 run scoreboard players set spinRate numbers 5
execute as @a if score @s startRoll matches 100 run scoreboard players set spinRate numbers 7
execute as @a if score @s startRoll matches 20 run scoreboard players set spinRate numbers 10


#secret santa

execute as @a[tag=target,scores={deathTrigger=1..}] run tellraw @a[tag=hitMen] ["",{"text":"The target "},{"selector":"@s"},{"text":" has been eliminated, if, and only if, this was your target, and you played a role in this death, are you allowed to do /trigger claimAssasinKill and recieve your prize "}]
execute as @a[tag=target,scores={deathTrigger=1..}] run tag @s remove target

execute as @a[scores={secretSantaAnim=2..}] run scoreboard players operation @s secretSantaAnim -= #1 numbers
title @a[scores={secretSantaAnim=122}] times 0 40 20
title @a[scores={secretSantaAnim=120}] title {"text":"Your Secret Santa is.","color":"green"}
title @a[scores={secretSantaAnim=80}] title {"text":"Your Secret Santa is..","color":"yellow"}
title @a[scores={secretSantaAnim=40}] title {"text":"Your Secret Santa is...","color":"red"}

execute as @a[scores={secretSantaAnim=120}] at @s run playsound ui.button.click ambient @s ~ ~ ~
execute as @a[scores={secretSantaAnim=80}] at @s run playsound ui.button.click ambient @s ~ ~ ~
execute as @a[scores={secretSantaAnim=40}] at @s run playsound ui.button.click ambient @s ~ ~ ~
execute as @a[scores={secretSantaAnim=20}] at @s run playsound entity.warden.sonic_charge ambient @s ~ ~ ~ .5 2


execute as @a[scores={secretSantaAnim=3}] store result score @s isHitMen run title @s title {"text":"???","color":"green"}
execute as @a[scores={secretSantaAnim=3}] store result score @s isHitMen run random value 1..100

execute as @a[scores={secretSantaAnim=3,HLives=..1}] run scoreboard players set @s isHitMen 101

execute as @a[scores={secretSantaAnim=3,HLives=2..}, limit=1] run function jolly_life:santas_elf_select
execute as @a[scores={secretSantaAnim=3}] if score @s isHitMen <= #naughtyChance numbers at @s run function jolly_life:gift_targ_select
execute as @a[scores={secretSantaAnim=3}] if score @s isHitMen <= #naughtyChance numbers at @s run function jolly_life:gift_targ_select
execute if entity @a[scores={secretSantaAnim=3}] run tellraw @a {"text": "Your secret santas have been selected! Lets hope they have a nice gift for you :3","color": "green"}
execute if entity @a[tag=LittleShit] run tellraw @a [{"text": "btw ","color": "dark_purple"},{"selector":"@a[tag=LittleShit,limit=1]"}, {"text": " is a piece of shit tiny elf but their kinda weak so dw about them"}]

#Little Shit
effect give @a[tag=LittleShit] weakness 1 1 true
effect give @a[tag=LittleShit] resistance 1 1 true

execute as @a[tag=LittleShit,scores={HLives=1}] run function jolly_life:remove_little_shit



scoreboard players reset @a deathTrigger

#Life Colors
execute as @a[scores={HLives=4..}] run team join darkGreenLife
execute as @a[scores={HLives=3}] run team join greenLife
execute as @a[scores={HLives=2}] run team join yellowLife
execute as @a[scores={HLives=1}] run team join redLife



#Death shit

execute as @a[scores={HLives=0}] at @s run function jolly_life:returntodeath
execute if entity @a[scores={HLives=0}] run gamerule keepInventory false
execute if entity @a[scores={HLives=0}] run gamerule showDeathMessages false
execute at @a[scores={HLives=0}] run summon lightning_bolt
kill @a[scores={HLives=0}]
execute if entity @a[scores={HLives=-1}] run gamerule keepInventory true
execute if entity @a[scores={HLives=-1}] run gamerule showDeathMessages true
execute as @a[scores={HLives=-1}] at @s run function jolly_life:returntodeath
execute as @a[scores={HLives=-1}] at @s run scoreboard players set @s HLives -2
execute as @a[scores={HLives=-1}] at @s run scoreboard players set @s HLives -2



