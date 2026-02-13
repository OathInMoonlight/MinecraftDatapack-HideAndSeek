execute as @e[type=minecraft:block_display] if score @s block_id = #counter block_id run tag @s add following
execute as @a[team=hider] if score @s hider_id = #counter block_id run tag @s add following
execute as @a[team=hider,tag=following] at @s if score @s skill_invisibility matches 0 run tp @e[type=minecraft:block_display,tag=following] ~-0.5 ~ ~-0.5
execute as @a[team=hider,tag=following] at @s if score @s skill_invisibility matches 1.. run tp @e[type=minecraft:block_display,tag=following] ~-0.5 ~-40 ~-0.5
tag @e[type=minecraft:block_display,tag=following] remove following
tag @a[team=hider,tag=following] remove following
scoreboard players add #counter block_id 1
execute unless score #counter block_id > #max block_id run function hide_and_seek:hider/display_block_follow_each