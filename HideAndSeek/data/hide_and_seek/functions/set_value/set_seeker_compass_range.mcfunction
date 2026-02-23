$scoreboard players set #seeker_compass_range game_control $(num)
$data modify storage hide_and_seek:game_control initial_value merge value {seeker_compass_range:$(num)}
tellraw @a {"text":"初始搜查者罗盘范围已被设置为：","extra":[{"nbt":"initial_value.seeker_compass_range","storage":"hide_and_seek:game_control","color":"yellow"}]}