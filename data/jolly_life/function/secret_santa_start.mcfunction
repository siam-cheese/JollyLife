scoreboard players set @a secretSantaAnim 125
tellraw @a[tag=LittleShit] {"text": "You are no longer santas elf, return to normal"}
execute as @a[tag=LittleShit] run function jolly_life:remove_little_shit