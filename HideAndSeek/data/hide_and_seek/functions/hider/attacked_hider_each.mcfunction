execute as @e[type=minecraft:interaction,tag=attacked_hider] if score @s block_id = #counter block_id run tag @s add attacked_hider_matched
execute as @a[team=hider,tag=block_hider] if score @s hider_id = @e[type=minecraft:interaction,tag=attacked_hider_matched,limit=1] block_id run tag @s add attacked_hider_matched
gamemode adventure @a[team=hider,tag=attacked_hider_matched]
effect give @a[team=hider,tag=attacked_hider_matched] instant_damage
execute as @a[team=hider,tag=attacked_hider_matched] at @s run tp @s ~ ~0.1 ~

function hide_and_seek:global_scores/add_score_by_uuid with entity @e[type=minecraft:interaction,tag=attacked_hider_matched,limit=1] attack

tag @a[team=hider,tag=attacked_hider_matched] remove attacked_hider_matched
tag @e[type=minecraft:interaction,tag=attacked_hider_matched] remove attacked_hider_matched
scoreboard players add #counter block_id 1
execute unless score #counter block_id > #max block_id run function hide_and_seek:hider/attacked_hider_each