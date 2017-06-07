%%: 声明
-ifndef(cfg_drop).
-define(cfg_drop, 1).

-record(dropCfg, {
        %%: 作者:
        %%: 掉落ID
        dropId,

        %%: 作者:
        %%: 掉落类型
        %%: 0  物品掉落 item
        %%: 1  掉落包掉落 droppackage
        %%: 2  货币掉落
        %%: 3  符文掉落
        dropType,

        %%: 掉落数据ID
        %%: 物品掉落类型为物品ID
        %%: 掉落包类型为掉落包ID
        %%: 货币类型为货币ID
        %%: 符文类型为符文id
        dataId,

        %%: 作者:
        %%: 掉落几率
        %%: 10000 = 100%
        probability,

        %%: 掉落的最小数量
        %%: 如果min>=max则掉落数量固定为min
        %%: 只适用于物品掉落，掉落包掉落此值为0
        min,

        %%: 作者:
        %%: 掉落的最大数量
        %%: 如果min>=max则掉落数量固定为min
        %%: 只适用于物品掉落，掉落包掉落此值为0
        max,

        %%: 0不绑定
        %%: 1绑定
        isbind,

        %%: 作者:
        %%: 是否受到掉落率的影响
        %%: 0 不影响 1影响
        dropcontrol,

        %%: 唐斯然:
        %%: 掉落限制组，在dropcontrol表中配置
        %%: 用于服务器及个人掉落上限
        %%: 0 代表没有控制
        dropclass

 }).

-endif.