execute as @a[team=hider,tag=block_hider,scores={is_afk=0}] run tag @s add turning_out_block_hider
tag @a[team=hider,tag=turning_out_block_hider] remove block_hider

scoreboard players set #counter block_id 1
function hide_and_seek:hider/show_display_block
execute as @a[team=hider,tag=turning_out_block_hider] at @s align xyz run setblock ~ ~ ~ minecraft:air
execute as @a[team=hider,tag=turning_out_block_hider] run gamemode adventure @s
execute as @a[team=hider,tag=turning_out_block_hider] at @s run playsound minecraft:block.wood.step master @s

tag @a[team=hider,tag=turning_out_block_hider] add moving_hider
tag @a[team=hider,tag=turning_out_block_hider] remove turning_out_block_hider