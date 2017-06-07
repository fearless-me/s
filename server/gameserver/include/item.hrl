-ifndef(Item_hrl).
-define(Item_hrl, 1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%物品类型相关定义%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%道具类型
-define(ItemTypeNormal, 1).                            %%普通
-define(ItemTypeDrug, 2).                            %%药品
-define(ItemTypeMaterial, 3).                        %%材料
-define(ItemTypeGem, 4).                                %%宝石
-define(ItemTypeTask, 5).                            %%任务道具
-define(ItemTypeFashion, 6).                            %%时装
-define(ItemTypeMount, 7).                            %%坐骑
-define(ItemTypePackge, 8).                            %%道具包
-define(ItemTypeFunction, 9).                        %%功能道具
-define(ItemTypeFood, 10).                            %%食品
-define(ItemTypePetEgg, 11).                         %%宠物蛋
-define(ItemTypeDiamondCard, 12).                    %%钻石卡
-define(ItemTypeUpPower, 13).                        %%能力提升
-define(ItemTypeTreasureMap, 14).                    %%藏宝图
-define(ItemTypeTitle, 15).                            %%称号卷轴
-define(ItemTypeMonthCard, 16).                        %%月卡
-define(ItemTypeGuildRename, 17).                    %%军团更名
-define(ItemTypeCallMonster, 18).                    %%召唤怪物
-define(ItemTypeUseItemForTarget, 19).            %%对目标使用
-define(ItemTypeLotteryMoney, 20).                %%抽奖获取奖池金额的道具
-define(ItemTypeChangeName, 21).                    %%角色改名道具
-define(ItemTypeWingMaterial, 22).                   %%翅膀升级消耗的材料
-define(ItemTypeGrowUpReward, 23).                   %%成长礼包
-define(ItemTypePlayerRune, 24).                     %%玩家符文
-define(ItemTypePlayerPetRune, 25).                  %%宠物符文
-define(ItemTypePlayerPetSkillBook, 26).             %%宠物技能书
-define(ItemTypeRingLevelup, 27).                    %%***
-define(ItemTypePieces, 28).                         %%碎片

-define(Item_Use_Unkown, 1).        %% 什么都不做
-define(Item_Use_Buffer, 2).        %% 给增加一个Buffer，Param1:BufferID
-define(Item_Use_HPMP, 3).        %% 立即恢复HPMP，Param1:1:HP 2:能量 3:HP&能量; Param2:Value; Param3:percent,P4:优先级，优先吃大药
-define(Item_Use_Skill, 4).        %% 使用一个技能，Param1:SkillID
-define(Item_Use_PetEgg, 5).        %% 获得宠物，Param1:PetID
-define(Item_Use_GetBindedGold, 6).    %% 获得绑定元宝,Param1:钱数量(1-20亿)
-define(Item_Use_OpenGift, 7).        %% 开装备礼包，Param1:EquipDropID
-define(Item_Use_LiBao, 8).        %% 开道具礼包，Param1:DropID
-define(Item_Use_GetTask, 9).        %% 获得任务，?Param1:任务ID
-define(Item_Use_AddExploit, 10).    %% 增加功勋值(竞技场天梯)
-define(Item_Use_GetEXP, 11).    %% 获得经验，Param1:经验数量
-define(Item_Use_AddExpByLevel, 12).    %% 根据等级给经验，Param1：10000一倍经验，20000 2倍经验
-define(Item_Use_MultiExp, 13).    %% 使用后增加多倍经验，param1:持续时间，单位为s
-define(Item_Use_PetMount, 14).    %% 获得骑宠
-define(Item_Use_AddOneLevel, 15).    %% 使用道具后等级加1
-define(Item_Use_CallMonster, 16).    %% 召唤怪物道具
-define(Item_Use_AddFashionCloths, 17).    %% 使用后点亮该时装或延长有效时长
-define(Item_Use_AddVipReputation, 18).    %% 使用后获得爵位声望
-define(Item_Use_FindTreasure, 19).    %% 藏宝图道具，使用后知道宝藏地点
-define(Item_Use_RandTitle, 20).    %% 称号道具，使用“称号词组卷轴”随机获得一个当前未获得的一个词组
-define(Item_Use_MonthCard, 21).    %% 月卡道具,使用后增加30天（绝对值）月卡服务
-define(Item_Use_SpecTitle, 22).    %% 称号道具，使用“称号效果卷轴”获得对应特定编号的效果或者词组
-define(Item_Use_AddCopyMapDropOdd, 23).    %% 增加副本掉落几率道具
-define(Item_Use_DarknessTransfer, 24).    %% 黑暗之地传送道具
-define(Item_Use_ClearKv, 25).    %% 清理杀戮值
-define(Item_Use_ChangeName, 26).    %% 改名卡事件
-define(Item_Use_GuildContribute, 27).    %% 使用后获得军团贡献点，有军团才能使用
-define(Item_Use_WingRise, 28).    %% 使用可获得翅膀经验值（useParam1最小经验值，useParam2最大经验值）
-define(Item_Use_OpenAllFun, 29).    %% 使用后打开所有功能
-define(Item_Use_GrowUp, 30).    %% 使用可打开成长礼包
-define(Item_Use_PetSkillBook, 31).    %% 宠物技能书，参数1是技能id 参数2为技能等级（0为等级随机）
-define(Item_Use_PlayerBQ, 32).    %% 使用获得表情
-define(Item_Use_PlayerDZ, 33).    %% 使用获得动作

%道具品质
-define(ItemQulityNomal, 1).                                %普通
-define(ItemQulityOutStanding, 2).                        %优秀
-define(ItemQulityWell, 3).                                %精良
-define(ItemQulityEpic, 4).                                %史诗
-define(ItemQulityLegend, 5).                            %传奇
-define(ItemQulityMyths, 6).                                %神话


%%位置信息
-define(Item_Location_Start, 1).
-define(Item_Location_Bag, 1).              %%普通背包
-define(Item_Location_Storage, 2).          %%普通仓库
-define(Item_Location_Equip_Bag, 3).        %%装备背包
-define(Item_Location_Equip_Storage, 4).    %%装备仓库
-define(Item_Location_Recycle, 5).          %%回收站
-define(Item_Location_BodyEquipBag, 6).     %%玩家身上的装备背包
-define(Item_Location_Gem_Bag, 7).            %%宝石背包
-define(Item_Location_Gem_Storage, 8).        %%宝石仓库
-define(Item_Location_GemEmbedBag, 9).      %%宝石镶嵌背包
-define(Item_Location_Pieces_Bag, 10).            %%碎片背包
-define(Item_Location_Pieces_Storage, 11).        %%碎片仓库
-define(Item_Location_Max, 11).                %%背包最大类型

-type bagType() :: 1 .. 11.

-define(Item_Location_AllList, [
	?Item_Location_Bag,
	?Item_Location_Storage,
	?Item_Location_Equip_Bag,
	?Item_Location_Equip_Storage,
	?Item_Location_Recycle,
	?Item_Location_BodyEquipBag,
	?Item_Location_Gem_Bag,
	?Item_Location_Gem_Storage,
	?Item_Location_GemEmbedBag,
	?Item_Location_Pieces_Bag,
	?Item_Location_Pieces_Storage
]).         %%所有的背包类型列表

%%普通背包大小
-define(BagMaxSlot, 60).
%%背包默认开启格子数量
-define(BagDefaultOpenSlotNum, 40).

%%装备背包大小
-define(EquipBagMaxSlot, 60).
%%装备背包默认开启格子数量
-define(EquipBagDefaultOpenSlotNum, 40).

%%普通仓库大小
-define(StorageMaxSlot, 60).
%%普通仓库默认开启格子数量
-define(StorageDefaultOpenSlotNum, 40).

%%装备仓库大小
-define(EquipStorageMaxSlot, 60).
%%普通仓库默认开启格子数量H
-define(EquipStorageDefaultOpenSlotNum, 40).

%%回收站大小
-define(RecycleBagMaxSlot, 10).

%%玩家身上装备背包最大格子数
-define(BodyEquipBagMaxSlot, 8).
%%玩家身上装备背包默认打开的格子数
-define(BodyEquipBagDefaultOpenSlotNum, 8).

%%宝石背包大小
-define(GemBagMaxSlot, 60).
%%宝石背包默认打开格子数量
-define(GemBagDefaultSlotNum, 40).
%%宝石仓库大小
-define(GemStorageMaxSlot, 60).
%%宝石仓库默认打开格子数量
-define(GemStorageDefaultSlotNum, 40).

%%玩家宝石镶嵌背包默认格子数
-define(GemEmbedDefaultOpenSlotNum, 32).


%%碎片背包大小
-define(PiecesBagMaxSlot, 60).
%%碎片背包默认打开格子数量
-define(PiecesBagDefaultSlotNum, 40).
%%碎片仓库大小
-define(PiecesStorageMaxSlot, 60).
%%碎片仓库默认打开格子数量
-define(PiecesStorageDefaultSlotNum, 40).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%物品操作相关定义
%% 普通道具操作定义
-define(Item_Operate_NotDelete, 1).        % 不可丢弃
-define(Item_Operate_NotUse, 2).        % 不可使用
-define(Item_Operate_NotStore, 4).        % 不可放入仓库
-define(Item_Operate_NotTrade, 8).        % 不可进入交易行
-define(Item_Operate_NotSplit, 16).        % 不可拆分

%%删除物品类型
-define(Delete_Binded_Item, 0).   %%删除绑定物品
-define(Delete_UnBinded_Item, 1). %%删除非绑定物品
-define(Delete_All_Item, 2).      %%删除所有物品

%%装备属性类型
-define(EquipPropTypeBase, 1).         %%装备基础属性
-define(EquipPropTypeExtNoRecast, 2).  %%装备附加属性未重铸
-define(EquipPropTypeExtNeverRecast, 3).%%装备附加属性不可以重铸
-define(EquipPropTypeExtAlreadyRecast, 4).%%装备已重铸

%%物品掉落类型
-define(Drop_Type_Goods, 0).                %%物品掉落
-define(Drop_Type_PackageItem, 1).        %%掉落包道具掉落
-define(Drop_Type_Coin, 2).
-define(Drop_Type_Rune, 3).

-define(Drop_EquipSource_ByPackage, 1).        %%掉落包装备掉落
-define(Drop_Equip_Source_ByMonster, 2).    %%杀怪装备掉落
-define(Drop_Equip_Source_ByMap, 3).        %%地图装备掉落
-define(Drop_Equip_Source_Other, 4).        %%其它装备掉落

%%使用道具
-define(Item_Use_EquipPackage, 7).    %%开装备包裹
-define(Item_Use_ItemPackage, 8).    %%开道具包裹

%%装备属性计算方式加法或乘法
-define(PropCalcType_Add, 0).  %%加法
-define(PropCalcType_Mul, 1).  %%乘法



-record(itemForAdd, {
	itemID = 0,            %%物品id
	count = 0,            %%物品增加数量
	binded = 1            %%是否绑定,0非绑，1绑定
}).

-record(recSpawnUseItem, {
	id = 0,                                %%使用物品的ID
	x = 0.0,                            %%使用物品的位置X
	y = 0.0,                            %%使用物品的位置Y
	rotW = 0.0,                         %%旋转信息
	groupID = 0     %% 分组ID
}).

-record(recToTargetUseBuffItem, {
	buffID = 0,
	buffID2 = 0,
	level = 0
}).

-record(recToTargetCallCarrier, {
	num = 0,                            %%召唤数量
	arg = {},
	arg1 = {}
}).

-record(recDrop,
{
	id = 0,
	num = 0,
	time = 0
}).

-endif.
