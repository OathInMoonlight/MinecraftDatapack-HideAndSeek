execute as @a[team=hider] store result score @s pos_x_current run data get entity @s Pos[0] 1000
execute as @a[team=hider] store result score @s pos_y_current run data get entity @s Pos[1] 1000
execute as @a[team=hider] store result score @s pos_z_current run data get entity @s Pos[2] 1000

scoreboard players set @a[team=hider] is_afk 0
execute as @a[team=hider] if score @s pos_x_current = @s pos_x_last run execute if score @s pos_y_current = @s pos_y_last run execute if score @s pos_z_current = @s pos_z_last run scoreboard players set @s is_afk 1
execute as @a[team=hider,scores={afk_timer=..99,is_afk=1}] run scoreboard players add @s afk_timer 1
execute as @a[team=hider,scores={is_afk=0}] run scoreboard players set @s afk_timer 0

execute as @a[team=hider] run scoreboard players operation @s pos_x_last = @s pos_x_current
execute as @a[team=hider] run scoreboard players operation @s pos_y_last = @s pos_y_current
execute as @a[team=hider] run scoreboard players operation @s pos_z_last = @s pos_z_current

execute as @a[team=hider] run scoreboard players operation @s xp_bar = @s afk_timer
execute as @a[team=hider] run scoreboard players operation @s xp_bar /= #ratio xp_bar
execute as @a[team=hider,scores={xp_bar=0}] run xp set @s 0 points
execute as @a[team=hider,scores={xp_bar=1}] run xp set @s 1 points
execute as @a[team=hider,scores={xp_bar=2}] run xp set @s 2 points
execute as @a[team=hider,scores={xp_bar=3}] run xp set @s 3 points
execute as @a[team=hider,scores={xp_bar=4}] run xp set @s 4 points
execute as @a[team=hider,scores={xp_bar=5}] run xp set @s 5 points
execute as @a[team=hider,scores={xp_bar=6}] run xp set @s 6 points