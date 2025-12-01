forceload add ~ ~

execute store result storage returntodeath x double 1 run data get entity @s LastDeathLocation.pos[0]
execute store result storage returntodeath y double 1 run data get entity @s LastDeathLocation.pos[1]
execute store result storage returntodeath z double 1 run data get entity @s LastDeathLocation.pos[2]

function jolly_life:return_to_death/rtd2 with storage minecraft:returntodeath
