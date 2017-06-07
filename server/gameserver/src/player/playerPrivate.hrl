%%
%%%客户端进程的私有定义
-ifndef(playerPrivate_hrl).
-define(playerPrivate_hrl, 1).

-include("gsInc.hrl").
-include("common/playerPropSyncDefine.hrl").
-include("common/activityDef.hrl").
-include("reputation.hrl").
-include("playerLog.hrl").
-include("task.hrl").
%%一个账号能创建的最大角色数
-define(Max_Create_Role_Num, 4).

%%组队或个人经验分配权值
-define(ExpAllotMinPar, 0.05).
-define(ExpAllotMaxPar, 1).

%%玩家更新时间间隔,请勿随意修改该数值，修改后请通知策划人员。
-define(PlayerTickInternal, 400).
%%港口竞速地图id
-define(NEED_FOR_SPEED_MAP_ID, 9001).
%%港口竞速地图tick时间差
-define(NeedForSpeedPlayerTickInternal, 100).
%%玩家进程发送自己的在线信息给CS的间隔时间(一分钟)
-define(updateSelfInfoToMemCacheTick, 60000).

-define(BagTypeNormal, 1).        %% 普通背包
-define(BagTypeEquip, 2).        %% 装备背包
-define(StorageTypeNormal, 3).    %% 普通仓库
-define(StorageTypeEquip, 4).    %% 装备仓库

%%%好友类型
%-define(FriendTypeSweet, 1).		% 好友
%-define(FriendTypeTemp, 2).			% 临时好友
%-define(FriendTypeStranger, 3).		% 陌生人
%-define(FriendTypeBlackList, 4).	% 黑名单
%-type friendType() :: 1 .. 4.

%%频道类型
-define(CHAT_CHANNEL_WORLD, 1). %%世界
-define(CHAT_CHANNEL_PRIVATE, 2). %%私聊
-define(CHAT_CHANNEL_TEAM, 3). %%队伍
-define(CHAT_CHANNEL_GUILD, 4). %%帮会
-define(CHAT_CHANNEL_HORN, 5). %%喇叭
-define(CHAT_CHANNEL_SYSTEM, 6). %%系统
-type chatChannelEnum() :: ?CHAT_CHANNEL_WORLD .. ?CHAT_CHANNEL_SYSTEM.

%%好友log

%-define(FriendLogDec, 0). %%删除好友
%-define(FriendLogAdd, 1). %%增加好友

%% 下线类型
-define(OffLineTypeRobKickOut, robKickOut).        % 抢登录情况下被其他终端登录挤下线
-define(OffLineTypeGmKickOut, gmKickOut).        % gm指令踢下线（成功处理会给发起进程通知）
-define(OffLineTypeNormal, normal).                % 玩家普通下线
-define(OffLineTypeChangeLine, changeLine).        % 玩家换线到新gs中，所以在老gs要先退出
-define(OffLineTypeServerDownKickOut, serverDownKickOut).                % 停服维护
-define(OffLineTypeLoadDataFailed, loadDataFailed).        % 加载次数过多，终止登录

%% 换线确认
-define(ChangeLineAckYes, 0).                % 确定换线
-define(ChangeLineAckNo, 1).                % 放弃本次换线

%%商城消息发起类型
-define(MallSendType_Mall, 0).                % 商城界面
-define(MallSendType_PushBuy, 1).            % 玩家登录时的推送购买

%%签到类型
-define(Sign_Type_Daily_Sign_In, 0). %%签到类型，每日签到
-define(Sign_Type_SevenDay_Sign_In, 1).    %%签到类型，七日签到


-define(Sign_Type_SevenDay_Sign_In_1, 1).    %%第一天签到
-define(Sign_Type_SevenDay_Sign_In_2, 2).    %%第二天签到
-define(Sign_Type_SevenDay_Sign_In_3, 3).    %%第三天签到
-define(Sign_Type_SevenDay_Sign_In_4, 4).    %%第四天签到
-define(Sign_Type_SevenDay_Sign_In_5, 5).    %%第五天签到
-define(Sign_Type_SevenDay_Sign_In_6, 6).    %%第六天签到
-define(Sign_Type_SevenDay_Sign_In_7, 7).    %%第七天签到
-define(Sign_Type_Bind_Phone, 8).            %%绑定手机号


-define(Sign_Type_List, [0, 1, 2, 3, 4, 5, 6, 7]). %%签到的所有类型
%%战斗属性影响类型
-define(CalcTypeAdd, 0).
-define(CalcTypeMult, 1).

%%排行榜类型
-define(TableLevelRankType, 0).
-define(TableGoldRankType, 1).
-define(TableReputationRankType, 2).
%%个性信息类型
-define(PersonalInfoSelf, 0).
-define(PersonalInfoKind, 1).
%% 好友
%-record(recFriendInfo,{
%				   code = 0,									%好友的流水号
%				   name = "",									%好友的名字
%				   roleID = 0,									%好友的角色ID
%				   career = 0,									%好友职业
%				   level = 0,									%好友的等级
%				   vip = 0,										%好友vip等级
%				   closeness = 0,								%好友亲密度
%				   online = 1,									%好友是否在线
%				   friendType = 1,								%好友类型
%                   lastTimeAddLove = 0,                         %上次点赞时间
%				   lastTimeGiveLuckyCoin = 0,					%上次送幸运币时间
%				   lastTimeGainLuckyCoin = 0                    %上次获得幸运币时间
%				   }).


%%记录地图上获得的东西
-record(recMapAward, {
	mapPid :: pid(),
	exp = 0 :: integer(),
	gold = 0 :: integer()
}).

%% 时空裂痕每日次数上限
-define(Rift_EveryDay_Max_Times, 3).
%% 时空裂痕每次进入的间隔时间(30秒)
-define(Rift_Enter_IntervalTime, 30).

%% 玩家现有幸运币
-define(LuckyCoinGainType, 1).
%% 玩家使用幸运币
-define(LuckyCoinUseType, 2).
%% 玩法开启触发条件
-define(WelfareTypeLevel, 0).
-define(WelfareTypeTask, 1).

%%充值环节事件定义
%%-define(RechargeEventOnGettingCilent, 101).	%%收到客户端数据(接着马上给cs看是老订单不)
%%-define(RechargeEventOnSend2LS, 102).	%%新订单发给ls让funcell验证
%%-define(RechargeEventOnLSAck, 103).	%%LS中转回验证结果

%%挖宝误差半径
-define(Range, 10).

-define(ActivatePetFun, 5).
-define(ActivateWakeFun, 18).
-define(ActivatePetEquip, 32).


%%公告类型
-define(SuitRefineLevel_Notice, 1). %%装备强化
-define(GemComposition_Notice, 2).  %%宝石合成
-define(EquipDrop_Notice, 3).        %%掉落神装

%%勇士试炼挑战状态
%%没在挑战
-define(WarriorTrialStateNotChalleng, 0).
%%在挑战中
-define(WarriorTrialStateIsChallenging, 1).
%%挑战成功
-define(WarriorTrialStateSuccess, 2).

%%玩家副本统计
-define(PetHurt, 0).%%宠物伤害
-define(PlayerHurt, 1).%%人物伤害

-define(PetBeHurt, 0).%%宠物被伤害
-define(PlayerBeHurt, 1).%%人物被伤害

-record(rec_stat_hurt, {
	playerHurt = 0,        %%人物攻击伤害
	petHurt = 0,        %%宠物攻击伤害
	mapID = 0,            %%地图ID
	mapPid = 0,            %%地图PID
	petBeHurt = 0,        %%宠物承受伤害
	playerBeHurt = 0    %%人物承受伤害
}).


%%跨服时，玩家要带到cross上的个人数据
-record(rec_crossRoleData, {
	accountID = 0,
	roleID = 0,
	role_list = [],
	gmLevel = 0,
	funcellInfo = undefined,
	platformAccountID = undefined,
	platfromID = undefined,
	roleLevel = 0,
	netPid = 0,
	oldRolePid = 0,
	playerState = 0,
	playerData = undefined,
	transMsg = []    %%中转数据
}).


-record(rec_fullData,{
	base_role,
	coin_list,
	ext_role,
	variant,
	daily_counter,
	equip_redefine,
	package_info,
	props_list,
	item_list,
	skill_list,
	skill_slot,
	title_list,
	awaken_info,
	pet_list,
	pet_equip,
	pet_skill_list,
	fashion_list,
	fashion_slots,
	god_weapon,
	rune_list
}).


%%从跨服带回源服的数据
-record(rec_CrossToNormalData, {
	roleID,
	netPid,
	roleList,
	accountID,
	gMLevel,
	playerCode,
	callBackTuple,
	petInfo,
	funcellInfo,
	plateformAccountID,
	plateformID,
	extendMsg1 = undefined, %% fixme 扩展信息
	extendMsg2 = undefined,
	extendMsg3 = undefined,
	otherMsg = undefined   %% fixme 附加信息，可以用该字段任意拼接自己的元组结构，这样可以安全的处理热更新
}).

%%玩家战斗力

-define(PlayerLvForce, 1).    %%角色等级战斗力
-define(PlayerGoddessForce, 2).    %%角色女神战斗力
-define(PlayerGemForce, 3).    %%角色宝石战斗力
-define(PlayerStrForce, 4).    %%角色强化战斗力
-define(PlayerArtiForce, 5). %%角色神器战斗力
-define(PlayerArtiSkillForce, 6). %%角色神器技能战斗力
-define(PlayerEquipForce, 7). %%角色装备战斗力
-define(PlayerFashionForce, 8).    %%角色时装战斗力
-define(PlayerFashionColForce, 9).    %%角色时装收集战斗力
-define(PlayerTalentForce, 10).%%角色天赋技能战斗力
-define(PlayerGuildSkillForce, 11).%%角色公会技能战斗力
-define(PlayerWingForce, 12).%%角色翅膀战斗力
-define(PlayerRuneForce, 13).%%角色符文战斗力
-define(PlayerMaxForce, 13).


-define(PetAttrForce, 1).    %%宠物属性战斗力
-define(PetBattleForce, 2).    %%宠物助战战斗力
-define(PetEquipForce, 3). %%宠物装备战斗力
-define(PetCastForce, 4). %%宠物洗练战斗力
-define(PetTalentForce, 5). %%宠物天赋技能战斗力
-define(PetRuneForce, 6). %%宠物符文战斗力(包含出战宠物与助战宠物)
-define(PetMaxForce, 6).

%%提示类型
-define(TipsTypeTips, 0).
-define(TipsTypeSyschat, 1).
-define(TipsTypeMarquee, 2).
-define(TipsTypeTrumpet, 3).
-define(TipsTypeMBox, 4).
%%勇者试炼
-define(WarriorTrialSchedule, 1).
-define(WarriorTrialTime, 2).


%女神额外增加的特殊属性
-define(INC_EXP, 1).
-define(INC_ITEM, 2).

%%玩家活跃度
-define(LivenessNormalCopy, 1).
-define(LivenessHeroCopy, 2).
-define(LivenessChallageCopy, 3).

-define(LivenessLoopTask, 4).
-define(LivenessBraveTrain, 5).
-define(LivenessProtectLamb, 6).
-define(LivenessMoneyDungeon, 7).  %% 以前是铸币熔炉，现在改为了金币副本（惊天喵盗团）
-define(LivenessLeaderInvade, 8).
-define(LivenessArena, 9). %%竞技场
%-define(LivenessFationCopy,10). %%阵营战场
-define(LivenessExpCopyMap, 10). %经验副本
-define(LivenessSpeedUp, 11). %港口竞速
-define(LivenessMaterial, 12). %材料副本
-define(LivenessFriendActionPoint, 13). %好友体力
-define(LivenessHijack, 111).
-define(LivenessFightAll, 112).%%战天下
-define(LivenessArmyCopy, 113).%%军团副本
-define(LivenessGuildHome, 114).%%军团驻地活跃
-define(LivenessACLSBattle, 115).%%乱世为王
-define(LivenessConvoy, 116). %护送

-define(Livenessactivate_Artifact_1, 1).%%火器灵激活
-define(Livenessactivate_Artifact_2, 2).%%冰器灵激活
-define(Livenessactivate_Artifact_3, 3).%%雷器灵激活
-define(Livenessactivate_Artifact_4, 4).%%风器灵激活
-define(Livenessactivate_Artifact_5, 5).%%光器灵激活
-define(Livenessactivate_Artifact_6, 6). %暗器灵激活

-define(ProtectLambCopyMapList, [181, 182, 183, 185]).

%% 限制“条件-触发”模块使用的PlayerPropSync
-define(PropForConditionTrigger, [
	{?SerProp_GoblinPayMoneyOnce},
	{?SerProp_GoblinPayMoneyTenTimes},
	{?SerProp_TreasurePayMoneyOnce},
	{?SerProp_TreasurePayMoneyTenTimes}
]).
-define(CheckProp(Prop), case lists:keyfind(Prop, 1, ?PropForConditionTrigger) of false -> erlang:error(badarg); _ ->
	ok end).

-endif.