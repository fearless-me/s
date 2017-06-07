%%: 声明
-ifndef(cfg_rune).
-define(cfg_rune, 1).

-record(runeCfg, {
        %%: Administrator:
        %%: ID必须从100,000开始!!!!!!
        iD,

        name,

        %%: 符文大类型：
        %%: 决定角色或骑宠符文
        %%: 0角色
        %%: 1骑宠
        type,

        %%: 子类型
        %%: 0 大地
        %%: 1 海洋
        %%: 2 烈焰
        %%: 3 天空
        %%: 4 生命
        %%: 5 VIP
        subtype,

        %%: Administrator:
        %%: 品质
        quality,

        %%: 生成时品阶，和穿戴等级无关
        stage,

        %%: Administrator:
        %%: 穿戴等级
        equipLevel,

        icon,

        %%: 基础属性属性组id
        %%: 看rune_basePro
        based_property_group_id,

        %%: 随机属性属性组id
        %%: 看rune_randomPro
        random_property_group_id,

        %%: 随机属性条目最小值
        min_num,

        %%: 随机属性条目最大值
        max_num,

        %%: Administrator:
        %%: 套装属性属性组id
        property_suite_id,

        %%: 升级所需要的经验需求组
        level_up_group_id,

        %%: Administrator:
        %%: 被熔炼时，提供给其他符文的经验值
        exp_group_id,

        %%: Administrator:
        %%: 对应的smeltcost表格
        smeltcost,

        %%: Administrator:
        %%: 提示是否穿戴
        %%: 0是
        %%: 1否
        need_equipit,

        battlepower_add,

        %%: 装备有效时间
        %%: 从获得装备开始计算
        %%: 时间到了后自动消失
        %%: 时间秒
        %%: 0代表永久
        %%: 限时装备不可交易不可上交易行
        %%: 限时装备只能是绑定装备
        usefulLife,

        %%: Administrator:
        %%: 0非绑定
        %%: 1绑定 限时符文必须是绑定
        inbind,

        %%: Administrator:
        %%: 黑暗之地兑换描述
        description,

        %%: Administrator:
        %%: 符文描述
        explain,

        %%: Administrator:
        %%: 缺少资源跳转
        material_ui

 }).

-endif.