%%: 声明
-ifndef(cfg_rune_compound).
-define(cfg_rune_compound, 1).

-record(rune_compoundCfg, {
        id,

        %%: 客户端显示专用
        desc,

        %%: 赵思琦:
        %%: [{item1,num1},{item2,num2}...]
        material,

        dropid,

        %%: Administrator:
        %%: 合成消耗的非绑定金币数量
        cost

 }).

-endif.