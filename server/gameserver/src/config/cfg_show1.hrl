%%: 声明
-ifndef(cfg_show1).
-define(cfg_show1, 1).

-record(show1Cfg, {
        %%: 对话id，可修改
        id,

        %%: 组id，同组对话会连续播放
        showgroupid_1,

        %%: 对话的名字显示,0显示角色自己的名称，其他显示具体配置名称
        showname_1,

        %%: 无用字段
        %%: 模型动作调用
        %%: 1-平静
        %%: 2-惊讶
        %%: 3-开心
        %%: 4-变身中
        emotion,

        %%: 模型id调用，调用npc表id字段的模型外观，0代表角色模型
        head,

        %%: 对话内容
        content,

        %%: 本条show完成后，等待多少时间播放下一条
        show_wait,

        %%: 调用配音名称
        show_talk

 }).

-endif.