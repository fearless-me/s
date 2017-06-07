-ifndef(gameMap_hrl).
-define(gameMap_hrl,1).

-include("common/type.hrl").
-include("char.hrl").
-include("pet.hrl").

%%地图信息Ets，对应地图的ID，PID等等信息
-define(MapInfoEts,mapPidInfoEts).

%一个Cell在客户端的大小
-define(CellSize,1.00).

-ifdef(AREA_SYNC_TYPE).
%% 客户端，按照设置的摄像机高度，可以看见30*30格子的范围
%% 服务器按照(30+6)/3=12的方式来设置
%一个Grid行有多少个Cell
-define(MaxGridCellRowNum,12).
%一个Grid列有多少个Cell
-define(MaxGridCellColNum,12).
-else.
%一个Grid行有多少个Cell
-define(MaxGridCellRowNum,30).
%一个Grid列有多少个Cell
-define(MaxGridCellColNum,30).
-endif.

%一个Grid总共有多少个Cell
-define(MaxGridSquareCellNum,(MaxGridCellRowNum * MaxGridCellColNum)).

-define(Client_Server_Max_Deviation,1500).

-define(TalkToNpc_Distance, 5).

%%设置误差范围为15米，以下两个定义是相互搭配的
-define(AllowErrorPosRange,15).
-define(AllowErrorPosRangeSquare,225).

%%基本物件类型
-define(ObjTypeActor,1).
%%玩家
-define(ObjTypePlayer,2).
%%NPC
-define(ObjTypeNPC,3).
%%怪物
-define(ObjTypeMonster,4).
%%采集对象
-define(ObjTypeCollect,5).
%%使用物品
-define(ObjTypeUseItem,6).
%%地上的触发器，如传送点等等
-define(ObjTypeTrigger,7).
%%宠物
-define(ObjTypePet,8).
%%载体
-define(ObjTypeCarrier, 9).

-type obj_type() :: 1 .. 9.


%地图中的复活点
-define(MapObjRelivePt,0).
%地图中的触发器
-define(MapObjTrigger,1).
%地图中的怪物
-define(MapObjMonster,2).
%地图中的NPC
-define(MapObjNpc,3).
%路点
-define(MapObjWayPt,4).
%地图中的采集对象
-define(MapObjCollect, 5).
%地图中的使用物品
-define(MapObjUseItem, 6).

-type map_obj_type():: 0 .. 6.

%具有流水号对象的类型
-define(CodeTypePlayer,1).
-define(CodeTypeNPC,2).
-define(CodeTypeMonster,3).
-define(CodeTypeCollect,4).
-define(CodeTypeUseItem,5).
-define(CodeTypeTeam, 6).
-define(CodeTypePet, 7).
-define(CodeTypeCarrier, 8).

-define(CodeTypeList,[
	?CodeTypePlayer,
	?CodeTypeNPC,
	?CodeTypeMonster,
	?CodeTypeCollect,
	?CodeTypeUseItem,
	?CodeTypeTeam,
	?CodeTypePet,
	?CodeTypeCarrier
]).

-type code_type() :: 1.. 8.

%%================================================
%%单独考虑要进入的目标地图不存在的情况
%%================================================
-define(EnterMapErrorCode_TargetMapNotExist, 0).

%%================================================
%%以下情况是离开了原地图出现的错误，需要进入新的地图
%%================================================
%% 第一次进入副本但没有副本进度（之前没有地图）,需要进入新地图
-define(EnterMapErrorCode_FirstEnterCopyMapButNotSchedule, 1).
%%之前有所在地图，离开了原地图，创建新地图进程失败，需要重新进入原地图
-define(EnterMapErrorCode_CRITIAL, 2).
%%离开地图时，发现该地图实际已经没有自己的相关信息了，可能是重复离开了多次
-define(EnterMapErrorCode_CopyMapNotMsgData,3).
%%队员请求进入一个将要销毁组队副本，由于队员不能创建新副本，所以需要返回一个错误
-define(EnterMapErrorCode_TeamMemberEnterWaitDestoryCopyMap,4).
%%请求进入一个人数已满的军团驻地地图，需要进入原地图
-define(EnterMapErrorCode_EnterGuildHomeMap, 5).

%%================================================
%%以下情况是没有离开原地图出现的错误，不需要进入新的地图
%%================================================
%%组队情况下，进入一个队长还没有创建的副本，之前有所在地图，但还没有离开原地图
-define(EnterMapErrorCode_CopyMapLeaderNotStart, 6).
%%副本进度已经做完了，不能再进入了（还没有离开原地图）
-define(EnterMapErrorCode_CopyMapSchedule,7).
%%副本已经达到最大人数上限了，不能再进入了（还没有离开原地图）
-define(EnterMapErrorCode_CopyMapMaxNum,8).
%%副本有指定的进入时间段，过了进入时间段则不能再进入（还没有离开原地图）
-define(EnterMapErrorCode_CopyMapOutOfEnterTime,9).
%%创建目标地图失败(还没有离开原地图）
-define(EnterMapErrorCode_CopyMapCreateFailed, 10).
%%必须组队才能进入副本(还没有离开原地图）
-define(EnterMapErrorCode_NoTeam, 11).
%%玩家所在的队伍拥有这个副本，但是玩家本身不属于这个副本，不允许进入(在playerScene中有处理)
-define(EnterMapErrorCode_PlayerNoBelongCopyMap, 12).
%%玩家进入一个已经在强制销毁流程中的副本，不允许进入（在playerScene中有处理）
-define(EnterMapErrorCode_CopyMapIsForceDestroy, 13).

%% 游乐场地图子类型，不论主类型是什么，子类型确定。特殊处理地图九宫格和移动等同步规则
-define(MapSubTypePark, 888).

%地图类型
%普通地图
-define(MapTypeNormal,0).
%副本地图
-define(MapTypeCopyMap,1).
%位面地图
-define(MapTypeBitplane,2).
%玩法地图
-define(MapTypeActivity,3).
-type map_type() :: 0 .. 3.

%%地图子类型
%普通
-define(MapSubTypeNormal,0).
%地宫（副本）
-define(MapSubTypeDemonBattle,1).
%时空裂痕
-define(MapSubTypeRift,2).
%切磋位面
-define(MapSubTypeBattleLearn,4).
%%经验副本
-define(MapSubTypeExpCopyMap, 5).
%英雄副本
-define(MapSubTypeHeroCopy,6).
%%混沌战场
-define(MapSubTypeChaos, 7).
%%军团单人副本/或者首领入侵
-define(MapSubTypeGuildOne, 8).
%挑战副本
-define(MapSubTypeChanllengeCopy,9).
%% 护送玩法
-define(MapSubTypeEscort, 11).
%% 黑暗之地
-define(MapSubTypeDarkness, 12).
%% 黑暗之地准备间
-define(MapSubTypeDarknessReady, 13).
%% 军团争霸
-define(MapSubTypeGuildWar, 14).
%% 家族游乐场（原军团驻地）
-define(MapSubTypeGuildFairground, 16).
%% 军团沙盘PVP
-define(MapSubTypeGuildExpedition, 19).
%%经验地图活动
-define(MapSubTypeExpMap, 22).
%%约会地下城
-define(MapSubTypeDate, 24).
%%铸币(副本)
-define(MapSubTypeMint, 1001).  %% 废弃
%%新兵(副本)
-define(MapSubTypeBoot, 1002).
%%星空(副本)
-define(MapSubTypeStar, 1003).
%%藏宝(副本)
-define(MapSubTypeBooty, 1004).
%%多人军团(副本)
-define(MapSubTypeGuild, 1005).
%%灵魂伙伴，情缘副本
-define(MapSubTypeCompanion, 1006).
%%勇士试炼副本
-define(MapSubTypeWarrior, 1007).

%%勇士试炼副本
-define(MapSubTypeMaterial, 1008).
%%金币副本（惊天喵盗团）
-define(MapSubTypeMoneyDungeon, 1009).
%%堆雪人
-define(MapSubTypeSnowman, 1010).
%%灵界活动
-define(MapSubTypeSpiritArea, 1011).
%%灵界活动
-define(MapSubTypePetTerritory, 1012).


%%玩法地图子类型
-define(MapSubTypeFightAll,10).%战天下

%%地宫过了几秒后，就不能再进新成员
-define(MapSubTypeDemonBattleBeforeSecondCanIn,100).



%%地图销毁等待时间,15秒
-define(MapRealDestoryTime,15000).

%%等待客户端发送已经进入地图成功的超时时间，注意此时间一定要小于地图销毁的等待时间，否则会出现BUG
%%即：客户端在切换地图过程中断网，无法发送进入地图成功的消息，此时服务器还是在切换地图中，如果之前的地图要销毁T人就会T不成功
-define(WaitClientSendEnteredMapTime,12000).

-type map_subtype()::?MapSubTypeNormal..?MapSubTypeDemonBattle.
-record(copyMapDemonBattleCnf,{
							   fableCurrentSchedule = 0,%%当前关卡数
							   fableAllSchedule::uint(),%%总关卡数
							   fableMapLevelCoefficient::uint(),%%地图系统（根据队长/单玩家的等级来设置，影响每关的怪物、奖励规则）
							   fableDie::uint(),%%玩家最多总死亡次数
							   fablePreparetimeNum::uint(),%%每关准备战斗时间
							   fablePreparetimeEnd::uint(),%%计算的时刻点
							   fableChallengetimeNum::uint(),%%每关挑战时间上限
							   fableChallengetimeEnd::uint()%%计算的时刻点
							  }).

%%%%%%%%采集物类型%%%%%%%%BEGIN%%%%%%%%%%%%%%%%%%%%%
%%采集物类型定义:港口竞速采集物
-define(GatherType_NeedForSpeed,12).
-define(GatherType_GuildSnowman,13).
%%%%%%%%采集物类型%%%%%%%%END%%%%%%%%%%%%%%%%%%%%%
%已经在运行的地图基础信息
-record(recMapBaseInfo,
{
    code,									%地图的流水号
    id,										%地图的ID
    pid,									%地图的进程ID
    line									%地图的线
}).

%% 怪物追击玩家方向
-record(recMonsterAttackDir,
{
	dir = 0,        % 方向ID，1~8
	monsterCode = 0 % 怪物code
}).

%% 地图区域对象信息
-record(recMapArea, {
    areaID = 0,         %% 区域ID
    codeList = []       %% 对象Code列表
}).

%玩家及怪物同步到地图的信息，以及地图上的NPC等等信息
-record(recMapObject,
{
    code = 0    ::uint(),					%%Actor的流水号
    type = 0    ::obj_type(),				%%类型，如ObjTypePlayer
	mapPid		::pid() | undefined,        %%所在地图的Pid
    mapId = 0   ::uint16(),					%%所在地图ID
    x = 0.0     ::float(),					%%所在地图坐标X
    y = 0.0     ::float(),					%%所在地图坐标Y
    rotW = 0.0  ::float(),					%%旋转坐标W
    name = ""   ::string(),		 			%Actor名字
    id = 0      ::uint16(),					%%玩家的RoleID或者怪物的ID
    pid         ::pid() | undefined,        %%对象（玩家，怪物等等）所在的进程ID
	netPid      ::pid() | undefined,        %%玩家的网络进程
    actionStatus = 0 :: action_status(),	%%动作状态
    status = 0	::uint(),              		%%用位表示的状态标志，由技能与BUFF产生的状态
    level = 1	::uint16(),					%%等级
    career = 0	::career(),					%%职业
    hp = 0		::uint(),					%%HP
    maxHp = 0   ::uint(),                   %%MaxHp
    mp = 0		::uint(),					%%MP
    camp = 0    ::uint(),                   %%阵营关系
    pkMode = 0  ::uint(),                   %%模式
    vip = 0		::uint8(),					%%vip等级 (查询附近好友功能时，添加)
	guild = 0   ::uint64(),                 %%军团id
    moveSpeed = 0.0 ::float(),				%%移动速度
    attackSpeed = 0.0 ::float(),            %%攻击速度
    moveTargetList = [] ::list(),           %%移动位置列表
    moveDir = 0 ::uint8() | [#recMonsterAttackDir{},...],    %%怪物追击玩家方向[#recMonsterAttackDir{}]
    moveRealDir = 0 ::uint8(),            	%%实际移动方向
    ownId = 0   :: uint(),                  %%拥有者ID
    ownPid = 0  :: uint(),                  %%拥有者PID
    ownCode = 0 :: uint(),                  %%拥有者Code
	callPetList = [] :: [#recCallPet{},...],%%宠物以及召唤宠物列表
    killList = [] :: list(),                %%可杀戮人列表
    buffList = [] :: list(),                %%buff列表
    other = []  ::list(),                   %%其他(如果是npc对象，则保存的npc特殊称号)
	teamID = 0 ::uint(),                    %%队伍ID
	groupID = 0 ::uint()                    %%分组ID
}).

%游戏地图物品掉落
-record(recMapDrop,
{
    itemid,									%道具ID
    odd										%几率
}).

%地图中的物件信息
-record(recMapObjData,
{
	id = 0,                                %ID
	name = "",                             %名字
	mapX = 0.0,                            %地图坐标X
	mapY = 0.0,                            %地图坐标Y
	rotW = 0.0 ::float(),				    %%旋转坐标W
	extData,                               %其它数据
	camp = 0,                              %%所属阵营#recSpawnMonster{}默认为0
	groupID = 0 ::uint()                   %所属分组ID
}).

-record(recMapTriggerData,
{
    mapX,                          %地图坐标X
    mapY,                          %地图坐标Y
    name,                          %该触发数据的名字
    id,                            %该触发数据的ID
    volumeType,                    %触发器区域形状，可能是box或者是sphere
    inTriggerName,                 %走入触发区域调用的触发器名称
    inTriggerArgFormat,            %走入触发区域调用触发器的参数格式
    outTriggerName,                %走出触发区域调用的触发器名称
    outTriggerArgFormat,           %走出触发区域调用触发器的参数格式
    inDelayTime,                   %走入触发区域调用触发器的延迟时间
    outDelayTime,                  %走出触发区域调用触发器的延迟时间
    totalTriggerCount,             %总共可触发多少次
    inArgs,                        %走入触发区域调用触发器时的参数
    outArgs,                       %走出触发区域调用触发器时的参数
    triggerArea                    %触发区域
}).

-record(recMapTriggerVolumeBox,
{
    centerX,                %地图坐标X
    centerY,                %地图坐标Y
    width,                  %宽度
    height                  %高度
}).

-record(recMapTriggerVolumeSphere,
{
    centerX,                %地图坐标X
    centerY,                %地图坐标Y
    r                       %半径
}).

-record(recMapWayPt,
{
    x,
    y,
    name,
    id,
    neighborCount,
    neighborIds
}).

%游戏地图配置，主要是从地图文件中读取后生成
-record(recGameMapCfg,
{
    mapID = 0 :: uint16(),					%地图ID(U16)
    maxPlayerNum = 10 :: uint16(),          %设定本地图最大承载人数
    worldPos = {0,0,0},						%地图开始点所在世界坐标
    colCellNum = 0 :: non_neg_integer(),	%地图中的Cell列数量(U16)
    rowCellNum = 0 :: non_neg_integer(),	%地图中的Cell行数量(U16)
    colGridNum = 0 :: non_neg_integer(),	%地图中的Grid列数量(U16)
    rowGridNum = 0 :: non_neg_integer(),	%地图中的Grid行数量(U16)
    cellSize = 0.0,                         %地图中的Cell格式边长
    initX = 0.0,                            %地图初始点
    initY = 0.0,                            %地图初始点
    block = <<>> :: binary(),				%阻挡信息，二进制块，其中0是阻挡，1是非阻挡
    height = <<>> :: binary(),				%高度信息，二进制块
    dropInfo = [] :: list(),				%掉落信息，recMapDrop列表
	mapRelivePt = [],						%地图复活点信息
	mapTrigger = [],						%地图触发器信息
	mapMonster = [],						%地图怪物信息
	mapNpc = [],							%地图Npc信息
	mapWayPt = [],							%地图路点信息
	mapCollect = [],						%地图中的采集信息
	mapUseItem = []							%地图中的使用物品
}).

%%采集对象的采集状态
-record(recCollectState,
{
    code = 0,  								%%采集对象Code
    state = 0,  							%%采集对象状态  0为不可采集  1为可以采集
    lastChangeTime = 0, 					%%最后改变状态的时间
    isNotify = 0  							%%是否可以广播通知，用于采集状态恢复后广播周围玩家标志，0不广播通知，1广播通知
}).

-record(recMapPidInfo,{
	pid,		   
    mapID = 0
}).

-endif.
