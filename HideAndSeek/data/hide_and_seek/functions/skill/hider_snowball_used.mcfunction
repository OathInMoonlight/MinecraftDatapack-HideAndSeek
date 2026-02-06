kill @e[type=snowball]
execute as @s at @s run playsound minecraft:entity.experience_orb.pickup master @s
summon firework_rocket ~ ~10 ~ {LifeTime:20,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:1,Flicker:true,Trail:true,Colors:[I;4312372]}],Flight:1}}}}
scoreboard players set @s snowball_used 0
scoreboard players set @s hider_cooling 0
scoreboard players add @s hider_points 1

scoreboard players add @s hider_scores_round 1