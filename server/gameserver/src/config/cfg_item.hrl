%%: 声明
-ifndef(cfg_item).
-define(cfg_item, 1).

-record(itemCfg, {
        %%: ID<30000
        %%: id=1~100为虚拟道具（例如：经验等只起展示用的道具）
        %%: id=101~200为药水道具
        %%: id=1800~2000为骑宠相关道具（骑宠/骑宠碎片）
        %%: id=2001~2200为骑宠相关材料道具
        %%: id=5000-5999为徽章材料
        %%: id=9000-10000为打造材料
        %%: id=20000~29999为运营活动相关道具
        id,

        %%: 物品名字
        name,

        %%: 物品描述
        desc,

        %%: 产出途径，策划标记用
        %%: 游戏上线后，无用的废弃道具配置“废弃”并单元格标灰
        product,

        %%: icon id
        iconPath,

        %%: 叠加上限
        maxAmount,

        %%: 道具品质：
        %%: 0, 普通 白色
        %%: 1, 优秀 绿色
        %%: 2, 精良 蓝色
        %%: 3, 史诗 红色
        %%: 4, 传说 紫色
        %%: 5, 神话 橙色（后续版本预留）
        quality,

        %%: %%道具类型
        %%: -define(ItemTypeNormal,1).       %%普通
        %%: -define(ItemTypeDrug,2).       %%药品
        %%: -define(ItemTypeMaterial,3).      %%装备材料
        %%: -define(ItemTypeGem,4).        %%宝石1红2蓝3紫4绿  useParam3代表宝石等级 useParam2 代表该宝石合成后ID
        %%: -define(ItemTypeTask,5).       %%任务道具
        %%: -define(ItemTypeFashion,6).       %%时装
        %%: -define(ItemTypeMount,7).       %%坐骑外观
        %%: -define(ItemTypePackge,8).       %%道具包
        %%: -define(ItemTypeFunction,9).      %%功能消耗道具
        %%: -define(ItemTypeFood,10).       %%食品
        %%: -define(ItemTypePetEgg,11).       %%宠物消耗
        %%: -define(ItemTypeDiamondCard,12).       %%钻石卡
        %%: 13.能力提升卷轴
        %%: 14.藏宝图
        %%: 15 称号卷轴
        %%: 16月卡
        %%: 17.军团更名道具
        %%: 18召唤怪物类型
        %%: 19对目标使用类型  Param2必须为目标类型1自己2目标3目标和自己
        %%: 20占卜金币奖金、钻石奖金。Param1 金币总类 1金币 2钻石 Param2 百分比 填小数
        %%: 21角色改名道具
        %%: 22翅膀升级消耗的材料
        %%: 23成长礼包
        %%: 24 角色符文
        %%: 25 骑宠符文
        %%: 26 宠物技能书
        %%: 27 戒指升级道具
        itemType,

        %%: 子类型。归属于主类型。itemType
        detailedType,

        %%: 是否任务物品，是：1，不是：0
        isQuestItem,

        %%:  Item_Use_Unkown     = 1,// 什么都不做
        %%:  Item_Use_Buffer     = 2,// 给目标增加一个Buffer，Param1:BufferID param2=1对自己使用 =2对目标使用(itemtype=19) =3同时对自己和目标使用(itemtype=19) param4=buf2id
        %%:  Item_Use_HPMP     = 3,// 立即恢复HPMP，Param1:1:HP 2:能量 3:HP&能量 4:按百分比回生命; Param2:Value; Param3:percent,P4:优先级，优先吃大药
        %%:  Item_Use_Skill     = 4,// 使用一个技能，Param1:SkillID
        %%:  Item_Use_PetEgg     = 5,// 暂时无用，Param1:PetID
        %%:  Item_Use_GetBindedGold    =6, //获得 货币，需要填类型 参数1类型，参数2量
        %%:  Item_Use_OpenGift    = 7,// 开装备礼包，Param1:EquipDropID,Param2:礼包等级
        %%:  Item_Use_LiBao     = 8,//   开道具礼包，Param1:DropID
        %%:  Item_Use_GetTask    = 9,//   获得任务，?Param1:任务ID
        %%: Item_Use_AddExploit   = 10//  JJC功勋 Param1:具体的值
        %%:  Item_Use_GetEXP     = 11,//   获得经验，Param1:经验数量
        %%:  Item_Use_AddExpByLevel     =12, //根据等级给经验，Param1：10000一倍经验，20000 2倍经验
        %%:  Item_Use_MultyExp =13,//使用后增加多倍经验，param1:获得经验倍率 paraml2：持续时间，单位为s 
        %%:  Item_Use_MountSkin    = 14,//   获得骑宠，Param1:骑宠ID（pet表），Param2:重复骑宠进入背包后转化为碎片id，Param3:碎片数量
        %%: 15,// 使用道具等级+1 
        %%: 16//道具召唤怪物 Param1 monstergroupID Param2=1自己2目标3目标和自己 Param3怪物生命周期，到期后自动消失单位毫秒 
        %%: 17//获得时装外观，paraml：时装ID,param2：时装拥有时间 单位为s，51840000为永久
        %%: 18 获得爵位声望值
        %%: 19 藏宝图道具
        %%: 20 A用于随机词组称号 在称号表去随机1-799的称号词组
        %%: 21 月卡道具  月卡道具由道具开启服务 param1 代表时间
        %%: 22 A用于固定称号词组和固定称号特效 param1 代表称号表的ID
        %%: 23 掉宝率 掉落率（用于副本掉宝率）
        %%: 24 黑暗之地内传送卷轴
        %%: 25.降低杀戮值 Param1=杀戮值 若=0代表清除所有杀戮值
        %%: 26.角色改名
        %%: 27.军团物资 Param1=物资数量
        %%: 28.翅膀升级材料 Param1=翅膀获取经验最小值 Param2=翅膀获取经验最大值
        %%: 29.全能钥匙
        %%: 30.成长用礼包
        %%: 31.宠物技能书，参数1是技能id 参数2为技能等级（0为等级随机）
        %%: 32.使用获得表情 useparam1为表情ID
        %%: 33.使用获得动作 useparam1为动作ID
        %%: -define(CoinTypeGold,    1).  %% 金币
        %%: -define(CoinTypeBindGold,   2).  %% 绑定金币
        %%: -define(CoinTypePrestige,   4).  %% 声望
        %%: -define(CoinTypeHonor,    5).  %% 荣誉值
        %%: -define(CoinTypeBindDiamond,    6).  %% 绑定钻石
        %%: -define(CoinTypePurpleEssence,  7).  %% 紫色精华,熔炼一般装备获得,用于在资源兑换界面兑换稀有道具
        %%: -define(CoinTypeGoldenEssence,  8).   %% 金色精华,熔炼高级装备获得,用于在资源兑换界面兑换稀有道具
        %%: -define(CoinTypeHolyWater,  9).  %% 圣水（宠物装备强化使用）
        %%: -define(CoinTypeScore,   10). %% 积分（只用于商城）
        %%: -define(CoinTypeCrystal,   11). %% 黑暗硬币（只用于黑暗之地）
        useType,

        %%: 作者:
        %%: 物品使用参数1，没有填0
        useParam1,

        %%: 作者:
        %%: 物品使用参数2，没有填0
        useParam2,

        %%: 作者:
        %%: 物品使用参数3，没有填0
        useParam3,

        %%: 作者:
        %%: 物品使用参数4，没有填0
        %%: 宝石用了此列来标示宝石颜色
        %%: 1.红
        %%: 2.蓝
        %%: 3.绿
        useParam4,

        %%: 作者:
        %%: 单次使用个数上限
        useMaxCount,

        %%: 作者:
        %%: 使用等级
        level,

        %%: 职业限定
        %%: 位运算累加
        %%:  0, 无限制
        %%:  1, 骑士不能用
        %%:  2, 法师不能用
        %%:  4, 刺客不能用
        %%:  8, 魔女不能用
        usePlayerClass,

        %%: 作者:
        %%: 出售单价（卖NPC）
        price,

        %%: 冷却组ID
        %%: 0 表示没CD
        cdGroup,

        %%: 物品每日使用次数限定类型ID，没有填0
        dailyCountGroup,

        %%: 有效期时间，单位秒，从获得后开始计时，0表示没有有效期
        %%: 限时道具不能上交易行
        usefulLife,

        %%: 作者:
        %%: 1记录道具使用信息
        %%: 0则不记录
        %%: 这个字段填写规则：非贵重的，叠加数量>1的，要填写0
        needSaveLog,

        %%: 作者:
        %%: 道具可执行操作
        %%: 不可丢弃:1
        %%: 不可使用：2
        %%: 不可放入仓库：4
        %%: 不可放入交易行 8
        %%: 不能拆分   16       
        %%: 这个值是该道具不可执行操作的各数值之和
        operate,

        %%: 作者:
        %%: 1.掉落提示
        %%: 0.掉落不提示
        needBrodcast,

        %%: 如果获得了此道具，是否提示玩家背包有新道具。
        %%: 1 提示
        %%: 0 不提示
        needwar,

        %%: 掉出来的宝珠造型id
        %%: 0 不用
        %%: 22，特效vfx_26_22，橙色
        %%: 23，特效vfx_26_23，红色
        %%: 24，特效vfx_26_24，黄色
        %%: 25，特效vfx_26_25，紫色
        %%: 26，特效vfx_26_26，蓝色
        %%: 27，特效vfx_26_27，绿色
        %%: 32，特效vfx_26_32，金币
        baozhu,

        %%: user:
        %%: 显示一个或多个掉落物
        %%: 1，多个 ，读取drop里的数量
        %%: 0,1个
        baozhunumber,

        %%: user:
        %%: 掉落物音效
        baozhusound,

        %%: 使用后跳转的页面
        %%: 0 不跳
        %%: 1 坐骑
        %%: 2 宝石
        %%: 3 变身
        %%: 4 强化石
        %%: 5 藏宝图
        %%: 6 神器
        %%: 7 军团更名
        %%: 8 冲星石
        %%: 9 装备重铸
        %%: 10 翅膀
        %%: 11 技能
        %%: 12 符文
        %%: 13 符文打造
        %%: 14 装备兑换
        %%: 15 资源兑换
        %%: 16 宠物碎片兑换
        %%: 17 姻缘界面
        %%: 18 时装
        useJumpPage,

        %%: 使用道具时，播放的声音名称，仅适于可使用道具
        usesound,

        %%: 使用道具后的提示文字内容（客户端绿色提示字体表现），仅适于可使用道具
        %%: 配空则不提示任何文字
        txt,

        %%: 获得道具进入背包后是否直接使用（仅适用于可使用道具类型）
        %%: 0 不直接使用
        %%: 1 直接使用
        useStraightway,

        %%: 道具出售时是否需要二次确认（确认框）
        %%: 0：不需要
        %%: 1：需要
        %%: 红色以上品质的道具都需求二次确认，低品质道具视情况而定
        selljudge,

        %%: 作者:
        %%: 配置道具不足时，是否弹出获取途径指向
        %%: 0 代表不弹出
        %%: [{20,0}]代表有1个跳转途径，值1代表跳转到的界面ID，值2代表书签ID
        %%: 值1通过mainMenu获得
        %%: 值2有三种情况：
        %%:    当值1为商城（编号为24），则配置为0
        %%:    当值1为副本（编号为20），则可在mapsetting中查找对应地图ID
        %%:    当值1为活动（编号为22），则可在DailyInterface查找对应活动ID
        %%: 多个跳转，由逗号隔开[{20,0},{21,0}]
        relation_UI

 }).

-endif.