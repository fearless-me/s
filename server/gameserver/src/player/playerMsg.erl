%%
%%%玩家的消息处理

-module(playerMsg).
-author(zhongyuanwei).

-include("playerPrivate.hrl").
%-include("../netmsg/netmsgRecords.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([
	dealNetMsg/2,
	sendNetMsg/1,
	sendNetMsg/2,
	sendErrorCodeMsg/1,
	sendErrorCodeMsg/2,
	sendErrorCodeMsg/3,
	sendTipsErrorCodeMsg/1,
	sendTipsErrorCodeMsg/2,
	sendMsgToNearPlayer/2,
	sendBoxErrorCodeMsg/2,
	sendTipsStringMsg/1,
	sendTipsStringMsg/2,
	sendTipsStringMsg/3,
	sendTipsStringMsg1/2,
	sendTipsStringMsg1/3,
	sendTipsStringMsg1/4,
	getErrorCodeMsg/2
]).

dealNetMsg(Cmd, Pk) ->
	RunStep = playerState:getRunStep(),
	%case Cmd =:= ?CMD_U2GS_MoveTo orelse Cmd =:= ?CMD_U2GS_StopMove of
	%	true ->
	%		skip;
	%	_ ->
	%		?DEBUG_OUT("dealNetMsg[~p] RunStep[~p]",[Cmd,RunStep])
	%end,
	NetPid = playerState:getNetPid(),
	case RunStep of
		?PlayerStateNone ->
			case Cmd of
				?CMD_U2GS_RequestLogin ->
					onMsgNeedLS(Cmd, Pk),
					?LOG_OUT("RequestLogin playerPid[~p] Aid[~p] key[~ts] protocolVer[~p]",
						[self(),
							Pk#pk_U2GS_RequestLogin.accountID,
							Pk#pk_U2GS_RequestLogin.key,
							Pk#pk_U2GS_RequestLogin.protocolVer
						]),
					playerState:setRunStep(?PlayerStateWaitLoadRoleList);
				?CMD_U2GS_ChangeLineLoginRequest ->
					?LOG_OUT("ChangeLineLoginRequest playerPid[~p] Aid[~p] key[~ts] protocolVer[~p]",
						[self(),
							Pk#pk_U2GS_RequestLogin.accountID,
							Pk#pk_U2GS_RequestLogin.key,
							Pk#pk_U2GS_RequestLogin.protocolVer
						]),
					ok;
%%					playerState:setRunStep(?PlayerStateChangeLineAtNewLine),
%%					onMsgNeedLS(Cmd, Pk);
				_ ->
					?ERROR_OUT("client:~p PlayerOtp:~p RoleID:~p Error Cmd:~p @ PlayerStateNone", [NetPid, self(), playerState:getRoleID(), netmsgCmdStr:getNetMsgCmdStr(Cmd)])
			end;

		?PlayerStateChangeLine ->% 换线中，只处理换线确认消息
%%			onMsg(?CMD_U2GS_ChangeLineRequestAck, Pk);
			?ERROR_OUT("CMD_U2GS_ChangeLineRequestAck:~p", [Pk]),
			ok;

		?PlayerStateLoadRoleListOK ->
			case Cmd of
				?CMD_U2GS_RequestCreatePlayer ->
					onMsg(Cmd, Pk);
				?CMD_U2GS_RequestDeletePlayer ->
					onMsg(Cmd, Pk);
				?CMD_U2GS_NoticeRequest ->
					onMsg(Cmd, Pk);
				?CMD_U2GS_ChangeName ->
					onMsg(Cmd, Pk);
				?CMD_U2GS_SelPlayerEnterGame ->
					playerState:setRunStep(?PlayerStateLoadRole),
					onMsg(Cmd, Pk);
				_ ->
					?ERROR_OUT("client:~p PlayerOtp:~p RoleID:~p Error Cmd:~p @ PlayerStateLoadRoleListOK", [NetPid, self(), playerState:getRoleID(), netmsgCmdStr:getNetMsgCmdStr(Cmd)])
			end;
		?PlayerStateLoadRole ->
			case Cmd of
				?CMD_U2GS_EnteredMap ->
					onMsg(Cmd, Pk);
				_ ->
					?ERROR_OUT("client:~p PlayerOtp:~p RoleID:~p Error Cmd:~p @ PlayerStateLoadRole", [NetPid, self(), playerState:getRoleID(), netmsgCmdStr:getNetMsgCmdStr(Cmd)])
			end;
		?PlayerStateLoadRoleOK ->
			case Cmd of
				?CMD_U2GS_EnteredMap ->
					onMsg(Cmd, Pk);
				?CMD_U2GS_NoticeRequest ->
					onMsg(Cmd, Pk);
				?CMD_Any_UpdateVariant ->
					onMsg(Cmd, Pk);
				_ ->
%% 					?ERROR_OUT("client:~p PlayerOtp:~p RoleID:~p Error Cmd:~p @ PlayerStateLoadRoleOK msg:~p",[NetPid,self(),playerState:getRoleID(),netmsgCmdStr:getNetMsgCmdStr(Cmd),Pk])
					%%因为跨服，所以屏了这个状态的异常消息LOG
					skip
			end;
		?PlayerStateRun ->
			onMsg(Cmd, Pk);
		_ ->
			?ERROR_OUT("client:~p PlayerOtp:~p RoleID:~p Error Cmd:~p @ status[~p]", [NetPid, self(), playerState:getRoleID(), netmsgCmdStr:getNetMsgCmdStr(Cmd), RunStep])
	end,
	ok.

%%发送网络消息
-spec sendNetMsg(Msg) -> ok when
	Msg :: tuple().
sendNetMsg(Msg) ->
	NetPid = playerState:getNetPid(),
	sendNetMsg(NetPid, Msg),
	ok.

-spec sendNetMsg(NetPid, Msg) -> ok when
	NetPid :: pid(),
	Msg :: tuple().
sendNetMsg(NetPid, Msg) ->
	gsSendMsg:sendNetMsg(NetPid, Msg),
	ok.

%%发送错误消息
-spec sendErrorCodeMsg(ErrorCode) -> ok when
	ErrorCode :: uint().
sendErrorCodeMsg(ErrorCode) when ErrorCode > 0 andalso erlang:is_integer(ErrorCode) ->
	sendErrorCodeMsg(ErrorCode, []).

%%发送错误消息
sendErrorCodeMsg(undefined, _ErrorCode) ->
	ok;
sendErrorCodeMsg(NetPid, ErrorCode) when erlang:is_integer(ErrorCode) andalso ErrorCode > 0 andalso erlang:is_pid(NetPid) ->
	sendErrorCodeMsg(NetPid, ErrorCode, []);
sendErrorCodeMsg(ErrorCode, Params) when erlang:is_list(Params) ->
	case getErrorCodeMsg(ErrorCode, Params) of
		#pk_GS2U_Error{} = ErrorMsg ->
			sendNetMsg(ErrorMsg);
		_Error ->
			ok
	end.

-spec sendErrorCodeMsg(NetPid :: pid(), ErrorCode :: uint(), Params :: list()) -> ok.
sendErrorCodeMsg(NetPid, ErrorCode, Params) ->
	case getErrorCodeMsg(ErrorCode, Params) of
		#pk_GS2U_Error{} = ErrorMsg ->
			sendNetMsg(NetPid, ErrorMsg);
		_Error ->
			ok
	end.

%%发送Tips错误消息
-spec sendTipsErrorCodeMsg(ErrorCode) -> ok when
	ErrorCode :: uint().
sendTipsErrorCodeMsg(ErrorCode) when ErrorCode > 0 andalso erlang:is_integer(ErrorCode) ->
	sendErrorCodeMsg(ErrorCode).

%%发送Tips错误消息
-spec sendTipsErrorCodeMsg(ErrorCode :: uint(), Params :: list()) -> ok.
sendTipsErrorCodeMsg(ErrorCode, Params) ->
	sendErrorCodeMsg(ErrorCode, Params).

%% 在GS中换线或登录时，如果有失败性错误，就给手机发该消息
sendBoxErrorCodeMsg(ErrorCode, ErrorTips) when erlang:is_integer(ErrorCode) ->
	sendNetMsg(#pk_GS2U_MsgBoxTips{code = ErrorCode, msg = ErrorTips}).
%% 给当前玩家的网络进程发送字符串提示消息
-spec sendTipsStringMsg(Content :: string) -> ok.
sendTipsStringMsg(Content) ->
	sendTipsStringMsg(?TipsTypeTips, Content, []),
	ok.
-spec sendTipsStringMsg(Type :: uint8(), Content :: string) -> ok.
sendTipsStringMsg(Type, Content) ->
	sendTipsStringMsg(Type, Content, []),
	ok.
-spec sendTipsStringMsg(Type :: uint8(), Content :: string, Params :: list()) -> ok.
sendTipsStringMsg(Type, Content, Params) ->
	Msg = #pk_GS2U_TipsString{type = Type, tips = Content, params = Params},
	sendNetMsg(Msg),
	ok.
%% 给任意网络进程发送字符串提示消息
-spec sendTipsStringMsg1(NetPid :: pid(), Content :: string) -> ok.
sendTipsStringMsg1(NetPid, Content) ->
	sendTipsStringMsg1(NetPid, ?TipsTypeTips, Content, []),
	ok.
-spec sendTipsStringMsg1(NetPid :: pid(), Type :: uint8(), Content :: string) -> ok.
sendTipsStringMsg1(NetPid, Type, Content) ->
	sendTipsStringMsg1(NetPid, Type, Content, []),
	ok.
-spec sendTipsStringMsg1(NetPid :: pid(), Type :: uint8(), Content :: string, Params :: list()) -> ok.
sendTipsStringMsg1(NetPid, Type, Content, Params) ->
	Msg = #pk_GS2U_TipsString{type = Type, tips = Content, params = Params},
	sendNetMsg(NetPid, Msg),
	ok.
%%发送消息给附近玩家
-spec sendMsgToNearPlayer(Msg, IsIncludeSelf) -> ok when
	Msg :: tuple(), IsIncludeSelf :: boolean().
sendMsgToNearPlayer(Msg, IsIncludeSelf) ->
	PlayerEts = playerState:getMapPlayerEts(),
	PlayerCode = playerState:getPlayerCode(),
	case IsIncludeSelf of
		true ->
			case playerState:getNetPid() of
				undefined ->
					skip;
				NetPid ->
					mapView:sendMsg2NearPlayer(playerState:getMapPid(), PlayerEts, Msg, PlayerCode, NetPid)
			end;
		_ ->
			mapView:sendMsg2NearPlayer(playerState:getMapPid(), PlayerEts, Msg, PlayerCode, false)
	end,
	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================
onMsgNeedLS(Cmd, #pk_U2GS_RequestLogin{accountID = AccountID, key = Key} = Pk) ->
	case erlang:is_integer(AccountID) andalso AccountID > 0 of
		true ->
			case Cmd of
				?CMD_U2GS_RequestLogin ->
					playerState:setLSCheckKey(Key),%%断线重连时再次验证
					?LOG_OUT("CMD_U2GS_RequestLogin:~p", [{AccountID, Key}]),
					psMgr:sendMsg2PS(?PsNameLS, checkAccountKey, {AccountID, Key});
				_ ->
					?ERROR_OUT("It Should Be A LoginServer MSG ~p :~p", [netmsgCmdStr:getNetMsgCmdStr(Cmd), Pk])
			end;
		_ ->
			?ERROR_OUT("error AccountID[~p] when login", [AccountID])
	end;
onMsgNeedLS(_Cmd, #pk_U2GS_ChangeLineLoginRequest{
	accountID = AccountID,
	roleID = RoleID
}) ->
	?ERROR_OUT("pk_U2GS_ChangeLineLoginRequest:~p,~p", [RoleID, AccountID]),
	ok.

onMsg(?CMD_U2GS_RequestLogin, #pk_U2GS_RequestLogin{accountID = AccountID} = Pk) ->
	AccountID = Pk#pk_U2GS_RequestLogin.accountID,
	playerLogin:onLoadRoleList(AccountID),
	playerState:setAccountID(AccountID),
%% 	TODO ZZC DEPRECATED?
%% 	psMgr:sendMsg2PS(?PsNameMain, accountOnLine, {AccountID}),
	?LOG_OUT("request login, accountID: ~p", [AccountID]),
	ok;
%%充值前，取出玩家是否已经有过双倍活动参与
onMsg(?CMD_U2GS_RequestRechargeHasGiftIDList, #pk_U2GS_RequestRechargeHasGiftIDList{}) ->
	RoleID = playerState:getRoleID(),
	Sql = qlc:q(
		[X || X <- mnesia:table(?EtsRechargeRebateTaken),
			X#recSaveRechargeRebateTaken.roleID =:= RoleID andalso
				(X#recSaveRechargeRebateTaken.rebateIdAndType band 16#ff) =:= ?RechargeRebateFirstDouble]),
	TakenIDList = edb:selectRecord(Sql),

	ConfIDList = edb:readAllRecord(rec_recharge_double_conf),
	Msg = #pk_GS2U_RequestRechargeHasGiftIDListAck{
		takenIDList = [misc:toInteger(RID) || #recSaveRechargeRebateTaken{rebateIdAndType = RID} <- TakenIDList],
		confIDList = [
			#pk_RechargeDoubleConf{payMoney = misc:toFloat(PayMoney), id = RID1} ||
			#rec_recharge_double_conf{rebateID = RID1, funcellPayItemID = PayMoney} <- ConfIDList]
	},
	playerMsg:sendNetMsg(Msg),
	ok;

%%充值角色(钻石)
onMsg(?CMD_U2GS_RequestRecharge, #pk_U2GS_RequestRecharge{
	funcellOrderID = FeOrderID
}) ->
	AID = playerState:getAccountID(),
	RID = playerState:getRoleID(),
	?LOG_OUT("xxxxxxxxxxxxxxxxxxxxxxx废弃xxxxxxxCMD_U2GS_RequestRecharge accountid[~w]role[~w],funcellOrderID[~ts]", [AID, RID, FeOrderID]),
%%
%%	dbLog:sendSaveLogEventID(RID,AID,?RechargeEventOnGettingCilent, time:getUTCNowSec(), FeOrderID),
%%	psMgr:sendMsg2PS(?PsNamePreRecharge, checkCSHas,{self(),Msg} ),
	ok;

%%领取我以前的预充值币
onMsg(?CMD_U2GS_RechargeGettingEvent, #pk_U2GS_RechargeGettingEvent{type = Type, grade = _Grade}) when
	Type =:= 10 ->
	playerRecharge:requestGetMyPreRecharge(),
	ok;

%%7日累充，普通累充礼品领取
onMsg(?CMD_U2GS_RechargeGettingEvent, #pk_U2GS_RechargeGettingEvent{type = Type, grade = Grade}) ->

	playerRecharge:getChargeGift(Type, Grade),
	ok;

%%系统内部购买 （功能型购买）
onMsg(?CMD_U2GS_Buy4System, #pk_U2GS_Buy4System{costID = CostID, number = Number}) ->
	playerBuy4System:buy4System(CostID, Number),
	ok;

%%月卡 礼品领取
onMsg(?CMD_U2GS_MonthCardGettingEvent, #pk_U2GS_MonthCardGettingEvent{type = _Type}) ->

	playerMonthCard:getGiftMsg(),
	ok;

%%申请进入活动
onMsg(?CMD_U2GS_RequestInActivity, #pk_U2GS_RequestInActivity{activityID = AID, mapID = _MapID}) ->
	?DEBUG_OUT("=======requestInKingMap=============AID=~p~n", [AID]),
	case AID of
		?ActivityType_KingBattleAll ->
			?DEBUG_OUT("=======requestInKingMap============="),
			playerAcKingBattleAll:requestInKingMap();
		_ ->
			skip
	end,
	ok;

%%申请进入活动(取王者战天下名额)
onMsg(?CMD_U2GS_AttackDefenderQuotaNumber, #pk_U2GS_AttackDefenderQuotaNumber{activityID = AID, mapID = MapID} = P) ->
	?DEBUG_OUT("----CMD_U2GS_AttackDefenderQuotaNumber--~p", [P]),
	case AID of
		?ActivityType_KingBattleAll ->
			playerAcKingBattleAll:requestQuotaNumber(AID, MapID);
		_ ->
			skip
	end,
	ok;

%%王者战天下 购买镜像buff
onMsg(?CMD_U2GS_KingBattleBuyMirrorBuff, #pk_U2GS_KingBattleBuyMirrorBuff{}) ->
	playerAcKingBattleAll:defender_buy_mirror_buff();
%%王者战天下 一键购买镜像buff
onMsg(?CMD_U2GS_KingBattleBuyMirrorBuffOneKey, #pk_U2GS_KingBattleBuyMirrorBuffOneKey{}) ->
	playerAcKingBattleAll:defender_buy_mirror_buff_one_key();
%%王者战天下 购买进攻方buff
onMsg(?CMD_U2GS_KingBattleBuyAttackerBuff, #pk_U2GS_KingBattleBuyAttackerBuff{}) ->
	playerAcKingBattleAll:attacker_buy_buff(),
	ok;
%%王者战天下 一键购买进攻方buff
onMsg(?CMD_U2GS_KingBattleBuyAttackerBuffOneKey, #pk_U2GS_KingBattleBuyAttackerBuffOneKey{}) ->
	playerAcKingBattleAll:attacker_buy_buff_one_key(),
	ok;

%%王者战天下 一键购买守护者buff
onMsg(?CMD_U2GS_KingBattleBuyDeffenderBuff, #pk_U2GS_KingBattleBuyDeffenderBuff{}) ->
	playerAcKingBattleAll:defender_buy_buff(),
	ok;
%%王者战天下 一键购买守护者buff
onMsg(?CMD_U2GS_KingBattleBuyDeffenderBuffOneKey, #pk_U2GS_KingBattleBuyDeffenderBuffOneKey{}) ->
	playerAcKingBattleAll:defender_buy_buff_one_key(),
	ok;
%% //王者战天下 修复镜像
onMsg(?CMD_U2GS_KingBattleRepairMirror, #pk_U2GS_KingBattleRepairMirror{}) ->
	playerAcKingBattleAll:repair_mirror();


%% //王者战天下 防守方获取自己的信息
onMsg(?CMD_U2GS_KingBattleGetBuffInfo, #pk_U2GS_KingBattleGetBuffInfo{}) ->
	playerAcKingBattleAll:flashBuffInfo();

%%///////////////////////////////////////////////////////////////////////////////////////
%%红包(发红包
onMsg(?CMD_U2GS_SendRedEnvelope, #pk_U2GS_SendRedEnvelope{
	type = Type,
	targetType = TargetType,
	targetUID = TargetUID,
	allNumber = AllNumber,
	allMoney = AllMoney,
	luckContent = LuckContent
}) ->
	playerRedEnvelope:sendRedEnvelope(Type, TargetType, TargetUID, AllNumber, AllMoney, LuckContent),
	ok;

%%红包(抢红包
onMsg(?CMD_U2GS_RobRedEnvelope, #pk_U2GS_RobRedEnvelope{redUID = RedUID}) ->
	playerRedEnvelope:robRedEnvelope(RedUID),
	ok;

%%红包(与我相关的红包日志
onMsg(?CMD_U2GS_RedEnvelopeHistory, #pk_U2GS_RedEnvelopeHistory{}) ->
	playerRedEnvelope:redEnvelopeHistory(),
	ok;

%%红包(取出指定红包信息
onMsg(?CMD_U2GS_RedEnvelopeInfo, #pk_U2GS_RedEnvelopeInfo{redUID = RedUID}) ->
	playerRedEnvelope:redEnvelopeInfo(RedUID),
	ok;

%%查询可用红包
onMsg(?CMD_U2GS_RedEnvelopeQuery, #pk_U2GS_RedEnvelopeQuery{targetType = TargetType}) ->
	playerRedEnvelope:redEnvelopeQuery(TargetType),
	ok;
%%玩家放弃抢本轮红包
onMsg(?CMD_U2GS_GiveUpRedEnvelope, #pk_U2GS_GiveUpRedEnvelope{}) ->
	playerPropSync:setInt(?PriProp_WorldRedEnvelope, 0),
	ok;
%%///////////////////////////////////////////////////////////////////////////////////////
%%取王者雕像的数据
onMsg(?CMD_U2GS_RequestMarrorInfo, #pk_U2GS_RequestMarrorInfo{}) ->
	playerAcKingBattleAll:flashMirrorInfo(),
	ok;

%%取王者雕像的点赞
onMsg(?CMD_U2GS_GiveMarrorFlower, #pk_U2GS_GiveMarrorFlower{}) ->
	playerAcKingBattleAll:giveMarrorFlower(),
	ok;


%%接收client的事件日志记录（充值各环节）
onMsg(?CMD_U2GS_RecClientEvent, #pk_U2GS_RecClientEvent{
	eventID = EventID,
	eventTime = EventTime,
	eventArgs = EventArgs}) ->
	dbLog:sendSaveLogEventID(playerState:getRoleID(), playerState:getAccountID(), EventID, EventTime, EventArgs),
	ok;

%%创建角色
onMsg(?CMD_U2GS_RequestCreatePlayer, #pk_U2GS_RequestCreatePlayer{name = Name} = Pk) ->
	RealName = string:strip(Name),
	?LOG_OUT("accountID[~p] Code[~p] try to create role[~ts]",
		[playerState:getAccountID(), playerState:getPlayerCode(), RealName]),
	playerLogin:onCreateRole(Pk#pk_U2GS_RequestCreatePlayer{name = RealName}),
	ok;

%%进入游戏
onMsg(?CMD_U2GS_SelPlayerEnterGame, #pk_U2GS_SelPlayerEnterGame{} = Pk) ->
%%     ?LOG_OUT("player accountID[~p] code[~p] start enter game, roleID: ~p",
%% 	    [playerState:getAccountID(),playerState:getPlayerCode(),Pk#pk_U2GS_SelPlayerEnterGame.roleID]),
	RoleID = Pk#pk_U2GS_SelPlayerEnterGame.roleID,
	RoleList = playerState:getRoleList(),
	case lists:keymember(RoleID, #recRoleListInfo.roleID, RoleList) of
		true ->
			playerLogin:onLoadRoleData(Pk);
		_ ->
			skip
	end;

%%删除角色
onMsg(?CMD_U2GS_RequestDeletePlayer, #pk_U2GS_RequestDeletePlayer{} = Pk) ->
	RoleID = Pk#pk_U2GS_RequestDeletePlayer.roleID,
	?LOG_OUT("player accountID[~p] code[~p] delete roleID: ~p",
		[playerState:getAccountID(), playerState:getPlayerCode(), RoleID]),
	RoleList = playerState:getRoleList(),
	case lists:keymember(RoleID, #recRoleListInfo.roleID, RoleList) of
		true ->
			playerLogin:onDeleteRole(RoleID);
		_ ->
			skip
	end,
	ok;

%%客户端装载地图完成,发送玩家数据过去
onMsg(?CMD_U2GS_EnteredMap, #pk_U2GS_EnteredMap{}) ->
	playerMap:playerRealEnterMap(),
	ok;

%% 玩家剧情播放结束
onMsg(?CMD_U2GS_PlotDialogueEnd, #pk_U2GS_PlotDialogueEnd{}) ->
	GroupID = playerState:getGroupID(),
	%%?DEBUG_OUT("U2GS_PlotDialogueEnd:~p,~p", [playerState:getRoleID(),GroupID]),
	case GroupID > 0 of
		true ->
			%% fixme 这里特殊处理分组中的情况，剧情播放结束，移除给玩家添加的虚化以及禁止操作的buff，开始其它正常流程
			playerBuff:delBuff(?OUTOFCONTROL),
			playerBuff:delBuff(?PLAYERBLUR),

			MapPid = playerState:getMapPid(),
			Code = playerState:getPlayerCode(),
			psMgr:sendMsg2PS(MapPid, playerEntermap, {Code, GroupID});
		_ ->
			skip
	end,
	ok;

%%冲刺到某点
onMsg(?CMD_U2GS_DashTo, #pk_U2GS_DashTo{posX = X, posY = Y}) ->
	playerSkill:onUseDashSkill(X, Y),
	ok;

onMsg(?CMD_U2GS_ChangeWingLevel, #pk_U2GS_ChangeWingLevel{level = NewWingLevel}) ->
	playerWing:changeWingLevel(NewWingLevel),
	ok;

%%设置时装可视的公共属性
onMsg(?CMD_U2GS_IsDisplayFashion, #pk_U2GS_IsDisplayFashion{flag = Value}) ->
	playerPropSync:setInt(?PubProp_FashionVisibleFlag, Value),
	ok;

%删除buff
onMsg(?CMD_U2GS_DelBuff, #pk_U2GS_DelBuff{code = Code, buffID = BuffID}) ->
	ObjectType = codeMgr:getObjectTypeByCode(Code),
	if
		ObjectType =:= ?ObjTypePlayer ->
			SearchEts = playerState:getMapPlayerEts();
%% 		ObjectType =:= ?ObjTypeMonster ->
%% 			SearchEts = playerState:getMapMonsterEts();
%% 		ObjectType =:= ?ObjTypePet ->
%% 			SearchEts = playerState:getMapPetEts();
		true ->
			SearchEts = undefined
	end,
	if
		SearchEts =/= undefined ->
			case ets:lookup(SearchEts, Code) of
				[#recMapObject{}] ->
					playerBuff:delBuff(BuffID);
				%%psMgr:sendMsg2PS(Pid, delBuff, {Code, BuffID});
				_ ->
					skip
			end;
		true ->
			skip
	end,
	ok;

%移动到某点
onMsg(?CMD_U2GS_MoveTo, #pk_U2GS_MoveTo{code = Code, posX = X, posY = Y} = Pk) ->
	case codeMgr:isCodeType(?CodeTypePet, Code) andalso playerState:getActionStatus() =/= ?CreatureActionStatusChangeMap of
		true ->
			case lists:member(Code, playerState:getCallPetCodeList()) of
				true ->
					case playerPet:getPetMountStatus(Code) of
						?CreatrueActionStatusStealth ->
							skip;
						?CreatureActionStatusDead ->
							skip;
						_ ->
							monsterInterface:moveTo(Code, X, Y)
					end;
				_ ->
					skip
			end;
		_ ->
			playerMove:onPlayerMoveTo(Pk)
	end,
	ok;

%%停止移动
onMsg(?CMD_U2GS_StopMove, #pk_U2GS_StopMove{code = Code, posX = X, posY = Y}) ->
	case codeMgr:isCodeType(?CodeTypePet, Code) of
		true ->
			case lists:member(Code, playerState:getCallPetCodeList()) of
				true ->
					case playerPet:getPetMountStatus(Code) of
						?CreatrueActionStatusStealth ->
							skip;
						?CreatureActionStatusDead ->
							skip;
						_ ->
							monsterInterface:stopMove(Code, X, Y)
					end;
				_ ->
					skip
			end;
		_ ->
			%%如果客户端正在切换地图，则不能处理StopMove消息，不能相信它
			case playerState:getActionStatus() =/= ?CreatureActionStatusChangeMap of
				true ->
					playerMove:clientStopMove(X, Y);
				_ ->
					skip
			end
	end,
	ok;

%% 请求详细信息
onMsg(?CMD_U2GS_RequestObjInfo, #pk_U2GS_RequestObjInfo{obj_type = _Type, codes = _Codes}) ->
	ok;

%%使用技能
onMsg(?CMD_C2S_PlayerUseSkill, #pk_C2S_PlayerUseSkill{code = Code, skillId = SkillID, serial = SN, targetCodeList = TargetCodeList}) ->
	case codeMgr:isCodeType(?CodeTypePet, Code) of
		true ->
			case lists:member(Code, playerState:getCallPetCodeList()) of
				true ->
					monsterInterface:useSkill(Code, SkillID, TargetCodeList, SN);
				_ ->
					skip
			end;
		_ ->
			{X, Y} = playerState:getPos(),
			playerSkill:onUseSkill(SkillID, TargetCodeList, SN, X, Y)
	end,
	ok;

%%使用带位移技能
onMsg(?CMD_C2S_PlayerUseShiftSkill, #pk_C2S_PlayerUseShiftSkill{skillId = SkillID, serial = SN, targetCodeList = TargetCodeList, x = X, y = Y}) ->
	playerSkill:onUseSkill(SkillID, TargetCodeList, SN, X, Y),
	ok;

%%请求npc对话
onMsg(?CMD_U2GS_TalkToNpc, #pk_U2GS_TalkToNpc{} = Pk) ->
	playerTask:requestTalkToNpc(Pk#pk_U2GS_TalkToNpc.code),
	%%?DEBUG_OUT("request npc talk, npcActorID: ~p", [Pk#pk_U2GS_TalkToNpc.code]),
	ok;

%%请求npc对话
onMsg(?CMD_U2GS_RequestGoddessCode, #pk_U2GS_RequestGoddessCode{} = _Pk) ->
	MapPid = playerState:getMapPid(),
	NetPid = playerState:getNetPid(),
	psMgr:sendMsg2PS(MapPid, requestGoddessCode, NetPid),
	ok;

%%请求接取环任务
onMsg(?CMD_U2GS_RequestAcceptLoopTask, #pk_U2GS_RequestAcceptLoopTask{} = _Pk) ->
	playerLoopTask:accept(),
	ok;

%%请求一键完成任务
onMsg(?CMD_U2GS_RequestCompleteLoopTaskByOneKey, #pk_U2GS_RequestCompleteLoopTaskByOneKey{} = _Pk) ->
	playerLoopTask:oneKeyCompleteAll(),
	ok;

%%请求单次完成任务
onMsg(?CMD_U2GS_RequestCompleteOneLoopTaskByOneKey, #pk_U2GS_RequestCompleteOneLoopTaskByOneKey{} = _Pk) ->
	playerLoopTask:oneKeyCompleteOne(),
	ok;

% 20160830
% 改为自动发放奖励
%%%请求领取环任务奖励
%onMsg(?CMD_U2GS_RequestGetLoopTaskReward, #pk_U2GS_RequestGetLoopTaskReward{} = _Pk) ->
%    playerLoopTask:getLoopTaskReward(),
%    ok;


%%请求接取任务
onMsg(?CMD_U2GS_RequestAcceptTask, #pk_U2GS_RequestAcceptTask{} = Pk) ->
	TaskID = Pk#pk_U2GS_RequestAcceptTask.taskID,
	Code = Pk#pk_U2GS_RequestAcceptTask.code,
	case getCfg:getCfgByKey(cfg_task_new, TaskID) of
		#task_newCfg{tasktype = ?TaskMainType_Marriage} ->
			skip; %% 不能使用该接口接受情缘任务
		_ ->
			playerTask:acceptTask(TaskID, Code)
	end,
	%%?DEBUG_OUT("request accept task, roleID: ~p, code: ~p, taskID: ~p", [RoleID, Code, TaskID]),
	ok;

%%请求放弃任务
onMsg(?CMD_U2GS_DropTask, #pk_U2GS_DropTask{} = Pk) ->
	TaskID = Pk#pk_U2GS_DropTask.taskID,
	playerTask:cancelTask(TaskID),
	ok;

%%提交任务
onMsg(?CMD_U2GS_SumbitTask, #pk_U2GS_SumbitTask{} = Pk) ->
	TaskID = Pk#pk_U2GS_SumbitTask.taskID,
	Code = Pk#pk_U2GS_SumbitTask.code,
%%	case getCfg:getCfgByKey(cfg_task_new, TaskID) of
%%		#task_newCfg{tasktype = ?TaskMainType_Marriage, target_type = ?TaskType_Talk} ->
%%			playerMarriage:submitTask();  %% 直接提交对话任务
%%		#task_newCfg{tasktype = ?TaskMainType_Marriage} ->
%%			skip; %% 不能使用该接口提交情缘任务
%%		_ ->
	playerTask:submitTask(TaskID, Code),
%%	end,
	%%?DEBUG_OUT("request submit task, roleID: ~p, taskID: ~p, code: ~p", [RoleID, TaskID, Code]),
	ok;

%%重置任务
onMsg(?CMD_U2GS_ResetTask, #pk_U2GS_ResetTask{taskID = TaskID}) ->
	playerTask:resetTask(TaskID),
	ok;

%%请求通过NPC进入活动地图
onMsg(?CMD_U2GS_EnterActiveMap, #pk_U2GS_EnterActiveMap{npcCode = NpcCode, activeID = ActiveID}) ->
	playerNpc:enterActiveMap(ActiveID, NpcCode),
	ok;

%%请求活动地图的活动榜单
onMsg(?CMD_U2GS_RequestActivityMapRank, #pk_U2GS_RequestActivityMapRank{type = ?ActivityType_KingBattleAll}) ->
	core:sendMsgToActivity(?ActivityType_KingBattleAll,
		requestKingBattleDamageRank,
		{
			playerState:getRoleID()
		}),
	ok;

%%取出充值、消费活动配置
onMsg(?CMD_U2GS_RequestOPActivityConfList, #pk_U2GS_RequestOPActivityConfList{type = Type})
	when Type == ?OperateActType_DiamonCharge orelse Type == ?OperateActType_DiamonUse ->
	playerACChargeOrUse:getChargeOrUseList(Type),
	ok;

%%领取充值、消费活动奖励
onMsg(?CMD_U2GS_GetChargeOrUseGift, #pk_U2GS_GetChargeOrUseGift{type = Type, ruleID = RuleID}) ->
	playerACChargeOrUse:getChargeOrUseGift(Type, RuleID),
	ok;

%地图切换
onMsg(?CMD_C2S_ChangeMap, #pk_C2S_ChangeMap{mapId = NewMapId, waypointName = WaypointName}) ->
	case core:isCross() of
		false ->
			%% 如果当前在副本或者位面中，不允许切换地图
			MapID = playerState:getMapIDGroup(),
			{MapType, SubType} =
				case getCfg:getCfgPStack(cfg_mapsetting, NewMapId) of
					#mapsettingCfg{type = Type, subtype = SType} ->
						{Type, SType};
					_ ->
						{999, 999}
				end,
			?DEBUG_OUT("onMsg(?CMD_C2S_ChangeMap from ~w to ~w", [MapID, NewMapId]),
			case playerScene:getMapType(MapID) of
				?MapTypeNormal ->
					if
						MapType =:= ?MapTypeNormal ->
							playerScene:onRequestEnterMap(NewMapId, WaypointName);
						MapType =:= ?MapTypeActivity andalso SubType =:= ?MapSubTypeDarknessReady ->
							playerDarkness:requestEnterDarknessPrepareMap(NewMapId);
						MapType =:= ?MapTypeActivity andalso SubType =:= ?MapSubTypeGuildExpedition ->
							playerGuildExpedition:requestEnterMap(NewMapId, WaypointName);
						true ->
							playerScene:onRequestEnterMap(NewMapId, WaypointName)
					end;
				?MapTypeActivity ->
					if
						MapType =:= ?MapTypeNormal ->
							playerScene:onRequestEnterMap(NewMapId, WaypointName);
						MapType =:= ?MapTypeActivity andalso SubType =:= ?MapSubTypeGuildExpedition ->
							playerGuildExpedition:requestEnterMap(NewMapId, WaypointName);
					%MapType =:= ?MapTypeActivity andalso SubType =:= ?MapSubTypeWeddingSite ->
					%	playerMsg:sendErrorCodeMsg(?ErrorCode_Marriage_WS_FromInvalidMap);
						true ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
			end;
		_ ->
			?ERROR_OUT("CMD_C2S_ChangeMap:~p,~p", [playerState:getRoleID(), NewMapId]),
			sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
	end,
	ok;

% 循环刷本
onMsg(?CMD_U2GS_GoonCopyMap, #pk_U2GS_GoonCopyMap{mapID = TMapID}) ->
	?DEBUG_OUT("CMD_U2GS_GoonCopyMap"),
	case playerCopyMap:canEnterCopyMap(TMapID) of
		true ->
			playerCopyMap:goonCopyMap(TMapID);
		ErrorCode ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok;

%%地图传送
onMsg(?CMD_U2GS_TransferMap, #pk_U2GS_TransferMap{mapId = NewMapId, waypointName = WaypointName}) ->
	case core:isCross() of
		false ->
			MapID = playerState:getMapIDGroup(),
			{MapType, SubType} =
				case getCfg:getCfgPStack(cfg_mapsetting, NewMapId) of
					#mapsettingCfg{type = Type, subtype = SType} ->
						{Type, SType};
					_ ->
						{999, 999}
				end,

			case playerScene:getMapType(MapID) of
				?MapTypeNormal ->
					if
						MapType =:= ?MapTypeNormal ->
							case playerScene:canTransferMapAndSetNewTransferInfo() of
								true -> playerScene:onRequestEnterMap(NewMapId, WaypointName);
								_ -> playerMsg:sendErrorCodeMsg(?ErrorCode_SystemTransferMapCD)
							end;
						MapType =:= ?MapTypeActivity andalso SubType =:= ?MapSubTypeGuildExpedition ->
							playerGuildExpedition:requestEnterMap(NewMapId, WaypointName);
						true ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
					end;
				?MapTypeActivity ->
					if
						MapType =:= ?MapTypeNormal ->
							case playerScene:canTransferMapAndSetNewTransferInfo() of
								true -> playerScene:onRequestEnterMap(NewMapId, WaypointName);
								_ -> playerMsg:sendErrorCodeMsg(?ErrorCode_SystemTransferMapCD)
							end;
						MapType =:= ?MapTypeActivity andalso SubType =:= ?MapSubTypeGuildExpedition ->
							playerGuildExpedition:requestEnterMap(NewMapId, WaypointName);
						true ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
			end;
		_ ->
			?ERROR_OUT("CMD_U2GS_TransferMap:~p,~p", [playerState:getRoleID(), NewMapId]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
	end,
	ok;

%%挖宝地图传送
onMsg(?CMD_U2GS_DigTransferMap, #pk_U2GS_DigTransferMap{mapId = NowMapId, waypointName = WaypointName}) ->
	case core:isCross() of
		false ->
			MapID = playerState:getMapIDGroup(),
			case playerScene:getMapType(MapID) of
				?MapTypeNormal ->
					playerScene:onRequestEnterMap(NowMapId, WaypointName);
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
			end;
		_ ->
			?ERROR_OUT("CMD_U2GS_DigTransferMap:~p,~p", [playerState:getRoleID(), NowMapId]),
			sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
	end,
	ok;

%% 获取好友坐标
onMsg(?CMD_U2GS_getFriendPos, #pk_U2GS_getFriendPos{friendID = FriendID}) ->
	ActStatus = playerState:getActionStatus(),
	case ActStatus =:= ?CreatureActionStatusDead orelse playerState:isPlayerBattleStatus() of
		true -> %%战斗和死亡状态不让传送
			playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailedPlayerDeadOrBattle);
		_ ->
			case ActStatus =/= ?CreatureActionStatusChangeMap of
				true ->
					playerMap:tryGetFriendPos(FriendID);
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
			end
	end,
	ok;

%%坐标传送
onMsg(?CMD_U2GS_Transfer2NewPos, #pk_U2GS_Transfer2NewPos{mapID = MapID, x = PosX, y = PosY} = _PK) ->
	case core:isCross() of
		false ->
			ActStatus = playerState:getActionStatus(),
			case ActStatus =:= ?CreatureActionStatusDead orelse playerState:isPlayerBattleStatus() of
				true ->  %%战斗和死亡状态不让传送
					playerMsg:sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailedPlayerDeadOrBattle);
				_ ->
					case playerScene:canTransferMapAndSetNewTransferInfo() of
						true ->
							playerMap:transfer2NewPos(MapID, PosX, PosY);
						false ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_SystemTransferMapCD)
					end
			end;
		_ ->
			?ERROR_OUT("CMD_U2GS_Transfer2NewPos:~p,~p", [playerState:getRoleID(), MapID]),
			sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
	end,
	ok;

%%聊天
onMsg(?CMD_U2GS_ChatInfo, #pk_U2GS_ChatInfo{} = P) ->
	playerChat:onPlayerChatMsg(P),
	ok;

%% 请求npc商店商品列表
onMsg(?CMD_U2GS_LookInfoItemListAtNpcStore, #pk_U2GS_LookInfoItemListAtNpcStore{npccode = NpcCode}) ->
	R = playerShop:getItemList(NpcCode),
	?DEBUG_OUT("R===============~p~n", [R]),
	ok;

%% 请求指定商店商品列表
onMsg(?CMD_U2GS_LookInfoItemListAtShopID, #pk_U2GS_LookInfoItemListAtShopID{shopID = ShopID}) ->
	R = playerShop:sendStoreToClient(ShopID),
	?DEBUG_OUT("R===============~p~n", [R]),
	ok;

%% 购买npc商店商品
onMsg(?CMD_U2GS_BuyItemAtNpcStoreRequest, #pk_U2GS_BuyItemAtNpcStoreRequest{npccode = NpcCode, itemid = ItemID, number = Number}) ->
	playerShop:buyItem(NpcCode, ItemID, Number),
	ok;

%% 购买指定商店商品
onMsg(?CMD_U2GS_BuyItemAtShopIDRequest, #pk_U2GS_BuyItemAtShopIDRequest{shopID = ShopID, itemid = ItemID, number = Number}) ->
	playerShop:buyItemWithShopID(ShopID, ItemID, Number),
	ok;

%% 购买军团商品
onMsg(?CMD_U2GS_BuyItemAtGuildShopRequest, #pk_U2GS_BuyItemAtGuildShopRequest{itemid = ItemID, number = Number}) ->
	playerShop:buyGuildItem(ItemID, Number),
	ok;

%% 便捷购买道具
onMsg(?CMD_U2GS_ConvenientBuyItem, #pk_U2GS_ConvenientBuyItem{itemid = ItemID, buynumber = Number}) ->
	playerShop:buyConvenientItem(ItemID, Number),
	ok;

%% 请求神秘商店商品列表
onMsg(?CMD_U2GS_RequestMysteriousShop, #pk_U2GS_RequestMysteriousShop{}) ->
	playerMSShop:requestMysteriousShop(),
	ok;

%% 请求购买神秘商店商品
onMsg(?CMD_U2GS_BuyMysteriousShopItem, #pk_U2GS_BuyMysteriousShopItem{} = Pk) ->
	playerMSShop:buyMysteriousShopItem(Pk),
	ok;

%% 请求刷新神秘商店
onMsg(?CMD_U2GS_FreshMSShop, #pk_U2GS_FreshMSShop{} = _Pk) ->
	playerMSShop:freshMSShop(),
	ok;

%% 技能槽技能改变
onMsg(?CMD_U2GS_ChangeSkillSlotRequest, #pk_U2GS_ChangeSkillSlotRequest{changeType = Type,
	changeSkillInfo = SkillInfo} = _Data) ->
%%	?WARN_OUT("CMD_U2GS_ChangeSkillSlotRequest roleid:~p msg:~p",[playerState:getRoleID(),Data]),
	playerSkillLearn:operateSlot(Type, SkillInfo),
	ok;

%%改变限时称号装备
onMsg(?CMD_U2GS_ChangeLimiteTitleState, #pk_U2GS_ChangeLimiteTitleState{titleID = TitleID} = _Pk) ->
	playerTitle:changeLimittimeTitle(TitleID),
	ok;

%%改变称号或效果的装配状态
onMsg(?CMD_U2GS_ChangeTitleState, #pk_U2GS_ChangeTitleState{} = Pk) ->
	playerTitle:changeFitState(Pk),
	ok;
%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
onMsg(?CMD_U2GS_TeamOp, #pk_U2GS_TeamOp{operateType = Type, operatedID = ID, param1 = P1}) ->
	playerTeam:teamOperate(Type, ID, P1),
	ok;
onMsg(?CMD_U2GS_AckInviteJoinTeam, #pk_U2GS_AckInviteJoinTeam{inviterPlayerID = InviteID, isAgree = Ack}) ->
	playerTeam:ackInviteMeJoin(InviteID,Ack),
	ok;
onMsg(?CMD_U2GS_QuickTeamMatch, #pk_U2GS_QuickTeamMatch{mapList = MapList}) ->
	playerTeam:matchTeam(MapList),
	ok;
onMsg(?CMD_U2GS_QueryTeamList, #pk_U2GS_QueryTeamList{mapIDList = MapList}) ->
	playerTeam:queryTeamList(MapList),
	ok;
onMsg(?CMD_U2GS_QueryRoleList, #pk_U2GS_QueryRoleList{queryType = Type}) ->
	playerTeam:queryRole(Type),
	ok;
%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
%% 队伍操作
%%onMsg(?CMD_U2GS_OperateTeam, #pk_U2GS_OperateTeam{teamType = TeamType, operateType = OperateType, operatedID = OperatedID}) ->
%%	playerTeam2:handleTeamRequest(TeamType, OperateType, OperatedID),
%%	ok;
%%
%%%% 队伍邀请回复
%%onMsg(?CMD_U2GS_AckInviteTeam, #pk_U2GS_AckInviteTeam{teamType = TeamType, isAgree = Agree,
%%	inviteType = InviteType, inviterPlayerID = InviterID}) ->
%%	?DEBUG_OUT("agree ~p, inviteType ~p, inviterPlayerID ~p", [Agree, InviteType, InviterID]),
%%	playerTeam2:handleTeamRequestAck(TeamType, InviteType, Agree, InviterID),
%%	ok;
%%%% 客户端请求队友战斗力
%%onMsg(?CMD_U2GS_RequestFightingCapacity, #pk_U2GS_RequestFightingCapacity{}) ->
%%	playerTeam2:sendFightingCapacity(),
%%	ok;
%%%%
%%onMsg(?CMD_U2GS_IsOpenMapPanel, #pk_U2GS_IsOpenMapPanel{isOpen = IsOpen}) ->
%%	playerState:setIsOpenMapPanel(IsOpen),
%%	ok;
%%%% 队员离队
%%onMsg(?CMD_U2GS_LeaveAwayTeam, #pk_U2GS_LeaveAwayTeam{teamType = TeamType}) ->
%%	?DEBUG_OUT("CMD_U2GS_LeaveAwayTeam ~p", [?CMD_U2GS_LeaveAwayTeam]),
%%	playerTeam2:leaveTeam(TeamType),
%%	ok;
%%%% 发起快速组队
%%onMsg(?CMD_U2GS_QuickTeamStart, #pk_U2GS_QuickTeamStart{mapID = MapID}) ->
%%	playerTeam2:quickTeamStart(MapID),
%%	ok;
%%%%% 快速加队伍
%%onMsg(?CMD_U2GS_QuickJoinTeam, #pk_U2GS_QuickJoinTeam{roleID = RoleID, mapID = MapID}) ->
%%	playerTeam2:quickJoin(RoleID, MapID),
%%	ok;
%%%% 查询附近队伍
%%onMsg(?CMD_U2GS_RequestNearByTeamInfo, #pk_U2GS_RequestNearByTeamInfo{teamType = TeamType}) ->
%%	?DEBUG_OUT("CMD_U2GS_RequestNearByTeamInfo ~p", [?CMD_U2GS_RequestNearByTeamInfo]),
%%	playerTeam2:getNearByTeam(TeamType),
%%	ok;
%%%% 查询附近玩家（用于组队）
%%onMsg(?CMD_U2GS_NearbyPlayer_Request, #pk_U2GS_NearbyPlayer_Request{}) ->
%%	?DEBUG_OUT("CMD_U2GS_NearbyPlayer_Request", []),
%%	playerTeam2:getNearByPlayer(),
%%	ok;
%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
%移动物品处理
onMsg(?CMD_MoveGoods, #pk_MoveGoods{itemUID = ItemUID, target = TargetType, source = SourceType}) ->
	playerPackage:goodsMove(ItemUID, TargetType, SourceType),
	ok;

%%一键出售装备
onMsg(?CMD_U2GS_SellAllEquip, #pk_U2GS_SellAllEquip{}) ->
	playerPackage:sellAllPoorEquip(),
	%%策划设定一键出售装备后整理一次装备背包
	playerPackage:sortBag(?Item_Location_Equip_Bag),
	ok;

%%翅膀升级，本来是走物品使用的，但客户端取uid等困难，所以包装了个入口
onMsg(?CMD_U2GS_WingRise, #pk_U2GS_WingRise{itemID = ItemID, itemNum = ItemNum, firstBind = IsOnlyBindInt}) ->
	OldExp = playerState:getWingExpAccPerItemUse(),
	%%0是混合使用；1是只绑定
	IsOnlyBind = IsOnlyBindInt =:= 1,

	playerPackage:useItemByID(ItemID, ItemNum, IsOnlyBind),
	NewExp = playerState:getWingExpAccPerItemUse(),
	playerMsg:sendNetMsg(#pk_GS2U_WingRise{
		itemID = ItemID,
		expChange = NewExp - OldExp
	}),
	%%重置
	playerState:setWingExpAccPerItemUse(0),
	ok;

%使用背包物品
onMsg(?CMD_U2GS_UseItem, #pk_U2GS_UseItem{itemUID = UID, useNum = Num}) ->
	case erlang:is_integer(Num) andalso Num > 0 of
		true ->
			playerItem:useBagItem(UID, Num, ?ItemUseReasonPlayer, UID);
		_ ->
			skip
	end,
	ok;

%% 背包开启空格子
onMsg(?CMD_OpenNewBagSlot, #pk_OpenNewBagSlot{bagType = BagType, openNum = OpenNum}) ->
	?DEBUG_OUT("open new bag type ~p slot num ~p", [BagType, OpenNum]),
	playerPackage:openSlot(BagType, OpenNum),
	ok;

%% 背包整理
onMsg(?CMD_U2GS_SortItem, #pk_U2GS_SortItem{type = BagType}) ->
	playerPackage:sortBag(BagType),
	ok;

%%采集物品请求
onMsg(?CMD_U2GS_CollectObj, #pk_U2GS_CollectObj{code = Code}) ->
	GatherID = playerTask:getCollectObjectIDByCode(Code),
	case GatherID > 0 of
		true ->
			case getCfg:getCfgPStack(cfg_object, GatherID) of
				#objectCfg{} ->
					playerGather:requestGatherItem(Code, GatherID);
%%					playerGuildHome:updateGuildTask(?GuildTaskType_Collect, GatherID);
%%					IsGatherItem = lists:member(Type, [3, 5, 6, 7, 10, 11, ?GatherType_NeedForSpeed, 15]),
%%					if
%%						IsGatherItem ->
%%							%% 采集物掉落道具
%%							playerGather:requestGatherItem(Code, GatherID);
%%						true ->
%%							%% 任务采集
%%							playerTask2:updateItemCollectTask(Code)
%%					end,
%%					%% 玩家采集了个东西
%%					playerGuildHome:updateGuildTask(?GuildTaskType_Collect, GatherID),
%%					ok;
				_ ->
					skip
			end;
		_Error ->
			skip
	end,
	ok;

%%任务使用物品请求
onMsg(?CMD_U2GS_UseItemObj, #pk_U2GS_UseItemObj{code = Code}) ->
%%	playerTask2:updateUseItemTask(Code),
	playerTask:updateTask(?TaskType_UseItem,Code),
	ok;

%%装备重铸和替换
onMsg(?CMD_U2GS_EquipRecast, #pk_U2GS_EquipRecast{
	equipPos = Pos, recastType = CastType, opType = OpType, locklist = LockList}) ->
	playerEquip:equipRecast(Pos, CastType, OpType, LockList),
	ok;

%%装备精炼
onMsg(?CMD_U2GS_EquipRefine, #pk_U2GS_EquipRefine{type = Type}) ->
	playerEquip:equipRefine(Type),
	ok;

%%装备一键精炼
onMsg(?CMD_U2GS_EquipRefineOneKey, #pk_U2GS_EquipRefineOneKey{}) ->
	playerEquip:equipRefineOneKey(),
	ok;

%%装备冲星
onMsg(?CMD_U2GS_EquipUpStar, #pk_U2GS_EquipUpStar{pos = Pos, type = Type}) ->
	playerEquip:equipStar(Pos, Type),
	ok;

%%装备荣誉成长
onMsg(?CMD_U2GS_HonorLevel, #pk_U2GS_HonorLevel{}) ->
	%%playerEquip:equipHonorLevel(),
	ok;

%%玩家共享装备
onMsg(?CMD_U2GS_SharedEquip, #pk_U2GS_SharedEquip{equipUIDs = EquipUIDs}) ->
	playerEquip:sharedEquip(EquipUIDs),
	ok;

%%共享装备的查看
onMsg(?CMD_U2GS_QueryEquipByUID, #pk_U2GS_QueryEquipByUID{} = Pk) ->
	playerItemTips:queryItemTips(Pk),
	ok;

%%装备分解
onMsg(?CMD_U2GS_EquipResolve, #pk_U2GS_EquipResolve{equipUIDs = EquipUIDList}) ->
	Fun = fun(EquipUID, [PurpleEssenceCfg, GoldenEssenceCfg]) ->
		case playerEquip:equipResolve(EquipUID) of
			[PurpleEssence, GoldenEssence] ->
				[PurpleEssence + PurpleEssenceCfg, GoldenEssence + GoldenEssenceCfg];
			_ ->
				[PurpleEssenceCfg, GoldenEssenceCfg]
		end
		  end,
	[PurpleEssenceNum, GoldenEssenceNum] = lists:foldl(Fun, [0, 0], EquipUIDList),
	case PurpleEssenceNum =/= 0 orelse GoldenEssenceNum =/= 0 of
		true ->
			%%添加装备分解成就统计
			playerAchieve:achieveEvent(?Achieve_BreakDown, [length(EquipUIDList)]),
			playerMsg:sendNetMsg(#pk_GS2U_GetEssenceNum{purpleEssence = PurpleEssenceNum, goldenEssence = GoldenEssenceNum});
		false ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipResolvefailed)  %%分解失败
	end,
	ok;

%%资源兑换列表
onMsg(?CMD_U2GS_RequestExchangeResource, #pk_U2GS_RequestExchangeResource{}) ->
	playerShop:sendAllExchangeResource(),
	ok;

%%请求资源交换中，玩家已经兑换过的终身限兑的配置id
onMsg(?CMD_U2GS_RequestExchangeResourceForeverLimitID, #pk_U2GS_RequestExchangeResourceForeverLimitID{}) ->
	IDList = playerShop:getMyHasForeverLimitID(),
	Msg = #pk_GS2U_RequestExchangeResourceForeverLimitIDAck{iDList = IDList},
	playerMsg:sendNetMsg(Msg),
	ok;

%%请求记录的标志配置id(可复用)
onMsg(?CMD_U2GS_RequesForeverLimitID, #pk_U2GS_RequesForeverLimitID{type = Type}) ->
	IDList = playerShop:getMyHasForeverLimitID(Type),
	Msg = #pk_GS2U_RequestForeverLimitIDAck{type = Type, iDList = IDList},
	playerMsg:sendNetMsg(Msg),
	ok;

%%请求爵位购买配置id项(可复用)
onMsg(?CMD_U2GS_RequesBuyID, #pk_U2GS_RequesBuyID{type = 1, id = ID}) ->
	playerVip:buy(ID),
	ok;

%%请求装备合成操作
onMsg(?CMD_U2GS_EqupmentCombin, #pk_U2GS_EqupmentCombin{combinID = ID, equpmentUIDList = EqupmentUIDList}) ->
	Succ = playerShop:resourceExchange4Equpment(ID, EqupmentUIDList),
	playerMsg:sendNetMsg(#pk_GS2U_EqupmentCombinAck{
		combinID = ID,
		success = Succ
	}),
	ok;

%%远程玩家属性查看
onMsg(?CMD_U2GS_LookRPInfo_Request, #pk_U2GS_LookRPInfo_Request{roleID = RoleID}) ->
	playerRPView:queryRPInfo(RoleID),
	ok;

%%天梯1v1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 打开天梯1v1
onMsg(?CMD_U2GS_OpenLadder1v1, #pk_U2GS_OpenLadder1v1{}) ->
	playerLadder1v1:openLadder1v1(),
	ok;

%% 刷新对手(返回 GS2U_LadderTargetList)
onMsg(?CMD_U2GS_FreshLadderTargetList, #pk_U2GS_FreshLadderTargetList{}) ->
	playerLadder1v1:freshLadderList(),
	ok;

%% 按排名挑战对手
onMsg(?CMD_U2GS_ChallengeTargetByRank, #pk_U2GS_ChallengeTargetByRank{ranksort = RankSort, name = TargetName}) ->
	case playerState:getCurHp() =< 0 of
		true ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_Ladder1v1_PleaseWait);
		_ ->
			playerLadder1v1:challengeTargetByRank(RankSort, TargetName)
	end,
	ok;

%% 按对象挑战对手
onMsg(?CMD_U2GS_ChallengeTargetByRoleID, #pk_U2GS_ChallengeTargetByRoleID{roleID = RoleID}) ->
	case playerState:getCurHp() =< 0 of
		true ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_Ladder1v1_PleaseWait);
		_ ->
			playerLadder1v1:challengeTargetByRoleID(RoleID)
	end,
	ok;

%% 放弃挑战
onMsg(?CMD_U2GS_GiveUpChallenge, #pk_U2GS_GiveUpChallenge{}) ->
	playerLadder1v1:giveUpChallenge(),
	ok;

%% 获取对象的模型相关信息(返回rank.h GS2U_SendPropList 这个协议)
onMsg(?CMD_U2GS_RequestPlayerInfo, #pk_U2GS_RequestPlayerInfo{roleID = RID}) ->
	playerLadder1v1:requestPlayerInfo(RID),
	ok;

%% 请求王者列表
onMsg(?CMD_U2GS_RequestKingList, #pk_U2GS_RequestKingList{}) ->
	playerLadder1v1:requestKingList(),
	ok;

%% 膜拜王者
onMsg(?CMD_U2GS_WorshipTarget, #pk_U2GS_WorshipTarget{roleID = RID, roleName = RoleName}) ->
	playerLadder1v1:worshipTarget(RID, RoleName),
	ok;

%% 请求对战记录
onMsg(?CMD_U2GS_RequestBattleNotes, #pk_U2GS_RequestBattleNotes{}) ->
	playerLadder1v1:requestBattleNotes(),
	ok;

%%天梯1v1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 申请单人护送
onMsg(?CMD_U2GS_RequestEscortSolo, #pk_U2GS_RequestEscortSolo{}) ->
	playerEscort:requestEscortSolo(),
	ok;
%% 申请多人护送
onMsg(?CMD_U2GS_RequestEscortTeam, #pk_U2GS_RequestEscortTeam{}) ->
	playerEscort:requestEscortTeam(),
	ok;
%% 申请劫掠
onMsg(?CMD_U2GS_RequestEscortRob, #pk_U2GS_RequestEscortRob{sequenceNumber = Number}) ->
	playerEscort:requestEscortRob(Number),
	ok;
%% 请求多人护送列表
onMsg(?CMD_U2GS_RequestEscortList, #pk_U2GS_RequestEscortList{}) ->
	playerEscort:requestEscortTeamList(),
	ok;
%% 触发了一个事件(服务器通知客户端触发一个事件，客户端响应则回复同样的协议)
onMsg(?CMD_GS2U_TriggerEvent, #pk_GS2U_TriggerEvent{}) ->
	playerEscort:acceptTriggerEvent(),
	ok;

%% 请求黑暗之地初始信息(打开界面)
onMsg(?CMD_U2GS_RequestDarknessInfo, #pk_U2GS_RequestDarknessInfo{}) ->
	playerDarkness:requestDarknessInfo(),
	ok;
%% 请求入口列表
onMsg(?CMD_U2GS_RequestEntrance, #pk_U2GS_RequestEntrance{}) ->
	playerDarkness:requestEntrance(),
	ok;
%% 进入黑暗之地(进入失败，自动加入排队)
onMsg(?CMD_U2GS_RequestEnterDarkness, #pk_U2GS_RequestEnterDarkness{entrance = Entrance}) ->
	playerDarkness:requestEnterDarkness(Entrance),
	ok;
%% 请求自己的信息
onMsg(?CMD_U2GS_SelfDarkness, #pk_U2GS_SelfDarkness{}) ->
	playerDarkness:selfDarkness(),
	ok;
%% 请求打开势力选择界面
onMsg(?CMD_U2GS_OpenSelectCamp, #pk_U2GS_OpenSelectCamp{}) ->
	playerDarkness:openSelectCamp(),
	ok;
%% 选择势力
onMsg(?CMD_U2GS_SelectCamp, #pk_U2GS_SelectCamp{camp = Camp}) ->
	playerDarkness:selectCamp(Camp),
	ok;
%% 请求黑暗之地排行榜
onMsg(?CMD_U2GS_DarknessRank, #pk_U2GS_DarknessRank{}) ->
	playerDarkness:darknessRank(),
	ok;

%% 打开占卜界面
onMsg(?CMD_U2GS_OpenLotteryForm, #pk_U2GS_OpenLotteryForm{}) ->
	playerLottery:openLotteryForm(),
	ok;

%% 占卜
onMsg(?CMD_U2GS_RequestLottery, #pk_U2GS_RequestLottery{isGold = IsGold, isFree = IsFree, number = N}) ->
	playerLottery:requestLottery(IsGold, IsFree, N),
	ok;

%%
onMsg(?CMD_U2GS_RequestLotteryResetTime, #pk_U2GS_RequestLotteryResetTime{}) ->
	playerLottery:sendResetTime(),
	ok;

%%资源兑换
onMsg(?CMD_U2GS_ResourceExchange, #pk_U2GS_ResourceExchange{id = ID, itemCount = ItemCount, opType = OpType}) ->
	playerShop:resourceExchange(ID, ItemCount, OpType),
	ok;

%%阅读邮件
onMsg(?CMD_U2GS_ReadMail, #pk_U2GS_ReadMail{mailID = MailID}) ->
	playerMail:readMail(MailID),
	ok;

%%玩家发送邮件
onMsg(?CMD_U2GS_SendMail, #pk_U2GS_SendMail{toRoleName = ToRoleName, mailTitle = Title, mailContent = Content}) ->
	%%客户端发的名字有可能前后有空格，这里需要处理一下
	Name = string:strip(ToRoleName, both, 32),
	playerMail:newMail(Name, Title, Content, ""),
	ok;

%%锁定邮件
onMsg(?CMD_U2GS_LockMail, #pk_U2GS_LockMail{mailID = MailID}) ->
	playerMail:lockMail(MailID),
	ok;

%%解锁邮件
onMsg(?CMD_U2GS_UnlockMail, #pk_U2GS_UnlockMail{mailID = MailID}) ->
	playerMail:unlockMail(MailID),
	ok;

%%获取邮件附件中的货币
onMsg(?CMD_U2GS_GetMailCoin, #pk_U2GS_GetMailCoin{mailID = MailID}) ->
	playerMail:getMailCoin(MailID),
	ok;

%%获取邮件附件中的道具
onMsg(?CMD_U2GS_GetMailItem, #pk_U2GS_GetMailItem{mailID = MailID, itemUID = ItemUID}) ->
	playerMail:getMailItem(MailID, ItemUID),
	ok;

%%删除指定邮件
onMsg(?CMD_U2GS_DeleteMail, #pk_U2GS_DeleteMail{mailID = MailID}) ->
	playerMail:deleteMail(MailID),
	ok;

%%删除所有已读且无附件的邮件
onMsg(?CMD_U2GS_DeleteAllReadMail, #pk_U2GS_DeleteAllReadMail{}) ->
	playerMail:deleteAllReadMail(),
	ok;

%%选中某个对象
onMsg(?CMD_U2GS_SelectTarget, #pk_U2GS_SelectTarget{code = SelectCode}) ->
	%%?DEBUG_OUT("~ts [~p] select target ~p", [playerState:getName(),playerState:getPlayerCode(), SelectCode]),
	playerState:setSelectTargetCode(SelectCode),
	ok;

%%单独请求某个看不见的对象
onMsg(?CMD_U2GS_QueryTargetObject, #pk_U2GS_QueryTargetObject{targetCode = _TargetCode}) ->
%%	playerMap:querySyncTargetCode(TargetCode),
	ok;

%% 宠物升星
onMsg(?CMD_U2GS_UpStartPet, #pk_U2GS_UpStartPet{petID = PetID}) ->
	playerPet:petUpStar(PetID);

%% 宠物洗炼技能
onMsg(?CMD_U2GS_PetSkillCast, #pk_U2GS_PetSkillCast{petID = PetID, skillIDs = SkillIDs}) ->
	playerPet:petSkillCast(PetID, SkillIDs);

%% 宠物技能替换
onMsg(?CMD_PetSkillReplace, #pk_PetSkillReplace{petID = PetID}) ->
	playerPet:petSkillReplace(PetID);

%% 宠物切换
onMsg(?CMD_PetSwitch, #pk_PetSwitch{petId = PetID}) ->
	playerPet:petSwitch(PetID);

%%宠物装备强化
onMsg(?CMD_U2GS_PetStr, #pk_U2GS_PetStr{equipID = EquipID, type = Type}) ->
	case Type of
		0 -> %%普通强化
			playerPet:petSEquipStr(EquipID);
		1 -> %%一键强化
			playerPet:petQEquipStr(EquipID)
	end;

%%宠物改名
onMsg(?CMD_PetReName, #pk_PetReName{petID = PetID, name = Name}) ->
	playerPet:petReName(PetID, Name);

%%宠物转生
onMsg(?CMD_U2GS_RawPet, #pk_U2GS_RawPet{petID = PetID}) ->
	playerPet:petTurnRaw(PetID);

%%宠物属性提升
onMsg(?CMD_U2GS_PetAddAtta, #pk_U2GS_PetAddAtta{petID = PetID, num = Num}) ->
	playerPet:petAttaAdd(PetID, Num);

%%宠物属性保存
onMsg(?CMD_U2GS_PetAttaSave, #pk_U2GS_PetAttaSave{petID = PetID}) ->
	playerPet:petAttaSave(PetID);

%%% 宠物精灵
%onMsg(?CMD_U2GS_QueryPetFairyInfo, #pk_U2GS_QueryPetFairyInfo{}) ->
%	playerPetFairy:queryFairy();

%% 上坐骑
onMsg(?CMD_U2GS_OnMountPet, #pk_U2GS_OnMountPet{}) ->
	case playerState:getActionStatus() of
		?CreatureActionStatusChangeMap ->
			skip;
		_ ->
			playerPet:petOnMount()
	end;

%% 下坐骑
onMsg(?CMD_U2GS_OffMountPet, #pk_U2GS_OffMountPet{}) ->
	case playerState:getActionStatus() of
		?CreatureActionStatusChangeMap ->
			skip;
		_ ->
			playerPet:petOffMount(true)
	end;
%% 下坐骑
onMsg(?CMD_U2GS_DoublePetMountInvite, #pk_U2GS_DoublePetMountInvite{tarRoleID = RoleID}) ->
	case playerState:getActionStatus() of
		?CreatureActionStatusChangeMap ->
			skip;
		_ ->
			playerPetDouble:inviteDoubleMount(RoleID)
	end;
onMsg(?CMD_U2GS_DoublePetMountInviteAck, #pk_U2GS_DoublePetMountInviteAck{agree = Agree, srcRoleID = RoleID}) ->
	case playerState:getActionStatus() of
		?CreatureActionStatusChangeMap ->
			skip;
		_ ->
			playerPetDouble:inviteDoubleMountAck(RoleID, Agree)
	end;

%% 显示坐骑
onMsg(?CMD_U2GS_ShowMountPet, #pk_U2GS_ShowMountPet{}) ->
	playerPet:petShow();

%% 隐藏坐骑
onMsg(?CMD_U2GS_HideMountPet, #pk_U2GS_HideMountPet{}) ->
	playerPet:petHide();

%% 宠物助战
onMsg(?CMD_U2GS_PetAssistBattle, #pk_U2GS_PetAssistBattle{ slot = Slot, petID = PetID, status = Status}) ->
	playerPet:petAssistBattle(Slot, PetID, Status);

%% 使用宠物技能书
onMsg(?CMD_U2GS_UsePetSkillBook, #pk_U2GS_UsePetSkillBook{petID = PetID, petSkillId = SkillID, itemid = ItemID}) ->
	playerPet:petFixCast(PetID, SkillID, ItemID);


%% 宠物强制消失
onMsg(?CMD_U2GS_PetDisapear, #pk_U2GS_PetDisapear{code = Code}) ->
	playerPet:petDisapear(Code);

%%进入副本
onMsg(?CMD_U2GS_EnterCopyMap, #pk_U2GS_EnterCopyMap{copyMapID = CopyMapID}) ->
	case playerCopyMap:canEnterCopyMap(CopyMapID) of
		true ->
			playerCopyMap:enterCopyMap(CopyMapID);
		ErrorCode ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok;

%%离开副本
onMsg(?CMD_U2GS_LeaveCopyMap, #pk_U2GS_LeaveCopyMap{type = Type}) ->
	playerAcKingBattleAll:onLevelKingBattleMap(),
	Ret = playerCopyMap:leaveCopyMap(),
	MapID = playerState:getMapID(),
	MapPid = playerState:getMapPid(),
	%%mwh-new-team
	case playerScene:getMapType(MapID) of
		?MapTypeCopyMap when Ret =:= true ->
			core:sendMsgToMapMgr(MapID, playerLeaveCopyMap, {playerState:getRoleID(), MapID, MapPid}),
			case Type of
				1 ->
					playerTeam:leaveTeam(false);
				_ ->
					skip
			end,
			ok;
		_ ->
			skip
	end,
	ok;

%%重置副本
onMsg(?CMD_U2GS_ResetCopyMap, #pk_U2GS_ResetCopyMap{copyMapID = CopyMapID}) ->
	playerCopyMap:resetCopyMap(CopyMapID),
	ok;

%%副本动画结束
onMsg(?CMD_U2GS_CopyMapSchedulePlayAnimationOver, #pk_U2GS_CopyMapSchedulePlayAnimationOver{animationID = AN}) ->
	playerCopyMap:playAnimationOver(AN),
	ok;

onMsg(?CMD_U2GS_CopyMapSchedulePlayCharacterOver, #pk_U2GS_CopyMapSchedulePlayCharacterOver{schedule = Schedule}) ->
	psMgr:sendMsg2PS(playerState:getMapPid(), characterPlayOver, {playerState:getGroupID(), Schedule}),
	ok;

%% 请求目标副本的最高分数
onMsg(?CMD_U2GS_RequestTargetCopyMapScore, #pk_U2GS_RequestTargetCopyMapScore{targetCopyMapID = TCopyMapID}) ->
	Score = playerCopyMapReward:getCopyMapMaxScore(TCopyMapID),
	sendNetMsg(#pk_GS2U_RequestTargetCopyMapScore{targetCopyMapID = TCopyMapID, highestScore = Score}),
	ok;

%% 玩家请求时空裂痕npc的信息
onMsg(?CMD_U2GS_RequestRiftNpcInfo, #pk_U2GS_RequestRiftNpcInfo{npcCode = _Code}) ->
	%%playerCopyMapRift:requestRiftNpcInfo(Code),
	ok;

%% 玩家请求进入时空裂痕
onMsg(?CMD_U2GS_RequestEnterRift, #pk_U2GS_RequestEnterRift{groupID = _GroupID, bitplaneMapID = _BMapID}) ->
	%%playerCopyMapRift:requestEnterRift(GroupID, BMapID),
	ok;

%% 请求加入混沌战场
onMsg(?CMD_U2GS_RequestJoinHDBattle, #pk_U2GS_RequestJoinHDBattle{}) ->
	case core:isCross() of
		false ->
			?DEBUG_OUT("requestJoinHDBattle:~p", [playerState:getRoleID()]),
			MapID = playerState:getMapIDGroup(),
			case playerScene:getMapType(MapID) of
				?MapTypeNormal ->
					core:sendMsgToActivity(?ActivityType_HDBattle,
						requestJoinHDBattle,
						{
							playerState:getRoleID(),
							playerState:getName(),
							playerState:getLevel(),
							self(),
							playerState:getNetPid(),
							playerPropSync:getProp(?PriProp_PetForce) + playerPropSync:getProp(?PriProp_PlayerForce)
						});
				_ ->
					%% 不能从副本或者位面中进入混沌战场
					sendErrorCodeMsg(?ErrorCode_ActivityHDEnterBattleFailed)
			end;
		_ ->
			?ERROR_OUT("CMD_U2GS_RequestJoinHDBattle:~p", [playerState:getRoleID()]),
			sendErrorCodeMsg(?ErrorCode_SystemChangeMapFailed)
	end,
	ok;

%% 获取混沌战场击杀玩家排行榜数据
onMsg(?CMD_U2GS_KillRank, #pk_U2GS_KillRank{}) ->
	?DEBUG_OUT("requestHDKillRank:~p", [playerState:getRoleID()]),
	core:sendMsgToActivity(?ActivityType_HDBattle, requestHDKillRank,
		{playerState:getRoleID(), playerState:getNetPid()}),
	ok;
%% 请求混沌战场当前状态
onMsg(?CMD_U2GS_RequestQueueNumber, #pk_U2GS_RequestQueueNumber{}) ->
	core:sendMsgToActivity(?ActivityType_HDBattle, requestQueueNumber,
		{playerState:getRoleID(), playerState:getNetPid()}),
	ok;

%% 取消报名混沌战场
onMsg(?CMD_U2GS_CancelApply, #pk_U2GS_CancelApply{}) ->
	core:sendMsgToActivity(?ActivityType_HDBattle, cancelApply,
		{playerState:getRoleID(), playerState:getNetPid()}),
	ok;

%%宝石镶嵌
onMsg(?CMD_U2GS_GemEmbedOn, #pk_U2GS_GemEmbedOn{gemEmbedInfoList = GemEmbedInfo}) ->
	playerPackage:gemEmbedOn(GemEmbedInfo),
	ok;

%%宝石拆卸
onMsg(?CMD_U2GS_GemEmbedOff, #pk_U2GS_GemEmbedOff{gemUIDs = GemUIDList}) ->
	playerPackage:gemEmbedOff(GemUIDList),
	ok;

%%宝石合成
onMsg(?CMD_U2GS_GemEmbedMake, #pk_U2GS_GemEmbedMake{id = ItemID, count = Count, flag = Flag}) ->
	Flg = case Flag of
			  0 ->
				  false;
			  _ ->
				  true
		  end,
	playerPackage:gemComposition(ItemID, Count, Flg),
	ok;


%%%%宝石合成
onMsg(?CMD_U2GS_GemEmbedMakeOnce, #pk_U2GS_GemEmbedMakeOnce{id = ItemID, bindCount = BindCount, unBindCount = UnBindCount}) ->
	playerPackage:gemCompositionOnce(ItemID, BindCount, UnBindCount),
	ok;


%% 查询交易行订单
onMsg(?CMD_U2GS_QueryTrade, #pk_U2GS_QueryTrade{} = Pk) ->
	playerTrade:queryTrade(Pk),
	ok;

%% 查询最新交易订单
onMsg(?CMD_U2GS_QueryNewestTrade, #pk_U2GS_QueryNewestTrade{} = Pk) ->
	playerTrade:queryNewestTrade(Pk),
	ok;

%% 查看上次搜索的订单的某一页
onMsg(?CMD_U2GS_NextResult, #pk_U2GS_NextResult{pageNumber = PageNumber, opCode = OpCode} = _Pk) ->
	%% 这个不需要排序
	playerTrade:nextResult(PageNumber, OpCode),
	ok;

%% 排序
onMsg(?CMD_U2GS_ResultSort, #pk_U2GS_ResultSort{} = Pk) ->
	playerTrade:sortTradeQueryResult(Pk),
	ok;

%% 查询自己的交易订单
onMsg(?CMD_U2GS_QuerySelfTrade, #pk_U2GS_QuerySelfTrade{} = Pk) ->
	playerTrade:querySelfTrade(Pk),
	ok;

%% 购买
onMsg(?CMD_U2GS_TradeBuy, #pk_U2GS_TradeBuy{} = Pk) ->
	playerTrade:buyTrade(Pk),
	ok;

%% 拒绝购买
onMsg(?CMD_U2GS_TradeRefuse, #pk_U2GS_TradeRefuse{} = Pk) ->
	playerTrade:refuseBuy(Pk),
	ok;

%% 上架
onMsg(?CMD_U2GS_PutTrade, #pk_U2GS_PutTrade{} = Pk) ->
	playerTrade:putTrade(Pk),
	ok;

%% 下架
onMsg(?CMD_U2GS_DownTrade, #pk_U2GS_DownTrade{} = Pk) ->
	playerTrade:downTrade(Pk),
	ok;

%% 请求指定公会信息
onMsg(?CMD_U2GS_RequestGuildInfo_Request, #pk_U2GS_RequestGuildInfo_Request{guildID = GuildID}) ->
	playerGuild:queryGuildInfo(GuildID),
	ok;

%% 请求指定角色的家族信息
onMsg(?CMD_U2GS_QueryGuildInfoByRoleID_Request, #pk_U2GS_QueryGuildInfoByRoleID_Request{roleID = RoleID}) ->
	playerGuild:queryGuildInfoByRoleID(RoleID),
	ok;

%% 查询允许快速加入的战力条件
onMsg(?CMD_U2GS_Guild_FastJoin_Get_Request, #pk_U2GS_Guild_FastJoin_Get_Request{guildID = GuildID}) ->
	playerGuild:fastJoin_Get(GuildID),
	ok;

%% 设置允许快速加入的战力条件
onMsg(?CMD_U2GS_Guild_FastJoin_Set_Request, #pk_U2GS_Guild_FastJoin_Set_Request{guildID = GuildID, force = Force}) ->
	playerGuild:fastJoin_Set(GuildID, Force),
	ok;

%% 快速加入请求
onMsg(?CMD_U2GS_Guild_FastJoin_Request, #pk_U2GS_Guild_FastJoin_Request{}) ->
	playerGuild:fastJoin(),
	ok;

%% 公会招募榜
onMsg(?CMD_U2GS_GuildList, #pk_U2GS_GuildList{requestPageNumber = Page} = _Pk) ->
	playerGuild:guildList(Page),
	ok;

%% 创建公会
onMsg(?CMD_U2GS_CreateGuild, #pk_U2GS_CreateGuild{guildName = GuildName, denoter = Denoter, guildNotice = Notice} = _Pk) ->
	playerGuild:createGuild(GuildName, Denoter, Notice),
	ok;

%% 解散公会
onMsg(?CMD_U2GS_DeleteGuild, #pk_U2GS_DeleteGuild{} = _Pk) ->
	playerGuild:deleteGuild(),
	ok;

%% 打开公会界面，获取数据
onMsg(?CMD_U2GS_OpenGuildForm, #pk_U2GS_OpenGuildForm{} = _Pk) ->
	playerGuild:openGuildForm(),
	ok;

%% 打开申请列表界面
onMsg(?CMD_U2GS_RequestJoinGuildList, #pk_U2GS_RequestJoinGuildList{} = _Pk) ->
	playerGuild:requestJoinGuildList(),
	ok;

%% 成员列表
onMsg(?CMD_U2GS_RequestLookMemberList, #pk_U2GS_RequestLookMemberList{requestPageNumber = Page} = _Pk) ->
	playerGuild:memberList(Page),
	ok;

%% 招募成员
onMsg(?CMD_U2GS_Recruit, #pk_U2GS_Recruit{targetCode = TargetCode} = _Pk) ->
	playerGuild:recruitPlayer(TargetCode),
	ok;

%% 招募结果
onMsg(?CMD_U2GS_AgreeRecruit, #pk_U2GS_AgreeRecruit{roleID = ZMRoleID, guildID = GuildID, agree = IsAgree} = _Pk) ->
	playerGuild:agreeRecruit(GuildID, ZMRoleID, IsAgree),
	ok;

%% 申请加入工会
onMsg(?CMD_U2GS_OneKeyRecruit_Request, #pk_U2GS_OneKeyRecruit_Request{} = _Pk) ->
	playerGuild:oneKeyRecruit(),
	ok;

%% 发布招募
onMsg(?CMD_U2GS_RequestJoinGuild, #pk_U2GS_RequestJoinGuild{guildID = GuildID} = _Pk) ->
	playerGuild:requestJoinGuild(GuildID),
	ok;

%% 同意或者拒绝申请者的加入
onMsg(?CMD_U2GS_DealRequestJoin, #pk_U2GS_DealRequestJoin{guildID = GuildID, roleIDs = RoleIDList, agree = IsAgree} = _Pk) ->
	playerGuild:dealRequestJoin(GuildID, RoleIDList, IsAgree),
	ok;

%% 退出工会
onMsg(?CMD_U2GS_ExitGuild, #pk_U2GS_ExitGuild{} = _Pk) ->
	playerGuild:exitGuild(),
	ok;

%% 踢出工会
onMsg(?CMD_U2GS_KickGuild, #pk_U2GS_KickGuild{targetRoleID = TargetID} = _Pk) ->
	playerGuild:kickGuild(TargetID),
	ok;

%% 赋予权限
onMsg(?CMD_U2GS_GivePower, #pk_U2GS_GivePower{targetRoleID = TargetID, guileLevel = TargetLvl} = _Pk) ->
	playerGuild:giveGuildPower(TargetID, TargetLvl),
	ok;

%% 修改公告
onMsg(?CMD_U2GS_ChangeNotice, #pk_U2GS_ChangeNotice{guildNotice = Notice} = _Pk) ->
	playerGuild:changeGuildNotice(Notice),
	ok;

%% 修改公会名字
onMsg(?CMD_U2GS_ChangeGuildName, #pk_U2GS_ChangeGuildName{newGuildName = NewGuildName} = _Pk) ->
	playerGuild:changeGuildName(NewGuildName),
	ok;

%% 修改标志
onMsg(?CMD_U2GS_ChangeDenoter, #pk_U2GS_ChangeDenoter{guildID = GuildID, denoter = Denoter} = _Pk) ->
	playerGuild:changeDenoter(GuildID, Denoter),
	ok;
%% 军团升级
onMsg(?CMD_U2GS_Upgrade, #pk_U2GS_Upgrade{guildID = GuildID} = _Pk) ->
	playerGuild:upgrade(GuildID),
	ok;
%% 军团商店升级
onMsg(?CMD_U2GS_ShopUpgrade, #pk_U2GS_ShopUpgrade{guildID = GuildID} = _Pk) ->
	playerGuild:shopUpgrade(GuildID),
	ok;

%% 权限移交
onMsg(?CMD_U2GS_ChangeLeader, #pk_U2GS_ChangeLeader{targetRoleID = TargetRoleID} = _Pk) ->
	playerGuild:changeLeader(TargetRoleID),
	ok;

%% 军团捐献
onMsg(?CMD_U2GS_DonateMoney, #pk_U2GS_DonateMoney{} = Pk) ->
	playerGuild:playerDonateMoney(Pk),
	ok;

%% 请求军团捐献次数
onMsg(?CMD_U2GS_RequestDonateTimes, #pk_U2GS_RequestDonateTimes{moneyType = Type}) ->
	playerGuild:requestDonateTimes(Type),
	ok;

%% 军团商店
onMsg(?CMD_U2GS_OpenGuildShop, #pk_U2GS_OpenGuildShop{}) ->
	case playerGuild:getGuildShopID() of
		0 -> skip;
		ShopID ->
			playerShop:sendStoreToClient(ShopID)
	end,
	ok;

%%% 打开军团任务界面，请求军团任务列表，返回GS2U_GuildTask
%onMsg(?CMD_U2GS_RequestGuildTask, #pk_U2GS_RequestGuildTask{}) ->
%	playerGuildHome:requestGuildTask(),
%	ok;
%%% 领取军团工资
%onMsg(?CMD_U2GS_GuildReward, #pk_U2GS_GuildReward{}) ->
%	playerGuildHome:guildReward(),
%	ok;

%% 领取军团津贴(最新)
onMsg(?CMD_U2GS_GetGuildPrize, #pk_U2GS_GetGuildPrize{}) ->
	?ERROR_OUT("please ask tiacheng..."),
	ok;

%% 打开军团战报名界面
onMsg(?CMD_U2GS_GuildBattleApply, #pk_U2GS_GuildBattleApply{}) ->
	playerGuildBattle:openGuildApplyForm(),
	ok;

%% 进入军团战或者报名
onMsg(?CMD_U2GS_EnterGuildBattle, #pk_U2GS_EnterGuildBattle{}) ->
	playerGuildBattle:applyOrEnterBattle(),
	ok;
%% 请求军团战积分信息
onMsg(?CMD_U2GS_RequestGuildBattleResult, #pk_U2GS_RequestGuildBattleResult{}) ->
	playerGuildBattle:requestGuildBattleResult(),
	ok;

%%% 召唤神兽
%onMsg(?CMD_U2GS_SummonMonster, #pk_U2GS_SummonMonster{}) ->
%	playerGuildHome:summonMonster(),
%	ok;
%%% 接取军团驻地任务
%onMsg(?CMD_U2GS_AcceptGuildTask, #pk_U2GS_AcceptGuildTask{taskType = TaskType}) ->
%	playerGuildHome:acceptGuildTask(TaskType),
%	ok;
%%% 放弃任务
%onMsg(?CMD_U2GS_GiveUpGuildTask, #pk_U2GS_GiveUpGuildTask{taskType = TaskType}) ->
%	playerGuildHome:giveUpGuildTask(TaskType),
%	ok;
%% 进入军团驻地
onMsg(?CMD_U2GS_Guild_FairgroundEnter_Request, #pk_U2GS_Guild_FairgroundEnter_Request{targetGuildID = TargetGuildID}) ->
	playerGuildFairground:enter_try(TargetGuildID),
	ok;
%%% 领取奖励
%onMsg(?CMD_U2GS_GetGuildHomeReward, #pk_U2GS_GetGuildHomeReward{taskType = TaskType}) ->
%	playerGuildHome:getGuildHomeReward(TaskType),
%	ok;
%%% 召唤幻象(刺探专有)
%onMsg(?CMD_U2GS_SummonHX, #pk_U2GS_SummonHX{}) ->
%	playerGuildHome:summonHX(),
%	ok;
%% 使用游乐场设备请求
onMsg(?CMD_U2GS_Guild_FairgroundRide_Request, #pk_U2GS_Guild_FairgroundRide_Request{id = ID, type = Type}) ->
	playerGuildFairground:onUseRide(ID, Type),
	ok;

%% 请求竞价军团列表与自己军团信息和分组信息
onMsg(?CMD_U2GS_RequestGuildWar, #pk_U2GS_RequestGuildWar{} = _Pk) ->
	playerGuildWar:requestGuildWar(),
	ok;

%% 竞价
onMsg(?CMD_U2GS_Bidding, #pk_U2GS_Bidding{guildID = GuildID} = _Pk) ->
	playerGuildWar:bidding(GuildID),
	ok;

%% 使用大炮
onMsg(?CMD_U2GS_UseCannon, #pk_U2GS_UseCannon{targetGuildID = TGuildID, selectCode = Code} = _Pk) ->
	playerGuildWar:useCannon(Code, TGuildID),
	ok;
%% 打开军团技能界面
onMsg(?CMD_U2GS_RequestGuildSkill, #pk_U2GS_RequestGuildSkill{} = _Pk) ->
	playerGuildSkillAndBuff:requestGuildSkill(),
	ok;
%% 研究技能
onMsg(?CMD_U2GS_ResearchGuildSkill, #pk_U2GS_ResearchGuildSkill{confId = ConfID} = _Pk) ->
	playerGuildSkillAndBuff:researchGuildSkill(ConfID),
	ok;
%% 学习技能
onMsg(?CMD_U2GS_StudyGuildSkill, #pk_U2GS_StudyGuildSkill{confId = ConfID} = _Pk) ->
	playerGuildSkillAndBuff:studyGuildSkill(ConfID),
	ok;
%% 打开军团福利BUFF界面
onMsg(?CMD_U2GS_RequestGuildBuff, #pk_U2GS_RequestGuildBuff{} = _Pk) ->
	playerGuildSkillAndBuff:requestGuildBuff(),
	ok;
%% 购买BUFF
onMsg(?CMD_U2GS_BuyGuildBuff, #pk_U2GS_BuyGuildBuff{confId = ConfID} = _Pk) ->
	playerGuildSkillAndBuff:buyGuildBuff(ConfID),
	ok;
%% 领取BUFF
onMsg(?CMD_U2GS_getGuildBuff, #pk_U2GS_getGuildBuff{confId = ConfID} = _Pk) ->
	playerGuildSkillAndBuff:getGuildBuff(ConfID),
	ok;

%% 家族系统-女神祈福
onMsg(?CMD_U2GS_Guild_GodBless_Request, #pk_U2GS_Guild_GodBless_Request{type = Type}) ->
	playerGuild:godBless(Type),
	ok;

%% 家族系统-女神祈福-查询祈福进度
onMsg(?CMD_U2GS_Guild_GodBless_Schedule_Request, #pk_U2GS_Guild_GodBless_Schedule_Request{}) ->
	playerGuild:godBless_Schedule(),
	ok;

%% 家族系统-女神祈福-领取祈福进度奖励
onMsg(?CMD_U2GS_Guild_GodBless_Schedule_Reward_Request, #pk_U2GS_Guild_GodBless_Schedule_Reward_Request{id = ID}) ->
	playerGuild:godBless_Schedule_Reward(ID),
	ok;

%% 家族系统-家族商店
onMsg(?CMD_U2GS_Guild_ShopBuy_Request, #pk_U2GS_Guild_ShopBuy_Request{id = ID, count = Count}) ->
	playerGuild:shopBuy(ID, Count),
	ok;

%% 家族系统-兑换功能
onMsg(?CMD_U2GS_Guild_Exchange_Request, #pk_U2GS_Guild_Exchange_Request{id = ID, level = Level}) ->
	playerGuild:exchange(ID, Level),
	ok;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 家族系统-堆雪人活动 begin

%% 查看当前雪人进度
onMsg(?CMD_U2GS_Guild_SnowmanCheck_Request, #pk_U2GS_Guild_SnowmanCheck_Request{}) ->
	playerGuildSnowman:checkSnowman(),
	ok;

%% 捐献材料
onMsg(?CMD_U2GS_Guild_SnowmanDonate_Request, #pk_U2GS_Guild_SnowmanDonate_Request{id = ID, snowmanID = SnowmanID}) ->
	playerGuildSnowman:donate({ID, SnowmanID}),
	ok;

% 20170223 废弃客户端主动请求领奖，改为活动结算时主动发奖
%%% 领取雪人礼盒请求
%onMsg(?CMD_U2GS_Guild_SnowmanReward_Request, #pk_U2GS_Guild_SnowmanReward_Request{id = ID}) ->
%	playerGuildSnowman:reward(ID),
%	ok;

%% 家族系统-堆雪人活动 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 商城数据请求
onMsg(?CMD_U2GS_MallInfo, #pk_U2GS_MallInfo{seed = Seed} = _Pk) ->
	playerMall:requestMallInfo(Seed, ?MallSendType_Mall),
	ok;

%% 商城数据请求(推送使用)
onMsg(?CMD_U2GS_MallInfo2, #pk_U2GS_MallInfo2{seed = Seed} = _Pk) ->
	playerMall:requestMallInfo(Seed, ?MallSendType_PushBuy),
	ok;

%% 商城购买请求
onMsg(?CMD_U2GS_ItemBuyRequest, #pk_U2GS_ItemBuyRequest{} = _Pk) ->
	playerMall:mallBuyRequest(_Pk, ?MallSendType_Mall),
	ok;

%% 商城购买请求(推送使用)
onMsg(?CMD_U2GS_ItemBuyRequest2, #pk_U2GS_ItemBuyRequest2{} = Pk) ->
	playerMall:mallBuyRequest(Pk, ?MallSendType_PushBuy),
	ok;

%%PK状态转换
onMsg(?CMD_U2GS_RequestChangePKMode, #pk_U2GS_RequestChangePKMode{pkMode = PkMode}) ->
	case playerState:getIsInActivityMap() of
		true ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_KillModeActivityMap);
		_ ->
			playerPk:tranState(PkMode)
	end,
	ok;

%%获取杀戮值
onMsg(?CMD_U2GS_KillValueRequest, #pk_U2GS_KillValueRequest{}) ->
	%%playerPk:noticeKillValue(),
	ok;

%%玩家复活
onMsg(?CMD_U2GS_RequestRevive, #pk_U2GS_RequestRevive{}) ->
	playerRevive:requestRevive_Normal(),
	ok;

%%玩家收费复活
onMsg(?CMD_U2GS_RequestReviveCost, #pk_U2GS_RequestReviveCost{}) ->
	case core:isCross() of
		true ->
			skip;
		_ ->
%%			?ERROR_OUT("CMD_U2GS_RequestReviveCost:~p", [playerState:getRoleID()]),
			playerRevive:requestRevive_Cost()
	end,
	ok;

%%玩家重置位置到本地图复活点
onMsg(?CMD_U2GS_ResetPosToRevivePt, #pk_U2GS_ResetPosToRevivePt{}) ->
	playerMap:resetPosToRevivePt(),
	ok;

%%低级副本扫荡
onMsg(?CMD_U2GS_RequestAutoDeal, #pk_U2GS_RequestAutoDeal{mapID = CopyMapID}) ->
	playerLowCopyMapAuto:getLowCopyMapReward(CopyMapID),
	ok;

%% 老线路client请求换线
onMsg(?CMD_U2GS_ChangeLineRequest, #pk_U2GS_ChangeLineRequest{type = _Type}) ->
	?ERROR_OUT("ChangeLineRequest, accountID:~p, roleID:~p", [playerState:getAccountID(), playerState:getRoleID()]),
	ok;

%% 老线路client确认换线换线
onMsg(?CMD_U2GS_ChangeLineRequestAck, #pk_U2GS_ChangeLineRequestAck{yes = Type}) ->
	?LOG_OUT("CMD_U2GS_ChangeLineRequestAck[~p] playerPid[~p]", [Type, self()]),
	case Type of
		?ChangeLineAckYes -> %确定换线
			psMgr:sendMsg2PS(self(), quitAfter, 1000 * 30), %玩家进程30s后无消息自杀。断线重连
			ok;
		?ChangeLineAckNo -> %放弃换线
			playerState:setOffLineFlag(?OffLineTypeNormal),%%重置为正常状态
			playerState:setRunStep(?PlayerStateRun),%%重置为正常状态
			ok
	end,
	ok;

%% 符文
onMsg(?CMD_U2GS_OpenRuneGrid, #pk_U2GS_OpenRuneGrid{ownerID = TargetID, openNumber = Num}) ->
	playerRune:openRuneGrid(TargetID, Num),
	ok;
onMsg(?CMD_DeleteRunes, #pk_DeleteRunes{runeUIDS = UIDS}) ->
	playerRune:deleteRunes(UIDS),
	ok;
onMsg(?CMD_U2GS_RequestSuitProp, #pk_U2GS_RequestSuitProp{ownerID = TargetID}) ->
	playerRune:requestSuitProp(TargetID),
	ok;
onMsg(?CMD_U2GS_RuneEmbedOff, #pk_U2GS_RuneEmbedOff{runeUIDs = UIDS}) ->
	playerRune:runeEmbedOff(UIDS),
	ok;
onMsg(?CMD_RuneEmbedOn, #pk_RuneEmbedOn{targetID = TargetID, runeUIDs = UIDs}) ->
	playerRune:runeEmbedOn(TargetID, UIDs),
	ok;
%% 符文熔炼
onMsg(?CMD_U2GS_RuneMelt, #pk_U2GS_RuneMelt{targetRuneUID = TargetUID, materialUIDS = MaterialUIDs}) ->
	playerRune:runeMelt(TargetUID, MaterialUIDs),
	ok;
%% 符文洗练
onMsg(?CMD_U2GS_RuneCast, #pk_U2GS_RuneCast{targetUID = TargetUID, indexNumber = IndexNumber, materialUID = MaterialUID}) ->
	playerRune:runeCast(TargetUID, IndexNumber, MaterialUID),
	ok;
%% 符文洗练确认
onMsg(?CMD_U2GS_RuneCastAffirm, #pk_U2GS_RuneCastAffirm{flagID = FlagID, isAffirm = IsAffirm}) ->
	playerRune:runeCastAffirm(FlagID, IsAffirm),
	ok;
%% 符文合成
onMsg(?CMD_U2GS_RuneCompound, #pk_U2GS_RuneCompound{compoundID = CompoundID}) ->
	playerRune:runeCompound(CompoundID),
	ok;
%%共享装备的查看
onMsg(?CMD_U2GS_QueryRuneTips, #pk_U2GS_QueryRuneTips{runeUID = UID} = _Pk) ->
	playerRune:queryRuneTips(UID),
	ok;

%% 更新数值变量
onMsg(?CMD_Any_UpdateVariant, #pk_Any_UpdateVariant{updateVariantList = VariantList}) ->
	playerVariant:clientUpdatePlayerVariant(VariantList),
	ok;

%%更新开关变量
onMsg(?CMD_Any_UpdateBitVariant, #pk_Any_UpdateBitVariant{updateVariantList = VariantList}) ->
	playerVariant:clientUpdatePlayerBitVariant(VariantList),
	ok;

%%客户端正常退出
onMsg(?CMD_Any_PlayerLogout, #pk_Any_PlayerLogout{code = Code, reason = Reason}) ->
	case playerState:getPlayerCode() of
		Code ->
			playerBase:onPlayerQuit({normal, Reason}),
			psMgr:sendMsg2PS(self(), netQuit, "logout");
		_ ->
			skip
	end,
	ok;

%%玩家反馈消息
onMsg(?CMD_U2GS_PlayerCoupleBack, #pk_U2GS_PlayerCoupleBack{cbType = Type, cbContent = Content} = _PK) ->
	Len = str:get_utf8_char_count(Content),
	case Len =< 256 of
		true ->
			{Fgi, _FedID, _PlatformName} = playerState:getFuncellInfo(),
			R = #recLogPlayerCB{
				accountID = playerState:getAccountID(),
				roleID = playerState:getRoleID(),
				platformAccountID = Fgi,
				mapid = playerState:getMapID(),
				playerlevel = playerState:getLevel(),
				playercareer = playerState:getCareer(),
				cbtype = Type,
				cbcontent = Content},
			dbLog:sendSaveLogPlayerCoupleBack(R),
			sendErrorCodeMsg(?ErrorCode_SystemPlayerCoupleBack),
			?LOG_OUT("recv PlayerCoupleBack:~p,~p", [Len, R]);
		_ ->
			?DEBUG_OUT("recv PlayerCoupleBack Len:~p,~p", [Len, Content]),
			skip
	end,
	ok;

%%gs中获取游戏中公告列表(走马灯)
onMsg(?CMD_U2GS_NoticeRequest, #pk_U2GS_NoticeRequest{md5 = Md5} = _PK) ->
	?DEBUG_OUT("CMD_U2LS_NoticeRequest", []),
	psMgr:sendMsg2PS(?PsNameLS, getGameNotice, {Md5}),
	ok;

%%gs中获取公告列表（更新、活动）
onMsg(?CMD_U2GS_XmlNoticeRequest, #pk_U2GS_XmlNoticeRequest{type = Type, sign = Md5} = _PK) ->
	?DEBUG_OUT("CMD_U2GS_XmlNoticeRequest", []),
	psMgr:sendMsg2PS(?PsNameLS, getXmlNotice, {Type, Md5}),
	ok;

%%保存语音消息
onMsg(?CMD_U2GS_ChatVoice, Msg) ->
	playerChat:storeVoice(Msg),
	ok;

%%获取语音消息
onMsg(?CMD_U2GS_ReqChatVoice, #pk_U2GS_ReqChatVoice{key = Key, playerCode = PlayerCode}) ->
	playerChat:getVoice({PlayerCode, Key}),
	ok;

onMsg(?CMD_U2GS_ShowHeadEmoticonIcon, #pk_U2GS_ShowHeadEmoticonIcon{iconIndex = IconIndex}) ->
	CanUse =
		case lists:member(IconIndex, playerChat:getPlayerPerformanceIDList(1)) of
			true -> true;
			_ -> lists:member(IconIndex, playerPropSync:getProp(?SerProp_PlayerBQs))
		end,
	case CanUse of
		true -> playerChat:showHeadEmoticonIcon(IconIndex);
		_ -> skip
	end,
	ok;

onMsg(?CMD_U2GS_ShowAction, #pk_U2GS_ShowAction{actionIndex = ActionIndex}) ->
	CanUse =
		case lists:member(ActionIndex, playerChat:getPlayerPerformanceIDList(2)) of
			true -> true;
			_ -> lists:member(ActionIndex, playerPropSync:getProp(?SerProp_PlayerDZs))
		end,
	case CanUse of
		true ->
			playerAchieve:achieveEvent(?Achieve_Social_Event2,[1]),
			Code = playerState:getPlayerCode(),
			Msg = #pk_GS2U_ShowAction{playerCode = Code, actionIndex = ActionIndex},
			sendMsgToNearPlayer(Msg, true);
		_ -> skip
	end,
	ok;

%%激活码领取
onMsg(?CMD_U2GS_ActiveCodeRequest, #pk_U2GS_ActiveCodeRequest{code = Code} = _PK) ->
	playerActiveCode:getActiveCodeRequest(Code),
	ok;

%% 每日签到功能转由协议CMD_U2GS_SignIn与模块playerDailySignIn实现
%%%每日签到
%onMsg(?CMD_EveryDaySignIn, #pk_EveryDaySignIn{}) ->
%	?ERROR_OUT("invalid msg CMD_EveryDaySignIn"),
%  playerSignIn:playerEveryDaySignIn(),
%  ok;

%%七日签到
onMsg(?CMD_SevenDaySignIn, #pk_SevenDaySignIn{dayCount = DayCount} = _PK) ->
	?DEBUG_OUT("[DebugForSignIn] CMD_SevenDaySignIn DayCount(~p)", [DayCount]),
	playerSignIn:playerSevenDaySignIn(DayCount),
	ok;

%% 请求资源找回列表
onMsg(?CMD_RefindResList, #pk_RefindResList{} = _PK) ->
	playerFindRes:requestFindRes(),
	ok;

%% 开始找回
onMsg(?CMD_U2GS_RefindResOne, #pk_U2GS_RefindResOne{id = ID, type = Type} = _PK) ->
	playerFindRes:refindResOne(ID, Type),
	ok;

%% 开始找回（一健）
onMsg(?CMD_U2GS_RefindResAll, #pk_U2GS_RefindResAll{type = Type} = _PK) ->
	playerFindRes:refindResAll(Type),
	ok;

%%觉醒成长
onMsg(?CMD_U2GS_UpWakeInfo, #pk_U2GS_UpWakeInfo{}) ->
	ok;
%%	playerGoddess:upWake(CardID, Num);

%%觉醒升级
onMsg(?CMD_U2GS_UpGradeWakeInfo, #pk_U2GS_UpGradeWakeInfo{cardID = CardID}) ->
	playerGoddess:upGradeWake(CardID);
%%觉醒一键升级
onMsg(?CMD_U2GS_OnKeyUpWakeInfo, #pk_U2GS_OnKeyUpWakeInfo{cardID = CardID}) ->
	playerGoddess:onKeyUpWakeInfo(CardID);

onMsg(?CMD_U2GS_UnlockState, #pk_U2GS_UnlockState{cardID = CardID, state = State}) ->
	playerGoddess:unlockGoddessState(CardID, State);
onMsg(?CMD_U2GS_ChangeState, #pk_U2GS_ChangeState{cardID = CardID, state = State}) ->
	playerGoddess:changeGoddessState(CardID, State);
onMsg(?CMD_U2GS_CallGoddess, #pk_U2GS_CallGoddess{cardID = CardID}) ->
	playerGoddess:callGoddess(CardID);
onMsg(?CMD_U2GS_UnlockCard, #pk_U2GS_UnlockCard{cardID = CardID}) ->
	playerGoddess:unlockGoddess(CardID);

%% 请求排行榜
onMsg(?CMD_U2GS_RequestRank, #pk_U2GS_RequestRank{type = Type}) ->
	playerRank:sendRankInfo(Type),
	ok;

%% 请求排行榜上玩家的装备列表
onMsg(?CMD_U2GS_RequestPropList, #pk_U2GS_RequestPropList{type = Type, roleID = RoleID}) ->
	playerRank:sendPropList(Type, RoleID),
	ok;

%% 请求领取指定排行榜的奖励
onMsg(?CMD_U2GS_RequestRankAward, #pk_U2GS_RequestRankAward{type = Type}) ->
	playerRank:requestRankAward(Type),
	ok;

%% 请求领取更新资源奖励
onMsg(?CMD_U2GS_GetUpdateReward, #pk_U2GS_GetUpdateReward{count = Count}) ->
	playerUpdateReward:getUpdateReward(Count),
	ok;

%%玩家请求当前地图的等级
onMsg(?CMD_U2GS_GetMapLevel, #pk_U2GS_GetMapLevel{}) ->
	MapPid = playerState:getMapPid(),
	psMgr:sendMsg2PS(MapPid, noticeMapLevel, playerState:getGroupID()),
	ok;

%%玩家请求当前地图进入大区BOSS战位面
onMsg(?CMD_U2GS_EnterBossBattle, #pk_U2GS_EnterBossBattle{}) ->
%%	playerWorldBossWar:enterParallelUniverseRequest(),
	ok;

%%首领入侵 鼓舞
onMsg(?CMD_GS2U_WorldBossBuyBuff, #pk_GS2U_WorldBossBuyBuff{type = Type}) ->
	playerActivity:inspire(Type),
	ok;

%%玩家请求购买时装
onMsg(?CMD_U2GS_BuyFashion, #pk_U2GS_BuyFashion{fashionID = FashionID, time = BuySecond}) ->
	playerFashion:useDiamond4fashion(FashionID,BuySecond),
	ok;

%%玩家请求激活或者取消
onMsg(?CMD_U2GS_ActiveFashionSuit, #pk_U2GS_ActiveFashionSuit{fashionSuitID = SuitID, flag = Flag}) ->
	playerFashion:activeFashionSuit(SuitID, Flag),
	ok;

%%玩家请求穿卸时装
onMsg(?CMD_U2GS_OperateFashion, #pk_U2GS_OperateFashion{fashionID = FashionID, flag = Flag}) ->
	playerFashion:putOnAndOffClothes(FashionID, Flag),
	ok;

%%请求切磋
onMsg(?CMD_U2GS_BattleLearn, #pk_U2GS_BattleLearn{code = Code}) ->
	playerBattleLearn:requestBattleLearn(Code);

%%拒绝或者接受请求切磋
onMsg(?CMD_U2GS_BattleLearnAck, #pk_U2GS_BattleLearnAck{code = Code, result = Result}) ->
	playerBattleLearn:responseBattleLearn(Code, Result);

%%成就系统
%%领取成就值
onMsg(?CMD_U2GS_ReceiveAchieveValue, #pk_U2GS_ReceiveAchieveValue{achieveID = AchieveID}) ->
	playerAchieve:receiveAchieve(AchieveID),
	ok;

%%领取爵位等级奖励
onMsg(?CMD_U2GS_GetVipReward, #pk_U2GS_GetVipReward{vipLevel = VipLevel}) ->
	playerVip:getVipReward(VipLevel),
	ok;

%%锁定道具
onMsg(?CMD_U2GS_LockGoods, #pk_U2GS_LockGoods{goodsUID = GoodsUID, bagType = BagType}) ->
	playerPackage:lockGoods(GoodsUID, BagType);

%%绑定手机
onMsg(?CMD_U2GS_BindPhone, #pk_U2GS_BindPhone{funcellCilentID = FuncellCilentID, accessToken = AccToken, phoneNum = PhoneNum, verifyid = Verifyid, content = Content}) ->
	?ERROR_OUT("invalid msg CMD_U2GS_BindPhone"),
	playerSignIn:bindPhone(FuncellCilentID, AccToken, PhoneNum, Verifyid, Content);

onMsg(?CMD_BindPhoneAwardGet, #pk_BindPhoneAwardGet{}) ->
	?ERROR_OUT("invalid msg CMD_BindPhoneAwardGet"),
	playerSignIn:onBindPhoneAwardGet();

%%玩家上传照片
onMsg(?CMD_UpLoadingPhoto, #pk_UpLoadingPhoto{type = _Type, sectionNum = Num, sectionIndex = Index, data = Data}) ->
	playerPersonalityInfo:uploadingPhoto(Num, Index, Data);
%%给自己添加标签
onMsg(?CMD_U2GS_AddTag, #pk_U2GS_AddTag{tag = Tag}) ->
	playerPersonalityInfo:addTag(Tag);
%%删除标签
onMsg(?CMD_DelTag, #pk_DelTag{index = Index}) ->
	playerPersonalityInfo:delTag(Index);
%%给其他玩家添加印象
onMsg(?CMD_U2GS_AddImpression, #pk_U2GS_AddImpression{roleID = RoleID, impression = Impression}) ->
	playerPersonalityInfo:addImpression(RoleID, Impression);
%%删除其他玩家的印象
onMsg(?CMD_DelImpression, #pk_DelImpression{uid = Uid}) ->
	playerPersonalityInfo:delImpression(Uid);
%%点赞玩家
onMsg(?CMD_U2GS_AddPraise, #pk_U2GS_AddPraise{roleID = RoleID}) ->
	playerPersonalityInfo:addPraise(RoleID);
%%举报玩家
onMsg(?CMD_U2GS_Report, #pk_U2GS_Report{roleID = RoleID}) ->
	playerPersonalityInfo:reportPlayer(RoleID),
	skip;
%%添加拓展信息
onMsg(?CMD_U2GS_PlayerExtenInfo, #pk_U2GS_PlayerExtenInfo{type = Type, info = Info}) ->
	playerPersonalityInfo:addExtenInfo(Type, Info);
%%激活军团副本
onMsg(?CMD_ActiveGuildCopy, #pk_ActiveGuildCopy{mapID = MapID}) ->
	?DEBUG_OUT("ActiveGuildCopy"),
	playerGuildCopy:activeGuildCopy(MapID);
%%进入军团副本
onMsg(?CMD_U2GS_EnterGuildCopy, #pk_U2GS_EnterGuildCopy{mapID = MapID}) ->
	?DEBUG_OUT("EnterGuildCopy"),
	playerGuildCopy:enterGuildCopy(MapID);
%% 天赋凝练初始化
onMsg(?CMD_U2GS_TalentInit, #pk_U2GS_TalentInit{}) ->
	playerTalent:sendTalentInfoToClient(),
	ok;
%% 天赋凝练技能升级
onMsg(?CMD_U2GS_TalentLevelUp, #pk_U2GS_TalentLevelUp{id = ID}) ->
	playerTalent:talentLevelUp(ID),
	ok;
%% 勇士试炼初始化
onMsg(?CMD_U2GS_WarriorTrialInit, #pk_U2GS_WarriorTrialInit{}) ->
	playerWarriorTrial:sendWarriorTrialInfoToClient(),
	ok;
%% 勇士试炼挑战开始
onMsg(?CMD_U2GS_BeginWarriorTrial, #pk_U2GS_BeginWarriorTrial{}) ->
	?DEBUG_OUT("beginWarriorTrial"),
	playerWarriorTrial:beginWarriorTrial(),
	ok;
%% 勇士试炼扫荡开始
onMsg(?CMD_U2GS_SweepWarriorTrial, #pk_U2GS_SweepWarriorTrial{mapID = _MapID}) ->
	playerWarriorTrial:beginSweepMission(),
	ok;
%% 勇士试炼扫荡开始
onMsg(?CMD_U2GS_CompleteWarriorTrail, #pk_U2GS_CompleteWarriorTrail{mapID = MapID}) ->
	playerWarriorTrial:playerCompleteAllMissions(MapID),
	ok;

%%开始灵力冥想
onMsg(?CMD_U2GS_StartMeditation, #pk_U2GS_StartMeditation{istart = false}) ->
	playerOfflineExp:endMeditation(),
	ok;
onMsg(?CMD_U2GS_StartMeditation, #pk_U2GS_StartMeditation{istart = true}) ->
	playerOfflineExp:startMeditation(),
	ok;

%%领取玩家离线经验
onMsg(?CMD_U2GS_GetLeavedExp, #pk_U2GS_GetLeavedExp{getType = Type}) ->
	playerOfflineExp:getOfflineReward(Type),
	ok;

%%复制世界消息
onMsg(?CMD_U2GS_CopyChat, #pk_U2GS_CopyChat{}) ->
	%% 复制世界消息增加成就
	playerAchieve:achieveEvent(?Achieve_Social_Event3, [1]),
	ok;
%%改名
onMsg(?CMD_U2GS_ChangeName, #pk_U2GS_ChangeName{roleID = RoleID, name = Name}) ->
	RealName = string:strip(Name),
	?DEBUG_OUT("RoleID = ~p, Name = ~ts", [RoleID, RealName]),
	playerLogin:changeName(RoleID, RealName),
	ok;
%%神器升级
onMsg(?CMD_U2GS_LevelUpGodWeapon, #pk_U2GS_LevelUpGodWeapon{weaponID = WeaponID}) ->
	?DEBUG_OUT("LevelUpGodWeapon WeaponID = ~p", [WeaponID]),
	playerGodWeapon:levelupWeapon(WeaponID),
	ok;
%%%神器技能升级
%onMsg(?CMD_U2GS_LevelUpGodWeaponSkill, #pk_U2GS_LevelUpGodWeaponSkill{weaponID = WeaponID}) ->
%	?DEBUG_OUT("LevelUpGodWeaponSkill WeaponID = ~p", [WeaponID]),
%	playerGodWeapon:levelupWeaponskill(WeaponID),
%	ok;

%%幸运答题
onMsg(?CMD_U2GS_PlayerAnswerQuestion, #pk_U2GS_PlayerAnswerQuestion{questionID = QuestionID, answers = Answers}) ->
	playerAnswer:answerResult(QuestionID, Answers),
	ok;

%%刷新运营搞的兑换活动
onMsg(?CMD_U2GS_OperateExchangeRefresh, #pk_U2GS_OperateExchangeRefresh{}) ->
	psMgr:sendMsg2PS(?PsNameOperateExchange, refreshExchange, {playerState:getRoleID(), playerState:getNetPid()}),
	ok;
%%兑换运营搞的兑换活动
onMsg(?CMD_U2GS_OperateExchange, #pk_U2GS_OperateExchange{exchangeID = ExchangeID}) ->
	playerOperateExchange:exchange(ExchangeID),
	ok;

%%宠物远征领奖
onMsg(?CMD_U2GS_RequstReward, #pk_U2GS_RequstReward{}) ->
	playerPetPvE:petPveReward();

%%宠物远征位置调整
onMsg(?CMD_U2GS_StandSort, #pk_U2GS_StandSort{petList = PetList}) ->
	playerPetPvE:petPvePos(PetList);

%%宠物远征购买体力
onMsg(?CMD_U2GS_BuyPower, #pk_U2GS_BuyPower{}) ->
	playerPetPvE:petPvePhys();

%%宠物远征购战战斗
onMsg(?CMD_U2GS_RequestBattle, #pk_U2GS_RequestBattle{id = DunID}) ->
	playerPetPvE:petPveBattle(DunID);

%%宠物远征请求数据包
onMsg(?CMD_U2GS_RequestBattleAck, #pk_U2GS_RequestBattleAck{num = Num}) ->
	playerTurnBattle:sendBattleResList(Num);

%%宠物远征请求战斗结束
onMsg(?CMD_U2GS_RequestBattleEnd, #pk_U2GS_RequestBattleEnd{type = Type}) ->
	playerTurnBattle:sendRequestBattleEnd(Type);

%%宠物远征副本扫荡
onMsg(?CMD_U2GS_PetPveSweep, #pk_U2GS_PetPveSweep{id = ID}) ->
	playerPetPvE:petPveSweep(ID);

%%宠物争夺战信息获取
onMsg(?CMD_U2GS_PvpBattleInfo, #pk_U2GS_PvpBattleInfo{}) ->
	playerPetPvP:petPvpInit();

%%宠物争夺战宠物信息保存
onMsg(?CMD_U2GS_PvpPosSave, #pk_U2GS_PvpPosSave{petList = PL}) ->
	playerPetPvP:petPvpPos(PL);

%%宠物争夺战战斗
onMsg(?CMD_U2GS_RequestPvpBattle, #pk_U2GS_RequestPvpBattle{cityID = CityID, roleID = RoleID}) ->
	playerPetPvP:petPvpBattle(CityID, RoleID);

%%购买抢夺令
onMsg(?CMD_U2GS_BuyReel, #pk_U2GS_BuyReel{}) ->
	playerPetPvP:petPvpReel();

%%跨服混沌战场

%%请求战功
onMsg(?CMD_U2GS_RequestHDBattleExploits, #pk_U2GS_RequestHDBattleExploits{}) ->
	psMgr:sendMsg2PS(?PsNameCrosHd, getExploits, {playerState:getMapPid(), playerState:getNetPid()}),
	ok;

%%请求倒计时
onMsg(?CMD_U2GS_RequestHDBattleCD, #pk_U2GS_RequestHDBattleCD{}) ->
	psMgr:sendMsg2PS(?PsNameCrosHd, getCD, {playerState:getNetPid()}),
	ok;

%%请求进入战场
onMsg(?CMD_U2GS_RequestHDBattle, #pk_U2GS_RequestHDBattle{}) ->
	RoleID = playerState:getRoleID(),
	RankList = myEts:lookUpEts(?TABLE_RankInfo, ?PlayerRankType_FightingCapacity),
	Force = case lists:keyfind(RoleID, #recPlayerRank.roleID, RankList) of
				#recPlayerRank{value1 = Value} ->
					Value;
				_ ->
					playerPropSync:getProp(?PriProp_PetForce) + playerPropSync:getProp(?PriProp_PlayerForce)
			end,
	HistoryForce = playerPropSync:getProp(?SerProp_PlayerHistoryForce),
	case global:whereis_name(?PsNameCrosHd) of
		undefined ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_CrosBattle_AlreadyClose);
		_ ->
			psMgr:sendMsg2PS(?PsNameCrosHd, allocMapLine, {
				RoleID,
				playerState:getName(),
				self(),
				playerState:getNetPid(),
				playerState:getCareer(),
				gsMainLogic:getDBID4GS(),
				gsMainLogic:getAreaName(),
				Force,
				HistoryForce,
				playerState:getLevel()
			})
	end;

%%请求排行榜
onMsg(?CMD_U2GS_RequestCrosRanks, #pk_U2GS_RequestCrosRanks{}) ->
	L = ets:tab2list(rec_cros_rank),
	Fun = fun(#recCrosRank{} = R, Acc) ->
		PK = #pk_CrosBattleExploit{
			rankID = R#recCrosRank.rankID,
			roleID = R#recCrosRank.roleID,
			name = R#recCrosRank.name,
			servername = R#recCrosRank.sname,
			exploit = R#recCrosRank.record,
			career = R#recCrosRank.carrer,
			force = R#recCrosRank.force
		},
		[PK | Acc]
		  end,
	L1 = lists:foldl(Fun, [], L),
	playerMsg:sendNetMsg(#pk_GS2U_CrosBattleExploits{ranks = L1});


onMsg(?CMD_U2GS_ReceiveDailyActiveAward, #pk_U2GS_ReceiveDailyActiveAward{dailyActivityValue = LivenessValue}) ->
	playerliveness:onPlayerDrewLivenessGift(LivenessValue);

onMsg(?CMD_U2GS_CancelFastTeam, #pk_U2GS_CancelFastTeam{}) ->
%%	playerTeam2:cancelFastTeam(),
	ok;

%%跨服竞技场邀请玩家
onMsg(?CMD_U2GS_AddArenaTeamMember, #pk_U2GS_AddArenaTeamMember{id = ID}) ->
	playerCrosTeam:inviteFriend(ID),
	ok;

%%跨服竞技场玩家是否接受邀请
onMsg(?CMD_U2GS_AddArenaTeamMemberAck, #pk_U2GS_AddArenaTeamMemberAck{roleID = RoleID, result = Result}) ->
	playerCrosTeam:inviteAck(RoleID, Result),
	ok;

%%跨服竞技场删除组队
onMsg(?CMD_DeleteArenaTeamMember, #pk_DeleteArenaTeamMember{isMyself = IsMyself, id = ID}) ->
	playerCrosTeam:kick(IsMyself, ID),
	ok;

%%跨服竞技场组队准备
onMsg(?CMD_ArenaTeamMemberPrepare, #pk_ArenaTeamMemberPrepare{isPrepare = IsPrepare, id = ID}) ->
	playerCrosTeam:ready(IsPrepare, ID),
	ok;

%%跨服准备匹配
onMsg(?CMD_U2GS_ReadyArena, #pk_U2GS_ReadyArena{}) ->
	Level = playerState:getLevel(),
	case Level < 45 of
		true ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BagEquipOnPlayerLevelNotMeet);
		_ ->
			playerCrosTeam:readyMatch()
	end,
	ok;

%%跨服准备匹配
onMsg(?CMD_U2GS_StartArena, #pk_U2GS_StartArena{}) ->
	playerCrosTeam:startMatch(),
	ok;

%%跨服竞技场排行榜
onMsg(?CMD_U2GS_RequestCrosArenaRanks, #pk_U2GS_RequestCrosArenaRanks{type = 0}) ->
	L = ets:tab2list(?EtsCrosArenaRank),
	Fun = fun(#recCrosArenaRank{} = R, Acc) ->
		PK = #pk_CrosArenaBattleRank{
			rankID = R#recCrosArenaRank.rankID,
			roleID = R#recCrosArenaRank.roleID,
			name = R#recCrosArenaRank.name,
			servername = R#recCrosArenaRank.sname,
			arenaVal = R#recCrosArenaRank.record,
			career = R#recCrosArenaRank.carrer,
			force = R#recCrosArenaRank.force,
			win = 0,
			fail = 0
		},
		[PK | Acc]
		  end,
	L1 = lists:foldl(Fun, [], L),
	playerMsg:sendNetMsg(#pk_GS2U_CrosArenaBattleRanks{ranks = L1});
onMsg(?CMD_U2GS_RequestCrosArenaRanks, #pk_U2GS_RequestCrosArenaRanks{type = _}) ->
	L = ets:tab2list(?EtsCrosArenaHightRank),
	Fun = fun(#recCrosArenaHightRank{} = R, Acc) ->
		PK = #pk_CrosArenaBattleHighRank{
			roleID = R#recCrosArenaHightRank.roleID,
			name = R#recCrosArenaHightRank.name,
			servername = R#recCrosArenaHightRank.sname,
			arenaVal = R#recCrosArenaHightRank.record,
			career = R#recCrosArenaHightRank.carrer,
			force = R#recCrosArenaHightRank.force,
			time = R#recCrosArenaHightRank.time,
			win = 0,
			fail = 0
		},
		[PK | Acc]
		  end,
	L1 = lists:foldl(Fun, [], L),
	playerMsg:sendNetMsg(#pk_GS2U_CrosArenaBattleHighRanks{ranks = L1});

%%取消匹配
onMsg(?CMD_CrosArenaMatch, #pk_CrosArenaMatch{isMatch = false}) ->
	playerCrosTeam:cancelMatch();

onMsg(?CMD_U2GS_AcceptHolidayTask, #pk_U2GS_AcceptHolidayTask{}) ->
	playerHolidayTask:acceptHolidayTask(),
	ok;

onMsg(?CMD_U2GS_CommonditiesPush, #pk_U2GS_CommonditiesPush{}) ->
	playerLimitSales:onRequestPushInfo(),
	ok;

onMsg(?CMD_U2GS_BuyLimitSales, #pk_U2GS_BuyLimitSales{sku = Sku}) ->
	playerLimitSales:onRequestBuyItem(Sku),
	ok;

onMsg(?CMD_PlayerLevelReward, #pk_PlayerLevelReward{}) ->
	playerLevelReward:get_receive_reward_level(),
	ok;

onMsg(?CMD_U2GS_ReceivePlayerLevelReward, #pk_U2GS_ReceivePlayerLevelReward{} = R) ->
	playerLevelReward:receive_reward(R),
	ok;

onMsg(?CMD_U2GS_SignIn, #pk_U2GS_SignIn{}) ->
	?DEBUG_OUT("[DebugForSignIn] CMD_U2GS_SignIn"),
	playerDailySignIn:sign(),
	ok;

onMsg(?CMD_GetPlayerOnlineReward, #pk_GetPlayerOnlineReward{timeID = TimeID}) ->
	playerOnlineReward:get(TimeID),
	ok;

onMsg(?CMD_U2GS_AccuReward, #pk_U2GS_AccuReward{id = ID}) ->
	?DEBUG_OUT("[DebugForSignIn] CMD_U2GS_AccuReward"),
	playerDailySignIn:accuReward(ID),
	ok;

onMsg(?CMD_U2GS_UpSkill, #pk_U2GS_UpSkill{id = Id}) ->
	playerSkillLearn:upSkill(Id, 1),
	ok;

%% 七日任务
onMsg(?CMD_U2GS_QuerySevenMissionData, #pk_U2GS_QuerySevenMissionData{}) ->
	playerSevenDays:querySevenMissionData(),
	ok;

onMsg(?CMD_U2GS_SevenMissionCompletion, #pk_U2GS_SevenMissionCompletion{missionid = MissionID}) ->
	playerSevenDays:sevenMissionCompletion(MissionID),
	ok;

%% 天使投资
onMsg(?CMD_U2GS_QueryAngelInvestment, #pk_U2GS_QueryAngelInvestment{}) ->
	playerSevenDays:queryInvestment(),
	ok;

onMsg(?CMD_U2GS_AngelInvestment, #pk_U2GS_AngelInvestment{id = ID}) ->
	playerSevenDays:angelInvestmentBuy(ID),
	ok;

onMsg(?CMD_U2GS_AngelInvestmentGet, #pk_U2GS_AngelInvestmentGet{id = ID}) ->
	playerSevenDays:angelInvestmentGet(ID),
	ok;

%%
onMsg(?CMD_U2GS_QueryExpeditionMapInfo, #pk_U2GS_QueryExpeditionMapInfo{}) ->
	playerGuildExpedition:requestTotalInfo(),
	ok;

onMsg(?CMD_U2GS_QueryExpeditionGlobalMapInfo, #pk_U2GS_QueryExpeditionGlobalMapInfo{}) ->
	playerGuildExpedition:requestGlobalInfo(),
	ok;

onMsg(?CMD_U2GS_QueryExpeditionMapBattleInfo, #pk_U2GS_QueryExpeditionMapBattleInfo{mapid = MapID}) ->
	playerGuildExpedition:requestMapInfo(MapID),
	ok;

onMsg(?CMD_U2GS_ExpeditionBroadcastPos, #pk_U2GS_ExpeditionBroadcastPos{type = Type}) ->
	playerGuildExpedition:leaderBroadcastPos(Type),
	ok;

onMsg(?CMD_U2GS_QueryExpeditionFinalInfo, #pk_U2GS_QueryExpeditionFinalInfo{}) ->
	playerGuildExpedition:requestFinalInfo(),
	ok;

onMsg(?CMD_U2GS_GiveMeExpeditionRewardEverDay, #pk_U2GS_GiveMeExpeditionRewardEverDay{mapid = MapID}) ->
	playerGuildExpedition:requestGetExpeditionEverydayReward(MapID),
	ok;

onMsg(?CMD_U2GS_LotteryForTowerRandonAward, #pk_U2GS_LotteryForTowerRandonAward{} = Msg) ->
	playerLotteryForTower:random_award(Msg),
	ok;

onMsg(?CMD_U2GS_LotteryForTowerInfo, #pk_U2GS_LotteryForTowerInfo{} = Msg) ->
	playerLotteryForTower:flush_lottery_tower_info(Msg),
	ok;

onMsg(?CMD_U2GS_GoToExpMap, #pk_U2GS_GoToExpMap{} = _Msg) ->
	RoleBaseArgu = logicArguLib:getRoleBaseInfoArgu(),
	MapIdArgu = logicArguLib:getCurrentMapId(),
	logicLib:runLogicGroup(?LOGIC_GROUP_ID_ENTER_EXP_MAP, [RoleBaseArgu, MapIdArgu]),
	ok;

onMsg(?CMD_U2GS_get_lottery_sys_info, #pk_U2GS_get_lottery_sys_info{} = _Msg) ->
	lotterySys:flush_lottery_info_2_client(),
	ok;

onMsg(?CMD_U2GS_lottery_start, #pk_U2GS_lottery_start{type = LogicGroupID} = _Msg) ->

	?DEBUG_OUT("=========LogicGroupID========~p~n", [LogicGroupID]),
	RoleBaseArgu = logicArguLib:getRoleBaseInfoArgu(),
	LottertLogicGroupIDs = [?LOGIC_GROUP_LOTTERY_GOBLIN_FREE, ?LOGIC_GROUP_LOTTERY_GOBLIN_ONCE_PAY_MONEY,
		?LOGIC_GROUP_LOTTERY_GOBLIN_TEN_TIME_PAY_MONEY, ?LOGIC_GROUP_LOTTERY_TREASURE_FREE,
		?LOGIC_GROUP_LOTTERY_TREASURE_ONCE_PAY_MONEY, ?LOGIC_GROUP_LOTTERY_TREASURE_TEN_TIME_PAY_MONEY],
	case lists:member(LogicGroupID, LottertLogicGroupIDs) of
		true ->
			logicLib:runLogicGroup(LogicGroupID, [RoleBaseArgu]);
		false ->
			ok
	end,
	ok;
onMsg(?CMD_U2GS_Join_lsbattlefield, #pk_U2GS_Join_lsbattlefield{} = _Msg) ->
	playerLSBattlefield:join_active();
onMsg(?CMD_U2GS_get_action_point_info, #pk_U2GS_get_action_point_info{} = _Msg) ->
	NewValue = playerActionPoint:getActionPoint(),
	playerMsg:sendNetMsg(#pk_GS2U_action_point_info{value = NewValue});
onMsg(?CMD_U2GS_buy_action_point, #pk_U2GS_buy_action_point{} = _Msg) ->
	playerActionPoint:buyActionPoint();
onMsg(?CMD_U2GS_buy_action_count, #pk_U2GS_buy_action_count{copyMapID = CopyMapID}=_Msg) ->
	playerActivity:buyActionCount(CopyMapID);
onMsg(?CMD_U2GS_get_copy_map_destory_time, #pk_U2GS_get_copy_map_destory_time{} = _Msg) ->
	playerCopyMap:sendCopyMapDestroy2Client(),
	ok;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 身份证系统 begin

%% 请求身份证信息
onMsg(?CMD_U2GS_Identity_Request, #pk_U2GS_Identity_Request{id = IdentityID} = _Msg) ->
	%?DEBUG_OUT("[DebugForIdentity] CMD_U2GS_Identity_Request"),
	playerIdentity:queryIdentity(IdentityID),
	ok;

%% 编辑身份证信息_年龄
onMsg(?CMD_U2GS2U_IdentityEditAge, #pk_U2GS2U_IdentityEditAge{idi_age = Age} = _Msg) ->
	%?DEBUG_OUT("[DebugForIdentity] CMD_U2GS2U_IdentityEditAge"),
	playerIdentity:editIdentity(?IDIT_AGE, Age),
	ok;

%% 编辑身份证信息_生日
onMsg(?CMD_U2GS2U_IdentityEditBirth, #pk_U2GS2U_IdentityEditBirth{idi_birthmonth = Month, idi_birthday = Day} = _Msg) ->
	%?DEBUG_OUT("[DebugForIdentity] CMD_U2GS2U_IdentityEditBirth"),
	playerIdentity:editIdentity(?IDIT_BIRTH, {Month, Day}),
	ok;

%% 编辑身份证信息_星座
onMsg(?CMD_U2GS2U_IdentityEditZodiac, #pk_U2GS2U_IdentityEditZodiac{idi_zodiac = Zodiac} = _Msg) ->
	%?DEBUG_OUT("[DebugForIdentity] CMD_U2GS2U_IdentityEditZodiac"),
	playerIdentity:editIdentity(?IDIT_ZODIAC, Zodiac),
	ok;

%% 编辑身份证信息_血型
onMsg(?CMD_U2GS2U_IdentityEditBloodType, #pk_U2GS2U_IdentityEditBloodType{idi_bloodType = BloodType} = _Msg) ->
	%?DEBUG_OUT("[DebugForIdentity] CMD_U2GS2U_IdentityEditBloodType"),
	playerIdentity:editIdentity(?IDIT_BLOOD, BloodType),
	ok;

%% 编辑身份证信息_故乡
onMsg(?CMD_U2GS2U_IdentityEditHometown, #pk_U2GS2U_IdentityEditHometown{idi_hometown1 = Hometown1, idi_hometown2 = Hometown2} = _Msg) ->
	%?DEBUG_OUT("[DebugForIdentity] CMD_U2GS2U_IdentityEditHometown"),
	playerIdentity:editIdentity(?IDIT_HOMETOWN, {Hometown1, Hometown2}),
	ok;

%% 编辑身份证信息_所在地
onMsg(?CMD_U2GS2U_IdentityEditLocation, #pk_U2GS2U_IdentityEditLocation{idi_location1 = Location1, idi_location2 = Location2} = _Msg) ->
	%?DEBUG_OUT("[DebugForIdentity] CMD_U2GS2U_IdentityEditLocation"),
	playerIdentity:editIdentity(?IDIT_LOCATION, {Location1, Location2}),
	ok;

%% 编辑身份证信息_头像
onMsg(?CMD_U2GS2U_IdentityEditFace, #pk_U2GS2U_IdentityEditFace{idi_face = Face} = _Msg) ->
	%?DEBUG_OUT("[DebugForIdentity] CMD_U2GS2U_IdentityEditFace"),
	playerIdentity:editIdentity(?IDIT_FACE, Face),
	ok;

%% 编辑身份证信息_签名
onMsg(?CMD_U2GS2U_IdentityEditSign, #pk_U2GS2U_IdentityEditSign{idi_sign = Sign} = _Msg) ->
	%?DEBUG_OUT("[DebugForIdentity] CMD_U2GS2U_IdentityEditSign"),
	playerIdentity:editIdentity(?IDIT_SIGN, Sign),
	ok;

%% 添加标签
onMsg(?CMD_U2GS_IdentityEditTagAdd_Request, #pk_U2GS_IdentityEditTagAdd_Request{idi_listTag = Tags} = _Msg) ->
	%?DEBUG_OUT("[DebugForIdentity] CMD_U2GS_IdentityEditTagAdd_Request"),
	playerIdentity:editIdentity_Tags(true, Tags),
	ok;

%% 删除标签
onMsg(?CMD_U2GS_IdentityEditTagDel_Request, #pk_U2GS_IdentityEditTagDel_Request{idi_tag = Tag} = _Msg) ->
	%?DEBUG_OUT("[DebugForIdentity] CMD_U2GS_IdentityEditTagDel_Request"),
	playerIdentity:editIdentity_Tags(false, Tag),
	ok;

%% 上传图片请求_开始
onMsg(?CMD_U2GS_IdentityPicUploadBegin_Request, #pk_U2GS_IdentityPicUploadBegin_Request{md5 = MD5, size = Size, opType = OpType, pos = Pos} = _Msg) ->
	%?DEBUG_OUT("[DebugForIdentity] CMD_U2GS_IdentityPicUploadBegin_Request"),
	playerIdentity:editIdentity_Pics(OpType, MD5, Size, Pos),
	ok;

%% 上传图片请求_数据
onMsg(?CMD_U2GS_IdentityPicUploadData_Request, #pk_U2GS_IdentityPicUploadData_Request{md5 = MD5, count = Count, index = Index, data = Data} = _Msg) ->
	%?DEBUG_OUT("[DebugForIdentity] CMD_U2GS_IdentityPicUploadData_Request"),
	playerIdentity:picUpload({MD5, Count, Index, Data}),
	ok;

%% 下载图片请求_开始
onMsg(?CMD_U2GS_IdentityPicDownloadBegin_Request, #pk_U2GS_IdentityPicDownloadBegin_Request{md5 = MD5} = _Msg) ->
	%?DEBUG_OUT("[DebugForIdentity] CMD_U2GS_IdentityPicDownloadBegin_Request"),
	playerIdentity:picDownloadBegin({MD5}),
	ok;

%% 下载图片请求_继续
onMsg(?CMD_U2GS_IdentityPicDownloadContinue_Request, #pk_U2GS_IdentityPicDownloadContinue_Request{md5 = MD5} = _Msg) ->
	%?DEBUG_OUT("[DebugForIdentity] CMD_U2GS_IdentityPicDownloadContinue_Request"),
	playerIdentity:picDownloadContinue({MD5}),
	ok;

%% 请求角色图片
onMsg(?CMD_U2GS2U_RequestRoleHeadPic, #pk_U2GS2U_RequestRoleHeadPic{heads = Heads} = _Msg) ->
	%?DEBUG_OUT("[DebugForIdentity] CMD_U2GS_IdentityPicDownloadContinue_Request"),
	case playerIdentity:requestRoleHeadPic(Heads, []) of
		[] -> skip;
		List ->
			sendNetMsg(#pk_U2GS2U_RequestRoleHeadPic{heads = List})
	end,
	ok;

%% 身份证系统 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 新版好友系统 begin

%% 查询精简信息 0正式好友1临时好友2黑名单3申请列表
onMsg(?CMD_U2GS_Friend2SimpleList_Requets, #pk_U2GS_Friend2SimpleList_Requets{type = Type} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] CMD_U2GS_Friend2SimpleList_Requets"),
	playerFriend2:simple(Type),
	ok;

%% 搜索好友请求
onMsg(?CMD_U2GS_Friend2Search_Request, #pk_U2GS_Friend2Search_Request{name = Name} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] CMD_U2GS_Friend2Search_Request"),
	playerFriend2:search(Name),
	ok;

%% 推荐好友请求
onMsg(?CMD_U2GS_Friend2Recommend_Request, #pk_U2GS_Friend2Recommend_Request{sex = Sex, isNear = IsNear} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] CMD_U2GS_Friend2Recommend_Request"),
	playerFriend2:recommend(Sex, IsNear),
	ok;

%% 添加好友请求
onMsg(?CMD_U2GS_Friend2Add_Request, #pk_U2GS_Friend2Add_Request{id = ID} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] CMD_U2GS_Friend2Add_Request"),
	playerFriend2:add(ID),
	ok;

%% 从黑名单添加好友请求
onMsg(?CMD_U2GS_Friend2AddFromBlack_Reply, #pk_U2GS_Friend2AddFromBlack_Reply{id = ID, isAgreed = IsAgreed} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] CMD_U2GS_Friend2Add_Request"),
	case IsAgreed of
		true ->
			playerFriend2:addFromBlack(ID);
		_ ->
			skip
	end,
	ok;

%% 处理好友申请列表请求
onMsg(?CMD_U2GS_Friend2ApplicantUse_Request, #pk_U2GS_Friend2ApplicantUse_Request{id = ID, isAgreed = IsAgreed} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] CMD_U2GS_Friend2ApplicantUse_Request"),
	case IsAgreed of
		true ->
			playerFriend2:add(ID);
		_ ->
			playerFriend2:refuse(ID)
	end,
	ok;

%% 一键处理好友申请列表请求
onMsg(?CMD_U2GS_Friend2ApplicantUseOneKey_Request, #pk_U2GS_Friend2ApplicantUseOneKey_Request{isAgreed = IsAgreed} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] CMD_U2GS_Friend2ApplicantUseOneKey_Request"),
	playerFriend2:applyOneKey(IsAgreed),
	ok;

%% 删除好友请求
onMsg(?CMD_U2GS_Friend2Del_Request, #pk_U2GS_Friend2Del_Request{id = ID} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] CMD_U2GS_Friend2Del_Request"),
	playerFriend2:del(ID),
	ok;

%% 查询好友申请列表请求
onMsg(?CMD_U2GS_Friend2Applicant_Request, #pk_U2GS_Friend2Applicant_Request{page = Page} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] CMD_U2GS_Friend2Applicant_Request"),
	playerFriend2:queryList_Applicant(Page),
	ok;

%% 查询好友列表请求
onMsg(?CMD_U2GS_Friend2Formal_Request, #pk_U2GS_Friend2Formal_Request{page = Page} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] CMD_U2GS_Friend2Formal_Request"),
	playerFriend2:queryList_Formal(Page),
	ok;

%% 查询临时好友列表请求
onMsg(?CMD_U2GS_Friend2Temp_Request, #pk_U2GS_Friend2Temp_Request{page = Page} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] CMD_U2GS_Friend2Temp_Request"),
	playerFriend2:queryList_Temp(Page),
	ok;

%% 查询黑名单列表请求
onMsg(?CMD_U2GS_Friend2Black_Request, #pk_U2GS_Friend2Black_Request{page = Page} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] CMD_U2GS_Friend2Black_Request"),
	playerFriend2:queryList_Black(Page),
	ok;

%% 加入黑名单请求
onMsg(?CMD_U2GS_Friend2Ban_Request, #pk_U2GS_Friend2Ban_Request{id = ID} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] CMD_U2GS_Friend2Ban_Request"),
	playerFriend2:ban(ID, false),
	ok;

%% 移除最早的黑名单以拉黑指定角色
onMsg(?CMD_U2GS_Friend2BanWithUnban_Reply, #pk_U2GS_Friend2BanWithUnban_Reply{idUnban = IDUnban, idBan = IDBan, isAgreed = IsAgreed} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] CMD_U2GS_Friend2BanWithUnban_Reply"),
	case IsAgreed of
		true ->
			playerFriend2:banWithUnban(IDUnban, IDBan);
		_ ->
			skip
	end,
	ok;

%% 拉黑好友
onMsg(?CMD_U2GS_Friend2BanWithDel_Reply, #pk_U2GS_Friend2BanWithDel_Reply{id = ID, isAgreed = IsAgreed} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] CMD_U2GS_Friend2BanWithDel_Reply"),
	case IsAgreed of
		true ->
			playerFriend2:ban(ID, true);
		_ ->
			skip
	end,
	ok;

%% 黑名单满时拉黑好友
onMsg(?CMD_U2GS_Friend2BanWithUnbanAndDel_Reply, #pk_U2GS_Friend2BanWithUnbanAndDel_Reply{idUnban = IDUnban, idDel = IDDel, isAgreed = IsAgreed} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] CMD_U2GS_Friend2BanWithUnbanAndDel_Reply"),
	case IsAgreed of
		true ->
			playerFriend2:banWithUnbanAndDel(IDUnban, IDDel);
		_ ->
			skip
	end,
	ok;


%% 移除黑名单
onMsg(?CMD_U2GS_Friend2Unban_Request, #pk_U2GS_Friend2Unban_Request{id = ID} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] CMD_U2GS_Friend2Unban_Request"),
	playerFriend2:unban(ID),
	ok;

%% 周边功能
onMsg(?CMD_U2GS_Friend2FormalOP_Request, #pk_U2GS_Friend2FormalOP_Request{id = ID, opType = OpType} = _Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] CMD_U2GS_Friend2FormalOP_Request"),
	playerFriend2:formalOP(ID, OpType),
	ok;

%% 好友消息
onMsg(?CMD_U2GS_Friend2FormalChat_Request, #pk_U2GS_Friend2FormalChat_Request{} = Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] CMD_U2GS_Friend2FormalChat_Request"),
	playerFriend2:chat(Msg),
	ok;

%% 好友语音
onMsg(?CMD_U2GS_Friend2FormalChatVoice_Request, #pk_U2GS_Friend2FormalChatVoice_Request{} = Msg) ->
	%?DEBUG_OUT("[DebugForFriend2] CMD_U2GS_Friend2FormalChatVoice_Request"),
	playerFriend2:chat(Msg),
	ok;

%% 指定关系查询
onMsg(?CMD_U2GS_Friend2ForLook_Request, #pk_U2GS_Friend2ForLook_Request{id = ID}) ->
	%?DEBUG_OUT("[DebugForFriend2] CMD_U2GS_Friend2ForLook_Request"),
	playerFriend2:forLook(ID),
	ok;

%% 希望聊天
onMsg(?CMD_U2GS_Friend2WantChat_Request, #pk_U2GS_Friend2WantChat_Request{id = ID}) ->
	%?DEBUG_OUT("[DebugForFriend2] CMD_U2GS_Friend2WantChat_Request"),
	playerFriend2:wantChat(ID),
	ok;

%% 同步经纬度
onMsg(?CMD_U2GS_Friend2LBS_Request, #pk_U2GS_Friend2LBS_Request{longitude = Longitude, latitude = Latitude}) ->
	%?DEBUG_OUT("[DebugForFriend2] CMD_U2GS_Friend2LBS_Request Longitude:~p Latitude:~p", [Longitude, Latitude]),
	RoleID = playerState:getRoleID(),
	variant:setPlayerVariant(RoleID, ?Setting_PlayerVarReadOnly_RatLongitudeHT, erlang:trunc(Longitude * 100000)),
	variant:setPlayerVariant(RoleID, ?Setting_PlayerVarReadOnly_RatLatitudeHT, erlang:trunc(Latitude * 100000)),
	ok;

%% 新版好友系统 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 约会地下城 begin

%% 进入地图
onMsg(?CMD_U2GS_DateEnter_Request, #pk_U2GS_DateEnter_Request{id = ID} = _Msg) ->
	%?DEBUG_OUT("[DebugForDate] CMD_U2GS_DateEnter_Request ~p", [_Msg]),
	playerDate:enterTry(ID, false),
	ok;

%% 手动重置宝石阵请求
onMsg(?CMD_U2GS_DateLink_ResetGem_Request, #pk_U2GS_DateLink_ResetGem_Request{} = _Msg) ->
	%?DEBUG_OUT("[DebugForDate] CMD_U2GS_DataLink_ResetGem_Request"),
	playerDate:link_reshuffle(false),
	ok;

%% 宝石的选中与取消请求
onMsg(?CMD_U2GS_DateLink_Select_Request, #pk_U2GS_DateLink_Select_Request{x = X, y = Y, index = Index, isSelect = IsSelect} = _Msg) ->
	%?DEBUG_OUT("[DebugForDate] CMD_U2GS_DateLink_Select_Request ~p", [_Msg]),
	playerDate:link(Index, {X, Y}, IsSelect, 0),
	ok;

%% 放弃游戏
onMsg(?CMD_U2GS_DateLink_Giveup_Requset, #pk_U2GS_DateLink_Giveup_Requset{} = _Msg) ->
	%?DEBUG_OUT("[DebugForDate] CMD_U2GS_DateLink_Giveup_Requset ~p", [_Msg]),
	playerDate:link_giveup(true),
	ok;



%% 约会地下城 --- 推箱子 begin

%% 碰到箱子请求
onMsg(?CMD_U2GS_DatePushBox_Request, #pk_U2GS_DatePushBox_Request{code = Code, x = X, z = Z,isDelete = IsDelte} = _Msg) ->
	%?DEBUG_OUT("[DebugForDate] CMD_U2GS_DateLink_Select_Request ~p", [_Msg]),
	playerDate:touchBox(Code, {X, Z},IsDelte, 0),
	ok;
%% 约会地下城 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 材料副本 begin

onMsg(?CMD_U2GS_UpTower, #pk_U2GS_UpTower{dataID = DataID, type = Type}) ->
	playerMaterialCopy:updateTower(DataID, Type),
	ok;

%% 材料副本 begin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 金币副本 begin

%% 放弃游戏
onMsg(?CMD_U2GS_MoneyDungeonGiveup, #pk_U2GS_MoneyDungeonGiveup{} = _Msg) ->
	%?DEBUG_OUT("[DebugForMoneyDungeon] CMD_U2GS_MoneyDungeonGiveup ~p", [_Msg]),
	playerMoneyDungeon:giveup(),
	ok;

%% 手动下一波
onMsg(?CMD_U2GS_MoneyDungeonNext, #pk_U2GS_MoneyDungeonNext{} = _Msg) ->
	%?DEBUG_OUT("[DebugForMoneyDungeon] CMD_U2GS_MoneyDungeonNext ~p", [_Msg]),
	playerMoneyDungeon:next(),
	ok;

%% 金币副本 begin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 姻缘系统 begin

%% 查询好友列表（姻缘系统专供）
onMsg(?CMD_U2GS_Friend2FormalForMarriage_Request, #pk_U2GS_Friend2FormalForMarriage_Request{page = Page} = _Msg) ->
	playerMarriage:queryList_Formal(Page),
	ok;

%% 求婚请求
onMsg(?CMD_U2GS_MarriagePropose_Request, #pk_U2GS_MarriagePropose_Request{id = ID, item = Item, manifesto = Manifesto} = _Msg) ->
	playerMarriage:wantBuild(ID, Item, Manifesto),
	ok;

%% 被求婚者反馈
onMsg(?CMD_U2GS_MarriagePropose_Reply, #pk_U2GS_MarriagePropose_Reply{id = ID, isAgreed = IsAgreed} = _Msg) ->
	playerMarriage:beBuild(ID, IsAgreed),
	ok;

%% 离婚请求
onMsg(?CMD_U2GS_MarriageBreak_Request, #pk_U2GS_MarriageBreak_Request{isTeam = IsTeam} = _Msg) ->
	playerMarriage:break(IsTeam),
	ok;

%% 夫妻技能升级
onMsg(?CMD_U2GS_MarriageSkillUp_Request, #pk_U2GS_MarriageSkillUp_Request{cost = Cost, id = ID} = _Msg) ->
	playerMarriage:skillUp(Cost, ID),
	ok;

%% 婚戒升级
onMsg(?CMD_U2GS_MarriageRingUp_Request, #pk_U2GS_MarriageRingUp_Request{cost = Cost} = _Msg) ->
	playerMarriage:ringUp(Cost),
	ok;

%% 情缘任务_接受
onMsg(?CMD_U2GS_MarriageAcceptTask_Request, #pk_U2GS_MarriageAcceptTask_Request{} = _Msg) ->
	playerMarriageTask:acceptTask(),
	ok;

%% 情缘任务_提交
onMsg(?CMD_U2GS_MarriageSubmitTask_Request, #pk_U2GS_MarriageSubmitTask_Request{} = _Msg) ->
	playerMarriageTask:submitTask(),
	ok;

%% 姻缘系统 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 新版骑宠领地 begin

%% 查询自己的领地信息
onMsg(?CMD_U2GS_QueryTerritoryInfo_Request, #pk_U2GS_QueryTerritoryInfo_Request{} = _Msg) ->
	playerPetTerritory:queryTerritory(),
	ok;

%% 查询自己的攻防记录
onMsg(?CMD_U2GS_QueryTerritoryHistory_Request, #pk_U2GS_QueryTerritoryHistory_Request{attackOrDefense = AOD} = _Msg) ->
	playerPetTerritory:queryHistory(AOD),
	ok;

%% 开采请求
onMsg(?CMD_U2GS_TerritoryExploit_Request, #pk_U2GS_TerritoryExploit_Request{territoryID = TerritoryID, listPetID = ListPetID, cfgTime = CfgTime, cfgLevel = CfgLevel} = _Msg) ->
	playerPetTerritory:exploit(TerritoryID, ListPetID, CfgTime, CfgLevel),
	ok;

%% 搜索请求
onMsg(?CMD_U2GS_FindTerritory_Request, #pk_U2GS_FindTerritory_Request{roleID = RoleID} = _Msg) ->
	playerPetTerritory:search(RoleID),
	ok;

%% 掠夺请求
onMsg(?CMD_U2GS_TerritoryPlunder_Request, #pk_U2GS_TerritoryPlunder_Request{roleID = RoleID, territoryID = TerritoryID, listPetID = ListPetID} = _Msg) ->
	playerPetTerritory:plunder(RoleID, TerritoryID, ListPetID),
	ok;

%% 精力查询
onMsg(?CMD_U2GS_TerritoryVigor_Request, #pk_U2GS_TerritoryVigor_Request{} = _Msg) ->
	playerPetTerritory:queryVigor(),
	ok;

%% 新版骑宠领地 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

onMsg(?CMD_U2GS_MoneyTree, #pk_U2GS_MoneyTree{}) ->
	playerMoneyTree:giveMeMoney(),
	ok;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

onMsg(?CMD_U2GS_ChangeCarrer, #pk_U2GS_ChangeCarrer{newCareer = NewCareer} = _Msg) ->
	playerCareerChange:change(NewCareer),
	ok;

onMsg(?CMD_U2GS_NeedForSpeedJoin, #pk_U2GS_NeedForSpeedJoin{} = _Msg) ->
	playerNeedForSpeed:match();
onMsg(?CMD_U2GS_NeedForSpeedCollideRoadScoreLine, #pk_U2GS_NeedForSpeedCollideRoadScoreLine{collideScoreLineId = LineID} = _Msg) ->
	playerNeedForSpeed:collideScoreLine(LineID);
onMsg(?CMD_U2GS_NeedForSpeedCancel, #pk_U2GS_NeedForSpeedCancel{} = _Msg) ->
	playerNeedForSpeed:cancelMatch();
onMsg(?CMD_U2GS_NeedForSpeedQuite, #pk_U2GS_NeedForSpeedQuite{} = _Msg) ->
	playerNeedForSpeed:exitCompetition(playerState:getRoleID());

%%onMsg(?CMD_U2GS_NeedForSpeedCollideRoadBox, #pk_U2GS_NeedForSpeedCollideRoadBox{collideBoxId = BoxID} = _Msg) ->
%%	playerNeedForSpeed:collideRoadBox(BoxID);
onMsg(?CMD_U2GS_NeedForSpeedUseItem, #pk_U2GS_NeedForSpeedUseItem{itemID = ItemID, targetRoleIDList = TargetRoleIDList} = _Msg) ->
	playerNeedForSpeed:useItem(ItemID, TargetRoleIDList);
onMsg(?CMD_U2GS_save_current_guide_id, #pk_U2GS_save_current_guide_id{guideID = _CurrentGuideID}) ->
	ok;
onMsg(_Cmd, _Msg) ->
	?DEBUG_OUT("playerOtp receive socket undefined, cmd:~p msg:~p", [_Cmd, _Msg]),
	ok.


%% =================================================================
%% Internel Function
%% =================================================================

%% 获取#pk_GS2U_Error消息
-spec getErrorCodeMsg(ErrorCode :: uint(), Params :: list()) -> #pk_GS2U_Error{} | error.
getErrorCodeMsg(ErrorCode, Params) when erlang:is_list(Params) ->
	case lists:keyfind(ErrorCode, 1, ?ErrorCodeParams) of
		{ErrorCode, []} ->
			#pk_GS2U_Error{errorCode = ErrorCode, params = []};
		{ErrorCode, NeedParams} ->
			case erlang:length(Params) =:= erlang:length(NeedParams) of
				true ->
					RealParams = [to_string(Need, Term) || {Need, Term} <- lists:zip(NeedParams, Params)],
					#pk_GS2U_Error{errorCode = ErrorCode, params = RealParams};
				false ->
					?ERROR_OUT("not match params:code=~p,~p,~p", [ErrorCode, Params, misc:getStackTrace()]),
					#pk_GS2U_Error{errorCode = ?ErrorCode_SystemGatherSuccess, params = []}
			end;
		false ->
			?ERROR_OUT(" ==>　no this errorCode:~p,bt=~p", [ErrorCode, misc:getStackTrace()]),
			#pk_GS2U_Error{errorCode = ?ErrorCode_System_Error_Unknow, params = []}
	end;
getErrorCodeMsg(ErrorCode, Params) ->
	?ERROR_OUT("error params{~p:~p}", [ErrorCode, Params]),
	#pk_GS2U_Error{errorCode = ?ErrorCode_System_Error_Unknow, params = []}.

-spec to_string(i|d|u|s|f|l, int()|uint()|string()|float()) ->
	string().
to_string(i, Int) when erlang:is_integer(Int) ->
	misc:term_to_string(Int);
to_string(d, Int) ->
	to_string(i, Int);
to_string(u, Uint) when Uint >= 0 ->
	to_string(i, Uint);
to_string(l, Uint64) when Uint64 >= 0 ->
	to_string(i, Uint64);
to_string(s, Str) when erlang:is_list(Str) ->
	Str;
to_string(f, Float) when erlang:is_float(Float) ->
	misc:term_to_string(Float);
to_string(TermFlag, Term) ->
	?ERROR_OUT("param error, flag, Term{~p, ~p}~n~p", [TermFlag, Term, misc:getStackTrace()]).

