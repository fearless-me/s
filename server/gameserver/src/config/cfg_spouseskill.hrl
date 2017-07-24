%%: 声明
-ifndef(cfg_spouseskill).
-define(cfg_spouseskill, 1).

-record(spouseskillCfg, {
        %%: id,不可重复
        id,

        %%: 技能组id，一组中的技能为一个技能，主键
        group,

        %%: 技能等级
        skilllevel,

        %%: 实际属性增加的被动技能id
        skillid,

        %%: 当前等级升级需要的经验（进度条）
        exp,

        %%: 当前等级单次升级消耗的亲密度数量，并增加对应进度
        intimacy,

        %%: 加成属性（全职业），只做显示用，{属性id,属性值,0}，0为加法值不支持乘法
        property,

        %%: 技能名称，用于策划标记与客户端显示
        name,

        %%: 学习当前等级技能需要的角色等级，伴侣技能可学习等级上限为婚戒等级
        %%: 防止开放等级修改，一级等级限制一定要是0
        level

 }).

-endif.