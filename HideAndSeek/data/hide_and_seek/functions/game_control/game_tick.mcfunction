kill @e[type=item]

execute as @a[team=hider,scores={snowball_used=1}] at @s run function hide_and_seek:skill/hider_snowball_used
execute as @a[team=hider] at @s if score @s hider_points = #hider_reward_point game_control run function hide_and_seek:skill/hider_potion_reward
execute as @a[team=hider,scores={splash_potion_used=1}] run function hide_and_seek:skill/hider_splash_potion_used
execute as @a[team=hider,scores={lingering_potion_used=1}] run function hide_and_seek:skill/hider_lingering_potion_used
execute as @a[team=hider] if score @s hider_cooling < #hider_cooling_time game_control run scoreboard players add @s hider_cooling 1
execute as @a[team=hider] unless data entity @s Inventory[{Slot:1b}].id run clear @s minecraft:snowball
execute as @a[team=hider] if score @s hider_cooling = #hider_cooling_time game_control run execute unless data entity @s Inventory[{Slot:1b}].id run item replace entity @s hotbar.1 with minecraft:snowball{display:{Name:'[{"text":"嘲讽","color":"red","italic":false}]',Lore:['[{"text":"嘲讽获得1点挑衅点数","italic":false}]','[{"text":"集齐5点换取随机物品","italic":false}]']}}
execute as @a[team=hider] run title @s actionbar {"text":"挑衅点数：","extra":[{"score":{"name":"@s","objective":"hider_points"},"color":"yellow"}]}
execute as @a[team=hider] if score @s skill_invisibility matches 1.. run scoreboard players remove @s skill_invisibility 1

execute as @a[team=seeker] unless data entity @s Inventory[{Slot:0b}].id run clear @s minecraft:diamond_sword
execute as @a[team=seeker] unless data entity @s Inventory[{Slot:0b}].id run item replace entity @a[team=seeker] hotbar.0 with minecraft:diamond_sword{Enchantments:[{id:"sharpness",lvl:5}],Unbreakable:true,HideFlags:2}
execute as @a[team=seeker,scores={snowball_used=1}] at @s run function hide_and_seek:skill/seeker_snowball_used
execute if score #seek_time_counter_seconds game_control matches 0 run function hide_and_seek:skill/rand_pos
execute as @a[team=seeker] unless data entity @s Inventory[{Slot:1b}].id run clear @s minecraft:compass
execute as @a[team=seeker] at @s unless data entity @s Inventory[{Slot:1b}].id run function hide_and_seek:skill/seeker_compass
execute if score #game_start game_control matches 1 run scoreboard players operation #compass_reload game_control = #seeker_wating_time_counter game_control
execute if score #game_start game_control matches 2 run scoreboard players operation #compass_reload game_control = #seek_time_counter game_control
scoreboard players operation #compass_reload game_control %= #second game_control
execute as @a[team=seeker] at @s if score #compass_reload game_control matches 0 run function hide_and_seek:skill/seeker_compass

execute if score #game_start game_control matches 1 run function hide_and_seek:game_control/game_tick1
execute if score #game_start game_control matches 2 run function hide_and_seek:game_control/game_tick2

function hide_and_seek:hider/display_block_follow
function hide_and_seek:hider/afk_detecter
execute as @a[team=hider,tag=moving_hider,scores={afk_timer=100..}] at @s unless block ~ ~ ~ #hide_and_seek:prohibit_turn_block run function hide_and_seek:hider/hider_turn_to_block
execute as @a[team=hider,tag=block_hider,scores={is_afk=0}] run function hide_and_seek:hider/hider_turn_out_block
execute as @e[type=minecraft:interaction,nbt={attack:{}}] run function hide_and_seek:hider/attacked_hider

execute as @a[team=hider] if score #game_start game_control matches 1 run effect give @s invisibility infinite 0 true
execute as @a[scores={death_counter=1}] if score #game_start game_control matches 1 run scoreboard players set @s death_counter 0
execute as @a[team=hider,scores={death_counter=1}] if score #game_start game_control matches 2 run function hide_and_seek:game_control/hider_death with storage hide_and_seek:game_control initial_value
execute as @a[team=seeker,scores={death_counter=1..}] if score #game_start game_control matches 2 run function hide_and_seek:game_control/seeker_death with storage hide_and_seek:game_control initial_value

scoreboard players set #hider_num_counter game_control 0
execute as @a[team=hider] run scoreboard players add #hider_num_counter game_control 1
execute if score #hider_num_counter game_control matches 0 run function hide_and_seek:game_control/game_end with storage hide_and_seek:game_control initial_value