execute as @a[tag=!hl] run scoreboard players set @s HLives 300
execute as @a[tag=!hl] run tag @s add hl

execute as @a[scores={HLives=-2}] at @s run function hidden_life:returntodeath
execute as @a[scores={HLives=-2}] at @s run scoreboard players set @s HLives -5


# trigger start
scoreboard players enable @a lifeCount
scoreboard players enable @a withDrawLife
scoreboard players enable @a[tag=hitMen] claimAssasinKill

execute as @a[scores={lifeCount=1..}] run function hidden_life:get_life_count
execute as @a[scores={withDrawLife=1..,HLives=..1}] run tellraw @s {"text":"You cannot withdraw your final life.","color": "red"}
execute as @a[scores={withDrawLife=1..,HLives=2..}] at @s run function hidden_life:withdraw_life

execute as @a[scores={claimAssasinKill=1..},tag=hitMen] at @s run function hidden_life:hitmen_success

scoreboard players set @a lifeCount 0
scoreboard players set @a withDrawLife 0
scoreboard players set @a claimAssasinKill 0
#trigger end

execute as @a[nbt={active_effects:[{"id":"minecraft:mining_fatigue","amplifier":24b}]}] at @s run function hidden_life:gain_life

execute as @a[scores={HLives=0}] at @s run function hidden_life:returntodeath
execute as @a[scores={HLives=0}] at @s run forceload remove ~ ~

execute as @a[scores={deathTrigger=1..}] run scoreboard players operation @s HLives -= #1 numbers
execute as @a[scores={deathTrigger=1..}] at @a run playsound block.end_gateway.spawn ambient @s ~ ~ ~ .5 1
execute as @a[scores={deathTrigger=1..}] at @a run playsound block.bell.use ambient @s ~ ~ ~ .5 1


execute as @a[scores={startRoll=0..}] run scoreboard players operation @s startRoll -= #1 numbers
execute as @a[scores={startRoll=0..}] run scoreboard players operation @s reRoll = @s startRoll
execute as @a[scores={startRoll=0..}] run scoreboard players operation @s reRoll %= spinRate numbers

execute as @a[scores={reRoll=0,startRoll=1..}] at @s run function hidden_life:show_lives

execute as @a[scores={startRoll=0}] at @s run playsound block.end_portal.spawn master @s ~ ~ ~
execute as @a[scores={startRoll=-1}] run scoreboard players set @s reRoll -1

execute as @a if score @s startRoll matches 250 run scoreboard players set spinRate numbers 3
execute as @a if score @s startRoll matches 200 run scoreboard players set spinRate numbers 5
execute as @a if score @s startRoll matches 100 run scoreboard players set spinRate numbers 7
execute as @a if score @s startRoll matches 20 run scoreboard players set spinRate numbers 10


#hitmen

execute as @a[tag=target,scores={deathTrigger=1..}] run tellraw @a[tag=hitMen] ["",{"text":"The target "},{"selector":"@s"},{"text":" has been eliminated, if, and only if, this was your target, and you played a role in this death, are you allowed to do /trigger claimAssasinKill and recieve your prize "}]
execute as @a[tag=target,scores={deathTrigger=1..}] run tag @s remove target

execute as @a[scores={hitMenAnim=2..}] run scoreboard players operation @s hitMenAnim -= #1 numbers
title @a[scores={hitMenAnim=122}] times 20 100 20
title @a[scores={hitMenAnim=120}] title {"text":"You are.","color":"green"}
title @a[scores={hitMenAnim=80}] title {"text":"You are..","color":"yellow"}
title @a[scores={hitMenAnim=40}] title {"text":"You are...","color":"red"}

execute as @a[scores={hitMenAnim=120}] at @s run playsound ui.button.click ambient @s ~ ~ ~
execute as @a[scores={hitMenAnim=80}] at @s run playsound ui.button.click ambient @s ~ ~ ~
execute as @a[scores={hitMenAnim=40}] at @s run playsound ui.button.click ambient @s ~ ~ ~
execute as @a[scores={hitMenAnim=20}] at @s run playsound entity.warden.sonic_charge ambient @s ~ ~ ~ .5 2


execute as @a[scores={hitMenAnim=3}] store result score @s isHitMen run random value 1..100

execute as @a[scores={hitMenAnim=3,HLives=..1}] run scoreboard players set @s isHitMen 101

execute as @a[scores={hitMenAnim=3}] if score @s isHitMen <= #hitMenChance numbers at @s run function hidden_life:hitmen_select
execute as @a[scores={hitMenAnim=3}] if score @s isHitMen > #hitMenChance numbers at @s run title @s title {"text":"Innocent","color":"green"}
execute as @a[scores={hitMenAnim=3}] if score @s isHitMen > #hitMenChance numbers at @s run playsound block.amethyst_block.break ambient @s ~ ~ ~ 1 .7





scoreboard players reset @a deathTrigger







