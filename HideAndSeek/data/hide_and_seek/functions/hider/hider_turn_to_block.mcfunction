execute as @a[team=hider,tag=moving_hider,scores={afk_timer=100..}] at @s unless block ~ ~ ~ #hide_and_seek:prohibit_turn_block run tag @s add turning_block_hider
tag @a[team=hider,tag=turning_block_hider] remove moving_hider

scoreboard players set #counter block_id 1
function hide_and_seek:hider/hide_display_block
execute as @a[team=hider,tag=turning_block_hider] run gamemode spectator @s
execute as @a[team=hider,tag=turning_block_hider] at @s align xyz run function hide_and_seek:hider/setblock with entity @s EnderItems[{Slot:0b}]
execute as @a[team=hider,tag=turning_block_hider] at @s run playsound minecraft:block.stone.break master @s

tag @a[team=hider,tag=turning_block_hider] add block_hider
tag @a[team=hider,tag=turning_block_hider] remove turning_block_hider