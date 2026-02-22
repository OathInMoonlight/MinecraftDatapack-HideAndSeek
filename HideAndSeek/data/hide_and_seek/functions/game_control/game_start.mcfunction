gamerule commandBlockOutput false
gamerule reducedDebugInfo true
gamerule keepInventory true
gamerule naturalRegeneration false
gamerule doImmediateRespawn true
gamerule announceAdvancements false
gamerule doFireTick false
gamerule doMobSpawning false
gamerule doTileDrops false
gamerule doWeatherCycle false
gamerule doDaylightCycle false
gamemode adventure @a
clear @a
difficulty peaceful
kill @e[type=minecraft:block_display]
kill @e[type=minecraft:interaction]

team remove seeker
team remove hider
team add seeker
team add hider
team modify hider friendlyFire false
team modify seeker friendlyFire false
scoreboard players set #seeker_num_count game_control 1
function hide_and_seek:game_control/team_allocate
team join hider @a[team=!seeker]
team modify hider seeFriendlyInvisibles false
title @a[team=hider] title {"text":"你是","color":"white","extra":[{"text":"躲藏者","color":"green","bold":true}]}
title @a[team=hider] subtitle {"text":"拼尽全力藏到最后吧","color":"gray"}
title @a[team=seeker] title {"text":"你是","color":"white","extra":[{"text":"搜查者","color":"blue","bold":true}]}
title @a[team=seeker] subtitle {"text":"揪出每一位躲藏者获得胜利","color":"gray"}
xp set @a 0 points
xp set @a 0 levels
effect give @a instant_health 1 5
$spawnpoint @a[team=hider] $(game_spawn_point_x) $(game_spawn_point_y) $(game_spawn_point_z)
$spawnpoint @a[team=seeker] $(seeker_wating_point_x) $(seeker_wating_point_y) $(seeker_wating_point_z)
$tp @a[team=hider] $(game_spawn_point_x) $(game_spawn_point_y) $(game_spawn_point_z)
$tp @a[team=seeker] $(seeker_wating_point_x) $(seeker_wating_point_y) $(seeker_wating_point_z)
function hide_and_seek:hider/afk_detecter_init
function hide_and_seek:hider/allocate_hider_id
scoreboard objectives remove snowball_used
scoreboard objectives add snowball_used minecraft.used:minecraft.snowball
execute as @a run scoreboard players set @s snowball_used 0
scoreboard objectives remove hider_cooling
scoreboard objectives add hider_cooling dummy
execute as @a[team=hider] run scoreboard players set @s hider_cooling 0
scoreboard objectives remove hider_points
scoreboard objectives add hider_points dummy
execute as @a[team=hider] run scoreboard players set @s hider_points 0
scoreboard objectives remove splash_potion_used
scoreboard objectives add splash_potion_used minecraft.used:minecraft.splash_potion
execute as @a[team=hider] run scoreboard players set @s splash_potion_used 0
scoreboard objectives remove lingering_potion_used
scoreboard objectives add lingering_potion_used minecraft.used:minecraft.lingering_potion
execute as @a[team=hider] run scoreboard players set @s lingering_potion_used 0
scoreboard objectives remove death_counter
scoreboard objectives add death_counter deathCount
execute as @a run scoreboard players set @s death_counter 0
scoreboard objectives remove respawn_counter
scoreboard objectives add respawn_counter dummy
execute as @a run scoreboard players operation @s respawn_counter = #respawn_time game_control
scoreboard objectives remove rand_x
scoreboard objectives remove rand_z
scoreboard objectives add rand_x dummy
scoreboard objectives add rand_z dummy
scoreboard players operation #current_compass_range game_control = #seeker_compass_range game_control
execute store result storage hide_and_seek:game_control tmp.compass_range int 1 run scoreboard players get #current_compass_range game_control
function hide_and_seek:skill/rand_pos with storage hide_and_seek:game_control tmp
scoreboard objectives remove skill_invisibility
scoreboard objectives add skill_invisibility dummy
execute as @a[team=hider] run scoreboard players set @s skill_invisibility 0
function hide_and_seek:global_scores/round_start
scoreboard players set #no_hider_found game_control 0

scoreboard players operation #seeker_wating_time_counter game_control = #seeker_wating_time game_control
scoreboard players operation #seek_time_counter game_control = #seek_time game_control
bossbar remove hide_and_seek:seeker_wating_time_bar
bossbar remove hide_and_seek:seek_time_bar
bossbar add hide_and_seek:seeker_wating_time_bar "搜查者即将到达战场"
bossbar add hide_and_seek:seek_time_bar "搜查时间剩余"
bossbar set hide_and_seek:seeker_wating_time_bar color red
$bossbar set hide_and_seek:seeker_wating_time_bar max $(seeker_wating_time)
bossbar set hide_and_seek:seeker_wating_time_bar visible true
bossbar set hide_and_seek:seeker_wating_time_bar players @a
bossbar set hide_and_seek:seek_time_bar color blue
$bossbar set hide_and_seek:seek_time_bar max $(seek_time)
bossbar set hide_and_seek:seek_time_bar visible false

scoreboard players set #game_start game_control 1
execute as @a at @s run playsound minecraft:item.goat_horn.sound.0 master @s