%%: 声明
-ifndef(cfg_copymapScheduleSettle).
-define(cfg_copymapScheduleSettle, 1).

-record(copymapScheduleSettleCfg, {
        %%: 作者:
        %%: 结束条件id
        id,

        %%: 菡琦:
        %%: 策划看任务名字用，不用管~
        name,

        %%: 作者:
        %%: 杀怪需求
        %%: [{怪物id,击杀个数}]
        killmonster,

        %%: 作者:
        %%: 采集道具条件
        collect,

        %%: 作者:
        %%: 倒计时
        countdown,

        %%: 作者:
        %%: 完成特定任务
        task,

        play_show1,

        play_show2,

        %%: 作者:
        %%: 1，需要全部杀完
        %%: 0 不予要
        iskillall,

        %%: user:
        %%: 条件，条件满足的情况下触发事件event，无条件时配0，格式[{id,参数},...](且关系)
        %%: 1.为需要第一次进行副本状态（无参数）
        %%: 2.为生命小于等于多少生命（参数1：1代表百分比，0代表数值；参数2：对应百分比或数值）
        condition,

        %%: user:
        %%: 事件定义，condition条件下触发，无condition条件，直接触发，每条定义程序写死
        %%: 格式[id,参数]
        %%: 1.为副本觉醒引导，参数为点击按钮（觉醒）时增加的场景属性技能id
        %%: 2.女神技能预览引导，eventParam1配置触发的技能id
        event,

        eventParam1,

        eventParam2,

        eventParam3,

        %%: user:
        %%: 失败条件，格式[{怪物id，被杀数量},...]
        defeatmonster

 }).

-endif.