%%: 声明
-ifndef(cfg_equipRecastInit).
-define(cfg_equipRecastInit, 1).

-record(equipRecastInitCfg, {
        %%: 职业
        career,

        %%: 孔位
        slot,

        %%: 属性
        %%: [{属性ID，初始值，最大值},..]
        props,

        %%: Administrator:
        %%: 精炼值分段
        reCastValue,

        %%: user:
        %%: 多少精度解锁符石栏位
        %%: 第1个，第2个，第3个
        lockCastVal,

        %%: Administrator:[[第一段随机组ID]，...]
        %%: ID组=【第一个属性组ID,第二个属性组ID,...】
        group,

        %%: Administrator:该孔位精炼的最大值
        reCastValueMax

 }).

-endif.