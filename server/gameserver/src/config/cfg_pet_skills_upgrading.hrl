%%: 声明
-ifndef(cfg_pet_skills_upgrading).
-define(cfg_pet_skills_upgrading, 1).

-record(pet_skills_upgradingCfg, {
        skill_id,

        level,

        item_cost,

        coin_cost,

        star_limit,

        reborn_limit,

        level_limit,

        des

 }).

-endif.