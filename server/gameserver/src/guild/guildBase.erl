%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%% 处理公会操作主要逻辑，加入、退出工会
%%% @end
%%% Created : 27. 八月 2014 14:37
%%%-------------------------------------------------------------------
-module(guildBase).
-author("tiancheng").
-include("guildPrivate.hrl").

%% API
-export([
	onJoinGuild/6,
	onChangeGuildName/3,
	onCreateGuild/1,
	onDeleteGuild/2,
	onDeleteGuild/3,
	dealRequestJoin/2,
	exitGuild/2,
	kickGuild/2,
	giveGuildPower/2,
	changeGuildNotice/2,
    changeDenoter/1,
	changeLeader/2,
	onDeleteRole/1,
	addPlayerLiveness/2,
	updateLastGuildCopyOverTime/3,
	queryGuildRewardMemberList/1,
	addguildresource/2,
    addguildliveness/2,
    upgrade/1,
    shopUpgrade/1,
	godBless/2,		%% 女神祈福（很多处理已经由playerGuild做好了，这里是为了新增祈福进度）
	resetGodBless/0,%% 重置女神祈福进度（所有家族）
	setSnowman/1,	%% 设置完成的雪人数量
	resetSnowman/0,	%% 重置完成的雪人数量（所有家族）
	fastJoin_Set/1,	%% 设置快速加入条件
	fastJoin/1,		%% 执行快速加入
	oneKeyRecruit/1	%% 发布招募
]).

%% 军团改名
-spec onChangeGuildName(GuildID::uint64(), NewGuildName::string(), RoleID::uint64()) -> ok.
onChangeGuildName(GuildID, NewGuildName, RoleID) ->
	case ets:lookup(rec_guild, GuildID) of
		[#rec_guild{guildName = OldGuildName} = Guild] ->
			case ets:lookup(rec_guild_member, RoleID) of
				[#rec_guild_member{guildID = GuildID, power = ?GuildMemLevel_Leader}] ->
                    %% 判断是否重名
                    MS = ets:fun2ms(fun(G) when G#rec_guild.guildName =:= NewGuildName -> G end),
					case ets:select(rec_guild, MS) of
						[] ->
							%% 没有重名，可以修改
							NewGuild = Guild#rec_guild{guildName = NewGuildName},
							ets:insert(rec_guild, NewGuild),

							%% 保存数据
							guildLogic:saveToMySql(NewGuild),

							{OldGuildName, NewGuildName};
						_ ->
							repeat
					end;
				_ ->
					false
			end;
		_ ->
			false
	end.

%% 创建工会
-spec onCreateGuild({GuildName::list(), RoleID::uint(), RoleName::list(), Career::uint(), Level::uint(), Denoter::uint(), Notice::string()}) -> #rec_guild_member{} | false.
onCreateGuild({GuildName, RoleID, _RoleName, _Career, _Level, Denoter, Notice}) ->
	case guildLogic:canCreateGuild(RoleID, GuildName) of
		true ->
			%% 生成UID
			GuildID = uidMgr:makeGuildUID(),

			NowTime =  time:getSyncTime1970FromDBS(),

			%% 取一个目标军团
			TargetGuildID = 0,
%%				case ets:tab2list(rec_guild) of
%%					[] -> 0;
%%					GuildList ->
%%						Len = erlang:length(GuildList),
%%						#rec_guild{guildID = GID} = lists:nth(misc:rand(1, Len), GuildList),
%%						GID
%%				end,

			%% 保存到数据库
			MG = #rec_guild{
				guildID = GuildID,
				guildName = GuildName,
				guildLevel = 1,
				member = 1,
				notice = Notice,
                denoter = Denoter,
                fightForce = core:queryPlayerMaxForce(RoleID),
				createTime = NowTime,
				guildTaskTargetGuild = TargetGuildID,
				guildTaskTime = NowTime
			},
			guildLogic:saveToMySql(MG),
            ets:insert(rec_guild, MG),

			%% 添加自己为军团指挥官
			MM = #rec_guild_member{
				guildID = GuildID,
				roleID = RoleID,
				joinTime = NowTime,
				power = ?GuildMemLevel_Leader,    % 把自己设为军团长
                liveness = 0
			},
            ets:insert(rec_guild_member, MM),
			guildLogic:saveToMySql(MM),

			?LOG_OUT("onCreateGuild:~p,~p", [GuildID, RoleID]),

			%% 通知玩家进程刷新家族兑换的属性
			case core:queryOnLineRoleByRoleID(RoleID) of
				#rec_OnlinePlayer{pid = Pid} ->
					psMgr:sendMsg2PS(Pid, guild_join, GuildID);
				_ ->
					skip
			end,
			%% 初始化游乐场设施
			createGuild_initRide(GuildID),

			%% 全服公告（注释掉全服军团广播）
			%%csCore:broadcastMsgToGS(createGuildSuccess, {RoleName, GuildName}),

			{MG, MM};
		_ ->
			%% 工会名字已经存在
			false
	end.

%% 解散工会
-spec onDeleteGuild(GuildID::uint(), Reason::deleteguild()) -> boolean().
onDeleteGuild(GuildID, Reason) ->
	?LOG_OUT("onDeleteGuild:~p,~p", [GuildID, Reason]),

	%% 取军团长
	RoleID = guildLogic:getGuildLeaderRoleID(GuildID),

	case onDeleteGuild(GuildID, RoleID, Reason) of
        true ->
            %% 清空申请表
            MS = ets:fun2ms(fun(#rec_guild_apply{guildID = GID} = Apply) when GID =:= GuildID -> Apply end),
            L = ets:select(rec_guild_apply, MS),
            [ets:delete_object(rec_guild_apply, AY) || AY <- L],
            true;
        V ->
            V
    end.

%% 解散工会
-spec onDeleteGuild(GuildID::uint(), RoleID::uint(), Reason::deleteguild()) -> boolean().
onDeleteGuild(GuildID, RoleID, Reason) ->
	?LOG_OUT("onDeleteGuild:GuildID=~p, RoleID=~p, Reason=~p", [GuildID, RoleID, Reason]),

	AllMemberList = guildLogic:getGuildMember(GuildID),
	?LOG_OUT("guild member List:~p", [AllMemberList]),

	GuildName =
		case ets:lookup(rec_guild, GuildID) of
			[#rec_guild{guildName = GuildName_}] ->
				GuildName_;
			_ ->
				[]
		end,
	Ret =
		case AllMemberList /= [] andalso RoleID > 0 of
			true ->
				case lists:keyfind(RoleID, #rec_guild_member.roleID, AllMemberList) of
					#rec_guild_member{power = ?GuildMemLevel_Leader} ->
						%% 解散工会，保存数据库
						deleteGuildReal(GuildID),
						[ets:delete(rec_guild_member, Key) || #rec_guild_member{roleID = Key} <- AllMemberList],
						?LOG_OUT("onDeleteGuild success:guildid=~p,roleid=~p", [GuildID, RoleID]),
						true;
					Error ->
						?ERROR_OUT("onDeleteGuild:guildid=~p,roleid=~p,error=~p", [GuildID, RoleID, Error]),
						false
				end;
			_ ->
				%% 直接解散 保存数据库
				deleteGuildReal(GuildID),
				[ets:delete(rec_guild_member, Key) || #rec_guild_member{roleID = Key} <- AllMemberList],
				?LOG_OUT("onDeleteGuild direct success:guildid=~p,roleid=~p", [GuildID, RoleID]),
				true
		end,

	case Ret of
		true ->
			%% 通知堆雪人活动，直接销毁从属于目标军团的地图
			core:sendMsgToActivity(?ActivityType_Snowman, snowman_deleteGuild, GuildID),
			%% 通知角色进程家族解散
			RoleName = playerNameUID:getPlayerNameByUID(RoleID),
			Title = stringCfg:getString(guildMail_Title),
			Text = stringCfg:getString(guildMail_DeleteGuild_ZD, [GuildName, RoleName]),
			Content = case Reason of
						  ?DeleteGuildReason_ZD -> Text;
						  _ -> stringCfg:getString(guildMail_DeleteGuild_BD)
					  end,
			Fun =
				fun(#rec_guild_member{roleID = GRoleID}) ->
					%% 主动解散时忽略对族长的邮件发放
					case {Reason, GRoleID} of
						{?DeleteGuildReason_ZD, RoleID} ->
							skip;
						_ ->
							%% 邮件通知成员
							mail:sendSystemMail(GRoleID, Title, Content, [], "")
					end,
					%% 通知在线玩家家族解散
					case playerMgrOtp:getOnlinePlayerInfoByID(GRoleID) of
						#rec_OnlinePlayer{pid = PID} ->
							psMgr:sendMsg2PS(PID, deleteGuildAck, {true, RoleID, Reason});
						_ ->
							skip
					end
				end,
			lists:foreach(Fun, AllMemberList);
		_ ->
			skip
	end,
	Ret.

deleteGuildReal(GuildID) ->
	guildSkill:clearGuildSkill(GuildID),
	guildWarPaid:deleteGuild(GuildID),
	guildLogic:deleteGuild(GuildID),
	guildLogic:saveToMySql({2, GuildID}),
	ets:delete(rec_guild, GuildID),
	guildLogic:targetGuildIsDelete(GuildID),

	%% 清除游乐场相关ETS
	%% 注：地图相关的?EtsGuildFairground已由地图进程自己管理
	ets:delete(?EtsGuildRide, GuildID),
	FunClear =
		fun(#recGuildRideUser{roleID = RoleID, timeRef = TimeRef}) ->
			ets:delete(?EtsGuildRideUser, RoleID),
			erlang:cancel_timer(TimeRef)
		end,
	lists:foreach(FunClear, playerGuildFairground:queryRideUser(GuildID)),

	ok.

%% 修改公告
-spec onChangeNotice(GuildID::uint(), RoleID::uint(), Notice::list()) -> boolean().
onChangeNotice(GuildID, RoleID, Notice) ->
	case ets:lookup(rec_guild, GuildID) of
		[#rec_guild{} = Guild] ->
			case guildLogic:getGuildPower(GuildID, RoleID) >= ?GuildMemLevel_ViceLeader andalso length(Notice) =< 255 of
				true ->
                    ets:update_element(rec_guild, GuildID, {#rec_guild.notice, Notice}),
					guildLogic:saveToMySql(Guild#rec_guild{notice = Notice}),
					true;
				_ ->
					false
			end;
		_ ->
			false
	end.

%% 加入工会
-spec onJoinGuild(GuildID::uint(), ZMRoleID::uint(), RoleID::uint(), RoleName::list(), Career::uint(), Level::uint()) -> boolean().
onJoinGuild(GuildID, _ZMRoleID, RoleID, _RoleName, _Career, _Level) ->
    onJoinGuild(GuildID, RoleID).

%% 把申请者转为正式成员
onJoinGuild(GuildID, RequestRoleID) ->
	case guildLogic:canJoinGuild(GuildID, RequestRoleID) of
		true ->
			%% 可以加入
            Member = #rec_guild_member{
                roleID = RequestRoleID,				%%玩家角色唯一ID bigint(20) unsigned
                guildID = GuildID,				%%军团唯一ID bigint(20) unsigned
                joinTime = time:getSyncTime1970FromDBS(),				%%加入时间 bigint(20) unsigned
                power = ?GuildMemLevel_Normal,				%%军团职位 tinyint(3) unsigned
                liveness = 0				%%个人军团活跃度,退团清空 int(10) unsigned
            },
            ets:insert(rec_guild_member, Member),
            guildLogic:saveToMySql(Member),
            guildLogic:updateGuildMemberAndForce(GuildID, RequestRoleID, true),

			case core:queryOnLineRoleByRoleID(RequestRoleID) of
				#rec_OnlinePlayer{pid = Pid, netPid = NetPid} ->
					%% 通知玩家进程刷新家族兑换的属性
					psMgr:sendMsg2PS(Pid, guild_join, GuildID),
					%% 通知玩家加入家族
					playerMsg:sendNetMsg(NetPid, #pk_GS2U_JoinGuild_Sync{guildID = GuildID});
				_ ->
					skip
			end,

            %% 清空该角色的所有申请
            ets:delete(rec_guild_apply, RequestRoleID),

			true;
		_ ->
			false
	end.

%% 改变目标的权限
-spec onChangePower(GuildID::uint(), SelfRoleID::uint(), TargetRoleID::uint(), TargetLvl::uint()) -> boolean().
onChangePower(GuildID, SelfRoleID, TargetRoleID, TargetLvl) ->
	SelfLvl = guildLogic:getGuildPower(GuildID, SelfRoleID),
	TargetLevel = guildLogic:getGuildPower(GuildID, TargetRoleID),
	%% 自己的权限比对方的高，且自己是副军团长及以上的职位，且赋予的权限比自己的权限低
	case SelfLvl > TargetLevel andalso SelfLvl >= ?GuildMemLevel_ViceLeader
		andalso SelfLvl > TargetLvl andalso guildLogic:canAddGuildLevel(GuildID, TargetLvl) of
		true ->
			case ets:lookup(rec_guild_member, TargetRoleID) of
				[#rec_guild_member{guildID = GuildID} = Member] ->
					%% 修改权限
					MM = Member#rec_guild_member{power = TargetLvl},
                    ets:update_element(rec_guild_member, TargetRoleID, {#rec_guild_member.power, TargetLvl}),

					%% 保存到数据库
					guildLogic:saveToMySql(MM),
					true;
				_ ->
					false
			end;
		_ ->
			false
	end.

%% 团长移交
-spec onChangeLeader(GuildID::uint(), SelfRoleID::uint(), TargetRoleID::uint()) -> boolean().
onChangeLeader(GuildID, SelfRoleID, TargetRoleID) ->
	SelfLvl = guildLogic:getGuildPower(GuildID, SelfRoleID),
	TargetLevel = guildLogic:getGuildPower(GuildID, TargetRoleID),
	case SelfLvl =:= ?GuildMemLevel_Leader andalso TargetLevel >= ?GuildMemLevel_Normal of
		true ->
			[#rec_guild_member{} = OldLeader] = ets:lookup(rec_guild_member, SelfRoleID),
			[#rec_guild_member{} = OldTarget] = ets:lookup(rec_guild_member, TargetRoleID),

            ets:update_element(rec_guild_member, SelfRoleID, {#rec_guild_member.power, ?GuildMemLevel_Normal}),
            ets:update_element(rec_guild_member, TargetRoleID, {#rec_guild_member.power, ?GuildMemLevel_Leader}),

			noticePlayer(TargetRoleID, guildPowerLevelChange, SelfLvl),
			%% 保存数据库
			guildLogic:saveToMySql(OldLeader#rec_guild_member{power = ?GuildMemLevel_Normal}),
			guildLogic:saveToMySql(OldTarget#rec_guild_member{power = ?GuildMemLevel_Leader}),
			true;
		_ ->
			false
	end.

-spec onExitGuild(GuildID::uint(), RoleID::uint()) -> boolean().
onExitGuild(GuildID, RoleID) ->
	onExitGuild(GuildID, RoleID, true).

%% 离开工会
-spec onExitGuild(GuildID::uint(), RoleID::uint(), IsJudgePower::boolean()) -> boolean().
onExitGuild(GuildID, RoleID, IsJudgePower) ->
	case ets:lookup(rec_guild_member, RoleID) of
		[#rec_guild_member{power = Lvl}] ->
			CanDel = case IsJudgePower of
						 true ->
							 %% 要判断权限，军团长不允许删除自己
							 Lvl =/= ?GuildMemLevel_Leader;
						 _ -> true
			         end,
			case CanDel of
				true ->
					%% 可以离开工会
                    ets:delete(rec_guild_member, RoleID),

					%% 保存到数据库
					guildLogic:saveToMySql({1, RoleID}),

					%% 通知一个在线的人，在军团频道发送，这个人退出军团
					%% 获取军团中一个在线的人
					case guildLogic:getOnlinePidList(GuildID) of
						[PID|_] -> psMgr:sendMsg2PS(PID, exitGuildAck, playerNameUID:getPlayerNameByUID(RoleID));
						_ -> skip
					end,

					%% 判断军团人数，如果人数为0，则解散
					case erlang:length(guildLogic:getGuildMember(GuildID)) > 0 of
						true ->
                            guildLogic:updateGuildMemberAndForce(GuildID, RoleID, false),
							skip;
						_ ->
							onDeleteGuild(GuildID, RoleID, ?DeleteGuildReason_BD)
					end,

					%% 玩家退出军团
					guildSkill:playerExitGuild(GuildID, RoleID),

					%% 通知堆雪人活动
					core:sendMsgToActivity(?ActivityType_Snowman, snowman_leaveGuild, {GuildID, RoleID}),

					true;
				_ ->
					false
			end;
		_ ->
			false
	end.

%% 管理员以上处理申请列表(1同意，0拒绝)
-spec dealRequestJoin(PidFromGS::pid(), {GuildID::uint(), SelfRoleID::uint(), TargetRoleID::uint(), IsAgree::0 | 1}) -> ok.
dealRequestJoin(PidFromGS, {GuildID, SelfRoleID, TargetRoleID, IsAgree}) ->
	case guildLogic:getGuildPower(GuildID, SelfRoleID) >= ?GuildMemLevel_ViceLeader of
		true ->
			%% 有权限操作
			Ret =
				case IsAgree of
					0 ->
						%% 拒绝
						false;
					1 ->
						case guildLogic:canJoinGuild(GuildID, TargetRoleID) of
							false ->
								%% 拒绝，并从申请列表中删除
								false;
							true ->
								onJoinGuild(GuildID, TargetRoleID)
						end
				end,

            %% 从申请列表中删除
            guildLogic:deleteRequestRole(GuildID, TargetRoleID),

			%% 通知操作者
			psMgr:sendMsg2PS(PidFromGS, dealRequestJoinAck, {1, Ret, TargetRoleID}),
			noticePlayer(TargetRoleID, joinGuildAck, {1, Ret, GuildID});
		_ ->
			skip
	end,
	ok.

%% 退出工会
-spec exitGuild(PidFromGS::pid(), {GuildID::uint(), RoleID::uint()}) -> ok.
exitGuild(PidFromGS, {GuildID, RoleID}) ->
	Ret = onExitGuild(GuildID, RoleID),
	psMgr:sendMsg2PS(PidFromGS, exitGuildAck, Ret),
	ok.

%% 踢出工会，副军团长及以上才能踢出玩家，且不能踢出军团长
-spec kickGuild(PidFromGS::pid(), {GuildID::uint(), AdminRoleID::uint(), TargetRoleID::uint()}) -> ok.
kickGuild(PidFromGS, {GuildID, AdminRoleID, TargetRoleID}) ->
	SelfLvl = guildLogic:getGuildPower(GuildID, AdminRoleID),
	TargetLvl = guildLogic:getGuildPower(GuildID, TargetRoleID),

	Ret = case SelfLvl > TargetLvl andalso SelfLvl >= ?GuildMemLevel_ViceLeader of
		      true ->
			      onExitGuild(GuildID, TargetRoleID);
		      _ ->
			      false
	      end,

	%% 通知操作者
	psMgr:sendMsg2PS(PidFromGS, kickGuildAck, {TargetRoleID, Ret}),

    %% 通知被踢者
	case Ret of
		true ->
			noticePlayer(TargetRoleID, kickGuildAck, Ret);
		_ ->
			skip
	end,
	ok.

%% 赋予权限
-spec giveGuildPower(PidFromGS::pid(), {GuildID::uint(), SelfRoleID::uint(), TargetRoleID::uint(), TargetLvl::uint()}) -> ok.
giveGuildPower(PidFromGS, {GuildID, SelfRoleID, TargetRoleID, TargetLvl}) ->
	Ret = case onChangePower(GuildID, SelfRoleID, TargetRoleID, TargetLvl) of
		      true ->
			      noticePlayer(TargetRoleID, guildPowerLevelChange, TargetLvl),
			      true;
		      _ ->
			      false
	      end,
	case PidFromGS /= undefined andalso erlang:is_pid(PidFromGS) of
		true ->
			psMgr:sendMsg2PS(PidFromGS, giveGuildPowerAck, {Ret, TargetRoleID, TargetLvl}),
			ok;
		_ ->
			skip
	end,
	ok.

%% 修改公告
-spec changeGuildNotice(PidFromGS::pid(), {GuildID::uint(), RoleID::uint(), Notice::list()}) -> ok.
changeGuildNotice(PidFromGS, {GuildID, RoleID, Notice}) ->
	Ret = onChangeNotice(GuildID, RoleID, Notice),
	psMgr:sendMsg2PS(PidFromGS, changeGuildNoticeAck, {Notice, Ret}),
	ok.

%% 修改标志
changeDenoter({GuildID, RoleID, Denoter}) ->
    case ets:lookup(rec_guild, GuildID) of
        [#rec_guild{} = Guild] ->
            case guildLogic:getGuildPower(GuildID, RoleID) >= ?GuildMemLevel_Leader of
                true ->
                    ets:update_element(rec_guild, GuildID, {#rec_guild.denoter, Denoter}),
                    guildLogic:saveToMySql(Guild#rec_guild{denoter = Denoter}),
                    {GuildID, Denoter, true};
                _ ->
                    false
            end;
        _ ->
            false
    end.

%% 团长移交
-spec changeLeader(PidFromGS::pid(), {GuildID::uint(), SelfRoleID::uint(), TargetRoleID::uint()}) -> ok.
changeLeader(PidFromGS, {GuildID, SelfRoleID, TargetRoleID}) ->
	Ret = onChangeLeader(GuildID, SelfRoleID, TargetRoleID),
	psMgr:sendMsg2PS(PidFromGS, changeLeaderAck, Ret),
	ok.

%% 军团升级
upgrade({GuildID, RoleID}) ->
    case guildLogic:queryRoleGuildInfo(RoleID) of
        {#rec_guild{resource = Res, liveness = Liv, guildLevel = Lvl} = Guild,
            #rec_guild_member{guildID = GuildID, power = Power}}
            when Power >= ?GuildMemLevel_ViceLeader ->
            #guildCfg{need_res = NeedRes, need_liv = NeedLiv} = getCfg:getCfgPStack(cfg_guild, Lvl),
            case Res >= NeedRes andalso Liv >= NeedLiv of
                true ->
                    ets:update_element(rec_guild, GuildID, [
                        {#rec_guild.resource, Res - NeedRes},
                        {#rec_guild.liveness, Liv - NeedLiv},
                        {#rec_guild.guildLevel, Lvl + 1}
                    ]),
                    guildLogic:saveToMySql(Guild#rec_guild{resource = Res - NeedRes, liveness = Liv - NeedLiv, guildLevel = Lvl + 1}),
					upgrade_exchange_refresh(Lvl + 1),
					case core:queryOnLineRoleByRoleID(RoleID) of
						#rec_OnlinePlayer{netPid = NetPid} ->
							playerMsg:sendNetMsg(NetPid, #pk_GS2U_Upgrade_Ack{guildID = GuildID, level = Lvl + 1});
						_ ->
							skip
					end,
					guildLogic:tryOpenRide(GuildID, Lvl + 1),
                    {GuildID, Lvl + 1};
                _ ->
                    false
            end;
        _ ->
            false
    end.

%% 军团升级时，通知在线的成员
upgrade_exchange_refresh(GuildLevel) ->
	FunNotice =
		fun(#rec_guild_member{roleID = RoleID}, _) ->
			case core:queryOnLineRoleByRoleID(RoleID) of
				#rec_OnlinePlayer{pid = Pid} ->
					psMgr:sendMsg2PS(Pid, guild_upgrade, GuildLevel);
				_ ->
					skip
			end
		end,
	ets:foldl(FunNotice, 0, rec_guild_member).

%% 商店升级
shopUpgrade({GuildID, RoleID}) ->
    case guildLogic:queryRoleGuildInfo(RoleID) of
        {#rec_guild{guildLevel = Lvl, resource = Res, liveness = Liv, shopLevel = ShopLevel} = Guild,
            #rec_guild_member{guildID = GuildID, power = Power}}
            when Power >= ?GuildMemLevel_Leader ->
            #guildCfg{shop_upgrade = ShopGradeList} = getCfg:getCfgPStack(cfg_guild, Lvl),
            case ShopGradeList =/= [] of
                true ->
                    case lists:keyfind(ShopLevel, 1, ShopGradeList) of
                        {ShopLevel, NeedRes, NeedLiv} ->
                            case Res >= NeedRes andalso Liv >= NeedLiv of
                                true ->
                                    ets:update_element(rec_guild, GuildID, [
                                        {#rec_guild.resource, Res - NeedRes},
                                        {#rec_guild.liveness, Liv - NeedLiv},
                                        {#rec_guild.shopLevel, ShopLevel + 1}
                                    ]),
                                    guildLogic:saveToMySql(Guild#rec_guild{resource = Res - NeedRes, liveness = Liv - NeedLiv, shopLevel = ShopLevel + 1}),
                                    {GuildID, ShopLevel + 1};
                                _ ->
                                    false
                            end;
                        _ ->
                            false
                    end;
                _ ->
                    false
            end;
        _ ->
            false
    end.

addguildresource(GuildID, Value) ->
	case ets:lookup(rec_guild, GuildID) of
		[#rec_guild{guildLevel = Lvl, resource = Res} = Guild] ->
			NewRes =
				case Value > 0 of
					true ->
                        #guildCfg{max_res = MaxRes} = getCfg:getCfgPStack(cfg_guild, Lvl),
						erlang:min(MaxRes, Res + Value);
					_ ->
                        erlang:max(0, Res + Value)
				end,

            NewGuild = Guild#rec_guild{resource = NewRes},
            ets:update_element(rec_guild, GuildID, {#rec_guild.resource, NewRes}),
            guildLogic:saveToMySql(NewGuild),
			?LOG_OUT("addguildresource=~p, value=~p old=~p to new=~p", [GuildID, Value, Res, NewRes]),
			%% 游乐设施自动开放
			guildLogic:freshRide(NewGuild);
		_ ->
			false
	end.

addguildliveness(GuildID, Value) ->
    case ets:lookup(rec_guild, GuildID) of
        [#rec_guild{guildLevel = Lvl, liveness = Liv} = Guild] ->
            NewRes =
                case Value > 0 of
                    true ->
                        #guildCfg{max_liv = MaxLiv} = getCfg:getCfgPStack(cfg_guild, Lvl),
                        erlang:min(MaxLiv, Liv + Value);
                    _ ->
                        erlang:max(0, Liv + Value)
                end,

            NewGuild = Guild#rec_guild{liveness = NewRes},
            ets:update_element(rec_guild, GuildID, {#rec_guild.liveness, NewRes}),
            guildLogic:saveToMySql(NewGuild),

			?LOG_OUT("addguildliveness=~p, value=~p old=~p to new=~p", [GuildID, Value, Liv, NewRes]),

            NewGuild;
        _ ->
            false
    end.

%% 删除角色数据
-spec onDeleteRole(RoleID::uint()) -> ok.
onDeleteRole(RoleID) ->
	case guildLogic:queryRoleGuildInfo(RoleID) of
		{#rec_guild{guildID = GuildID} = Guild, #rec_guild_member{power = Lvl} = Member} ->
			%% 是否要移交权限
			case Lvl =:= ?GuildMemLevel_Leader of
				true ->
					%% 军团长被删除
					List = guildLogic:getGuildMember(GuildID),
					NList = lists:keydelete(RoleID, #rec_guild_member.roleID, List),
					FunSort =
						fun(#rec_guild_member{power = Power1, liveness = C1}, #rec_guild_member{power = Power2, liveness = C2}) ->
							if
								Power1 > Power2 -> true;
								Power1 =:= Power2 andalso C1 > C2 -> true;
								true -> false
							end
						end,
					case lists:sort(FunSort, NList) of
						[] -> ?LOG_OUT("GuildLeader deleterole noboday:~p,~p,~p", [RoleID, Guild, Member]);
						[#rec_guild_member{roleID = RID} = Player|_] ->
							%% 把军团长移交给一个权限最高的人
							MM = Player#rec_guild_member{power = ?GuildMemLevel_Leader},

                            ets:update_element(rec_guild_member, RID, {#rec_guild_member.power, ?GuildMemLevel_Leader}),

							?LOG_OUT("GuildLeader deleterole ~p leader to:~p",[RoleID, RID]),

							%% 保存到数据库
							guildLogic:saveToMySql(MM),
							ok
					end;
%% 					%% 军团团长删除角色，记录日志
%% 					?ERROR_OUT("GuildLeader deleterole:~p,~p,~p", [RoleID, Guild, Member]);
				_ ->
					skip
			end,

			%% 通知堆雪人活动
			core:sendMsgToActivity(?ActivityType_Snowman, snowman_deleteRole, {GuildID, RoleID}),

			%% 退出工会
			onExitGuild(GuildID, RoleID, false),

			ok;
		_ ->
			skip
	end,
	ok.

%% 增加个人军团活跃度
-spec addPlayerLiveness(FromPidGS::pid(), {GuildID::uint64(), RoleID::uint64(), Value::uint()}) -> ok.
addPlayerLiveness(_FromPidGS, {GuildID, RoleID, Value}) ->
    case ets:lookup(rec_guild_member, RoleID) of
        [#rec_guild_member{guildID = GuildID, liveness = C1} = Member] ->
            NewLiv = case Value >= 0 of
                         true -> C1 + Value;
                         _ -> erlang:max(0, C1 + Value)
                     end,
            ets:update_element(rec_guild_member, RoleID, {#rec_guild_member.liveness, NewLiv}),

            %% 保存到数据库
            guildLogic:saveToMySql(Member#rec_guild_member{liveness = NewLiv}),
            ok;
        _ ->
            skip
    end,
	ok.

%% 保存军团副本上次结束的时间(时间不等于0才更新时间)，设置军团副本最晚结束时间，为0的时候，为未开启状态
-spec updateLastGuildCopyOverTime(GuildID :: uint(), LastOverTime :: uint64(), MaxOverTime :: boolean()) -> ok.
updateLastGuildCopyOverTime(GuildID, LastOverTime, MaxOverTime) ->
	?DEBUG_OUT("updateLastGuildCopyOverTime GuildID = ~p, LastOverTime = ~p, MaxOverTime = ~p", [GuildID, LastOverTime, MaxOverTime]),
	case ets:lookup(rec_guild, GuildID) of
		[#rec_guild{} = Guild] ->
			NewGuild =
				case LastOverTime > 0 of
					true ->
						Guild1 = Guild#rec_guild{lastGuildCopyOverTime = LastOverTime},

						%% 同时通知所有在线成员副本结束了
						PidList = guildLogic:getOnlinePidList(GuildID),
						[psMgr:sendMsg2PS(Pid, copyMapOver, LastOverTime) || Pid <- PidList],
						?LOG_OUT("send copyMapOver ~p, count = ~p", [Guild1, erlang:length(PidList)]),
						Guild1;
					_ ->
						%%军团副本刚开始
						%%生成保存军团副本获奖名单
						{AwardIDList, OtherIDList} = queryGuildRewardMemberList(GuildID),
						?LOG_OUT("Guild[~p] AwardIDList[~p],OtherIDList[~p]",[GuildID, AwardIDList, OtherIDList]),

						guildState:setGuildCopyAwardIDList(GuildID, AwardIDList, OtherIDList),

						%%将玩家最后一次领奖时间更新
						NowTime = time:getSyncTime1970FromDBS(),
						updateGuildCopyMapTime(NowTime, AwardIDList),
						Guild
				end,

            ets:insert(rec_guild, NewGuild),

			%% 保存到数据库
			guildLogic:saveToMySql(NewGuild);
		_ ->
			skip
	end,
	ok.

%% 通知在线玩家
-spec noticePlayer(RoleID::uint(), MsgID::atom(), Msg::term()) -> ok.
noticePlayer(RoleID, MsgID, Msg) ->
	%% 获取玩家是否在线
	case playerMgrOtp:getOnlinePlayerInfoByID(RoleID) of
		#rec_OnlinePlayer{} = PlayerInfo ->
			%% 角色在线
			PID = PlayerInfo#rec_OnlinePlayer.pid,
			case erlang:is_pid(PID) of
				true ->
					psMgr:sendMsg2PS(PID, MsgID, Msg);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%% 查询公会要发奖的玩家的ID列表和不能获奖的玩家
-spec queryGuildRewardMemberList(GuildID :: int64()) -> {IDList1::list(),IDList2::list()}.
queryGuildRewardMemberList(GuildID) ->
	NowTime = time:getSyncTime1970FromDBS(),

	MemberList = guildLogic:getGuildMember(GuildID),

	Fun =
		fun(#rec_guild_member{roleID = RoleID}, {AccList1,AccList2}) ->
			AwardTime =
				case edb:readRecord(rec_player_data, RoleID) of
					[] ->
						0;
					[#rec_player_data{guildAwardTime = Time}] ->
						Time
				end,

			%%玩家领奖CD时间不到不给奖励
			case NowTime - AwardTime > ?GuildCopyCD of
				true ->
					{[RoleID | AccList1], AccList2};
				_ ->
					{AccList1, [RoleID | AccList2]}
			end
		end,
	lists:foldl(Fun, {[], []}, MemberList).

updateGuildCopyMapTime(_NowTime, []) ->
	ok;
updateGuildCopyMapTime(NowTime, RoleID) when erlang:is_integer(RoleID) ->
	F = fun() ->
		case mnesia:read(rec_player_data, RoleID, write) of
			[#rec_player_data{} = Data] ->
				R1 = Data#rec_player_data{guildAwardTime = NowTime},
				%% 写入更新表
				mnesia:write(update_rec_player_data, R1, write),
				%% 最后写入缓存数据库
				mnesia:write(R1);
			[] ->
				R2 = #rec_player_data{guildAwardTime = NowTime},
				%% 写入插入表
				mnesia:write(new_rec_player_data, R2, write),
				%% 最后写入缓存数据库
				mnesia:write(R2)
		end
	    end,
	case mnesia:transaction(F) of
		{atomic, _Val} ->
			_Val;
		Error ->
			?WARN_OUT("updateGuildCopyMapTime Error:~p, RoleID:~p",[Error, RoleID]),
			error
	end,
	ok;
updateGuildCopyMapTime(NowTime, [RoleID | Right]) ->
	updateGuildCopyMapTime(NowTime, RoleID),
	updateGuildCopyMapTime(NowTime, Right).

%% 女神祈福（很多处理已经由playerGuild做好了，这里是为了新增祈福进度）
-spec godBless(GuildID::uint64(), AddSchedule::uint64()) -> ok.
godBless(GuildID, AddSchedule) ->
	case ets:lookup(rec_guild, GuildID) of
		[#rec_guild{godBless = GodBless} = Guild] ->
			NewGuild = Guild#rec_guild{godBless = GodBless + AddSchedule},
			ets:insert(rec_guild, NewGuild),
			guildLogic:saveToMySql(NewGuild);
		_ ->
			?ERROR_OUT("godbless can not find GuildID:~p from rec_guild, AddSchedule:~p", [GuildID, AddSchedule]),
			skip
	end.

%% 重置女神祈福进度（所有家族）
-spec resetGodBless() -> ok.
resetGodBless() ->
	FunFind =
		fun(#rec_guild{guildID = GuildID, godBless = Count} = Rec, {R1, R2}) ->
			case Count > 0 of
				true ->
					{[GuildID | R1], [Rec#rec_guild{godBless = 0} | R2]};
				_ ->
					{R1, R2}
			end
		end,
	{ListR1, ListR2} = ets:foldl(FunFind, {[], []}, rec_guild),
	FunReset =
		fun(GuildID) ->
			ets:update_element(rec_guild, GuildID, {#rec_guild.godBless, 0})
		end,
	lists:foreach(FunReset, ListR1),
	gsSendMsg:sendMsg2DBServer(saveGuildData, 0, ListR2).

%% 设置完整的雪人数量
-spec setSnowman({GuildID::uint64(), Count::uint8()}) -> ok.
setSnowman({GuildID, Count}) ->
	case ets:lookup(rec_guild, GuildID) of
		[#rec_guild{} = Guild] ->
			NewGuild = Guild#rec_guild{snowman = Count},
			ets:insert(rec_guild, NewGuild),
			guildLogic:saveToMySql(NewGuild);
		_ ->
			?ERROR_OUT("setSnowman can not find GuildID:~p from rec_guild, Count:~p", [GuildID, Count]),
			skip
	end.

%% 重置完整的雪人数量（所有家族）
-spec resetSnowman() -> ok.
resetSnowman() ->
	FunFind =
		fun(#rec_guild{guildID = GuildID, snowman = Count} = Rec, {R1, R2}) ->
			case Count > 0 of
				true ->
					{[GuildID | R1], [Rec#rec_guild{snowman = 0} | R2]};
				_ ->
					{R1, R2}
			end
		end,
	{ListR1, ListR2} = ets:foldl(FunFind, {[], []}, rec_guild),
	FunReset =
		fun(GuildID) ->
			ets:update_element(rec_guild, GuildID, {#rec_guild.snowman, 0})
		end,
	lists:foreach(FunReset, ListR1),
	gsSendMsg:sendMsg2DBServer(saveGuildData, 0, ListR2).

%% 设置快速加入的条件
-spec fastJoin_Set({GuildID::uint64(), RoleID::uint64(), Force::uint64()}) -> ok.
fastJoin_Set({GuildID, RoleID, Force}) ->
	case ets:lookup(rec_guild_member, RoleID) of
		[#rec_guild_member{guildID = GuildID, power = ?GuildMemLevel_Leader}] ->
			case ets:lookup(rec_guild, GuildID) of
				[#rec_guild{fastJoin = Force}] ->
					%% 有权限，修改值等于现有值，直接反馈修改成功
					case core:queryOnLineRoleByRoleID(RoleID) of
						#rec_OnlinePlayer{netPid = NetPid} ->
							playerMsg:sendNetMsg(NetPid, #pk_GS2U_Guild_FastJoin_Set_Ack{guildID = GuildID, force = Force});
						_ ->
							skip
					end;
				[#rec_guild{} = Guild] ->
					%% 有权限，赋值后反馈修改成功
					ets:update_element(rec_guild, GuildID, {#rec_guild.fastJoin, Force}),
					gsSendMsg:sendMsg2DBServer(saveGuildData, 0, Guild#rec_guild{fastJoin = Force}),
					case core:queryOnLineRoleByRoleID(RoleID) of
						#rec_OnlinePlayer{netPid = NetPid_} ->
							playerMsg:sendNetMsg(NetPid_, #pk_GS2U_Guild_FastJoin_Set_Ack{guildID = GuildID, force = Force});
						_ ->
							skip
					end;
				_ ->
					%% 没找到对应公会，由于已由playerGuild处理，所以这里因该是卡得伤心流泪的不同步问题
					case core:queryOnLineRoleByRoleID(RoleID) of
						#rec_OnlinePlayer{netPid = NetPid__} ->
							playerMsg:sendErrorCodeMsg(NetPid__, ?ErrorCode_GuildFastJoinSetPowerless);
						_ ->
							skip
					end
			end;
		_ ->
			%% 数据不对，由于已由playerGuild处理，所以这里因该是卡得伤心流泪的不同步问题
			case core:queryOnLineRoleByRoleID(RoleID) of
				#rec_OnlinePlayer{netPid = NetPid___} ->
					playerMsg:sendErrorCodeMsg(NetPid___, ?ErrorCode_GuildFastJoinSetPowerless);
				_ ->
					skip
			end
	end.

%% 快速加入
-spec fastJoin({RoleID::uint64(), Force::uint64()}) -> ok.
fastJoin({RoleID, Force}) ->
	FunFilter =
		fun(#rec_guild{fastJoin = FastJoin, member = Member, guildLevel = Lvl} = Guild, R) ->
			case getCfg:getCfgPStack(cfg_guild, Lvl) of
				#guildCfg{member_number = MaxMember} ->
					case Force >= FastJoin andalso MaxMember > Member of
						true ->
							[Guild | R];
						_ ->
							R
					end;
				_ ->
					R
			end
		end,
	ListFilter = ets:foldl(FunFilter, [], rec_guild),
	FunSort =
		fun(#rec_guild{createTime = T1}, #rec_guild{createTime = T2}) ->
			T1 < T2
		end,
	ListSort = lists:sort(FunSort, ListFilter),
	case ListSort of
		[] ->
			case core:queryOnLineRoleByRoleID(RoleID) of
				#rec_OnlinePlayer{netPid = NetPid} ->
					playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_GuildFastJoinNotFind);
				_ ->
					skip
			end;
		[#rec_guild{guildID = GuildID}|_] ->
			case onJoinGuild(GuildID, RoleID) of
				true ->
					case core:queryOnLineRoleByRoleID(RoleID) of
						#rec_OnlinePlayer{netPid = NetPid_} ->
							playerMsg:sendNetMsg(NetPid_, #pk_GS2U_Guild_FastJoin_Ack{guildID = GuildID});
						_ ->
							skip
					end;
				_ ->
					skip
			end
	end.

%% 发布招募
-spec oneKeyRecruit({GuildID::uint64(), RoleID::uint64()}) -> ok.
oneKeyRecruit({GuildID, RoleID}) ->
	%% 1.仅有族长、大长老可操作，其他人忽略
	case ets:lookup(rec_guild_member, RoleID) of
		[#rec_guild_member{power = Power}] when Power >= ?GuildMemLevel_ViceLeader ->
			%% 2.验证CD
			case ets:lookup(rec_guild, GuildID) of
				[#rec_guild{recruit = Recruit} = Guild] ->
					#globalsetupCfg{setpara = [Sec]} =
						getCfg:getCfgPStack(cfg_globalsetup, guild_request_notice_cd),
					TimeNow = time2:getTimestampSec(),
					CD =
						case Sec - TimeNow + Recruit of
							CD_ when CD_ < 0 ->
								0;
							CD_ ->
								CD_
						end,
					case CD > 0 of
						true ->
							case core:queryOnLineRoleByRoleID(RoleID) of
								#rec_OnlinePlayer{netPid = NetPid} ->
									playerMsg:sendNetMsg(NetPid, #pk_GS2U_OneKeyRecruit_Ack{cd = CD, ret = ?ErrorCode_GuildOneKeyRecruitCD});
								_ ->
									skip
							end;
						_ ->
							ets:update_element(rec_guild, GuildID, {#rec_guild.recruit, TimeNow}),
							gsSendMsg:sendMsg2DBServer(saveGuildData, 0, Guild#rec_guild{recruit = TimeNow}),
							case core:queryOnLineRoleByRoleID(RoleID) of
								#rec_OnlinePlayer{netPid = NetPid_, pid = Pid_} ->
									psMgr:sendMsg2PS(Pid_, oneKeyRecruitAck, 0),
									playerMsg:sendNetMsg(NetPid_, #pk_GS2U_OneKeyRecruit_Ack{cd = Sec, ret = 0});
								_ ->
									skip
							end
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%% 创建家族时初始化游乐场设施
-spec createGuild_initRide(GuildID::uint64()) -> ok.
createGuild_initRide(GuildID) ->
	List1Key = getCfg:get1KeyList(cfg_guild_ride),
	FunInit =
		fun(RideID) ->

			%% 创建家族时家族等级必然为1
			%% 初始设施等级最大为1
			%% 需要验证家族等级为1时，是否满足等级为1的设施的开启条件
			%% 等级为0时保持关闭状态
			{RideLevel, RideState} =
				case getCfg:getCfgByKey(cfg_guild_ride, RideID, 1) of
					#guild_rideCfg{open = OpenLevel} when erlang:is_integer(OpenLevel), OpenLevel =:= 1 ->
						{1, ?RideState_Open};
					_ ->
						{0, ?RideState_Close}
				end,

			#rec_guild_ride{
				guildID = GuildID,
				rideID = RideID,
				rideLevel = RideLevel,
				rideState = RideState
			}
		end,
	ListRide = [FunInit(RideID) || RideID <- List1Key],
	ets:insert(?EtsGuildRide, #recGuildRide{guildID = GuildID, listRide = ListRide}),
	gsSendMsg:sendMsg2DBServer(saveGuildData, 0, ListRide).
