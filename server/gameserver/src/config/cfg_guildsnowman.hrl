%%: 声明
-ifndef(cfg_guildsnowman).
-define(cfg_guildsnowman, 1).

-record(guildsnowmanCfg, {
        %%: 作者:
        %%: 材料类型
        id,

        %%: 作者:
        %%: 材料名
        name,

        icon,

        %%: 作者:
        %%: 每个雪人所需材料数量
        snowmanNeed,

        %%: 作者:
        %%: 玩家携带上限
        carryMax,

        %%: 作者:
        %%: 材料来源ID（对应来源类型为怪物ID或采集物ID）
        %%: 1：怪物
        %%: 2：采集物
        srcType,

        %%: 作者:
        %%: 材料来源ID（对应来源类型为怪物ID或采集物ID）
        srcID,

        %%: 作者:
        %%: 捐献材料时提供的奖励倍数
        rate,

        %%: 作者:luoch
        %%: [{{中心点X,中心点Y},区域随机点数量},{{中心点X,中心点Y},区域随机点数量}...]
        %%: 取中心点坐标XY，然后进行+-10区域内容随机点，随机出来的点为怪物/材料的刷新点。
        pos,

        %%: 作者:
        %%: 单个材料奖励
        reward,

        describe_1,

        describe_2

 }).

-endif.