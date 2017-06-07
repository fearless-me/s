%%: 声明
-ifndef(cfg_petEquipment).
-define(cfg_petEquipment, 1).

-record(petEquipmentCfg, {
        %%: 骑宠装备ID
        id,

        %%: 对应道具ICON
        icon,

        %%: 装备名称
        name,

        %%: 部位，从0开始
        parts,

        %%: 品质
        %%: 0:白色
        %%: 1：绿色
        %%: 2：蓝色
        %%: 3：紫色
        %%: 4：橙色
        quality,

        %%: 进阶成下一阶的ID  0为空，无法再次进阶    
        advanced,

        %%: 属性ID，系数a，系数b
        baseProperty,

        %%: 装备描述
        info

 }).

-endif.