scoreboard objectives remove pos_x_current
scoreboard objectives remove pos_y_current
scoreboard objectives remove pos_z_current
scoreboard objectives remove pos_x_last
scoreboard objectives remove pos_y_last
scoreboard objectives remove pos_z_last
scoreboard objectives remove afk_timer
scoreboard objectives remove is_afk
scoreboard objectives remove xp_bar

scoreboard objectives add pos_x_current dummy
scoreboard objectives add pos_y_current dummy
scoreboard objectives add pos_z_current dummy
scoreboard objectives add pos_x_last dummy
scoreboard objectives add pos_y_last dummy
scoreboard objectives add pos_z_last dummy
scoreboard objectives add afk_timer dummy
scoreboard objectives add is_afk dummy
scoreboard objectives add xp_bar dummy

execute as @a[team=hider] store result score @s pos_x_last run data get entity @s Pos[0] 1000
execute as @a[team=hider] store result score @s pos_y_last run data get entity @s Pos[1] 1000
execute as @a[team=hider] store result score @s pos_z_last run data get entity @s Pos[2] 1000
execute as @a[team=hider] store result score @s pos_x_current run data get entity @s Pos[0] 1000
execute as @a[team=hider] store result score @s pos_y_current run data get entity @s Pos[1] 1000
execute as @a[team=hider] store result score @s pos_z_current run data get entity @s Pos[2] 1000
execute as @a[team=hider] run scoreboard players set @s afk_timer 0
execute as @a[team=hider] run scoreboard players set @s is_afk 0
execute as @a[team=hider] run scoreboard players set @s xp_bar 0
scoreboard players set #ratio xp_bar 14