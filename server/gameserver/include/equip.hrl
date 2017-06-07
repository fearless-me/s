-ifndef(Equip_hrl).
-define(Equip_hrl,1).
-include("cfg_equipAffixes.hrl").
-include("gsInc.hrl").
-include("cfg_equipAffixes.hrl").
-include("cfg_equipIntensify.hrl").
-include("cfg_globalsetup.hrl").
-include("cfg_uniqTierProperty.hrl").
-include("cfg_honor.hrl").
-include("cfg_tierBonus.hrl").
-include("cfg_equipment.hrl").
-include("cfg_eq_charge.hrl").
-include("cfg_di_mixcost.hrl").
-include("cfg_sourceshop.hrl").

%%装备操作
-define(EquipOn, 1). %%穿装备
-define(EquipOff, 2). %%卸装备

%%装备更新操作
-define(EquipEnhance, 1).%%装备强化
-define(EquipRecast, 2). %%装备重铸

%%装备类型定义
-define(EquipTypeNormal, 0).  %%普通装备
-define(EquipTypeSpecial, 1). %%独特装备
-define(EquipTypeSuit, 2).    %%套装装备
-define(EquipTypeSpecial1,3). %%紫色装备
%%掉落装备指定类型
-define(EquipDropRandom, 1).	%%随机装备
-define(EquipDropSpecify, 2).	%%指定装备

%%掉落类型
-define(EquipDropNormal,1).		%%普通掉落
-define(EquipDropPackage,2).	%%礼包掉落

%%装备颜色品质分类定义
-define(EquipColorTypeMin, 0).    %%

-define(EquipColorTypeInvalid, -1).%%无效
-define(EquipColorTypeWhite, 0).  %%白色装备
-define(EquipColorTypeGreen, 1).  %%绿色装备
-define(EquipColorTypeBlue, 2).   %%蓝色装备
-define(EquipColorTypeRed, 3).    %%红色装备
-define(EquipColorTypePurple, 4). %%紫色装备
-define(EquipColorTypeOrange, 5). %%橙色装备

-define(EquipColorTypeMax, 5).    %%

-type equipQuality() :: -1 .. 5.

%%装备品质加成系数
-define(EquipQualityRatioWhite, whiteFactor).   %% 白色 0
-define(EquipQualityRatioGreen, greenFactor).   %% 绿色
-define(EquipQualityRatioBlue, blueFactor).     %% 蓝色
-define(EquipQualityRatioPurple, purpleFactor). %% 紫色
-define(EquipQualityRatioOrange, orangeFactor). %% 橙色   特殊装备
-define(EquipQualityRatioRed, redFactor).       %% 红色 定制套装
-define(EquipConfigInvalid, 0).                 %% 无效配置 
-define(EquipEnhancedRatio, intensifyFactor).   %% 装备强化系数

-define(EquipDefensiveBonusID, 62).				%%防御加成ID
-define(EquipDefenList,[25,26,27,28,60]).		%%需要加成的防御ID列表

%%附加词缀前后定义
-define(EquipAffixFront, 0).
-define(EquipAffixAfter, 1).
-define(SpeEquipAffixFront, 2).
-define(SpeEquipAffixAfter, 3).
-define(UniEquipAffixFront, 4).
-define(UniEquipAffixAfter,5).

%装备类型（位置）
-define(EquipTypeStart,0).
-define(EquipTypeWeapon,0).								%%武器
-define(EquipTypeHelmet,1).							    %%头盔
-define(EquipTypeEarrings,2).							%%耳环
-define(EquipTypeArmor,3).								%%胸甲
-define(EquipTypeNecklace,4).							%%项链
-define(EquipTypeTrousers,5).							%%裤子
-define(EquipTypeRing,6).								%%戒指
-define(EquipTypeBoots,7).								%%靴子

-define(EquipTypeMax,7).								%%装备最大分类值

-type equipPosType() :: 0 .. 7.

%%装备类型对周围玩家可见
-define(EquipTypeVisibleOfOtherPlayer,[
	?EquipTypeWeapon,
	?EquipTypeHelmet,
	?EquipTypeEarrings,
	?EquipTypeArmor,
	?EquipTypeBoots
]).
%%可见装备广播类型
-define(EquipVisibleOn, 1).  							%%穿上可见装备广播
-define(EquipVisibleOff, 2).							%%卸下可见装备广播


%%7 权杖
%%装备子类型，目前只针对武器和副手，其它的没子类型
-define(EquipSubTypeNon,0).								%%0 无子类型
-define(EquipSubTypeEpee,1).                            %%1 重剑
-define(EquipSubTypeSword,2).                           %%2 轻剑
-define(EquipSubTypeSwordShield,3).                     %%3 剑盾
-define(EquipSubTypeStab,4).                            %%4 双手刺
-define(EquipSubTypeBow,5).                             %%5 弓箭
-define(EquipSubTypeRod,6).                             %%6 法杖
-define(EquipSubTypeMace,7).                            %%7 权杖

-define(EquipSubTypeSpine,8).                           %%8 短刺
-define(EquipSubTypeMechanic,9).						%%9 枪械
-define(EquipSubTypeFrag,10).							%%10 手雷
-define(EquipSubMax, 10).

-define(MajorWeapon, [
	?EquipSubTypeEpee,
	?EquipSubTypeSword,
	?EquipSubTypeSwordShield,
	?EquipSubTypeStab,
	?EquipSubTypeBow,
	?EquipSubTypeRod,
	?EquipSubTypeMace
]).              				%%主武器


%%装备颜色分类配置表里的settype
-define(EquipAffixGreenRow, greenAffix).     %%绿色词缀组合
-define(EquipAffixBlueRow, blueAffix).       %%蓝色词缀组合
-define(EquipAffixPurpleRow, purpleAffix).   %%紫色词缀组合
-define(EquipAffixOraRed1Row, oraRed1Affix). %%橙色红色词缀组合
-define(EquipAffixOraRed2Row, oraRed2Affix). %%橙色红色词缀组合
-define(EquipAffixOraRed3Row, oraRed3Affix). %%橙色红色词缀组合
-define(EquipAffixOraRed4Row, oraRed4Affix). %%橙色红色词缀组合
-define(EquipAffixOraRed5Row, oraRed5Affix). %%橙色红色词缀组合
-define(EquipAffixOraRed6Row, oraRed6Affix). %%橙色红色词缀组合

%%宝石颜色
-define(GemColorTypeRed, 9).    %红宝石
-define(GemColorTypeGreen, 10). %绿宝石
-define(GemColorTypeBlue, 11).  %蓝宝石
-define(GemColorTypePurple, 12).%紫宝石

%%套装定制组合配置行号列表
-define(EquipAffixOraRedAllRow,
		[?EquipAffixOraRed1Row, 
		 ?EquipAffixOraRed2Row,
		 ?EquipAffixOraRed3Row,
		 ?EquipAffixOraRed4Row,
		 ?EquipAffixOraRed5Row,
		 ?EquipAffixOraRed6Row]).  
-define(EquipAffixOraRedRatio, 50).  %%套装定制几率
-define(EquipAffixMaxCount, 6).      %%特殊装备和套装属性的最大个数

%%精炼套装属性操作
-define(AddEquipProp,		0).  %%增加属性
-define(DelEquipProp,		1).  %%删除属性

%%生成装备时附加属性前缀后缀组合
-record(recAffixSplit,{
					   frontNum = 0,   %%前缀个数
					   afterNum = 0,   %%后缀个数
					   ratio = 0       %%出现几率
					   }).

%%宝石镶嵌部位记录
-record(recGemEmbed,{
					 position = 0,   %%宝石镶嵌部位编号1——8
					 slot = 0,       %%部位槽的编号1——3
					 bind = true,	 %%默认绑定
					 gemUID = 0, 	 %%宝石UID
					 gemID = 0   	 %%宝石ID
					 }).

-record(recEquipStar,{
					 pos  = 0,		%%部位
					 bless = 0,		%%装备升星祝福值
					 prog = 0,		%%装备升星进度
					 star = 0		%%装备升星等级						
}).


-define(RecastTypeCommon, 1).
-define(RecastTypeAdvance, 2).

-define(RecastOPTypeCast, 1).
-define(RecastOPTypeSave, 2).

-record(recRecastProp,{
	prop_pos = 0,
	prop_id = 0,
	prop_val = 0,
	prop_max = 0
}).

-record(recEquipRecast,{
	equip_pos = 0,
	recast_val = 0,
	props = [], %% [#recRecastProp]
	props_ext = [] %% [#recRecastProp]
}).

-endif.