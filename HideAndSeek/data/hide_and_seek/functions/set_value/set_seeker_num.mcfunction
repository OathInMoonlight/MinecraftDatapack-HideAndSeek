$scoreboard players set #seeker_num game_control $(num)
$data modify storage hide_and_seek:game_control initial_value merge value {seeker_num:$(num)}
tellraw @a {"text":"${set_seeker_num}: ","extra":[{"nbt":"initial_value.seeker_num","storage":"hide_and_seek:game_control","color":"yellow"}]}