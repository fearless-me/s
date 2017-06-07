%%: 声明
-ifndef(cfg_show1).
-define(cfg_show1, 1).

-record(show1Cfg, {
        %%: 对话id
        id,

        %%: 组id，同一组的会连续播放
        showgroupid_1,

        %%: show的名字显示,0显示角色自己的名称，其他显示具体显示名称
        showname_1,

        %%: admin:
        %%: 1-平静
        %%: 2-惊讶
        %%: 3-开心
        %%: 4-变身中
        emotion,

        %%: 小头像资源id
        head,

        %%: 对话内容
        content,

        %%: 张龙:
        %%: 这个show完成后，等待多少时间放吓一跳
        show_wait,

        %%: 张龙:
        %%: show的配音
        show_talk

 }).

-endif.