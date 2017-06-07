%%: 声明
-ifndef(cfg_knightedPackage).
-define(cfg_knightedPackage, 1).

-record(knightedPackageCfg, {
        iD,

        %%: 作者:
        %%: 爵位等级
        level,

        %%: 作者:
        %%: 礼包名称
        name,

        %%: 作者:
        %%: 奖励道具
        item,

        %%: 作者:
        %%: 消耗钻石
        diamonds,

        %%: 作者:
        %%: 购买后可获得积分
        integral,

        %%: 作者:
        %%: 客户端用于礼包说明
        explain,

        %%: 作者:
        %%: 客户端用于展示该礼包最重要道具的名字
        model_name,

        %%: 作者:
        %%: 客户端根据路径展示对应的模型
        %%: 约定：程序自动处理到role文件夹下面，策划只需要配置如npc\n_3 这样的字符串
        model_path,

        %%: 作者:
        %%: 用于区分模型类型
        %%: 1 是神器
        %%: 2 是宠物
        %%: 3 是装备
        %%: 4 是其他
        model_type,

        %%: 模型方向
        angle,

        %%: 模型大小
        size,

        %%: 模型位置
        posOffset

 }).

-endif.