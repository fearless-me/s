%%: 声明
-ifndef(cfg_wing).
-define(cfg_wing, 1).

-record(wingCfg, {
        %%: 翅膀ID，不可重复
        iD,

        %%: 翅膀所用模型
        %%: 区别种族，数组格式（分别调用Client\Assets\Resources\Prefab\role\wing下翅膀模型）
        %%: [人族翅膀模型id，精灵翅膀模型id，魔族翅膀模型id]
        model,

        %%: 翅膀界面对应图标
        %%: 区别种族，数组格式：[人族翅膀图标id，精灵翅膀图标id,魔族翅膀图标id],id对应itemicon预设中的id，没有填0
        icon,

        %%: 翅膀等级
        level,

        %%: 翅膀当前等级升级到下一等级所需经验（进度条）
        %%: 最高等级经验配置-1
        exp,

        %%: 升级消耗道具ID
        %%: 格式[道具id1,...]
        use_itemID,

        %%: 翅膀当前等级所加的属性值（升级后直接读取下一阶段加成值进行替换，不会与升级前属性累加）
        %%: 格式 {PropID,Value,Method} ；
        %%: 对应{属性id,值，加法值\乘法值}
        %%: 属性id读取battlePropInfo表；
        %%: 0为加法，1为乘法
        property,

        %%: 界面战阶阶段
        %%: 用于阶数处显示以及客户端代码阶段等级相关调用（只能配置阿拉伯数字）
        shownumber,

        %%: 界面翅膀模型缩放比例
        %%: 区别种族，数组格式，[人族翅膀模型缩放，精灵翅膀模型缩放,魔族翅膀模型缩放]，100为100%
        multiple,

        %%: 废弃字段
        %%: 重生:当角色死亡时调用的BUFF ID 组
        %%: [BUFF1，BUFF2]
        %%: 但重生回血不在此处理
        buff,

        %%: 废弃字段
        %%: 重生CD
        %%: 单位：秒
        wing_regeneratio_CD,

        %%: 废弃字段
        %%: 翅膀回血特殊处理
        %%: 回血效果ID组
        %%: 对应globalsetup内wing_regeneratio
        wing_regeneratio,

        %%: 废弃字段，默认配0，每次升级消耗金币,优先使用绑定金币
        cast_money,

        %%: 废弃字段
        %%: 翅膀附带技能ID
        %%: 仅作为客户端显示用
        wing_skillID

 }).

-endif.