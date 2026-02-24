# MinecraftDatapack-HideAndSeek
这是一个用于原版服务器的 **方块躲猫猫** 小游戏数据包，基于 **1.20.4** 版本开发

## 使用方法
1. [点击此处下载数据包](https://github.com/OathInMoonlight/MinecraftDatapack-HideAndSeek/releases)  
2. 将下载好的数据包放置在你游戏存档的`存档名/datapacks/`目录下  
3. 打开游戏进入存档，使用`/reload`命令加载数据包  
4. 按照提示设置初始参数  
5. 使用命令`/function hide_and_seek:game_control/run_game_start`开始游戏
或者使用nbt标签
`{BlockEntityTag:{front_text:{messages:['{"text":""}','{"text":"开始游戏","clickEvent":{"action":"run_command","value":"/function hide_and_seek:game_control/run_game_start"}}','{"text":""}','{"text":""}']}}}`
获取开始游戏告示牌

## 基本规则
游戏开始将会随机分配玩家为 **躲藏者** 和 **搜查者**
### 躲藏者
- **躲藏者** 会被分配一个方块，原地不动5秒即可变为这个方块
- **躲藏者** 被攻击时会变回实体
- **躲藏者** 可以释放技能 **嘲讽** 来赚取 **挑衅点数**
- **嘲讽** 会在 **躲藏者** 的头顶释放烟花来暴露位置
- **挑衅点数** 可以随机换取 **瞬间治疗药水** 或者 **隐身药水**
- **躲藏者** 在倒计时结束前未被击杀则获胜
- **躲藏者** 若被击杀则变更至 **搜查者** 阵营
### 搜查者
- **搜查者** 在游戏开始需等待一定时间后进入游戏区域
- **搜查者** 会被分配一个 **罗盘** 指向最近的 **躲藏者** 的模糊位置
- 随着 **躲藏者** 被击杀，**罗盘** 的指向会愈发不精确
- 若 **搜查者** 一定时间未击杀 **躲藏者**，一位随机的 **搜查者** 将获得一个 **圣光** 技能
- **搜查者** 释放 **圣光** 可以使其最近的 **躲藏者** 显形
- **搜查者** 若死亡需等待一定时间后复活
- **搜查者** 在规定时间内击杀所有 **躲藏者** 则获胜
### 记分板
- **躲藏者** 若获得游戏胜利则获得分数
- **躲藏者** 若获得游戏胜利，其累计的 **挑衅点数** 也会转化为分数
- **搜查者** 需找出方块状态下的 **躲藏者** 以获得分数

## 可自定义项
### 地点类
使用函数`hide_and_seek:set_value/set_lobby`设置地图大厅位置  
使用函数`hide_and_seek:set_value/set_game_spawn_point`设置游戏内出生点  
使用函数`hide_and_seek:set_value/set_seeker_wating_point`设置搜查者等待位置
### 时间类
使用函数`hide_and_seek:set_value/set_seek_time`设置搜查者搜查时间  
使用函数`hide_and_seek:set_value/set_seeker_wating_time`设置搜查者初始等待时间  
使用函数`hide_and_seek:set_value/set_respawn_time`设置重生等待时间  
使用函数`hide_and_seek:set_value/set_hider_cooling_time`设置躲藏者嘲讽技能冷却时间  
使用函数`hide_and_seek:set_value/set_seeker_skill_interval_time`设置搜查者圣光发放间隔
### 其余规则
使用函数`hide_and_seek:set_value/set_seeker_num`设置初始搜查者数量  
使用函数`hide_and_seek:set_value/set_hider_reward_point`设置多少嘲讽点数兑换一次药水  
使用函数`hide_and_seek:set_value/set_seeker_compass_range`设置搜查者罗盘初始范围  
使用函数`hide_and_seek:set_value/set_seeker_compas_range_increment`设置搜查者罗盘范围随躲藏者数量减少的增量