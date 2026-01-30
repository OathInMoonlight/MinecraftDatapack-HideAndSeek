kill @e[type=minecraft:snowball]
execute as @s at @s run playsound minecraft:entity.experience_orb.pickup master @s
tag @p[team=hider] add expose
execute as @a[team=hider,tag=expose] at @s run tp @s ~ ~0.1 ~
effect give @p[team=hider,tag=expose] glowing 5
title @a[team=hider,tag=expose] title {"text":"你暴露了","color":"red"}
title @a[team=hider,tag=expose] subtitle {"text":"你被一名","extra":[{"text":"搜查者","color":"blue"},{"text":"召唤的圣光击中了"}]}
execute as @a[team=hider,tag=expose] at @s run playsound minecraft:item.trident.throw master @s
tag @a[team=hider,tag=expose] remove expose
scoreboard players set @s snowball_used 0