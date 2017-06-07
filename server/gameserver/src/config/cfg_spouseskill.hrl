%%: 声明
-ifndef(cfg_spouseskill).
-define(cfg_spouseskill, 1).

-record(spouseskillCfg, {
        %%: user:
        %%: id
        id,

        %%: user:
        %%: id组，技能组，一组中的技能为一个技能，主键
        group,

        %%: user:
        %%: 技能等级
        skilllevel,

        %%: user:
        %%: 技能id
        skillid,

        %%: user:
        %%: 当前等级升级需要的经验，用于界面进度条显示
        exp,

        %%: user:
        %%: 单次升级消耗的亲密度数量
        intimacy,

        %%: user:
        %%: 加成属性（全职业），只做显示用，{属性id,属性值,加法或乘法值}，0 加法值，1 乘法值
        property,

        %%: 技能名称，用于策划标记与客户端显示
        name,

        %%: user:
        %%: 学习该等级技能需要的角色等级
        level

 }).

-endif.