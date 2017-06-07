%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20170103
%%%-------------------------------------------------------------------
-module(marriageLogic).
-author("meitianyang").

-include("marriagePrivate.hrl").


-export([
	build/1,
	break/1,
	deleteRole/1,
	closenessAdd/1,
	closenessAdd_Check/1,
	closenessUse/1,
	skillUp/1,
	ringUp/1
]).

%%% ====================================================================
%%% API functions
%%% ====================================================================

%% 结婚
-spec build({RoleID::uint64(), TargetRoleID::uint64(), ItemID::uint32()}) -> ok.
build({RoleID, TargetRoleID, ItemID}) ->
	?DEBUG_OUT("[DebugForMarriage] build ~p", [{RoleID, TargetRoleID, ItemID}]),
	%% 只验证双方是单身即可结婚，交给公共进程处理是为了防止重婚
	case {marriageState:queryRelation(RoleID), marriageState:queryRelation(TargetRoleID)} of
		{#rec_marriage{targetRoleID = TargetRoleID_A} = RecA, #rec_marriage{targetRoleID = TargetRoleID_B} = RecB}
			when TargetRoleID_A =:= 0 andalso TargetRoleID_B =:= 0 ->
			%% 初始化亲密度与结婚纪念日
			ClosenessInit =
				case getCfg:getCfgByKey(cfg_item, ItemID) of
					#itemCfg{useParam1 = P1} ->
						P1;
					_ ->
						?ERROR_OUT("build can not find ~p from cfg_item", [ItemID]),
						0
				end,
			TimeNow = marriageState:now(),
			%% 如果婚戒突破次数为0则初始化为1，便于取配置和客户端显示，计算实际突破次数时应减1
			RecANew =
				RecA#rec_marriage{
					targetRoleID = TargetRoleID,
					closeness = ClosenessInit,
					timeRelation = TimeNow,
					ringTop =
						case RecA#rec_marriage.ringTop of
							0 ->
								1;
							TopA ->
								TopA
						end
				},
			RecBNew =
				RecB#rec_marriage{
					targetRoleID = RoleID,
					closeness = ClosenessInit,
					timeRelation = TimeNow,
					ringTop =
						case RecB#rec_marriage.ringTop of
							0 ->
								1;
							TopB ->
								TopB
						end
				},
			%% 记录亲密度变化日志（结婚
			dbLog:sendSaveLogFriend(#rec_log_player_friend{
				roleID = RoleID,
				targetRoleID = TargetRoleID,
				oldCloseness = 0,
				newCloseness = ClosenessInit,
				reason = ?ClosenessSource_Marriage,
				isActive = 1,
				time = time:getLogTimeSec()
			}),
			dbLog:sendSaveLogFriend(#rec_log_player_friend{
				roleID = TargetRoleID,
				targetRoleID = RoleID,
				oldCloseness = 0,
				newCloseness = ClosenessInit,
				reason = ?ClosenessSource_Marriage,
				isActive = 0,
				time = time:getLogTimeSec()
			}),

			%% 保存数据
			marriageState:replaceRelation(RecANew),
			marriageState:replaceRelation(RecBNew),
			gsSendMsg:sendMsg2DBServer(marriage_dbsave, 0, [{RecANew, RecBNew}]),
			%% 写入杂项记录
			SundriesOld =
				case memDBCache:getSundries(?Sundries_ID_Marriage, ?Sundries_MarriageSubID_CountOfCouples) of
					[#rec_sundries{value = SundriesOld_}] ->
						SundriesOld_;
					_ ->
						0
				end,
			SundriesNew = SundriesOld + 1,
			memDBCache:dirtySaveSundries(?Sundries_ID_Marriage, ?Sundries_MarriageSubID_CountOfCouples, SundriesNew),
			%% 通知客户端
			case core:queryOnLineRoleByRoleID(RoleID) of
				#rec_OnlinePlayer{pid = Pid_A} ->
					psMgr:sendMsg2PS(Pid_A, marriage_buildAck, {TargetRoleID, ItemID});
				_ ->
					skip
			end,
			case core:queryOnLineRoleByRoleID(TargetRoleID) of
				#rec_OnlinePlayer{pid = Pid_B} ->
					psMgr:sendMsg2PS(Pid_B, marriage_buildAck, {RoleID, ItemID});
				_ ->
					skip
			end,
			?LOG_OUT("build ~p", [{RoleID, TargetRoleID, ItemID}]),
			%% 广播和邮件
			Boradcast = marriageState:configStringBoradcast(RoleID, ItemID, TargetRoleID, SundriesNew),
			core:sendBroadcastNotice(Boradcast),
			Title = marriageState:configStringMailTitleBuild(),
			ContentA = marriageState:configStringMailContentBuild(TargetRoleID, SundriesNew),
			ContentB = marriageState:configStringMailContentBuild(RoleID, SundriesNew),
			mail:sendSystemMail(RoleID, Title, ContentA, [], ""),
			mail:sendSystemMail(TargetRoleID, Title, ContentB, [], "");
		_ ->
			%% 进程不同步问题导致的无法成婚在此返还道具（玩家进程已标记不返还）
			case playerMail:createMailGoods(ItemID, 1, true, 0, RoleID, ?ItemSourceMarriageWantBuildFaild) of
				[#recMailItem{}|_] = MailItemList ->
					Title = marriageState:configStringMailTitleBuildFaild(),
					Content = marriageState:configStringMailContentBuildFaild(TargetRoleID),
					mail:sendSystemMail(RoleID, Title, Content, MailItemList, "");
				_ ->
					?ERROR_OUT("build ItemID=~p, rec=~p", [ItemID, {RoleID, TargetRoleID}])
			end,
			skip
	end,
	ok.

%% 离婚
-spec break({RoleID::uint64(), TargetRoleID::uint64(), IsTeam::boolean()}) -> ok.
break({RoleID, TargetRoleID, IsTeam}) ->
	?DEBUG_OUT("[DebugForMarriage] break ~p", [{RoleID, TargetRoleID, IsTeam}]),
	%% 只检查是否相互为伴侣
	case {marriageState:queryRelation(RoleID), marriageState:queryRelation(TargetRoleID)} of
		{#rec_marriage{targetRoleID = TargetRoleID} = RecA, #rec_marriage{targetRoleID = RoleID} = RecB} ->
			%% 重置婚姻关系
			Friendliness =
				case IsTeam of
					true ->
						marriageState:configFriendlinessDownWithTeam();
					_ ->
						marriageState:configFriendlinessDownWithoutTeam()
				end,
			psMgr:sendMsg2PS(?PsNameFriend2, marriage_break, {RoleID, TargetRoleID, Friendliness}),
			TimeNow = marriageState:now(),
			RecANew =
				RecA#rec_marriage{
					targetRoleID = 0,
					closeness = 0,
					timeRelation = TimeNow
				},
			RecBNew =
				RecB#rec_marriage{
					targetRoleID = 0,
					closeness = 0,
					timeRelation = TimeNow
				},
			%% 记录亲密度变化日志（离婚
			dbLog:sendSaveLogFriend(#rec_log_player_friend{
				roleID = RoleID,
				targetRoleID = TargetRoleID,
				oldCloseness = RecA#rec_marriage.closeness,
				newCloseness = 0,
				reason = ?ClosenessUse_Break,
				isActive = 1,
				time = time:getLogTimeSec()
			}),
			dbLog:sendSaveLogFriend(#rec_log_player_friend{
				roleID = TargetRoleID,
				targetRoleID = RoleID,
				oldCloseness = RecB#rec_marriage.closeness,
				newCloseness = 0,
				reason = ?ClosenessUse_Break,
				isActive = 0,
				time = time:getLogTimeSec()
			}),
			%% 保存数据
			marriageState:replaceRelation(RecANew),
			marriageState:replaceRelation(RecBNew),
			gsSendMsg:sendMsg2DBServer(marriage_dbsave, 0, [{RecANew, RecBNew}]),
			%% 通知客户端
			case core:queryOnLineRoleByRoleID(RoleID) of
				#rec_OnlinePlayer{pid = Pid_A} ->
					psMgr:sendMsg2PS(Pid_A, marriage_breakAck, {TargetRoleID});
				_ ->
					skip
			end,
			case core:queryOnLineRoleByRoleID(TargetRoleID) of
				#rec_OnlinePlayer{pid = Pid_B} ->
					psMgr:sendMsg2PS(Pid_B, marriage_breakAck, {RoleID});
				_ ->
					skip
			end,
			?LOG_OUT("break ~p", [{RoleID, TargetRoleID, IsTeam}]),
			%% 邮件
			Title = marriageState:configStringMailTitleBreak(),
			ContentA = marriageState:configStringMailContentBreak(TargetRoleID),
			ContentB = marriageState:configStringMailContentBreak(RoleID),
			mail:sendSystemMail(RoleID, Title, ContentA, [], ""),
			mail:sendSystemMail(TargetRoleID, Title, ContentB, [], "");
		_ ->
			%% 忽略关系不合法的离婚行为
			skip
	end,
	ok.

%% 删除角色
-spec deleteRole(RoleID::uint64()) -> ok.
deleteRole(RoleID) ->
	#rec_marriage{targetRoleID = TargetRoleID, closeness = Closenesss} = marriageState:queryRelation(RoleID),
	?LOG_OUT("delete ~p with ~p", [RoleID, TargetRoleID]),
	ets:delete(?EtsMarriageData, RoleID),
	ets:delete(?EtsMarriageSkill, RoleID),
	case TargetRoleID > 0 of
		true ->
			RecB = marriageState:queryRelation(TargetRoleID),
			TimeNow = marriageState:now(),
			RecBNew =
				RecB#rec_marriage{
					targetRoleID = 0,
					closeness = 0,
					timeRelation = TimeNow
				},
			marriageState:replaceRelation(RecBNew),
			gsSendMsg:sendMsg2DBServer(marriage_dbsave, 0, [RecBNew, RoleID]),  %% 改变对方的姻缘状态，删除自己
			case core:queryOnLineRoleByRoleID(TargetRoleID) of
				#rec_OnlinePlayer{pid = Pid_B} ->
					psMgr:sendMsg2PS(Pid_B, marriage_breakAck, {RoleID});
				_ ->
					skip
			end,
			%% 记录亲密度变化日志（删除角色
			dbLog:sendSaveLogFriend(#rec_log_player_friend{
				roleID = RoleID,
				targetRoleID = TargetRoleID,
				oldCloseness = Closenesss,
				newCloseness = 0,
				reason = ?ClosenessUse_Break,
				isActive = 1,
				time = time:getLogTimeSec()
			}),
			dbLog:sendSaveLogFriend(#rec_log_player_friend{
				roleID = TargetRoleID,
				targetRoleID = RoleID,
				oldCloseness = RecB#rec_marriage.closeness,
				newCloseness = 0,
				reason = ?ClosenessUse_Break,
				isActive = 0,
				time = time:getLogTimeSec()
			}),
			%% 邮件
			Title = marriageState:configStringMailTitleBreak(),
			ContentB = marriageState:configStringMailContentBreak(RoleID),
			mail:sendSystemMail(TargetRoleID, Title, ContentB, [], ""),
			RecBNew;
		_ ->
			gsSendMsg:sendMsg2DBServer(marriage_dbsave, 0, [RoleID])  %% 仅删除自己
	end,
	ok.

%% 亲密度添加检查
-spec closenessAdd_Check({RoleID_A::uint64(), RoleID_B::uint64(), Value::uint32(), Reason::type_mcs()}) -> ValueReal::uint32().
closenessAdd_Check({RoleID_A, RoleID_B, Value, Reason}) ->
	?DEBUG_OUT("[DebugForMarriage] closenessAdd_Check ~p", [{RoleID_A, RoleID_B, Value, Reason}]),
	%% 1.根据双用户每日计数获取每日限制
	ValueLimit1 = marriageState:configClosenessLimitEveryday(Reason),
	case ValueLimit1 =< 0 of
		true ->
			?WARN_OUT("closenessAdd Reason(~p) 可能是策划故意配置为0关闭该来源，也可能是配置错误", [Reason]),
			0;
		_ ->
			Daily2Type = mcs2dt(Reason),
			ValueOld = daily2State:queryDaily2(RoleID_A, RoleID_B, Daily2Type),
			ValueLimit2 = ValueLimit1 - ValueOld,
			case ValueLimit2 =< 0 of
				true ->
					0; %% 当日该来源获取量已达上限，忽略
				_ ->
					%% 2.确认关系双方
					case {marriageState:queryRelation(RoleID_A), marriageState:queryRelation(RoleID_B)} of
						{
							#rec_marriage{targetRoleID = RoleID_B},
							#rec_marriage{targetRoleID = RoleID_A}
						} ->
							erlang:min(Value, ValueLimit2);
						_ ->
							0 %% 双方不是夫妻，忽略
					end
			end
	end.

%% 亲密度添加
-spec closenessAdd({RoleID_A::uint64(), RoleID_B::uint64(), Value::uint32(), Reason::type_mcs()}) -> ok.
closenessAdd({RoleID_A, RoleID_B, _Value, Reason} = Msg) ->
	?DEBUG_OUT("[DebugForMarriage] closenessAdd ~p", [Msg]),
	case closenessAdd_Check(Msg) of
		ValueReal when ValueReal > 0 ->
			%% 更新每日计数
			Daily2Type = mcs2dt(Reason),
			ValueOld = daily2State:queryDaily2(RoleID_A, RoleID_B, Daily2Type),
			%?DEBUG_OUT("ValueOld(~p) ValueReal(~p)", [ValueOld, ValueReal]),
			daily2Logic:saveDaily2({RoleID_A, RoleID_B, Daily2Type, ValueOld + ValueReal}),
			%% 更新亲密度
			RecA =
				marriageState:queryRelation(RoleID_A),
			RecB =
				marriageState:queryRelation(RoleID_B),
			RecANew =
				RecA#rec_marriage{
					closeness = RecA#rec_marriage.closeness + ValueReal
				},
			RecBNew =
				RecB#rec_marriage{
					closeness = RecB#rec_marriage.closeness + ValueReal
				},
			marriageState:replaceRelation(RecANew),
			marriageState:replaceRelation(RecBNew),
			gsSendMsg:sendMsg2DBServer(marriage_dbsave, 0, [{RecANew, RecBNew}]),
			%% 记录亲密度变化日志
			dbLog:sendSaveLogFriend(#rec_log_player_friend{
				roleID = RoleID_A,
				targetRoleID = RoleID_B,
				oldCloseness = RecA#rec_marriage.closeness,
				newCloseness = RecANew#rec_marriage.closeness,
				reason = Reason,
				isActive = 1,
				time = time:getLogTimeSec()
			}),
			dbLog:sendSaveLogFriend(#rec_log_player_friend{
				roleID = RoleID_B,
				targetRoleID = RoleID_A,
				oldCloseness = RecB#rec_marriage.closeness,
				newCloseness = RecBNew#rec_marriage.closeness,
				reason = Reason,
				isActive = 0,
				time = time:getLogTimeSec()
			}),
			%% 反馈玩家进程
			case core:queryOnLineRoleByRoleID(RoleID_A) of
				#rec_OnlinePlayer{pid = Pid_A} ->
					psMgr:sendMsg2PS(Pid_A, marriage_closenessAddAck, {ValueReal, Reason});
				_ ->
					skip
			end,
			case core:queryOnLineRoleByRoleID(RoleID_B) of
				#rec_OnlinePlayer{pid = Pid_B} ->
					psMgr:sendMsg2PS(Pid_B, marriage_closenessAddAck, {ValueReal, Reason});
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%% 亲密度消耗
-spec closenessUse({RoleID::uint64(), Value::uint32(), Reason::type_mcu()}) -> boolean().
closenessUse({RoleID, Value, Reason} = _Msg) ->
	?DEBUG_OUT("[DebugForMarriage] closenessUse ~p", [_Msg]),
	case marriageState:queryRelation(RoleID) of
		#rec_marriage{closeness = Closeness, targetRoleID = TargetRoleID} = Rec when Closeness >= Value ->
			RecNew =
				Rec#rec_marriage{
					closeness = Closeness - Value
				},
			marriageState:replaceRelation(RecNew),
			gsSendMsg:sendMsg2DBServer(marriage_dbsave, 0, [RecNew]),
			%% 记录亲密度变化日志（单向消耗）
			dbLog:sendSaveLogFriend(#rec_log_player_friend{
				roleID = RoleID,
				targetRoleID = TargetRoleID,
				oldCloseness = Closeness,
				newCloseness = Closeness - Value,
				reason = Reason,
				isActive = 1,
				time = time:getLogTimeSec()
			}),
			true;
		_ ->
			false %% 亲密度不足
	end.

%% 夫妻技能升级（可供玩家进程直接调用，因为影响这个数据的只有玩家进程）
-spec skillUp({RoleID::uint64(), SlotID::uint32(), Cost::uint32()}) -> ok.
skillUp({RoleID, SlotID, Cost} = _Msg) ->
	?DEBUG_OUT("[DebugForMarriage] skillUp ~p", [_Msg]),
	Rec =
		#rec_marriage_skill{
			roleID = RoleID,
			slotID = SlotID,
			slotExp = marriageState:querySlotExp(RoleID, SlotID) + Cost
		},
	marriageState:replaceSlot(Rec),
	gsSendMsg:sendMsg2DBServer(marriage_dbsave, 0, [Rec]),
	ok.

%% 婚戒突破（可供玩家进程直接调用，因为影响这个数据的只有玩家进程）
-spec ringUp({RoleID::uint64(), Cost::uint32()}) -> ok.
ringUp({RoleID, 0} = _Msg) ->
	?DEBUG_OUT("[DebugForMarriage] ringUp ~p", [_Msg]),
	Rec = marriageState:queryRelation(RoleID),
	RecNew =
		Rec#rec_marriage{
			ringTop = Rec#rec_marriage.ringTop + 1,
			ringExp = 0  %% 突破时重置经验
		},
	marriageState:replaceRelation(RecNew),
	gsSendMsg:sendMsg2DBServer(marriage_dbsave, 0, [RecNew]),
	ok;
ringUp({RoleID, Cost} = _Msg) ->
	?DEBUG_OUT("[DebugForMarriage] ringUp ~p", [_Msg]),
	Rec = marriageState:queryRelation(RoleID),
	RecNew =
		Rec#rec_marriage{
			ringExp = Rec#rec_marriage.ringExp + Cost
		},
	marriageState:replaceRelation(RecNew),
	gsSendMsg:sendMsg2DBServer(marriage_dbsave, 0, [RecNew]),
	ok.


%%% ====================================================================
%%% Internal functions
%%% ====================================================================

-spec mcs2dt(type_mcs()) -> daily2TypeC().
mcs2dt(?ClosenessSource_Date) ->
	?Daily2Type_C_AddClosenessFromDate;
mcs2dt(?ClosenessSource_KillMonster) ->
	?Daily2Type_C_AddClosenessFromKillMonster;
mcs2dt(?ClosenessSource_MarriageTask) ->
	?Daily2Type_C_AddClosenessFromMarriageTask.
