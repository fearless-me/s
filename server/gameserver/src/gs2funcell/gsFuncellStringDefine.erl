%% coding: latin-1
%%This file is automatically generated, please do not modify the contents of this file manually!!!
-module(gsFuncellStringDefine).
%% API
-export([
		 getGoodsChangeStr/1,
		 getCoinChangeResonStr/1,
		 getCoinTypeStr/1,
		 getGoodsChangeGroupStr/1,
		 getGoodsGroupName/1,
		 getCareerStr/1,
		 getTaskNameAndGroupName/1
		]).

-include("gsInc.hrl").

getGoodsChangeStr(?ItemSourceIntenal) ->"内部初始化";
getGoodsChangeStr(?ItemSourceBag) ->"背包移动获得";
getGoodsChangeStr(?ItemSourceStorage) ->"仓库移动获得";
getGoodsChangeStr(?ItemSourceBodyEquip) ->"装备移动获得";
getGoodsChangeStr(?ItemSourceRecycle) ->"回收站移动获得";
getGoodsChangeStr(?ItemSourceMail) ->"邮件得到物品";
getGoodsChangeStr(?ItemSourceTask) ->"任务得到物品";
getGoodsChangeStr(?ItemSourceTaskCollect) ->"任务采集得到物品";
getGoodsChangeStr(?ItemSourceKillMonster) ->"杀怪得到物品";
getGoodsChangeStr(?ItemSourceShop) ->"商店购买得到物品";
getGoodsChangeStr(?ItemSourceMall) ->"商城购买得到物品";
getGoodsChangeStr(?ItemSourceOpenPackage) ->"开包裹、礼包得到物品";
getGoodsChangeStr(?ItemSourceNormalCollect) ->"普通采集得到物品";
getGoodsChangeStr(?ItemSourceGemOff) ->"宝石镶嵌拆卸得到物品";
getGoodsChangeStr(?ItemSourceGemMake) ->"宝石合成得到物品";
getGoodsChangeStr(?ItemSourceExchange) ->"资源兑换得到物品";
getGoodsChangeStr(?ItemSourceGM) ->"GM指令获得";
getGoodsChangeStr(?ItemSourceSplit) ->"道具拆分得到";
getGoodsChangeStr(?ItemSourceRollBack) ->"道具扣除失败，回滚得到";
getGoodsChangeStr(?ItemSourceSystem) ->"系统免费发放";
getGoodsChangeStr(?ItemSourceFuncell2Ls) ->"平台后台所发邮件";
getGoodsChangeStr(?ItemSourcePassCopyMap) ->"通关副本奖励";
getGoodsChangeStr(?ItemSourceActiveCode) ->"激活码领取";
getGoodsChangeStr(?ItemSourceBagEmptyMail) ->"背包容易不够时发送邮件";
getGoodsChangeStr(?ItemSourceSignIn) ->"签到奖励道具";
getGoodsChangeStr(?ItemSourceChangeMail) ->"玩家提取附件";
getGoodsChangeStr(?ItemSourceBuySend) ->"商城购买赠送";
getGoodsChangeStr(?ItemSourceRank) ->"排行榜奖励";
getGoodsChangeStr(?ItemSourceLuckDraw) ->"幸运币抽奖奖励";
getGoodsChangeStr(?ItemSourceHDBattle) ->"混沌战场击杀boss伤害最高奖励";
getGoodsChangeStr(?ItemSourceDigTreasrue) ->"藏宝图挖宝奖励";
getGoodsChangeStr(?ItemSourceRechargeAward) ->"充值活动奖励";
getGoodsChangeStr(?ItemSourceMonthCardAward) ->"月卡奖励";
getGoodsChangeStr(?ItemSourceVipLevelAward) ->"爵位等级奖励";
getGoodsChangeStr(?ItemSourceCSCreateCompanionReward) ->"CServer创建的灵魂伙伴奖励道具";
getGoodsChangeStr(?ItemSourceMonthCardService) ->"月卡服务购买";
getGoodsChangeStr(?ItemSourceGuildCopyAward) ->"军团副本获得";
getGoodsChangeStr(?ItemSourceBossActivityGiveIPadItem) ->"首领入侵活动奖励ipad道具兑换币";
getGoodsChangeStr(?ItemWorldBossItemEmail) ->"首领入侵活动奖励邮件";
getGoodsChangeStr(?ItemAccountWelfare) ->"帐号福利邮件";
getGoodsChangeStr(?ItemLoginWelfare) ->"玩家登录福利邮件";
getGoodsChangeStr(?ItemSweepingCopyMap) ->"低级副本扫荡获得";
getGoodsChangeStr(?ItemSourceGuildBattleAward) ->"军团联赛获得";
getGoodsChangeStr(?ItemSourceWarriorTrial) ->"勇士试炼获得";
getGoodsChangeStr(?ItemSourceRechargeRebate) ->"充值返利物品";
getGoodsChangeStr(?ItemSourceMSShopItem) ->"从神秘商店中购买物品";
getGoodsChangeStr(?ItemSourceOperateAcItem) ->"运营活动掉落物品";
getGoodsChangeStr(?ItemSourceKingBattleAll) ->"王者战天下活动中购买";
getGoodsChangeStr(?ItemSourceUpdateResource) ->"更新资源获得物品";
getGoodsChangeStr(?ItemSourceKingBattleAllAward) ->"王者战天下奖励物品";
getGoodsChangeStr(?ItemSourceOperateExchange) ->"运营兑换活动兑换所得";
getGoodsChangeStr(?ItemSourceArenaLadder1v1) ->"竞技场天梯1v1周结算奖励";
getGoodsChangeStr(?ItemSourceKnightBuy) ->"爵位购买获得";
getGoodsChangeStr(?ItemSourceAnswerReward) ->"幸运答题抢答王奖励";
getGoodsChangeStr(?ItemSourcePetPveSweep) ->"宠物远征副本扫荡";
getGoodsChangeStr(?ItemSourcePetPveOver) ->"宠物远征副本通关";
getGoodsChangeStr(?ItemSourceWildBoss) ->"野外boss奖励";
getGoodsChangeStr(?ItemSourceOPChargeGift) ->"运营充值活动奖励";
getGoodsChangeStr(?ItemSourceOPUseGift) ->"运营非绑定钻石消费活动奖励";
getGoodsChangeStr(?ItemSourceWarriorRank) ->"勇者试炼排行奖励";
getGoodsChangeStr(?ItemSourceLottery) ->"抽奖获得";
getGoodsChangeStr(?ItemSourcePetPvpBattle) ->"宠物争夺战获得";
getGoodsChangeStr(?ItemSourceGuildWar) ->"军团争霸获得";
getGoodsChangeStr(?ItemSourceDarkness) ->"黑暗之地获得奖励";
getGoodsChangeStr(?ItemSourceCrosHdBattle) ->"跨服混沌战场每日奖励";
getGoodsChangeStr(?ItemSourceLiveness) ->"活跃奖励";
getGoodsChangeStr(?ItemSourceWeekCrosHdBattle) ->"跨服混沌战场每周奖励";
getGoodsChangeStr(?ItemSourceAwardGiveMark) ->"日本评分后的奖励";
getGoodsChangeStr(?ItemSourceGuildHomeReward) ->"军团工资道具奖励";
getGoodsChangeStr(?ItemSourceGuildHomeTask) ->"军团驻地任务道具奖励";
getGoodsChangeStr(?ItemSourceCrosArenaReward) ->"跨服竞技场每场奖励";
getGoodsChangeStr(?ItemSourceWeekCrosArenaReward) ->"跨服竞技场每周奖励";
getGoodsChangeStr(?ItemSourceLimitSales) ->"限时推送购买";
getGoodsChangeStr(?ItemSourceBuyItem) ->"直接购买物品";
getGoodsChangeStr(?ItemSourceBuyPlayerLevelReward) ->"等级礼包奖励";
getGoodsChangeStr(?ItemSourceDailySignInReward) ->"每日签到奖励";
getGoodsChangeStr(?ItemSourceDailyAccReward) ->"累计签到奖励";
getGoodsChangeStr(?ItemSourceOnlineReward) ->"在线奖励";
getGoodsChangeStr(?ItemSourceFindRes) ->"资源找回";
getGoodsChangeStr(?ItemSourceSevenDayMission) ->"七日任务";
getGoodsChangeStr(?ItemSourceAngelInvestment) ->"天使投资";
getGoodsChangeStr(?ItemSourceWorldLevel) ->"世界等级礼包奖励";
getGoodsChangeStr(?ItemSourceGuildExpeditionScore) ->"帮会沙盘当日积分奖励";
getGoodsChangeStr(?ItemSourceGuildExpeditionEveryDay) ->"帮会沙盘每日奖励";
getGoodsChangeStr(?ItemSourceLotteryForTower) ->"金宝塔";
getGoodsChangeStr(?ItemSourceRuneCompound) ->"符文合成掉落";
getGoodsChangeStr(?ItemSourceCareerReward) ->"新建职业奖励";
getGoodsChangeStr(?ItemSourceACLSBattlefield) ->"乱世为王战场奖励";
getGoodsChangeStr(?ItemSourceACDate) ->"约会地下城活动奖励";
getGoodsChangeStr(?ItemSourceMarriageWantBuildFaild) ->"姻缘系统产出-求婚失败返还";
getGoodsChangeStr(?ItemSourceGuildShopBuy) ->"家族系统-家族商店-购买获得";
getGoodsChangeStr(?ItemSourceGuildSnowman) ->"家族系统-堆雪人活动-雪人礼盒";
getGoodsChangeStr(?ItemSourceSpiritAreaReward) ->"灵界活动奖励";
getGoodsChangeStr(?ItemSourcePetTerritoryExploit) ->"新版骑宠领地-开采奖励";
getGoodsChangeStr(?ItemSourcePetTerritoryPlunder) ->"新版骑宠领地-掠夺奖励";
getGoodsChangeStr(?ItemSourceGuildGodblessSchedule) ->"家族系统-女神祈福-祈福进度奖励";
getGoodsChangeStr(?ItemSourcePetToChip) ->"骑宠转换成碎片";
getGoodsChangeStr(?ItemSourceSevenDayAimReward) ->"七日目标领奖道具奖励";
getGoodsChangeStr(?ItemSourceThirtyDayLoginGift) ->"30日登录送大礼道具奖励";

getGoodsChangeStr(?ItemUseReasonPlayer) ->"玩家使用消耗";
getGoodsChangeStr(?ItemUseReasonMount) ->"坐骑使用消耗";
getGoodsChangeStr(?ItemDeleteReasonPlayer) ->"玩家删除消耗";
getGoodsChangeStr(?ItemDeleteReasonRecycle) ->"回收站满了消耗";
getGoodsChangeStr(?ItemDeleteReasonResolve) ->"装备分解消耗";
getGoodsChangeStr(?ItemDeleteReasonExchange) ->"资源兑换消耗";
getGoodsChangeStr(?ItemDeleteReasonGemMake) ->"宝石合成消耗";
getGoodsChangeStr(?ItemDeleteReasonUsed) ->"使用完消耗";
getGoodsChangeStr(?ItemDeleteReasonMove) ->"物品移动消耗";
getGoodsChangeStr(?ItemDeleteReasonTrade) ->"交易行变更消耗";
getGoodsChangeStr(?ItemDeleteReasonSort) ->"物品整理消耗";
getGoodsChangeStr(?ItemDeleteReasonGemOn) ->"物品镶嵌消耗";
getGoodsChangeStr(?ItemDeleteReasonAwaken) ->"升级觉醒消耗";
getGoodsChangeStr(?ItemDeleteReasonUseSkill) ->"使用技能消耗";
getGoodsChangeStr(?ItemDeleteReasonRecast) ->"装备重铸";
getGoodsChangeStr(?ItemDeleteReasonTreasure) ->"藏宝图挖宝";
getGoodsChangeStr(?ItemDeleteReasonRefine) ->"装备精炼";
getGoodsChangeStr(?ItemDeleteReasonWake) ->"觉醒消耗";
getGoodsChangeStr(?ItemDeleteReasonPetSkillCast) ->"宠物技能洗炼";
getGoodsChangeStr(?ItemDeleteReasonPetUpStar) ->"宠物升星";
getGoodsChangeStr(?ItemDeleteReasonPetEquipStr) ->"宠物装备强化";
getGoodsChangeStr(?ItemDeleteReasonPetReName) ->"宠物改名";
getGoodsChangeStr(?ItemDeleteReasonMail) ->"邮件提取";
getGoodsChangeStr(?ItemDeleteReasonPetRaw) ->"宠物转生";
getGoodsChangeStr(?ItemDeleteReasonGodWeaponUnLock) ->"神器解锁";
getGoodsChangeStr(?ItemDeleteReasonGodWeaponLevelup) ->"神器升级";
getGoodsChangeStr(?ItemDeleteReasonGodSkillLevelup) ->"神器技能升级";
getGoodsChangeStr(?ItemDeleteReasonOperateExchange) ->"运营兑换活动消耗";
getGoodsChangeStr(?ItemDeleteReasonEscort) ->"护送活动消耗";
getGoodsChangeStr(?ItemDeleteReasonAddPetAtta) ->"宠物提升属性消耗";
getGoodsChangeStr(?ItemDeleteReasonModifyGuildName) ->"军团改名消耗";
getGoodsChangeStr(?ItemDeleteReasonEquipUpStar) ->"装备升星";
getGoodsChangeStr(?ItemDeleteReasonExpired) ->"时间过期";
getGoodsChangeStr(?ItemDelelteReasonException) ->"由于数据异常导致的道具删除";
getGoodsChangeStr(?ItemDeleteReasonEqupmentCombin) ->"装备合成消耗";
getGoodsChangeStr(?ItemDeleteReasonRevokeItem) ->"扣回物品";
getGoodsChangeStr(?ItemDeleteReasonUpSkillItem) ->"升级技能消耗物品";
getGoodsChangeStr(?ItemDeleteReasonRuneCompound) ->"符文合成消耗";
getGoodsChangeStr(?ItemDeleteReasonUseSkillBook) ->"使用宠物技能书";
getGoodsChangeStr(?ItemDeleteReasonMarriageWantBuild) ->"姻缘系统消耗-求婚";
getGoodsChangeStr(?ItemDeleteReasonMarriageRingTop) ->"姻缘系统消耗-突破婚戒";
getGoodsChangeStr(Reason) ->
	?ERROR_OUT("getGoodsChangeStr:unknow[~w] ~p",[Reason, misc:getStackTrace()]),
	"未知".

getCoinChangeResonStr(?CoinSourceMail) ->"邮件获得";
getCoinChangeResonStr(?CoinSourceOnlineGM) ->"GM指令获得";
getCoinChangeResonStr(?CoinSourceTask) ->"任务获得";
getCoinChangeResonStr(?CoinSourceEquipResolve) ->"装备分解获得";
getCoinChangeResonStr(?CoinSourceUseItem) ->"使用道具获得";
getCoinChangeResonStr(?CoinSourceCopyMapReward) ->"副本通关奖励得到";
getCoinChangeResonStr(?CoinSourceCreateRecycle) ->"出售到回收站";
getCoinChangeResonStr(?CoinSourceRecharge) ->"玩家充值";
getCoinChangeResonStr(?CoinSourceActivity) ->"混沌战场获利荣誉";
getCoinChangeResonStr(?CoinSourceAchieve) ->"成就得到";
getCoinChangeResonStr(?CoinSourceMallSend) ->"商城购买赠送";
getCoinChangeResonStr(?CoinSource4PreRechargeBack) ->"预充值币返还";
getCoinChangeResonStr(?CoinSourceGuildContri) ->"军团捐献获得";
getCoinChangeResonStr(?CoinSourceWarriorTrial) ->"勇士试炼获得";
getCoinChangeResonStr(?CoinSourceRechargeRebate) ->"充值返利绑定砖石";
getCoinChangeResonStr(?CoinSourceAnswerReward) ->"玩家答题获得";
getCoinChangeResonStr(?CoinSourceOperateExchange) ->"运营兑换活动兑换获得";
getCoinChangeResonStr(?CoinSourceVipBuySend) ->"爵位购买赠送";
getCoinChangeResonStr(?CoinSourceEscort) ->"护送奖励";
getCoinChangeResonStr(?CoinSourcePetPveReward) ->"远征副本通关领取";
getCoinChangeResonStr(?CoinSourcePetPveSweep) ->"远征副本扫荡领取";
getCoinChangeResonStr(?CoinSourcePetPveStar) ->"远征副本星星数量领取";
getCoinChangeResonStr(?CoinSourceLadder) ->"天梯系统获得";
getCoinChangeResonStr(?CoinSourceLottery) ->"抽奖获得";
getCoinChangeResonStr(?CoinSourceDarkness) ->"黑暗之地获得水晶";
getCoinChangeResonStr(?CoinSourcePetPvpReward) ->"远征争夺战胜利领取";
getCoinChangeResonStr(?CoinSourceGuildHomeReward) ->"军团工资奖励";
getCoinChangeResonStr(?CoinSourceGuildHomeTask) ->"军团驻地任务奖励";
getCoinChangeResonStr(?CoinSourceGrowUpForKorea) ->"韩国成长礼包";
getCoinChangeResonStr(?CoinSourceFindRes) ->"资源找回";
getCoinChangeResonStr(?CoinSourceGetRed) ->"领取红包";
getCoinChangeResonStr(?CoinSourceMarriageBreak) ->"姻缘系统返还-强制离婚失败";
getCoinChangeResonStr(?CoinSourceGuildBattle) ->"军团战比赛奖励";
getCoinChangeResonStr(?CoinSourcePetTerritorySearchBack) ->"新版骑宠领地-搜索失败返回";
getCoinChangeResonStr(?CoinSourceGuildSnowmanDonate) ->"家族系统-堆雪人-提交材料奖励";
getCoinChangeResonStr(?CoinSourceGuildSnowmanSettle) ->"家族系统-堆雪人-结算奖励";
getCoinChangeResonStr(?CoinSourceGuildFairgroundRide) ->"家族系统-游乐场-乘坐设备失败返回";
getCoinChangeResonStr(?CoinSourceMoneyTree) ->"点金手";
getCoinChangeResonStr(?CoinSourceResetSkill) ->"技能洗点";
getCoinChangeResonStr(?CoinSourceSevenDayAimReward) ->"七日目标领奖货币奖励";
getCoinChangeResonStr(?CoinSourceThirtyDayLoginGift) ->"30日登录送大礼货币奖励";

getCoinChangeResonStr(?CoinUseEquipResolve) ->"装备分解消耗";
getCoinChangeResonStr(?CoinUseEquipEnhance) ->"装备强化消耗";
getCoinChangeResonStr(?CoinUseShop) ->"商店购买消耗";
getCoinChangeResonStr(?CoinUseSkillLearn) ->"技能学习消耗";
getCoinChangeResonStr(?CoinUseTradeFee) ->"交易行手续费消耗";
getCoinChangeResonStr(?CoinUseTradeBuy) ->"交易行购买消耗";
getCoinChangeResonStr(?CoinUseEquipExchange) ->"资源兑换消耗";
getCoinChangeResonStr(?CoinUseFeedMount) ->"喂养坐骑消耗";
getCoinChangeResonStr(?CoinUseStrPetEquip) ->"宠物装备升级消耗";
getCoinChangeResonStr(?CoinUseBackToRecycle) ->"回收站回购消耗";
getCoinChangeResonStr(?CoinUseStrPetBagSlot) ->"解锁背包格子消耗";
getCoinChangeResonStr(?CoinUseAwakenUpgrade) ->"升级觉醒消耗";
getCoinChangeResonStr(?CoinUseCreateGuild) ->"创建公会消耗";
getCoinChangeResonStr(?CoinUseGemMix) ->"宝石合成";
getCoinChangeResonStr(?CoinUseFashionClothes) ->"购买时装";
getCoinChangeResonStr(?CoinUseEquipRecast) ->"装备重铸";
getCoinChangeResonStr(?CoinUseGuildDonate) ->"军团捐献";
getCoinChangeResonStr(?CoinUseEquipRefine) ->"装备精炼";
getCoinChangeResonStr(?CoinUseEquipHonor) ->"装备荣誉";
getCoinChangeResonStr(?CoinUseWakeUp) ->"觉醒成长";
getCoinChangeResonStr(?CoinUseMonthCardService) ->"购买月卡服务";
getCoinChangeResonStr(?CoinUsePetSkillCast) ->"宠物技能洗炼";
getCoinChangeResonStr(?CoinUseCreateCompanion) ->"创建灵魂伙伴团队";
getCoinChangeResonStr(?CoinUsePetUpStar) ->"宠物升星";
getCoinChangeResonStr(?CoinUseLowCopyMapAuto) ->"低级副本扫荡消耗";
getCoinChangeResonStr(?CoinUseMSShopBuyItem) ->"从神秘商店中购买商品";
getCoinChangeResonStr(?CoinUseGetOfflineExp) ->"领取离线经验消耗";
getCoinChangeResonStr(?CoinUseLadder1v1) ->"天梯1v1挑战";
getCoinChangeResonStr(?CoinUseKingBattleAll) ->"王者战天下活动消耗";
getCoinChangeResonStr(?CoinUseGodWeaponLevelUp) ->"神器升级";
getCoinChangeResonStr(?CoinUseGodWeaponSkillLevelUp) ->"神器技能升级";
getCoinChangeResonStr(?CoinUseGodKnightBuy) ->"爵位购买消耗";
getCoinChangeResonStr(?CoinUsePetPvePhy) ->"宠物远征体力购买";
getCoinChangeResonStr(?CoinUseMSShopFresh) ->"玩家主动刷新神秘商店";
getCoinChangeResonStr(?CoinUseEquipUpStar) ->"装备升星";
getCoinChangeResonStr(?CoinUseRevive) ->"复活消耗";
getCoinChangeResonStr(?CoinUseLottery) ->"抽奖消耗";
getCoinChangeResonStr(?CoinUsePetAtta) ->"宠物属性洗练";
getCoinChangeResonStr(?CoinUseDarkness) ->"黑暗之地失去";
getCoinChangeResonStr(?CoinUseMall) ->"商城购买消耗";
getCoinChangeResonStr(?CoinUseReName) ->"红名惩罚消耗";
getCoinChangeResonStr(?CoinUseGuildSkill) ->"学习军团技能";
getCoinChangeResonStr(?CoinUseGuildBuff) ->"购买军团BUFF";
getCoinChangeResonStr(?CoinUseWing) ->"翅膀升级消费";
getCoinChangeResonStr(?CoinUseRevokeMoney) ->"扣回钻石";
getCoinChangeResonStr(?CoinUseSignInMoney) ->"补签钻石消耗";
getCoinChangeResonStr(?CoinUseSkillUp) ->"技能升级消耗";
getCoinChangeResonStr(?CoinUseGuildImpeach) ->"军团弹劾";
getCoinChangeResonStr(?CoinUseFindRes) ->"资源找回";
getCoinChangeResonStr(?SevenDayMission) ->"七日任务";
getCoinChangeResonStr(?AngelInvestment) ->"天使投资";
getCoinChangeResonStr(?CoinUseRune) ->"符文消耗，洗炼，熔炼，合成均用此";
getCoinChangeResonStr(?LotteryForTower) ->"金宝塔抽奖";
getCoinChangeResonStr(?CoinUseSendRed) ->"发送红包";
getCoinChangeResonStr(?CoinUseLoopTask) ->"一键完成环任务";
getCoinChangeResonStr(?CoinUsePetPvpReel) ->"宠物争夺令购买";
getCoinChangeResonStr(?CoinUseLotterySysCoin) ->"宝藏系统金币抽";
getCoinChangeResonStr(?CoinUseLotterySysGem) ->"宝藏系统钻石抽";
getCoinChangeResonStr(?CoinBuyActionPoint) ->"购买体力值";
getCoinChangeResonStr(?CoinBuyMarriageBreak) ->"姻缘系统消耗-单方面强行离婚";
getCoinChangeResonStr(?CoinUseGuildGodBless) ->"家族系统-女神祈福-祈福消耗";
getCoinChangeResonStr(?CoinUseGuildShopBuy) ->"家族系统-家族商店-购买消耗";
getCoinChangeResonStr(?CoinUseGuildExchange) ->"家族系统-兑换功能-兑换消耗";
getCoinChangeResonStr(?CoinUsePetTerritoryBuild) ->"新版骑宠领地-升级领地消耗";
getCoinChangeResonStr(?CoinUsePetTerritorySearch) ->"新版骑宠领地-搜索领地消耗";
getCoinChangeResonStr(?CoinBuyActionCount) ->"购买副本次数";
getCoinChangeResonStr(?CoinUseGuildFairgroundRide) ->"家族系统-游乐场-乘坐设备消耗";
getCoinChangeResonStr(?CoinUseMoneyTree) ->"点金手";
getCoinChangeResonStr(?CoinUseWorldBossInspire) ->"首领入侵,鼓舞";
getCoinChangeResonStr(Reason) ->
	?ERROR_OUT("getCoinChangeResonStr:unknow[~w] ~p",[Reason, misc:getStackTrace()]),
	"未知".

getCoinTypeStr(?CoinTypeGold) ->"金币";
getCoinTypeStr(?CoinTypeBindGold_useless_____) ->"绑定金币";
getCoinTypeStr(?CoinTypeDiamond) ->"钻石";
getCoinTypeStr(?CoinTypePrestige) ->"声望";
getCoinTypeStr(?CoinTypeHonor) ->"荣誉值";
getCoinTypeStr(?CoinTypeBindDiamond) ->"绑定钻石币";
getCoinTypeStr(?CoinTypePurpleEssence) ->"紫色精华";
getCoinTypeStr(?CoinTypeGoldenEssence) ->"金色精华";
getCoinTypeStr(?CoinTypeExploit) ->"功勋";
getCoinTypeStr(?CoinTypeScore) ->"积分";
getCoinTypeStr(?CoinTypePebble) ->"魔能水晶-黑暗之地";
getCoinTypeStr(Reason) ->
	?ERROR_OUT("getCoinTypeStr:unknow[~w] ~p",[Reason, misc:getStackTrace()]),
	"未知".






 %% Return items change reason grouping
getGoodsChangeGroupStr( Reason ) ->
	if
		Reason > 0 ->
			"obtain";
		Reason =< 0 ->
		"consumption";
		true ->
		?ERROR_OUT("getGoodsChangeGroupStr:unknow[~w] ~p",[Reason,misc:getStackTrace()]),"unknown"
	end.

%%Depending on the type of item ID returned items
getGoodsGroupName( GoodsID ) ->
	case goods:getGoodsCfg(GoodsID)of
		#itemCfg{ itemType = ItemType } ->
			integer_to_list(ItemType);
		#equipmentCfg{type=Type} ->
			integer_to_list(Type);
		#runeCfg{type = RuneType} ->
			case RuneType of
				0 -> 24;
				1 -> 25
			end;
		R ->
			?ERROR_OUT("getGoodsGroupName:unknow[~w] ~p",[R,misc:getStackTrace()]),"unknown"
	end.

%% career Chinese name (profession)
getCareerStr( Career ) ->
	Career_Cfg = getCfg:getCfgPStack(cfg_player_desc, Career),
	Career_Cfg#player_descCfg.name.

%% Returns the task name and group name
getTaskNameAndGroupName( TaskID ) ->
  TaskCfg=getCfg:getCfgPStack(cfg_task_new, TaskID),
  TaskGroupCfg = getCfg:getCfgPStack(cfg_task_group, TaskCfg#task_newCfg.groupid),
  {TaskCfg#task_newCfg.task_name, TaskGroupCfg#task_groupCfg.groupname}.