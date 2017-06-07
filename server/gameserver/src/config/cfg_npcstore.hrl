%%: 声明
-ifndef(cfg_npcstore).
-define(cfg_npcstore, 1).

-record(npcstoreCfg, {
        %%: 作者:
        %%: 商店ID
        %%: 5军团商店1
        %%: 6军团商店2
        %%: 7军团商店3
        %%: 8军团商店3
        %%: 9劫掠商店
        %%: 10鸭蛋的传送商店
        storeid,

        %%: 作者:
        %%: 道具id
        itemid,

        %%: 作者:
        %%: 排序用id
        id,

        %%: 张龙:
        %%: 如果是装备，才读取此列，物品读取本来的品质
        quality,

        %%: 作者:
        %%: 道具出售价格
        itemprice,

        %%: 作者:
        %%: 货币使用规则，注意，不是货币类型，是使用类型
        %%: 100  金币绑金通用
        %%: 101 声望
        %%: 102 荣誉
        pricetype,

        %%: 每日限购数量
        number_d,

        %%: 0为普通商店
        %%: 1为军团商店
        type,

        %%: 军团商店对应军团的等级
        level

 }).

-endif.