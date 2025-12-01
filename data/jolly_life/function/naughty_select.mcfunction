tag @s add self
tag @a[scores={HLives=0..},tag=!self,tag=!target,limit=1] add targetTemp
tag @s remove self
tag @a[tag=targetTemp] add target
playsound entity.ravager.hurt ambient @s ~ ~ ~ 1 .5
tellraw @s ["",{"text":"You are Naughty. Your target is","color":"red"},{"text":" "},{"selector":"@a[tag=targetTemp,limit=1]"},{"text":" You are to play a prank on them, if this person is on 2 or more lives, this prank must kill. If they are on/fall to 1 life, just be a nuissence or something idk.","color":"red"}]
tag @a remove targetTemp