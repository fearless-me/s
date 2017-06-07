%%: 声明
-ifndef(cfg_openbag).
-define(cfg_openbag, 1).

-record(openbagCfg, {
        %%: 背包与仓库中开启的额外格子数id，前面要加个默认开启的格子数（globsetup表default_box字段）
        id,

        %%: 开启需要的角色等级
        needlevel,

        %%: 开启需要消耗的货币及数量
        %%: 格式[X,Y]，X为货币类型(100为金币，103为钻石，优先消耗绑钻)，Y为货币数量
        needgold

 }).

-endif.