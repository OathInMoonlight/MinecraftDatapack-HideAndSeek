execute as @e[type=minecraft:block_display] if score @s block_id = #counter block_id run tag @s add hiding_display_block
execute as @a[team=hider,tag=turning_block_hider] if score @s hider_id = #counter block_id run tag @s add hiding_display_block

execute as @a[team=hider,tag=hiding_display_block] run data modify entity @e[type=minecraft:block_display,tag=hiding_display_block,limit=1] block_state.Name set value "minecraft:air"
execute as @a[team=hider,tag=hiding_display_block] at @s align xyz run tp @e[type=minecraft:block_display,tag=hiding_display_block,limit=1] ~ ~ ~
execute as @a[team=hider,tag=hiding_display_block] at @e[type=minecraft:block_display,tag=hiding_display_block] run tp @a[tag=hiding_display_block] ~0.5 ~ ~0.5
execute as @a[team=hider,tag=hiding_display_block] store result score @s pos_x_current run data get entity @s Pos[0] 1000
execute as @a[team=hider,tag=hiding_display_block] store result score @s pos_y_current run data get entity @s Pos[1] 1000
execute as @a[team=hider,tag=hiding_display_block] store result score @s pos_z_current run data get entity @s Pos[2] 1000
execute as @a[team=hider,tag=hiding_display_block] run scoreboard players operation @s pos_x_last = @s pos_x_current
execute as @a[team=hider,tag=hiding_display_block] run scoreboard players operation @s pos_y_last = @s pos_y_current
execute as @a[team=hider,tag=hiding_display_block] run scoreboard players operation @s pos_z_last = @s pos_z_current
execute as @a[team=hider,tag=hiding_display_block] at @s align xyz run summon minecraft:interaction ~0.5 ~ ~0.5 {height:1.005f, width:1.005f, response:true, Tags:["hiding_display_block"]}
scoreboard players operation @e[type=minecraft:interaction,tag=hiding_display_block] block_id = #counter block_id

tag @a[team=hider,tag=hiding_display_block] remove hiding_display_block
tag @e[type=minecraft:block_display,tag=hiding_display_block] remove hiding_display_block
tag @e[type=minecraft:interaction,tag=hiding_display_block] remove hiding_display_block
scoreboard players add #counter block_id 1
execute unless score #counter block_id > #max block_id run function hide_and_seek:hider/hide_display_block