scoreboard objectives remove hider_scores
scoreboard objectives remove seeker_scores
scoreboard objectives add hider_scores dummy "善守者,藏于九地之下"
scoreboard objectives add seeker_scores dummy "善攻者,动于九天之上"
execute as @a run scoreboard players set @s hider_scores 0
execute as @a run scoreboard players set @s seeker_scores 0
scoreboard players set #scores_display_counter game_control 0

scoreboard objectives setdisplay sidebar hider_scores