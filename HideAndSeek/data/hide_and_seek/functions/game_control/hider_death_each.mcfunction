execute as @e[type=minecraft:block_display] if score @s block_id = #block_counter game_control run tag @s add dead_hider_matched
execute as @a[team=hider,tag=dead_hider] if score @s hider_id = #block_counter game_control run tag @s add dead_hider_matched

execute as @a[team=hider,tag=dead_hider_matched] run kill @e[type=minecraft:block_display,tag=dead_hider_matched]

execute as @a[team=hider,tag=dead_hider_matched] run scoreboard players operation #current_compass_range game_control += #seeker_compass_range_increment game_control

tag @a[team=hider,tag=dead_hider_matched] remove dead_hider_matched
tag @e[type=minecraft:block_display,tag=dead_hider_matched] remove dead_hider_matched
scoreboard players add #block_counter game_control 1
execute unless score #block_counter game_control > #max block_id run function hide_and_seek:game_control/hider_death_each