scoreboard players remove @s respawn_counter 1
scoreboard players operation #respawn_counter_seconds respawn_counter = @s respawn_counter
scoreboard players operation #respawn_counter_seconds respawn_counter /= #second game_control
title @s actionbar {"text":"还有 ","extra":[{"score":{"name":"#respawn_counter_seconds","objective":"respawn_counter"},"color":"yellow"},{"text":" 秒重生"}]}
$execute as @s if score @s respawn_counter = #respawn_counter_tmp game_control run tp @s $(seeker_wating_point_x) $(seeker_wating_point_y) $(seeker_wating_point_z)
$execute as @s if score @s respawn_counter matches 0 run tp @s $(game_spawn_point_x) $(game_spawn_point_y) $(game_spawn_point_z)
execute as @s if score @s respawn_counter matches 0 run scoreboard players set @s death_counter 0
execute as @s if score @s respawn_counter matches 0 run scoreboard players operation @s respawn_counter = #respawn_time game_control