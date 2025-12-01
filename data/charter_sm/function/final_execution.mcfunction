particle dust{color:[0.57,0.23,0.8],scale:4} ~ ~1 ~ .125 1 .125 100 1000 normal
particle minecraft:flame ~ ~1 ~ .125 .125 .125 5 3000
tellraw @a ["",{"selector":"@s","color":"dark_red"},{"text":" lost their final life.","color":"dark_red"}]

summon minecraft:lightning_bolt ~ ~2 ~
execute as @a[distance=..30] at @s run playsound minecraft:block.end_portal.spawn master @s ~ ~ ~ 30 1
execute as @a[distance=30..40] at @s run playsound minecraft:block.end_portal.spawn master @s ~ ~ ~ 30 .7
execute as @a[distance=40..60] at @s run playsound minecraft:block.end_portal.spawn master @s ~ ~ ~ 25 .5
execute as @a at @s run playsound minecraft:block.end_portal.spawn master @s ~ ~ ~ 20 .1
kill @e[tag=cBlock]
summon item ~ ~ ~ {Item:{id:"minecraft:skeleton_skull",Count:1b},Invulnerable:1b}
tag @s remove chartered
scoreboard players reset @s charterTotem
tp ~ ~-10 ~
gamerule keepInventory false
kill @s
gamemode spectator
gamerule keepInventory true