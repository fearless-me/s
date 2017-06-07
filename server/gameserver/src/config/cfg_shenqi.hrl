%%: 声明
-ifndef(cfg_shenqi).
-define(cfg_shenqi, 1).

-record(shenqiCfg, {
        %%: 神器的ID
        id,

        %%: 等级
        level,

        %%: 升级所需要的道具
        %%: [{类型，数量}]
        upitem,

        %%: 神器升级材料
        %%: [{货币类型,货币数值},{货币类型,数值}….]
        upgrade,

        %%: 模型资源
        resources,

        %%: 器灵模型界面显示位置
        %%: [位移X，位移Y，位移Z]
        location,

        %%: 器灵模型界面显示缩放比例
        scale,

        %%: 神器附带的技能
        %%: [战士系职业技能，法师系职业能，刺客系职业技能，预留系职业技能]
        skill,

        %%: user:
        %%: 每一级所提供给觉醒武器的经验值
        exp,

        %%: 骑士系
        %%: 属性
        %%: {属性id,属性值,加法或乘法值}
        %%: 0 加法值
        %%: 1 乘法值
        paladin,

        %%: 法师系
        %%: 属性
        %%: {属性id,属性值,加法或乘法值}
        %%: 0 加法值
        %%: 1 乘法值
        wizard,

        %%: 刺客系
        %%: 属性
        %%: {属性id,属性值,加法或乘法值}
        %%: 0 加法值
        %%: 1 乘法值
        assassin,

        %%: 预留
        %%: 属性
        %%: {属性id,属性值,加法或乘法值}
        %%: 0 加法值
        %%: 1 乘法值
        soulReaper,

        %%: 枪械师
        mechanic,

        %%: 枪械师的外观
        newplayer_1,

        %%: 枪械师的外观
        newplayer_2,

        %%: 神器名称
        name,

        %%: 神器的描述
        txt

 }).

-endif.