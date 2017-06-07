%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%%
%%% @end
%%% Created : 29. 十月 2014 16:27
%%%-------------------------------------------------------------------
-module(variant).
-author("ZhongYuanWei").

-include("common.hrl").

%% API
-export([
	initVariant/0,
	releaseVariant/0,
	initVariantFromDB/1,
	initDefaultVariant/1,

	getVariantListByID/1,
	getVariantListByID/3,

	getGlobalVariant/1,
	getWorldVariant/2,
	getPlayerVariant/2,

	setGlobalVariant/2,
	setWorldVariant/3,
	setPlayerVariant/3,

	getGlobalBitVariant/1,
	getWorldBitVariant/2,
	getPlayerBitVariant/2,

	setGlobalBitVariant/2,
	setWorldBitVariant/3,
	setPlayerBitVariant/3
]).

-export([
	variantFirstInit/0
]).

%%变量的Ets
-define(VariantGlobalEts,variantGlobalEts).
-define(VariantWorldEts,variantWorldEts).
-define(VariantPlayerEts,variantPlayerEts).

-spec initVariant() -> ok.
initVariant() ->
	ets:new(?VariantGlobalEts,[public,named_table,{keypos,#recKeyValue.key},{read_concurrency, true},{write_concurrency, true}]),
	ets:new(?VariantWorldEts,[public,named_table,{keypos,#recKeyValue.key},{read_concurrency, true},{write_concurrency, true}]),
	ets:new(?VariantPlayerEts,[public,named_table,{keypos,#recKeyValue.key},{read_concurrency, true},{write_concurrency, true}]),

	%%初始化全局的默认变量
	initDefaultVariant(?GlobalVariantID),

	%%初始化本线路的默认变量
	initDefaultVariant(gsMainLogic:getServerID()),
	ok.

-spec initDefaultVariant(ID) -> {VarIndexList,BitVarIndexList} when
	ID::uint(),VarIndexList::list(),BitVarIndexList::list().
initDefaultVariant(?GlobalVariantID) ->
	Fun =
		fun({Index,Value},{VarIndexList,BitVarIndexList}) ->
			case isValidGlobalBitIndex(Index) of
				true ->
					true = setGlobalBitVariant(Index,Value),
					{VarIndexList,[Index | BitVarIndexList]};
				_ ->
					case isValidGlobalIndex(Index) of
						true ->
							setGlobalVariant(Index,Value),
							{[Index | VarIndexList],BitVarIndexList};
						_ ->
							{VarIndexList,BitVarIndexList}
					end
			end
		end,
	lists:foldl(Fun,{[],[]},?Setting_Default_Values);
initDefaultVariant(ServerID) when erlang:is_integer(ServerID), ServerID > 0, ServerID < 256 ->
	Fun =
		fun({Index,Value},{VarIndexList,BitVarIndexList}) ->
			case isValidWorldBitIndex(Index) of
				true ->
					true = setWorldBitVariant(ServerID,Index,Value),
					{VarIndexList,[Index | BitVarIndexList]};
				_ ->
					case isValidWorldIndex(Index) of
						true ->
							setWorldVariant(ServerID,Index,Value),
							{[Index | VarIndexList],BitVarIndexList};
						_ ->
							{VarIndexList,BitVarIndexList}
					end
			end
		end,
	lists:foldl(Fun,{[],[]},?Setting_Default_Values);
initDefaultVariant(RoleID) ->
	initDefaultVariant(RoleID, ?Setting_Default_Values).
initDefaultVariant(RoleID, List) ->
	Fun =
		fun({Index,Value},{VarIndexList,BitVarIndexList}) ->
			case isValidPlayerBitIndex(Index) of
				true ->
					true = setPlayerBitVariant(RoleID,Index,Value),
					{VarIndexList,[Index | BitVarIndexList]};
				_ ->
					case isValidPlayerIndex(Index) of
						true ->
							setPlayerVariant(RoleID,Index,Value),
							{[Index | VarIndexList],BitVarIndexList};
						_ ->
							{VarIndexList,BitVarIndexList}
					end
			end
		end,
	lists:foldl(Fun,{[],[]},List).

-spec releaseVariant() -> ok.
releaseVariant() ->
	ets:delete(?VariantGlobalEts),
	ets:delete(?VariantWorldEts),
	ets:delete(?VariantPlayerEts),
	ok.

-spec initVariantFromDB(List) -> ok when
	List::[#rec_variant0{},...].
initVariantFromDB(List) ->
	Fun =
		fun(#rec_variant0{roleID = {RoleID,Index},index = Index,value = Value}, Acc = {RID, AccL}) ->
			if
			%%全局变量
				RoleID =:= ?GlobalVariantID ->
					setGlobalVariant(Index,Value),
					Acc;
			%%世界变量
				RoleID > 0, RoleID < 256  ->
					setWorldVariant(RoleID,Index,Value),
					Acc;
			%%玩家变量
				true ->
					setPlayerVariant(RoleID,Index,Value),

					AccL2 =
						if
							Index >= ?Setting_PlayerBitVar_Start andalso Index =< ?Setting_PlayerBitVar_End ->
								[V || V = {Index2, _} <- AccL, Index2 div 32 /= Index];
							Index >= ?Setting_PlayerBitVarReadOnly_Start andalso Index =< ?Setting_PlayerBitVarReadOnly_End ->
								[V || V = {Index2, _} <- AccL, Index2 div 32 /= Index];
							true ->
								lists:keydelete(Index, 1, AccL)
						end,
					case RID /= 0 andalso RoleID /= RID of
						true ->
							?ERROR_OUT("initVariantFromDB:~p,~p", [List, misc:getStackTrace()]),
							{0, []};
						_ ->
							{RoleID, AccL2}
					end
			end
		end,
	case lists:foldl(Fun, {0, ?Setting_Default_Values}, List) of
		{_, []} -> skip;
		{0, _NoSaveList} -> skip;
		{RoleID, NoSaveList} ->
			initDefaultVariant(RoleID, NoSaveList)
	end,
	ok.

%% 开关首次初始化
-spec variantFirstInit() -> ok.
variantFirstInit() ->
%%	globalBitReadOnlyVariantFirstInit(?GlobalBitVarReadOnly_DefaultOpenList, []),
	ok.

%% 客户端只读全局开关类变量，默认开启的如下，仅开关首次使用时生效
%%globalBitReadOnlyVariantFirstInit([], TempList) -> TempList;
%%globalBitReadOnlyVariantFirstInit([GlobalBit | List], TempList) ->
%%	TempList2 = globalBitReadOnlyVariantFirstInit(GlobalBit, TempList),
%%	globalBitReadOnlyVariantFirstInit(List, TempList2);
%%globalBitReadOnlyVariantFirstInit(GlobalBit, TempList) ->
%%	case isValidGlobalBitIndex(GlobalBit) of
%%		true ->
%%			Key = getBitIndex(?GlobalVariantID, GlobalBit),
%%			case lists:keyfind(Key, 1, TempList) of
%%				{_, true} ->
%%					?DEBUG_OUT("already init variant:~p", [GlobalBit]),
%%					TempList;
%%				{_, false} ->
%%					?LOG_OUT("open globalbit variant:~p", [GlobalBit]),
%%					true = core:setGlobalBitVariant(GlobalBit, true),
%%					TempList;
%%				false ->
%%					case ets:lookup(?VariantGlobalEts, Key) of
%%						[] ->
%%							?LOG_OUT("open globalbit variant:~p", [GlobalBit]),
%%							true = core:setGlobalBitVariant(GlobalBit, true),
%%							[{Key, false} | TempList];
%%						Data ->
%%							?DEBUG_OUT("already have variant:~p", [Data]),
%%							[{Key, true} | TempList]
%%					end
%%			end;
%%		_ ->
%%			?ERROR_OUT("globalBitVariantFirstInit:~p", [GlobalBit]),
%%			TempList
%%	end.

-spec getVariantListByID(ID,InMin,InMax) -> [#rec_variant0{},...] | [] when
	ID::uint(),InMin::uint(),InMax::uint().
getVariantListByID(?GlobalVariantID,InMin,InMax) ->
	getVariantListByID(?VariantGlobalEts,?GlobalVariantID,InMin,InMax);
getVariantListByID(ID,InMin,InMax) when erlang:is_integer(ID) andalso ID > 0 andalso ID < 256 ->
	getVariantListByID(?VariantWorldEts,ID,InMin,InMax);
getVariantListByID(ID,InMin,InMax) ->
	getVariantListByID(?VariantPlayerEts,ID,InMin,InMax).

-spec getVariantListByID(ID) -> [#rec_variant0{},...] | [] when
	ID::uint().
getVariantListByID(?GlobalVariantID) ->
	getVariantListByID(?VariantGlobalEts,?GlobalVariantID);
getVariantListByID(ID) when erlang:is_integer(ID) andalso ID > 0 andalso ID < 256 ->
	getVariantListByID(?VariantWorldEts,ID);
getVariantListByID(ID) ->
	getVariantListByID(?VariantPlayerEts,ID).

%%=================================================
%%以下是数值变量API
%%=================================================
-spec getGlobalVariant(VarIndex) -> Value when VarIndex::uint16(),Value::int().
getGlobalVariant(VarIndex) when erlang:is_integer(VarIndex) ->
	case isValidGlobalIndex(VarIndex) of
		true ->
			getVariant(?VariantGlobalEts,getIndex(?GlobalVariantID,VarIndex));
		_ ->
			?ERROR_OUT("Error get Global VarIndex[~p]",[VarIndex]),
			0
	end.

-spec setGlobalVariant(VarIndex,Value) -> boolean() when
	VarIndex::uint16(),Value::int().
setGlobalVariant(VarIndex,Value) when erlang:is_integer(VarIndex), erlang:is_integer(Value) ->
	case isValidGlobalIndex(VarIndex) of
		true ->
			setVariant(?VariantGlobalEts,getIndex(?GlobalVariantID,VarIndex),Value);
		_ ->
			?ERROR_OUT("Error set Global VarIndex[~p]",[VarIndex]),
			false
	end.

-spec getWorldVariant(GSID,VarIndex) -> int() when
	GSID::1 .. 255,VarIndex::uint16().
getWorldVariant(GSID,VarIndex) when erlang:is_integer(GSID) andalso GSID > 0 andalso GSID < 256 andalso erlang:is_integer(VarIndex) ->
	case isValidWorldIndex(VarIndex) of
		true ->
			getVariant(?VariantWorldEts,getIndex(GSID,VarIndex));
		_ ->
			?ERROR_OUT("Error GSID[~p] VarIndex[~p]",[GSID,VarIndex]),
			0
	end.

-spec setWorldVariant(GSID,VarIndex,Value) -> boolean() when
	GSID::1 .. 255,VarIndex::uint16(),Value::int().
setWorldVariant(GSID,VarIndex,Value) when erlang:is_integer(GSID) andalso GSID > 0 andalso GSID < 256 andalso erlang:is_integer(VarIndex) ->
	case isValidWorldIndex(VarIndex) of
		true ->
			setVariant(?VariantWorldEts,getIndex(GSID,VarIndex),Value);
		_ ->
			?ERROR_OUT("Error GSID[~p] VarIndex[~p] Value[~p]",[GSID,VarIndex,Value]),
			false
	end.

-spec getPlayerVariant(RoleID,VarIndex) -> int() when
	RoleID::uint(),VarIndex::uint16().
getPlayerVariant(RoleID,VarIndex) when erlang:is_integer(VarIndex) ->
	case isValidPlayerIndex(VarIndex) of
		true ->
			getVariant(?VariantPlayerEts,getIndex(RoleID,VarIndex));
		_ ->
			?ERROR_OUT("Error RoleID[~p] VarIndex[~p]",[RoleID,VarIndex]),
			0
	end.

-spec setPlayerVariant(RoleID,VarIndex,Value) -> boolean() when
	RoleID::uint(),VarIndex::uint16(),Value::int().
setPlayerVariant(RoleID,VarIndex,Value) when erlang:is_integer(VarIndex) ->
	case isValidPlayerIndex(VarIndex) of
		true ->
			setVariant(?VariantPlayerEts,getIndex(RoleID,VarIndex),Value);
		_ ->
			?ERROR_OUT("Error RoleID[~p] VarIndex[~p] Value[~p]",[RoleID,VarIndex,Value]),
			false
	end.

%%=================================================
%%以下是开关变量API
%%=================================================

-spec getGlobalBitVariant(VarIndex) -> boolean() when
	VarIndex::uint().
getGlobalBitVariant(VarIndex) when erlang:is_integer(VarIndex) ->
	case isValidGlobalBitIndex(VarIndex) of
		true ->
			getBitVariant(?VariantGlobalEts,getBitIndex(?GlobalVariantID,VarIndex),VarIndex rem 32);
		_ ->
			?ERROR_OUT("Error get Global VarIndex[~p]",[VarIndex]),
			false
	end.

-spec setGlobalBitVariant(VarIndex,Value) -> boolean() when
	VarIndex::uint(),Value::boolean().
setGlobalBitVariant(VarIndex,Value) when erlang:is_integer(VarIndex) andalso erlang:is_boolean(Value) orelse (Value =:= 1 orelse Value =:= 0) ->
	case isValidGlobalBitIndex(VarIndex) of
		true ->
			setBitVariant(?VariantGlobalEts,getBitIndex(?GlobalVariantID,VarIndex),VarIndex rem 32,Value),
			true;
		_ ->
			?ERROR_OUT("Error set GlobalBit VarIndex[~p]",[VarIndex]),
			false
	end.

-spec getWorldBitVariant(GSID,VarIndex) -> boolean() when
	GSID::1..255,VarIndex::uint().
getWorldBitVariant(GSID,VarIndex) when erlang:is_integer(GSID) andalso GSID > 0 andalso GSID < 256 andalso erlang:is_integer(VarIndex) ->
	case isValidWorldBitIndex(VarIndex) of
		true ->
			getBitVariant(?VariantWorldEts,getBitIndex(GSID,VarIndex),VarIndex rem 32);
		_ ->
			?ERROR_OUT("Error GSID[~p] VarIndex[~p]",[GSID,VarIndex]),
			false
	end.

-spec setWorldBitVariant(GSID,VarIndex,Value) -> boolean() when
	GSID::1..255,VarIndex::uint(),Value::boolean().
setWorldBitVariant(GSID,VarIndex,Value) when erlang:is_integer(GSID) andalso GSID > 0 andalso GSID < 256 andalso erlang:is_integer(VarIndex)
	andalso erlang:is_boolean(Value) orelse (Value =:= 1 orelse Value =:= 0) ->
	case isValidWorldBitIndex(VarIndex) of
		true ->
			setBitVariant(?VariantWorldEts,getBitIndex(GSID,VarIndex),VarIndex rem 32,Value),
			true;
		_ ->
			?ERROR_OUT("Error GSID[~p] VarIndex[~p] Value[~p]",[GSID,VarIndex,Value]),
			false
	end.

-spec getPlayerBitVariant(RoleID,VarIndex) -> boolean() when
	RoleID::uint(),VarIndex::uint().
getPlayerBitVariant(RoleID,VarIndex) when erlang:is_integer(VarIndex) ->
	case isValidPlayerBitIndex(VarIndex) of
		true ->
			getBitVariant(?VariantPlayerEts,getBitIndex(RoleID,VarIndex),VarIndex rem 32);
		_ ->
			?ERROR_OUT("Error RoleID[~p] VarIndex[~p]",[RoleID,VarIndex]),
			false
	end.

-spec setPlayerBitVariant(RoleID,VarIndex,Value) -> boolean() when
	RoleID::uint(),VarIndex::uint(),Value::boolean().
setPlayerBitVariant(RoleID,VarIndex,Value) when erlang:is_integer(VarIndex) andalso erlang:is_boolean(Value) orelse (Value =:= 1 orelse Value =:= 0) ->
	case isValidPlayerBitIndex(VarIndex) of
		true ->
			setBitVariant(?VariantPlayerEts,getBitIndex(RoleID,VarIndex),VarIndex rem 32,Value),
			true;
		_ ->
			?ERROR_OUT("Error RoleID[~p] VarIndex[~p] Value[~p]",[RoleID,VarIndex,Value]),
			false
	end.

%%====================================================================
%%内部函数
%%====================================================================

-spec getVariantListByID(Ets,ID) -> [#rec_variant0{},...] | [] when Ets::etsTab(),ID::uint().
getVariantListByID(Ets,ID) ->
	{Min,Max} = getIDValueRange(ID),
	getVariantListByID(Ets,ID,Min,Max).

-spec getVariantListByID(Ets,ID,InMin,InMax) -> [#rec_variant0{},...] | [] when
	Ets::etsTab(),ID::uint(),InMin::uint(),InMax::uint().
getVariantListByID(Ets,ID,InMin,InMax) ->
	Min = getIndex(ID,InMin),
	Max = getIndex(ID,InMax),
	MS = ets:fun2ms(
		fun(#recKeyValue{key = Key} = Pair) when Key >= Min,Key < Max ->
			Pair
		end),
	List = myEts:selectEts(Ets, MS),
	Fun =
		fun(#recKeyValue{key = Key,value = Value}) ->
			Index = getIndexFromKey(Key),
			#rec_variant0{roleID = ID,index = Index,value = Value}
		end,
	lists:map(Fun, List).

-spec isValidGlobalIndex(VarIndex) -> boolean() when VarIndex::uint().
isValidGlobalIndex(VarIndex) when (VarIndex >= ?Setting_GlobalVar_Start andalso VarIndex =< ?Setting_GlobalVar_End)
	orelse (VarIndex >= ?Setting_GlobalBitVar_Start andalso VarIndex =< ?Setting_GlobalBitVar_End)
	orelse (VarIndex >= ?Setting_GlobalVarReadOnly_Start andalso VarIndex =< ?Setting_GlobalVarReadOnly_End)
	orelse (VarIndex >= ?Setting_GlobalBitVarReadOnly_Start andalso VarIndex =< ?Setting_GlobalBitVarReadOnly_End) ->
	true;
isValidGlobalIndex(_) ->
	false.

-spec isValidWorldIndex(VarIndex) -> boolean() when VarIndex::uint().
isValidWorldIndex(VarIndex) when (VarIndex >= ?Setting_WorldVar_Start andalso VarIndex =< ?Setting_WorldVar_End)
	orelse (VarIndex >= ?Setting_WorldVarReadOnly_Start andalso VarIndex =< ?Setting_WorldVarReadOnly_End)
	orelse (VarIndex >= ?Setting_WorldBitVar_Start andalso VarIndex =< ?Setting_WorldBitVar_End)
	orelse (VarIndex >= ?Setting_WorldBitVarReadOnly_Start andalso VarIndex =< ?Setting_WorldBitVarReadOnly_End) ->
	true;
isValidWorldIndex(_) ->
	false.

-spec isValidPlayerIndex(VarIndex) -> boolean() when VarIndex::uint().
isValidPlayerIndex(VarIndex) when (VarIndex >= ?Setting_PlayerVar_Start andalso VarIndex =< ?Setting_PlayerVar_End)
	orelse (VarIndex >= ?Setting_PlayerVarReadOnly_Start andalso VarIndex =< ?Setting_PlayerVarReadOnly_End)
	orelse (VarIndex >= ?Setting_ClientVar_Start andalso VarIndex =< ?Setting_ClientVar_End)
	orelse (VarIndex >= ?Setting_PlayerBitVar_Start andalso VarIndex =< ?Setting_PlayerBitVar_End)
	orelse (VarIndex >= ?Setting_PlayerBitVarReadOnly_Start andalso VarIndex =< ?Setting_PlayerBitVarReadOnly_End) ->
	true;
isValidPlayerIndex(_)  ->
	false.

-spec isValidGlobalBitIndex(VarIndex) -> boolean() when VarIndex::uint().
isValidGlobalBitIndex(VarIndex) when (VarIndex >= (?Setting_GlobalBitVar_StartBit) andalso VarIndex =< (?Setting_GlobalBitVar_EndBit))
	orelse (VarIndex >= ?Setting_GlobalBitVarReadOnly_StartBit andalso VarIndex =< ?Setting_GlobalBitVarReadOnly_EndBit) ->
	true;
isValidGlobalBitIndex(_) ->
	false.

-spec isValidWorldBitIndex(VarIndex) -> boolean() when VarIndex::uint().
isValidWorldBitIndex(VarIndex) when (VarIndex >= (?Setting_WorldBitVar_StartBit) andalso VarIndex =< ?Setting_WorldBitVar_EndBit)
	orelse (VarIndex >= ?Setting_WorldBitVarReadOnly_StartBit andalso VarIndex =< ?Setting_WorldBitVarReadOnly_EndBit) ->
	true;
isValidWorldBitIndex(_) ->
	false.

-spec isValidPlayerBitIndex(VarIndex) -> boolean() when VarIndex::uint().
isValidPlayerBitIndex(VarIndex) when (VarIndex >= ?Setting_PlayerBitVar_StartBit andalso VarIndex =< ?Setting_PlayerBitVar_EndBit)
	orelse (VarIndex >= ?Setting_PlayerBitVarReadOnly_StartBit andalso VarIndex =< ?Setting_PlayerBitVarReadOnly_EndBit)->
	true;
isValidPlayerBitIndex(_)  ->
	false.

-spec getIndex(ID,VarIndex) -> uint() when
	ID::uint(),VarIndex::uint().
getIndex(ID,VarIndex) ->
	<<VI:80>> = <<ID:64,VarIndex:16>>,
	VI.

-spec getIndexFromKey(Key) -> uint16() when
	Key::uint().
getIndexFromKey(Key) ->
	<<_ID:64,VarIndex:16>> = <<Key:80>>,
	VarIndex.

-spec getIDValueRange(ID) -> {Min,Max} when
	ID::uint(),Min::uint(),Max::uint().
getIDValueRange(ID) ->
	<<Min:80>> = <<ID:64,0:16>>,
	<<Max:80>> = <<(ID + 1):64,0:16>>,
	{Min,Max}.

-spec getBitIndex(ID,BitVarIndex) -> uint() when
	ID::uint(),BitVarIndex::uint().
getBitIndex(ID,BitVarIndex) ->
	getIndex(ID,BitVarIndex div 32).

-spec getVariant(EtsTab,Index) -> int() when
	EtsTab::etsTab(),Index::uint().
getVariant(EtsTab,Index) ->
	case myEts:lookUpEts(EtsTab,Index) of
		[] ->
			0;
		[#recKeyValue{value = Value}] ->
			Value
	end.

%%如果变量修改过并保存则返回true，否则返回false
-spec setVariant(EtsTab,Index,Value) -> boolean() when
	EtsTab::etsTab(),Index::uint16(),Value::int().
setVariant(EtsTab,Index,Value) ->
	case getVariant(EtsTab,Index) of
		Value ->
			false;
		_V ->
			ets:insert(EtsTab,#recKeyValue{key = Index,value = Value})
	end.

-spec getBitVariant(EtsTab,Index,Bit) -> boolean() when
	EtsTab::etsTab(),Index::uint16(),Bit::uint8().
getBitVariant(EtsTab,Index,Bit) ->
	V = getVariant(EtsTab,Index),
	getBit(V,Bit).

-spec setBitVariant(EtsTab,Index,Bit,BitValue) -> boolean() when
	EtsTab::etsTab(),Index::uint16(),Bit::uint8(),BitValue::boolean() | 0 | 1.
setBitVariant(EtsTab,Index,Bit,false) ->
	V = getVariant(EtsTab,Index),
	Value = V band (bnot (1 bsl Bit)),
	ets:insert(EtsTab,#recKeyValue{key = Index,value = Value});
setBitVariant(EtsTab,Index,Bit,true) ->
	V = getVariant(EtsTab,Index),
	Value = V bor (1 bsl Bit),
	ets:insert(EtsTab,#recKeyValue{key = Index,value = Value});
setBitVariant(EtsTab,Index,Bit,0) ->
	V = getVariant(EtsTab,Index),
	Value = V band (bnot (1 bsl Bit)),
	ets:insert(EtsTab,#recKeyValue{key = Index,value = Value});
setBitVariant(EtsTab,Index,Bit,1) ->
	V = getVariant(EtsTab,Index),
	Value = V bor (1 bsl Bit),
	ets:insert(EtsTab,#recKeyValue{key = Index,value = Value}).

-spec getBit(BaseNum :: non_neg_integer(), Bit :: integer()) -> boolean().
getBit(BaseNum, Bit0) ->
	Bit1 = 1 bsl Bit0,
	Bit2 = BaseNum band Bit1,
	(Bit2 bsr Bit0) > 0.
