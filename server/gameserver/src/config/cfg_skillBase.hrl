%%: 声明
-ifndef(cfg_skillBase).
-define(cfg_skillBase, 1).

-record(skillBaseCfg, {
        %%: Administrator:
        %%: 填入角色属性ID，方便统一查找
        id,

        %%: user:
        settype,

        %%: Administrator:
        %%: 描述
        descStr,

        %%: Administrator:
        %%: [最小值，最大值，基础值]
        setpara

 }).

-endif.