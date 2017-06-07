%%: 声明
-ifndef(cfg_equipmentDisplay).
-define(cfg_equipmentDisplay, 1).

-record(equipmentDisplayCfg, {
        id,

        name,

        occupation_ID,

        weapon_id,

        deputy_ID,

        breastplate_ID,

        shoes_ID,

        ring_ID,

        necklace_ID,

        helmet_ID,

        pants_ID,

        level,

        %%: 作者:
        %%: 文字说明，描述产出途径，文本信息
        output_route

 }).

-endif.