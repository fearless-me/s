%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%%
%%% @end
%%% Created : 31. 十月 2014 10:56
%%%-------------------------------------------------------------------
-module(playerVariant).
-author("ZhongYuanWei").

-include("gsInc.hrl").

%% API
-export([
	initDefaultVariant/0,
	clientUpdatePlayerVariant/1,
	clientUpdatePlayerBitVariant/1,
	sendVariant2Client/0,
	setPlayerVariant/2,
	setPlayerBitVariant/2,
	sendGlobalVarChangeToAllOnlinePlayer/2,
	sendGlobalBitVarChangeToAllOnlinePlayer/2,
	reloadAllPlayerVariant/1
]).

%%==========================================================================
%%接口函数
%%==========================================================================
%%重新加载所有玩家变量
%%重新加载所有玩家变量
reloadAllPlayerVariant(List) ->
	case playerState:getIsPlayer() of
		true ->
			%%玩家上线时，把修改标记清除,数据重置之前清除掉所有标记
			variant:initVariantFromDB(List),
			%%有些变量需要进行上线检查数据并修正
%%			playerWorldBossWar:loadworldBossDamage(),
			ok;
		_->
			skip
	end.

%%初始化默认变量
-spec initDefaultVariant() -> ok.
initDefaultVariant() ->
	case playerState:getIsPlayer() of
		true ->
			%% 初始化没有的变量
			RoleID = playerState:getRoleID(),
			{VarIndexList, BitVarIndexList} = variant:initDefaultVariant(RoleID),

			%% save to mysql
			FSaveVar =
				fun(Index) ->
					case isExistIndex(Index) of
						true ->
							Value = variant:getPlayerVariant(RoleID, Index),
							savePlayerVariant(Index,Value);
						_ ->
							skip
					end
				end,
			lists:foreach(FSaveVar, VarIndexList),

			FSaveBitVar =
				fun(BitIndex) ->
					case isExistIndex(BitIndex) of
						true ->
							savePlayerBitVariant(BitIndex);
						_ ->
							skip
					end
				end,
			lists:foreach(FSaveBitVar, BitVarIndexList),

			%% 发送变量给客户端
%%			sendVariant2Client(),
			ok;
		_ ->
			skip
	end.

%%客户端触发的更新变量
-spec clientUpdatePlayerVariant(VarList) -> ok when
	VarList::[#pk_VariantInfo{},...].
clientUpdatePlayerVariant(VarList) ->
	AccOut = updateClientVariant(VarList,[]),
	playerMsg:sendNetMsg(#pk_Any_UpdateVariant{updateVariantList = AccOut}),
	ok.

%%客户端触发的更新开关变量
-spec clientUpdatePlayerBitVariant(VarList) -> ok when
	VarList::[#pk_SwitchVariantInfo{},...].
clientUpdatePlayerBitVariant(VarList) ->
	AccOut = updateClientBitVariant(VarList,[]),
	playerMsg:sendNetMsg(#pk_Any_UpdateBitVariant{updateVariantList = AccOut}),
	ok.

%%服务器直接设置指定索引的变量，并自动更新到客户端
-spec setPlayerVariant(Index,Value) -> boolean() when
	Index::uint(),Value::int().
setPlayerVariant(Index,Value) ->
	Ret = updateVariant(Index,Value,fun isServerValidPlayerIndex/1),
	%%如果更新成功，且是客户端需要知道的索引则同步到客户端
	case Ret of
		true ->
			playerMsg:sendNetMsg(#pk_Any_UpdateVariant{updateVariantList = [#pk_VariantInfo{index = Index,value = Value}]});
		_ ->
			skip
	end,
	Ret.

%%服务器直接设置指定索引的开关变量，并自动更新到客户端
-spec setPlayerBitVariant(Index,Value) -> boolean() when
	Index::uint(),Value::boolean().
setPlayerBitVariant(Index,Value) when erlang:is_boolean(Value)->
	Ret = updateBitVariant(Index,Value,fun isClientAndServerValidPlayerBitIndex/1),
	%%如果更新成功，且是客户端需要知道的索引则同步到客户端
	case Ret of
		true ->
			playerMsg:sendNetMsg(#pk_Any_UpdateBitVariant{updateVariantList = [#pk_SwitchVariantInfo{bitIndex = Index,bitValue = Value}]});
		_ ->
			skip
	end,
	Ret.

%%发送变量设置
-spec sendVariant2Client() -> ok.
sendVariant2Client() ->
	ServerID = gsMainLogic:getServerID(),
	RoleID = playerState:getRoleID(),
	%%客户端只读全局数值变量
	L1 = getVariant(?GlobalVariantID,?Setting_GlobalVarReadOnly_Start,?Setting_GlobalVarReadOnly_End,[]),
	%%客户端只读全局开关变量
	L2 = getVariant(?GlobalVariantID,?Setting_GlobalBitVarReadOnly_Start,?Setting_GlobalBitVarReadOnly_End,L1),

	%%客户端只读世界数值变量
	L3 = getVariant(ServerID,?Setting_WorldVarReadOnly_Start,?Setting_WorldVarReadOnly_End,L2),
	%%客户端只读世界开关变量
	L4 = getVariant(ServerID,?Setting_WorldBitVarReadOnly_Start,?Setting_WorldBitVarReadOnly_End,L3),

	%%客户端可修改的玩家数值变量
	L5 = getVariant(RoleID,?Setting_PlayerVar_Start,?Setting_PlayerVar_End,L4),
	%%客户端只读玩家数值变量
	L6 = getVariant(RoleID,?Setting_PlayerVarReadOnly_Start,?Setting_PlayerVarReadOnly_End,L5),
	%%代客户端存储的数值变量
	L7 = getVariant(RoleID,?Setting_ClientVar_Start,?Setting_ClientVar_End,L6),
	%%客户端可修改的数值变量
	L8 = getVariant(RoleID,?Setting_PlayerBitVar_Start,?Setting_PlayerBitVar_End,L7),
	%%客户端只读玩家开关变量
	L = getVariant(RoleID,?Setting_PlayerBitVarReadOnly_Start,?Setting_PlayerBitVarReadOnly_End,L8),

	Fun =
		fun(#rec_variant0{index = Index,value = V},AccIn) ->
			[#pk_VariantInfo{index = Index,value = V} | AccIn]
		end,
	List = lists:foldl(Fun, [], L),
	playerMsg:sendNetMsg(#pk_GS2U_VariantInfo{variantList = List}),
	ok.

%%==========================================================================
%%内部函数
%%==========================================================================

%%客户端更新变量，只允许客户端更新代客户端存储的变量段
-spec updateClientVariant(VarList,AccIn) -> [#pk_VariantInfo{},...] | [] when
	VarList::[#pk_VariantInfo{},...] | [] ,AccIn::[#pk_VariantInfo{},...] | [].
updateClientVariant([],AccIn) ->
	AccIn;
updateClientVariant([#pk_VariantInfo{index = Index,value = Value} = H | T],AccIn) ->
	AccOut = case updateVariant(Index,Value,fun isValidPlayerIndex/1) of
				 true ->
					 [H | AccIn];
				 _ ->
					 AccIn
			 end,
	updateClientVariant(T,AccOut).

-spec updateClientBitVariant(VarList,AccIn) -> [#pk_SwitchVariantInfo{},...] | [] when
	VarList::[#pk_SwitchVariantInfo{},...] | [],AccIn::[#pk_SwitchVariantInfo{},...] | [].
updateClientBitVariant([],AccIn) ->
	AccIn;
updateClientBitVariant([#pk_SwitchVariantInfo{bitIndex = BitIndex,bitValue = Value} = H | T],AccIn) ->
	AccOut = case updateBitVariant(BitIndex,Value,fun isValidClientPlayerBitIndex/1) of
				 true ->
					 [H | AccIn];
				 _ ->
					 AccIn
			 end,
	updateClientBitVariant(T,AccOut).

-spec getVariant(ID,Min,Max,AccIn) -> list() when
	ID::uint(),Min::uint(),Max::uint(),AccIn::list().
getVariant(ID,Min,Max,AccIn) ->
	List = variant:getVariantListByID(ID,Min,Max),
	List ++ AccIn.

%%玩家只能修改可以修改的变量，只读变量不能给玩家修改
-spec isValidPlayerIndex(VarIndex) -> boolean() when VarIndex::uint().
isValidPlayerIndex(VarIndex) when (VarIndex >= ?Setting_PlayerVar_Start andalso VarIndex =< ?Setting_PlayerVar_End)
	orelse (VarIndex >= ?Setting_ClientVar_Start andalso VarIndex =< ?Setting_ClientVar_End)
	orelse (VarIndex >= ?Setting_PlayerBitVar_Start andalso VarIndex =< ?Setting_PlayerBitVar_End) ->
	true;
isValidPlayerIndex(_)  ->
	false.

%%玩家只能修改可以修改的变量，只读变量不能给玩家修改
-spec isValidClientPlayerBitIndex(VarIndex) -> boolean() when VarIndex::uint().
isValidClientPlayerBitIndex(VarIndex) when (VarIndex >= ?Setting_PlayerBitVar_StartBit andalso VarIndex =< ?Setting_PlayerBitVar_EndBit) ->
	true;
isValidClientPlayerBitIndex(_)  ->
	false.

%%服务器可以修改的玩家有效索引
-spec isServerValidPlayerIndex(VarIndex) -> boolean() when VarIndex::uint().
isServerValidPlayerIndex(VarIndex) when (VarIndex >= ?Setting_PlayerVar_Start andalso VarIndex =< ?Setting_PlayerVar_End)
	orelse (VarIndex >= ?Setting_PlayerVarReadOnly_Start andalso VarIndex =< ?Setting_PlayerVarReadOnly_End)
	orelse (VarIndex >= ?Setting_ClientVar_Start andalso VarIndex =< ?Setting_ClientVar_End)->
	true;
isServerValidPlayerIndex(_)  ->
	false.

%%服务器可以修改的玩家有效索引
-spec isClientAndServerValidPlayerBitIndex(VarIndex) -> boolean() when VarIndex::uint().
isClientAndServerValidPlayerBitIndex(VarIndex) when (VarIndex >= ?Setting_PlayerBitVar_StartBit andalso VarIndex =< ?Setting_PlayerBitVar_EndBit)
	orelse (VarIndex >= ?Setting_PlayerBitVarReadOnly_StartBit andalso VarIndex =< ?Setting_PlayerBitVarReadOnly_EndBit)->
	true;
isClientAndServerValidPlayerBitIndex(_)  ->
	false.

-spec isExistIndex(Index) -> boolean() when
	Index::uint().
isExistIndex(Index) ->
	Fun =
		fun(I,AccIn) ->
			case I =:= Index of
				true ->
					{break,true};
				_ ->
					AccIn
			end
		end,
	misc:mapAccList(?Setting_Server_Needs,false,Fun).

updateVariant(Index,Value,Fun) ->
	case Fun(Index) of
		true ->
			%%检测是否在存在列表中，代客户端存储的不用检测
			IsExist = case (Index >= ?Setting_ClientVar_Start andalso Index =< ?Setting_ClientVar_End) of
						  true ->
							  true;
						  _ ->
							  isExistIndex(Index)
					  end,
			case IsExist of
				true ->
					case variant:setPlayerVariant(playerState:getRoleID(),Index,Value) of
						true ->
							%%变量实时保存
							savePlayerVariant(Index,Value),
							true;
						_ ->
							false
					end;
				_ ->
					?ERROR_OUT("Error Index[~p] update Variant value[~p]",[Index,Value]),
					false
			end;
		_ ->
			?ERROR_OUT("Error Index[~p] update Variant value[~p]",[Index,Value]),
			false
	end.

updateBitVariant(BitIndex,Value,Fun) ->
	case Fun(BitIndex) andalso isExistIndex(BitIndex) of
		true ->
			case erlang:is_boolean(Value) orelse Value =:= 0 orelse Value =:= 1 of
				true ->
					RoleID = playerState:getRoleID(),
					case variant:setPlayerBitVariant(RoleID,BitIndex,Value) of
						true ->
							savePlayerBitVariant(BitIndex),
							true;
						_ ->
							false
					end;
				_ ->
					?ERROR_OUT("Error Value[~p] update BitVariant Index[~p]",[Value,BitIndex]),
					false
			end;
		_ ->
			?ERROR_OUT("Error Index[~p] update BitVariant Value[~p]",[BitIndex,Value]),
			false
	end.

savePlayerVariant(Index, Value) -> playerSave:saveVariant(Index,Value).
savePlayerBitVariant(BitIndex) ->
	Index =	BitIndex div 32,
	SaveValue = variant:getPlayerVariant(playerState:getRoleID(), Index),
	savePlayerVariant(Index, SaveValue).

%%全局变量改变通知所有
sendGlobalVarChangeToAllOnlinePlayer(Index,Value) ->
	OnlinePlayerPidList = playerMgrOtp:getAllPlayerPidInfo(),
	[psMgr:sendMsg2PS(PlayerPid,sendVarChange2Client,{globalVar, Index,Value}) || PlayerPid <- OnlinePlayerPidList],
	ok.

%%全局变量改变通知所有
sendGlobalBitVarChangeToAllOnlinePlayer(BitIndex,Value) when erlang:is_integer(Value) andalso (Value > 1 orelse Value < 0) ->
	?ERROR_OUT("sendGlobalBitVarChangeToAllOnlinePlayer:~p,~p,~p", [BitIndex, Value, misc:getStackTrace()]),
	ok;
sendGlobalBitVarChangeToAllOnlinePlayer(BitIndex,Value) ->
	?DEBUG_OUT("sendGlobalBitVarChangeToAllOnlinePlayer:~p,~p", [BitIndex, Value]),
	OnlinePlayerPidList = playerMgrOtp:getAllPlayerPidInfo(),
	[psMgr:sendMsg2PS(PlayerPid,sendVarChange2Client,{globalBitVar, BitIndex,Value}) || PlayerPid <- OnlinePlayerPidList],
	ok.

