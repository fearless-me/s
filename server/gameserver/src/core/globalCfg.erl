%% @author Administrator
%% @doc @todo 全局游戏配置.


-module(globalCfg).

-include("gsInc.hrl").

%% ====================================================================
%% API functions
%% ====================================================================

-compile(export_all).

%% 获取全局配置
-spec getGlobalCfg(atom()) -> number() | not_found.
getGlobalCfg(GlobalCfg) ->
	case getCfg:getCfgPStack(cfg_globalsetup, GlobalCfg) of
		#globalsetupCfg{setpara = [SetPara]} ->
			SetPara;
		[] ->
			?ERROR_OUT("not found the cfg [~p]", [GlobalCfg]),
			not_found
	end.

%% 获取全局配置(返回值为list)
-spec getGlobalCfgList(atom()) -> list() | not_found.
getGlobalCfgList(GlobalCfg) ->
	case getCfg:getCfgPStack(cfg_globalsetup, GlobalCfg) of
		#globalsetupCfg{setpara = SetPara} ->
			SetPara;
		[] ->
			not_found
	end.

%% 获取自动复活时间，单位是毫秒
-spec getRebornTime() -> uint() | not_found.
getRebornTime() ->
	getGlobalCfg(reborn_time).

%% 获取伤害浮动最小范围
-spec getMinDamage() -> uint() | not_found.
getMinDamage() ->
	getGlobalCfg(minDamage).

%% 获取伤害浮动最大范围
-spec getMaxDamage() -> uint() | not_found.
getMaxDamage() ->
	getGlobalCfg(maxDamage).

%% 获取白色装备基础属性加成系数
-spec getWhiteFactor() -> float() | not_found.
getWhiteFactor() ->
	getGlobalCfg(whiteFactor).

%% 获取绿色装备基础属性加成系数
-spec getGreenFactor() -> float() | not_found.
getGreenFactor() ->
	getGlobalCfg(greenFactor).

%% 获取蓝色装备基础属性加成系数
-spec getBlueFactor() -> float() | not_found.
getBlueFactor() ->
	getGlobalCfg(blueFactor).

%% 获取紫色装备基础属性加成系数
-spec getPurpleFactor() -> float() | not_found.
getPurpleFactor() ->
	getGlobalCfg(purpleFactor).

%% 获取黄色装备基础属性加成系数
-spec getOrangeFactor() -> float() | not_found.
getOrangeFactor() ->
	getGlobalCfg(orangeFactor).

%% 获取红色装备基础属性加成系数
-spec getRedFactor() -> float() | not_found.
getRedFactor() ->
	getGlobalCfg(redFactor).

%% 获取装备符合自身职业的几率
-spec getShlfChance() -> float() | not_found.
getShlfChance() ->
	getGlobalCfg(shlfChance).

%% 获取选择Max1的几率
-spec getMax1Chance() -> float() | not_found.
getMax1Chance() ->
	getGlobalCfg(max1Chance).

%% 获取绿色装备1前几率
-spec getGreenAffix() -> list() | not_found.
getGreenAffix() ->
	getGlobalCfgList(greenAffix).

%% 获取蓝色装备1前1后几率
-spec getBlueAffix() -> list() | not_found.
getBlueAffix() ->
	getGlobalCfgList(blueAffix).

%% 获取紫色装备2前2后几率
-spec getPurpleAffix() -> list() | not_found.
getPurpleAffix() ->
	getGlobalCfgList(purpleAffix).

%% 获取橙色红色装备1前几率
-spec getOraRed1Affix() -> list() | not_found.
getOraRed1Affix() ->
	getGlobalCfgList(oraRed1Affix).

%% 获取橙色红色装备1后几率
-spec getOraRed2Affix() -> list() | not_found.
getOraRed2Affix() ->
	getGlobalCfgList(oraRed2Affix).

%% 获取橙色红色装备2前1后几率
-spec getOraRed3Affix() -> list() | not_found.
getOraRed3Affix() ->
	getGlobalCfgList(oraRed3Affix).

%% 获取橙色红色装备2前2后几率
-spec getOraRed4Affix() -> list() | not_found.
getOraRed4Affix() ->
	getGlobalCfgList(oraRed4Affix).

%% 获取橙色红色装备3前2后几率
-spec getOraRed5Affix() -> list() | not_found.
getOraRed5Affix() ->
	getGlobalCfgList(oraRed5Affix).

%% 获取橙色红色装备3前3后几率
-spec getOraRed6Affix() -> list() | not_found.
getOraRed6Affix() ->
	getGlobalCfgList(oraRed6Affix).

%% 获取主属性伤害转换数
-spec getPropToDam() -> float() | not_found.
getPropToDam() ->
	getGlobalCfg(propToDam).

%% 获取强化系数
-spec getIntensifyFactor() -> float() | not_found.
getIntensifyFactor() ->
	getGlobalCfg(intensifyFactor).

%% 获取强化装备的白色品质倍率
-spec getChargeWhite() -> float() | not_found.
getChargeWhite() ->
	getGlobalCfg(charge_white).

%% 获取强化装备的绿色品质倍率
-spec getChargeGreen() -> float() | not_found.
getChargeGreen() ->
	getGlobalCfg(charge_green).

%% 获取强化装备的蓝色品质倍率
-spec getChargeBlue() -> float() | not_found.
getChargeBlue() ->
	getGlobalCfg(charge_blue).

%% 获取强化装备的紫色品质倍率
-spec getChargePurple() -> float() | not_found.
getChargePurple() ->
	getGlobalCfg(charge_purple).

%% 获取强化装备的黄色品质倍率
-spec getChargeOrange() -> float() | not_found.
getChargeOrange() ->
	getGlobalCfg(charge_orange).

%% 获取强化装备的红色品质倍率
-spec getChargeRed() -> float() | not_found.
getChargeRed() ->
	getGlobalCfg(charge_red).

%% 获取冲刺速度
-spec getChargeSpeed() -> uint() | not_found.
getChargeSpeed() ->
	getGlobalCfg(chargeSpeed).

%% 获取抓取速度
-spec getGripSpeed() -> uint() | not_found.
getGripSpeed() ->
	getGlobalCfg(gripSpeed).

%% 获取击退速度
-spec getRepelSpeed() -> uint() | not_found.
getRepelSpeed() ->
	getGlobalCfg(repelSpeed).

%% 获取12小时保管费用
-spec getSellCost12() -> float() | not_found.
getSellCost12() ->
	getGlobalCfg(sellcost12).

%% 获取24小时保管费用
-spec getSellCost24() -> float() | not_found.
getSellCost24() ->
	getGlobalCfg(sellcost24).

%% 获取48小时保管费用
-spec getSellCost48() -> float() | not_found.
getSellCost48() ->
	getGlobalCfg(sellcost48).

%% 获取交易税。把钱邮寄给卖家的时候，就已经扣除了，但是在邮件里要说说明，卖了多少钱，扣税扣了多少。
-spec getSellTax() -> float() | not_found.
getSellTax() ->
	getGlobalCfg(selltax).

%% 获取在寄售道具为元宝时，收费铜币保管费兑换价。
-spec getGoldExchange() -> uint() | not_found.
getGoldExchange() ->
	getGlobalCfg(gold_exchange).

%% 获取普通玩家能上架的数量
-spec getNormalSellNum() -> uint() | not_found.
getNormalSellNum() ->
	getGlobalCfg(normal_sellnum).

%% 获取VIP玩家能上架的数量
-spec getVipSellNum() -> uint() | not_found.
getVipSellNum() ->
	getGlobalCfg(vipd_sellnum).

%% 获取普通指定交易人数上限
-spec getOrderSellNum() -> uint() | not_found.
getOrderSellNum() ->
	getGlobalCfg(order_sellnum).

%% 获取VIP玩家指定交易人数上限
-spec getVipOrderSellNum() -> uint() | not_found.
getVipOrderSellNum() ->
	getGlobalCfg(viporder_sellnum).

%% 红包日志记录条数配置
-spec getRedHistoryNum() -> uint().
getRedHistoryNum() ->
	case getGlobalCfg(bribery_history) of
		not_found ->1;
		Val ->Val
	end.
		  
%% 获取角色复活后血量
-spec getReliveHp() -> float() | not_found.
getReliveHp() ->
	getGlobalCfg(relive_hp).

%% 获取show1 对话时，每秒弹出来的字数
-spec getCharSpeed1() -> uint() | not_found.
getCharSpeed1() ->
	getGlobalCfg(char_speed1).

%% 获取show1 每句话的间隔时间
-spec getSenTime1() -> uint() | not_found.
getSenTime1() ->
	getGlobalCfg(sen_time1).

%% 获取show2 对话时，每秒弹出来的字数
-spec getCharSpeed2() -> uint() | not_found.
getCharSpeed2() ->
	getGlobalCfg(char_speed2).

%% 获取show2 每句话的间隔时间
-spec getSenTime2() -> uint() | not_found.
getSenTime2() ->
	getGlobalCfg(sen_time2).

%% 获取玩家脱战距离
-spec getPlayerTof() -> uint() | not_found.
getPlayerTof() ->
	getGlobalCfg(playertof).

%% 获取按下技能后的，自动搜索目标半径
-spec getSearchRadius() -> uint() | not_found.
getSearchRadius() ->
	getGlobalCfg(search_radius).

%% 获取玩家出生初始地图ID
-spec getStartMap() -> uint() | not_found.
getStartMap() ->
	getGlobalCfg(startmap).

%% 获取坐骑上马距离
-spec getMountUpDistance() -> uint() | not_found.
getMountUpDistance() ->
	getGlobalCfg(mount_up_distance).

%% 获取坐骑食物ID
-spec getMountFoodID() -> uint() | not_found.
getMountFoodID() ->
	getGlobalCfg(mountfood).

%% 获取坐骑耐久值系数（耐久值 = 系数 * 玩家等级）
-spec getMountSta() -> uint() | not_found.
getMountSta() ->
	getGlobalCfg(mountsta).

%% 获取玩家幸运币抽奖获奖概率
-spec getLuckyDrawOdds() -> uint() | not_found.
getLuckyDrawOdds() ->
	getGlobalCfg(luckydraw_odds).

%%获取策划设定的最大玩家等级
-spec getPlayerMaxLevel() -> uint() | not_found.
getPlayerMaxLevel() ->
	getGlobalCfg(player_maxlevel).

%%获取宠物品质系数
-spec getPetQualArg(Qual::uint()) -> float() | not_found.
getPetQualArg(?PetQualityWhite) ->
	getGlobalCfg(petQuality0);
getPetQualArg(?PetQualityGreen) ->
	getGlobalCfg(petQuality1);
getPetQualArg(?PetQualityBlue) ->
	getGlobalCfg(petQuality2);
getPetQualArg(?PetQualityPurple) ->
	getGlobalCfg(petQuality3);
getPetQualArg(?PetQualityOrange) ->
	getGlobalCfg(petQuality4).

%%获取宠物星级系数
-spec getPetStarArg(Star::uint()) -> float() | not_found.
getPetStarArg(?PetStar1) ->
	getGlobalCfg(petEnh1);
getPetStarArg(?PetStar2) ->
	getGlobalCfg(petEnh2);
getPetStarArg(?PetStar3) ->
	getGlobalCfg(petEnh3);
getPetStarArg(?PetStar4) ->
	getGlobalCfg(petEnh4);
getPetStarArg(?PetStar5) ->
	getGlobalCfg(petEnh5);
getPetStarArg(?PetStar6) ->
	getGlobalCfg(petEnh6);
getPetStarArg(?PetStar7) ->
	getGlobalCfg(petEnh7);
getPetStarArg(?PetStar8) ->
	getGlobalCfg(petEnh8);
getPetStarArg(?PetStar9) ->
	getGlobalCfg(petEnh9);
getPetStarArg(?PetStar10) ->
	getGlobalCfg(petEnh10).

%%获取宠物转生系数
-spec getPetRawArg(Star::uint()) -> float() | not_found.
getPetRawArg(?PetRaw0) ->
	getGlobalCfg(petReBorn0);
getPetRawArg(?PetRaw1) ->
	getGlobalCfg(petReBorn1);
getPetRawArg(?PetRaw2) ->
	getGlobalCfg(petReBorn2);
getPetRawArg(?PetRaw3) ->
	getGlobalCfg(petReBorn3);
getPetRawArg(?PetRaw4) ->
	getGlobalCfg(petReBorn4);
getPetRawArg(?PetRaw5) ->
	getGlobalCfg(petReBorn5);
getPetRawArg(?PetRaw6) ->
	getGlobalCfg(petReBorn6);
getPetRawArg(?PetRaw7) ->
	getGlobalCfg(petReBorn7);
getPetRawArg(?PetRaw8) ->
	getGlobalCfg(petReBorn8);
getPetRawArg(?PetRaw9) ->
	getGlobalCfg(petReBorn9);
getPetRawArg(?PetRaw10) ->
	getGlobalCfg(petReBorn10).


%%获取宠物幸运值最大值
-spec getPetMaxLucky() -> float() | not_found.
getPetMaxLucky() ->
	getGlobalCfg(petskillroll).

%%获取宠物改名需要材料
-spec getPetNameMaterial() -> list() | not_found.
getPetNameMaterial() ->
	getGlobalCfgList(pet_name).

%% %%获取宠物强化需要材料
%% -spec getPetStrMaterial() -> list().
%% getPetStrMaterial() -> 
%% 	getGlobalCfgList(pet_stronger).

%%获取宠物助战最大个数
-spec getPetAssistNum() -> uint() | not_found.
getPetAssistNum() ->
	getGlobalCfgList(petMaxAssist).

%%获取宠物技能品质系数
-spec getPetSkillQualArg(Qual::uint()) -> float() | not_found.
getPetSkillQualArg(?PetSkillQualityGreen) ->
	getGlobalCfg(petskillpw_green);
getPetSkillQualArg(?PetSkillQualityBlue) ->
	getGlobalCfg(petskillpw_blue);
getPetSkillQualArg(?PetSkillQualityPurple) ->
	getGlobalCfg(petskillpw_purple);
getPetSkillQualArg(?PetSkillQualityOrange) ->
	getGlobalCfg(petskillpw_orange);
getPetSkillQualArg(?PetSkillQualityRed) ->
	getGlobalCfg(petskillpw_red).


%%获取宝石等级计算系数
getGemValue(1) ->
	getGlobalCfg(gem_value1);
getGemValue(2) ->
	getGlobalCfg(gem_value2);
getGemValue(3) ->
	getGlobalCfg(gem_value3);
getGemValue(4) ->
	getGlobalCfg(gem_value4);
getGemValue(5) ->
	getGlobalCfg(gem_value5);
getGemValue(6) ->
	getGlobalCfg(gem_value6);
getGemValue(7) ->
	getGlobalCfg(gem_value7);
getGemValue(8) ->
	getGlobalCfg(gem_value8);
getGemValue(9) ->
	getGlobalCfg(gem_value9);
getGemValue(10) ->
	getGlobalCfg(gem_value10).

%%获取宠物远征体力恢复时间
getPetWarTickTime() ->
	getGlobalCfg(petwar_replystrength).

%%获取宠物远征vip增加次数
getPetWarAddTimes() ->
	getGlobalCfgList(petwar_add).

%%获取宠物远征购买金钱
getPetWarPurDiamond() ->
	getGlobalCfgList(petwar_addgold).

%%获取宠物远征防御系数
getPetWarDefArg() ->
	getGlobalCfg(petbattledef).

%%获取宠物远征装备加成系数
getPetWarEquipAddArg() ->
	getGlobalCfg(petbattleequip).

%%获取宠物远征星星奖励列表
getPetWarStarReward() ->
	getGlobalCfgList(petwar_stargift).

%%获取宠物远征pve调控系数
getPetWarPveArg() ->
	getGlobalCfg(pet_atkshow).

%%获取宠物属性洗练条目
getPetAttaNum() ->
	getGlobalCfg(petstronger_num).

%%获取宠物属性洗练消耗材料
getPetAttaMaterial() ->
	getGlobalCfgList(pet_stronger).

%%获取技能开放等级
getSkillSlotOpenSkill(Index) when Index >= ?ActiveSkill1 andalso Index =< ?ActiveSkill5 ->
	L = getGlobalCfgList(activeSkill),
	case lists:keyfind(Index, 1, L) of
		{Index, Lv} ->
			Lv;
		_ ->
			0
	end;
getSkillSlotOpenSkill(Index) when Index >= ?PassiveSkill1 andalso Index =< ?PassiveSkill5 ->
	L = getGlobalCfgList(passiveSkill),
	case lists:keyfind(Index, 1, L) of
		{Index, Lv} ->
			Lv;
		_ ->
			0
	end;
getSkillSlotOpenSkill(Index) when Index >= ?Transfiguration1 andalso Index =< ?Transfiguration5 ->
	L = getGlobalCfgList(transfiguration),
	case lists:keyfind(Index, 1, L) of
		{Index, Lv} ->
			Lv;
		_ ->
			0
	end.

%%获取宠物争夺战保护时间
getPetPvpProc() ->
	getGlobalCfg(petpvp_pro).

%%获取争夺令最大数量
getPetPvpReelMaxNum() ->
	getGlobalCfg(petpvp_token).

%%获取争夺令恢复CD
getPetPvpReelRestoreCD() ->
	getGlobalCfg(petpvp_cd).

%%获取争夺战积分排行榜条数
getPetPvpIntegralRank() ->
	getGlobalCfg(petpvp_rank).

%%获取争夺领购买价格
getPetPvpPurcReel() ->
	getGlobalCfgList(petpvp_money).

%%获取争夺战奖励列表
getPetPvpReward() ->
	getGlobalCfgList(petpvp_win).

%%获取运营活动节日boss参数
getAcArg() ->
	getGlobalCfgList(fightbossactivity).

%%获取首次杀戮值
getFirstKv() ->
	getGlobalCfg(killing_firstvalue).

%%获取每次杀戮值
getEachKv() ->
	getGlobalCfg(killing_value).

%%获取tick杀戮值
getTickKv() ->
	getGlobalCfgList(killing_time).

%%杀戮值广播最低值
getBroadCastKv() ->
	getGlobalCfg(killing_broadcast).

%%杀戮值惩罚最低值
getPunishKv() ->
  	getGlobalCfg(killing_punishment).

%%杀戮值惩罚buff
getPunishBuff() ->
	getGlobalCfg(killing_punishmentbuff).

%%杀戮值消耗
getCostKv() ->
	getGlobalCfg(killing_cost).

%%杀戮值广播最低值
getBroadCastBeKv() ->
	getGlobalCfg(killing_die).

%%跨服战场全局变量

%%获取跨服战场最大地图线路
getBattleWarMaxMapLine() ->
	getGlobalCfg(battle_war_MaxMapLine).

%%获取每条地图先最大人数
getBattleWarMaxLinePlayer() ->
	getGlobalCfg(battle_war_MaxLinePlayer).

%%获取高端战场数量
getBattleWarHighMapLine() ->
	getGlobalCfg(battle_war_HighMapLine).

%%获取中端战场数量
getBattleWarMidMapLine() ->
	getGlobalCfg(battle_war_MidMapLine).

%%获取低端战场数量
getBattleWarLowMapLine() ->
	getGlobalCfg(battle_war_LowMapLine).

%%获取中端战场战斗力
getBattleWarMidMapForce() ->
	getGlobalCfg(battle_war_MidMapForce).

%%获取低端战场战斗力
getBattleWarMinMapForce() ->
	getGlobalCfg(battle_war_MinMapForce).

%%进入战场阶段二积分
getBattleWarCrystalMaxIntegral() ->
	getGlobalCfg(battle_war_CrystalMaxIntegral).

%%大水晶积分
getBattleWarCrystalIntegralMax() ->
	getGlobalCfg(battle_war_CrystalIntegralMax).

%%小水晶积分
getBattleWarCrystalIntegral() ->
	getGlobalCfg(battle_war_CrystalIntegral).

%%大水晶战功
getBattleWarCrystalMaxExploit() ->
	getGlobalCfg(battle_war_CrystalMaxExploit).

%%大水晶额外战功
getBattleWarCrystalMaxExploitSubsidy() ->
	getGlobalCfg(battle_war_CrystalMaxExploitSubsidy).

%%小水晶战功
getBattleWarCrystalExploit() ->
	getGlobalCfg(battle_war_CrystalExploit).

%%小水晶额外战功
getBattleWarCrystalExploitSubsidy() ->
	getGlobalCfg(battle_war_CrystalExploitSubsidy).

%%击杀守卫战功
getBattleWarGuardExploit() ->
	getGlobalCfg(battle_war_GuardExploit).

%%杀人获得战功
getBattleWarKillExploit() ->
	getGlobalCfg(battle_war_KillExploit).

%%助攻获得战功
getBattleWarAssKillExploit() ->
	getGlobalCfg(battle_war_AssKillExploit).

%%采集物获得战功
getBattleWarObjectExploit() ->
	getGlobalCfg(battle_war_ObjectExploit).

%%采集物根据马车额外加成
getBattleWarObjectExploitSubsidy() ->
	getGlobalCfgList(battle_war_ObjectExploitSubsidy).

%%击杀马车获得战功
getBattleWarCarriageOverExploit() ->
	getGlobalCfg(battle_war_CarriageOverExploit).

%%守卫数量
getBattleWarGuardNum() ->
	getGlobalCfg(battle_war_GuardNum).

%%第三阶段刷新时间
getBattleWarRefreshTime() ->
	getGlobalCfg(battle_war_RefreshTime).

%%低端战场限制
getBattleWarLowMapAegis() ->
	getGlobalCfg(battle_war_LowMapAegis).

%%每日战功奖励
getBattleWarRewardNo1() ->
	getGlobalCfgList(battle_war_RewardNo1).

getBattleWarRewardNo2() ->
	getGlobalCfgList(battle_war_RewardNo2).

getBattleWarRewardNo3() ->
	getGlobalCfgList(battle_war_RewardNo3).

getBattleWarRewardNo4() ->
	getGlobalCfgList(battle_war_RewardNo4).

getBattleWarRewardNo5() ->
	getGlobalCfgList(battle_war_RewardNo5).

%%每周战功奖励
getBattleWarWeekRewardNo1() ->
	getGlobalCfgList(battle_war_WeekRewardNo1).

getBattleWarWeekRewardNo2() ->
	getGlobalCfgList(battle_war_WeekRewardNo2).

getBattleWarWeekRewardNo3() ->
	getGlobalCfgList(battle_war_WeekRewardNo3).

getBattleWarWeekRewardNo4() ->
	getGlobalCfgList(battle_war_WeekRewardNo4).

getBattleWarWeekRewardNo5() ->
	getGlobalCfgList(battle_war_WeekRewardNo5).

getBattleWarWeekRewardNo6() ->
	getGlobalCfgList(battle_war_WeekRewardNo6).

getBattleWarWeekRewardNo7() ->
	getGlobalCfgList(battle_war_WeekRewardNo7).

%%宝箱采集物ID
getBattleWarObject() ->
	getGlobalCfgList(battle_war_Object).

%%守卫ID列表
getBattleWarGuard() ->
	getGlobalCfgList(battle_war_Guard).

%%马车ID列表
getBattleWarCarriage() ->
	getGlobalCfgList(battle_war_Carriage).

%%大水晶列表
getBattleWarOreMax() ->
	getGlobalCfgList(battle_war_OreMax).

%%小水晶列表
getBattleWarOre() ->
	getGlobalCfgList(battle_war_Ore).

%%守护怪物
getBattleBoss() ->
	getGlobalCfgList(battle_war_Boss).

%%守卫坐标
getBattleWarGuardCoordinate() ->
	getGlobalCfgList(battle_war_GuardCoordinate).

%%杀人广播数量
getBattleWarKillMessage() ->
	getGlobalCfg(battle_war_KillMessage).

%%一血怪物列表
getFirstBloodMonster() ->
	getGlobalCfgList(firstbloodmonster).

%%怪物血量
getMonsterBlood() ->
	getGlobalCfg(battle_war_attack).

getWingRegeneratio() ->
	case getGlobalCfgList(wing_regeneratio) of
		undefined ->  [];
		L -> L
	end.

%%获取跨服竞技场最大线路数
getArenaMaxMapLine() ->
	getGlobalCfg(arena_MaxMapLine).

%%获取跨服竞技场匹配间隔分数
getArenaMatch() ->
	getGlobalCfg(arena_Match).

%%获取每日奖励
getArenaRewardNumber() ->
	getGlobalCfg(arena_RewardNumber).


%%获取阶段分数
getArenaDan1() ->
	getGlobalCfgList(arena_DanPoint_1).

getArenaDan2() ->
	getGlobalCfgList(arena_DanPoint_2).

getArenaDan3() ->
	getGlobalCfgList(arena_DanPoint_3).

getArenaDan4() ->
	getGlobalCfgList(arena_DanPoint_4).

getArenaDan5() ->
	getGlobalCfgList(arena_DanPoint_5).

getArenaDan6() ->
	getGlobalCfgList(arena_DanPoint_6).

%%获取胜利奖品
getArenaWinReward() ->
	getGlobalCfgList(arena_WinReward).

%%获取失败奖品
getArenaLoseReward() ->
	getGlobalCfgList(arena_LoseReward).

%%获取周奖励
getArenaWeekRewardNo1() ->
	getGlobalCfgList(arena_WeekRewardNo1).

getArenaWeekRewardNo2() ->
	getGlobalCfgList(arena_WeekRewardNo2).

getArenaWeekRewardNo3() ->
	getGlobalCfgList(arena_WeekRewardNo3).

getArenaWeekRewardNo4() ->
	getGlobalCfgList(arena_WeekRewardNo4).

getArenaWeekRewardNo5() ->
	getGlobalCfgList(arena_WeekRewardNo5).

getArenaWeekRewardNo6() ->
	getGlobalCfgList(arena_WeekRewardNo6).

getArenaWeekRewardNo7() ->
	getGlobalCfgList(arena_WeekRewardNo7).

getArenaGatherCd() ->
	getGlobalCfg(arena_Dapao).

getArenaInviteLv() ->
	getGlobalCfg(arena_AddLevel).
	

%% ====================================================================
%% Internal functions
%% ====================================================================


