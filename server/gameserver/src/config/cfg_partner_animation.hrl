%%: 声明
-ifndef(cfg_partner_animation).
-define(cfg_partner_animation, 1).

-record(partner_animationCfg, {
        id,

        %%: 1 骑士
        %%: 2 法师
        %%: 3 盗贼
        %%: 4 魔女
        profession,

        %%: 动作
        anima,

        %%: 哪一帧
        number,

        %%: 总帧数
        all

 }).

-endif.