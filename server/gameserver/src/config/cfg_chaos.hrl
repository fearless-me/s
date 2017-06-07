%%: 声明
-ifndef(cfg_chaos).
-define(cfg_chaos, 1).

-record(chaosCfg, {
        id,

        %%: 1  混沌战场(活动废弃)
        %%: 2  碧空城摸宝(活动废弃)
        %%: 3  军团营地守卫怪（原军团，当前废弃）
        %%: 4  军团战采集物
        %%: 101-200昼夜系统（npc）应用
        %%: 201-300昼夜系统（怪物）应用
        %%: 301-400昼夜系统（采集物）应用
        type,

        %%: 0.昼夜功能使用的怪物,npc或采集物
        %%: 1.为小怪点
        %%: 2.为BOSS点
        %%: 3.精英怪
        %%: 4.宝箱
        monsterType,

        %%: 怪物的ID
        %%: [id1,id2,id3]
        monsterIdList,

        %%: 作者:
        %%: 坐标点
        %%: [{x,y},{x,y},{x,y}]
        posList,

        %%: 刷新时间
        %%: 单位秒
        time

 }).

-endif.