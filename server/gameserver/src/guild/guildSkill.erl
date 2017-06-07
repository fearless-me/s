%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 军团技能
%%% @end
%%% Created : 02. 十一月 2015 10:33
%%%-------------------------------------------------------------------
-module(guildSkill).
-author("tiancheng").

-include("guildPrivate.hrl").

%% API
-export([
	researchGuildSkill/1,
	playerExitGuild/2,
	clearGuildSkill/1
]).

playerExitGuild(_GuildID, RoleID) ->
	%% 先移除其军团技能
	Sql = qlc:q([SelfSkill || SelfSkill = #rec_guild_member_skill{guildID = {_, R, _}} <- mnesia:table(rec_guild_member_skill), RoleID =:= R]),
	List = edb:selectRecord(Sql),
	F =
		fun(#rec_guild_member_skill{guildID = Key} = Skill) ->
			edb:deleteRecord(rec_guild_member_skill, Key),
			edb:writeRecord(update_rec_guild_member_skill, Skill#rec_guild_member_skill{skillID = 0}),
			ok
		end,
	lists:foreach(F, List),

	%% 再归还其学习技能消耗的货币
	backStudySkillCoin(List),
	ok.

%% 军团解散，删除军团技能和玩家学习的军团技能
clearGuildSkill(GuildID) ->
	%% 清除军团技能
	Sql1 = qlc:q([GuildSkill || GuildSkill = #rec_guild_skill{guildID = {G, _}} <- mnesia:table(rec_guild_skill), GuildID =:= G]),
	L1 = edb:selectRecord(Sql1),
	F1 =
		fun(#rec_guild_skill{guildID = Key1} = GS) ->
			edb:deleteRecord(rec_guild_skill, Key1),
			edb:writeRecord(update_rec_guild_skill, GS#rec_guild_skill{skillID = 0})
		end,
	lists:foreach(F1, L1),

	%% 清除成员购买的技能
	Sql2 = qlc:q([MemberSkill || MemberSkill = #rec_guild_member_skill{guildID = {G, _, _}} <- mnesia:table(rec_guild_member_skill), GuildID =:= G]),
	L2 = edb:selectRecord(Sql2),
	F2 =
		fun(#rec_guild_member_skill{guildID = Key1} = MS, AccRoleIDList) ->
			{GuildID, RoleID, _SkillID} = Key1,
			edb:deleteRecord(rec_guild_member_skill, Key1),
			edb:writeRecord(update_rec_guild_member_skill, MS#rec_guild_member_skill{skillID = 0}),

			case lists:member(RoleID, AccRoleIDList) of
				false ->
					[RoleID | AccRoleIDList];
				_ ->
					AccRoleIDList
			end
		end,
	RoleIDList = lists:foldl(F2, [], L2),

	F3 =
		fun(RoleID) ->
			%% 判断这个人是否在线
			case playerMgrOtp:getOnlinePlayerInfoByID(RoleID) of
				#rec_OnlinePlayer{pid = PID} ->
					%% 角色在线
					case erlang:is_pid(PID) of
						true ->
							psMgr:sendMsg2PS(PID, removeModifyGuildSkill, 0);
						_ ->
							skip
					end;
				_ ->
					skip
			end
		end,
	lists:foreach(F3, RoleIDList),

	%% 归还军团成员学习技能消耗的货币
	backStudySkillCoin(L2),
	ok.

backStudySkillCoin(SkillList) ->
	RealPer =
		case getCfg:getCfgPStack(cfg_globalsetup, guild_overskill) of
			#globalsetupCfg{setpara = [Per]} when Per > 0 -> erlang:min(Per, 1);
			_ -> 0
		end,
	case RealPer > 0 of
		true ->
			?LOG_OUT("backStudySkillCoin SkillList=~p, Per=~p", [SkillList, RealPer]),

			%% 先取出所有的RoleID
			F1 =
				fun(#rec_guild_member_skill{roleID = RID}, RoleIDAccList) ->
					case lists:member(RID, RoleIDAccList) of
						true ->
							RoleIDAccList;
						_ ->
							[RID | RoleIDAccList]
					end
				end,
			RoleIDList = lists:foldl(F1, [], SkillList),

			F2 =
				fun(RoleID) ->
					List = [Rec || Rec = #rec_guild_member_skill{roleID = RID} <- SkillList, RoleID =:= RID],
					backStudySkillCoin(RoleID, RealPer, List)
				end,
			lists:foreach(F2, RoleIDList);
		_ ->
			?ERROR_OUT("backStudySkillCoin conf error:~p", [RealPer]),
			skip
	end,
	ok.

researchGuildSkill({GuildID, RoleID, SkillID, SkillLvl, Res, NeedGLvl}) ->
	case ets:lookup(rec_guild_member, RoleID) of
		[#rec_guild_member{power = Lvl}] when Lvl >= ?GuildMemLevel_ViceLeader ->
			[#rec_guild{resource = AllRes, guildLevel = GLevel} = Guild] = ets:lookup(rec_guild, GuildID),
			case GLevel >= NeedGLvl of
				true ->
					case AllRes >= Res of
						true ->
							SkillKey = {GuildID, SkillID},
							Ret =
								case edb:readRecord(rec_guild_skill, SkillKey) of
									[#rec_guild_skill{skillLvl = SLvl} = Skill] ->
										%% 之前已经学过该技能了，本次是继续升级
										case SLvl + 1 =:= SkillLvl of
											true ->
												NewSkill = Skill#rec_guild_skill{skillLvl = SkillLvl},
												edb:checkAndSave(rec_guild_skill, SkillKey, NewSkill, new_rec_guild_skill, update_rec_guild_skill),
												true;
											_ ->
												?ErrorCode_GuildWar_GuildSearchFailed
										end;
									[] ->
										case SkillLvl =:= 1 of
											true ->
												%% 第一次学习该技能
												NewSkill = #rec_guild_skill{guildID = SkillKey, skillID = SkillID, skillLvl = SkillLvl},
												edb:checkAndSave(rec_guild_skill, SkillKey, NewSkill, new_rec_guild_skill, update_rec_guild_skill),
												true;
											_ ->
												?ErrorCode_GuildWar_GuildSearchFailed
										end
								end,
							case Ret of
								true ->
									Diff = AllRes - Res,
									NewGuild = Guild#rec_guild{resource = Diff},
                                    ets:update_element(rec_guild, GuildID, {#rec_guild.resource, Diff}),
									guildLogic:saveToMySql(NewGuild),
									ok;
								_ ->
									skip
							end,
							Ret;
						_ ->
							?ErrorCode_GuildWar_GuildResNot
					end;
				_ ->
					?ErrorCode_GuildWar_GuildLevelNot
			end;
		_ ->
			?ErrorCode_GuildWar_GuildLeaderResearchSkill
	end.

backStudySkillCoin(RoleID, RealPer, SkillList) ->
	?LOG_OUT("backStudySkillCoin RoleID=~p, SkillList=~p, Per=~p", [RoleID, SkillList, RealPer]),
	F =
		fun(#rec_guild_member_skill{skillID = SkillID, skillLvl = SkillLevel} = Skill, Acc) ->
			case getNowAndNextSkillConfID(RoleID, SkillID, SkillLevel) of
				{ConfigID1, _ConfigID2} when ConfigID1 > 0 ->
					SkillConfList = getSkillIDConfIDList(SkillID),
					Pos = misc:getListPos(ConfigID1, SkillConfList),
					SkillConfList2 = lists:sublist(SkillConfList, 1, Pos),

					FSkill =
						fun(ConfigID, Acc2) ->
							#guildskillCfg{skillid = SkillID, skilllearn = Need} = getCfg:getCfgPStack(cfg_guildskill, ConfigID),
							FMoney =
								fun({Type, Value}, Acc3) ->
									case lists:keyfind(Type, 1, Acc3) of
										{Type, OldValue} ->
											lists:keystore(Type, 1, Acc3, {Type, OldValue + Value});
										_ ->
											[{Type, Value} | Acc3]
									end
								end,
							lists:foldl(FMoney, Acc2, Need)
						end,
					lists:foldl(FSkill, Acc, SkillConfList2);
				Other ->
					?ERROR_OUT("backStudySkillCoin: roleID=~p, Skill=~p,~p", [RoleID, Skill, Other]),
					Acc
			end
		end,
	UseList = lists:foldl(F, [], SkillList),

	?LOG_OUT("backStudySkillCoin RoleID=~p, UseList=~p", [RoleID, UseList]),

	Title = stringCfg:getString(guildSkillReturnTitle),
	Str = io_lib:format("~p%", [RealPer * 100]),
	FEmail = fun
		         ({CoinType = ?CoinTypeGold, Value}) ->
			         RealValue = erlang:trunc(Value * RealPer),
			         Content = stringCfg:getString(guildSkillReturnContent1, [Str]),
			         Coin = #recMailCoin{coinType = CoinType, coinNum = RealValue},
			         mail:sendSystemMail(RoleID, Title, Content, [Coin], ""),
			         ok;
		         ({CoinType = ?CoinTypeDiamond, Value}) ->
			         RealValue = erlang:trunc(Value * RealPer),
			         Content = stringCfg:getString(guildSkillReturnContent3, [Str]),
			         Coin = #recMailCoin{coinType = CoinType, coinNum = RealValue},
			         mail:sendSystemMail(RoleID, Title, Content, [Coin], ""),
			         ok;
		         ({CoinType = ?CoinTypePrestige, Value}) ->
			         RealValue = erlang:trunc(Value * RealPer),
			         Content = stringCfg:getString(guildSkillReturnContent4, [Str]),
			         Coin = #recMailCoin{coinType = CoinType, coinNum = RealValue},
			         mail:sendSystemMail(RoleID, Title, Content, [Coin], ""),
			         ok;
		         ({CoinType = ?CoinTypeHonor, Value}) ->
			         RealValue = erlang:trunc(Value * RealPer),
			         Content = stringCfg:getString(guildSkillReturnContent5, [Str]),
			         Coin = #recMailCoin{coinType = CoinType, coinNum = RealValue},
			         mail:sendSystemMail(RoleID, Title, Content, [Coin], ""),
			         ok;
		         ({CoinType = ?CoinTypeBindDiamond, Value}) ->
			         RealValue = erlang:trunc(Value * RealPer),
			         Content = stringCfg:getString(guildSkillReturnContent6, [Str]),
			         Coin = #recMailCoin{coinType = CoinType, coinNum = RealValue},
			         mail:sendSystemMail(RoleID, Title, Content, [Coin], ""),
			         ok;
		         (Data) ->
			         ?LOG_OUT("backStudySkillCoin: roleID=~p, ~p", [RoleID, Data]),
			         skip
	         end,
	lists:foreach(FEmail, UseList),
	ok.

getNowAndNextSkillConfID(RoleID, SkillID, SkillLvl) ->
	case getSkillIDConfList(SkillID) of
		[] ->
			?ERROR_OUT("getSkillAndNextConfID is null:{~p,~p} roleID=~p", [SkillID, SkillLvl, RoleID]),
			{0, 0};
		ConfList ->
			case SkillLvl =< 0 of
				true ->
					%% 从头开始取
					[#guildskillCfg{id = ID}|_] = ConfList,
					{0, ID};
				_ ->
					%% 从中间或最后开始取
					case lists:keyfind(SkillLvl, #guildskillCfg.skilllevel, ConfList) of
						#guildskillCfg{id = ID} = Con ->
							Len = erlang:length(ConfList),
							Pos = misc:getListPos(Con, ConfList),
							case Pos =:= Len of
								true ->
									{ID, 0};
								_ ->
									#guildskillCfg{id = ID2} = lists:nth(Pos + 1, ConfList),
									{ID, ID2}
							end;
						_ ->
							?ERROR_OUT("getSkillAndNextConfID:{~p,~p} roleID=~p ConfList=~p",
								[SkillID, SkillLvl, RoleID, ConfList]),
							[#guildskillCfg{id = ID}|_] = ConfList,
							{0, ID}
					end
			end
	end.

getSkillIDConfList(SkillID) ->
	KeyList = getCfg:get1KeyList(cfg_guildskill),
	F =
		fun(Key, Acc) ->
			case getCfg:getCfgByArgs(cfg_guildskill,Key) of
				#guildskillCfg{skillid = SkillID} = Conf ->
					[Conf | Acc];
				_ ->
					Acc
			end
		end,
	L = lists:foldl(F, [], KeyList),
	lists:keysort(#guildskillCfg.skilllevel, L).

getSkillIDConfIDList(SkillID) ->
	List = getSkillIDConfList(SkillID),
	[ConfigID || #guildskillCfg{id = ConfigID} <- List].