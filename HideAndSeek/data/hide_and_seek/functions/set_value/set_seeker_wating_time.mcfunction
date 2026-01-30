$scoreboard players set #seeker_wating_time game_control $(ticks)
$data modify storage hide_and_seek:game_control initial_value merge value {seeker_wating_time:$(ticks)}
tellraw @a {"text":"初始搜查者等待时间已被设置为：","extra":[{"nbt":"initial_value.seeker_wating_time","storage":"hide_and_seek:game_control","color":"yellow"}]}