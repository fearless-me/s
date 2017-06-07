%%: 声明
-ifndef(cfg_newplayer_tory).
-define(cfg_newplayer_tory, 1).

-record(newplayer_toryCfg, {
        %%: 展示页面id
        iD,

        %%: 调用图片名字
        picture,

        %%: 文字显示
        story

 }).

-endif.