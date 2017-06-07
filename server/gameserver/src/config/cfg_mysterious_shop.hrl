%%: 声明
-ifndef(cfg_mysterious_shop).
-define(cfg_mysterious_shop, 1).

-record(mysterious_shopCfg, {
        %%: 等级阶段
        lvl_phase,

        %%: 唯一ID
        %%: 绝对不可重复
        %%: 一个阶段10000的ID差
        only_id,

        %%: 作者:
        %%: 道具id
        itemid,

        %%: 作者:
        %%: 最小等级（包含）
        lvl_min,

        %%: 作者:
        %%: 最大等级（包含）
        lvl_max,

        %%: 作者:
        %%: 金钱类型
        %%: 如果是绑定金币，则可用非绑定金币补
        %%: 如果是绑定钻石，则可用非绑定钻石补足
        money_type,

        %%: 作者:
        %%: 单价
        money,

        %%: 作者:
        %%: 限购个数
        %%: 0不允许购买
        %%: -1不限购
        limit_number,

        %%: 作者:
        %%: 权重
        weight1,

        %%: 折扣，客户端显示之用，一个图标
        discount,

        %%: 标记稀有和折扣的
        %%: 1.稀有
        %%: 2.折扣
        mark

 }).

-endif.