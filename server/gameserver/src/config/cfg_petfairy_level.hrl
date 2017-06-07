%%: 声明
-ifndef(cfg_petfairy_level).
-define(cfg_petfairy_level, 1).

-record(petfairy_levelCfg, {
        lv,

        %%: 宠物精灵成长点数
        point,

        %%: Administrator:
        %%: 使用模型id
        model_G,

        %%: Administrator:
        %%: 模型缩放比例
        effects_G,

        %%: 模型在UI上的Y坐标
        modelY,

        %%: 附加属性:
        %%: [{x,y,z},...]
        %%: X属性id
        %%: Y属性数值
        %%: Z 0代表加法，1为减法
        bouns,

        %%: 曾朴:
        %%: 获取的骑宠精灵技能
        skill,

        %%: 曾朴:
        %%: UI上用于显示，未获得骑宠精灵技能，置灰色(程序需要将skill+skill1组合显示在UI面板中）
        %%: 为0则不显示
        skill1

 }).

-endif.