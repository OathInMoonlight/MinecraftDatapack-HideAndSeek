scoreboard objectives remove hider_scores_round
scoreboard objectives add hider_scores_round dummy
execute as @a[team=hider] run scoreboard players set @s hider_scores_round 0