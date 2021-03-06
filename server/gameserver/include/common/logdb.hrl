%% coding: latin-1
%%This file is automatically generated, please do not modify the contents of this file manually!!!
%%This document defines the game log database needed some definitions
%%Source to the largest:100000, Consumption class from 100001 Began to various sources section set number
-ifndef(LOGDB_HRL).
-define(LOGDB_HRL,1).

%%物品来源定义，范围[0,499]
-define(ItemSourceIntenal, 	0).%%内部初始化
-define(ItemSourceBag, 	1).%%背包移动获得
-define(ItemSourceStorage, 	2).%%仓库移动获得
-define(ItemSourceBodyEquip, 	3).%%装备移动获得
-define(ItemSourceRecycle, 	4).%%回收站移动获得
-define(ItemSourceMail, 	5).%%邮件得到物品
-define(ItemSourceTask, 	6).%%任务得到物品
-define(ItemSourceTaskCollect, 	7).%%任务采集得到物品
-define(ItemSourceKillMonster, 	8).%%杀怪得到物品
-define(ItemSourceShop, 	9).%%商店购买得到物品
-define(ItemSourceMall, 	10).%%商城购买得到物品
-define(ItemSourceOpenPackage, 	11).%%开包裹、礼包得到物品
-define(ItemSourceNormalCollect, 	12).%%普通采集得到物品
-define(ItemSourceGemOff, 	13).%%宝石镶嵌拆卸得到物品
-define(ItemSourceGemMake, 	14).%%宝石合成得到物品
-define(ItemSourceExchange, 	15).%%资源兑换得到物品
-define(ItemSourceGM, 	16).%%GM指令获得
-define(ItemSourceSplit, 	17).%%道具拆分得到
-define(ItemSourceRollBack, 	18).%%道具扣除失败，回滚得到
-define(ItemSourceSystem, 	19).%%系统免费发放
-define(ItemSourceFuncell2Ls, 	20).%%平台后台所发邮件
-define(ItemSourcePassCopyMap, 	21).%%通关副本奖励
-define(ItemSourceActiveCode, 	22).%%激活码领取
-define(ItemSourceBagEmptyMail, 	23).%%背包容易不够时发送邮件
-define(ItemSourceSignIn, 	24).%%签到奖励道具
-define(ItemSourceChangeMail, 	25).%%玩家提取附件
-define(ItemSourceBuySend, 	26).%%商城购买赠送
-define(ItemSourceRank, 	27).%%排行榜奖励
-define(ItemSourceLuckDraw, 	28).%%幸运币抽奖奖励
-define(ItemSourceHDBattle, 	29).%%混沌战场击杀boss伤害最高奖励
-define(ItemSourceDigTreasrue, 	30).%%藏宝图挖宝奖励
-define(ItemSourceRechargeAward, 	31).%%充值活动奖励
-define(ItemSourceMonthCardAward, 	32).%%月卡奖励
-define(ItemSourceVipLevelAward, 	33).%%爵位等级奖励
-define(ItemSourceCSCreateCompanionReward, 	34).%%CServer创建的灵魂伙伴奖励道具
-define(ItemSourceMonthCardService, 	35).%%月卡服务购买
-define(ItemSourceGuildCopyAward, 	36).%%军团副本获得
-define(ItemSourceBossActivityGiveIPadItem, 	37).%%首领入侵活动奖励ipad道具兑换币
-define(ItemWorldBossItemEmail, 	38).%%首领入侵活动奖励邮件
-define(ItemAccountWelfare, 	39).%%帐号福利邮件
-define(ItemLoginWelfare, 	40).%%玩家登录福利邮件
-define(ItemSweepingCopyMap, 	41).%%低级副本扫荡获得
-define(ItemSourceGuildBattleAward, 	42).%%军团联赛获得
-define(ItemSourceWarriorTrial, 	43).%%勇士试炼获得
-define(ItemSourceRechargeRebate, 	44).%%充值返利物品
-define(ItemSourceMSShopItem, 	45).%%从神秘商店中购买物品
-define(ItemSourceOperateAcItem, 	46).%%运营活动掉落物品
-define(ItemSourceKingBattleAll, 	47).%%王者战天下活动中购买
-define(ItemSourceUpdateResource, 	48).%%更新资源获得物品
-define(ItemSourceKingBattleAllAward, 	49).%%王者战天下奖励物品
-define(ItemSourceOperateExchange, 	50).%%运营兑换活动兑换所得
-define(ItemSourceArenaLadder1v1, 	51).%%竞技场天梯1v1周结算奖励
-define(ItemSourceKnightBuy, 	52).%%爵位购买获得
-define(ItemSourceAnswerReward, 	53).%%幸运答题抢答王奖励
-define(ItemSourcePetPveSweep, 	54).%%宠物远征副本扫荡
-define(ItemSourcePetPveOver, 	55).%%宠物远征副本通关
-define(ItemSourceWildBoss, 	56).%%野外boss奖励
-define(ItemSourceOPChargeGift, 	57).%%运营充值活动奖励
-define(ItemSourceOPUseGift, 	58).%%运营非绑定钻石消费活动奖励
-define(ItemSourceWarriorRank, 	59).%%勇者试炼排行奖励
-define(ItemSourceLottery, 	60).%%抽奖获得
-define(ItemSourcePetPvpBattle, 	61).%%宠物争夺战获得
-define(ItemSourceGuildWar, 	62).%%军团争霸获得
-define(ItemSourceDarkness, 	63).%%黑暗之地获得奖励
-define(ItemSourceCrosHdBattle, 	64).%%跨服混沌战场每日奖励
-define(ItemSourceLiveness, 	65).%%活跃奖励
-define(ItemSourceWeekCrosHdBattle, 	66).%%跨服混沌战场每周奖励
-define(ItemSourceAwardGiveMark, 	67).%%日本评分后的奖励
-define(ItemSourceGuildHomeReward, 	68).%%军团工资道具奖励
-define(ItemSourceGuildHomeTask, 	69).%%军团驻地任务道具奖励
-define(ItemSourceCrosArenaReward, 	70).%%跨服竞技场每场奖励
-define(ItemSourceWeekCrosArenaReward, 	71).%%跨服竞技场每周奖励
-define(ItemSourceLimitSales, 	72).%%限时推送购买
-define(ItemSourceBuyItem, 	73).%%直接购买物品
-define(ItemSourceBuyPlayerLevelReward, 	74).%%等级礼包奖励
-define(ItemSourceDailySignInReward, 	75).%%每日签到奖励
-define(ItemSourceDailyAccReward, 	76).%%累计签到奖励
-define(ItemSourceOnlineReward, 	77).%%在线奖励
-define(ItemSourceFindRes, 	78).%%资源找回
-define(ItemSourceSevenDayMission, 	79).%%七日任务
-define(ItemSourceAngelInvestment, 	80).%%天使投资
-define(ItemSourceWorldLevel, 	81).%%世界等级礼包奖励
-define(ItemSourceGuildExpeditionScore, 	82).%%帮会沙盘当日积分奖励
-define(ItemSourceGuildExpeditionEveryDay, 	83).%%帮会沙盘每日奖励
-define(ItemSourceLotteryForTower, 	84).%%金宝塔
-define(ItemSourceRuneCompound, 	85).%%符文合成掉落
-define(ItemSourceCareerReward, 	86).%%新建职业奖励
-define(ItemSourceACLSBattlefield, 	88).%%乱世为王战场奖励
-define(ItemSourceACDate, 	89).%%约会地下城活动奖励
-define(ItemSourceMarriageWantBuildFaild, 	90).%%姻缘系统产出-求婚失败返还
-define(ItemSourceGuildShopBuy, 	91).%%家族系统-家族商店-购买获得
-define(ItemSourceGuildSnowman, 	92).%%家族系统-堆雪人活动-雪人礼盒
-define(ItemSourceSpiritAreaReward, 	93).%%灵界活动奖励
-define(ItemSourcePetTerritoryExploit, 	94).%%新版骑宠领地-开采奖励
-define(ItemSourcePetTerritoryPlunder, 	95).%%新版骑宠领地-掠夺奖励
-define(ItemSourceGuildGodblessSchedule, 	96).%%家族系统-女神祈福-祈福进度奖励
-define(ItemSourcePetToChip, 	97).%%骑宠转换成碎片
-define(ItemSourceSevenDayAimReward, 	98).%%七日目标领奖道具奖励
-define(ItemSourceThirtyDayLoginGift, 	99).%%30日登录送大礼道具奖励
-define(ItemSourcePetRecycle, 	100).%%骑宠成长返还
-define(ItemSourceCharmRank, 	101).%%魅力排行榜奖励
-define(ItemSourceGuildSupplication, 	102).%%家族系统-碎片祈愿-被赠
-define(ItemSourceGuildSupplicationBack, 	103).%%家族系统-碎片祈愿-赠送失败返还
-define(ItemSourceHomePlantOPBack, 	104).%%家园系统-种植区-操作失败返还
-define(ItemSourceHomePlantHarvest, 	105).%%家园系统-种植区-收获
-define(ItemSourceHomeFarmingHarvest, 	106).%%家园系统-饲养区-收获
-define(ItemSourceCrossRace, 	107).%%跨服活动-骑宠竞速-结算奖励

%%物品变更定义，范围[500,999]
-define(ItemUseReasonPlayer, 	500).%%玩家使用消耗
-define(ItemUseReasonMount, 	501).%%坐骑使用消耗
-define(ItemDeleteReasonPlayer, 	502).%%玩家删除消耗
-define(ItemDeleteReasonRecycle, 	503).%%回收站满了消耗
-define(ItemDeleteReasonResolve, 	504).%%装备分解消耗
-define(ItemDeleteReasonExchange, 	505).%%资源兑换消耗
-define(ItemDeleteReasonGemMake, 	506).%%宝石合成消耗
-define(ItemDeleteReasonUsed, 	507).%%使用完消耗
-define(ItemDeleteReasonMove, 	508).%%物品移动消耗
-define(ItemDeleteReasonTrade, 	509).%%交易行变更消耗
-define(ItemDeleteReasonSort, 	511).%%物品整理消耗
-define(ItemDeleteReasonGemOn, 	512).%%物品镶嵌消耗
-define(ItemDeleteReasonAwaken, 	514).%%升级觉醒消耗
-define(ItemDeleteReasonUseSkill, 	515).%%使用技能消耗
-define(ItemDeleteReasonRecast, 	517).%%装备重铸
-define(ItemDeleteReasonTreasure, 	518).%%藏宝图挖宝
-define(ItemDeleteReasonRefine, 	519).%%装备精炼
-define(ItemDeleteReasonWake, 	520).%%觉醒消耗
-define(ItemDeleteReasonPetSkillCast, 	521).%%宠物技能洗炼
-define(ItemDeleteReasonPetUpStar, 	522).%%宠物升星
-define(ItemDeleteReasonPetEquipStr, 	523).%%宠物装备强化
-define(ItemDeleteReasonPetReName, 	524).%%宠物改名
-define(ItemDeleteReasonMail, 	525).%%邮件提取
-define(ItemDeleteReasonPetRaw, 	526).%%宠物转生
-define(ItemDeleteReasonGodWeaponUnLock, 	527).%%神器解锁
-define(ItemDeleteReasonGodWeaponLevelup, 	528).%%神器升级
-define(ItemDeleteReasonGodSkillLevelup, 	529).%%神器技能升级
-define(ItemDeleteReasonOperateExchange, 	530).%%运营兑换活动消耗
-define(ItemDeleteReasonEscort, 	531).%%护送活动消耗
-define(ItemDeleteReasonAddPetAtta, 	532).%%宠物提升属性消耗
-define(ItemDeleteReasonModifyGuildName, 	533).%%军团改名消耗
-define(ItemDeleteReasonEquipUpStar, 	534).%%装备升星
-define(ItemDeleteReasonExpired, 	535).%%时间过期
-define(ItemDelelteReasonException, 	536).%%由于数据异常导致的道具删除
-define(ItemDeleteReasonEqupmentCombin, 	537).%%装备合成消耗
-define(ItemDeleteReasonRevokeItem, 	538).%%扣回物品
-define(ItemDeleteReasonUpSkillItem, 	539).%%升级技能消耗物品
-define(ItemDeleteReasonRuneCompound, 	540).%%符文合成消耗
-define(ItemDeleteReasonUseSkillBook, 	541).%%使用宠物技能书
-define(ItemDeleteReasonMarriageWantBuild, 	542).%%姻缘系统消耗-求婚
-define(ItemDeleteReasonMarriageRingTop, 	543).%%姻缘系统消耗-突破婚戒
-define(ItemDeleteReasonPetSkillLevelUp, 	544).%%宠物技能升级
-define(ItemDeleteReasonGiveGift, 	545).%%赠礼消耗礼品
-define(ItemDeleteReasonGuildSupplication, 	546).%%家族系统-碎片祈愿-赠送
-define(ItemDeleteReasonHome, 	547).%%家园消耗
-define(ItemDeleteReasonFashion, 	548).%%时装消耗
-define(ItemDeleteReasonHomePlantOP, 	549).%%家园系统-种植区-操作消耗
-define(ItemDeleteReasonPetLevelup, 	550).%%宠物升级
-define(ItemDeleteReasonHomeFarmingOP, 	551).%%家园系统-饲养区-操作消耗

%%货币来源范围[1000,2000]
-define(CoinSourceMail, 	1001).%%邮件获得
-define(CoinSourceOnlineGM, 	1002).%%GM指令获得
-define(CoinSourceTask, 	1003).%%任务获得
-define(CoinSourceEquipResolve, 	1004).%%装备分解获得
-define(CoinSourceUseItem, 	1005).%%使用道具获得
-define(CoinSourceCopyMapReward, 	1006).%%副本通关奖励得到
-define(CoinSourceCreateRecycle, 	1007).%%出售到回收站
-define(CoinSourceRecharge, 	1008).%%玩家充值
-define(CoinSourceActivity, 	1009).%%混沌战场获利荣誉
-define(CoinSourceAchieve, 	1010).%%成就得到
-define(CoinSourceMallSend, 	1011).%%商城购买赠送
-define(CoinSource4PreRechargeBack, 	1012).%%预充值币返还
-define(CoinSourceGuildContri, 	1013).%%军团捐献获得
-define(CoinSourceWarriorTrial, 	1014).%%勇士试炼获得
-define(CoinSourceRechargeRebate, 	1015).%%充值返利绑定砖石
-define(CoinSourceAnswerReward, 	1016).%%玩家答题获得
-define(CoinSourceOperateExchange, 	1017).%%运营兑换活动兑换获得
-define(CoinSourceVipBuySend, 	1018).%%爵位购买赠送
-define(CoinSourceEscort, 	1019).%%护送奖励
-define(CoinSourcePetPveReward, 	1020).%%远征副本通关领取
-define(CoinSourcePetPveSweep, 	1021).%%远征副本扫荡领取
-define(CoinSourcePetPveStar, 	1022).%%远征副本星星数量领取
-define(CoinSourceLadder, 	1023).%%天梯系统获得
-define(CoinSourceLottery, 	1024).%%抽奖获得
-define(CoinSourceDarkness, 	1025).%%黑暗之地获得水晶
-define(CoinSourcePetPvpReward, 	1026).%%远征争夺战胜利领取
-define(CoinSourceGuildHomeReward, 	1027).%%军团工资奖励
-define(CoinSourceGuildHomeTask, 	1028).%%军团驻地任务奖励
-define(CoinSourceGrowUpForKorea, 	1029).%%韩国成长礼包
-define(CoinSourceFindRes, 	1030).%%资源找回
-define(CoinSourceGetRed, 	1031).%%领取红包
-define(CoinSourceMarriageBreak, 	1032).%%姻缘系统返还-强制离婚失败
-define(CoinSourceGuildBattle, 	1033).%%军团战比赛奖励
-define(CoinSourcePetTerritorySearchBack, 	1034).%%新版骑宠领地-搜索失败返回
-define(CoinSourceGuildSnowmanDonate, 	1035).%%家族系统-堆雪人-提交材料奖励
-define(CoinSourceGuildSnowmanSettle, 	1036).%%家族系统-堆雪人-结算奖励
-define(CoinSourceGuildFairgroundRide, 	1037).%%家族系统-游乐场-乘坐设备失败返回
-define(CoinSourceMoneyTree, 	1038).%%点金手
-define(CoinSourceResetSkill, 	1039).%%技能洗点
-define(CoinSourceSevenDayAimReward, 	1040).%%七日目标领奖货币奖励
-define(CoinSourceThirtyDayLoginGift, 	1041).%%30日登录送大礼货币奖励
-define(CoinSourceGuildFairgroundRideReward, 	1042).%%家族系统-游乐场-乘坐设备额外奖励
-define(CoinSourceGuildSupplicationReward, 	1043).%%家族系统-碎片祈愿-赠送碎片奖励
-define(CoinSourceHomePlantOPBack, 	1044).%%家园系统-种植区-操作失败返还
-define(CoinSourceMonsterBook, 	1045).%%怪物图鉴-货币奖励

%%货币消耗范围[10001,...]
-define(CoinUseEquipResolve, 	10001).%%装备分解消耗
-define(CoinUseEquipEnhance, 	10002).%%装备强化消耗
-define(CoinUseShop, 	10003).%%商店购买消耗
-define(CoinUseSkillLearn, 	10004).%%技能学习消耗
-define(CoinUseTradeFee, 	10005).%%交易行手续费消耗
-define(CoinUseTradeBuy, 	10006).%%交易行购买消耗
-define(CoinUseEquipExchange, 	10007).%%资源兑换消耗
-define(CoinUseFeedMount, 	10008).%%喂养坐骑消耗
-define(CoinUseStrPetEquip, 	10009).%%宠物装备升级消耗
-define(CoinUseBackToRecycle, 	10010).%%回收站回购消耗
-define(CoinUseStrPetBagSlot, 	10011).%%解锁背包格子消耗
-define(CoinUseAwakenUpgrade, 	10012).%%升级觉醒消耗
-define(CoinUseCreateGuild, 	10013).%%创建公会消耗
-define(CoinUseGemMix, 	10014).%%宝石合成
-define(CoinUseFashionClothes, 	10015).%%购买时装
-define(CoinUseEquipRecast, 	10016).%%装备重铸
-define(CoinUseGuildDonate, 	10017).%%军团捐献
-define(CoinUseEquipRefine, 	10018).%%装备精炼
-define(CoinUseEquipHonor, 	10019).%%装备荣誉
-define(CoinUseWakeUp, 	10020).%%觉醒成长
-define(CoinUseMonthCardService, 	10021).%%购买月卡服务
-define(CoinUsePetSkillCast, 	10022).%%宠物技能洗炼
-define(CoinUseCreateCompanion, 	10023).%%创建灵魂伙伴团队
-define(CoinUsePetUpStar, 	10024).%%宠物升星
-define(CoinUseLowCopyMapAuto, 	10025).%%低级副本扫荡消耗
-define(CoinUseMSShopBuyItem, 	10026).%%从神秘商店中购买商品
-define(CoinUseGetOfflineExp, 	10027).%%领取离线经验消耗
-define(CoinUseLadder1v1, 	10028).%%天梯1v1挑战
-define(CoinUseKingBattleAll, 	10029).%%王者战天下活动消耗
-define(CoinUseGodWeaponLevelUp, 	10030).%%神器升级
-define(CoinUseGodWeaponSkillLevelUp, 	10031).%%神器技能升级
-define(CoinUseGodKnightBuy, 	10032).%%爵位购买消耗
-define(CoinUsePetPvePhy, 	10033).%%宠物远征体力购买
-define(CoinUseMSShopFresh, 	10034).%%玩家主动刷新神秘商店
-define(CoinUseEquipUpStar, 	10035).%%装备升星
-define(CoinUseRevive, 	10036).%%复活消耗
-define(CoinUseLottery, 	10037).%%抽奖消耗
-define(CoinUsePetAtta, 	10038).%%宠物属性洗练
-define(CoinUseDarkness, 	10039).%%黑暗之地失去
-define(CoinUseMall, 	10040).%%商城购买消耗
-define(CoinUseReName, 	10041).%%红名惩罚消耗
-define(CoinUseGuildSkill, 	10042).%%学习军团技能
-define(CoinUseGuildBuff, 	10043).%%购买军团BUFF
-define(CoinUseWing, 	10044).%%翅膀升级消费
-define(CoinUseRevokeMoney, 	10045).%%扣回钻石
-define(CoinUseSignInMoney, 	10046).%%补签钻石消耗
-define(CoinUseSkillUp, 	10047).%%技能升级消耗
-define(CoinUseGuildImpeach, 	10048).%%军团弹劾
-define(CoinUseFindRes, 	10049).%%资源找回
-define(SevenDayMission, 	10050).%%七日任务
-define(AngelInvestment, 	10051).%%天使投资
-define(CoinUseRune, 	10052).%%符文消耗，洗炼，熔炼，合成均用此
-define(LotteryForTower, 	10053).%%金宝塔抽奖
-define(CoinUseSendRed, 	10054).%%发送红包
-define(CoinUseLoopTask, 	10059).%%一键完成环任务
-define(CoinUsePetPvpReel, 	10060).%%宠物争夺令购买
-define(CoinUseLotterySysCoin, 	10061).%%宝藏系统金币抽
-define(CoinUseLotterySysGem, 	10062).%%宝藏系统钻石抽
-define(CoinBuyActionPoint, 	10063).%%购买体力值
-define(CoinBuyMarriageBreak, 	10064).%%姻缘系统消耗-单方面强行离婚
-define(CoinUseGuildGodBless, 	10065).%%家族系统-女神祈福-祈福消耗
-define(CoinUseGuildShopBuy, 	10066).%%家族系统-家族商店-购买消耗
-define(CoinUseGuildExchange, 	10067).%%家族系统-兑换功能-兑换消耗
-define(CoinUsePetTerritoryBuild, 	10068).%%新版骑宠领地-升级领地消耗
-define(CoinUsePetTerritorySearch, 	10069).%%新版骑宠领地-搜索领地消耗
-define(CoinBuyActionCount, 	10070).%%购买副本次数
-define(CoinUseGuildFairgroundRide, 	10071).%%家族系统-游乐场-乘坐设备消耗
-define(CoinUseMoneyTree, 	10072).%%点金手
-define(CoinUseWorldBossInspire, 	10073).%%首领入侵,鼓舞
-define(CoinUsePetSkillLevelUp, 	10074).%%宠物技能升级
-define(CoinUseStarMoonBox, 	10075).%%星月秘盒使用
-define(CoinUsePetRecycle, 	10076).%%骑宠成长返还
-define(CoinUseHome, 	10077).%%家园消耗
-define(CoinUseHomePlantOP, 	10078).%%家园系统-种植区-操作消耗
-define(CoinUseGuildBossOP, 	10079).%%家族-BOSS-战

%%_funcell log 需要货币类型的中文

%%玩家经验来源
-define(ExpSourceKillMonster, 	1).%%杀怪得到经验
-define(ExpSourceUseItem, 	2).%%使用道具得到经验
-define(ExpSourceTask, 	3).%%完成任务得到经验
-define(ExpSourceCopyMap, 	4).%%副本通关得到经验
-define(ExpSourceGM, 	5).%%使用GM命令
-define(ExpSourceOfflineExp, 	6).%%领取离线经验
-define(ExpSourceAnswerPlay, 	7).%%答题得到经验
-define(ExpSourcePetPve, 	8).%%宠物远征得到经验
-define(ExpSourcePetPvp, 	9).%%宠物争夺战得到经验
-define(ExpSourceGuildHomeReward, 	10).%%军团工资经验
-define(ExpSourceGuildHomeTask, 	11).%%军团驻地任务经验
-define(ExpSourceFindRes, 	12).%%资源找回
-define(ExpSourceLSBattle, 	13).%%乱世为王经验奖励
-define(ExpSourceGuildBattle, 	14).%%军团战奖励
-define(ExpSourceGuildGodBless, 	15).%%家族系统-女神祈福-经验奖励
-define(ExpSourceGuildSnowmanDonate, 	16).%%家族系统-堆雪人活动-捐献材料经验奖励
-define(ExpSourceDanceIng, 	17).%%限时广场舞跳舞获得经验
-define(ExpSourceHomeFarming, 	18).%%家园放养宠物经验
-define(ExpSourceMonsterBook, 	19).%%怪物图鉴-经验奖励

%%玩家经验去向
-define(ExpOutTalentLevelUp, 	1).%%天赋升级使用

%%玩家称号来源
-define(TitleSourceGeneralScroll, 	1).%%使用普通卷轴随机获得
-define(TitleSourceSpecialScroll, 	2).%%使用特殊卷轴获得
-define(TitleSourceGM, 	3).%%通过GM指令获得
-define(TitleSourceAchieve, 	4).%%完成成就获得

%%物品属性变化
-define(GoodsFieldChange_OwnerID, 	1).%%拥有者变化(RoleID)
-define(GoodsFieldChange_BagType, 	2).%%背包栏位(p)
-define(GoodsFieldChange_PileNum, 	3).%%数量(pileNum)
-define(GoodsFieldChange_IsBind, 	4).%%绑定(isBind)
-define(GoodsFieldChange_EnhLevel, 	5).%%强化等级(curEnhLevel)
-define(GoodsFieldChange_Quality, 	6).%%品质(quality)
-define(GoodsFieldChange_Deleted, 	7).%%销毁(deleteTim)

%%功能体验统计type
-define(FunType_Task, 	"任务").
-define(FunType_CheckPoint, 	"关卡").
-define(FunType_Activity, 	"活动").
-define(FunType_Daily, 	"日常").

-endif.