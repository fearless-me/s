%%: 声明
-ifndef(cfg_guildskill).
-define(cfg_guildskill, 1).

-record(guildskillCfg, {
        id,

        %%: 作者:
        %%: 技能编号
        skillid,

        skillicon,

        %%: 作者:
        %%: 技能等级
        skilllevel,

        %%: 作者:
        %%: 技能名
        skillname,

        %%: 作者:
        %%: 技能说明
        skilldes,

        %%: 作者:
        %%: 技能研究消耗军团资源
        skillresearch,

        %%: 作者:
        %%: 技能学习
        %%: [货币代码，货币数量]
        %%: 1.金币
        %%: 2.绑定金币
        %%: 3.钻石
        %%: 4.声望
        %%: 5.荣誉
        %%: 6.绑定钻石
        %%: 如果消耗的是6和2，则当6和2不足时可以用3和1替代
        %%: 1000.个人物资
        skilllearn,

        %%: 作者:
        %%: 需要军团等级
        guildlevel,

        %%: 作者:
        %%: 技能属性
        %%: {属性ID，值，加法值或乘法值}
        skillproperty

 }).

-endif.