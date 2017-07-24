%%%玩家相关定义
-ifndef(player_hrl).
-define(player_hrl,1).

-include("db.hrl").
-include("char.hrl").
-include("modeOpen.hrl").

-export_type([
	dailyType/0,
	daily2TypeS/0,
	daily2TypeC/0,
	sevenDayAim/0
]).

-define(PlayerStateNone,0).								%无，初始状态
-define(PlayerStateWaitLoadRoleList,1).					%等待读取角色列表
-define(PlayerStateLoadRoleListOK,2).					%完成读取角色列表，这个状态可以进行角色的新建与删除操作
-define(PlayerStateLoadRole,3).							%选择某个角色后，读取该角色数据，准备进入游戏
-define(PlayerStateLoadRoleOK,4).                       %读取读取数据完成
-define(PlayerStateRun,5).								%游戏中
-define(PlayerStateSaveAndLogout,6).					%下线保存
-define(PlayerStateKick,7).								%被踢
-define(PlayerStateChangeLine,8).						%玩家申请换线
-define(PlayerStateChangeLineAtNewLine,9).				%玩家申请换线(新服处理)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DailyType_Everyday 日常类型定义 -- 日常类型定义 -- 日常类型定义
-define(PlayerEveryDay_Rift, 1).        %%日常时空裂痕
-define(PlayerEveryDay_Escort_Solo, 2). %%日常单人护送
-define(PlayerEveryDay_Escort_Team, 3). %%日常多人护送
-define(PlayerEveryDay_FreshMS, 4).     %%刷新神秘商店次数
-define(PlayerEveryDay_GuildContribute, 5).     %%今日为军团贡献的资源
-define(PlayerEveryDay_Pebble, 6).     %%今日黑暗之地获得的黑暗硬币数量

%%玩家的每日计数器类型，最大可占用10位的长度
%%每日计数器的高10位为类型，低54位为ID，如副本的地图ID，任务ID，道具ID, 签到类型等等
-define(DailyType_Min,1).
-define(DailyType_EnterCopyMap,1).			%%每日进副本
-define(DailyType_EnterCopyMapGroup,2).		%%每日进副本组
-define(DailyType_UseItem,3).          	 	%%每日使用道具组的次数
-define(DailyType_ResourceExchange,4).  	%%每日使用资源兑换的次数
-define(DailyType_SignIn,5).            	%%每日签到
-define(DailyType_Everyday, 6).         	%%日常
-define(DailyType_Guild_GodBless, 7). 		%%家族系统-女神祈福-当日祈福计数
-define(DailyType_PetTerritorySearch, 8).	%% 新版骑宠领地，当日搜索次数
-define(DailyType_GuildRideUse, 9). 		%% 家族-游乐场-每日使用设施次数
-define(DailyType_MoneyTree, 10). 	        %% 摇钱树
-define(DailyType_WildBossEveryDayMust, 11).%%野外boss收益次数（保底奖励）
-define(DailyType_GuildDonate, 12).			%%军团每日捐献
-define(DailyType_BuyItemNumber, 13).		%%每日购买某种道具次数
-define(DailyType_EnterCopyMap_Vip, 14). 	%% 爵位进入副本的优惠次数，优先使用优惠次数
-define(DailyType_HDBattleGetHonor, 15). 	%% 混沌战场每日获得的荣誉值
-define(DailyType_GuildSupplication, 16). 	%% 家族系统-碎片祈愿
-define(DailyType_AutoRecommend, 17). 		%% 推送推荐好友计数
-define(DailyType_DanceExp, 18). 			%% 跳舞累积的经验
-define(DailyType_CollectItemTimes, 19). 	%% 每日采集指定对象的次数
-define(DailyType_WorldBossInSpire, 20).	%% 首领入侵鼓舞次数
-define(DailyType_SideTaskFlag, 21).        %% 支线任务
-define(DailyType_Login, 22).				%% 每日登录计数（如果在线状态下跨越凌晨4点则置为1）
-define(DailyType_MonthCard, 23).			%% 月卡到期提醒
-define(DailyType_WarriorTrial, 24).		%% 勇士试炼每日进度
-define(DailyType_MallDaily, 25).			%% 商城玩家每日限购
-define(DailyType_GuildRideGetContribute, 26).			%% 家族-游乐场-每日通过设施获得的贡献
-define(DailyType_Ladder1v1, 27).			%% 天梯1v1类型的每日计数
-define(DailyType_HornNum, 28).             %% 小喇叭聊天每日计数
-define(DailyType_LoopTaskNum, 29).			%% 环任务每日计数
-define(DailyType_GainReport, 30).			%% ===============[已废弃，可改名占用]=============
-define(DailyType_AddPraise4Marror, 31). 	%% 给王者雕像点赞
-define(DailyType_PetPvePurc,		32).	%% 宠物远征体力购买计数器
-define(DailyType_Lottery,		33).	    %% 占卜，抽奖
-define(DailyType_PetPvpPurc,		34).	%% 宠物抢夺令购买计数器
-define(DailyType_Answer,		35).		%% 每天答题数
-define(DailyType_ChatCount,	36).		%% 玩家每日聊天次数
-define(DailyType_MallDailySend, 37).		%% 商城玩家每日限赠送上限
-define(DailyType_BroadCastKv,	38).		%% 每天杀戮值广播次数
-define(DailyType_GuildBuff,	39).		%% 军团BUFF领取次数
-define(DailyType_KillMonsterExp,    40).	%% 每日杀怪经验
-define(DailyType_HolidayTask,		41).	%%节日活动计算器id = 1 春节活动
-define(DailyType_LimitSalesBuy,	42).	%%限时购买限购次数
-define(DailyType_CrosRewardNum,	43).	%%每天领奖次数
-define(DailyType_Recharge, 80).			%% 玩家充值类型的每日计数
-define(DailyType_GuildExpeditionEveryDayReward, 81).%% 沙盘PVP每日奖励
-define(DailyType_LotteryForTowerID, 82).%% 金宝塔奖励池ID
-define(DailyType_MarriageTask, 83).	%% 情缘任务计数
-define(DailyType_PetTaskRefresh, 84).	%% ===============[已废弃，可改名占用]=============
-define(DailyType_ActiveValue, 85).         	%%活跃度
-define(DailyType_GUILD_HAD_DRINK_BENIFIT_INDEX, 86).   %%===============[已废弃，可改名占用]=============
-define(DailyType_GUILD_WINEBOTTLE_INDEX, 87).         	%%===============[已废弃，可改名占用]=============
-define(DailyType_MarriageFastrack, 88).	%% ===============[已废弃，可改名占用]=============
-define(DailyType_SosNumber,89).	%% ===============[已废弃，可改名占用]=============
-define(DailyType_WildBossEveryDay,90).	%% 野外boss收益次数
-define(DailyType_EXP_MAP_EFFECT_TIME,91).	%% 经验地图有效时间
-define(DailyType_GOBLIN_FREE,92).			%% 宝藏系统:哥布林免费抽每日计数
-define(DailyType_TREASURE_FREE,93).			%% 宝藏系统:稀世宝藏免费抽每日计数
-define(DailyType_GOBLIN_FREE_LAST_SEC,94).	%% 宝藏系统：哥布林免费抽冷却时间计数
-define(DailyType_TREASURE_FREE_LAST_SEC, 95).  %% 宝藏系统：稀世宝藏免费抽冷却时间计数
-define(DailyType_Friend_Action_Point_Gain, 96).  %% ===============[已废弃，可改名占用]=============
-define(DailyType_Action_Piont_Buy_Number, 97).  %% 体力系统，每日体力购买次数，在cfg_trigger等表中作为配置值使用
-define(DailyType_RedEnvelope_SendNumber, 98).  %% 红包系统发
-define(DailyType_RedEnvelope_RobNumber, 99).  %% 红包系统抢
-define(DailyType_Friend2_Action_Point_Give, 100).   %% 新版好友系统：每日赠送体力计数
-define(DailyType_Friend2_Action_Point_Gain, 101).   %% 新版好友系统：每日领取体力计数
-define(DailyType_Friend2_Like, 102).                %% 新版好友系统：每日点赞次数（与?Daily2Type_S_Friend2Like不同的是，这里是没有指定对象的总次数）
-define(DailyType_Friend2_BeLike, 103).              %% ===============[已废弃，可改名占用]=============
-define(DailyType_Date_Link, 104).                   %% 约会地下城之夺秒消除：每日参与活动的次数
-define(DailyType_NeedForSpeedJoinNumber, 105).    	 %% 港口竞速参加次数
-define(DailyType_BuyCopyMap_Number,106).			%%每日购买进副本次数
-define(DailyType_BuyCopyMapGroup_Number,107).		%%每日购买进副本组次数
-define(DailyType_Date_PushBox,108).		%%约会地下城之推箱子：每日参与活动的次数
-define(DailyType_Date_PoolParty,109).		%%约会地下城之泳池派对：每日参与活动的次数
-define(DailyType_Date_FindTreasure,110).		%%约会地下城之寻找宝箱：每日参与活动的次数
-define(DailyType_Home_PetFarming,111).		%%家园，宠物养殖
-define(DailyType_Home_PutPetFarmingTime,112).		%%家园，宠物养殖
-define(DailyType_Guild_Boss_BuffTime,113).		%%家族BOSS 购买 BUFF次数
-define(DailyType_Max,113).

-type dailyType() :: ?DailyType_Min .. ?DailyType_Max.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 军团贡献点来源定义
-define(GuildSupplies_CopyMap, 1).
-define(GuildSupplies_Task, 2).
-define(GuildSupplies_GoldDonate, 3).
-define(GuildSupplies_DiamondDonate, 4).
-define(GuildSupplies_GuildHome, 5).
-define(GuildSupplies_GodBless, 6).	%% 女神祈福
-define(GuildSupplies_SnowmanDonate, 7).	%% 堆雪人活动材料捐献
-define(GuildSupplies_UseItem, 9).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-define(ClockOffTime, 1).		% 下线同样计时
-define(ClockNotOffTime, 2).	% 下线不计时

%% 玩家计时器定义，范围1~1024
-define(ClockType_Min, 1).

-define(ClockType_ExpInDan, 1).					%经验丹类型
-define(ClockType_CompanionCD, 2).				%原灵魂伙伴删除，可占用
-define(ClockType_WingRegenerationCD, 3).		%翅膀回血CD
-define(ClockType_LoginBroadcastCD, 4).			%登录公告CD

-define(ClockType_Max, 5).
-type clockType() :: ?ClockType_Min .. ?ClockType_Max.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-define(GuildTaskType_Collect, 1).      % 军团采集任务
-define(GuildTaskType_KillMonster, 2).  % 军团杀怪任务
-define(GuildTaskType_KillPlayer, 3).   % 军团杀人任务
-define(GuildTaskType_Dead, 4).         % 军团被杀任务

%%请求对方坐标用于传送
-define(RequestTargetPlayerPos_GMWrapTo,1).


-define(PlayerTCPWaitReconnectMicroSecond,1*60*1000).						%%玩家网络被断(TCP离线)后等待重连的时间上限1分钟
%%玩家队伍类型
-define(PlayerTeamTypeMin, 0).%%队伍类型最小值
-define(PlayerTeamTypeNormal, 0).%%普通队伍
-define(PlayerTeamTypeGuildCopy, 1).%%军团副本队伍（服务器逻辑去删除和创建,只在服务器内部使用，不可换队长）
-define(PlayerTeamTypeMax, 1).%%队伍类型最大值

%% 符文保存类型定义
-define(RuneSaveType_Insert, 0).
-define(RuneSaveType_UpdateAll, 1).
-define(RuneSaveType_UpdateBase, 2).
-define(RuneSaveType_UpdateProp, 3).
-define(RuneSaveType_Delete, 4).

%地图位置
-record(recMapPos,{
	mapid :: non_neg_integer(),
	x :: float(),
	y :: float()
}).

%% 玩家请求进入地图临时表
-record(recPlayerEEMap, {
	targetMapID = 0,
	targetMapPID = undefined,
	targetX = 0.0,
	targetY = 0.0,
	isRequireLeaveMap = true,
	enterGuildFairgroundID = 0
}).

%% 请求进入场景
-record(recRequsetEnterMap, {
	code = 0 ::uint(),  % 玩家code
	roleID = 0 ::uint(), % 玩家roleID
	roleLevel = 0::uint(),%玩家等级
	rolePID ::pid(), % 玩家所在的进程ID
	isFirstEnterMap = false, % 是否第一次进入游戏
	isRequireLeaveMap = true, %%是否需要走离开地图的流程，如果是在之前切换地图失败，可能就不需要再走离开地图的流程了
	oldMapID = 0::uint(), % 玩家当前所在地图ID
	oldMapPID::pid(),   % 玩家当前所在地图pid
	targetLine = 0::uint(), %目标线路
	targetMapID = 0 ::uint(), % 目标的地图ID
	targetMapPID::pid(), % 目标的地图PIDgetNearPlayerPid
	targetX = 0.0::float(), % 目标点X
	targetY = 0.0::float(), % 目标点Y
	teamID = 0 ::uint(), % 队伍ID
	teamLeaderRoleID = 0 ::uint(), % 队长的roleid
	petCodeList = [], % 宠物列表
	guildID = 0,		  % 军团ID(只有军团副本才>0)
	enterGuildFairgroundID = 0    % 请求进入家族游乐场，这个是要进入的游乐场家族ID
}).

-record(recEnterMap,{
	pid :: pid(),									%%玩家或者怪物所在进程的PID
	code = 0 :: uint(),							%%Code，如果为玩家则为玩家Code，如果为怪物则为怪物Code
	id  = 0 :: uint(),								%%ID，如果为玩家则为玩家RoleID，如果为怪物则为怪物的数据ID
	mapId = 0 :: uint16(),							%%需要进入的地图ID
	camp = 0 :: uint8(),                           %%玩家或者怪物阵营
	x = 0.0 :: float(),							%%需要进入地图的X坐标
	y = 0.0 :: float(),							%%需要进入地图的Y坐标
	other = [] :: list()                           %%需要进入地图的扩展参数,目前只有一个参数为宠物信息
}).

-record(enterMapInfo,{
	mapid = 0,                             %%地图ID
	mapType = 0,							%%地图类型
	x = 0,                                 %%所在Cell X坐标
	y = 0,                                 %%所在Cell Y坐标
	mapPlayerEts,							%%所在地图的玩家信息Ets表
	mapNpcEts,								%%所在地图的NPC信息ETS表
	mapMonsterEts,							%%所在地图的怪物信息ETS表
	mapPetEts,                             %%所在地图的宠物信息ETS表
	mapPid,                                %%地图进程ID
	mapLine = 0,                           %%地图线号
	mapCollectEts,							%%所在地图的采集对象信息ETS表
	mapUseItemEts,							%%所在地图的使用物品信息ETS表
	mapScreenEts							%%所在地图的同屏策略表(只针对玩家)
}).

%% 分组中的玩家信息
-record(recGroupPlayerInfo, {
	roleCode = 0,
	rolePID = 0,
	mapID = 0,
	mapPID = 0,
	playerEts = 0
}).

-record(recVoiceInfo, {
	key = 0,                    %%语音key
	time = 0,                   %%存入时间
	count = 0,                  %%总数
	voiceList = []              %%数据列表[#recVoice{}]
}).

-record(recVoice, {
	index,
	value
}).

-record(recKillMonsterDrop, {
	equipDropType,			%%物品掉落类型
	equipDropList,			%%掉落装备ID的列表
	itemDropID,				%%掉落普通物品的ID
	itemDropOdd,			%%普通物品掉落几率
	monsterID,				%%怪物ID
	monsterLevel, 			%%怪物等级
	teamMemberNum, 			%%队伍成员数
	mapPid					%% 掉落地图pid，用于判断是否为助战
}).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 双角色相关的每日计数 begin

%% 单向计数类型 Single
%% 对于每个角色来说，另一个角色ID只是该计数器类型的一个关联值
%% 例如：A每天可以对B做产生行为T，B同样也可以对A产生行为T，该行为需要计数
%%      那么，对于A来说，计数器就是roleID_A(A),roleID_B(B),dailyType(T)
%%           对于B来说，计数器就是roleID_A(B),roleID_B(A),dailyType(T)
%%      这两个计数器是相互独立不受影响的
-define(Daily2Type_S_Min,                             0).
-define(Daily2Type_S_Friend2GiveAP,                   0).   %% 每日赠送体力次数
-define(Daily2Type_S_Friend2GainAP,                   1).   %% 每日接受体力次数
-define(Daily2Type_S_Friend2Like,                     2).   %% 每日点赞次数
-define(Daily2Type_S_RedEnvelope,                     3).   %% 每日向好友赠送红包次数
-define(Daily2Type_S_GuildSupplication,               4).   %% 每日向家族成员赠送碎片次数
-define(Daily2Type_S_Max,                             4).
-type daily2TypeS() :: ?Daily2Type_S_Min .. ?Daily2Type_S_Max.

%% 共有计数类型 Common 不能热更
%% 可能存在着多用户公用一个计数器的情况，与单项计数类型分开处理便于优化
%% 例如：A每天可以和B一起产生行为T，该行为需要计数，假设A值小于B值
%%      那么，对于A来说，计数器就是roleID_A(A),roleID_B(B),dailyType(T)
%%           对于B来说，计数器也是roleID_A(A),roleID_B(B),dailyType(T)
%%      由于是共有行为，所以以较小roleID作为第一键值，表示同一行为
-define(Daily2Type_C_Min,                             10000).
-define(Daily2Type_C_AddClosenessFromDate,            10000).   %% 每日从约会地下城中获取的亲密度计数
-define(Daily2Type_C_AddClosenessFromKillMonster,     10001).   %% 每日夫妻组队杀怪获取的亲密度计数
-define(Daily2Type_C_AddClosenessFromMarriageTask,    10002).   %% 每日完成情缘任务获取的亲密度计数
-define(Daily2Type_C_AddFriendliness,                 10003).   %% 每日增加的友好度，用于总体控制（子项则有可能是公共计数也有可能是单向计数）
-define(Daily2Type_C_FristChat,                       10004).   %% 每日第一次与在线好友聊天计数
-define(Daily2Type_C_TeamCopyMap,                     10005).   %% 每日第一次与好友组队通关副本计数
-define(Daily2Type_C_Max,                             10005).
-type daily2TypeC() :: ?Daily2Type_C_Min .. ?Daily2Type_C_Max.

%% 双角色相关的每日计数 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 七日目标 目标类型定义 begin

-define(SevenDayAim_CopyMap,		1).		%% 完成指定副本 ?SerProp_SevenDayAim_CopyMap								对应配置格式===>	[地图ID]
-define(SevenDayAim_WarriorTrial,	2).		%% 勇者荣耀通过第N层 ?SerProp_SevenDayAim_WarriorTrial						对应配置格式===>	[层数]
-define(SevenDayAim_ProtectGod,		3).		%% 守护女神通过第N波 ?SerProp_SevenDayAim_ProtectGod						对应配置格式===>	[波数]
-define(SevenDayAim_Material,		4).		%% 材料副本/元素保卫战通过指定地图ID ?SerProp_SevenDayAim_Material			对应配置格式===>	[地图ID]
-define(SevenDayAim_RoleLevel,		101).	%% 角色达到指定等级（客户端本地获取）											对应配置格式===>	[角色等级]
-define(SevenDayAim_PetCount,		102).	%% 指定品质（等于）的骑宠达到指定数量（客户端本地获取）							对应配置格式===>	[骑宠品质, 骑宠数量] 品质为-1时表示不限品质
-define(SevenDayAim_FashionCount,	103).	%% 拥有时装达到指定数量 ?SerProp_SevenDayAim_FashionCount					对应配置格式===>	[时装数量]
-define(SevenDayAim_Force,			104).	%% 战力达到指定数量 ?SerProp_PlayerHistoryForce								对应配置格式===>	[战力值]
-define(SevenDayAim_Ranking,		105).	%% 竞技场排名达到前N rec_ladder_1v1.rankMin									对应配置格式===>	[排名]
-define(SevenDayAim_EquipQuality,	106).	%% 指定品质（等于）的装备达到指定数量 ?SerProp_SevenDayAim_EquipQuality		对应配置格式===>	[装备品质, 装备数量] 品质为-1时表示不限品质
-define(SevenDayAim_EquipStar,		201).	%% 满足星级要求（大于等于）的装备（槽位）达到指定数量（客户端本地获取）				对应配置格式===>	[星级要求, 装备（槽位）数量]
-define(SevenDayAim_EquipRefine,	202).	%% 满足精炼要求（大于等于）的装备（槽位）达到指定数量（客户端本地获取）				对应配置格式===>	[精炼要求, 装备（槽位）数量]
-define(SevenDayAim_GemLevel,		203).	%% 满足等级要求（大于等于）的纹章镶嵌达到指定数量（纹章系统重新开发中，此处暂不支持）
-define(SevenDayAim_GemMaster,		204).	%% 满足等级要求（大于等于）的纹章大师达到指定数量（纹章系统重新开发中，此处暂不支持）
-define(SevenDayAim_WingLevel,		205).	%% 翅膀达到指定等级（客户端本地获取）											对应配置格式===>	[翅膀等级]
-define(SevenDayAim_GodWeapon,		206).	%% 满足等级要求（大于等于）的器灵达到指定数量（客户端本地获取）						对应配置格式===>	[等级要求, 器灵数量]
-define(SevenDayAim_PetStar,		207).	%% 满足星级要求（大于等于）的骑宠达到指定数量（客户端本地获取）						对应配置格式===>	[星级要求, 骑宠数量] 实际星级为面板显示星级-1
-define(SevenDayAim_PetTurn,		208).	%% 满足转生要求（大于等于）的骑宠达到指定数量（客户端本地获取）						对应配置格式===>	[转生要求, 骑宠数量]
-define(SevenDayAim_PetAdd,			209).	%% 满足提升要求（大于等于）的骑宠达到指定数量 ?SerProp_SevenDayAim_PetAdd		对应配置格式===>	[提升（次数）要求, 骑宠数量]
-type sevenDayAim() :: uint().	%% 策划要求上述数值不连续，故用uint()代替

-define(SevenDayAim_ALL, [
	?SevenDayAim_CopyMap,
	?SevenDayAim_WarriorTrial,
	?SevenDayAim_ProtectGod,
	?SevenDayAim_Material,
	?SevenDayAim_RoleLevel,
	?SevenDayAim_PetCount,
	?SevenDayAim_FashionCount,
	?SevenDayAim_Force,
	?SevenDayAim_Ranking,
	?SevenDayAim_EquipQuality,
	?SevenDayAim_EquipStar,
	?SevenDayAim_EquipRefine,
	%?SevenDayAim_GemLevel,
	%?SevenDayAim_GemMaster,
	?SevenDayAim_WingLevel,
	?SevenDayAim_GodWeapon,
	?SevenDayAim_PetStar,
	?SevenDayAim_PetTurn,
	?SevenDayAim_PetAdd
]).

%% 七日目标 目标类型定义 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


-endif.
