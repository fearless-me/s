%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20170220
%%%-------------------------------------------------------------------
-module(acSnowmanState).
-author("meitianyang").

-include("acSnowmanPrivate.hrl").

%% API
-compile(export_all).

%%% ====================================================================
%%% 活动地图管理
%%% ====================================================================

%%% --------------------------------------------------------------------
%% 初始化地图ETS
-spec initMapInfoEts() -> ok.
initMapInfoEts() ->
	ets:new(?EtsMapInfo, [private, named_table, set, {keypos, #recMapInfo.guildID}, {write_concurrency, true}, {read_concurrency, true}]),
	ets:new(?EtsMapPid2MapInfo, [private, named_table, set, {keypos, #recMapPid2MapInfo.mapPid}, {write_concurrency, true}, {read_concurrency, true}]),
	ok.

%% 活动阶段
getStage() ->
	case get('Stage') of
		undefined -> ?ActivityPhase_Close;
		V -> V
	end.

setStage(Stage) ->
	put('Stage', Stage).

%%% --------------------------------------------------------------------
%% 覆写地图数据
-spec replaceMapInfo(MapInfo::#recMapInfo{}) -> ok.
replaceMapInfo(#recMapInfo{mapPid = undefined} = MapInfo) ->
	ets:insert(?EtsMapInfo, MapInfo),
	ok;
replaceMapInfo(#recMapInfo{mapPid = MapPid, guildID = GuildID} = MapInfo) ->
	ets:insert(?EtsMapInfo, MapInfo),
	ets:insert(?EtsMapPid2MapInfo, #recMapPid2MapInfo{mapPid = MapPid, guildID = GuildID}),
	ok.

%%% --------------------------------------------------------------------
%% 删除地图数据
-spec deleteMapInfo(#recMapInfo{} | pid() | uint64()) -> ok.
deleteMapInfo(#recMapInfo{mapPid = MapPid, guildID = GuildID}) ->
	ets:delete(?EtsMapInfo, GuildID),
	ets:delete(?EtsMapPid2MapInfo, MapPid),
	ok;
deleteMapInfo(MapPid) when erlang:is_pid(MapPid) ->
	case getMapInfoByMapPid(MapPid) of
		#recMapInfo{guildID = GuildID} ->
			ets:delete(?EtsMapInfo, GuildID),
			ets:delete(?EtsMapPid2MapInfo, MapPid);
		_ ->
			skip
	end,
	ok;
deleteMapInfo(GuildID) ->
	case getMapInfoByGuildID(GuildID) of
		#recMapInfo{mapPid = MapPid} ->
			ets:delete(?EtsMapInfo, GuildID),
			ets:delete(?EtsMapPid2MapInfo, MapPid);
		_ ->
			skip
	end,
	ok.

%%% --------------------------------------------------------------------
%% 使用公会ID查找地图数据
-spec getMapInfoByGuildID(GuildID::uint64()) -> #recMapInfo{} | undefined.
getMapInfoByGuildID(0) ->
	undefined;
getMapInfoByGuildID(GuildID) ->
	case ets:lookup(?EtsMapInfo, GuildID) of
		[#recMapInfo{} = Rec] ->
			Rec;
		_ ->
			undefined
	end.

%%% --------------------------------------------------------------------
%% 使用角色ID查找地图数据
-spec getMapInfoByRoleID(RoleID::uint64()) -> #recMapInfo{} | undefined.
getMapInfoByRoleID(0) ->
	undefined;
getMapInfoByRoleID(RoleID) ->
	case ets:lookup(rec_guild_member, RoleID) of
		[#rec_guild_member{guildID = GuildID}] ->
			getMapInfoByGuildID(GuildID);
		_ ->
			undefined
	end.

%%% --------------------------------------------------------------------
%% 使用MapPid查找地图数据
-spec getMapInfoByMapPid(MapPid::pid()) -> #recMapInfo{} | undefined.
getMapInfoByMapPid(MapPid) ->
	case ets:lookup(?EtsMapPid2MapInfo, MapPid) of
		[#recMapPid2MapInfo{guildID = GuildID}] ->
			getMapInfoByGuildID(GuildID);
		_ ->
			undefined
	end.

%%% --------------------------------------------------------------------
%% 获取指定状态的非GM地图
-spec getListMapInfo() -> [#recMapInfo{}, ...].
getListMapInfo() ->
	FunGet =
		fun
			(#recMapInfo{isGM = true}, R) ->
				R;
			(#recMapInfo{isGM = false} = Rec, R) ->
				[Rec | R]
		end,
	ets:foldl(FunGet, [], ?EtsMapInfo).

%%% --------------------------------------------------------------------
%% 辅助：使用角色ID查找公会ID
-spec getGuildIDByRoleID(RoleID::uint64()) -> {GuildID::uint64(), GuildLevel::uint64()}|0.
getGuildIDByRoleID(RoleID) ->
	case ets:lookup(rec_guild_member, RoleID) of
		[#rec_guild_member{guildID = GuildID}] ->
			case ets:lookup(rec_guild, GuildID) of
				[#rec_guild{guildLevel = GuildLevel}] ->
					{GuildID, GuildLevel};
				_ ->
					0
			end;
		_ ->
			0
	end.

%%% ====================================================================
%%% 家族数据里的雪人礼盒状态
%%% 注意：与活动数据里的雪人状态不同，活动需要结算后才将数据写入家族中，活动开始时重置家族里的数据
%%% ====================================================================

%%% --------------------------------------------------------------------
%% 非活动雪人状态
-spec getSnowmanNormal(GuildID::uint64()) -> Count::uint32().
getSnowmanNormal(GuildID) ->
	case ets:lookup(rec_guild, GuildID) of
		[#rec_guild{snowman = Count}] ->
			Count;
		_ ->
			0	%% 找不到公会取默认值0
	end.

%%%% --------------------------------------------------------------------
%%% 已领取的雪人礼盒
%-spec getSnowmanGift(RoleID::uint64()) -> ListIsReward::[boolean(), ...].
%getSnowmanGift(RoleID) ->
%	LastTime = variant:getPlayerVariant(RoleID, ?Setting_PlayerVarReadOnly_SnowmanGiftLastTime),
%	TimeBegin =
%		case memDBCache:getSundries(?Sundries_ID_Snowman, ?Sundries_SnowmanSubID_BeginTime) of
%			[#rec_sundries{value = TimeBegin_}] ->
%				TimeBegin_;
%			_ ->
%				0
%		end,
%	GiftState =
%		case LastTime < TimeBegin of
%			true ->
%				0;	%% 时间陈旧，只能取默认值
%			_ ->
%				variant:getPlayerVariant(RoleID, ?Setting_PlayerVarReadOnly_SnowmanGift)
%		end,
%	FunCreateList =
%		fun(Bit, ListR) ->
%			case GiftState band Bit of
%				Bit ->
%					[true | ListR];
%				_ ->
%					[false | ListR]
%			end
%		end,
%	ListR = lists:foldl(FunCreateList, [], ?ListBitOfUint32),
%	lists:reverse(ListR).
%
%-spec getSnowmanGift(RoleID::uint64(), ID::uint32()) -> IsReward::boolean().
%getSnowmanGift(RoleID, ID) when ID >= 1, ID =< 32 ->
%	lists:nth(ID, getSnowmanGift(RoleID));
%getSnowmanGift(RoleID, ID) ->
%	?ERROR_OUT("getSnowmanGift invalid ID:~p with RoleID:~p", [ID, RoleID]),
%	true.

%%%% --------------------------------------------------------------------
%%% 设置雪人礼盒状态
%-spec setSnowGift(RoleID::uint64(), GiftState::uint32()) -> ok.
%setSnowGift(RoleID, GiftState) ->
%	TimeNow = time:getSyncTime1970FromDBS(),
%	variant:setPlayerVariant(RoleID, ?Setting_PlayerVarReadOnly_SnowmanGiftLastTime, TimeNow),
%	variant:setPlayerVariant(RoleID, ?Setting_PlayerVarReadOnly_SnowmanGift, GiftState).
%-spec setSnowGift(RoleID::uint64(), GiftStateBit::boolean(), ID::uint32()) -> ok.
%setSnowGift(RoleID, true, ID) when ID >= 1, ID =< 32 ->
%	TimeNow = time:getSyncTime1970FromDBS(),
%	variant:setPlayerVariant(RoleID, ?Setting_PlayerVarReadOnly_SnowmanGiftLastTime, TimeNow),
%	GiftStateOld = variant:getPlayerVariant(RoleID, ?Setting_PlayerVarReadOnly_SnowmanGift),
%	GiftStateNew = GiftStateOld bor lists:nth(ID, ?ListBitOfUint32),
%	variant:setPlayerVariant(RoleID, ?Setting_PlayerVarReadOnly_SnowmanGift, GiftStateNew);
%setSnowGift(RoleID, false, ID) when ID >= 1, ID =< 32 ->
%	TimeNow = time:getSyncTime1970FromDBS(),
%	variant:setPlayerVariant(RoleID, ?Setting_PlayerVarReadOnly_SnowmanGiftLastTime, TimeNow),
%	GiftStateOld = variant:getPlayerVariant(RoleID, ?Setting_PlayerVarReadOnly_SnowmanGift),
%	GiftStateNew = GiftStateOld band lists:nth(ID, ?ListNotBitOfUint32),
%	variant:setPlayerVariant(RoleID, ?Setting_PlayerVarReadOnly_SnowmanGift, GiftStateNew);
%setSnowGift(RoleID, GiftStateBit, ID) ->
%	?ERROR_OUT("setSnowGift invalid ID:~p with RoleID:~p GiftStateBit:~p", [ID, RoleID, GiftStateBit]),
%	ok.

%%% ====================================================================
%%% 各种配置
%%% ====================================================================

%%% --------------------------------------------------------------------
%% 雪人NpcID组
configNpcID() ->
	#globalsetupCfg{setpara = ListNpcID} =
		getCfg:getCfgPStack(cfg_globalsetup, guild_snowman_npcID),
	ListNpcID.

%%% --------------------------------------------------------------------
%% 查找指定类型ID对应的表键值ID
-spec configSnowmanID(ItemOrCollectID::uint32(), Type::type_Src()) -> ID::uint32().
configSnowmanID(ItemOrCollectID, Type) ->
	List1Key = getCfg:get1KeyList(cfg_guildsnowman),
	FunFind =
		fun(ID, _) ->
			case getCfg:getCfgByKey(cfg_guildsnowman, ID) of
				#guildsnowmanCfg{srcID = ItemOrCollectID, srcType = Type} ->
					{true, ID};
				_ ->
					{false, 0}
			end
		end,
	{_, ID} = misc:foldlEx(FunFind, {false, 0}, List1Key),
	ID.

%%% --------------------------------------------------------------------
%% 查找指定ID的snowman配置
-spec configSnowman(ID::uint32()) -> #guildsnowmanCfg{} | undefined.
configSnowman(ID) ->
	case getCfg:getCfgByKey(cfg_guildsnowman, ID) of
		#guildsnowmanCfg{} = Cfg ->
			Cfg;
		_ ->
			?ERROR_OUT("configSnowman can not find ID:~p from cfg_guildsnowman", [ID]),
			undefined
	end.

%%% --------------------------------------------------------------------
%% 查找所有材料的雪人需求上限
-spec configSnowmanNeed() -> [uint32(), ...].
configSnowmanNeed() ->
	List1Key = getCfg:get1KeyList(cfg_guildsnowman),
	FunFind =
		fun(ID, R) ->
			#guildsnowmanCfg{snowmanNeed = Need} =
				getCfg:getCfgPStack(cfg_guildsnowman, ID),
			[Need | R]
		end,
	ListR = lists:foldl(FunFind, [], List1Key),
	lists:reverse(ListR).

