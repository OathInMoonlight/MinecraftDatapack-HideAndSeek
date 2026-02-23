scoreboard players remove #seek_time_counter game_control 1

scoreboard players operation #seek_time_counter_seconds game_control = #seek_time_counter game_control
scoreboard players operation #seek_time_counter_seconds game_control /= #second game_control
scoreboard players operation #seek_time_counter_minutes game_control = #seek_time_counter_seconds game_control
scoreboard players operation #seek_time_counter_minutes game_control /= #minute game_control
scoreboard players operation #minutes_times_seconds game_control = #seek_time_counter_minutes game_control
scoreboard players operation #minutes_times_seconds game_control *= #minute game_control
scoreboard players operation #seek_time_counter_seconds game_control -= #minutes_times_seconds game_control
data modify storage hide_and_seek:game_control tmp merge value {display_second:"",display_minute:""}
execute if score #seek_time_counter_seconds game_control matches ..9 run data modify storage hide_and_seek:game_control tmp merge value {display_second:"0"}
execute if score #seek_time_counter_minutes game_control matches ..9 run data modify storage hide_and_seek:game_control tmp merge value {display_minute:"0"}
bossbar set hide_and_seek:seek_time_bar name {"text":"搜查时间剩余 ","color":"white","extra":[{"nbt":"tmp.display_minute","storage":"hide_and_seek:game_control","color":"yellow"},{"score":{"name":"#seek_time_counter_minutes","objective":"game_control"},"color":"yellow"},{"text":":","color":"yellow"},{"nbt":"tmp.display_second","storage":"hide_and_seek:game_control","color":"yellow"},{"score":{"name":"#seek_time_counter_seconds","objective":"game_control"},"color":"yellow"}]}
execute store result bossbar hide_and_seek:seek_time_bar value run scoreboard players get #seek_time_counter game_control

scoreboard players operation #minutes_times_seconds game_control = #seek_time_counter game_control
scoreboard players operation #minutes_times_seconds game_control %= #seeker_skill_interval_time game_control
execute if score #minutes_times_seconds game_control matches 0 run tag @r[team=seeker] add lucky
give @a[team=seeker,tag=lucky] minecraft:snowball{display:{Name:'[{"text":"圣光","color":"white","italic":false}]',Lore:['[{"text":"使圣光降临在最近的躲藏者身上","italic":false}]','[{"text":"持续5秒钟","italic":false}]']}}
title @a[team=seeker,tag=lucky] title {"text":"你获得了一个圣光"}
title @a[team=seeker,tag=lucky] subtitle {"text":"幸运女神眷顾于你","color":"gray"}
execute as @a[team=seeker,tag=lucky] at @s run playsound minecraft:entity.player.levelup master @s
tag @a[team=seeker,tag=lucky] remove lucky

execute if score #seek_time_counter game_control matches 0 run function hide_and_seek:game_control/game_end with storage hide_and_seek:game_control initial_value