%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20170220
%%%-------------------------------------------------------------------
-module(playerGuildSnowman).
-author("meitianyang").

-include("playerPrivate.hrl").
-include("../guild/guildPrivate.hrl").
-include("../activity/gameactivity/snowman/acSnowmanPrivate.hrl").

%% 客户端消息接口
-export([
    checkSnowman/0,	%% 检查雪人状态
	donate/1		%% 捐献材料

	% 20170223 废弃客户端主动请求领奖，改为活动结算时主动发奖
	%reward/1		%% 领取雪人礼盒
]).

%% 模块调用接口
-export([
	error/3,						%% 便于统一打印errorcode以调试
    init/0,							%% 上线初始化
	init_EnterFamilyMapOrOnline/1,	%% 进入家族地图或者上线时同步雪人数量及礼盒状态

	beginNotice/0,		%% 开始提示
	enterTry/1,			%% 尝试进入活动地图
	enterTryAck/1,		%% 进入活动地图
	gatherSuccess/1,	%% 采集成功
	donateAck/1,		%% 捐赠反馈

	snow_settle/1,
	convertCoin/1,
	convertItem/1,

	gmNext/0,			%% GM命令进入下一阶段
	gmGetRes/1,         %% GM命令获得携带材料
	gmCheckMonster/0
]).

%%% ====================================================================
%%% MSG functions
%%% ====================================================================

convertCoin({CoinType, CoinNumber})->
	PLog = #recPLogTSMoney{
		reason = ?CoinSourceGuildSnowmanDonate,
		param = 0,
		target = ?PLogTS_PlayerSelf,
		source = ?PLogTS_Guild
	},
	playerMoney:addCoin(CoinType, CoinNumber, PLog),
	ok.

convertItem({ItemID,ItemCount})->
	PLog = #recPLogTSItem{
		old         = 0 ,
		new         = ItemCount ,
		change      = ItemCount ,
		target      = ?PLogTS_PlayerSelf ,
		source      = ?PLogTS_Snow ,
		gold        = 0,
		goldtype    = 0,
		changReason = ?ItemSourceGuildSnowman,
		reasonParam = 0
	},
	playerPackage:addGoodsAndMail(ItemID, ItemCount, false, 0, PLog),
	ok.

%% 在线玩家直接发奖，否则邮件
snow_settle({RoleID, Title, Content, ItemReal, CoinReal}) ->
	case playerState:getRoleID() of
		RoleID ->
			%% 先得钱
			FC =
				fun({CoinType, CoinNum}) ->
					playerMoney:addCoin(CoinType, CoinNum,
						#recPLogTSMoney{reason=?CoinSourceGuildSnowmanSettle,param=0,target=?PLogTS_PlayerSelf,source=?PLogTS_Snow})
				end,
			lists:foreach(FC, CoinReal),

			%% 再发道具
			FI =
				fun({ItemID, ItemCount}) ->
					PLog = #recPLogTSItem{
						old         = 0 ,
						new         = ItemCount ,
						change      = ItemCount ,
						target      = ?PLogTS_PlayerSelf ,
						source      = ?PLogTS_Snow ,
						gold        = 0,
						goldtype    = 0,
						changReason = ?ItemSourceGuildSnowman,
						reasonParam = 0
					},
					playerPackage:addGoodsAndMail(ItemID, ItemCount, true, 0, PLog)
				end,
			lists:foreach(FI, ItemReal),
			ok;
		RoleID2 ->
			%% 需要邮件
			?ERROR_OUT("system error roleid=~p,~p, realroleid=~p", [RoleID, self(), RoleID2]),
			acSnowmanLogic:sendSnowSettle(false, RoleID, Title, Content, ItemReal),
			acSnowmanLogic:sendSnowSettle(true, RoleID, Title, Content, CoinReal)
	end,
	ok.

%%% --------------------------------------------------------------------
%% 检查雪人状态
-spec checkSnowman() -> ok.
checkSnowman() ->
	RoleID = playerState:getRoleID(),
	GuildID = playerState:getGuildID(),
	?DEBUG_OUT("[DebugForSnowman] checkSnowman RoleID:~p GuildID:~p", [RoleID, GuildID]),
	%% 1. 验证是否加入家族
	case GuildID of
		0 ->
			error(?ErrorCode_GuildSnowmanNoFamily, [], ?LINE);	%% 没有加入家族，无法操作
		_ ->
			%% 2.验证是否处于目标地图
			case isInMap() of
				false ->
					skip;	%% 不在该地图忽略请求
				_ ->
					%% 3.向活动进程请求数据
					core:sendMsgToActivity(?ActivityType_Snowman, snowman_checkSnowman, RoleID)
			end
	end,
	ok.

%%% --------------------------------------------------------------------
%% 捐献材料
-spec donate({ResID::uint32(), SnowmanID::uint32()}) -> ok.
donate({ResID, SnowmanID}) ->
	RoleID = playerState:getRoleID(),
	GuildID = playerState:getGuildID(),
	?DEBUG_OUT("[DebugForSnowman] donate RoleID:~p ResID:~p SnowmanID:~p GuildID:~p", [RoleID, ResID, SnowmanID, GuildID]),
	%% 1. 验证是否加入家族
	case GuildID of
		0 ->
			error(?ErrorCode_GuildSnowmanNoFamily, [], ?LINE);	%% 没有加入家族，无法操作
		_ ->
			%% 2.验证是否处于目标地图
			case isInMap() of
				false ->
					skip;	%% 不在该地图忽略请求
				_ ->
					%% 3.验证非0材料ID是否有效
					case ResID of
						0 ->
							%% 4.向活动进程请求数据
							core:sendMsgToActivity(?ActivityType_Snowman, snowman_donate, {RoleID, ResID, SnowmanID});
						_ ->
							case acSnowmanState:configSnowman(ResID) of
								#guildsnowmanCfg{} ->
									%% 4.向活动进程请求数据
									core:sendMsgToActivity(?ActivityType_Snowman, snowman_donate, {RoleID, ResID, SnowmanID});
								_ ->
									?ERROR_OUT("donate can not find ResID:~p from cfg_guildsnowman", [ResID])
							end
					end
			end
	end,
	ok.

%%% --------------------------------------------------------------------
%% 领取雪人礼盒
% 20170223 废弃客户端主动请求领奖，改为活动结算时主动发奖
%-spec reward(ID::uint32()) -> ok.
%reward(ID) ->
%	RoleID = playerState:getRoleID(),
%	GuildID = playerState:getGuildID(),
%	?DEBUG_OUT("[DebugForSnowman] reward RoleID:~p ID:~p GuildID:~p", [RoleID, ID, GuildID]),
%	%% 1. 验证是否加入家族
%	case GuildID of
%		0 ->
%			error(?ErrorCode_GuildSnowmanNoFamily, [], ?LINE);	%% 没有加入家族，无法操作
%		_ ->
%			%% 2.验证雪人是否存在
%			Count = acSnowmanState:getSnowmanNormal(GuildID),
%			case ID =< Count of
%				false ->
%					error(?ErrorCode_GuildSnowmanRewardNoSnowman, [], ?LINE);	%% 该家族中不存在对应的完整雪人
%				_ ->
%					%% 3.检查是否已经领过
%					case acSnowmanState:getSnowmanGift(RoleID, ID) of
%						true ->
%							error(?ErrorCode_GuildSnowmanRewardAlreadyReward, [], ?LINE);	%% 已领取该雪人的礼盒
%						_ ->
%							%% 4.更新状态
%							acSnowmanState:setSnowGift(RoleID, true, ID),
%							%% 5.发放道具
%							ItemID = acSnowmanState:configGift(),
%							ItemCountOld = playerPackage:getGoodsNumByID(?Item_Location_Bag, ItemID, true),
%							Plog =
%								#recPLogTSItem{
%									old = ItemCountOld,
%									new = ItemCountOld + 1,
%									change = 1,
%									target = ?PLogTS_PlayerSelf,
%									source = ?PLogTS_Guild,
%									gold = 0,
%									goldtype = 0,
%									changReason = ?ItemSourceGuildSnowman,
%									reasonParam = 0
%								},
%							playerPackage:addGoodsAndMail(ItemID, 1, true, 0, Plog),
%							%% 6.同步雪人数量及礼盒状态
%							ListMark = acSnowmanState:getSnowmanGift(RoleID),
%							playerMsg:sendNetMsg(
%								#pk_GS2U_Guild_SnowmanCompleteCount_Sync{
%									count = Count,
%									listMark = ListMark
%								}
%							)
%					end
%			end
%	end,
%	ok.

%%% ====================================================================
%%% API functions
%%% ====================================================================

%%% --------------------------------------------------------------------
%% 上线初始化
-spec error(ErrorCode::uint32(), Param::list(), Line::uint32()) -> ok.
error(ErrorCode, Param, Line) ->
	_RoleID = playerState:getRoleID(),
	_GuildID = playerState:getGuildID(),
	?DEBUG_OUT("[DebugForSnowman] RoleID:~p GuildID:~p ErrorCode:~p Line:~p Param:~p", [_RoleID, _GuildID, ErrorCode, Line, Param]),
	playerMsg:sendErrorCodeMsg(ErrorCode, Param).

%%% --------------------------------------------------------------------
%% 上线初始化
-spec init() -> ok.
init() ->
	init_EnterFamilyMapOrOnline(?GuildFairgroundMapID),
    ok.

%%% --------------------------------------------------------------------
%% 上线或进入家族驻地时同步雪人数量及礼盒状态
-spec init_EnterFamilyMapOrOnline(MapId::uint32()) -> ok.
init_EnterFamilyMapOrOnline(MapId) when MapId =:= ?GuildFairgroundMapID ->
	RoleID = playerState:getRoleID(),
	GuildID = playerState:getGuildID(),
	?DEBUG_OUT("[DebugForSnowman] init_EnterFamilyMapOrOnline RoleID:~p GuildID:~p", [RoleID, GuildID]),
	Count = acSnowmanState:getSnowmanNormal(GuildID),
	ListMark = acSnowmanState:getSnowmanGift(RoleID),
	playerMsg:sendNetMsg(
		#pk_GS2U_Guild_SnowmanCompleteCount_Sync{
			count = Count,
			listMark = ListMark
		}
	),
	ok;
init_EnterFamilyMapOrOnline(_) ->
	ok.

%%% --------------------------------------------------------------------
%% 开始提示
-spec beginNotice() -> ok.
beginNotice() ->
	case playerState:getGuildID() of
		0 ->
			skip;
		_ ->
			case isInMap() of
				true ->
					skip;
				_ ->
					playerMsg:sendNetMsg(#pk_GS2U_Guild_SnowmanBegin_Sync{})
			end
	end,
	ok.

%%% --------------------------------------------------------------------
%% 尝试进入活动地图
-spec enterTry(IsGM::boolean()) -> ok.
enterTry(IsGM) ->
	RoleID = playerState:getRoleID(),
	GuildID = playerState:getGuildID(),
	?DEBUG_OUT("[DebugForSnowman] enterTry RoleID:~p GuildID:~p IsGM:~p", [RoleID, GuildID, IsGM]),
	%% 1.验证是否加入家族
	case GuildID of
		0 ->
			error(?ErrorCode_GuildSnowmanEnterNoFamily, [], ?LINE);	%% 没有加入家族，无法操作
		_ ->
			%% 2.验证是否已经处于地图
			case isInMap() of
				true ->
					skip;
				_ ->
					%% 3.发送消息给活动进程
					core:sendMsgToActivity(?ActivityType_Snowman, snowman_enterTry, {RoleID, IsGM})
			end
	end,
	ok.

%%% --------------------------------------------------------------------
%% GM命令进入下一活动阶段
-spec gmNext() -> ok.
gmNext() ->
	RoleID = playerState:getRoleID(),
	GuildID = playerState:getGuildID(),
	?DEBUG_OUT("[DebugForSnowman] gmNext RoleID:~p GuildID:~p", [RoleID, GuildID]),
	%% 1.验证是否加入家族
	case GuildID of
		0 ->
			error(?ErrorCode_GuildSnowmanEnterNoFamily, [], ?LINE);	%% 没有加入家族，无法操作
		_ ->
			%% 2.验证是否已经处于地图
			case isInMap() of
				false ->
					skip;
				_ ->
					%% 3.发送消息给活动进程
					core:sendMsgToActivity(?ActivityType_Snowman, snowman_gmNext, RoleID)
			end
	end,
	ok.

%%% --------------------------------------------------------------------
%% GM命令获得携带材料
-spec gmGetRes({ResID::uint32(), Count::uint32()}) -> ok.
gmGetRes({ResID, Count}) when Count > 0 ->
	RoleID = playerState:getRoleID(),
	GuildID = playerState:getGuildID(),
	?DEBUG_OUT("[DebugForSnowman] gmGetRes RoleID:~p GuildID:~p ResID:~p Count:~p", [RoleID, GuildID, ResID, Count]),
	%% 1.验证是否加入家族
	case GuildID of
		0 ->
			error(?ErrorCode_GuildSnowmanEnterNoFamily, [], ?LINE);	%% 没有加入家族，无法操作
		_ ->
			%% 2.验证是否已经处于地图
			case isInMap() of
				false ->
					skip;
				_ ->
					%% 3.发送消息给活动进程
					core:sendMsgToActivity(?ActivityType_Snowman, snowman_gmGetRes, {RoleID, ResID, Count})
			end
	end,
	ok.

%%% --------------------------------------------------------------------
%% GM查询怪物信息
-spec gmCheckMonster() -> ok.
gmCheckMonster() ->
	RoleID = playerState:getRoleID(),
	GuildID = playerState:getGuildID(),
	?DEBUG_OUT("[DebugForSnowman] gmCheckMonster RoleID:~p GuildID:~p", [RoleID, GuildID]),
	%% 1.验证是否加入家族
	case GuildID of
		0 ->
			error(?ErrorCode_GuildSnowmanEnterNoFamily, [], ?LINE);	%% 没有加入家族，无法操作
		_ ->
			%% 2.验证是否已经处于地图
			case isInMap() of
				false ->
					skip;
				_ ->
					%% 3.发送消息给活动进程
					core:sendMsgToActivity(?ActivityType_Snowman, snowman_gmCheckMonster, RoleID)
			end
	end,
	ok.

%%% --------------------------------------------------------------------
%% 进入活动地图
-spec enterTryAck(MapPid::pid()) -> ok.
enterTryAck(MapPid) ->
	?DEBUG_OUT("[DebugForSnowman] enterTryAck RoleID:~p GuildID:~p", [playerState:getRoleID(), playerState:getGuildID()]),
	%case playerState:getTeamID() > 0 of
	%	true ->
	%		playerTeam:leaveTeam(?PlayerTeamTypeNormal);	%% 离队，绕开组队杀怪的归属问题
	%	_ ->
	%		skip
	%end,
	playerScene:onRequestEnterActivityMap(?GuildSnowmanMapID, MapPid),
	ok.

%%% --------------------------------------------------------------------
%% 捐赠反馈
-spec donateAck({ResID::uint32(), Donate::uint32()}) -> ok.
donateAck({ResID, Donate}) ->
	?DEBUG_OUT("[DebugForSnowman] donateAck RoleID:~p GuildID:~p ResID:~p Donate:~p", [playerState:getRoleID(), playerState:getGuildID(), ResID, Donate]),
	#guildsnowmanCfg{reward = Reward, name = Name} =
		getCfg:getCfgPStack(cfg_guildsnowman, ResID),
	GuildID = playerState:getGuildID(),
	PLog = #recPLogTSMoney{reason = ?CoinSourceGuildSnowmanDonate, param = GuildID, target = ?PLogTS_PlayerSelf, source = ?PLogTS_Guild},
	[playerMoney:addCoin(T, C * Donate, PLog) || {T, C} <- Reward],
	playerMsg:sendErrorCodeMsg(?ErrorCode_GuildSnowmanDonate, [Donate, Name]),
	ok.

%%% --------------------------------------------------------------------
%% 采集成功
-spec gatherSuccess(GatherID::uint32()) -> ok.
gatherSuccess(GatherID) ->
	case getCfg:getCfgByKey(cfg_object, GatherID) of
		#objectCfg{type = ?GatherType_GuildSnowman} ->
			RoleID = playerState:getRoleID(),
			?DEBUG_OUT("[DebugForSnowman] enterTryAck GatherID:~p RoleID:~p GuildID:~p", [GatherID, RoleID, playerState:getGuildID()]),
			core:sendMsgToActivity(?ActivityType_Snowman, snowman_gatherSuccess, {RoleID, GatherID});
		_ ->
			skip
	end,
	ok.

%%% ====================================================================
%%% Internal functions
%%% ====================================================================

%%% --------------------------------------------------------------------
%% 是否处于目标玩法地图，用于过滤一些无效操作
-spec isInMap() -> boolean().
isInMap() ->
	MapID = playerState:getMapID(),
	case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeSnowman} ->
			true;
		#mapsettingCfg{} ->
			false;
		_ ->
			?ERROR_OUT("can not find MapID(~p) from cfg_mapsetting", [MapID]),
			false
	end.
