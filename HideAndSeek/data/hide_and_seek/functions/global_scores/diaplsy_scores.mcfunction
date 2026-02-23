scoreboard players add #scores_display_counter game_control 1
execute if score #scores_display_counter game_control matches 200 run scoreboard objectives setdisplay sidebar seeker_scores
execute if score #scores_display_counter game_control matches 400 run scoreboard objectives setdisplay sidebar hider_scores
execute if score #scores_display_counter game_control matches 400 run scoreboard players set #scores_display_counter game_control 0