team join seeker @r[team=!seeker]
scoreboard players add #seeker_num_count game_control 1
execute unless score #seeker_num_count game_control > #seeker_num game_control run function hide_and_seek:game_control/team_allocate