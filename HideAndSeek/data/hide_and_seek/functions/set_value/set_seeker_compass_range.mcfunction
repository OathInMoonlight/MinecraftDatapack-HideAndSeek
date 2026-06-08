$scoreboard players set #seeker_compass_range game_control $(num)
$data modify storage hide_and_seek:game_control initial_value merge value {seeker_compass_range:$(num)}
tellraw @a {"text":"${set_compass_range}: ","extra":[{"nbt":"initial_value.seeker_compass_range","storage":"hide_and_seek:game_control","color":"yellow"}]}