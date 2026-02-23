$scoreboard players set #seeker_skill_interval_time game_control $(ticks)
$data modify storage hide_and_seek:game_control initial_value merge value {seeker_skill_interval_time:$(ticks)}
tellraw @a {"text":"搜查者技能间隔时间已被设置为：","extra":[{"nbt":"initial_value.seeker_skill_interval_time","storage":"hide_and_seek:game_control","color":"yellow"}]}