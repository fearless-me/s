%%: 声明
-ifndef(cfg_gorgeous).
-define(cfg_gorgeous, 1).

-record(gorgeousCfg, {
        id,

        %%: 作者:
        %%: 华丽值数值
        %%: 配置方式：小于且包含；
        unmber_G,

        %%: 作者:
        %%: 使用模型ID
        model_G,

        %%: 显示模型缩放比例
        effects_G,

        %%: 模型在UI面板上的Y坐标
        modelY,

        %%: 宝石技能技能
        skill

 }).

-endif.