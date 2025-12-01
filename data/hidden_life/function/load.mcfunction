scoreboard objectives add HLives dummy
scoreboard objectives add deathTrigger deathCount
scoreboard objectives add startRoll dummy
scoreboard objectives add reRoll dummy
scoreboard objectives add hitMenAnim dummy
scoreboard objectives add isHitMen dummy
gamerule keepInventory true
gamerule doImmediateRespawn true
gamerule showDeathMessages false

scoreboard players set spinRate numbers 1

execute unless score #hitMenChance numbers >= 0 numbers run scoreboard players set #hitMenChance numbers 33

scoreboard objectives add lifeCount trigger
scoreboard objectives add withDrawLife trigger
scoreboard objectives add claimAssasinKill trigger

