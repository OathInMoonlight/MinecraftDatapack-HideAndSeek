$scoreboard players set #seek_time game_control $(ticks)
$data modify storage hide_and_seek:game_control initial_value merge value {seek_time:$(ticks)}
tellraw @a {"text":"搜查时间已被设置为：","extra":[{"nbt":"initial_value.seek_time","storage":"hide_and_seek:game_control","color":"yellow"}]}