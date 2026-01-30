tag @r[team=hider,scores={hider_id=0}] add counting

execute at @a[team=hider,tag=counting] run summon minecraft:block_display ^ ^ ^ {Tags:["counting"]}
scoreboard players operation @e[type=minecraft:block_display,tag=counting] block_id = #counter hider_id

scoreboard players operation @a[team=hider,tag=counting] hider_id = #counter hider_id
scoreboard players remove #counter hider_id 1

loot replace entity @a[team=hider,tag=counting] enderchest.0 loot hide_and_seek:block_generator
data modify entity @e[type=minecraft:block_display,tag=counting,limit=1] block_state.Name set from entity @a[team=hider,tag=counting,limit=1] EnderItems[{Slot:0b}].id

tag @a[team=hider,tag=counting] remove counting
tag @e[type=minecraft:block_display,tag=counting] remove counting
execute unless score #counter hider_id matches 0 run function hide_and_seek:hider/counte_hider