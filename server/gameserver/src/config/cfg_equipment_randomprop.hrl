%%: 声明
-ifndef(cfg_equipment_randomprop).
-define(cfg_equipment_randomprop, 1).

-record(equipment_randompropCfg, {
        %%: 随机属性库id，相同id为同一个库，每一条随机属性为库中其中一行数据
        id,

        %%: 属性id
        propid,

        %%: 该条属性被随机到的权重
        probability,

        %%: 该条属性的区间最小值
        min,

        %%: 该条属性的区间最大值
        max,

        %%: 该条属性的属性值随机的权重，先根据权重随机到具体哪个百分比区间，再在对应区间中随机取值
        %%: 【{起始百分比，结束百分比，出现权重}，{起始百分比，结束百分比，出现权重}，{起始百分比，结束百分比，出现权重}，{起始百分比，结束百分比，出现权重}】
        prop_probability

 }).

-endif.