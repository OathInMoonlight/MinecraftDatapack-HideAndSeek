$scoreboard players set #hider_reward_point game_control $(num)
$data modify storage hide_and_seek:game_control initial_value merge value {hider_reward_point:$(num)}
tellraw @a {"text":"${set_hider_reward_point}: ","extra":[{"nbt":"initial_value.hider_reward_point","storage":"hide_and_seek:game_control","color":"yellow"}]}