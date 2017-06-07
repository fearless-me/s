%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 玩家同屏策略协议相关
%%% @end
%%% Created : 08. 四月 2017 11:12
%%%-------------------------------------------------------------------
-module(playerScreen).
-author(tiancheng).

-include("playerPrivate.hrl").

%% 同屏表
-record(rec_screen, {
	owner = 0,
	codes = [],
	updateTime = 0
}).

%% API
-export([
	initINMap/0,
	deleteScreenINMap/2
]).

-export([
	isOpen/0,
	setLookPlayerList/2,
	getLookPlayerList/1,
	getLookPlayerNumber/1,
	addLookPlayerList/2,
	delLookPlayerList/2,
	deleteScreen/1
]).

%% API
-export([
	isHookMsg/1,
	parkBroadcastMsg/1
]).

-export([
	getOwnerCode/1
]).

-export([
	setMapScreenEts/1
]).

initINMap() ->
	%% 同屏策略表，只允许playerotp自己写自己的，其余只允许查询
	%% 最开始的写法是全服共用一个公共的ETS，但考虑到效率的问题，现把该ETS分担到每个地图进程上
	ets:new(map_ets_screen, [public, set, {keypos, #rec_screen.owner}, {write_concurrency, true}, {read_concurrency, true}]).

%% 是否开启同屏策略
isOpen() ->
	variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Screen).

%% 是否Hook的协议
%% fixme 以下这个函数，按规则不应该放在这个模块，但是为了和parkBroadcastMsg方法形成处理对应关系，为了方便，减少出错，固放在这里！
-spec isHookMsg(Msg::tuple()) -> boolean().
isHookMsg(#pk_GS2U_MoveInfo{}) -> true;
isHookMsg(#pk_GS2U_StopMove{}) -> true;
isHookMsg(#pk_GS2U_PetList{}) -> true;
isHookMsg(#pk_GS2U_AttackResult{}) -> true;
isHookMsg(#pk_GS2U_UseSkillToObject{}) -> true;
isHookMsg(#pk_GS2U_PropSync{}) -> true;
isHookMsg(_Msg) -> false.

%% 广播的消息特殊处理
parkBroadcastMsg(#pk_GS2U_MoveInfo{code = Code} = Msg) ->
	case canSyncByCode(Code) of
		true -> playerMsg:sendNetMsg(Msg);
		_ ->
			?DEBUG_OUT("discard pk_GS2U_MoveInfo:~p,~p", [playerState:getPlayerCode(), Code]),
			skip
	end,
	ok;
parkBroadcastMsg(#pk_GS2U_StopMove{code = Code} = Msg) ->
	case canSyncByCode(Code) of
		true -> playerMsg:sendNetMsg(Msg);
		_ ->
			?DEBUG_OUT("discard pk_GS2U_StopMove:~p,~p", [playerState:getPlayerCode(), Code]),
			skip
	end,
	ok;
parkBroadcastMsg(#pk_GS2U_PetList{pet_list = [#pk_LookInfoPet{playerCode = Code}|_]} = Msg) ->
	case canSyncByCode(Code) of
		true -> playerMsg:sendNetMsg(Msg);
		_ ->
			?DEBUG_OUT("discard pk_GS2U_PetList:~p,~p", [playerState:getPlayerCode(), Code]),
			skip
	end,
	ok;
parkBroadcastMsg(#pk_GS2U_AttackResult{userCode = UCode, targetCode = TCode} = Msg) ->
	Can1 = canSyncByCode(UCode),
	Can2 = canSyncByCode(TCode),
	case Can1 orelse Can2 of
		true -> playerMsg:sendNetMsg(Msg);
		_ ->
			?DEBUG_OUT("discard pk_GS2U_AttackResult:~p,~p,~p", [playerState:getPlayerCode(), UCode, TCode]),
			skip
	end,
	ok;
parkBroadcastMsg(#pk_GS2U_UseSkillToObject{userCode = UCode} = Msg) ->
	case canSyncByCode(UCode) of
		true -> playerMsg:sendNetMsg(Msg);
		_ ->
			?DEBUG_OUT("discard pk_GS2U_UseSkillToObject:~p,~p", [playerState:getPlayerCode(), UCode]),
			skip
	end,
	ok;
parkBroadcastMsg(#pk_GS2U_PropSync{code = Code} = Msg) ->
	case canSyncByCode(Code) of
		true -> playerMsg:sendNetMsg(Msg);
		_ ->
			?DEBUG_OUT("discard pk_GS2U_PropSync:~p,~p", [playerState:getPlayerCode(), Code]),
			skip
	end,
	ok;
parkBroadcastMsg(Data) ->
	?ERROR_OUT("no deal data:~p", [Data]),
	ok.

%% 获取同屏策略ETS
setMapScreenEts(Ets) ->
	put('MapScreenEts', Ets).

getMapScreenEts() ->
	get('MapScreenEts').

canSyncByCode(Code) ->
	parkCodeIsAllow(getOwnerCode(Code)).

parkCodeIsAllow(0) -> true;
parkCodeIsAllow(Code) ->
	SelfCode = playerState:getPlayerCode(),
	SelfCode =:= Code orelse lists:member(Code, playerScreen:getLookPlayerList(SelfCode)).

getOwnerCode(Code) ->
	case codeMgr:getObjectTypeByCode(Code) of
		?ObjTypePlayer -> Code;
		?ObjTypePet ->
			%% 找主人
			case ets:lookup(playerState:getMapPetEts(), Code) of
				[#recMapObject{ownCode = OwnerCode}] ->
					%% 这里为了避免死循环就不递归调用了
					case codeMgr:getObjectTypeByCode(OwnerCode) of
						?ObjTypePlayer -> OwnerCode;
						_ -> 0
					end;
				_ -> 0
			end;
		_ -> 0
	end.

%% 能否更新同屏表，确保只有玩家本人自己更新
canUpdate(Code) ->
	playerState:getPlayerCode() =:= Code.

%% 能够看见附近的玩家列表
setLookPlayerList(Code, List) ->
	case canUpdate(Code) of
		true ->
			ets:insert(getMapScreenEts(),
				#rec_screen{
					owner = Code,
					codes = List,
					updateTime = time2:getTimestampSec()
				});
		_ ->
			skip
	end,
	ok.

getLookPlayerList(Code) ->
	case ets:lookup(getMapScreenEts(), Code) of
		[#rec_screen{codes = Value}] -> Value;
		_ -> []
	end.

getLookPlayerNumber(Code) ->
	erlang:length(getLookPlayerList(Code)).

addLookPlayerList(_, []) -> ok;
addLookPlayerList(Owner, [Code|_] = CodeList) when erlang:is_integer(Code) ->
	case canUpdate(Owner) of
		true ->
			OldList = getLookPlayerList(Owner),
			NewList = lists:umerge(CodeList, OldList),
			setLookPlayerList(Owner, NewList);
		_ ->
			skip
	end,
	ok;
addLookPlayerList(Owner, Code) when erlang:is_integer(Code) ->
	case getLookPlayerList(Owner) of
		[] ->
			setLookPlayerList(Owner, [Code]);
		L ->
			case lists:member(Code, L) of
				false ->
					setLookPlayerList(Owner, [Code | L]);
				_ ->
					skip
			end
	end,
	ok;
addLookPlayerList(Owner, Code) ->
	?ERROR_OUT("addLookPlayerList:~p,~p", [Owner, Code]),
	ok.

delLookPlayerList(_Owner, []) -> ok;
delLookPlayerList(Owner, [Code|_] = CodeList) when erlang:is_integer(Code) ->
	case canUpdate(Owner) of
		true ->
			OldList = getLookPlayerList(Owner),
			setLookPlayerList(Owner, OldList -- CodeList);
		_ ->
			skip
	end,
	ok;
delLookPlayerList(Owner, Code) when erlang:is_integer(Code) ->
	case getLookPlayerList(Owner) of
		[] -> skip;
		L ->
			NL = lists:delete(Code, L),
			case L =:= NL of
				false ->
					setLookPlayerList(Owner, NL);
				_ ->
					skip
			end
	end,
	ok;
delLookPlayerList(Owner, Code) ->
	?ERROR_OUT("delLookPlayerList:~p,~p", [Owner, Code]),
	ok.

%% 删除同步数据
-spec deleteScreen(Owner::uint64()) -> ok.
deleteScreen(Owner) ->
	case canUpdate(Owner) of
		true ->
			ets:delete(getMapScreenEts(), Owner);
		_ ->
			skip
	end,
	ok.
-spec deleteScreenINMap(Ets::etsTab(), Owner::uint64()) -> true.
deleteScreenINMap(Ets, Owner) ->
	ets:delete(Ets, Owner).
