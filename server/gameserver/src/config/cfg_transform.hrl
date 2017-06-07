%%: 声明
-ifndef(cfg_transform).
-define(cfg_transform, 1).

-record(transformCfg, {
        %%: 卡片的ID
        %%: 不同的ID代表不同的卡片
        cardID,

        %%: 卡片的等级
        level,

        %%: 激活女神的主线任务
        %%: id
        task_open,

        %%: Administrator:
        %%: 女神模型id
        model,

        %%: 职业：
        %%: 101,战士系，包括转职职业
        %%: 201,法师系，包括转职职业
        %%: 303,刺客系，包括转职职业
        %%: 401,魔女系，包括转职职业
        class,

        %%: 女神升级消耗的神力值（原活跃度）
        %%: [无意义,神力值]
        fragment,

        %%: user:
        %%: 主线任务激活id
        %%: 根据任务数量平均分配100进度
        %%: [起始任务，结束任务]
        activeTaskList,

        %%: user:
        %%: 主动技能
        activeSkills,

        %%: user:
        %%: 被动技能
        passiveSkills,

        %%: user:
        %%: 激活的形态阶数
        stateMax,

        %%: 突破时，消耗金币的数量
        money,

        %%: 属性
        %%: {属性ID，值，加法值或乘法值}
        %%: 纯显示
        %%: 加法值为0，乘法值位1
        %%: 0 直接取整
        %%: 1 小数点后3位，百分比
        property,

        %%: 卡片的名字，用于客户端显示
        name,

        %%: 图标名字
        icon,

        %%: 卡片分数
        %%: 关联变身后的造型
        cardPoint,

        %%: 卡片描述
        des1,

        %%: 对于卡牌功效的文字描述
        des2,

        %%: 女神表现用特效数组：
        %%: {女神BUFF特效，女神闪光特效，女神小精灵特效}
        playerTX

 }).

-endif.