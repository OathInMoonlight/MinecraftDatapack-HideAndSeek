scoreboard players set #game_start game_control 0
clear @a
kill @e[type=minecraft:block_display]
kill @e[type=minecraft:interaction]
execute as @a[team=hider,tag=block_hider] at @s run tp @s ~ ~0.1 ~
execute as @a[team=hider,tag=block_hider] run scoreboard players set @s is_afk 0
function hide_and_seek:hider/hider_turn_out_block
bossbar set hide_and_seek:seek_time_bar visible false
effect clear @a[team=hider] minecraft:invisibility
tag @a remove block_hider
tag @a remove moving_hider

effect give @a instant_health 1 3
$spawnpoint @a $(lobby_x) $(lobby_y) $(lobby_z)
$tp @a $(lobby_x) $(lobby_y) $(lobby_z)
title @a title {"text":"游戏结束","color":"yellow","bold":true}
tellraw @a {"text":"游戏结束！","color":"yellow","bold":true}
execute as @a if score #hider_num_counter game_control matches 0 run title @a subtitle {"text":"搜查者","color":"blue","bold":true,"extra":[{"text":"找出了所有老鼠","color":"white","bold":false}]}
execute as @a if score #hider_num_counter game_control matches 0 run tellraw @s {"text":"搜查者","color":"blue","bold":true,"extra":[{"text":"找出了所有老鼠","color":"white","bold":false}]}
execute as @a[team=hider] at @s if score #hider_num_counter game_control matches 0 run playsound minecraft:item.goat_horn.sound.7 master @s
execute as @a[team=seeker] at @s if score #hider_num_counter game_control matches 0 run playsound minecraft:item.goat_horn.sound.1 master @s
execute as @a unless score #hider_num_counter game_control matches 0 run title @a subtitle {"text":"躲藏者","color":"green","bold":true,"extra":[{"text":"苟到了最后","color":"white","bold":false}]}
execute as @a unless score #hider_num_counter game_control matches 0 run tellraw @s {"text":"躲藏者","color":"green","bold":true,"extra":[{"text":"苟到了最后","color":"white","bold":false}]}
execute as @a[team=hider] at @s unless score #hider_num_counter game_control matches 0 run playsound minecraft:item.goat_horn.sound.1 master @s
execute as @a[team=seeker] at @s unless score #hider_num_counter game_control matches 0 run playsound minecraft:item.goat_horn.sound.7 master @s

execute as @a[team=hider] run scoreboard players add @s hider_scores 5
execute as @a[team=hider] run scoreboard players operation @s hider_scores += @s hider_scores_round