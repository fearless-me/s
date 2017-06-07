%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20170103
%%%-------------------------------------------------------------------
-module(playerMarriage).
-author("meitianyang").

-include("playerPrivate.hrl").
-include("../marriage/marriagePrivate.hrl").

-export([
	error_code/2,
	init/0,
	deleteRole/1,
	tick/0,

	queryList_Formal/1,
	wantBuild/3,
	beWantBuild/1,
	beBuild/2,
	build/1,
	break/1,
	skillUp/2,
	ringUp/1,

	buildAck/1,
	breakAck/1,

	closenessAdd/1,
	closenessUse/1,
	closenessAddAck/1,

	resetSkill/2,
	resetRingPropAdd/1
]).

%%% ====================================================================
%%% API functions
%%% ====================================================================

%%% --------------------------------------------------------------------
%%% 返回error code，主要用途是用于统一打印调试日志
-spec error_code(Code :: uint(), Param :: list()) -> ok.
error_code(Code, Param) ->
	?DEBUG_OUT("[DebugForMarriage] error RoleID(~p) ErrorCode(~p)", [playerState:getRoleID(), Code]),
	playerMsg:sendErrorCodeMsg(Code, Param).

%%% --------------------------------------------------------------------
%% 上线初始化
-spec init() -> ok.
init() ->
	?DEBUG_OUT("[DebugForMarriage] init RoleID(~p)", [playerState:getRoleID()]),
	%% 同步一波信息给客户端
	syncBaseInfo(),
	syncRingInfo(0, 0, 0),
	syncSkillInfo(),
	%% 初始化夫妻技能和婚戒附加属性
	resetSkill(true, true),
	resetRingPropAdd(true),
	resetRingPropAdd(false),
	%% 处理上次下线前未处理完的超时返还
	doWantBuildTimeout(false),
	% 以凌晨4点为界，不是今天则重置情缘任务
	case playerPropSync:getProp(?SerProp_MarriageTaskInfo) of
		{_, TimeLast} when TimeLast > 0 ->
			TimeNow = time:getSyncTime1970FromDBS(),
			{{YearN, MonthN, DayN}, _} = time:convertSec2DateTime(TimeNow - ?ResetTimeHour * 3600),
			case time:convertSec2DateTime(TimeLast - ?ResetTimeHour * 3600) of
				{{YearN, MonthN, DayN}, _} ->
					skip;
				_ ->
					playerMarriageTask:resetTask(true)
			end;
		{_, _} ->
			skip;
		_ ->
			playerMarriageTask:resetTask(true) %% 开发期间对旧的数据结构直接重置
	end,
	ok.

%%% --------------------------------------------------------------------
%% 删除角色
-spec deleteRole(RoleID :: uint64()) -> ok.
deleteRole(RoleID) ->
	?LOG_OUT("deleteRole RoleID(~p)", [RoleID]),
	%% 强制解除可能存在的婚姻关系，没有也要尝试清除已有的残余数据
	psMgr:sendMsg2PS(?PsNameMarriage, marriage_deleteRole, RoleID),
	ok.

%%% --------------------------------------------------------------------
%% 心跳
-spec tick() -> ok.
tick() ->
	doWantBuildTimeout(true).

%%% --------------------------------------------------------------------
%% 请求用于求婚的好友列表
-spec queryList_Formal(Page :: uint8()) -> ok.
queryList_Formal(Page) ->
	?DEBUG_OUT("[DebugForMarriage] queryList_Formal RoleID(~p) Page(~p)", [playerState:getRoleID(), Page]),
	playerFriend2:queryList_FormalForMarriage(Page),
	ok.

%%% --------------------------------------------------------------------
%% 求婚
-spec wantBuild(TargetRoleID :: uint64(), ItemID :: uint32(), Manifesto :: string()) -> ok.
wantBuild(TargetRoleID, ItemID, Manifesto) ->
	RoleID = playerState:getRoleID(),
	?DEBUG_OUT("[DebugForMarriage] wantBuild RoleID(~p) TargetRoleID(~p) ItemID(~p)", [RoleID, TargetRoleID, ItemID]),
	%% 1.检查是否处已经冷却
	case getWantBuildCooldown(TargetRoleID) of
		true ->
			%% 2.检查性别
			MySex = playerState:getSex(),
			#globalsetupCfg{setpara = [IsCoupleSame]} =
				getCfg:getCfgPStackWithDefaultValue(
					cfg_globalsetup,
					#globalsetupCfg{setpara = [0]},
					marriage_iscouplesame
				),
			case core:queryRoleKeyInfoByRoleID(TargetRoleID) of
				#?RoleKeyRec{sex = Sex} when (IsCoupleSame =:= 0 andalso Sex =/= MySex) orelse IsCoupleSame =:= 1 ->
					%% 3.检查已婚状态
					case {marriageState:queryRelation(RoleID), marriageState:queryRelation(TargetRoleID)} of
						{#rec_marriage{targetRoleID = TargetRoleID_A}, #rec_marriage{targetRoleID = TargetRoleID_B}}
							when TargetRoleID_A > 0 orelse TargetRoleID_B > 0 ->
							error_code(?ErrorCode_Marriage_Married, []);
						_ ->
							%% 4.检查友好度
							Friend2Data = friend2State:queryFriend2Data(RoleID),
							#rec_friend2_relation{closeness = Friendliness} =
								friend2State:queryRelation(Friend2Data, TargetRoleID),
							FriendlinessLimit = marriageState:configFriendlinessLimit(),
							case FriendlinessLimit > Friendliness of
								true ->
									error_code(?ErrorCode_Marriage_FriendlyLimit, [FriendlinessLimit]);
								_ ->
									%% 5.检查对方是否在线
									case core:queryOnLineRoleByRoleID(TargetRoleID) of
										#rec_OnlinePlayer{pid = Pid} ->
											%% 6.检查道具是否存在
											ListRingItem = marriageState:configRingItemList(),
											FunFind =
												fun(ID, {_, _}) ->
													{ID =:= ItemID, 0}
												end,
											case misc:foldlEx(FunFind, {false, 0}, ListRingItem) of
												{true, _} ->
													case playerPackage:getItemNumByID(ItemID) of
														Num when Num > 0 ->
															%% 扣除道具并向公共进程发起请求（由公共进程处理超时）
															Plog = #recPLogTSItem{
																old = Num,
																new = Num - 1,
																change = -1,
																target = ?PLogTS_Item,
																source = ?PLogTS_PlayerSelf,
																gold = 0,
																goldtype = 0,
																changReason = ?ItemDeleteReasonMarriageWantBuild,
																reasonParam = 0
															},
															case playerPackage:delGoodsByID(?Item_Location_Bag, ItemID, 1, Plog) of
																true ->
																	setWantBuildCooldown(TargetRoleID, ItemID),
																	playerMsg:sendNetMsg(#pk_GS2U_MarriageProposeRefresh_Ack{}),
																	psMgr:sendMsg2PS(Pid, marriage_wantBuild, {RoleID, ItemID, Manifesto});
																_ ->
																	?DEBUG_OUT("[DebugForMarriage] wantBuild RoleID(~p) TargetRoleID(~p) ItemID(~p) item dec failed", [RoleID, TargetRoleID, ItemID]),
																	skip  %% 不应该发生的扣除道具失败
															end;
														_ ->
															?DEBUG_OUT("[DebugForMarriage] wantBuild RoleID(~p) TargetRoleID(~p) ItemID(~p) item miss", [RoleID, TargetRoleID, ItemID]),
															skip  %% 客户端应判断没有道具的时候不应该发起请求，故此忽略
													end;
												_ ->
													?DEBUG_OUT("[DebugForMarriage] wantBuild RoleID(~p) TargetRoleID(~p) ItemID(~p) item err", [RoleID, TargetRoleID, ItemID]),
													skip  %% 客户端应判断没有道具的时候不应该发起请求，故此忽略
											end;
										_ ->
											error_code(?ErrorCode_Marriage_Offline, [])
									end
							end
					end;
				_ ->
					error_code(?ErrorCode_Marriage_InvalidSex, [])
			end;
		_Minute ->
			error_code(?ErrorCode_Marriage_NotCooldown, [])
	end,
	ok.

%% 被求婚
-spec beWantBuild({FromRoleID :: uint64(), ItemID :: uint32(), Manifesto :: string()}) -> ok.
beWantBuild({FromRoleID, ItemID, Manifesto}) ->
	?DEBUG_OUT("[DebugForMarriage] beWantBuild RoleID(~p) FromRoleID(~p)", [playerState:getRoleID(), FromRoleID]),
	Msg =
		#pk_GS2U_MarriagePropose_Ask{
			id = FromRoleID,
			name = playerNameUID:getPlayerNameByUID(FromRoleID),
			item = ItemID,
			manifesto = Manifesto
		},
	playerMsg:sendNetMsg(Msg),
	ok.

%% 是否同意被求婚
-spec beBuild(FromRoleID :: uint64(), IsAgreed :: boolean()) -> ok.
beBuild(FromRoleID, IsAgreed) ->
	RoleID = playerState:getRoleID(),
	?DEBUG_OUT("[DebugForMarriage] beBuild RoleID(~p) FromRoleID(~p) IsAgreed(~p)", [RoleID, FromRoleID, IsAgreed]),
	case core:queryOnLineRoleByRoleID(FromRoleID) of
		#rec_OnlinePlayer{pid = Pid} ->
			%% 需要最终验证好友关系，可能求婚中途解除了好友关系
			Friend2Data = friend2State:queryFriend2Data(RoleID),
			case friend2State:queryRelation(Friend2Data, FromRoleID) of
				#rec_friend2_relation{relation = ?RELATION_FORMAL} ->
					psMgr:sendMsg2PS(Pid, marriage_wantBuildAck, {RoleID, IsAgreed});
				_ ->
					psMgr:sendMsg2PS(Pid, marriage_wantBuildAck, {RoleID, false}),        %% 不是好友了，强制拒绝
					error_code(?ErrorCode_Marriage_Timeout, [])                            %% 不是好友了提示超时
			end;
		_ ->
			case IsAgreed of
				true ->
					error_code(?ErrorCode_Marriage_Timeout, []);    %% 仅同意时提示超时
				_ ->
					skip
			end
	end,
	ok.

%% 被拒绝或者成婚
-spec build({TargetRoleID :: uint64(), IsAgreed :: boolean()}) -> ok.
build({TargetRoleID, false}) ->
	?DEBUG_OUT("[DebugForMarriage] build RoleID(~p) TargetRoleID(~p) false", [playerState:getRoleID(), TargetRoleID]),
	case getWantBuildCooldown(TargetRoleID) of
		true ->
			skip;
		_ ->
			doWantBuild(TargetRoleID, false, true)
	end,
	ok;
build({TargetRoleID, true}) ->
	case getWantBuildCooldown(TargetRoleID) of
		true ->
			#rec_OnlinePlayer{netPid = NetPid} = core:queryOnLineRoleByRoleID(TargetRoleID),
			playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_Marriage_Timeout, []);
		_ ->
			RoleID = playerState:getRoleID(),
			?DEBUG_OUT("[DebugForMarriage] build RoleID(~p) TargetRoleID(~p) true", [RoleID, TargetRoleID]),
			%% 1.检查性别
			MySex = playerState:getSex(),
			#globalsetupCfg{setpara = [IsCoupleSame]} =
				getCfg:getCfgPStackWithDefaultValue(
					cfg_globalsetup,
					#globalsetupCfg{setpara = [0]},
					marriage_iscouplesame
				),
			case core:queryRoleKeyInfoByRoleID(TargetRoleID) of
				#?RoleKeyRec{sex = Sex} when (IsCoupleSame =:= 0 andalso Sex =/= MySex) orelse IsCoupleSame =:= 1 ->
					%% 2.检查已婚状态
					case {marriageState:queryRelation(RoleID), marriageState:queryRelation(TargetRoleID)} of
						{#rec_marriage{targetRoleID = TargetRoleID_A}, #rec_marriage{targetRoleID = TargetRoleID_B}}
							when TargetRoleID_A > 0 orelse TargetRoleID_B > 0 ->
							error_code(?ErrorCode_Marriage_Married, []);
						_ ->
							%% 3.检查友好度
							Friend2Data = friend2State:queryFriend2Data(RoleID),
							#rec_friend2_relation{closeness = Friendliness} =
								friend2State:queryRelation(Friend2Data, TargetRoleID),
							FriendlinessLimit = marriageState:configFriendlinessLimit(),
							case FriendlinessLimit > Friendliness of
								true ->
									error_code(?ErrorCode_Marriage_FriendlyLimit, [FriendlinessLimit]);
								_ ->
									ItemID = doWantBuild(TargetRoleID, true, false),  %% 标记对应道具不返还
									psMgr:sendMsg2PS(?PsNameMarriage, marriage_build, {RoleID, TargetRoleID, ItemID})
							end
					end;
				_ ->
					error_code(?ErrorCode_Marriage_InvalidSex, [])
			end
	end,
	ok.

%%% --------------------------------------------------------------------
%% 离婚
-spec break(IsTeam :: boolean()) -> ok.
break(IsTeam) ->
	RoleID = playerState:getRoleID(),
	?DEBUG_OUT("[DebugForMarriage] break RoleID(~p) IsTeam(~p)", [RoleID, IsTeam]),
	%% 检查玩家是否已婚
	case marriageState:queryRelation(RoleID) of
		#rec_marriage{targetRoleID = TargetRoleID} when TargetRoleID > 0 ->
			break_(RoleID, TargetRoleID, IsTeam);
		_ ->
			error_code(?ErrorCode_Marriage_NotMarried, [])
	end.
%% 协议离婚
break_(RoleID, TargetRoleID, true) ->
	?DEBUG_OUT("[DebugForMarriage] break RoleID(~p) true", [RoleID]),
	%% 检查是否与伴侣组队
	TeamMemberList = teamInterface:getTeamMemberInfoListWithRoleID(RoleID),
	%%playerTeam2:getTeamAllMemberInfoList(?PlayerTeamTypeNormal),
	case erlang:length(TeamMemberList) =:= 2 of
		true ->
			case lists:keyfind(TargetRoleID, #recTeamMemberInfo.roleID, TeamMemberList) of
				#recTeamMemberInfo{} ->
					psMgr:sendMsg2PS(?PsNameMarriage, marriage_break, {RoleID, TargetRoleID, true});
				_ ->
					error_code(?ErrorCode_Marriage_BreakNeedTeam, [])
			end;
		_ ->
			error_code(?ErrorCode_Marriage_BreakNeedTeam, [])
	end,
	ok;
break_(RoleID, TargetRoleID, false) ->
	?DEBUG_OUT("[DebugForMarriage] break RoleID(~p) false", [RoleID]),
	%% 单方强制离婚
	%% 检查钱够不够
	Cost = marriageState:configBreakCost(),
	case playerMoney:canUseCoin(?CoinUseTypeGold, Cost) of
		true ->
			Plog =
				#recPLogTSMoney{
					reason = ?CoinBuyMarriageBreak,
					param = [],
					target = ?PLogTS_Marriage,
					source = ?PLogTS_PlayerSelf
				},
			case playerMoney:useCoin(?CoinUseTypeGold, Cost, Plog) of
				true ->
					psMgr:sendMsg2PS(?PsNameMarriage, marriage_break, {RoleID, TargetRoleID, false});
				_ ->
					?DEBUG_OUT("[DebugForMarriage] break RoleID(~p) false", [RoleID]),
					error_code(?ErrorCode_Marriage_NoMoney, [])
			end;
		_ ->
			?DEBUG_OUT("[DebugForMarriage] break RoleID(~p) false", [RoleID]),
			error_code(?ErrorCode_Marriage_NoMoney, [])
	end,
	ok.

%%% --------------------------------------------------------------------
%% 技能升级
-spec skillUp(CostCloseness :: uint32(), SlotID :: uint32()) -> ok.
skillUp(CostCloseness, SlotID) ->
	?DEBUG_OUT("[DebugForMarriage] skillUp RoleID(~p) CostCloseness(~p) SlotID(~p)", [playerState:getRoleID(), CostCloseness, SlotID]),
	%% 0.忽略消耗亲密度非法的操作
	case CostCloseness =< 0 of
		true ->
			?DEBUG_OUT("[DebugForMarriage]"),
			skip;
		_ ->
			%% 1.检查是否已婚
			RoleID = playerState:getRoleID(),
			case marriageState:queryRelation(RoleID) of
				#rec_marriage{targetRoleID = TargetRoleID, ringTop = RingTop, ringExp = RingExp} when TargetRoleID > 0 ->
					%% 2.检查是否满级
					SlotExp = marriageState:querySlotExp(RoleID, SlotID),
					{
						#spouseskillCfg{
							skilllevel = LevelCur
						},
						_ExpLeft
					} = marriageState:configSkillCur(SlotID, SlotExp),
					#spouseskillCfg{
						skilllevel = LevelMax
					} = marriageState:configSkillMax(SlotID),
					LevelRing = marriageState:configRingLevel(RingTop, RingExp),
					%% 技能等级不能超过最大等级
					%% 技能等级不能超过婚戒总等级
					case LevelCur >= LevelMax orelse LevelCur >= LevelRing of
						true ->
							?DEBUG_OUT("[DebugForMarriage]"),
							error_code(?ErrorCode_Marriage_SkillLevelLimit, []);
						_ ->
							%% 3.计算最多可以消耗的亲密度
							RoleLevel = playerState:getLevel(),
							{
								_CfgLimitLast,
								NeedExpMax,
								CfgCannotNext
							} = marriageState:configSkillLimit(SlotID, RoleLevel, RoleLevel),
							case SlotExp >= NeedExpMax of
								true ->
									%% 注：若此处CfgCannotNext无法解析为#spouseskillCfg{}，则应该是配置变动造成已有经验比所需经验多，需要增大配置中的经验要求或者扣除经验
									?DEBUG_OUT("[DebugForMarriage]"),
									error_code(?ErrorCode_Marriage_SkillRoleLimit, [CfgCannotNext#spouseskillCfg.level]);
								_ ->
									%% 4.尝试扣除亲密度并升级技能槽
									CostReal = erlang:min(CostCloseness, NeedExpMax - SlotExp),
									case closenessUse({RoleID, CostReal, ?ClosenessUse_SkillUp}) of
										false ->
											?DEBUG_OUT("[DebugForMarriage]"),
											error_code(?ErrorCode_Marriage_SkillNoEnergy, []);
										_ ->
											?DEBUG_OUT("[DebugForMarriage]"),
											marriageLogic:skillUp({RoleID, SlotID, CostReal}),
											SlotExpNew = SlotExp + CostReal,
											{
												#spouseskillCfg{
													skilllevel = LevelNew
												},
												_
											} = marriageState:configSkillCur(SlotID, SlotExpNew),
											syncSkillInfo(SlotID, SlotExpNew, SlotExp, LevelCur, LevelNew),
											resetSkill(true, false)
									end
							end
					end;
				_ ->
					?DEBUG_OUT("[DebugForMarriage]"),
					skip %% 忽略未婚时的操作（客户端应屏蔽UI）
			end
	end,
	ok.

%%% --------------------------------------------------------------------
%% 婚戒升级或突破
-spec ringUp(CostCloseness :: uint32()) -> ok.
ringUp(CostCloseness) ->
	?DEBUG_OUT("[DebugForMarriage] skillUp RoleID(~p) CostCloseness(~p)", [playerState:getRoleID(), CostCloseness]),
	%% 需要已婚
	RoleID = playerState:getRoleID(),
	case marriageState:queryRelation(RoleID) of
		#rec_marriage{targetRoleID = TargetRoleID, ringTop = Top, ringExp = Exp} when TargetRoleID > 0 ->
			case ringUp_(CostCloseness, Top, Exp) of
				true ->
					resetRingPropAdd(true),
					%% 通知伴侣同步属性
					case core:queryOnLineRoleByRoleID(TargetRoleID) of
						#rec_OnlinePlayer{pid = Pid} ->
							psMgr:sendMsg2PS(Pid, marriage_ringUp, 0);
						_ ->
							skip
					end;
				_ ->
					skip %% 升级或突破失败
			end;
		_ ->
			?DEBUG_OUT("[DebugForMarriage]"),
			skip %% 忽略未婚时的操作（客户端应屏蔽UI）
	end,
	ok.

%% 突破
ringUp_(0, Top, Exp) ->
	TopMax = lists:last(getCfg:get1KeyList(cfg_weddingring)),
	%% 检查是否已达配置极限无法继续突破
	case Top >= TopMax of
		true ->
			error_code(?ErrorCode_Marriage_RingTopLimit, []),
			false;
		_ ->
			%% 检查婚戒当前经验是否可以突破
			RoleID = playerState:getRoleID(),
			ExpMax = marriageState:configRingLimit(Top),
			{
				#weddingringCfg{
					level = LevelCur,
					levelLimit = RoleLevelLimit,
					break_itemID = ListItem
				},
				_
			} = marriageState:configRingCur(Top, Exp),
			case Exp < ExpMax of
				true ->
					error_code(?ErrorCode_Marriage_RingTopLevelLimit, []),
					false;
				_ ->
					%% 检查玩家等级是否可以突破
					RoleLevel = playerState:getLevel(),
					case RoleLevel < RoleLevelLimit of
						true ->
							error_code(?ErrorCode_Marriage_RingTopRoleLimit, [RoleLevelLimit]),
							false;
						_ ->
							%% 尝试扣除突破所需道具
							FunCombineItem =
								fun({ID, Num}, R) ->
									case lists:keyfind(ID, 1, R) of
										{_, NumOld} ->
											lists:keystore(ID, 1, R, {ID, Num + NumOld});
										_ ->
											[{ID, Num} | R]
									end
								end,
							ListItemReal = lists:foldl(FunCombineItem, [], ListItem),
							FunCheckItem =
								fun({ID, Num}, {_, R}) ->
									NumAll = playerPackage:getItemNumByID(ID),
									{NumAll < Num, [{ID, Num, NumAll} | R]}
								end,
							case misc:foldlEx(FunCheckItem, {false, []}, ListItemReal) of
								{true, _} ->
									error_code(?ErrorCode_Marriage_RingNoItem, []), %% 道具不足
									false;
								{_, ListItemFull} ->
									FunDelItem =
										fun({ID, Num, NumAll}, {_, R}) ->
											Plog =
												#recPLogTSItem{
													old = NumAll,
													new = NumAll - Num,
													change = -Num,
													target = ?PLogTS_Marriage,
													source = ?PLogTS_PlayerSelf,
													gold = 0,
													goldtype = 0,
													changReason = ?ItemDeleteReasonMarriageRingTop,
													reasonParam = 0
												},
											case playerPackage:delGoodsByID(?Item_Location_Bag, ID, Num, Plog) of
												true ->
													{false, [{ID, Num} | R]};
												_ ->
													{true, R}
											end
										end,
									case misc:foldlEx(FunDelItem, {false, []}, ListItemFull) of
										{true, []} ->
											error_code(?ErrorCode_Marriage_RingNoItem, []),   %% 扣除道具失败
											false;
										{true, ListItemDel} ->
											error_code(?ErrorCode_Marriage_RingNoItem, []),   %% 扣除道具失败
											?ERROR_OUT("ringUp_ del item but others failed ~p", [ListItemDel]), %% 部分道具被扣除，写个日志便于恢复
											false;
										_ ->
											%% 突破婚戒并重置经验
											marriageLogic:ringUp({RoleID, 0}),
											syncRingInfo(Top, Exp, LevelCur),
											true  %% 返回上层函数刷新婚戒属性附加值
									end
							end
					end
			end
	end;
%% 升级
ringUp_(Cost, Top, Exp) ->
	%% 计算最多可以消耗的亲密度
	ExpMax = marriageState:configRingLimit(Top),
	case Exp >= ExpMax of
		true ->
			error_code(?ErrorCode_Marriage_RingLevelLimit, []),
			false;
		_ ->
			%% 扣除亲密度进行升级
			CostReal = erlang:min(Cost, ExpMax - Exp),
			RoleID = playerState:getRoleID(),
			case closenessUse({RoleID, CostReal, ?ClosenessUse_RingUp}) of
				false ->
					error_code(?ErrorCode_Marriage_RingNoEnergy, []),
					false;
				_ ->
					%% 注入能量（可能升级）
					marriageLogic:ringUp({RoleID, CostReal}),
					{#weddingringCfg{level = LevelCur}, _} = marriageState:configRingCur(Top, Exp),
					syncRingInfo(Top, Exp, LevelCur),
					true  %% 返回上层函数刷新婚戒属性附加值
			end
	end.

%%% --------------------------------------------------------------------
%% 结婚反馈消息
-spec buildAck({PartnerRoleID :: uint64(), ItemID :: uint32()}) -> ok.
buildAck({PartnerRoleID, ItemID} = _Msg) ->
	RoleID = playerState:getRoleID(),
	?DEBUG_OUT("[DebugForMarriage] buildAck RoleID(~p) _Msg(~p)", [RoleID, _Msg]),
	syncBaseInfo(),
	playerMsg:sendNetMsg(
		#pk_GS2U_MarriagePropose_Ack{
			id = PartnerRoleID,
			name = playerNameUID:getPlayerNameByUID(PartnerRoleID),
			item = ItemID,
			isS = true
		}
	),
	resetSkill(true, false),
	resetRingPropAdd(true),
	resetRingPropAdd(false),
	ok.

%%% --------------------------------------------------------------------
%% 离婚反馈消息
-spec breakAck({PartnerRoleID :: uint64()}) -> ok.
breakAck({PartnerRoleID} = _Msg) ->
	RoleID = playerState:getRoleID(),
	?DEBUG_OUT("[DebugForMarriage] breakAck RoleID(~p) _Msg(~p)", [RoleID, _Msg]),
	syncBaseInfo(),
	playerMsg:sendNetMsg(
		#pk_GS2U_MarriageBreak_Ack{
			id = PartnerRoleID,
			name = playerNameUID:getPlayerNameByUID(PartnerRoleID)
		}
	),
	resetSkill(true, false),
	resetRingPropAdd(true),
	resetRingPropAdd(false),
	playerMarriageTask:resetTask(false),
	ok.

%%% --------------------------------------------------------------------
%% 亲密度增加
-spec closenessAdd({RoleID_A :: uint64(), RoleID_B :: uint64(), Value :: uint32(), Reason :: type_mcs()}) -> ok.
closenessAdd(Msg) ->
	?DEBUG_OUT("[DebugForMarriage] closenessAdd ~p", [Msg]),
	%% 本地查一下减少消息量
	case marriageLogic:closenessAdd_Check(Msg) of
		ValueReal when ValueReal > 0 ->
			psMgr:sendMsg2PS(?PsNameMarriage, marriage_closenessAdd, Msg);
		_ ->
			skip
	end,
	ok.

%%% --------------------------------------------------------------------
%% 亲密度消耗
-spec closenessUse({RoleID :: uint64(), Value :: uint32(), Reason :: type_mcu()}) -> boolean().
closenessUse({RoleID, Value, _} = Msg) ->
	?DEBUG_OUT("[DebugForMarriage] closenessUse ~p", [Msg]),
	case marriageState:queryRelation(RoleID) of
		#rec_marriage{closeness = Closeness} when Closeness >= Value ->
			case psMgr:call(?PsNameMarriage, marriage_closenessUse, Msg, ?Start_Link_TimeOut_ms) of
				true ->
					syncBaseInfo(),
					true;
				_ ->
					false
			end;
		_ ->
			false %% 亲密度不足
	end.

%%% --------------------------------------------------------------------
%% 亲密度增加反馈（消耗是call所以没有反馈）
-spec closenessAddAck({Value :: uint32(), Reason :: type_mcs()}) -> ok.
closenessAddAck(_) ->
	syncBaseInfo().

%%% --------------------------------------------------------------------
%% 重置夫妻技能
%% 以下情况需要在玩家进程调用该函数
%%    1.上线时 playerMarriage:init/0 另外需要通知伴侣玩家进程
%%    2.下线时 playerOtp:handle_info({netQuit,Pid,Reason},State) 不需要处理自己，但是需要通知伴侣玩家进程
%%    3.结婚时 playerMarriage:buildAck/1 此处由公共进程通知双方，不需要另外通知伴侣玩家进程
%%    4.离婚时 playerMarriage:breakAck/1 此处由公共进程通知双方，不需要另外通知伴侣玩家进程
%%    5.加入队伍时 playerTeam:addNewTeam/2 另外需要通知伴侣玩家进程
%%    6.退出队伍时 playerTeam:leaveTeam/1 另外需要通知伴侣玩家进程
%%    7.进入地图时 playerMap:dealOnlyEnteredGame/1 另外需要通知伴侣玩家进程
%%    8.技能升级时 playerMarraige:skillUp/2 不需要另外通知伴侣玩家进程
%%    注1：没有【退出地图时】的处理，被【下线时】包括了
%%    注2：【上线时】本质上时特殊的【进入地图时】，有些微差别
-spec resetSkill(NeedResetMyself :: boolean(), NeedNoticeParter :: boolean()) -> ok.
resetSkill(true, false) ->
	%?DEBUG_OUT("[DebugForMarriage] resetSkill true false RoleID:~p", [playerState:getRoleID()]),
	%% 删除已有技能
	[playerSkill:delMarriageSkill(ID) || ID <- playerPropSync:getProp(?SerProp_MarriageSkillListCache)],
	%% 发动条件1.已婚
	RoleID = playerState:getRoleID(),
	ListCacheNew =
		case marriageState:queryRelation(RoleID) of
			#rec_marriage{targetRoleID = TargetRoleID} when TargetRoleID > 0 ->
				%% 发动条件2.与伴侣同地图并且在同一队伍
				PlayerEts = playerState:getMapPlayerEts(),
				TeamID = playerState:getTeamID(),
				case core:queryOnLineRoleByRoleID(TargetRoleID) of
					#rec_OnlinePlayer{code = TargetCode} ->
						case ets:lookup(PlayerEts, TargetCode) of
							[#recMapObject{teamID = TeamID}] when TeamID =/= 0 ->
								%% 习得所有槽位对应的技能
								FunStudy =
									fun(SlotID, ListSkillID) ->
										SlotExp = marriageState:querySlotExp(RoleID, SlotID),
										{
											#spouseskillCfg{
												skillid = SkillID,
												skilllevel = SkillLevel
											},
											_ExpLeft
										} = marriageState:configSkillCur(SlotID, SlotExp),
										playerSkill:addMarriageSkill(SkillID, SkillLevel),
										[SkillID | ListSkillID]
									end,
								lists:foldl(FunStudy, [], getCfg:get1KeyList(cfg_spouseskill));
							_ ->
								[] %% 不在同一队伍或者同一地图
						end;
					_ ->
						[] %% 不在线
				end;
			_ ->
				[]  %% 未婚
		end,
	playerPropSync:setAny(?SerProp_MarriageSkillListCache, ListCacheNew),
	ok;
resetSkill(false, true) ->
	%?DEBUG_OUT("[DebugForMarriage] resetSkill false true RoleID:~p", [playerState:getRoleID()]),
	%% 通知伴侣玩家进程
	RoleID = playerState:getRoleID(),
	case marriageState:queryRelation(RoleID) of
		#rec_marriage{targetRoleID = TargetRoleID} when TargetRoleID > 0 ->
			case core:queryOnLineRoleByRoleID(TargetRoleID) of
				#rec_OnlinePlayer{pid = Pid} ->
					erlang:send_after(1000, Pid, {marriage_resetSkill, self(), 0});
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok;
resetSkill(true, true) ->
	resetSkill(true, false),
	resetSkill(false, true),
	ok.

%%% --------------------------------------------------------------------
%% 重置婚戒属性附加
%% 以下情况需要在玩家进程调用该函数
%%    1.上线时 playerMarriage:init/0 不需要另外通知伴侣玩家进程
%%    2.结婚时 playerMarriage:buildAck/1 此处由公共进程通知双方，不需要另外通知伴侣玩家进程
%%    3.离婚时 playerMarriage:breakAck/1 此处由公共进程通知双方，不需要另外通知伴侣玩家进程
%%    4.升级或突破婚戒时 playerMarriage:ringUp/1 另外需要通知伴侣玩家进程
-spec resetRingPropAdd(IsMySelf :: boolean()) -> ok.
resetRingPropAdd(true) ->
	?DEBUG_OUT("[DebugForMarriage] resetRingPropAdd true"),
	%% 清除原有属性
	{AddList, Keep} = playerPropSync:getProp(?SerProp_MarriageRingAdd),

	AddProps_Del = lists:foldl(
		fun({Type, Value}, R) ->
			[{Type, -Value} | R]
		end, [], AddList),

	%% 尝试附加新的属性
	RoleID = playerState:getRoleID(),
	{MyNew, AddProps} =
		case marriageState:queryRelation(RoleID) of
			#rec_marriage{targetRoleID = TargetRoleID, ringExp = Exp, ringTop = Top} when TargetRoleID > 0 ->
				{#weddingringCfg{property = AddListNew}, _} = marriageState:configRingCur(Top, Exp),
				{AddListNew, AddListNew};
			_ ->
				{[], []}
		end,
	%% 刷新属性
	playerCalcProp:changeProp_AddMulti(AddProps_Del, [], AddProps, [], true),
	playerForce:calcPlayerForce(true),
	playerPropSync:setAny(?SerProp_MarriageRingAdd, {MyNew, Keep});
resetRingPropAdd(false) ->
	?DEBUG_OUT("[DebugForMarriage] resetRingPropAdd false"),
	%% 清除原有属性
	{Keep, AddList} = playerPropSync:getProp(?SerProp_MarriageRingAdd),
	
	AddProps_Del = lists:foldl(
		fun({Type, Value}, R) ->
			[{Type, -Value} | R]
		end, [], AddList),
	%% 尝试附加新的属性
	RoleID = playerState:getRoleID(),
	AddProps =
		case marriageState:queryRelation(RoleID) of
			#rec_marriage{targetRoleID = TargetRoleID} when TargetRoleID > 0 ->
				#rec_marriage{ringExp = Exp, ringTop = Top} = marriageState:queryRelation(TargetRoleID),
				{#weddingringCfg{property = AddListNew}, _} = marriageState:configRingCur(Top, Exp),
				Scale = marriageState:configFerescale(),
				FunScale =
					fun({Type, Value}, R) ->
						[{Type, Value * Scale} | R]
					end,
				lists:foldl(FunScale, [], AddListNew);
			_ ->
				[]
		end,
	%% 刷新属性
	playerPropSync:setAny(?SerProp_MarriageRingAdd, {Keep, AddProps}),
	playerCalcProp:changeProp_AddMulti(AddProps_Del,[], AddProps,[], true),
	playerForce:calcPlayerForce(true).


%%% ====================================================================
%%% Internal functions
%%% ====================================================================

%% 同步姻缘基本信息
-spec syncBaseInfo() -> ok.
syncBaseInfo() ->
	RoleID = playerState:getRoleID(),
	#rec_marriage{
		targetRoleID = TargetRoleID,
		closeness = Closeness,
		timeRelation = TimeRelation
	} = marriageState:queryRelation(RoleID),
	case TargetRoleID > 0 of
		true ->
			case core:queryRoleKeyInfoByRoleID(TargetRoleID) of
				#?RoleKeyRec{roleName = Name, sex = Sex} ->
					Msg =
						#pk_GS2U_MarriageBaseInfo_Sync{
							id = TargetRoleID,
							name = Name,
							sex = Sex,
							weddingDay = TimeRelation,
							closeness = Closeness
						},
					playerMsg:sendNetMsg(Msg);
				_ ->
					?ERROR_OUT("syncBaseInfo can not find TargetRoleID(~p) from core:queryRoleKeyInfoByRoleID/1", [TargetRoleID]),
					skip
			end;
		_ ->
			%% 未婚
			Msg =
				#pk_GS2U_MarriageBaseInfo_Sync{
					id = TargetRoleID,
					name = [],
					sex = 0,
					weddingDay = TimeRelation,
					closeness = Closeness
				},
			playerMsg:sendNetMsg(Msg)
	end,
	ok.

%% 同步婚戒信息
-spec syncRingInfo(TopOld :: uint32(), ExpOld :: uint32(), LvOld :: uint32()) -> ok.
syncRingInfo(TopOld, ExpOld, LvOld) ->
	RoleID = playerState:getRoleID(),
	#rec_marriage{
		%targetRoleID = TargetRoleID,
		ringTop = RingTop,
		ringExp = RingExp
	} = marriageState:queryRelation(RoleID),
	{#weddingringCfg{level = LvNew}, _} = marriageState:configRingCur(RingTop, RingExp),
	Msg =
		#pk_GS2U_MarriageRingUp_Sync{
			topOld = TopOld,
			expOld = ExpOld,
			lvOld = LvOld,
			topNew = RingTop,
			expNew = RingExp,
			lvNew = LvNew
		},
	playerMsg:sendNetMsg(Msg),
	% 该功能已废弃
	%%% 如果伴侣存在且在线，则向伴侣同步婚戒信息
	%case TargetRoleID > 0 of
	%	true ->
	%		case core:queryOnLineRoleByRoleID(TargetRoleID) of
	%			#rec_OnlinePlayer{netPid = NetPid} ->
	%				playerMsg:sendNetMsg(
	%					NetPid,
	%					#pk_GS2U_MarriageRingUpPartner_Sync{
	%						topOld = TopOld,
	%						expOld = ExpOld,
	%						lvOld = LvOld,
	%						topNew = RingTop,
	%						expNew = RingExp,
	%						lvNew = LvNew
	%					}
	%				);
	%			_ ->
	%				skip
	%		end;
	%	_ ->
	%		skip
	%end,
	ok.

%% 同步夫妻技能信息
-spec syncSkillInfo() -> ok.
syncSkillInfo() ->
	RoleID = playerState:getRoleID(),
	FunMakeMsg =
		fun(SlotID, R) ->
			[#pk_SkillInfoForMarraige{id = SlotID, exp = marriageState:querySlotExp(RoleID, SlotID)} | R]
		end,
	Msg =
		#pk_GS2U_MarriageSkill_Sync{
			listSkill = lists:foldl(FunMakeMsg, [], getCfg:get1KeyList(cfg_spouseskill))
		},
	playerMsg:sendNetMsg(Msg),
	ok.
-spec syncSkillInfo(SlotID :: uint32(), SlotExp :: uint32(), ExpOld :: uint32(), LvOld :: uint32(), LvNew :: uint32()) -> ok.
syncSkillInfo(SlotID, SlotExp, ExpOld, LvOld, LvNew) ->
	Msg =
		#pk_GS2U_MarriageSkillUp_Ack{
			skill = #pk_SkillInfoForMarraige{
				id = SlotID,
				exp = SlotExp
			},
			expOld = ExpOld,
			lvOld = LvOld,
			lvNew = LvNew
		},
	playerMsg:sendNetMsg(Msg),
	ok.

%%% 求婚行为控制
%是否冷却
-spec getWantBuildCooldown(TargetRoleID :: uint64()) -> true | uint32().
getWantBuildCooldown(TargetRoleID) ->
	List = playerPropSync:getProp(?SerProp_MarriageWantBuildTime),
	case lists:keyfind(TargetRoleID, #recWantBuild.id, List) of
		#recWantBuild{time = TimeLast} ->
			case marriageState:now() - TimeLast - marriageState:configTimeOut() of
				Sec when Sec > 0 ->
					?DEBUG_OUT("Sec(~p)", [Sec]),
					doWantBuildTimeout(true), %% 在tick外处理超时返还
					true;
				Sec ->
					?DEBUG_OUT("Sec(~p)", [Sec]),
					case (-Sec + 1) rem 60 > 0 of
						true ->
							(-Sec + 1) div 60 + 1;
						_ ->
							(-Sec + 1) div 60
					end
			end;
		_ ->
			true
	end.
%超时返还
-spec doWantBuildTimeout(SendNetMsg :: boolean()) -> ok.
doWantBuildTimeout(SendNetMsg) ->
	TimeNow = marriageState:now(),
	TimeOut = marriageState:configTimeOut(),
	RoleID = playerState:getRoleID(),
	FunCheck =
		fun(#recWantBuild{
			id = TargetRoleID,
			time = TimeLast,
			item = ItemID
		} = Rec, R) ->
			case TimeLast + TimeOut =< TimeNow of
				true ->
					?DEBUG_OUT("~p", [{TimeLast, TimeOut, TimeNow}]),
					case playerMail:createMailGoods(ItemID, 1, true, 0, RoleID, ?ItemSourceMarriageWantBuildFaild) of
						[#recMailItem{} | _] = MailItemList ->
							Title = marriageState:configStringMailTitleBuildFaild(),
							Content = marriageState:configStringMailContentBuildFaild(TargetRoleID),
							mail:sendSystemMail(RoleID, Title, Content, MailItemList, "");
						_ ->
							?ERROR_OUT("doWantBuildTimeout ItemID=~p, rec=~p", [ItemID, Rec])
					end,
					case SendNetMsg of
						true ->
							playerMsg:sendNetMsg(
								#pk_GS2U_MarriagePropose_Ack{
									id = TargetRoleID,
									name = playerNameUID:getPlayerNameByUID(TargetRoleID),
									item = ItemID,
									isS = false
								}
							);
						_ ->
							skip
					end,
					R;
				_ ->
					[Rec | R]
			end
		end,
	ListOld = playerPropSync:getProp(?SerProp_MarriageWantBuildTime),
	ListNew = lists:foldl(FunCheck, [], ListOld),
	case erlang:length(ListNew) =:= erlang:length(ListOld) of
		true ->
			skip;
		_ ->
			playerPropSync:setAny(?SerProp_MarriageWantBuildTime, ListNew)
	end,
	ok.
%添加求婚行为
-spec setWantBuildCooldown(TargetRoleID :: uint64(), ItemID :: uint32()) -> boolean().
setWantBuildCooldown(TargetRoleID, ItemID) ->
	ListOld = playerPropSync:getProp(?SerProp_MarriageWantBuildTime),
	case lists:keyfind(TargetRoleID, #recWantBuild.id, ListOld) of
		#recWantBuild{} = Rec ->
			?ERROR_OUT("setWantBuildCooldown already exists ~p", [Rec]),
			false;
		_ ->
			ListNew = [#recWantBuild{id = TargetRoleID, time = marriageState:now(), item = ItemID} | ListOld],
			playerPropSync:setAny(?SerProp_MarriageWantBuildTime, ListNew),
			true
	end.
%被拒绝或被接受
-spec doWantBuild(TargetRoleID :: uint64(), IsAgreed :: boolean(), SendNetMsg :: boolean()) -> ItemID :: uint32().
doWantBuild(TargetRoleID, IsAgreed, SendNetMsg) ->
	RoleID = playerState:getRoleID(),
	FunCheck =
		fun(#recWantBuild{
			id = TargetRoleID_,
			item = ItemID
		} = Rec, {R, ItemIDAcc}) ->
			case TargetRoleID_ of
				TargetRoleID ->
					case IsAgreed of
						false ->
							case playerMail:createMailGoods(ItemID, 1, true, 0, RoleID, ?ItemSourceMarriageWantBuildFaild) of
								[#recMailItem{} | _] = MailItemList ->
									Title = marriageState:configStringMailTitleBuildFaild(),
									Content = marriageState:configStringMailContentBuildFaild(TargetRoleID),
									mail:sendSystemMail(RoleID, Title, Content, MailItemList, "");
								_ ->
									?ERROR_OUT("doWantBuildTimeout ItemID=~p, rec=~p", [ItemID, Rec])
							end;
						_ ->
							skip
					end,
					case SendNetMsg of
						true ->
							playerMsg:sendNetMsg(
								#pk_GS2U_MarriagePropose_Ack{
									id = TargetRoleID,
									name = playerNameUID:getPlayerNameByUID(TargetRoleID),
									item = ItemID,
									isS = IsAgreed
								}
							);
						_ ->
							skip
					end,
					{R, ItemID};
				_ ->
					{[Rec | R], ItemIDAcc}
			end
		end,
	ListOld = playerPropSync:getProp(?SerProp_MarriageWantBuildTime),
	{ListNew, ItemID} = lists:foldl(FunCheck, {[], 0}, ListOld),
	case erlang:length(ListNew) =:= erlang:length(ListOld) of
		true ->
			skip;
		_ ->
			playerPropSync:setAny(?SerProp_MarriageWantBuildTime, ListNew)
	end,
	ItemID.


