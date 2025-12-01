scoreboard players set @s chartertimer 200
tag @s add chartered
effect give @s minecraft:levitation 12 1 true
playsound minecraft:block.end_portal_frame.fill master @a ~ ~ ~ 4 0
playsound minecraft:block.beacon.power_select master @a ~ ~ ~ 4 0
team join charter @s
effect give @s minecraft:glowing 10 1 true
scoreboard players reset @s charterTotem