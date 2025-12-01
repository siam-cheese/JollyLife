data merge entity @e[tag=cBlock,limit=1,sort=nearest] {start_interpolation:0,interpolation_duration:0,transformation:{scale:[.04f,.04f,.04f],translation:[0f,-.0f,0f]}}
execute as @e[tag=cBlock] at @s positioned ~ ~200 ~ run tp @s @e[limit=1,sort=nearest,tag=chartered]
data modify entity @e[tag=cBlock,limit=1,sort=nearest] Rotation[1] set value 45f