%%: 声明
-ifndef(cfg_goddess).
-define(cfg_goddess, 1).

-record(goddessCfg, {
        %%: 第几关
        id,

        %%: A怪物+坐标
        monsterA_ID,

        %%: A怪物刷新数量
        monsterA_num,

        %%: A刷新间隔（毫秒）
        monsterA_cd,

        %%: 怪物B 优先打女神 被打打玩家
        monsterB_ID,

        %%: B怪物刷新数量
        monsterB_num,

        %%: B刷新间隔（毫秒）
        monsterB_cd,

        %%: 干扰怪
        monsterC_ID,

        %%: 刷新数量
        monsterC_num,

        %%: 刷新间隔（毫秒）
        monsterC_cd,

        %%: 只打玩家的BOSS
        %%: 每5关刷新1只
        boss_ID,

        %%: 刷新数量
        boss_num,

        %%: 每关刷新间隔
        %%: 毫秒
        interval

 }).

-endif.