execute as @e[tag=chartered,scores={chartertimer=0..}] run scoreboard players operation @s chartertimer -= #1 numbers
execute as @e[tag=chartered,scores={chartertimer=0..}] run scoreboard players operation @s chartertimerMod = @s chartertimer
execute as @e[tag=chartered,scores={chartertimer=0..}] run scoreboard players operation @s chartertimerMod %= #20 numbers

execute as @e[tag=chartered,scores={chartertimerMod=19}] run tellraw @s {"text":"CALL FOR HELP. C4LL FOR HELP. C4L1 F0R H3L9.","color":"dark_red"}

execute as @e[tag=chartered,scores={chartertimer=104}] at @s run function charter_sm:summon_cube
execute as @e[tag=chartered,scores={chartertimer=103}] at @s run function charter_sm:merge_cube1

execute as @e[tag=chartered,scores={chartertimer=..102}] at @s run tp @e[tag=cBlock,limit=1,sort=nearest] ~ ~1 ~
execute as @e[tag=chartered,scores={chartertimer=102}] at @s run data merge entity @e[tag=cBlock,limit=1,sort=nearest] {start_interpolation:0,interpolation_duration:100,transformation:{scale:[5f,5f,5f],translation:[-2.5f,-2.5f,-2.5f]}}

execute as @e[tag=chartered,scores={chartertimer=64}] at @s run playsound minecraft:entity.warden.sonic_charge master @a ~ ~ ~ 3 0

execute as @e[tag=chartered,scores={chartertimer=4}] at @s run data merge entity @e[tag=cBlock,limit=1] {start_interpolation:0,interpolation_duration:4,transformation:{scale:[.01f,.01f,.01f],translation:[0f,0f,0f]}}

execute as @e[tag=chartered,scores={chartertimer=0}] at @s run function charter_sm:final_execution

scoreboard players reset @a[tag=!chartered] charterTotem

execute as @e[scores={charterTotem=1..}] at @s run function charter_sm:begin_execution




execute as @e[tag=chartered,scores={chartertimer=..200}] run execute as @e[tag=cBlock,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ ~3 ~
execute as @e[tag=chartered,scores={chartertimer=..180}] run execute as @e[tag=cBlock,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ ~3 ~
execute as @e[tag=chartered,scores={chartertimer=..160}] run execute as @e[tag=cBlock,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ ~3 ~
execute as @e[tag=chartered,scores={chartertimer=..140}] run execute as @e[tag=cBlock,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ ~4 ~
execute as @e[tag=chartered,scores={chartertimer=..120}] run execute as @e[tag=cBlock,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ ~4 ~
execute as @e[tag=chartered,scores={chartertimer=..100}] run execute as @e[tag=cBlock,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ ~4 ~
execute as @e[tag=chartered,scores={chartertimer=..80}] run execute as @e[tag=cBlock,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ ~5 ~
execute as @e[tag=chartered,scores={chartertimer=..60}] run execute as @e[tag=cBlock,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ ~5 ~
execute as @e[tag=chartered,scores={chartertimer=..40}] run execute as @e[tag=cBlock,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ ~5 ~
execute as @e[tag=chartered,scores={chartertimer=..20}] run execute as @e[tag=cBlock,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ ~10 ~

