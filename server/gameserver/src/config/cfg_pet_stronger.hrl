%%: 声明
-ifndef(cfg_pet_stronger).
-define(cfg_pet_stronger, 1).

-record(pet_strongerCfg, {
        %%: 作者:
        %%: 属性条目ID
        stronger_id,

        %%: 作者:
        %%: 第一个成长点
        point_1,

        %%: 作者:
        %%: 第一个成长点的浮动值范围
        value_1,

        point_2,

        %%: 作者:
        %%: 第一个成长点的浮动值范围
        value_2,

        point_3,

        %%: 作者:
        %%: 第一个成长点的浮动值范围
        value_3,

        point_4,

        %%: 作者:
        %%: 第一个成长点的浮动值范围
        value_4,

        point_5,

        %%: 作者:
        %%: 第一个成长点的浮动值范围
        value_5,

        %%: 作者:
        %%: 策划看的，没有什么卵用
        info,

        %%: 作者:
        %%: 该属性能达到的最大值
        maxvalue,

        %%: 作者:
        %%: 满属性的战斗力
        battlepower

 }).

-endif.