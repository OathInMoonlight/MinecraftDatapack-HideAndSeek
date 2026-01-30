$scoreboard players set #hider_reward_point game_control $(num)
$data modify storage hide_and_seek:game_control initial_value merge value {hider_reward_point:$(num)}
tellraw @a {"text":"躲藏者兑换挑衅点数已被设置为：","extra":[{"nbt":"initial_value.hider_reward_point","storage":"hide_and_seek:game_control","color":"yellow"}]}