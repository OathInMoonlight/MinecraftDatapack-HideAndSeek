$spawnpoint @a[team=hider] $(seeker_wating_point_x) $(seeker_wating_point_y) $(seeker_wating_point_z)
$tp @a[team=seeker] $(game_spawn_point_x) $(game_spawn_point_y) $(game_spawn_point_z)
scoreboard players set #game_start game_control 2
bossbar set hide_and_seek:seeker_wating_time_bar visible false
bossbar set hide_and_seek:seek_time_bar visible true
bossbar set hide_and_seek:seek_time_bar players @a
execute as @a at @s run playsound minecraft:entity.ender_dragon.growl master @s