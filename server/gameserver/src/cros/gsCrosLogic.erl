%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 普通服连接跨服的逻辑，暂时移动到这里
%%% @end
%%% Created : 04. 七月 2017 14:00
%%%-------------------------------------------------------------------
-module(gsCrosLogic).
-author(tiancheng).

-include("gsInc.hrl").
-include("gsCrosPrivate.hrl").

%% API
-export([
	init/0,
	connectCrossServerAck/1
]).

-export([
	dealReward/1,
	saveRankList/1,
	dealWeekRewardToHd/0,
	saveCrosArenaRank/1,
	saveCrosArenaHightRank/1,
	dealWeekRewardToArena/0
]).

init() ->
	%% 创建活动排行榜存储ets
%%	ets:new(rec_cros_rank, [named_table, public, {keypos,#recCrosRank.rankID}]),
%%	ets:new(?EtsCrosArenaRank, [named_table, public, {keypos,#recCrosArenaRank.rankID}]),
%%	ets:new(?EtsCrosArenaHightRank, [named_table, public, duplicate_bag]),
	ok.

%% 连接跨服成功
-spec connectCrossServerAck(Data::tuple()) -> ok.
connectCrossServerAck({DbID}) ->
	?LOG_OUT("connect cros server ack dbID [~p]", [DbID]),
	%% 这是魔灵时的跨服战场与血腥角斗场，目前不需要，注释掉
%%	oldCrossActivity({DbID}),

	%% ?EtsRealGSID 维护
	%% 连接跨服成功后，请求db读取merge_log
	gsSendMsg:sendMsg2DBServer(loadMergeLog, 0, 0),

	ok.

oldCrossActivity({DbID}) ->
	?LOG_OUT("oldCrossActivity:~p, ~p", [global:whereis_name(?PsNameCrosHd), global:whereis_name(?PsNameCrosArena)]),
	%%发送消息给跨服服务器混沌战场
	psMgr:sendMsg2PS(?PsNameCrosHd, connectSuc, {DbID, self()}),

	%%发送消息给跨服竞技战场
	psMgr:sendMsg2PS(?PsNameCrosArena, connectSuc, {DbID, self()}),

	%%定时发送奖励
	Now = time:getLocalNowSec1970(),

	%%本周第一秒
	FirstSec = time:getWeekBeginSecondsByDay(time:getLocalNowDateTime1970()),

	%%本周一更新时间
	LocalWeek = FirstSec + 4 * ?OneHourSec,

	%%本周四更新时间
	LocalFourWeek = FirstSec + 4 * ?OneHourSec + 3 * ?OneDaySec,

	%%下周一更新时间
	NextWeek = LocalWeek + 7 * ?OneDaySec,

	if
		Now >= LocalWeek andalso Now =< LocalFourWeek ->
			%%周四发奖
			?LOG_OUT("init deal week reward1 cd [~p]",[LocalFourWeek - Now]),
			erlang:send_after((LocalFourWeek - Now) * 1000, self(), {dealWeekReward, four});
		Now < LocalWeek ->
			%%周一发奖
			?LOG_OUT("init deal week reward2 cd [~p]",[LocalWeek - Now]),
			erlang:send_after((LocalWeek - Now) * 1000, self(), {dealWeekReward, one});
		true ->
			%%周一发奖
			?LOG_OUT("init deal week reward3 cd [~p]",[NextWeek - Now]),
			erlang:send_after((NextWeek - Now) * 1000, self(), {dealWeekReward, one})
	end,
	ok.

-spec saveRankList(RankList::list()) -> number().
saveRankList(RankList) ->
	ets:delete_all_objects(rec_cros_rank),
	Fun =
		fun(#battleRank{} = B, Num) ->
			Rank = #recCrosRank{
				rankID  = Num,
				dbID = B#battleRank.dbID,
				name  = B#battleRank.name,
				sname = B#battleRank.sname,
				roleID = B#battleRank.roleID,
				force = B#battleRank.force,
				record = B#battleRank.record,
				carrer = B#battleRank.carrer
			},
			ets:insert(rec_cros_rank, Rank),
			Num + 1
		end,
	lists:foldl(Fun, 1, RankList).

%%保存跨服竞技场排行榜
-spec saveCrosArenaRank(RankList::list()) -> number().
saveCrosArenaRank(RankList) ->
	ets:delete_all_objects(?EtsCrosArenaRank),
	saveCrosArenaRank(RankList, 1).
saveCrosArenaRank([], Num) ->
	Num;
saveCrosArenaRank([#arenaBattleRank{} = B | L], Num) ->
	Rank = #recCrosArenaRank{
		rankID  = Num,
		win = B#arenaBattleRank.win,
		fail = B#arenaBattleRank.fail,
		dbID = B#arenaBattleRank.dbID,
		name  = B#arenaBattleRank.name,
		sname = B#arenaBattleRank.sname,
		roleID = B#arenaBattleRank.roleID,
		force = B#arenaBattleRank.force,
		record = B#arenaBattleRank.record,
		carrer = B#arenaBattleRank.carrer
	},
	ets:insert(?EtsCrosArenaRank, Rank),
	saveCrosArenaRank(L, Num + 1).

%%保存跨服历史排行榜
-spec saveCrosArenaHightRank(RankList::list()) -> number().
saveCrosArenaHightRank(RankList) ->
	ets:delete_all_objects(?EtsCrosArenaHightRank),
	saveCrosArenaHightRank1(RankList).
saveCrosArenaHightRank1([]) ->
	ok;
saveCrosArenaHightRank1([#arenaBattleHightRank{} = B | L]) ->
	Rank = #recCrosArenaHightRank{
		win = B#arenaBattleHightRank.win,
		fail = B#arenaBattleHightRank.fail,
		dbID = B#arenaBattleHightRank.dbID,
		name  = B#arenaBattleHightRank.name,
		sname = B#arenaBattleHightRank.sname,
		roleID = B#arenaBattleHightRank.roleID,
		force = B#arenaBattleHightRank.force,
		record = B#arenaBattleHightRank.record,
		carrer = B#arenaBattleHightRank.carrer,
		time = B#arenaBattleHightRank.time
	},
	ets:insert(?EtsCrosArenaHightRank, Rank),
	saveCrosArenaHightRank1(L).


%%处理跨服竞技场周奖励
-spec dealWeekRewardToArena() -> ok.
dealWeekRewardToArena() ->
	L = ets:tab2list(?EtsCrosArenaRank),
	L1 = globalCfg:getArenaWeekRewardNo1(),
	L2 = globalCfg:getArenaWeekRewardNo2(),
	L3 = globalCfg:getArenaWeekRewardNo3(),
	[Record4, GoodsID4] = globalCfg:getArenaWeekRewardNo4(),
	[Record5, GoodsID5] = globalCfg:getArenaWeekRewardNo5(),
	[Record6, GoodsID6] = globalCfg:getArenaWeekRewardNo6(),
	[Record7, GoodsID7] = globalCfg:getArenaWeekRewardNo7(),
	Fun =
		fun(#recCrosArenaRank{roleID = RoleID, carrer = Carrer, rankID = RankID}) ->
			case core:queryRoleKeyInfoByRoleID(RoleID) of
				{} ->
					skip;
				_->
					if
						RankID =:= 1 ->
							{_, GoodsID} = lists:keyfind(Carrer, 1, L1);
						RankID =:= 2 ->
							{_, GoodsID} = lists:keyfind(Carrer, 1, L2);
						RankID =:= 3 ->
							{_, GoodsID} = lists:keyfind(Carrer, 1, L3);
						RankID =< Record4 ->
							GoodsID = GoodsID4;
						RankID =< Record5 andalso RankID > Record4 ->
							GoodsID = GoodsID5;
						RankID =< Record6 andalso RankID > Record5 ->
							GoodsID = GoodsID6;
						RankID =< Record7 andalso RankID > Record6 ->
							GoodsID = GoodsID7;
						true ->
							GoodsID = 0
					end,
					case GoodsID of
						0 ->
							skip;
						_ ->
							Ml = case playerMail:createMailGoods(GoodsID, 1, true, 0, RoleID, ?ItemSourceWeekCrosArenaReward) of
									 [#recMailItem{itemID = ItemID}|_] = MailItemList ->
										 case goods:getGoodsCfg(ItemID) of
											 #itemCfg{name = Name} ->
												 ItemName = Name;
											 _ ->
												 ItemName = ""
										 end,
										 MailItemList;
									 _ ->
										 ItemName = "",
										 []
								 end,
							Title = stringCfg:getString(arena_WeekMailTitle),
							Content = stringCfg:getString(arena_WeekMailContent, [RankID, ItemName]),
							mail:sendSystemMail(RoleID, Title, Content, Ml, "")
					end
			end
		end,
	lists:foreach(Fun, L).


%%处理跨服混沌战场周奖励
-spec dealWeekRewardToHd() -> ok.
dealWeekRewardToHd() ->
	L = ets:tab2list(rec_cros_rank),
	L1 = globalCfg:getBattleWarWeekRewardNo1(),
	L2 = globalCfg:getBattleWarWeekRewardNo2(),
	L3 = globalCfg:getBattleWarWeekRewardNo3(),
	[Record4, GoodsID4] = globalCfg:getBattleWarWeekRewardNo4(),
	[Record5, GoodsID5] = globalCfg:getBattleWarWeekRewardNo5(),
	[Record6, GoodsID6] = globalCfg:getBattleWarWeekRewardNo6(),
	[Record7, GoodsID7] = globalCfg:getBattleWarWeekRewardNo7(),
	Fun = fun(#recCrosRank{roleID = RoleID, carrer = Carrer, rankID = RankID}) ->
		case core:queryRoleKeyInfoByRoleID(RoleID) of
			{} ->
				skip;
			_->
				if
					RankID =:= 1 ->
						{_, GoodsID} = lists:keyfind(Carrer, 1, L1);
					RankID =:= 2 ->
						{_, GoodsID} = lists:keyfind(Carrer, 1, L2);
					RankID =:= 3 ->
						{_, GoodsID} = lists:keyfind(Carrer, 1, L3);
					RankID =< Record4 ->
						GoodsID = GoodsID4;
					RankID =< Record5 andalso RankID > Record4 ->
						GoodsID = GoodsID5;
					RankID =< Record6 andalso RankID > Record5 ->
						GoodsID = GoodsID6;
					RankID =< Record7 andalso RankID > Record6 ->
						GoodsID = GoodsID7;
					true ->
						GoodsID = 0
				end,
				case GoodsID of
					0 ->
						skip;
					_ ->
						Ml = case playerMail:createMailGoods(GoodsID, 1, true, 0, RoleID, ?ItemSourceWeekCrosHdBattle) of
								 [#recMailItem{itemID = ItemID}|_] = MailItemList ->
									 case goods:getGoodsCfg(ItemID) of
										 #itemCfg{name = Name} ->
											 ItemName = Name;
										 _ ->
											 ItemName = ""
									 end,
									 MailItemList;
								 _ ->
									 ItemName = "",
									 []
							 end,
						Title = stringCfg:getString(battle_war_WeekMailTitle),
						Content = stringCfg:getString(battle_war_WeekMailContent, [RankID, ItemName]),
						mail:sendSystemMail(RoleID, Title, Content, Ml, "")
				end
		end
		  end,
	lists:foreach(Fun, L).

dealReward(PlayerList) ->
	?LOG_OUT("deal cros hd battle reward ~p", [PlayerList]),
	[Record1, GoodsID1] = globalCfg:getBattleWarRewardNo1(),
	[Record2, GoodsID2] = globalCfg:getBattleWarRewardNo2(),
	[Record3, GoodsID3] = globalCfg:getBattleWarRewardNo3(),
	[Record4, GoodsID4] = globalCfg:getBattleWarRewardNo4(),
	[Record5, GoodsID5] = globalCfg:getBattleWarRewardNo5(),
	Fun = fun({RoleID, R}) ->
		if
			R >= Record5 andalso R < Record4 ->
				GoodsID = GoodsID5;
			R >= Record4 andalso R < Record3 ->
				GoodsID = GoodsID4;
			R >= Record3 andalso R < Record2 ->
				GoodsID = GoodsID3;
			R >= Record2 andalso R < Record1 ->
				GoodsID = GoodsID2;
			R >= Record1 ->
				GoodsID = GoodsID1;
			true ->
				GoodsID = 0
		end,
		case GoodsID of
			0 ->
				skip;
			_ ->
				L1 = case playerMail:createMailGoods(GoodsID, 1, true, 0, RoleID, ?ItemSourceCrosHdBattle) of
						 [#recMailItem{itemID = ItemID}|_] = MailItemList ->
							 case goods:getGoodsCfg(ItemID) of
								 #itemCfg{name = Name} ->
									 ItemName = Name;
								 _ ->
									 ItemName = ""
							 end,
							 MailItemList;
						 _ ->
							 ItemName = "",
							 []
					 end,
				Title = stringCfg:getString(battle_war_MailTitle),
				Content = stringCfg:getString(battle_war_MailContent, [R, ItemName]),
				mail:sendSystemMail(RoleID, Title, Content, L1, "")
		end
		  end,
	lists:foreach(Fun, PlayerList),
	ok.
