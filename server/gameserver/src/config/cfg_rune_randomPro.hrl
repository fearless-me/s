%%: 声明
-ifndef(cfg_rune_randomPro).
-define(cfg_rune_randomPro, 1).

-record(rune_randomProCfg, {
        random_property_group_id,

        property_id,

        property_number_min,

        property_number_max,

        mulityOrPlus,

        weight

 }).

-endif.