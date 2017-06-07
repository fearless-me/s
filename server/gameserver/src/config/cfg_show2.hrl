%%: 声明
-ifndef(cfg_show2).
-define(cfg_show2, 1).

-record(show2Cfg, {
        %%: 对话id
        id,

        %%: 组id，属于同一组的会连续播放
        %%: task表show_type2
        groupid,

        %%: 菡琦:
        %%: 策划看，不用管
        taskname,

        %%: 0为显示自己当前模型；
        %%: 其他数字（调取npc表id字段）为对应npc模型
        npcid,

        %%: admin:
        %%: 1-平静
        %%: 2-惊讶
        %%: 3-开心
        %%: 4-变身中
        emotion,

        %%: 李菡琦:
        %%: 播放动作
        animation,

        %%: 李菡琦:
        %%: 表情
        expression,

        %%: 显示名字
        %%: 0自己角色名字
        %%: 其他名字直接填写
        name,

        %%: 模型显示在左边还是右边
        %%: 1.对方，左边
        %%: 2.自己，右边
        side,

        %%: 对话内容
        content

 }).

-endif.