execute as @a[team=hider,scores={death_counter=1},limit=1] run tag @s add dead_hider
clear @a[team=hider,tag=dead_hider]
scoreboard players set #no_hider_found game_control 0

scoreboard players set #block_counter game_control 1
function hide_and_seek:game_control/hider_death_each

effect clear @a[team=hider,tag=dead_hider] minecraft:invisibility
team join seeker @a[team=hider,tag=dead_hider]
$tp @a[team=seeker,tag=dead_hider] $(seeker_wating_point_x) $(seeker_wating_point_y) $(seeker_wating_point_z)
xp set @a[team=seeker,tag=dead_hider] 0 points
xp set @a[team=seeker,tag=dead_hider] 0 levels
title @a[team=seeker,tag=dead_hider] title {"text":"你现在是","color":"white","extra":[{"text":"搜查者","color":"blue","bold":true},{"text":"了","color":"white"}]}
title @a[team=seeker,tag=dead_hider] subtitle {"text":"揪出其它躲藏者获得胜利","color":"gray"}
tag @a[team=seeker,tag=dead_hider] remove dead_hider