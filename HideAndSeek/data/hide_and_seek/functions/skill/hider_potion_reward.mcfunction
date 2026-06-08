item replace entity @s hotbar.0 with minecraft:structure_void
item replace entity @s hotbar.1 with minecraft:structure_void
loot give @s loot hide_and_seek:potion
item replace entity @s hotbar.0 with minecraft:air
item replace entity @s hotbar.1 with minecraft:air
$scoreboard players remove @s hider_points $(hider_reward_point)
title @s title {"text":"${you_got_random_item}"}
$title @s subtitle {"text":"${cost_taunt_points_1} ","color":"gray","extra":[{"text":"$(hider_reward_point)","color":"yellow"},{"text":" ${cost_taunt_points_2}"}]}
execute as @s at @s run playsound minecraft:entity.player.levelup master @s