execute as @e[type=minecraft:block_display] if score @s block_id = #counter block_id run tag @s add showing_display_block
execute as @e[type=minecraft:interaction] if score @s block_id = #counter block_id run tag @s add showing_display_block
execute as @a[team=hider,tag=turning_out_block_hider] if score @s hider_id = #counter block_id run tag @s add showing_display_block

execute as @a[team=hider,tag=showing_display_block] run data modify entity @e[type=minecraft:block_display,tag=showing_display_block,limit=1] block_state.Name set from entity @a[tag=showing_display_block,limit=1] EnderItems[{Slot:0b}].id
execute as @a[team=hider,tag=showing_display_block] at @e[type=minecraft:interaction,tag=showing_display_block] run tp @a[tag=showing_display_block] ~ ~ ~
execute as @a[team=hider,tag=showing_display_block] run kill @e[type=minecraft:interaction,tag=showing_display_block]

tag @a[team=hider,tag=showing_display_block] remove showing_display_block
tag @e[type=minecraft:block_display,tag=showing_display_block] remove showing_display_block
tag @e[type=minecraft:interaction,tag=showing_display_block] remove showing_display_block
scoreboard players add #counter block_id 1
execute unless score #counter block_id > #max block_id run function hide_and_seek:hider/show_display_block