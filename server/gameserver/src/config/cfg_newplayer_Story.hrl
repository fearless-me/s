%%: 声明
-ifndef(cfg_newplayer_Story).
-define(cfg_newplayer_Story, 1).

-record(newplayer_StoryCfg, {
        %%: 不同职业
        %%: 1.枪械女
        type,

        %%: 页数
        iD,

        %%: 调用图片名字
        picture,

        %%: 文字显示
        story

 }).

-endif.