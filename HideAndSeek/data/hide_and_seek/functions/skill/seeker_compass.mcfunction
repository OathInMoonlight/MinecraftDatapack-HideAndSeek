execute as @p[team=hider] run tag @s add compassed
execute as @a[team=hider,tag=compassed] store result score #tmp_rand_x rand_x run data get entity @s Pos[0]
execute as @a[team=hider,tag=compassed] store result score #tmp_rand_z rand_z run data get entity @s Pos[2]
execute as @a[team=hider,tag=compassed] run scoreboard players operation #tmp_rand_x rand_x += @s rand_x
execute as @a[team=hider,tag=compassed] run scoreboard players operation #tmp_rand_z rand_z += @s rand_z
execute as @a[team=hider,tag=compassed] store result storage hide_and_seek:game_control tmp.tmp_rand_x int 1 run scoreboard players get #tmp_rand_x rand_x
execute as @a[team=hider,tag=compassed] store result storage hide_and_seek:game_control tmp.tmp_rand_z int 1 run scoreboard players get #tmp_rand_z rand_z
execute as @s run function hide_and_seek:skill/replace_compass with storage hide_and_seek:game_control tmp
tag @a[team=hider,tag=compassed] remove compassed