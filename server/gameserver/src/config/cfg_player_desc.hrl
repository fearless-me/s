%%: 声明
-ifndef(cfg_player_desc).
-define(cfg_player_desc, 1).

-record(player_descCfg, {
        %%: by姜泓妃
        %%: 职业ID
        %%: 百位数：基础职业 1战士 2法师 3刺客
        %%: 十位数：职阶 0 0转 1 1转
        %%: 个位数：职业编号
        %%: 举例：
        %%: 201:基础职业是法师的0转职业 其实就是法师
        id,

        %%: 职业标准名称
        %%: 1战士 2游侠 3魔法师
        %%: 11斗士 12卫士 13巡逻兵 14弓弩手 15巫师 16修士
        %%: 21剑士 22重甲兵 23刺客 24狙击手 25术士 26牧师
        name,

        %%: 职业描述文字
        desc_human,

        desc_spirit,

        %%: 第一个 生存
        %%: 第二个 输出
        %%: 第三个 灵巧
        show_para,

        %%: by姜泓妃
        %%: 1重剑 2轻剑 3剑盾
        %%: 4双持刺 5弓箭
        %%: 6法杖 7权杖
        %%: 一个职业只能有一类武器
        weapon,

        %%: 转职对战力的限定
        zhanli_limit,

        %%: 转职对等级的限制
        level_limit,

        %%: 转职判断时的任务检测：正在进行的任务有XXX时，允许转职。
        %%: 可不填
        task_need,

        %%: 职业卡牌图片
        %%: 走texture\ui
        career_card,

        %%: 转职消耗的多个道具和数量，可不填
        item_cost,

        %%: by姜泓妃
        %%: 转职成功后给的礼包，填多个道具和数量，可不填。
        gift,

        %%: 展示翅膀的等级
        %%: 调用第几阶的翅膀模型，调用wing表
        wingLevel,

        %%: 模型：武器，衣服
        %%: 装备的ID要>30000
        showEquips,

        %%: 填写basic_head表中的ID
        showHead,

        %%: 作者:
        %%: 初始化的武器
        base_weapon,

        %%: 作者:
        %%: 初始化的副手
        base_offhand,

        %%: Windows 用户:
        %%: 读取basic_head表中ID
        base_head,

        %%: 作者:
        %%: 创建时的武器特效
        vfx_1,

        %%: 作者:
        %%: 创建时的副手特效
        vfx_2,

        %%: 作者:
        %%: 创建时的衣服特效
        vfx_3,

        %%: 移动速度
        moveSpeed,

        %%: 角色的体力值上线
        stamina,

        %%: 出生时的装备
        %%: 主手武器，衣服 
        %%: 装备的ID要>30000
        equip,

        comboSkillID,

        %%: 出生时的技能
        baseSkill,

        %%: 天生获得的隐藏被动触发技能
        bornSkill,

        %%: 角色屏蔽：1：打开。0：关闭
        player_switch,

        %%: 唐斯然:
        %%: 角色主属性
        prime_attribute,

        %%: 唐斯然:
        %%: 角色主属性
        prime_energy,

        %%: 唐斯然:
        %%: 角色主属性
        prime_energy_restore

 }).

-endif.