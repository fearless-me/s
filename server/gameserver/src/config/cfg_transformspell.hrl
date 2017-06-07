%%: 声明
-ifndef(cfg_transformspell).
-define(cfg_transformspell, 1).

-record(transformspellCfg, {
        %%: 重数
        lv,

        %%: user:
        %%:  职业id
        career,

        %%: 卡片分值
        %%: 小于等于该值读取此行
        cardPoint,

        %%: Administrator:
        %%: 觉醒武器升级所需经验值
        exp,

        %%: 觉醒变身技能
        skill,

        %%: 器灵材料活动觉醒变身技能
        fakeskill,

        %%: user:
        %%: 觉醒武器开启等级
        start_level,

        %%: 觉醒武器模型，包括界面显示和实际变换的模型
        weapon,

        %%: user:
        %%: 副手武器
        weapon_ex,

        %%: 觉醒武器模型界面显示缩放
        %%: [缩放X，缩放Y，位移X，位移Y]
        weapon_location,

        %%: 觉醒武器模型特效，包括界面显示和实际变换的模型
        weapon_vfx

 }).

-endif.