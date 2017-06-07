%%: 声明
-ifndef(cfg_bussyItemTree).
-define(cfg_bussyItemTree, 1).

-record(bussyItemTreeCfg, {
        %%: 显示顺序
        %%: 按升序显示
        order,

        %%: 是否是一级目录
        %%: 1：是
        %%: 0：不是
        isFirst,

        %%: 物品类别：
        %%: 1：装备
        %%: 2：道具
        %%: 4符文
        mainType,

        %%: 物品主类型
        %%: itemtype
        type,

        %%: 物品次类型
        %%: 如果没有用，则填-1
        subType,

        text

 }).

-endif.