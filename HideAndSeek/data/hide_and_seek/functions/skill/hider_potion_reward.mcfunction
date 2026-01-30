item replace entity @s hotbar.0 with minecraft:structure_void
item replace entity @s hotbar.1 with minecraft:structure_void
loot give @s loot hide_and_seek:potion
item replace entity @s hotbar.0 with minecraft:air
item replace entity @s hotbar.1 with minecraft:air
scoreboard players remove @s hider_points 5
title @s title {"text":"你获得了一瓶随机的药水"}
title @s subtitle {"text":"消耗 ","color":"gray","extra":[{"text":"5","color":"yellow"},{"text":" 点挑衅点数"}]}
execute as @s at @s run playsound minecraft:entity.player.levelup master @s