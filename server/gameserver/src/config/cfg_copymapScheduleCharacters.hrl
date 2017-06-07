%%: 声明
-ifndef(cfg_copymapScheduleCharacters).
-define(cfg_copymapScheduleCharacters, 1).

-record(copymapScheduleCharactersCfg, {
        %%: id，不能重复
        id,

        %%: 提示文字，调取strings表的id字段
        stringid,

        %%: 显示下一条的等待时间
        nextsec

 }).

-endif.