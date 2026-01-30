execute as @e[type=minecraft:interaction,nbt={attack:{}},limit=1] run tag @s add attacked_hider
scoreboard players set #counter block_id 1
function hide_and_seek:hider/attacked_hider_each

tag @e[type=minecraft:interaction,tag=attacked_hider] remove attacked_hider