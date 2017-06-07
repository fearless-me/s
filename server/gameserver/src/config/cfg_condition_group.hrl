%%: 声明
-ifndef(cfg_condition_group).
-define(cfg_condition_group, 1).

-record(condition_groupCfg, {
        %%: 刘渊：
        %%: 条件组id，不允许重复，id编号可修改
        id,

        %%: 刘渊:（新增定义后，补充即可）
        %%: 条件组类型（条件组内或间各条件的关系）
        %%: 1//CONDATION_TYPE_AND,1                                            组内与关系，所有条件全部满足时校验通过，返回成功；不满足任一中断检测，并返回失败
        %%: 2//CONDATION_TYPE_OR                                                 组内或关系，所有条件全部满足时校验通过，返回成功；全部不满足中断检测，并返回失败
        %%: 3//CONDATION_TYPE_GROUP_OR                                     组间或关系，调用condition_group中的id字段，检测方式同类型2
        %%: 4//CONDATION_TYPE_AND_CHECK_ALL_IGNORE_FAIL         组间与关系，所有条件全部满足时校验通过，返回成功；全部不满足中断检测，并返回失败
        type,

        %%: 刘渊:
        %%: 条件id或者条件组id。只有在condation_type_group_or类型时才可以配置条件组id列表
        conditionIDList

 }).

-endif.