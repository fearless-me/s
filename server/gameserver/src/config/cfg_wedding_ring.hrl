%%: 声明
-ifndef(cfg_wedding_ring).
-define(cfg_wedding_ring, 1).

-record(wedding_ringCfg, {
        %%: 婚戒等级
        ring_level,

        %%: 升级到该等级婚戒所需经验
        exp,

        %%: 婚戒图标
        icon,

        %%: 该等级获得夫妻光环特效
        vfx,

        ring_buff,

        %%: 夫妻一同战斗的经验加成千分比。需要注明该比率与经验药水之类的效果之间是加算还是乘算（千分比）
        extra_exp,

        ring_buff_explain,

        %%: 夫妻一同战斗的经验加成千分比。需要注明该比率与经验药水之类的效果之间是加算还是乘算（千分比）
        extra_exp_explain

 }).

-endif.