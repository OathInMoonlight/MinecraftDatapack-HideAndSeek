$scoreboard players set #respawn_time game_control $(ticks)
$data modify storage hide_and_seek:game_control initial_value merge value {respawn_time:$(ticks)}
tellraw @a {"text":"重生等待时间已被设置为：","extra":[{"nbt":"initial_value.respawn_time","storage":"hide_and_seek:game_control","color":"yellow"}]}