$scoreboard players set #hider_cooling_time game_control $(ticks)
$data modify storage hide_and_seek:game_control initial_value merge value {hider_cooling_time:$(ticks)}
tellraw @a {"text":"${set_hider_colling_time}: ","extra":[{"nbt":"initial_value.hider_cooling_time","storage":"hide_and_seek:game_control","color":"yellow"}]}