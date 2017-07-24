%%: 声明
-ifndef(cfg_weddingring).
-define(cfg_weddingring, 1).

-record(weddingringCfg, {
        %%: id，不可重复
        id,

        %%: 阶段（每阶10级）
        stage,

        %%: 等级（每阶10级）
        level,

        %%: 当前等级婚戒的经验（进度条）
        exp,

        %%: 当前等级下单次升级消耗的亲密度,增长对应数量进度
        intimacy,

        %%: 婚戒名称，用于客户端显示
        name,

        %%: 戒指模型
        model,

        %%: 当前等级婚戒加成属性，格式 [{PropID,Value},...] ，[{属性1id,值},...]，当前等级段属性 直接 替换之前的属性，不会和上一级属性累加
        property,

        %%: 突破该等级需要的道具[{道具id,数量}...]，没有配空
        break_itemID,

        %%: 突破当前等级需要的角色等级，（只在突破时生效，阶段最高等级），其余等级配空
        levelLimit

 }).

-endif.