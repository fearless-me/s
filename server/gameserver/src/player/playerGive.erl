%%%-------------------------------------------------------------------
%%% @author 田诚
%%% @copyright (C) 2014, <haowan123>
%%% @doc
%%% 玩家补偿系统
%%% @end
%%% Created : 12. 五月 2015 17:30
%%%-------------------------------------------------------------------
-module(playerGive).
-author(tiancheng).

-include("playerPrivate.hrl").
-include("setupLang.hrl").

-export([
	giveReward/0
]).

%% 补偿子项
-record(recExtGive,{
	index,						%%补偿的Index
	langList = [],              %%补偿语言版本
	adbIDList = [],				%%补偿的地区，如（台湾，韩国）
	dbIDList = [],				%%哪些服务器需要补偿
	roleIDList = [],			%%需要补偿的玩家列表
	itemList = []				%%补偿的道具列表[{itemID,number},...]
}).

%% 补偿编号(唯一索引)
-define(PlayerGiveIndex1, 1).

%% 补偿列表(如果index重复，将导致相同index只有一个可以被调用)
-define(PlayerGiveList, [
	#recExtGive{index = ?PlayerGiveIndex1}
]).

%% 具体补偿实现
dispatchCompensate(?PlayerGiveIndex1, _RoleID, _RoleList, _ItemList) -> ok.

%% 调用加载补偿
-spec giveReward() -> ok.
giveReward() ->
	ADBID = gsMainLogic:getADBID4GS(),
	DBID = gsMainLogic:getDBID4GS(),
	giveReward(playerState:getRoleID(),ADBID,DBID),
	ok.
giveReward(RoleID, ADBID, DBID) ->
	F =
		fun(#recExtGive{index = Index, langList = LangList, adbIDList = ADBIDList, dbIDList = DBIDList} = Give, NowIndex) ->
			case Index > NowIndex of
				true ->
					?WARN_OUT("Compensate check[roleID:~p,index:~p]", [RoleID, Index]),
					%% 先保存索引
					case playerPropSync:getProp(?SerProp_LoadGiveEndIndex) < Index of
						true -> playerPropSync:setInt(?SerProp_LoadGiveEndIndex, Index);
						_ -> skip
					end,
					%% ==============调用补偿==============
					%% 检测大区
					case lists:member(ADBID, ADBIDList) of
						true ->
							%% 检测语言
							case lists:member(?Cur_Lang, LangList) of
								true ->
									%% 检测DBID是否在指定的DBID列表中
									case lists:member(DBID, DBIDList) of
										true ->
											?WARN_OUT("Compensate Real[roleID:~p,index:~p]", [RoleID, Index]),
											dispatchCompensate(Index, RoleID, Give#recExtGive.roleIDList, Give#recExtGive.itemList);
										_ -> skip
									end;
								_ -> skip
							end;
						_ -> skip
					end,
					Index;
				_ -> NowIndex
			end
		end,
	lists:foldl(F, playerPropSync:getProp(?SerProp_LoadGiveEndIndex), lists:keysort(#recExtGive.index, ?PlayerGiveList)).