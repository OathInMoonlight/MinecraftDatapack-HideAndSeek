# 为所有躲藏者分配唯一ID并生成显示方块
scoreboard objectives remove hider_id
scoreboard objectives remove block_id
scoreboard objectives add hider_id dummy
scoreboard objectives add block_id dummy

execute as @a[team=hider] run scoreboard players add #counter hider_id 1
scoreboard players operation #max block_id = #counter hider_id
# scoreboard players operation #hider_num_counter game_control = #counter hider_id
execute as @a[team=hider] run scoreboard players set @s hider_id 0
function hide_and_seek:hider/counte_hider
tag @a remove block_hider
tag @a remove moving_hider
tag @a[team=hider] add moving_hider