$scoreboard players set #hider_cooling_time game_control $(ticks)
$data modify storage hide_and_seek:game_control initial_value merge value {hider_cooling_time:$(ticks)}
tellraw @a {"text":"躲藏者嘲讽冷却时间已被设置为：","extra":[{"nbt":"initial_value.hider_cooling_time","storage":"hide_and_seek:game_control","color":"yellow"}]}