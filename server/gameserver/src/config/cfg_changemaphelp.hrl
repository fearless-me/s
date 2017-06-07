%%: 声明
-ifndef(cfg_changemaphelp).
-define(cfg_changemaphelp, 1).

-record(changemaphelpCfg, {
        id,

        %%: 作者:
        %%: 策划自己看的，不用处理
        message_content,

        %%: 作者:
        %%: 触发地图id
        from_mapid,

        %%: 作者:
        %%: 目的地图id
        to_mapid,

        %%: 作者:
        %%: 低于这个等级，过图就显示这个图片
        need_playermaxlevel,

        %%: 菡琦:
        %%: loading图片资源名字
        show_picid

 }).

-endif.