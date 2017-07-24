%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <公司>
%%% @doc
%%%
%%% @end
%%% Created : 11. 二月 2015 15:15
%%%-------------------------------------------------------------------
-module(uidMgr).
-author("tiancheng").

-include("common/common.hrl").

-define(UIDEts,uidEts).
-record(recUID,
{
	type,			%% UID的类型
	curUID,			%% 当前计数的UID
	minUID,			%% UID的最小值
	maxUID			%% UID的最大上限值
}).

-define(UIDBit_Highest, 1).		% UID最高位，默认0，空位
-define(UIDBit_Type,	4).		% UID类型?UID_TYPE_Start - ?UID_TYPE_End:0~15(最小0为账号ID)
-define(UIDBit_ADBID,	5).		% ADBID:0~31
-define(UIDBit_DBID,	10).	% DBID:0~1023
-define(UIDBit_UIDIdex,	13).	% DBID:0~8191
-define(UIDBit_IDRange,	31).	% ID累加值:0~2147483648

%% 只允许初始化一次，当然，你初始化多次也是不行滴=.=
-export([
	initMgr/0
]).

-export([
	checkUID/1,
	checkUID/2
]).

-export([
	getUIDType/1,
	getDBIDByUID/1
]).

-export([
	makeAccountUID/0,
	makeRoleUID/0,
	makeItemUID/0,
	makeTradeUID/0,
	makeMailUID/0,
	makeGuildUID/0,
	makeRuneUID/0,
	makeTeamUID/0,
	makeCrossApplyUID/0,
	makeRedEnvelopeUID/0
]).

%% 本导出函数仅针对角色UID
-export([
	getShortID/1,
	getUIDByShortID/1
]).

%%生成角色UID
-spec makeAccountUID() -> uint().
makeAccountUID() ->
	makeUID(?UID_TYPE_Account).

%%生成角色UID
-spec makeRoleUID() -> uint().
makeRoleUID() ->
	makeUID(?UID_TYPE_Role).

%%生成道具UID
-spec makeItemUID() -> uint64().
makeItemUID() ->
	makeUID(?UID_TYPE_Item).

%%生成交易行订单号
makeTradeUID() ->
	makeUID(?UID_TYPE_Trade).

%%生成邮件UID
makeMailUID() ->
	makeUID(?UID_TYPE_Mail).

%%生成工会（军团）UID
makeGuildUID() ->
	makeUID(?UID_TYPE_Guild).

%%生成符文UID
makeRuneUID() ->
	makeUID(?UID_TYPE_Rune).

%%生成队伍UID
makeTeamUID() ->
	makeUID(?UID_TYPE_Team).

%%生成跨服报名组UID
makeCrossApplyUID() ->
	makeUID(?UID_TYPE_CrossApply).

%%生成红包UID
makeRedEnvelopeUID() ->
	makeUID(?UID_TYPE_Red).

-spec initMgr() -> ok.
initMgr() ->
	?LOG_OUT("~p init", [?MODULE]),
	initUIDFromDB().

-spec initUIDFromDB() -> ok.
initUIDFromDB() ->
	ADBID = globalSetup:getADBID(),
	DBID = globalSetup:getDBID(),
	UIDIndex = globalSetup:getServerIDIndex(),

	ets:new(?UIDEts, [public, named_table, {keypos, #recUID.type},{write_concurrency, true},{read_concurrency, true}]),
	List = lists:seq(?UID_TYPE_Start, ?UID_TYPE_End),
	Fun =
		fun(UIDType) ->
			MinUID = getUID(UIDType, ADBID, DBID, UIDIndex, 0),
			MaxUID = getUID(UIDType, ADBID, DBID, UIDIndex, (1 bsl ?UIDBit_IDRange) - 1),

			ets:insert(?UIDEts, #recUID{type = UIDType,curUID = MinUID,minUID = MinUID,maxUID = MaxUID}),

			?LOG_OUT("UIDType:~p,MinUID:~p,MaxUID:~p,Count:~p",
				[
					UIDType,
					MinUID,
					MaxUID,
					MaxUID - MinUID
				]),
			ok
		end,
	lists:foreach(Fun, List),
	ok.

%% 检查UID是否在指定范围
-spec checkUID(UIDType::uid_type(), UID::uint64()) -> boolean().
checkUID(UIDType, UID) when UIDType >= ?UID_TYPE_Start andalso UIDType =< ?UID_TYPE_End ->
	Min = getMinUID(UIDType),
	Max = getMaxUID(UIDType),
	UID >= Min andalso UID =< Max;
checkUID(_UIDType, _UID) ->
	false.

%% 检查UID是否在指定范围
-spec checkUID(UID::uint64()) -> boolean().
checkUID(UID) ->
	Min = getMinUID(),
	Max = getMaxUID(),
	UID >= Min andalso UID =< Max.

getMinUID() ->
	case get(minUID) of
		undefined ->
			MinUID = getUID(?UID_TYPE_Start, 0, 0, 0, 0),
			put(minUID, MinUID),
			MinUID;
		UID ->
			UID
	end.
getMaxUID() ->
	case get(maxUID) of
		undefined ->
			MaxUID = getUID((1 bsl ?UIDBit_Type) - 1, (1 bsl ?UIDBit_ADBID) - 1, (1 bsl ?UIDBit_DBID) - 1, (1 bsl ?UIDBit_UIDIdex) - 1, (1 bsl ?UIDBit_IDRange) - 1),
			put(maxUID, MaxUID),
			MaxUID;
		UID ->
			UID
	end.
getMinUID(UIDType) ->
	case get({minUID, UIDType}) of
		undefined ->
			MinUID = getUID(UIDType, 0, 0, 0, 0),
			put({minUID, UIDType}, MinUID),
			MinUID;
		UID ->
			UID
	end.
getMaxUID(UIDType) ->
	case get({maxUID, UIDType}) of
		undefined ->
			MaxUID = getUID(UIDType, (1 bsl ?UIDBit_ADBID) - 1, (1 bsl ?UIDBit_DBID) - 1, (1 bsl ?UIDBit_UIDIdex) - 1, (1 bsl ?UIDBit_IDRange) - 1),
			put({maxUID, UIDType}, MaxUID),
			MaxUID;
		UID ->
			UID
	end.

%% 获取UID类型
-spec getUIDType(UID::uid_type()) -> uint32().
getUIDType(UID) ->
	{_H, UIDType, _ADBID, _DBID, _UIDIndex, _IDRange} = parseUID(UID),
	UIDType.

%% 通过UID获取DBID
-spec getDBIDByUID(UID::uint64()) -> uint32().
getDBIDByUID(UID) ->
	{_, _, _, DBID, _, _} = parseUID(UID),
	DBID.

getUID(UIDType, ADBID, DBID, IDIndex, IDRange) ->
	High = 0,
	<<UID:64>> = <<High:?UIDBit_Highest, UIDType:?UIDBit_Type, ADBID:?UIDBit_ADBID, DBID:?UIDBit_DBID, IDIndex:?UIDBit_UIDIdex, IDRange:?UIDBit_IDRange>>,
	UID.

%% 解析UID
-spec parseUID(UID::uint64()) -> {H::integer(), UIDType::integer(), ADBID::integer(), DBID::integer(), UIDIndex::integer(), IDRange::integer()}.
parseUID(UID) ->
	<<H:?UIDBit_Highest, UIDType:?UIDBit_Type, ADBID:?UIDBit_ADBID, DBID:?UIDBit_DBID, UIDIndex:?UIDBit_UIDIdex, IDRange:?UIDBit_IDRange>> = <<UID:64>>,
	{H, UIDType, ADBID, DBID, UIDIndex, IDRange}.

%%当达到最大UID值时，会自动从最小值再次开始
-spec makeUID(Type) -> uint() when Type::uid_type().
makeUID(Type) ->
	[#recUID{minUID = MinUID, maxUID = MaxUID}] = ets:lookup(?UIDEts, Type),
	ets:update_counter(?UIDEts, Type, {#recUID.curUID, 1, MaxUID, MinUID}).

%% ================以下两个方法仅针对角色UID================
%% 角色UID转换为短UID
getShortID(UID) ->
	{_H, _UIDType, _ADBID, DBID, UIDIndex, IDRange} = parseUID(UID),
	(IDRange bsl (?UIDBit_DBID + ?UIDBit_UIDIdex)) bor (DBID bsl ?UIDBit_UIDIdex) bor UIDIndex.
%% 短角色UID转换为标准角色UID
getUIDByShortID(ShortID) ->
	<<IDRange:?UIDBit_IDRange, DBID:?UIDBit_DBID, UIDIndex:?UIDBit_UIDIdex>>
		= <<ShortID:(?UIDBit_DBID + ?UIDBit_UIDIdex + ?UIDBit_IDRange)>>,
	getUID(?UID_TYPE_Role, globalSetup:getADBID(), DBID, UIDIndex, IDRange).
%% ================以上两个方法仅针对角色UID================