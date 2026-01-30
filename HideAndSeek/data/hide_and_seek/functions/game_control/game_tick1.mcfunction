scoreboard players remove #seeker_wating_time_counter game_control 1

scoreboard players operation #seeker_wating_time_counter_seconds game_control = #seeker_wating_time_counter game_control
scoreboard players operation #seeker_wating_time_counter_seconds game_control /= #second game_control
bossbar set hide_and_seek:seeker_wating_time_bar name {"text":"搜查者","color":"blue","extra":[{"text":"还有 ","color":"white"},{"score":{"name":"#seeker_wating_time_counter_seconds","objective":"game_control"},"color":"yellow"},{"text":" 秒到达战场","color":"white"}]}
execute store result bossbar hide_and_seek:seeker_wating_time_bar value run scoreboard players get #seeker_wating_time_counter game_control

execute if score #seeker_wating_time_counter game_control matches 0 run function hide_and_seek:game_control/seeker_enter_game with storage hide_and_seek:game_control initial_value