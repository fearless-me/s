%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 军团技能与福利BUFF
%%% @end
%%% Created : 30. 十月 2015 11:48
%%%-------------------------------------------------------------------
-module(playerGuildSkillAndBuff).
-author("tiancheng").

-include("playerPrivate.hrl").

%% 学习技能消耗军团贡献点的使用类型
-define(GuildContributeType, 1000).

%% 保存购买BUFF结果的数量
-define(GuildBuffNoteMaxNumber, 30).

%% 军团技能属性加法乘法类型
-define(GuildPropAdd, 0).
-define(GuildPropRate, 1).

%% Msg
-export([
	requestGuildSkill/0,
	researchGuildSkill/1,
	studyGuildSkill/1,
	requestGuildBuff/0,
	buyGuildBuff/1,
	getGuildBuff/1
]).

%% API
-export([
	researchGuildSkillAck/1,
	initPlayerGuildSkill/0,
	removeModifyGuildSkill/1,
	removeGuildSkill/0,
	getGuildSelfSkillList/0
]).

%% 移除购买的军团技能
-spec removeGuildSkill() -> ok.
removeGuildSkill() ->
	%% 移除军团修正属性
	removeModifyGuildSkill(),
	ok.

removeModifyGuildSkill(_) ->
	removeModifyGuildSkill().

%% 移除军团技能修正的属性
-spec removeModifyGuildSkill() -> ok.
removeModifyGuildSkill() ->
	L1 = playerPropSync:getProp(?SerProp_GuildSkillDec),
	L2 = playerPropSync:getProp(?SerProp_GuildSkillDiv),

	NL1 = [{AI, AV} || {_, AI, AV} <- L1],
	NL2 = [{RI, RV} || {_, RI, RV} <- L2],

	playerCalcProp:changeProp_AddMulti(NL1, NL2, ?EquipOff, true),

	playerPropSync:setAny(?SerProp_GuildSkillDec, []),
	playerPropSync:setAny(?SerProp_GuildSkillDiv, []),

	%% 修正军团技能增加的战斗力
	playerForce:calcPlayerForce(?PlayerGuildSkillForce, true),
	ok.

%% 初始化玩家军团技能属性
-spec initPlayerGuildSkill() -> ok.
initPlayerGuildSkill() ->
	%% 获取自己在当前军团购买的技能
	L = getSelfGuildSkillList(),
	modifyPlayerGuildSkill(L),
	ok.

modifyPlayerGuildSkill([]) -> ok;
modifyPlayerGuildSkill(#rec_guild_member_skill{skillID = SkillID, skillLvl = SkillLevel}) ->
	case getNowAndNextSkillConfID(SkillID, SkillLevel) of
		{ConfID, _} when ConfID > 0 ->
			%% 0加法值，1乘法值
			#guildskillCfg{skillproperty = Props} = getCfg:getCfgByArgs(cfg_guildskill,ConfID),

			F =
				fun({PropID, PropValue, PropType}, {AddAcc, RateAcc, BackAddAcc, BackRateAcc} = Prop) ->
					case PropType of
						?GuildPropAdd ->
							BackAddAcc2 =
								case saveAddProp(SkillID, PropID, PropValue) of
									false -> BackAddAcc;
									MP -> [MP | BackAddAcc]
								end,
							{[{PropID, PropValue} | AddAcc], RateAcc, BackAddAcc2, BackRateAcc};
						?GuildPropRate ->
							BackRateAcc2 =
								case saveRateProp(SkillID, PropID, PropValue) of
									false -> BackRateAcc;
									MP -> [MP | BackRateAcc]
								end,
							{AddAcc, [{PropID, PropValue} | RateAcc], BackAddAcc, BackRateAcc2};
						_ ->
							Prop
					end
				end,
			{AddPropL, RatePropL, BackAddPropL, BackRatePropL} = lists:foldl(F, {[], [], [], []}, Props),
			
			%% 修正军团技能增加的战斗力
			playerCalcProp:changeProp_AddMulti(BackAddPropL, BackRatePropL, AddPropL, RatePropL, true),
			playerForce:calcPlayerForce(?PlayerGuildSkillForce, true),
			ok;
		_ ->
			?ERROR_OUT("modifyPlayerGuildSkill roleID=~p, ~p, ~p", [playerState:getRoleID(), SkillID, SkillLevel]),
			skip
	end,
	ok;
modifyPlayerGuildSkill([#rec_guild_member_skill{} = Skill | Right]) ->
	modifyPlayerGuildSkill(Skill),
	modifyPlayerGuildSkill(Right).

%% 打开军团技能界面
requestGuildSkill() ->
	%% 所有的技能ID列表，不重复
	SkillIDList = getAllSkillIDList(),

	%% 当前本军团已经研究出的技能列表
	RL = getGuildSkillList(),
	%% 自己已经学习的技能列表
	SL = getSelfGuildSkillList(),

	Fun =
		fun(SkillID, {RAcc, SAcc}) ->
			%% 先处理是否已经研究
			RLvl =
				case lists:keyfind(SkillID, #rec_guild_skill.skillID, RL) of
					#rec_guild_skill{skillLvl = Lv1} -> Lv1;
					_ -> 0
				end,

			SLvl =
				case lists:keyfind(SkillID, #rec_guild_member_skill.skillID, SL) of
					#rec_guild_member_skill{skillLvl = Lv2} -> Lv2;
					_ -> 0
				end,

			{RC1, RC2} = getNowAndNextSkillConfID(SkillID, RLvl),
			{SC1, SC2} = getNowAndNextSkillConfID(SkillID, SLvl),

			R_Rec = getPKGuildSkill(SkillID, RC1, RC2),
			S_Rec = getPKGuildSkill(SkillID, SC1, SC2),
			{[R_Rec | RAcc], [S_Rec | SAcc]}
		end,
	{ResearchL, StudyL} = lists:foldl(Fun, {[], []}, SkillIDList),
%% 	?DEBUG_OUT("requestGuildSkill:ResearchL=~p, StudyL=~p", [ResearchL, StudyL]),
	playerMsg:sendNetMsg(#pk_GS2U_GuildSkill{skill = ResearchL, selfskill = StudyL}),
	ok.

%% 研究技能
researchGuildSkill(ConfID) ->
	PowerLvl = playerGuild:getGuildSelfLevel(),
	Ret =
		case PowerLvl >= ?GuildMemLevel_ViceLeader of
			true ->
				GuildLvl = playerState:getGuildLevel(),
				case getCfg:getCfgPStack(cfg_guildskill, ConfID) of
					#guildskillCfg{skillid = SID, skilllevel = SLvl, skillresearch = Res, guildlevel = GLvl} ->
						case GuildLvl >= GLvl of
							true ->
								GuildID = playerState:getGuildID(),
								psMgr:sendMsg2PS(?PsNameGuild, researchGuildSkill,
									{
										GuildID,
										playerState:getRoleID(),
										SID,
										SLvl,
										Res,
										GLvl
									}),
								ok;
							_ ->
								?ErrorCode_GuildWar_GuildLevelNot
						end;
					_ ->
						?ErrorCode_GuildWar_GuildSearchFailed
				end;
			_ ->
				?ErrorCode_GuildWar_GuildLeaderResearchSkill
		end,
	researchGuildSkillAck(Ret),
	ok.

researchGuildSkillAck(ok) -> ok;
researchGuildSkillAck(true) ->
	playerGuild:freshGuildProp(playerState:getGuildID()),
	requestGuildSkill(),
	playerMsg:sendErrorCodeMsg(?ErrorCode_GuildWar_GuildSearchSuccess),
	ok;
researchGuildSkillAck(ErrorCode) ->
	playerMsg:sendErrorCodeMsg(ErrorCode),
	ok.

%% 学习技能
studyGuildSkill(#guildskillCfg{skillid = SID, skilllevel = SLvl, skilllearn = Need}) ->
	GuildID = playerState:getGuildID(),
	RoleID = playerState:getRoleID(),

	Log = #recPLogTSMoney{
		reason = ?CoinUseGuildSkill,
		param = SID * 100 + SLvl,
		target = ?PLogTS_Guild,
		source = ?PLogTS_PlayerSelf
	},

	%% 先扣钱
	F =
		fun({Type, Value}, BoolAcc) ->
			case BoolAcc of
				true ->
					if
						Type =:= ?CoinTypeGold -> playerMoney:decCoin(?CoinTypeGold, Value, Log);
						Type =:= ?CoinTypeDiamond -> playerMoney:decCoin(?CoinTypeDiamond, Value, Log);
						Type =:= ?CoinTypeBindDiamond -> playerMoney:useCoin(?CoinUseTypeDiamond, Value, Log);
						Type =:= ?CoinTypePrestige -> playerMoney:decCoin(?CoinTypePrestige, Value, Log);
						Type =:= ?CoinTypeHonor -> playerMoney:decCoin(?CoinTypeHonor, Value, Log);
						Type =:= ?GuildContributeType -> playerMoney:decCoin(?CoinTypeGuildContribute, Value, Log);
						%Type =:= ?GuildContributeType ->	%% #rec_guild_member.liveness是加入该家族后的累计贡献，需要扣除贡献则扣除货币?CoinTypeGuildContribute
						%	%% 扣军团贡献点
						%	case ets:lookup(rec_guild_member, RoleID) of
						%		[#rec_guild_member{liveness = Con} = Member] ->
						%			?LOG_OUT("studyGuildSkill:guildID=~p,roleID=~p,contribute=~p,dec=~p",
						%				[GuildID, RoleID, Con, Value]),
						%			NewMember = Member#rec_guild_member{liveness = Con - Value},
                        %            ets:update_element(rec_guild_member, RoleID, {#rec_guild_member.liveness, Con - Value}),
						%			%% 发给CS去保存
						%			psMgr:sendMsg2PS(?PsNameGuild, guildWarBattleResult, NewMember),
						%			true;
						%		_ ->
						%			false
						%	end;
						true ->
							false
					end;
				false ->
					false
			end
		end,
	case lists:foldl(F, true, Need) of
		true ->
			%% 扣成功了，再加技能
			Key = {GuildID, RoleID, SID},
			SelfSkill = #rec_guild_member_skill{guildID = {GuildID, RoleID, SID}, roleID = RoleID, skillID = SID, skillLvl = SLvl},
			edb:dirtySave(rec_guild_member_skill, Key, SelfSkill,
				new_rec_guild_member_skill, update_rec_guild_member_skill),

			%% 修正属性
			modifyPlayerGuildSkill(SelfSkill),
			playerSevenDays:onMissionEvent(?SevenDayMission_Event_14, 1, 0),
			requestGuildSkill(),
			true;
		_ ->
			?ERROR_OUT("studyGuildSkill:guildID=~p,roleID=~p,Conf={~p,~p,~p}",
				[GuildID, RoleID, SID, SLvl, Need]),
			false
	end;
studyGuildSkill(ConfID) ->
	GuildID = playerState:getGuildID(),
	RoleID = playerState:getRoleID(),
	case GuildID > 0 of
		true ->
			Ret =
				case getCfg:getCfgPStack(cfg_guildskill, ConfID) of
					#guildskillCfg{skillid = SID, skilllevel = SLvl, skilllearn = Need} = Conf ->
						%% 先判断自身条件是否满足
						case canLearnGuildSkill(0, Need) of
							0 ->
								%% 再判断军团是否已经研究过这个技能
								case edb:readRecord(rec_guild_skill, {GuildID, SID}) of
									[#rec_guild_skill{skillLvl = GuildSkillLvl}] when GuildSkillLvl >= SLvl ->
										%% 再判断自己当前学习的技能
										case edb:readRecord(rec_guild_member_skill, {GuildID, RoleID, SID}) of
											[#rec_guild_member_skill{skillLvl = Lvl}] ->
												case Lvl + 1 =:= SLvl of
													true ->
														studyGuildSkill(Conf);
													_ ->
														?ErrorCode_GuildWar_GuildSkillStudyFailed
												end;
											[] ->
												case 1 =:= SLvl of
													true ->
														studyGuildSkill(Conf);
													_ ->
														?ErrorCode_GuildWar_GuildSkillStudyFailed
												end
										end;
									_ ->
										?ErrorCode_GuildWar_GuildSkillNotYanJiu
								end;
							ErrorCode ->
								ErrorCode
						end;
					_ ->
						?ErrorCode_GuildWar_GuildSkillStudyFailed
				end,
			case Ret of
				true ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_GuildWar_GuildSkillStudySuccess);
				ErrorC when erlang:is_integer(ErrorC) andalso ErrorC > 0 ->
					playerMsg:sendErrorCodeMsg(ErrorC);
				_ ->
					?ERROR_OUT("studyGuildSkill system error:~p,~p,~p", [GuildID,RoleID,ConfID]),
					playerMsg:sendErrorCodeMsg(?ErrorCode_GuildWar_GuildSkillStudyFailed)
			end,
			ok;
		_ ->
			skip
	end,
	ok.

%% 打开军团福利BUFF界面
requestGuildBuff() ->
	%% 已经购买的福利列表
	List = getTodayBuffList(),
	F =
		fun(#rec_guild_buff{buffID = BuffID}, Acc) ->
			case getBuffConfID(BuffID) of
				0 ->
					Acc;
				ID ->
					%% 自己今日是否学习
					IsLearn =
						case playerDaily:getDailyCounter(?DailyType_GuildBuff, BuffID) of
							0 -> 0;
							_ -> 1
						end,
					[#pk_GuildBuff{confId = ID, buffID = BuffID, getFlag = IsLearn} | Acc]
			end
		end,
	L = lists:foldl(F, [], List),
	playerMsg:sendNetMsg(#pk_GS2U_GuildBuff{buff = L}),

	%% 购买历史记录
	AL = getAllBuffList(),
	F2 =
		fun(#rec_guild_buff{buyRoleID = BRoleID, buyTime = BTime, buffID = BuffID}, AccL) ->
			case playerNameUID:getPlayerNameByUID(BRoleID) of
				[] -> AccL;
				BRoleName ->
					ConfID = getBuffConfID(BuffID),
					R = #pk_GuildBuffRole{roleID = BRoleID, roleName = BRoleName, buyTime = BTime, confId = ConfID, buffID = BuffID},
					[R | AccL]
			end
		end,
	L2 = lists:foldl(F2, [], AL),
	L3 = lists:keysort(#pk_GuildBuffRole.buyTime, L2),
	L4 = lists:reverse(L3),
	L5 = lists:sublist(L4, ?GuildBuffNoteMaxNumber),
	playerMsg:sendNetMsg(#pk_GS2U_GuildBuffRole{bgrs = L5}),
	ok.

%% 购买BUFF
buyGuildBuff(#guildbuffCfg{id = ConfID, buff = BuffID, cost = CostL, showname = ShowName}) ->
	GuildID = playerState:getGuildID(),
	RoleID = playerState:getRoleID(),
	NowTime = time:getSyncTime1970FromDBS(),
	F =
		fun() ->
			SqlBin = qlc:q([R || #rec_guild_buff{guildID = G} = R <- mnesia:table(rec_guild_buff), G =:= GuildID]),
			L1 = qlc:e(SqlBin),
			L11 = lists:keysort(#rec_guild_buff.buyTime, L1),
			L2 = lists:filter(fun(#rec_guild_buff{buyTime = BTime}) -> core:timeIsOnDay(BTime) end, L11),
			case lists:keyfind(BuffID, #rec_guild_buff.buffID, L2) of
				false ->
					Rec = #rec_guild_buff{guildID = GuildID, buffID = BuffID, buyTime = NowTime, buyRoleID = RoleID},
					mnesia:write(Rec),
					mnesia:write(new_rec_guild_buff, Rec, write),

					Len = erlang:length(L11),
					Diff = Len - (?GuildBuffNoteMaxNumber - 1),
					case Diff > 0 of
						true ->
							%% 清理多余数据
							L3 = L11 -- L2,
							L4 = lists:sublist(L3, Diff),
							FC =
								fun(#rec_guild_buff{} = RR) ->
									mnesia:delete_object(RR),
									%% 写入更新表
									mnesia:write(update_rec_guild_buff, RR#rec_guild_buff{buyRoleID = 0}, write)
								end,
							lists:foreach(FC, L4);
						_ ->
							skip
					end,
					true;
				#rec_guild_buff{} ->
					?ErrorCode_GuildWar_GuildBuffAlreadyBuy
			end
		end,
	case mnesia:transaction(F) of
		{atomic, true} ->
			%% 扣钱
			Log = #recPLogTSMoney{
				reason = ?CoinUseGuildBuff,
				param = BuffID,
				target = ?PLogTS_Guild,
				source = ?PLogTS_PlayerSelf
			},
			FDec =
				fun({Type, Value}) ->
					if
						Type =:= ?CoinTypeGold -> playerMoney:decCoin(?CoinTypeGold, Value, Log);
						Type =:= ?CoinTypeDiamond -> playerMoney:decCoin(?CoinTypeDiamond, Value, Log);
						Type =:= ?CoinTypeBindDiamond -> playerMoney:useCoin(?CoinUseTypeDiamond, Value, Log);
						Type =:= ?CoinTypePrestige -> playerMoney:decCoin(?CoinTypePrestige, Value, Log);
						Type =:= ?CoinTypeHonor -> playerMoney:decCoin(?CoinTypeHonor, Value, Log);
						true ->
							?ERROR_OUT("buyGuildBuff:buffID=~p, type=~p, value=~p", [BuffID, Type, Value])
					end
				end,
			lists:foreach(FDec, CostL),

			playerMsg:sendErrorCodeMsg(?ErrorCode_GuildWar_BuyGuildBuffSuccess),

			%% 军团之中广播
			Str = stringCfg:getString(guildmessage, [playerState:getName(), ShowName]),
			playerGuild:guildChatNotice(Str),

			%% 给自己添加领取
			getGuildBuff(ConfID),

			requestGuildBuff(),
			ok;
		{atomic, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode);
		Error ->
			?WARN_OUT("buyGuildBuff Error:~p",[Error]),
			error
	end,
	ok;
buyGuildBuff(ConfID) ->
	AL = getAllowBuyBuffConfIDList(),
	case lists:member(ConfID, AL) of
		true ->
			%% 判断是否已经购买
			GuildID = playerState:getGuildID(),
			Conf = #guildbuffCfg{buff = BuffID, cost = CostL} = getCfg:getCfgPStack(cfg_guildbuff, ConfID),
			TL = getTodayBuffList(GuildID),
			case lists:keyfind(BuffID, #rec_guild_buff.buffID, TL) of
				#rec_guild_buff{} ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_GuildWar_GuildBuffAlreadyBuy);
				_ ->
					%% 判断购买力
					?LOG_OUT("buyGuildBuff:guildID=~p,confID=~p,buffID=~p,roleID=~p", [GuildID, ConfID, BuffID, playerState:getRoleID()]),
					case canLearnGuildSkill(0, CostL) of
						0 ->
							%% 可以购买
							buyGuildBuff(Conf);
						ErrorCode ->
							playerMsg:sendErrorCodeMsg(ErrorCode)
					end
			end;
		_ ->
			?DEBUG_OUT("buyGuildBuff:~p,~p", [ConfID, AL]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_GuildWar_BuyGuildBuffFailed)
	end,
	ok.

%% 领取BUFF
getGuildBuff(ConfID) ->
	ErrorCode =
		case getCfg:getCfgPStack(cfg_guildbuff, ConfID) of
			#guildbuffCfg{buff = BuffID} ->
				case playerDaily:getDailyCounter(?DailyType_GuildBuff, BuffID) of
					0 ->
						List = getTodayBuffList(),
						case lists:keyfind(BuffID, #rec_guild_buff.buffID, List) of
							#rec_guild_buff{} ->
								%% 可以领取
								playerDaily:incDailyCounter(?DailyType_GuildBuff, BuffID),

								%% 添加BUFF
								playerBuff:addBuff(BuffID, playerState:getLevel()),

								requestGuildBuff(),

								?ErrorCode_GuildWar_GetGuildBuffSuccess;
							_ ->
								?ErrorCode_GuildWar_GuildBuffNotBuy
						end;
					_ ->
						?ErrorCode_GuildWar_AlreadyGetGuildBuff
				end;
			_ ->
				?ErrorCode_GuildWar_GetGuildBuffFailed
		end,
	playerMsg:sendErrorCodeMsg(ErrorCode),
	ok.

getTodayBuffList() -> getTodayBuffList(playerState:getGuildID()).
getTodayBuffList(0) -> [];
getTodayBuffList(GuildID) ->
	List = getAllBuffList(GuildID),
	lists:filter(fun(#rec_guild_buff{buyTime = BTime}) -> core:timeIsOnDay(BTime) end, List).
getAllBuffList() -> getAllBuffList(playerState:getGuildID()).
getAllBuffList(0) -> [];
getAllBuffList(GuildID) ->
	Match = #rec_guild_buff{guildID = GuildID, _ = '_'},
	edb:dirtyMatchRecord(rec_guild_buff, Match).

getAllowBuyBuffConfIDList() -> getAllowBuyBuffConfIDList(playerState:getGuildID()).
getAllowBuyBuffConfIDList(0) -> [];
getAllowBuyBuffConfIDList(GuildID) ->
	GuildLevel =
		case ets:lookup(rec_guild, GuildID) of
			[#rec_guild{guildLevel = Lvl}] -> Lvl;
			_ -> 0
		end,
	KeyList = getCfg:get1KeyList(cfg_guildbuff),
	F =
		fun(Key, AccConfIDL) ->
			case getCfg:getCfgByArgs(cfg_guildbuff,Key) of
				#guildbuffCfg{guildlevel = GLvl} ->
					case GuildLevel >= GLvl of
						true ->
							[Key | AccConfIDL];
						_ ->
							AccConfIDL
					end;
				_ -> AccConfIDL
			end
		end,
	lists:foldl(F, [], KeyList).

getBuffConfID(BuffID) ->
	KeyList = getCfg:get1KeyList(cfg_guildbuff),
	F =
		fun(Key, ConfID) ->
			case getCfg:getCfgByArgs(cfg_guildbuff,Key) of
				#guildbuffCfg{buff = BuffID} -> {break, Key};
				_ -> ConfID
			end
		end,
	misc:mapAccList(KeyList, 0, F).


getNowAndNextSkillConfID(SkillID, SkillLvl) ->
	case getSkillIDConfList(SkillID) of
		[] ->
			?ERROR_OUT("getSkillAndNextConfID is null:{~p,~p} roleID=~p", [SkillID, SkillLvl, playerState:getRoleID()]),
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
								[SkillID, SkillLvl, playerState:getRoleID(), ConfList]),
							[#guildskillCfg{id = ID}|_] = ConfList,
							{0, ID}
					end
			end
	end.

%% 获取所有的技能ID列表
getAllSkillIDList() ->
	KeyList = getCfg:get1KeyList(cfg_guildskill),
	F =
		fun(Key, Acc) ->
			#guildskillCfg{skillid = SkillID} = getCfg:getCfgByArgs(cfg_guildskill,Key),
			case lists:member(SkillID, Acc) of
				true ->
					Acc;
				false ->
					[SkillID | Acc]
			end
		end,
	lists:foldl(F, [], KeyList).

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

%getSkillIDConfIDList(SkillID) ->
%	List = getSkillIDConfList(SkillID),
%	[ConfigID || #guildskillCfg{id = ConfigID} <- List].

getGuildSkillList() ->
	getGuildSkillList(playerState:getGuildID()).
getGuildSkillList(0) -> [];
getGuildSkillList(GuildID) ->
	Match = #rec_guild_skill{guildID = {GuildID, _ = '_'}, _ = '_'},
	edb:dirtyMatchRecord(rec_guild_skill, Match).

%% 获取自己学习的军团技能ID
-spec getGuildSelfSkillList() -> [{SkillID::uint(), SkillLvl::uint()},...].
getGuildSelfSkillList() ->
	L = getSelfGuildSkillList(),
	[{SkillID, SkillLvl} || #rec_guild_member_skill{skillID = SkillID, skillLvl = SkillLvl} <- L].

getSelfGuildSkillList() ->
	getSelfGuildSkillList(playerState:getGuildID()).
getSelfGuildSkillList(0) -> [];
getSelfGuildSkillList(GuildID) ->
	RoleID = playerState:getRoleID(),
	Match = #rec_guild_member_skill{guildID = {GuildID, RoleID, _ = '_'}, _ = '_'},
	edb:dirtyMatchRecord(rec_guild_member_skill, Match).

canLearnGuildSkill(ErrorCode, []) ->
	ErrorCode;
canLearnGuildSkill(0, {?CoinTypeGold, Value}) ->
	case playerState:getCoin(?CoinTypeGold) >= Value of
		true -> 0;
		_ -> ?ErrorCode_TradeGold
	end;
canLearnGuildSkill(0, {?CoinTypeDiamond, Value}) ->
	case playerState:getCoin(?CoinTypeDiamond) >= Value of
		true -> 0;
		_ -> ?ErrorCode_TradeDiamond
	end;
canLearnGuildSkill(0, {?CoinTypeBindDiamond, Value}) ->
	case playerMoney:canUseCoin(?CoinUseTypeDiamond, Value) of
		true -> 0;
		_ -> ?ErrorCode_TradeDiamond
	end;
canLearnGuildSkill(0, {?CoinTypePrestige, Value}) ->
	case playerMoney:canUseCoin(?CoinUseTypePrestige, Value) of
		true -> 0;
		_ -> ?ErrorCode_GuildWar_PrestigeNotEnough
	end;
canLearnGuildSkill(0, {?CoinTypeHonor, Value}) ->
	case playerMoney:canUseCoin(?CoinUseTypeHonor, Value) of
		true -> 0;
		_ -> ?ErrorCode_BagEquipHonorNotEnougth
	end;
canLearnGuildSkill(0, {?GuildContributeType, Value}) ->
	%% 消耗个人贡献点
	%GuildID = playerState:getGuildID(),
	RoleID = playerState:getRoleID(),
	case ets:lookup(rec_guild_member, RoleID) of
		[#rec_guild_member{liveness = Con}] when Con >= Value -> 0;
		_ -> ?ErrorCode_GuildWar_SelfGuildResEnough
	end;
canLearnGuildSkill(0, {UnKnow, Value}) ->
	?ERROR_OUT("canLearnGuildSkill:~p,~p,~p", [playerState:getRoleID(), UnKnow, Value]),
	?ErrorCode_GuildWar_GuildSkillStudyFailed;
canLearnGuildSkill(ErrorCode, [{_Type, Value} = One | Right]) ->
	case Value > 0 of
		true ->
			case canLearnGuildSkill(ErrorCode, One) of
				0 -> canLearnGuildSkill(ErrorCode, Right);
				Error -> Error
			end;
		_ ->
			?ErrorCode_GuildWar_GuildSkillStudyFailed
	end;
canLearnGuildSkill(ErrorCode, _Condition) ->
	ErrorCode.

saveAddProp(SkillID, ID, Value) ->
	L = playerPropSync:getProp(?SerProp_GuildSkillDec),
	Ret =
		case lists:keyfind(SkillID, 1, L) of
			{_, I, V} ->
				{I, V};
			_ ->
				false
		end,

	NL = lists:keystore(SkillID, 1, L, {SkillID, ID, -Value}),
	playerPropSync:setAny(?SerProp_GuildSkillDec, NL),
	Ret.

saveRateProp(SkillID, ID, Value) ->
	L = playerPropSync:getProp(?SerProp_GuildSkillDiv),

	Ret =
		case lists:keyfind(SkillID, 1, L) of
			{_, I, V} ->
				{I, V};
			_ ->
				false
		end,

	NL = lists:keystore(SkillID, 1, L, {SkillID, ID, Value}),
	playerPropSync:setAny(?SerProp_GuildSkillDiv, NL),
	Ret.

getPKGuildSkill(SkillID, 0, ConfID2) ->
	#pk_GuildSkill{confId = 0, skillID = SkillID, skillLvl = 0, next_confID = ConfID2};
getPKGuildSkill(SkillID, ConfID1, ConfID2) when erlang:is_integer(ConfID1) andalso ConfID1 > 0 ->
	#guildskillCfg{skillid = SkillID, skilllevel = Lvl} = getCfg:getCfgByArgs(cfg_guildskill,ConfID1),
	#pk_GuildSkill{confId = ConfID1, skillID = SkillID, skillLvl = Lvl, next_confID = ConfID2}.