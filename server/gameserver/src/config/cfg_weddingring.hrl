%%: 声明
-ifndef(cfg_weddingring).
-define(cfg_weddingring, 1).

-record(weddingringCfg, {
        %%: user:
        %%: id
        id,

        %%: user:
        %%: 当前阶段
        stage,

        %%: user:
        %%: 当前阶段下的等级
        level,

        %%: user:
        %%: 当前等级婚戒的经验（进度条，升级到下一级所需数量）
        exp,

        %%: user:
        %%: 单次升级消耗的亲密度数量,对应增长对应数量的进度
        intimacy,

        %%: user:
        %%: 婚戒名称，用于客户端显示
        name,

        %%: user:
        %%: 调用戒指模型
        model,

        %%: user:
        %%: 属性， [{PropID,Value}...] ，属性id,值，当前等级段属性 直接 替换之前的属性，不会和上一级属性累加
        property,

        %%: user:
        %%: 突破该等级需要的道具[{道具id,数量}...]，没有配0
        break_itemID,

        %%: Administrator:
        %%: 突破当前等级需要的角色等级，（只在突破时生效，为阶段的最高等级）
        levelLimit

 }).

-endif.