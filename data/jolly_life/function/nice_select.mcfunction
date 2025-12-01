tag @s add self
tag @a[scores={HLives=0..},tag=!self,tag=!target,limit=1] add targetTemp
tag @s remove self
tag @a[tag=targetTemp] add target
playsound block.amethyst_block.break ambient @s ~ ~ ~ 1 .5
tellraw @s ["",{"text":"You are Nice. Your target is","color":"green"},{"text":" "},{"selector":"@a[tag=targetTemp,limit=1]"},{"text":" You are to bring them a friendly gift :3","color":"green"}]
tag @s add hitMen
tag @a remove targetTemp