%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 世界聊天管理模块
%%% @end
%%% Created : 19. 七月 2017 14:40
%%%-------------------------------------------------------------------
-module(chatLogic).
-author(tiancheng).

-include("gsInc.hrl").

-define(ChatMax, 100).

%% 低于这么多个玩家，不需要CD，直接发送
-define(PlayerNumber, 300).

%% API
-export([
	sendWorldMsg/1,
	tick/0
]).

-export([
	setOnlinePlayerNumber/1
]).

sendWorldMsg({_Msg, _IsCheck, _RoleID, _SenderPid, _SenderNetPid} = Data) ->
	case getOnlinePlayerNumber() =< ?PlayerNumber of
		true ->
			%% 直接发送世界聊天
			sendMsg2([Data]);
		_ ->
			L = addWorldMsgList(Data),
			case erlang:length(L) > ?ChatMax of
				true ->
					sendMsg(L);
				_ ->
					skip
			end
	end,
	ok.

tick() ->
	erlang:send_after(1500, self(), tick),
	sendMsg(getWorldMsgList()).

sendMsg([]) ->
	ok;
sendMsg(List) ->
	setWorldMsgList([]),
	erlang:spawn(fun() -> sendMsg2(List) end).

sendMsg2(List) ->
	Fun =
		fun(#rec_OnlinePlayer{roleID = RoleID, pid = Pid, netPid = NetPid}, _) ->
			sendMsg3(RoleID, Pid, NetPid, List)
		end,
	ets:foldl(Fun, [], ets_rec_OnlinePlayer),
	ok.

sendMsg3(_SendToRoleID, _SendToPid, _SendToNetPid, []) ->
	ok;
sendMsg3(TargetRoleID, _TargetPid, TargetNetPid, {Msg, _IsCheck, RoleID, _SenderPid, _SenderNetPid}) ->
	case playerChat:isOpenWorldChannel(TargetRoleID) of
		true ->
			case friend2State:isBlack(TargetRoleID, RoleID) of
				true ->
					skip;
				_ ->
					gsSendMsg:sendNetMsg(TargetNetPid, Msg)
			end;
		_ ->
			skip
	end,
	ok;
sendMsg3(SendToRoleID, SendToPid, SendToNetPid, [Data | List]) ->
	sendMsg3(SendToRoleID, SendToPid, SendToNetPid, Data),
	sendMsg3(SendToRoleID, SendToPid, SendToNetPid, List).

addWorldMsgList(Data) ->
	L = getWorldMsgList(),
	NL = [Data | L],
	setWorldMsgList(NL),
	NL.
setWorldMsgList(List) ->
	put('WorldMsgList', List),
	List.
getWorldMsgList() ->
	case get('WorldMsgList') of
		undefined ->
			[];
		L ->
			L
	end.

setOnlinePlayerNumber(Number) ->
	put('OnlinePlayerNumber', Number).
getOnlinePlayerNumber() ->
	case get('OnlinePlayerNumber') of
		undefined -> 0;
		V -> V
	end.