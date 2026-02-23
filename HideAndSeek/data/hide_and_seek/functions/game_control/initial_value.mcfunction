# data modify storage hide_and_seek:game_control initial_value set value {game_area1_x:5,game_area1_y:0,game_area1_z:-6}
# data modify storage hide_and_seek:game_control initial_value merge value {game_area2_x:14,game_area2_y:1,game_area2_z:-2}
# data modify storage hide_and_seek:game_control initial_value merge value {game_area_place_x:3204,game_area_place_y:64,game_area_place_z:989}
data modify storage hide_and_seek:game_control initial_value merge value {lobby_x:3363,lobby_y:93,lobby_z:1067}
data modify storage hide_and_seek:game_control initial_value merge value {game_spawn_point_x:3313,game_spawn_point_y:97,game_spawn_point_z:1089}
data modify storage hide_and_seek:game_control initial_value merge value {seeker_wating_point_x:3256,seeker_wating_point_y:103,seeker_wating_point_z:1171}

scoreboard objectives remove game_control
scoreboard objectives add game_control dummy
scoreboard players set #seeker_num game_control 1
scoreboard players set #seeker_wating_time game_control 900
scoreboard players set #seek_time game_control 12000
scoreboard players set #hider_cooling_time game_control 200
scoreboard players set #hider_reward_point game_control 5
scoreboard players set #respawn_time game_control 600
scoreboard players set #seeker_skill_interval_time game_control 900
data modify storage hide_and_seek:game_control initial_value merge value {seeker_wating_time:900,seek_time:12000,hider_cooling_time:200,respawn_time:600,seeker_skill_interval_time:900}
data modify storage hide_and_seek:game_control initial_value merge value {seeker_num:1,hider_reward_point:5}

scoreboard players set #game_start game_control 0
scoreboard players set #second game_control 20
scoreboard players set #minute game_control 60