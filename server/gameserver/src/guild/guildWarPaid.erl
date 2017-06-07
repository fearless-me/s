%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 军团城战竞价出资
%%% @end
%%% Created : 19. 十月 2015 15:31
%%%-------------------------------------------------------------------
-module(guildWarPaid).
-author("tiancheng").

-include("guildPrivate.hrl").
-include("activityDef.hrl").

%% API
-export([
	loadGuildWarPaidSuccess/0,
	joinGuildWarBidding/1,
	allocGuildWar/0
]).

-export([
	allocGuildWar2/1,
	deleteGuild/1,
	afreshallocWarList/0
]).

%% 重新生成对战列ge
-spec afreshallocWarList() -> ok.
afreshallocWarList() ->
	List2 = edb:readAllRecord(rec_guild_war),
	F2 =
		fun(#rec_guild_war{stage = Stage}) ->
			edb:deleteRecord(rec_guild_war, Stage),
			guildLogic:saveToMySql({deleteGuildWar, Stage})
		end,
	lists:foreach(F2, List2),
	guildWarPaid:allocGuildWar2(time:getSyncTime1970FromDBS()),
	?LOG_OUT("afreshallocWarList:~p -> ~p", [List2, edb:readAllRecord(rec_guild_war)]),
	ok.

deleteGuild(GuildID) ->
	case edb:dirtyReadRecord(rec_guild_war_paid, GuildID) of
		[#rec_guild_war_paid{}] ->
			%% 从内存数据库中移除
			edb:deleteRecord(rec_guild_war_paid, GuildID),

			%% 删除这个军团的投资
			guildLogic:saveToMySql({deleteGuildWarPaid, GuildID});
		_ ->
			skip
	end,
	ok.

allocGuildWar() ->
	NowTime = time:getSyncTime1970FromDBS(),
	%% 判断是不是整周
	{{Year, Month, Day}, {Hour, _Minute, _Second}} = time:convertSec2DateTime(NowTime),
	%% 7表示星期天，1表示星期一
	Week = calendar:day_of_the_week(Year, Month, Day),
	if
		Week =:= 1 ->
			checkVersion();
		Week =:= 3 andalso Hour >= 12 andalso Hour < 19 ->
			allocGuildWar2(NowTime);
		true ->
			skip
	end,
	ok.

allocGuildWar2(NowTime) ->
	case edb:readAllRecord(rec_guild_war) of
		[] ->
			case edb:readAllRecord(rec_guild_war_paid) of
				[] ->
					skip;
				List ->
					Len = erlang:length(List),
					RealList =
						case Len =< ?GuildWarMaxNumber of
							true ->
								List;
							_ ->
								Fun =
									fun(#rec_guild_war_paid{guildID = G1, paidmoney = P1}, #rec_guild_war_paid{guildID = G2, paidmoney = P2}) ->
										if
											P1 > P2 -> true;
											P1 =:= P2 andalso G1 < G2 -> true;
											true ->
												false
										end
									end,
								List2 = lists:sort(Fun, List),
								{List4, List3} = lists:split(?GuildWarMaxNumber, List2),
								returnWarResource(List3, true),
								List4
						end,

					%% 打乱分组
					RealList2 = breakRank(RealList, []),
					AllocList = allocGroup(erlang:length(RealList2), RealList2),
					NowTime = time:getSyncTime1970FromDBS(),
					F =
						fun(#rec_guild_war{} = War) ->
							NWar = War#rec_guild_war{wartime = NowTime},
							edb:writeRecord(NWar),
							guildLogic:saveToMySql(NWar)
						end,
					lists:foreach(F, AllocList),

					%% 邮件告诉这些军团，准备比赛
					noticeToGuild(RealList2),
					ok
			end;
		_ ->
			skip
	end.

joinGuildWarBidding(Data) ->
	case isInApplyPhase() of
		true ->
			%% 先检查版本号
			checkVersion(),

			Ret = joinGuildWarBidding2(Data),
			?LOG_OUT("joinGuildWarBidding:~p,~p", [Data, Ret]),
			Ret;
		_ ->
			{false, {?ErrorCode_GuildWar_NotInTime, []}}
	end.

joinGuildWarBidding2({TargetGuilID, RoleID}) ->
	case guildLogic:queryRoleGuildInfo(RoleID) of
		{#rec_guild{guildID = TargetGuilID, resource = Res} = Guild, #rec_guild_member{power = Lvl}} when Lvl >= ?GuildMemLevel_ViceLeader ->
			%% 提升自己的份额
			case edb:dirtyReadRecord(rec_guild_war_paid, TargetGuilID) of
				[#rec_guild_war_paid{paidmoney = Money} = Paid] ->
					#globalsetupCfg{setpara = [NeedMoney]} = getCfg:getCfgPStack(cfg_globalsetup, bidding),
					SXMoney = Res - NeedMoney,
					case SXMoney >= 0 of
						true ->
							NGuild = Guild#rec_guild{resource = SXMoney},
                            ets:update_element(rec_guild, TargetGuilID, {#rec_guild.resource, SXMoney}),
							guildLogic:saveToMySql(NGuild),

							NPaid = Paid#rec_guild_war_paid{paidmoney = Money + NeedMoney},
							edb:writeRecord(NPaid),
							guildLogic:saveToMySql(NPaid),
							{true, {?ErrorCode_GuildWar_CHUJIASuccess, [Money + NeedMoney]}};
						_ ->
							{false, {?ErrorCode_GuildWar_CHUJIAFailed, []}}
					end;
				_ ->
					{false, {?ErrorCode_GuildWar_YourGuildNotIn, []}}
			end;
		{#rec_guild{guildID = GuildID, guildName = GuildName,resource = Res} = Guild, #rec_guild_member{power = Lvl}} when Lvl >= ?GuildMemLevel_ViceLeader ->
			%% 要压别人一头！
			case edb:dirtyReadRecord(rec_guild_war_paid, GuildID) of
				[#rec_guild_war_paid{}] ->
					%% 你当前已经在竞价列表中
					{false, {?ErrorCode_GuildWar_GuildOneZG, []}};
				_ ->
					%% 自己不在竞价列表中，检测是否已满，没满直接占坑，满了就替换别人
					L = edb:readAllRecord(rec_guild_war_paid),
					#globalsetupCfg{setpara = [NeedMoney]} = getCfg:getCfgPStack(cfg_globalsetup, bidding),
					case erlang:length(L) < ?GuildWarMaxNumber of
						true ->
							%% 占个坑
							SXMoney = Res - NeedMoney,
							case SXMoney >= 0 of
								true ->
									NGuild = Guild#rec_guild{resource = SXMoney},
                                    ets:update_element(rec_guild, GuildID, {#rec_guild.resource, SXMoney}),
									guildLogic:saveToMySql(NGuild),

									%% 自己进入竞价列表
									NPaid = #rec_guild_war_paid{guildID = GuildID, paidmoney = NeedMoney},
									edb:writeRecord(NPaid),
									guildLogic:saveToMySql(NPaid),
									{true, {?ErrorCode_GuildWar_JingJiaSuccess, []}};
								_ ->
									{false, {?ErrorCode_GuildWar_JingJiaFailed, [NeedMoney]}}
							end;
						false ->
							%% 替换别人
							case edb:dirtyReadRecord(rec_guild_war_paid, TargetGuilID) of
								[#rec_guild_war_paid{paidmoney = Money}] ->
									%% 需要超越别人军团
									SXMoney = Res - Money - NeedMoney,
									case SXMoney >= 0 of
										true ->
											%% 替换掉出价最低的人，当有多个同样低的军团时，检测目标军团是否在其中，如果是，则依然替换目标军团
											%% 如果不是，则随机替换最低的一个
											%% 最重要的一点，出价，依然按照最高的出
											AllList = edb:readAllRecord(rec_guild_war_paid),
											AllList2 = [#rec_guild_war_paid{paidmoney = LowPM1}|_] = lists:keysort(#rec_guild_war_paid.paidmoney, AllList),
											{LowList, _} = lists:splitwith(fun(#rec_guild_war_paid{paidmoney = LowPM2}) -> LowPM2 =< LowPM1 end, AllList2),

											%% 判断目标是否在最低当中，如果是，则替换，如果不是，则随机一个
											#rec_guild_war_paid{guildID = LowGuildID} = LowPaid =
												case LowList of
													[#rec_guild_war_paid{} = Low1] -> Low1;
													_ ->
														case lists:keyfind(TargetGuilID, #rec_guild_war_paid.guildID, LowList) of
															#rec_guild_war_paid{} = Low2 ->
																Low2;
															_ ->
																lists:nth(misc:rand(1, erlang:length(LowList)), LowList)
														end
												end,

											%% 扣掉自己的竞价资金
											NGuild = Guild#rec_guild{resource = SXMoney},
                                            ets:update_element(rec_guild, GuildID, {#rec_guild.resource, SXMoney}),
											guildLogic:saveToMySql(NGuild),

											%% 退回这个军团的资金
											returnWarResource(LowPaid, true),

											%% 提示给这个军团，被别人超越
											Str = stringCfg:getString(guildWarOtherGuildCY, [GuildName]),
											case guildLogic:getOnlinePidList(LowGuildID) of
												[Pid | _] ->
													psMgr:sendMsg2PS(Pid, guildChatNotice, Str);
												_ ->
													skip
											end,

											%% 自己进入竞价列表
											NPaid = #rec_guild_war_paid{guildID = GuildID, paidmoney = Money + NeedMoney},
											edb:writeRecord(NPaid),
											guildLogic:saveToMySql(NPaid),
											{true, {?ErrorCode_GuildWar_JingJiaSuccessQD, [guildLogic:getGuildName(LowGuildID)]}};
										_ ->
											{false, {?ErrorCode_GuildWar_JingJiaFailed, [Money + NeedMoney]}}
									end;
								_ ->
									{false, {?ErrorCode_GuildWar_JingJiaKengMore, []}}
							end
					end
			end;
		{#rec_guild{}, #rec_guild_member{}} ->
			{false, {?ErrorCode_GuildWar_OnlyVicLeader, []}};
		_ ->
			{false, {?ErrorCode_GuildWar_OnlyGuildJoin, []}}
	end.

%% 是否在竞价时间段（周一 04 ~ 周三 11:59:59）
isInApplyPhase() ->
	NowTime = time:getSyncTime1970FromDBS(),
	%% 判断是不是整周
	{{Year, Month, Day}, {Hour, _Minute, _Second}} = time:convertSec2DateTime(NowTime),
	%% 7表示星期天，1表示星期一
	Week = calendar:day_of_the_week(Year, Month, Day),
	if
		Week =:= 1 andalso Hour >= ?ResetTimeHour -> true;
		Week =:= 2 -> true;
		Week =:= 3 andalso Hour < 12 -> true;
		true -> false
	end.

%% 加载数据成功
-spec loadGuildWarPaidSuccess() -> ok.
loadGuildWarPaidSuccess() ->
	%% 检查版本号
	checkVersion(),

	%% 移除多余数据
	List = edb:readAllRecord(rec_guild_war_paid),
	case erlang:length(List) =< ?GuildWarMaxNumber of
		true ->
			skip;
		_ ->
			%% 判断是否需要退回，以及重新生成对战列表
			%% 竞价阶段，需要退回
			%% 竞价完成，未开始比赛阶段，需要退回
			%% 比赛完成，不再退回
			Fun =
				fun(#rec_guild_war_paid{guildID = G1, paidmoney = P1}, #rec_guild_war_paid{guildID = G2, paidmoney = P2}) ->
					if
						P1 > P2 -> true;
						P1 =:= P2 andalso G1 < G2 -> true;
						true ->
							false
					end
				end,
			List2 = lists:sort(Fun, List),
			{_List4, List3} = lists:split(?GuildWarMaxNumber, List2),

			IsBackMoney =
				case getCfg:getCfgPStack(cfg_activity, ?ActivityType_GuildWar) of
					#activityCfg{cycletype = ?ActivityCycle_Week, starttime = [{_StartWeek, StartHour}], stage = [Sec|_]} ->
						NowTime = time:getSyncTime1970FromDBS(),
						%% 判断是不是整周
						{{Year, Month, Day}, {Hour, Minute, Second}} = time:convertSec2DateTime(NowTime),
						%% 7表示星期天，1表示星期一
						Week = calendar:day_of_the_week(Year, Month, Day),

						H1 = StartHour * 3600 + Sec - 100,    % 正式开始时间
						H2 = Hour * 3600 + Minute * 60 + Second,    % 当前时间
						if
							Week =:= 1 andalso Hour >= ?ResetTimeHour -> true;
							Week =:= 2 -> true;
							Week =:= 3 andalso H2 < H1 -> true;
							true -> false
						end;
					_ -> false
				end,
			?LOG_OUT("loadGuildWarPaidSuccess:dec list:~p,~p", [List3, IsBackMoney]),
			case IsBackMoney of
				true ->
					returnWarResource(List3, true),

					%% 如果到了该刷的时候，就刷一波
					loadAndFreshWarList(),
					ok;
				_ ->
					returnWarResource(List3, false)
			end,
			ok
	end,
	ok.

loadAndFreshWarList() ->
	%% 重新生成对战列表，这里要判断下时间
	NowTime = time:getSyncTime1970FromDBS(),
	%% 判断是不是整周
	{{Year, Month, Day}, {Hour, _Minute, _Second}} = time:convertSec2DateTime(NowTime),
	%% 7表示星期天，1表示星期一
	Week = calendar:day_of_the_week(Year, Month, Day),
	if
		Week =:= 3 andalso Hour >= 12 andalso Hour < 19 ->
			afreshallocWarList();
		true ->
			skip
	end,
	ok.

%% 移出军团，退回资金
returnWarResource([], _IsBackMoney) ->
	ok;
returnWarResource(#rec_guild_war_paid{guildID = GuildID, paidmoney = PaidMoney} = Guild, IsBackMoney) ->
	?LOG_OUT("returnWarResource:~p,~p,~p", [GuildID, PaidMoney, IsBackMoney]),

	case IsBackMoney of
		true ->
			case ets:lookup(rec_guild, GuildID) of
				[#rec_guild{resource = OldRes} = G] ->
					NG = G#rec_guild{resource = OldRes + PaidMoney},
                    ets:update_element(rec_guild, GuildID, {#rec_guild.resource, OldRes + PaidMoney}),
					guildLogic:saveToMySql(NG);
				Error ->
					?ERROR_OUT("returnWarResource, not find guild~p,~p", [Guild, Error])
			end,
			ok;
		_ ->
			?LOG_OUT("returnWarResource not back money:~p", [Guild]),
			skip
	end,

	%% 从内存数据库中移除
	edb:deleteRecord(rec_guild_war_paid, GuildID),

	%% 删除这个军团的投资
	guildLogic:saveToMySql({deleteGuildWarPaid, GuildID}),
	ok;
returnWarResource([#rec_guild_war_paid{} = Guild | Right], IsBackMoney) ->
	returnWarResource(Guild, IsBackMoney),
	returnWarResource(Right, IsBackMoney);
returnWarResource(Other, IsBackMoney) ->
	?ERROR_OUT("returnWarResource:~p,~p", [Other, IsBackMoney]),
	ok.

%% 分组
allocGroup(1, List) ->
	[
		#rec_guild_war_paid{guildID = G1}
	] = List,
	[#rec_guild_war{stage = {1, 1}, group = 1, guildID1 = G1, guildID2 = 0, guildID3 = 0, winguildID = 0}];
allocGroup(2, List) ->
	[
		#rec_guild_war_paid{guildID = G1},
		#rec_guild_war_paid{guildID = G2}
	] = List,
	[#rec_guild_war{stage = {1, 1}, group = 1, guildID1 = G1, guildID2 = G2, guildID3 = 0, winguildID = 0}];
allocGroup(3, List) ->
	[
		#rec_guild_war_paid{guildID = G1},
		#rec_guild_war_paid{guildID = G2},
		#rec_guild_war_paid{guildID = G3}
	] = List,
	[#rec_guild_war{stage = {1, 1}, group = 1, guildID1 = G1, guildID2 = G2, guildID3 = G3, winguildID = 0}];
allocGroup(4, List) ->
	[
		#rec_guild_war_paid{guildID = G1},
		#rec_guild_war_paid{guildID = G2},
		#rec_guild_war_paid{guildID = G3},
		#rec_guild_war_paid{guildID = G4}
	] = List,
	[
		#rec_guild_war{stage = {1, 1}, group = 1, guildID1 = G1, guildID2 = G2, guildID3 = 0, winguildID = 0},
		#rec_guild_war{stage = {1, 2}, group = 2, guildID1 = G3, guildID2 = G4, guildID3 = 0, winguildID = 0}
	];
allocGroup(5, List) ->
	[
		#rec_guild_war_paid{guildID = G1},
		#rec_guild_war_paid{guildID = G2},
		#rec_guild_war_paid{guildID = G3},
		#rec_guild_war_paid{guildID = G4},
		#rec_guild_war_paid{guildID = G5}
	] = List,
	[
		#rec_guild_war{stage = {1, 1}, group = 1, guildID1 = G1, guildID2 = G2, guildID3 = G3, winguildID = 0},
		#rec_guild_war{stage = {1, 2}, group = 2, guildID1 = G4, guildID2 = G5, guildID3 = 0, winguildID = 0}
	];
allocGroup(6, List) ->
	[
		#rec_guild_war_paid{guildID = G1},
		#rec_guild_war_paid{guildID = G2},
		#rec_guild_war_paid{guildID = G3},
		#rec_guild_war_paid{guildID = G4},
		#rec_guild_war_paid{guildID = G5},
		#rec_guild_war_paid{guildID = G6}
	] = List,
	[
		#rec_guild_war{stage = {1, 1}, group = 1, guildID1 = G1, guildID2 = G2, guildID3 = G3, winguildID = 0},
		#rec_guild_war{stage = {1, 2}, group = 2, guildID1 = G4, guildID2 = G5, guildID3 = G6, winguildID = 0}
	];
allocGroup(7, List) ->
	[
		#rec_guild_war_paid{guildID = G1},
		#rec_guild_war_paid{guildID = G2},
		#rec_guild_war_paid{guildID = G3},
		#rec_guild_war_paid{guildID = G4},
		#rec_guild_war_paid{guildID = G5},
		#rec_guild_war_paid{guildID = G6},
		#rec_guild_war_paid{guildID = G7}
	] = List,
	[
		#rec_guild_war{stage = {1, 1}, group = 1, guildID1 = G1, guildID2 = G2, guildID3 = G3, winguildID = 0},
		#rec_guild_war{stage = {1, 2}, group = 2, guildID1 = G4, guildID2 = G5, guildID3 = 0, winguildID = 0},
		#rec_guild_war{stage = {1, 3}, group = 3, guildID1 = G6, guildID2 = G7, guildID3 = 0, winguildID = 0}
	];
allocGroup(8, List) ->
	[
		#rec_guild_war_paid{guildID = G1},
		#rec_guild_war_paid{guildID = G2},
		#rec_guild_war_paid{guildID = G3},
		#rec_guild_war_paid{guildID = G4},
		#rec_guild_war_paid{guildID = G5},
		#rec_guild_war_paid{guildID = G6},
		#rec_guild_war_paid{guildID = G7},
		#rec_guild_war_paid{guildID = G8}
	] = List,
	[
		#rec_guild_war{stage = {1, 1}, group = 1, guildID1 = G1, guildID2 = G2, guildID3 = G3, winguildID = 0},
		#rec_guild_war{stage = {1, 2}, group = 2, guildID1 = G4, guildID2 = G5, guildID3 = G6, winguildID = 0},
		#rec_guild_war{stage = {1, 3}, group = 3, guildID1 = G7, guildID2 = G8, guildID3 = 0, winguildID = 0}
	];
allocGroup(9, List) ->
	[
		#rec_guild_war_paid{guildID = G1},
		#rec_guild_war_paid{guildID = G2},
		#rec_guild_war_paid{guildID = G3},
		#rec_guild_war_paid{guildID = G4},
		#rec_guild_war_paid{guildID = G5},
		#rec_guild_war_paid{guildID = G6},
		#rec_guild_war_paid{guildID = G7},
		#rec_guild_war_paid{guildID = G8},
		#rec_guild_war_paid{guildID = G9}
	] = List,
	[
		#rec_guild_war{stage = {1, 1}, group = 1, guildID1 = G1, guildID2 = G2, guildID3 = G3, winguildID = 0},
		#rec_guild_war{stage = {1, 2}, group = 2, guildID1 = G4, guildID2 = G5, guildID3 = G6, winguildID = 0},
		#rec_guild_war{stage = {1, 3}, group = 3, guildID1 = G7, guildID2 = G8, guildID3 = G9, winguildID = 0}
	].

%% 随机打乱排序
breakRank([], Acc) ->
	Acc;
breakRank([#rec_guild_war_paid{} = Obj], Acc) ->
	[Obj | Acc];
breakRank(List, Acc) ->
	Len = erlang:length(List),
	Rand = misc:rand(1, Len),
	Obj = lists:nth(Rand, List),
	breakRank(lists:delete(Obj, List), [Obj | Acc]).

noticeToGuild([]) ->
	ok;
noticeToGuild(#rec_guild_war_paid{guildID = GuildID} = Guild) ->
	?LOG_OUT("noticeToGuild:~p", [Guild]),
	MemberList = guildLogic:getGuildMember(GuildID),
	Title = stringCfg:getString(guildWarMailTitle, []),
	Content = stringCfg:getString(guildWarMailContent, []),
	F =
		fun(#rec_guild_member{roleID = RID}) ->
			mail:sendSystemMail(RID, Title, Content, [], erlang:integer_to_list(GuildID))
		end,
	lists:foreach(F, MemberList),
	ok;
noticeToGuild([#rec_guild_war_paid{} = Paid | Right]) ->
	noticeToGuild(Paid),
	noticeToGuild(Right).

checkVersion() ->
	NowTime = time:getSyncTime1970FromDBS(),
	Date = time:convertSec2DateTime(NowTime),
	NewVersion = time:getWeekBeginSecondsByDay(Date) - time:getLocalTimeAdjustHour() * 3600,

	OldVersion =
		case memDBCache:getSundriesValue(?Sundries_ID_GuildWarStartTime, 1) of
			Value when erlang:is_integer(Value) andalso Value > 0 -> Value;
			_ -> 0
		end,

	case NewVersion =:= OldVersion of
		true ->
			skip;
		false ->
			memDBCache:saveSundries(?Sundries_ID_GuildWarStartTime, 1, NewVersion),

			%% 清档
			List = edb:readAllRecord(rec_guild_war_paid),
			F1 =
				fun(#rec_guild_war_paid{guildID = GuildID}) ->
					edb:deleteRecord(rec_guild_war_paid, GuildID),
					guildLogic:saveToMySql({deleteGuildWarPaid, GuildID})
				end,
			lists:foreach(F1, List),

			List2 = edb:readAllRecord(rec_guild_war),
			F2 =
				fun(#rec_guild_war{stage = Stage}) ->
					edb:deleteRecord(rec_guild_war, Stage),
					guildLogic:saveToMySql({deleteGuildWar, Stage})
				end,
			lists:foreach(F2, List2),

			?LOG_OUT("checkVersion:~p,~p,~p,~p", [NewVersion, OldVersion, List, List2]),

			ok
	end.