%%: 声明
-ifndef(cfg_logic_group).
-define(cfg_logic_group, 1).

-record(logic_groupCfg, {
        %%: 刘渊:
        %%: 此ID一定不能更改，如果更改需同步给对应的程序修改代码
        id,

        %%: 刘渊：
        %%: logicid组，格式【logic1,logic2,...】
        logicIdList

 }).

-endif.