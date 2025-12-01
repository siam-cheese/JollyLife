scoreboard objectives add HLives dummy
scoreboard objectives add deathTrigger deathCount
scoreboard objectives add startRoll dummy
scoreboard objectives add reRoll dummy
scoreboard objectives add secretSantaAnim dummy
scoreboard objectives add isHitMen dummy

scoreboard players set spinRate numbers 1

execute unless score #naughtyChance numbers >= 0 numbers run scoreboard players set #naughtyChance numbers 33

scoreboard objectives add lifeCount trigger
scoreboard objectives add withDrawLife trigger
scoreboard objectives add claimAssasinKill trigger

team add redLife
team modify redLife color red
team add yellowLife
team modify yellowLife color yellow
team add greenLife
team modify greenLife color green
team add darkGreenLife
team modify darkGreenLife color dark_green

