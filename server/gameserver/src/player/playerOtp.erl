%%
%%玩家逻辑进程

-module(playerOtp).
-author(zhongyuanwei).

-behaviour(myGenServer).

-include("setup.hrl").
-include("playerPrivate.hrl").
-include("../world/mapPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([start_link/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3,handle_exception/3]).

start_link(Param) ->
	myGenServer:start_link(?MODULE, Param, [{timeout,?Start_Link_TimeOut_ms}]).

init(Param) ->
	Code = codeMgr:makeCode(?CodeTypePlayer),
	?LOG_OUT("playerOtp init [~p] Code[~p] Param[~p]",[self(), Code, Param]),
	case Param of
		[NetPid] ->
			playerState:setNetPid(NetPid),

			%% 每分钟心跳一次，发送自己的在线信息给CS缓存
			erlang:send_after(?updateSelfInfoToMemCacheTick, self(), updateSelfInfoToMemCache),
			ok;
		[RoleID, rob_player_otp] ->
			playerState:setNetPid(self()),
			playerState:setRobRoleID(RoleID),
			ok
	end,

	playerState:setRunStep(?PlayerStateNone),
	playerState:setFirstEnterMap(),
	playerState:setPlayerCode(Code),
	playerState:setOffLineFlag( ?OffLineTypeNormal ),
	monsterInterface:init(),
	?LOG_OUT("playerOtp[~p] init ok",[self()]),
	{ok,{}}.

%% 同步通知玩家退出
handle_call({quit,{AccountID}}, _From, State) ->
	MyAccountID = playerState:getAccountID(),
	Return =
		if
			AccountID =:= MyAccountID ->
				try
					playerBase:onPlayerQuit(quit),
					notifyLoginServer()
				catch
					Mt:MErr ->
						E = erlang:get_stacktrace(),
						?ERROR_OUT("quit huanji fail[~p],strack:~p",[{Mt,MErr},E])
				end,
				{stop, normal, okay, State};
			true ->
				{reply, err, State}
		end,
	?LOG_OUT("old quit ~p[~p]",[Return,self()]),
	Return;

%%玩家充值，以前已经上来过，直接加钱，在cs上有副本(CS发过来)
handle_call({payToUser,#recRecharge{}=RechargeInfo}, _From,State) ->
	?LOG_OUT("recharge system user receive pay msg ,roleID=~w,orderid=~p",[playerState:getRoleID(),RechargeInfo#recRecharge.feOrderID]),
	R = playerRecharge:dealOnlineOrder(RechargeInfo),
	?LOG_OUT("recharge system pay to user end ,roleID=~w,orderid=~p,RechargeReturn=~p",[playerState:getRoleID(),RechargeInfo#recRecharge.feOrderID,R]),
	{reply,R,State};
handle_call({getDailyCount,{Type, ID}}, _From,State) ->
	Counter = playerDaily:getDailyCounter(Type, ID),
	{reply,Counter,State};
handle_call(_Request, _From, State) ->
	?DEBUG_OUT("=========unhandle info:===~p~n", [_Request]),
	{noreply, State}.

handle_cast(_Msg, State) ->

	{noreply, State}.

terminate(_Reason, _State) ->
	ok.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

handle_exception(Type,Why,State) ->
	case Why of
		{sendErrorBySocket,closed} ->
			?LOG_OUT("roleID[~p] socket closed,send error,exit",
				[playerState:getRoleID()]),
			{stop,quit,State};
		_ ->
			myGenServer:default_handle_excetion(Type, Why, State)
	end.

%% 玩家刚刚上线，秒钟之后保存一次玩家需要保存的公共可视属性
handle_info(tickSavePlayerSyncProp, State) ->
	playerPropSync:tickSavePlayerSyncProp(),
	{noreply, State};

%% 发送进程信息给CS
handle_info(updateSelfInfoToMemCache, State) ->
	%% 更新角色的关键数据
	playerRank:updatePlayerKeyInfo(),

	%% 更新一下自己的内存模型
	playerRank:updatePlayerDataInfo(),

	%% 每分钟心跳一次，发送自己的在线信息给CS缓存
	erlang:send_after(?updateSelfInfoToMemCacheTick, self(), updateSelfInfoToMemCache),
	{noreply, State};

%%type(robKickOut|gmKickOut)
handle_info({kickOutAccount, _Pid, { gmKickOut, _AccountID,CMDSerial}}, State) ->
	playerState:setOffLineFlag(?OffLineTypeGmKickOut),
	playerState:setGMKickoutCallBackPidAndCMDSerial({_Pid,CMDSerial}),

	?LOG_OUT("kickoutUser in playerOtp pid[~p],type[~p],callbackPid&CMDSerial[~p]",[self(),gmKickOut,{_Pid,CMDSerial}]),
	kickClient(playerState:getNetPid(), gmKickOut),
	{noreply, State};

%%type(robKickOut|gmKickOut)
handle_info({kickOutAccount, _Pid, {_FromUserPid, Type, _AccountID}}, State) ->
	playerState:setOffLineFlag(Type),

	?LOG_OUT("kickoutUser in playerOtp pid[~p],type[~p],netPid:~p",[self(),Type,playerState:getNetPid()]),
	kickClient(playerState:getNetPid(), Type),
	{noreply, State};

%% 设置下线标志
%% Type::(robKickOut|gmKickOut|normal|changeLine)
handle_info({setOffLineFlag, _Pid, {Type} }, State) ->
	playerState:setOffLineFlag(Type),
	{noreply, State};

%% 换线专用 ，同步call老服玩家进程（新服）
handle_info({checkAccountKeyAck, _Pid, {OldPlayerPid,IsOk, AccountID, Account,FgiFedId,PlatformAccountID, PlatformID}}, State) ->
	OldNode = erlang:node(OldPlayerPid),
	IsCanReach = lists:member(OldNode, erlang:nodes() ),
	case IsCanReach of
		true ->
			try
				okay = psMgr:call(OldPlayerPid, quit, {AccountID}, 1000*4),
				psMgr:sendMsg2PS(self(), checkAccountKeyAck, {IsOk, AccountID, Account,FgiFedId,PlatformAccountID, PlatformID})
			catch
				ErrType:Err ->
					?ERROR_OUT("newGS checkAccountKeyAck[~w]",[{ErrType,Err}])
			end;
		_ ->
			% node间网络断开；会有重连机制
			?LOG_OUT("newGS player old node network is can't reach[~p]",[OldNode])
	end,
	{noreply, State};

handle_info({checkAccountKeyAck, _Pid, {IsOk, AccountID, Account,{FgiID,FedID,PlatName}, PlatformAccountID, PlatformID}}, State) ->
	?LOG_OUT( "player[~p] checkAccountKeyAck AID[~p],ptUID:~ts,ptName:~ts,Ret:~p", [self(), AccountID,FedID,PlatName,IsOk] ),

	%RunStep = playerState:getRunStep(),
	FgiIdStr = case erlang:is_binary(FgiID) of
				   true ->
					   erlang:binary_to_list(FgiID);
				   _ ->
					   FgiID
			   end,
	FedIDStr = case erlang:is_binary(FedID) of
				   true ->
					   erlang:binary_to_list(FedID);
				   _ ->
					   FedID
			   end,

	PlatNameStr =
		case erlang:is_binary(PlatName) of
			true ->
				erlang:binary_to_list(PlatName);
			_ ->
				PlatName
		end,
	playerState:setFuncellInfo({FgiIdStr,FedIDStr,PlatNameStr}),
	playerState:setPlateformAccountID(PlatformAccountID),
	playerState:setPlateformID(PlatformID),
	%%?LOG_OUT("checkAccountKeyAck[~w] PlatformID[~ts],FgiIdStr[~ts],FedIDStr[~ts]",[IsOk,PlatformID,FgiIdStr,FedIDStr]),
	case IsOk of
		?GS_2_LS_CHECKACCOUNT_RESULT_SUCC ->
			playerMsg:sendBoxErrorCodeMsg( ?GS_2_LS_CHECKACCOUNT_RESULT_SUCC,"OK" ),
%% 			playerMsg:sendNetMsg(#pk_GS2U_LoginResult{result=?GS_2_LS_CHECKACCOUNT_RESULT_SUCC }),
%%			if
%%				RunStep =:= ?PlayerStateChangeLineAtNewLine ->
%%					?DEBUG_OUT("PlayerStateChangeLineAtNewLine"),
%%					timer:sleep(1500);
%%				true ->
%%					skip
%%			end,
			playerLogin:onLoadRoleList(AccountID),
			playerState:setAccount(Account),
			psMgr:sendMsg2PS(?PsNameLS, playerLoginSucc, {AccountID}),

			?LOG_OUT("request ACK login ok, accountID: ~p", [AccountID]);
		?GS_2_LS_CHECKACCOUNT_RESULT_NOTFOUND ->
			playerMsg:sendBoxErrorCodeMsg( ?GS_2_LS_CHECKACCOUNT_RESULT_NOTFOUND,"NOTFOUND" ),
			?LOG_OUT("request ACK login error, accountID: ~p", [AccountID]);
		?GS_2_LS_CHECKACCOUNT_RESULT_ONLINEGS ->
			playerMsg:sendBoxErrorCodeMsg( ?GS_2_LS_CHECKACCOUNT_RESULT_ONLINEGS,"ONLINEGS already" ),
			?LOG_OUT("request ACK logined , accountID: ~p deny", [AccountID]);
		?GS_2_LS_CHECKACCOUNT_RESULT_TIMEOUT ->
			playerMsg:sendBoxErrorCodeMsg( ?GS_2_LS_CHECKACCOUNT_RESULT_TIMEOUT,"TIMEOUT" ),
			?LOG_OUT("request ACK logined , accountID: ~p deny of timeout", [AccountID]);
		Other ->
			playerMsg:sendBoxErrorCodeMsg( Other,"LS deny" ),
			?LOG_OUT("checkAccountKeyAck Error[~p], accountID: ~p", [Other,AccountID])
	end,
	{noreply, State};

handle_info(tickPlayer,State) ->
	playerBase:tickPlayer(),
	playerMarriage:tick(),
	{noreply,State};

handle_info(delHate, State) ->
	HateList = playerState:getHateList(),
	Fun = fun(Hate) ->
		playerBattle:delHate(Hate)
		  end,
	lists:foreach(Fun, HateList),
	{noreply,State};

handle_info({stop_application,_Pid,{}},State) ->
	%%下面这句是在关服T人时，能在屏幕打印
	io:format("PlayerOtp:~p Player:~p ~p stop_application", [self(),playerState:getRoleID(),playerState:getName()]),
	erlang:send_after(1,self(),quit),
	{noreply,State};

%%玩家预充值数量
handle_info({checkCSHasAck,_Pid,AckData},State) ->
	?LOG_OUT("checkCSHasAck[~w] AckData[~p]",[playerState:getRoleID(),AckData]),
	playerRecharge:setMyPreRechargeAmount(AckData),
	{noreply,State};

%%领回玩家预充值币
handle_info({getMyPreRechargeAck,_Pid,AckData},State) ->
	?LOG_OUT("getMyPreRechargeAck[~w] AckData[~p]",[playerState:getRoleID(),AckData]),
	playerRecharge:getMyPreRecharge(AckData),
	{noreply,State};


%%%%玩家充值，第一次上来，在cs上以前没有(CS发过来)
%%handle_info({rechargeSend2LS,_Pid, #pk_U2GS_RequestRecharge{
%%															funcellAccessToken=AccToken,
%%															funcellCilentID=FuncellCilentID,
%%															funcellOrderID=FeOrderID
%%															}=Data },State) ->
%%	?LOG_OUT("rechargeSend2LS[~w] sendData[~p]",[playerState:getRoleID(),Data]),
%%	dbLog:sendSaveLogEventID(playerState:getRoleID(),playerState:getAccountID(),?RechargeEventOnSend2LS, time:getUTCNowSec(), FeOrderID),
%%	gsLSOtp:send2ls(rechargeCheck, {self(), AccToken, FuncellCilentID, FeOrderID}),%%等待ack
%%%% 	erlang:send_after(1000, self(), {test,AccToken, FuncellCilentID, FeOrderID}),
%%	{noreply,State};

%%%%玩家充值,LS验证后的结果
%%handle_info({rechargeCheckAck,_Pid,AckData},State) ->
%%	?LOG_OUT("rechargeCheckAck[~w] AckData[~p]",[playerState:getRoleID(),AckData]),
%%	AckDataStr = misc:term_to_string(AckData),
%%	dbLog:sendSaveLogEventID(playerState:getRoleID(),playerState:getAccountID(),?RechargeEventOnLSAck, time:getUTCNowSec(), AckDataStr),
%%	playerRecharge:dealRechargeCheckAck(AckData, State);
%%
%%%%玩家充值，以前已经上来过，直接加钱，在cs上有副本(CS发过来)
%%handle_info({rechargeDoIt,_Pid,#recRecharge{}=Data},State) ->
%%	?LOG_OUT("rechargeDoIt[~w] AckData[~p]",[playerState:getRoleID(),Data]),
%%	playerRecharge:dealEvenOrder(Data),
%%	{noreply,State};

handle_info(test,State) ->
	playerShop:resourceExchange(87, 2),
%% 	T = misc:rand(1,256),
%% 	?LOG_OUT("11111111111111111111111111111   --~p",[T]),
%% 	edb:writeRecord(new_rec_title,#rec_title{roleID = {playerState:getRoleID(),22},titleID =22}),
%% 	edb:writeRecord(new_rec_title,#rec_title{roleID = {playerState:getRoleID(),T},titleID =T}),
	{noreply,State};

%%玩家充值，以前加过币，不再加了，在cs上有副本(CS发过来)
handle_info({rechargeHasDone,_Pid,#recRecharge{}=Data},State) ->
	?LOG_OUT("rechargeHasDone[~w] AckData[~p]",[playerState:getRoleID(),Data]),
	playerRecharge:dealEvenDoneOrder(Data),
	{noreply,State};


%%帐号建角色时，领取帐号下的福利
%%包含发送世界等级相关的礼包
handle_info({afterGetAccountWelfare},State) ->
	AccountID = playerState:getAccountID(),
	gsSendMsg:sendMsg2DBServer(getAccountWelfare, AccountID, {AccountID,1}),
	?LOG_OUT("afterGetAccountWelfare ~p",[self()] ),
	playerRecharge:requestGetMyPreRecharge(),
	{noreply,State};


%%好友成就
handle_info({achieve_addfriend,_Pid,_TargetRoleID},State) ->
	playerAchieve:addFriendAchieve(),
	playerTask:updateTask(?TaskSubType_System, ?TaskSubType_System_Sub_Friend),
	{noreply,State};

%%帐号福利
handle_info({getAccountWelfareAck,_Pid,ItemListStr},State) ->
	case rfc4627:decode(ItemListStr) of
		{ok,ItemList,[]} ->
			Ret = systemMail:sendMail(ItemList, [playerState:getRoleID()],?ItemAccountWelfare, stringCfg:getString(accountWelfareMailTxt), stringCfg:getString(accountWelfareMailTxt), ""),
			?LOG_OUT("getAccountWelfareAck mail ret[~p]",[Ret]);
		_ ->
			?LOG_OUT("getAccountWelfareAck[~ts]",[ItemListStr])
	end,
	{noreply,State};

handle_info({netmsg,_Pid,{Cmd,Pk}},State) ->
	playerMsg:dealNetMsg(Cmd, Pk),
	{noreply,State};

handle_info({broadcast,_Pid,Pk},State) ->
	try
		playerMsg:sendNetMsg(Pk)
	catch _:Why ->
		?ERROR_OUT("error send msg[~p],Reason[~p]",[Pk,Why])
	end,
	{noreply,State};

handle_info({synAllActivityState,_Pid,Data},State) ->
	playerAcKingBattleAll:synAllActivityState(Data),
	{noreply,State};

handle_info(addBossBattleBuff, State) ->
	playerBuff:addBossBattleBuff(),
	{noreply, State};

%% 聊天消息
handle_info({chatmsg, SenderPid, {#pk_GS2U_Chatinfo{senderID = SenderID} = ChatInfo, SenderNetPid, IsCheck}}, State) ->
	case playerState:isFirstEnterMap() of
		true ->
			%%还没进入游戏，忽略聊天消息
			skip;
		_ ->
			%% 过滤黑名单的聊天消息（不限于私聊）
			case friend2State:isBlack(playerState:getRoleID(), SenderID) of
				true ->
					skip;
				_ ->
					playerChat:sendChatInfo(ChatInfo, SenderNetPid, SenderPid, IsCheck)
			end
	end,
	{noreply, State};

%% 更新变量
handle_info({sendVarChange2Client,_SenderPid,{Type,Index,Value}}, State) ->
	case Type of
		globalVar ->
			Msg = [#pk_VariantInfo{index = Index,value = Value}],
			playerMsg:sendNetMsg(#pk_Any_UpdateVariant{updateVariantList = Msg});
		globalBitVar ->
			Msg = [#pk_SwitchVariantInfo{bitIndex = Index,bitValue = Value}],
			playerMsg:sendNetMsg(#pk_Any_UpdateBitVariant{updateVariantList = Msg});
		_ -> skip
	end,
	{noreply, State};

handle_info({delayDealMsg, {Fun, Param}}, State) ->
	Fun(Param),
	{noreply,State};

handle_info({delProtect, _Pid, {}},State) ->
	playerBuff:delSpecBuff(?PkBuff),
	{noreply,State};

%%延时检查月卡,依赖变量与每日计数
handle_info(loginCheckMonthCard,State) ->
	playerMonthCard:sendEndTips(),
	playerMonthCard:getGiftMsg(),
	{noreply,State};

handle_info({killedMonster,_Pid,MonsterID}, State) ->
	case playerState:getIsPlayer() andalso playerState:getMapID() /= ?Ladder1v1MapID of
		true ->
			playerBattle:killedMonster(MonsterID);
		_ ->
			skip
	end,
	{noreply,State};

handle_info({teamKilledMonster,_Pid,MonsterID}, State) ->
	case playerState:getIsPlayer() of
		true ->
			playerTask:updateTask(?TaskSubType_Monster, MonsterID);
		_ ->
			skip
	end,
	{noreply,State};

handle_info({dropBykilledMonster,_Pid,{Code,MonsterID,MonsterLevel,MapPid}}, State) ->
	case playerState:getIsPlayer() of
		true ->
			playerBattle:dropByKilledMonster(Code,MonsterID,MonsterLevel,MapPid);
		_ ->
			skip
	end,
	{noreply,State};

%%活动掉落
handle_info({activityFeastBossDrop, _Pid, {}}, State) ->
	case playerState:getIsPlayer() of
		true ->
			[_, ItemID, ItemNum] = globalCfg:getAcArg(),
			?LOG_OUT("player [~p] execute activity feast boss drop itemID [~p]", [playerState:getRoleID(), ItemID]),
			Plog = #recPLogTSItem{
				old = 0,
				new = 1,
				change = 1,
				target = ?PLogTS_PlayerSelf,
				source = ?PLogTS_OperateAc,
				gold = 0,
				goldtype = 0,
				changReason = ?ItemSourceOperateAcItem,
				reasonParam = ItemID
			},
			playerPackage:addGoodsAndMail(ItemID, ItemNum, true, 0, Plog);
		_ ->
			skip
	end,
	{noreply,State};

%%杀死怪物后，自己获得的经验
handle_info({gainExpByKilledMonster,_Pid,MonsterID}, State) ->
	case playerState:getIsPlayer() of
		true ->
			playerBattle:gainExpByKilledMonster(MonsterID);
		_ ->
			skip
	end,
	{noreply,State};

%%杀死怪物后，队友获得的经验
handle_info({teamMemberGainExpByKilledMonster,_Pid,{MonsterID,Exp}}, State) ->
	case playerState:getIsPlayer() of
		true ->
			playerBase:addExp(Exp,?ExpSourceKillMonster,MonsterID);
		_ ->
			skip
	end,
	{noreply,State};

handle_info({addKillValue, _Pid, {IsFirst, TargetCode, TargetLevel, BossTargetCode}}, State) ->
	case playerState:getIsPlayer() of
		true ->
			playerRedName:addKv(IsFirst, TargetCode, TargetLevel, BossTargetCode);
		_ ->
			skip
	end,
	{noreply, State};

handle_info({addKillPlayer, _Pid, {TargetCode,BossTargetCode}}, State) ->
	case playerState:getIsPlayer() of
		true ->
			playerRedName:addKp(TargetCode,BossTargetCode);
		_ ->
			skip
	end,
	{noreply, State};
%%
handle_info({playerEnterGuildExpeditionRealAck, _Pid, Msg},State) ->
	playerGuildExpedition:playerEnterMapRealAck(Msg),
	{noreply,State};

handle_info({playerLeaveActivityMap, _Pid, Msg},State) ->
	playerGuildExpedition:playerLeaveMap(Msg),
	{noreply,State};

handle_info({addGuildExpeditionScore, _Pid, Msg},State) ->
	playerGuildExpedition:playerAddGuildExpeditionScore(Msg),
	{noreply,State};

handle_info({addGuildExpeditionBuff, _Pid, Msg},State) ->
	playerGuildExpedition:addGuildExpeditionGatherBuff(Msg),
	{noreply,State};

handle_info({requestGetExpeditionEverydayRewardAck, _Pid, Msg},State) ->
	playerGuildExpedition:requestGetExpeditionEverydayRewardAck(Msg),
	{noreply,State};

handle_info({beAttacked, Pid, {Code, #recBeAttack{} = BeAttack}},State) ->
	case codeMgr:isCodeType(?CodeTypePet, Code) of
		true ->
			monsterInterface:beAttack(Code, Pid, BeAttack);
		_ ->
			playerBattle:beAttack(Pid, BeAttack)
	end,
	{noreply,State};

handle_info({delHate,_Pid,{Code, Hate}}, State) ->
	case codeMgr:isCodeType(?CodeTypePet, Code) of
		true ->
			monsterInterface:delHate(Code, Hate);
		_ ->
			playerBattle:delHate(Hate)
	end,
	{noreply,State};

handle_info({addHate,_Pid,{Code,Hate}}, State) ->
	case codeMgr:isCodeType(?CodeTypePet, Code) of
		true ->
			monsterInterface:addHate(Code, Hate, false);
		_ ->
			playerBattle:addHate(Hate, false)
	end,
	{noreply,State};

handle_info({assistTrigger, _Pid, {Code, SkillID}}, State) ->
	case codeMgr:isCodeType(?CodeTypePet, Code) of
		true ->
			monsterInterface:assistTriggerSkill(Code, SkillID);
		_ ->
			playerSkill:assistTriggerSkill(SkillID)
	end,
	{noreply, State};

handle_info({killedTarget,_Pid,{AttackerCode, TargetCode, TargetLevel, Msg, X, Y, BossTargetCode}}, State) ->
	case codeMgr:isCodeType(?CodeTypePet, AttackerCode) of
		true ->
			monsterInterface:killedTarget(AttackerCode, TargetCode, TargetLevel, Msg, X, Y, BossTargetCode);
		_ ->
			playerBattle:killedTarget(TargetCode,TargetLevel, Msg, X, Y, BossTargetCode)
	end,
	{noreply,State};

%%技能效果返回结果
handle_info({attackRes,_Pid,{Code, AttackEffect, DamageMsg, RecEffect, ATD}},State) ->
	case codeMgr:isCodeType(?CodeTypePet, Code) of
		true ->
			monsterInterface:dealAttackRes(AttackEffect, RecEffect, ATD, DamageMsg);
		_ ->
			playerBattle:dealAttackRes(AttackEffect, RecEffect, ATD, DamageMsg)
	end,
	{noreply,State};

%%技能加血
handle_info({beTreat,_Pid,{Code, #recBeTreat{} = BeTreat, Hp_Per}},State) ->
	case codeMgr:isCodeType(?CodeTypePet, Code) of
		true ->
			monsterInterface:addTreat(Code, BeTreat, Hp_Per);
		_ ->
			playerBattle:addTreat(BeTreat, Hp_Per)
	end,
	{noreply,State};

%%清除Buff
handle_info({delBuff, _Pid,{Code, BuffID}}, State) ->
	case codeMgr:isCodeType(?CodeTypePet, Code) of
		true ->
			monsterInterface:delBuff(Code, BuffID);
		_ ->
			playerBuff:delBuff(BuffID)
	end,
	{noreply, State};

%%异步加buff
%%异步加buff
handle_info({addBuff, _Pid,{BuffID}}, State) ->
	playerBuff:addBuff(BuffID, playerState:getLevel()),
	{noreply, State};
handle_info({addBuff, _Pid,{Level, BuffID}}, State) ->
	playerBuff:addBuff(BuffID, Level),
	{noreply, State};

handle_info({addBuffWithCode, _Pid,{Level, BuffID, Caster}}, State) ->
	playerBuff:addBuffWithCasterCode(BuffID, Level, Caster),
	{noreply, State};

handle_info({dance_tick_addExp, _Pid, Data}, State) ->
	playerDance:dance_tick_addExp(Data),
	{noreply, State};

handle_info({selectDanceIDAck, _Pid, Data}, State) ->
	playerDance:selectDanceIDAck(Data),
	{noreply, State};

handle_info({breakDanceAck, _Pid, RoleID}, State) ->
	case playerState:getRoleID() of
		RoleID -> playerDance:breakDance(RoleID);
		RID ->
			?ERROR_OUT("breakDanceAck:self=~p,target=~p", [RID, RoleID])
	end,
	{noreply, State};

%%使用物品
handle_info({useItem, _Pid, {ItemID, Arg}}, State) ->
	case playerState:getIsPlayer() of
		true ->
			if
				ItemID =:= ?AcUseItemID ->
					playerAchieve:achieveEvent(?Achieve_Act_Event3, [1]);
				ItemID =:= ?AcUseItemID2 ->
					playerAchieve:achieveEvent(?Achieve_Act_Event8, [1]);
				true ->
					skip
			end,
			useItem(Arg);
		_ ->
			skip
	end,
	{noreply, State};

%处理获取角色列表的结果
handle_info({loadRoleListAck,_Pid,Account},State) ->
	playerLogin:onLoadRoleListAck(Account),
	{noreply,State};

%处理创建角色的结果
handle_info({createRoleAck,_Pid,Data},State) ->
	playerLogin:onCreateRoleAck(Data),
	{noreply,State};

%处理删除角色的结果
handle_info({deleteRoleAck,_Pid,{DeleteRoleInfo}},State) ->
	playerLogin:onDeleteRoleAck(DeleteRoleInfo),
	{noreply,State};

%处理获取角色数据的结果
handle_info({loadRoleAck,_Pid,Result},State) ->
	playerLogin:onLoadRoleDataAck(Result),

	case playerState:getIsPlayer() of
		true ->
			skip;
		_ ->
			playerRob:loadRobRoleDataAck(true)
	end,
	{noreply,State};

% 发送请求查询rp玩家对象属性
handle_info({queryRPViewInfo, PidFrom, Data}, State) ->
	playerRPView:queryRPViewInfo(PidFrom, Data),
	{noreply, State};

%% 请求进入地图的结果
handle_info({requestEnterMapAck, _Pid, Result}, State) ->
	playerScene:requestEnterMapAck(Result),
%%	playerCopyMap:enterMapHook(Result),
	{noreply, State};

%% 请求是否地图仍然存在的结果
handle_info({requestEnterMap_ByDirectAck, _Pid, Result}, State) ->
	playerScene:requestEnterMap_ByDirectAck(Result),
	{noreply, State};

%% 处理宠物进入地图
handle_info({enterMapAck, _Pid, {MapInfo, PetCode}}, State) ->
	monsterInterface:enterMap(MapInfo, PetCode),
	{noreply, State};

%% 处理进入地图结果
handle_info({enterMapAck, _Pid, Result},State) ->
%%	playerCopyMap:enterMapHook(Result),
	playerMap:dealEnterMapAck(Result),
	{noreply,State};

handle_info({'EnterMaterialCopyMap', _Pid, MapID}, State) ->
	playerMaterialCopy:enterCopyMap(MapID),
	{noreply, State};

handle_info({getMonsterPropAck, _Pid, List}, State) ->
	[PhysicalAttack,MagicAttack] = List,
	Str = io_lib:format("PhysicalAttack:~p,MagicAttack:~p", [PhysicalAttack,MagicAttack]),
	playerChat:onSystemChatMsg(Str),
	{noreply,State};

handle_info(waitClientEnteredMapTimeOut,State) ->
	%%如果超时则把玩家的状态设置为站立状态，让其可以由服务器切地图
	?LOG_OUT("role:~p handle waitClientEnteredMapTimeOut",[playerState:getRoleID()]),
	case playerState:getCurHp() > 0 of
		true ->
			playerState:setActionStatus(?CreatureActionStatusStand);
		_ ->
			playerState:setStandActionStatusFromDeadStatus()
	end,
	{noreply,State};

%% 请求采集结果
handle_info({requestGatherItemAck, _Pid, Result},State) ->
	playerGather:requestGatherItemAck(Result),
	{noreply,State};

%% 获取副本的最高分数结果
handle_info({getCopyMapHighestScoreAck, _Pid, Result},State) ->
	playerCopyMap:getCopyMapHighestScoreAck(Result),
	{noreply,State};

handle_info({gm_delayEnterCopyMap, CopyMapID}, State) ->
	?LOG_OUT("gm_delayEnterCopyMap:roleID:~p, copymapid=~p", [playerState:getRoleID(), CopyMapID]),
	playerCopyMap:enterCopyMap(CopyMapID),
	{noreply,State};

%% 组队副本创建成功
handle_info({teamCopyMapCreateSuccess, _Pid, Result},State) ->
	%% 延迟3秒钟告诉队友，副本创建成功
	erlang:send_after(3000, self(), {teamCopyMapCreateSuccess_Delay, Result}),
	{noreply,State};

%% 延迟3秒钟告诉队友，副本创建成功
handle_info({teamCopyMapCreateSuccess_Delay, Result},State) ->
	playerScene:teamCopyMapCreateSuccess(Result),
	{noreply,State};

%% 玩家第一次进入某个副本
handle_info({playerEnterCopyMapFirst, _Pid, Data},State) ->
	case playerState:getIsPlayer() of
		true ->
			playerCopyMap:playerEnterCopyMapFirst(Data);
		_ ->
			skip
	end,
	{noreply,State};

handle_info({kickCopyMapPlayer, _Pid, {}}, State) ->
	playerCopyMap:kickCopyMapPlayer(),
	{noreply, State};

handle_info({destoryMap_goonCopyMap_Ack, _Pid, Data}, State) ->
	playerCopyMap:destroyMap_goonCopyMap_Ack(Data),
	{noreply, State};

handle_info({darkness_kickCopyMapPlayer, _Pid, {}}, State) ->
	%% 发一句到聊天框
	Str = stringCfg:getString(darkness_choicepowertips),
	playerChat:onSystemChatMsg(Str),

	playerCopyMap:kickCopyMapPlayer(),
	{noreply, State};


%% 通知玩家继续进入约会地下城
handle_info({tryToOnlineEnterMap_date, _Pid, {Ret, DateActiveID,{NMapID, NX, NY}, {OMapID, OX, OY}}}, State) ->
	case Ret of
		false ->
			playerScene:onRequestEnterMap(OMapID, OX, OY);
		MapPid ->
			playerScene:onRequestEnterActivityMap(NMapID, MapPid,NX, NY)
	end,
	{noreply,State};

%% 通知玩家继续进入黑暗之地地图
handle_info({tryToOnlineEnterMap_darknessAck, _Pid, {Ret, {NMapID, NX, NY}, {OMapID, OX, OY}}}, State) ->
	case Ret of
		false ->
			playerScene:onRequestEnterMap(OMapID, OX, OY);
		MapPID ->
			playerScene:onRequestEnterActivityMap(NMapID, MapPID, NX, NY)
	end,
	{noreply,State};

%% 通知玩家继续进入准备间
handle_info({requestEnterDarkness_prepareAck, _Pid, TargetMapID}, State) ->
	playerScene:onRequestEnterActivityMap(TargetMapID, undefined),
	{noreply,State};

%% 同步黑暗之地阵营
handle_info({syncPlayerCampPubProp, _Pid, Camp}, State) ->
	playerPropSync:setInt(?PubProp_DarknessCamp, Camp),
	{noreply,State};

handle_info({playerEnterDarknessRealAck, _Pid, {Type, Camp}}, State) ->
	MapID = playerState:getMapID(),
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeDarknessReady} ->
			%% 改为玩家阵营
			playerState:setCamp(?CampPlayer, true),

			%% 和平模式
%%			playerPk:tranState(?CampPeace);
			%% 策划直接配置为和平地图
			ok;
		_ ->
			case Type of
				1 ->
					%% 改为玩家阵营
					playerState:setCamp(?CampPlayer, true),

					%% 杀戮模式
					playerPk:tranState(Camp);
				2 ->
					%% 红蓝双方PK
					case Camp of
						1 -> playerState:setCamp(?CampBlueBattle, true);
						_ -> playerState:setCamp(?CampRedBattle, true)
					end
			end
	end,

	%% 告诉他当前自己的阵营
	RoleID = playerState:getRoleID(),
	Msg =
		case edb:dirtyReadRecord(rec_darkness_ac_rank, RoleID) of
			[#rec_darkness_ac_rank{camp = CA, point = Point}] ->
				#pk_GS2U_DarknessCamp{camp = CA, integral = Point};
			_ ->
				#pk_GS2U_DarknessCamp{camp = 0, integral = 0}
		end,
	playerMsg:sendNetMsg(Msg),
	{noreply, State};

%% 魔能水晶发生改变
handle_info({addDarknessPebble, _Pid, Msg},State) ->
	case playerState:getIsPlayer() of
		true ->
			playerDarkness:addDarknessPebble(Msg);
		_ ->
			skip
	end,
	{noreply,State};

%% 自己增加黑暗战阶了，给队友也增加黑暗战阶
handle_info({addDarknessPointToTeam, Pid, StandPoint},State) ->
	case playerState:getIsPlayer() of
		true ->
			playerDarkness:addDarknessPointToTeam(Pid, StandPoint);
		_ ->
			skip
	end,
	{noreply,State};

handle_info({requestEnterGuildExpeditionMap, _Pid, {MapID, MapPID,TarPos}},State) ->
	case TarPos of
		{X, Y} ->
			playerScene:onRequestEnterActivityMap(MapID, MapPID, float(X), float(Y));
		_ ->
			playerScene:onRequestEnterActivityMap(MapID, MapPID)
	end,
	{noreply,State};

%% 通知玩家进入地图
handle_info({noticePlayerEnterMap, _Pid, {MapID, MapPID}}, State) ->
	#mapsettingCfg{type = MapType, subtype = SubType} = getCfg:getCfgPStack(cfg_mapsetting, MapID),
	#mapsettingCfg{type = NowMapType, subtype = NowSubType} = getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()),

	CanIN =
		if
			MapType =:= ?MapTypeActivity andalso SubType =:= ?MapSubTypeDarkness ->
				%% 目标是黑暗之地，则当前必须在黑暗之地才能进入
				NowMapType =:= ?MapTypeActivity andalso (NowSubType =:= ?MapSubTypeDarkness orelse NowSubType =:= ?MapSubTypeDarknessReady);
			true ->
				true
		end,

	case CanIN of
		true ->
			playerScene:onRequestEnterActivityMap(MapID, MapPID);
		_ ->
			skip
	end,
	{noreply, State};

%% 给玩家发送副本进度信息
handle_info({copymapProcess, _Pid, {#pk_GS2U_CopyMapProcess{} = R}}, State) ->
	playerMsg:sendNetMsg(R),
	{noreply, State};

%% 尝试触发副本特殊事件
handle_info({copymapSpecEvent, _Pid, Msg}, State) ->
	playerCopyMap:tryDoEvent(Msg),
	{noreply, State};

%% 提前展示变身的特殊处理
handle_info({special_experience_cow, _Pid, _Msg}, State) ->
	playerBuff:addBossBattleBuff(),
	{noreply, State};

handle_info({requestRiftNpcInfoAck, _Pid, Result}, State) ->
	playerCopyMapRift:requestRiftNpcInfoAck(Result),
	{noreply, State};

handle_info({inviteMemberToRift, _Pid, Result}, State) ->
	playerCopyMapRift:inviteMemberToRift(Result),
	{noreply, State};

%% 给玩家发送信息
handle_info({sendNetMsg, _Pid, {R}}, State) ->
	?DEBUG_OUT("sendNetMsg:~w", [R]),
	playerMsg:sendNetMsg(R),
	{noreply, State};

%% 给好友 传送坐标
handle_info({getTransferPos, FriendPid, _SkipInfo}, State) ->
	{PosX, PosY} = playerState:getPos(),
	GID = playerState:getGroupID(),
	case erlang:is_integer(GID) andalso GID > 0 of
		true ->
			psMgr:sendMsg2PS(FriendPid, getTransferPosAck, failed);
		_ ->
			?DEBUG_OUT("get friend transfer pos {~p, ~p}", [PosX, PosY]),
			psMgr:sendMsg2PS(FriendPid, getTransferPosAck, {playerState:getMapID(), PosX, PosY})
	end,
	{noreply, State};

handle_info({laterTransfer, NewMapID, PosX, PosY}, State) ->
	playerMap:onLaterTransferPosAck(NewMapID, PosX, PosY),
	{noreply, State};

%% 得到传送坐标， 传送
handle_info({getTransferPosAck, _Pid, failed}, State) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_VipTranmitFailed),  %% 不能传送到位面
	{noreply, State};
handle_info({getTransferPosAck, _Pid, {MapID, PosX, PosY}}, State) ->
	%% 只能传送到普通地图
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeNormal, playerEnter_MinLevel = LevelMin} ->
			%% 不能低于地图等级
			case playerState:getLevel() >= LevelMin of
				true ->
					case playerState:getMapID() of
						MapID ->
							%% 同地图时沿用原逻辑（客户端执行寻路前往）
							playerState:setVipLastTransmit(time:getSyncUTCTimeFromDBS()),
							Msg = #pk_GS2U_returnFriendPos{
								mapID   = MapID,
								x       = PosX,
								y       = PosY
							},
							playerMsg:sendNetMsg(Msg);
						_ ->
							%% 不同地图时将角色传送到目标地图的指定坐标
							playerScene:onRequestEnterMap(MapID, PosX, PosY)
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_VipTranmitLevelLimit)
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_VipTranmitFailed)
	end,
	{noreply, State};

%有新玩家进入视野
handle_info({notifyNewPlayerInView, PidFrom, Data},State) ->
	playerMap:notifyNewPlayerInView(PidFrom, Data),
	{noreply,State};

handle_info({notifyNewPlayerInViewAck, PidFrom, Data},State) ->
	playerMap:notifyNewPlayerInViewAck(PidFrom, Data),
	{noreply,State};

handle_info({parkDisappearPlayer, _PidFrom, Data},State) ->
	playerMap:parkDisappearPlayer(Data),
	{noreply,State};

handle_info({parkBroadcastMsg, _PidFrom, Data},State) ->
	playerScreen:parkBroadcastMsg(Data),
	{noreply,State};

%%
handle_info({'SendRedEnvelopeAck',_Pid,Data },State) ->
	playerRedEnvelope:sendRedEnvelopeAck(Data),
	{noreply,State};
handle_info({'RobRedEnvelopeAck',_Pid,Data },State) ->
	playerRedEnvelope:robRedEnvelopeAck(Data),
	{noreply,State};
handle_info({'NewRedEnvelopeReached',_Pid,Data },State) ->
	playerRedEnvelope:newRedEnvelopeReached(Data),
	{noreply,State};
%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
handle_info({otherInviteJoinTeam, _Pid, Msg}, State) ->
	playerTeam:otherInviteU(Msg),
	{noreply, State};
handle_info({leaveTeamAndEnterAck, _Pid, Msg}, State) ->
	playerTeam:leaveTeamAndEnterAck(Msg),
	{noreply, State};
handle_info({fastMatchTeam, _Pid, Msg}, State) ->
	playerTeam:fastMatchTeam(Msg),
	{noreply, State};
handle_info({leaderStartCopyMapNow, _Pid, Msg}, State) ->
	playerTeam:onReceivedLeaderStartCopyMap(Msg),
	{noreply, State};
handle_info({forceSychInfoToTeam, _Pid, _Msg}, State) ->
	playerTeam:syncInfo2Team(true),
	{noreply, State};
%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
%%成功新建队伍后(快速组队)
handle_info({addTeamAck, _BeInvitePid, {TeamID,MapID, quickTeam}}, State) ->
%%	playerState:setTeamID(TeamID),
%%	playerTeam2:afterAddTeamSuccess(TeamID,MapID),
	{noreply, State};

%%成功新建队伍后
handle_info({addTeamAck, _BeInvitePid, {TeamID,SelfRoleID, BeInviteID}}, State) ->
%%	playerState:setTeamID(TeamID),
%%	psMgr:sendMsg2PS(self(), addNewTeam, TeamID),
%%	playerTeam2:sendInviteToTeam(?PlayerTeamTypeNormal, SelfRoleID, BeInviteID),
	{noreply, State};

%%成功加入队伍后
handle_info({joinTeamMemberAck, _teamOtp, {TeamIDOrErrorCode,JoinSucess, BeInvitePid}}, State) ->
%%	case JoinSucess of
%%		true ->
%%			playerState:setTeamID(TeamIDOrErrorCode),
%%			psMgr:sendMsg2PS(BeInvitePid, addNewTeam, TeamIDOrErrorCode),
%%			ok;
%%		_ ->
%%			psMgr:sendMsg2PS(BeInvitePid,
%%				broadcast,
%%				#pk_GS2U_Error{errorCode = TeamIDOrErrorCode,
%%					params = []})
%%	end,
	{noreply, State};

%%没成员了，解散队伍
handle_info({disbandTeamAck, _teamPid, {Ret,TeamID,TeamType}}, State) ->
%%	?DEBUG_OUT("disbandTeamAck ~p",[{Ret,TeamID,TeamType}]),
%%	case Ret of
%%		ok ->
%%			%% 删除自己的队伍ID
%%			playerTeam2:delTeamID(TeamType),
%%			%% 通知客户端队伍已解散
%%			playerMsg:sendNetMsg(#pk_GS2U_TeamDisbanded{teamType = TeamType}),
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_TeamDissolved);
%%		_ ->
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_TeamErrorOperate)
%%	end,
	{noreply, State};

%% 组队同意邀请
handle_info({agreeInvite, BeInvitePid, {TeamType, MemberInfo}}, State) ->
%%	playerTeam2:agreeInviteToTeam(TeamType, BeInvitePid, MemberInfo),
	{noreply, State};

handle_info({agreeJoin, LeaderPid, {TeamType, TeamID}}, State) ->
%%	playerTeam2:agreeJoinToTeam(TeamType, LeaderPid, TeamID),
	{noreply, State};

handle_info({beInviteToTeam, Pid, {TeamType, InviterID, InviterName}}, State) ->
%%	playerTeam2:beInviteToTeam(TeamType, Pid, InviterID, InviterName),
	{noreply, State};
%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
handle_info({beJoinToTeam, JoinerPid, {TeamType, JoinerID, JoinerName}}, State) ->
%%	playerTeam2:beJoinToTeam(TeamType, JoinerPid, JoinerID, JoinerName),
	{noreply, State};

%% 新的队伍信息
handle_info({addNewTeam, _Pid, TeamID}, State) ->
%%	playerTeam2:addNewTeam(TeamID),
	{noreply, State};

%% 新的队友
handle_info({addNewTeamMember, _Pid, {TeamType, MemberID}}, State) ->
%%	playerTeam2:addNewTeamMember(TeamType, MemberID),
	{noreply, State};

%% 有队友被T（）
handle_info({kickMember, _Pid, {TeamType, TeamID, KickMemberID}}, State) ->
%%	playerTeam2:kickTeamMemberAck(TeamType, TeamID, KickMemberID),
	{noreply, State};

%% 队伍解散
handle_info({teamDisbanded, _Pid, {TeamType, TeamID, LeaveMemberRoleID}}, State) ->
%%	playerTeam2:disbandTeamAck(TeamType, TeamID, LeaveMemberRoleID),
	{noreply, State};

%% 队伍解散
handle_info({onDisbandSysTeam, _Pid, _TeamID}, State) ->
	%%					fixme 军团多人本
%%	playerTeam:onDisbandSysTeam(TeamID),
	{noreply, State};
%% 有玩家快捷加入的回应
handle_info({quickJoin, BeInvitePid, MemberInfo}, State) ->
%%	playerTeam2:quickJoinAck(BeInvitePid, MemberInfo),
	{noreply, State};

handle_info({serverTest_playerTransferPos, _Pid, Data}, State) ->
	playerServerTest:serverTest_playerTransferPos(Data),
	{noreply, State};

handle_info({serverTest_Perform, _Pid, Data}, State) ->
	playerServerTest:serverTest_Perform(Data),
	{noreply, State};

%% 自己离开队伍时离开副本
handle_info({leaveCopyMap, _Pid, {}}, State) ->
	playerCopyMap:leaveCopyMap(),
	{noreply, State};

handle_info({resetCopyMapAck, _Pid, Ret}, State) ->
	playerCopyMap:resetCopyMapAck(Ret),
	{noreply, State};

%% 副本奖励
handle_info({copyMapReward, _Pid, {Score, MapID}}, State) ->
	case playerState:getIsPlayer() of
		true ->
			playerCopyMap:onPassCopyMap(Score, MapID);
		_ ->
			skip
	end,
	{noreply, State};

handle_info({tickdelay_completeNormalCopyMap, Data}, State) ->
	case playerState:getIsPlayer() of
		true ->
			playerCopyMap:completeNormalCopyMap(Data);
		_ ->
			skip
	end,
	{noreply, State};

handle_info({tickdelay_completeNormalCopyMap_not_award, Data}, State) ->
	case playerState:getIsPlayer() of
		true ->
			playerCopyMap:completeNormalCopyMap_Not_Reward(Data);
		_ ->
			skip
	end,
	{noreply, State};

handle_info({completeMaterialCopyMap, _Pid, {Score, CopyState, CopyMapID, MC, FC, ?MapSubTypeMaterial}}, State) ->
	playerCopyMapReward:onPassCopyMap_Material(Score, CopyState, CopyMapID, MC, FC),
	{noreply, State};

handle_info({startMaterialChapter, _Pid, {_MapID, Chapter}}, State) ->
	playerMaterialCopy:onChapterStart(Chapter),
	{noreply, State};

%% 发送邮件结果
handle_info({updateSelfMail, _Pid, {Ret}}, State) ->
	playerMail:updateSelfMail(Ret),
	{noreply, State};

handle_info({receiveNewMail, _Pid, Data}, State) ->
	playerMail:receiveNewMail(Data),
	{noreply, State};

handle_info({readMailAck, _Pid, {Ret}}, State) ->
	playerMail:readMailAck(Ret),
	{noreply, State};

handle_info({lockMailAck, _Pid, {Ret}}, State) ->
	playerMail:lockMailAck(Ret),
	{noreply, State};

handle_info({unlockMailAck, _Pid, {Ret}}, State) ->
	playerMail:unlockMailAck(Ret),
	{noreply, State};

%% 删除邮件结果
handle_info({deleteMailAck, _Pid, {Ret}}, State) ->
	playerMail:deleteMailAck(Ret),
	{noreply, State};

%% 重置dailycounter
handle_info({resetPlayerDailyCounter, _Pid, _NowTime}, State) ->
	playerDaily:resetDailyCount(),
	playerliveness:cleanPlayerLivenessInfo(),
	%playerGuildHome:resetGuildHomeTask(),
	playerHolidayTask:resetPlayerHolidayTask(),
	playerDrop:resetDrop(),
	%% 重置签到状态
	%%playerDailySignIn:reset(), 不在每日凌晨4点重置，统一改为凌晨0点重置
	playerOnlineReward:reset(),
	%% 重置情缘任务
	playerMarriageTask:resetTask(true),
	{noreply, State};

%% 凌晨0点重置
handle_info({resetPlayerDailyCounter0, _Pid, _NowTime}, State) ->
	playerDailySignIn:reset(),
	{noreply, State};

%%增加召唤载体信息
handle_info({addCarrierInfo, _Pid, {_CasterCode, ID, Code, Pid}}, State) ->
	playerEffect:addCallInfo(?SpawnCarrier, Code, ID, Pid),
	{noreply, State};

%%删除召唤载体信息
handle_info({delCarrierInfo, _Pid, {CasterCode, Code}}, State) ->
	playerEffect:delCallInfo(?SpawnCarrier, Code, CasterCode),
	{noreply, State};

%%增加召唤怪物信息
handle_info({addMonsterInfo, _Pid, {_CasterCode, ID, Code, Pid}}, State) ->
	playerEffect:addCallInfo(?SpawnMonster, Code, ID, Pid),
	{noreply, State};

%%删除召唤怪物信息
handle_info({delMonsterInfo, _Pid, {CasterCode, Code}}, State) ->
	playerEffect:delCallInfo(?SpawnMonster, Code, CasterCode),
	{noreply, State};

handle_info({convoyFailedCallBack, _Pid, Data}, State) ->
	playerConvoy:convoyFailedCallBack(Data),
	{noreply, State};
handle_info({convoSucess, _Pid, Data}, State) ->
	playerConvoy:convoySuccess(Data),
	{noreply, State};

handle_info({player_guildRewardAck, _Pid, Data}, State) ->
	%playerGuildHome:player_guildRewardAck(Data),
	{noreply, State};

handle_info({createHomeAck, _Pid, Data}, State) ->
	playerHome:createHomeAck(Data),
	{noreply, State};

handle_info({enterHomeAck, _Pid, Data}, State) ->
	playerHome:enterHomeAck(Data),
	{noreply, State};

handle_info({plantFailed, _Pid, Msg}, State) ->
	homePlantLogic:plantFailed(Msg),
	{noreply, State};

handle_info({plantSuccess, _Pid, Msg}, State) ->
	playerHomePlant:plantSuccess(Msg),
	{noreply, State};

handle_info({home_Farming_addExp, _Pid, Msg}, State) ->
	playerHomeFarming:farming_tick_addExp(Msg),
	{noreply, State};

handle_info({zooFoodSuccess, _Pid, Msg}, State) ->
	playerHomeFarming:zooFoodSuccess(Msg),
	{noreply, State};

%% 有人创建公会成功
handle_info({createGuildSuccess, _Pid, Results}, State) ->
	playerGuild:createGuildSuccess(Results),
	{noreply, State};

%% 公会被解散
handle_info({deleteGuildAck, _Pid, Results}, State) ->
	playerGuild:deleteGuildAck(Results),
	{noreply, State};

handle_info({addguildresourceAck, _Pid, Data}, State) ->
	playerGuild:addguildresourceAck(Data),
	{noreply, State};

handle_info({guildbattleend_changetranstate, _Pid, PPState}, State) ->
	playerPk:tranState(PPState),
	{noreply, State};

handle_info({guildBattleEndPlayerReward, _Pid, Data}, State) ->
	playerGuildBattle:guildBattleEndPlayerReward(Data),
	{noreply, State};

handle_info({guildWarCannonHit, _Pid, Str}, State) ->
	%% 特殊处理这个
	playerState:setCurHp(0),
	playerBattle:onDead(0, undefined, ?ObjTypeMonster, Str, 0),
	{noreply, State};

handle_info({synsOpenState, _Pid, {Flag, Time}}, State) ->
	playerGuildCopy:onSynsOpenState(Flag, Time),
	{noreply, State};
%%军团副本结束了
handle_info({copyMapOver, _Pid, OverTime}, State) ->
	playerGuildCopy:onCopyMapOver(OverTime),
	{noreply, State};

handle_info({leaderCreateGuildCopyMapAck, _Pid, Msg}, State) ->
	playerGuildCopy:activeGuildCopyAck(Msg),
	{noreply, State};

handle_info({recruitPlayer, _Pid, Results}, State) ->
	playerGuild:recruitPlayer(Results),
	{noreply, State};

handle_info({recruitPlayerAck, _Pid, Results}, State) ->
	playerGuild:recruitPlayerAck(Results),
	{noreply, State};

handle_info({agreeRecruitAck, _Pid, Results}, State) ->
	playerGuild:agreeRecruitAck(Results),
	{noreply, State};

handle_info({dealRequestJoinAck, _Pid, Results}, State) ->
	playerGuild:dealRequestJoinAck(Results),
	{noreply, State};

handle_info({joinGuildAck, _Pid, Results}, State) ->
	playerGuild:joinGuildAck(Results),
	{noreply, State};

handle_info({exitGuildAck, _Pid, Results}, State) ->
	playerGuild:exitGuildAck(Results),
	{noreply, State};

handle_info({kickGuildAck, _Pid, Results}, State) ->
	playerGuild:kickGuildAck(Results),
	{noreply, State};

handle_info({giveGuildPowerAck, _Pid, Results}, State) ->
	playerGuild:giveGuildPowerAck(Results),
	{noreply, State};

handle_info({guildPowerLevelChange, _Pid, Results}, State) ->
	playerGuild:guildPowerLevelChange(Results),
	{noreply, State};

handle_info({changeGuildNoticeAck, _Pid, Results}, State) ->
	playerGuild:changeGuildNoticeAck(Results),
	{noreply, State};

handle_info({changeDenoterAck, _Pid, Results}, State) ->
	playerGuild:changeDenoterAck(Results),
	{noreply, State};

handle_info({changeLeaderAck, _Pid, Results}, State) ->
	playerGuild:changeLeaderAck(Results),
	{noreply, State};

handle_info({guildLevelUp, _Pid, Results}, State) ->
	playerGuild:guildLevelUp(Results),
	{noreply, State};

handle_info({shopUpgradeAck, _Pid, Results}, State) ->
	playerGuild:shopUpgradeAck(Results),
	{noreply, State};

handle_info({noticeGuildApplyNumber, _Pid, Data}, State) ->
	playerGuild:noticeGuildApplyNumber(Data),
	{noreply, State};

handle_info({applyGuildBattleAck, _Pid, Results}, State) ->
	playerGuildBattle:applyGuildBattleAck(Results),
	{noreply, State};

handle_info({enterGuildBattleAck, _Pid, Results}, State) ->
	playerGuildBattle:enterGuildBattleAck(Results),
	{noreply, State};

handle_info({guildChatNotice, _Pid, Results}, State) ->
	playerGuild:guildChatNotice(Results),
	{noreply, State};

handle_info({joinGuildWarBiddingAck, _Pid, Results}, State) ->
	playerGuildWar:joinGuildWarBiddingAck(Results),
	{noreply, State};
handle_info({researchGuildSkillAck, _Pid, Results}, State) ->
	playerGuildSkillAndBuff:researchGuildSkillAck(Results),
	{noreply, State};
handle_info({removeModifyGuildSkill, _Pid, Results}, State) ->
	playerGuildSkillAndBuff:removeModifyGuildSkill(Results),
	{noreply, State};

handle_info({guild_upgrade, _Pid, _GuildLevel}, State) ->
	playerGuild:exchange_refresh_all(),
	{noreply, State};
handle_info({guild_join, _Pid, _GuildLevel}, State) ->
	playerGuild:exchange_refresh_all(),
	playerTask:updateTask(?TaskSubType_System, ?TaskSubType_System_Sub_Guild),
	{noreply, State};
handle_info({guild_suppGiveAck, _Pid, Msg}, State) ->
	playerGuild:suppGiveAck(Msg),
	{noreply, State};
handle_info({oneKeyRecruitAck, _Pid, _GuildLevel}, State) ->
	playerGuild:oneKeyRecruitAck(),
	{noreply, State};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 家族系统-堆雪人活动 begin

%% 活动开始提示
handle_info({snowman_beginNotice, _Pid, _Msg}, State) ->
	playerGuildSnowman:beginNotice(),
	{noreply, State};

%% 进入反馈
handle_info({snowman_enterTryAck, _Pid, Msg}, State) ->
	playerGuildSnowman:enterTryAck(Msg),
	{noreply, State};

%% 捐赠反馈
handle_info({snowman_donateAck, _Pid, Msg}, State) ->
	playerGuildSnowman:donateAck(Msg),
	{noreply, State};

handle_info({snow_settle, _Pid, Data}, State) ->
	playerGuildSnowman:snow_settle(Data),
	{noreply, State};

handle_info({snowManConvertCoin, _Pid, Data}, State) ->
	playerGuildSnowman:convertCoin(Data),
	{noreply, State};

handle_info({snowManConvertItem, _Pid, Data}, State) ->
	playerGuildSnowman:convertItem(Data),
	{noreply, State};

%% 家族系统-堆雪人活动 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 家族系统-游乐场 begin

%% 添加BUFF
handle_info({guildFairground_rideBuff, _Pid, Msg}, State) ->
	playerGuildFairground:onReward(Msg),
	{noreply, State};

%% 乘坐行为失败的反馈，用于返还次数与货币
handle_info({guildFairground_rideAck, _Pid, Msg}, State) ->
	playerGuildFairground:useRideAck(Msg),
	{noreply, State};

%% 刷新设备状态
handle_info({guildFairground_rideRefresh, _Pid, _Msg}, State) ->
	playerGuildFairground:callbackEnter(),	%% 等同于进入游乐场时初始化设备状态
	{noreply, State};

%% 家族系统-游乐场 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 商城商品
handle_info({getItemAtMallAck, _Pid, {_MallGoodsInfo}}, State) ->
	%%playerMall:getItemAtMallAck(MallGoodsInfo),
	{noreply, State};

handle_info({add2ChatDenyList, _Pid, DateTime}, State) ->
	playerState:setDenyChatTime(DateTime),
	{noreply, State};

handle_info(repeatSync9GridPlayerAndPet, State) ->
	playerMap:repeatSync9GridPlayerAndPet(),
	{noreply, State};

handle_info({netQuit,Pid,Reason},State) ->
	playerState:setNetPid(undefined),
	playerMap:syncPlayerNetPidToEts(undefined),
	case erlang:is_list(Reason) of
		true ->
			?LOG_OUT("player[~p] roleID[~p] code[~p] netpid[~p] quit by[~ts]",[self(),playerState:getRoleID(),playerState:getPlayerCode(),Pid,Reason]);
		_ ->
			?LOG_OUT("player[~p] roleID[~p] code[~p] netpid[~p] quit by[~p]",[self(),playerState:getRoleID(),playerState:getPlayerCode(),Pid,Reason])
	end,

%%	PidStatus = playerState:getRunStep(),
%%	if
%%		PidStatus =/= ?PlayerStateChangeLine ->
%%			erlang:send_after(1000, self(), quit);
%%		true ->
%%			skip
%%	end,
	%%处理队伍方面的事情
%%	playerTeam2:offLine(?PlayerTeamTypeNormal),
	%% 姻缘系统：下线影响伴侣的夫妻技能状态
	playerMarriage:resetSkill(false, true),
	%% 跨服骑宠竞速：下线取消报名
	playerRace:cancel(),

	%% 退出
	erlang:send_after(1000, self(), quit),
	{noreply, State};

%% 定时自杀
handle_info({quitAfter,_Pid,Time},State) when erlang:is_integer(Time)->
	HasHandle = get('quitAfter'),
	if
		HasHandle =:= undefined ->
			Handle = erlang:send_after(Time, self(), quit),
			?LOG_OUT("playerPid[~p] quitAfter set selfkill will[~p]MicroSecond :)",[self(),Time]),
			put('quitAfter',Handle);
		true ->
			?ERROR_OUT(" has quitAfter,need cancel first"),
			ok
	end,
	{noreply, State};

%% 取消定时自杀
handle_info({quitAfterCancel,_Pid,{}},State) ->
	HasHandle = get('quitAfter'),
	if
		HasHandle =:= undefined ->
			?LOG_OUT("playerPid[~p] quitAfterCancel msg not to do~)",[self()]),
			ok;
		true ->
			erlang:cancel_timer(HasHandle),
			erlang:erase('quitAfter'),
			?LOG_OUT("playerPid[~p] quitAfterCancel ok)",[self()]),
			ok
	end,
	{noreply, State};

%% 检查网络进程是否还活着
handle_info({netPidIsAlive,_Pid,{}},State) ->
%% 	TODO deprecated for reconnect zzc
	netPidIsAlive(),
	{noreply,State};

%%删除公告
handle_info({web2lsDelNotice,_Pid,{NoticeIDList}},State) ->
	?DEBUG_OUT("web2lsDelNotice[~p]",[NoticeIDList]),
	Msg = #pk_GS2U_NoticeDel{id=NoticeIDList},
	playerMsg:sendNetMsg(Msg),
	{noreply,State};

%%新增公告
handle_info({web2lsAddNotice,_Pid,{NoticeList}},State) ->
%% 	?DEBUG_OUT("web2lsAddNotice[~p]",[NoticeList]),
	Msg = #pk_GS2U_NoticeAdd{notice =NoticeList},
	playerMsg:sendNetMsg(Msg),
	{noreply,State};

%%获取公告列表
handle_info({getGameNoticeAck,_Pid,{Md5,NoticeList} },State) ->
%% 	?DEBUG_OUT("web2lsNoticeList[~p],md5:~p",[NoticeList,Md5]),
	SendStruct = playerGameNotice:createNoticeStruct(Md5,NoticeList),
	playerMsg:sendNetMsg(SendStruct),
	{noreply,State};

%% 在线玩家,验证是否有可领活动
handle_info({onLineCheckLoginAward,_FromPid,{}},State) ->
	case playerState:getIsPlayer() of
		true ->
			RoleID = playerState:getRoleID(),
			CurLevel = playerState:getLevel(),
			TakenAwardKeyList = playerState:getAwardTakens(),
			?LOG_OUT("onLineCheckLoginAward:~p ~p ~p",[RoleID, TakenAwardKeyList, CurLevel]),
			playerLoginAward:checkAndGiveLoginAward(RoleID, TakenAwardKeyList, CurLevel);
		_ ->
			skip
	end,
	{noreply,State};

%% 玩家登录时，验证是否有可领活动
handle_info({checkLoginAward,_FromPid,{ RoleID, TakenAwardKeyList, CurLevel }},State) ->
	case playerState:getIsPlayer() of
		true ->
			playerLoginAward:checkAndGiveLoginAward(RoleID, TakenAwardKeyList, CurLevel);
		_ ->
			skip
	end,
	{noreply,State};

%% 玩家登录时，验证是否有可领活动(cs异步ACK回来)
handle_info({isTakenAck,_FromPid,{ CanGave,RoleID, ItemIDList, Title, Content,TakenList } },State) ->
	?DEBUG_OUT("isTakenAck:~p ~p ~p",[RoleID, TakenList,CanGave]),
	if
		CanGave =:= true ->
			systemMail:sendMail(ItemIDList, [RoleID],?ItemLoginWelfare, Title, Content, "");
		true ->
			skip
	end,
	playerState:setAwardTakens(TakenList),
	{noreply,State};

%%处理激活码查询结果
handle_info({getActiveCodeRequestAck,_Pid, Data},State) ->
	playerActiveCode:getActiveCodeRequestAck(Data),
	{noreply,State};

%%处理激活码更新结果
handle_info({updateActiveCodeAck,_Pid,{ActiveCode, RoleID, Ret, Item_ID, Item_Count}},State) ->
	playerActiveCode:updateActiveCodeAck(ActiveCode, RoleID, Ret, Item_ID, Item_Count),
	{noreply,State};

%% 取回xml公告
handle_info({getXmlNoticeAck,_FromPid,{ #pk_GS2U_XmlNoticeResponse{}=PK }},State) ->
	playerMsg:sendNetMsg(PK),
	{noreply,State};

%%组队杀怪装备掉落
handle_info({equipDrop,_FromPid, #recKillMonsterDrop{
	equipDropType = EquipDropType,
	equipDropList = EquipDropList,
	itemDropID = ItemDropID,
	itemDropOdd = ItemDropOdd,
	monsterID = MonsterID,
	monsterLevel = UseLevel,
	teamMemberNum = MurdererNum,
	mapPid = MapPid}},State) ->
	case playerBattle:canGainDropGoods() of
		true ->
			IsAward = playerCopyMapReward:isRewardInCopyMap(),
			IsAssist = core:isAssistCopyMapByCopyMapPID(playerState:getRoleID(), MapPid),
			case {IsAward, IsAssist} of
				{true, false} ->
					%%?WARN_OUT("~ts ~p equipDrop: ~w ItemDropID:~w",[playerState:getName(),self(),EquipDropList,ItemDropID]),
					Fun =
						fun(DropID) ->
							playerDrop:equipDrop(DropID, MonsterID, UseLevel, EquipDropType, MurdererNum, ?ItemSourceKillMonster)
						end,
					lists:foreach(Fun,EquipDropList),
					playerDrop:goodsDrop(ItemDropID, ItemDropOdd, MonsterID, ?ItemSourceKillMonster);
				_ ->
					ignore
			end;
		_ ->
			ignore
	end,
	{noreply,State};

%%处理已经进入地图的消息，注意这个消息是玩家进程自己发送的
handle_info({dealEnteredMap,N},State) ->
	playerMap:dealEnteredGame(N),
	{noreply,State};

%%给玩家用聊天功能发系统消息
handle_info({sendSystemChatMsg,_FromPid,{Content} },State) ->
	playerChat:onSystemChatMsg(Content),
	{noreply,State};
%%给玩家用聊天功能发系统消息,通过ErrorCode
handle_info({sendSystemChatMsgByECode,_FromPid,{ErrorCode, Params} },State) ->
	playerMsg:sendErrorCodeMsg(ErrorCode, Params),
	{noreply,State};

%%宠物复活
handle_info({rmbPetRevive, Code}, State) ->
	playerPet:petOnRevive(Code),
	{noreply, State};

%%切磋

%%请求切磋
handle_info({toRequestBattleLearn, _FromPid, Data}, State) ->
	playerBattleLearn:toRequestBattleLearn(Data),
	{noreply, State};

%%通知切磋者进入切磋位面
handle_info({enterBattleLearnMap, FromPid, {Code, NetPid, SelfName, GroupID}}, State) ->
	playerBattleLearn:enterBattleLearnMap(Code, FromPid, NetPid, SelfName, GroupID),
	{noreply, State};

%%通知切磋者离开切磋位面
handle_info({leaveBattleLearnMap, _FromPid, {Result, GroupID}}, State) ->
	playerBattleLearn:leaveBattleLearnMap(Result, GroupID),
	{noreply, State};

%%通知切磋者离开切磋位面
handle_info(leaveBattleLearnMap, State) ->
	playerBattleLearn:leaveBattleLearnMap(?BattleLearnDraw, playerState:getGroupID()),
	{noreply, State};

%%切磋倒计时到了进入切磋
handle_info(enterBattleLearn, State) ->
	playerBattleLearn:enterBattleLearnStatus(),
	{noreply, State};

%%切磋时间到了
handle_info(leaveBattleLearn, State) ->
	playerBattleLearn:leaveBattleLearnStatus(),
	{noreply, State};

%% 设置PK模式
handle_info({changePlayerCamp, _FromPid, Camp}, State) ->
	playerState:setCamp(Camp, true),
	{noreply, State};

%%通知被切磋者离开切磋
handle_info({beBattleLearnLeave, _FromPid, {Camp}}, State) ->
	playerState:setCamp(Camp, true),
	case playerState:getBattleLearnInfo() of
		#recBattleLearn{hp = HP} ->
			CurHP = playerState:getCurHp(),
			case CurHP < HP andalso CurHP > 0 of
				true ->
					playerBase:setHpDirect(HP);
				_ ->
					playerPropSync:setInt(?SerProp_BattleLearnHP, trunc(HP)),
					skip
			end;
		_ -> skip
	end,
	playerState:setBattleLearnInfo([]),
	{noreply, State};

%% 通知可以进入战场
handle_info({enterLadder1v1Map, _FromPid, Data}, State) ->
	playerLadder1v1:enterLadder1v1Map(Data),
	playerliveness:onFinishLiveness(?LivenessArena,1),
	{noreply, State};

%% 机器人加载数据
handle_info({loadRobRoleData, _FromPid, Data}, State) ->
	playerRob:loadRobRoleData(Data),
	{noreply, State};

%% 玩家可以移动
handle_info({ladder1v1_player_start_battle, _FromPid, Data}, State) ->
	playerLadder1v1:ladder1v1_player_start_battle(Data),
	{noreply, State};

%% 机器人开始攻击
handle_info({ladder1v1_rob_start_battle, _FromPid, Data}, State) ->
	playerLadder1v1:ladder1v1_rob_start_battle(Data),
	{noreply, State};

%% 天梯战斗结果
handle_info({ladder1v1_battle_result, _Pid, Data}, State) ->
	%% 延时三秒发送
	erlang:send_after(3000, self(), {ladder1v1_battle_result, Data}),
	{noreply, State};

handle_info({ladder1v1_battle_result, #pk_GS2U_Ladder1v1BattleEnd{rank = CurrentRankSort} = Data}, State) ->
	playerSevenDays:onMissionEvent(?SevenDayMission_Event_4, 1, 0),
	HistoryBestRankSort=playerPropSync:getProp(?SerProp_Ladder1v1BestScort),
	playerLadder1v1:rankSortRiseAward(HistoryBestRankSort,CurrentRankSort),
	playerMsg:sendNetMsg(Data),

	case Data#pk_GS2U_Ladder1v1BattleEnd.result of
		1 ->
			%% 竞技场胜利成就统计
			playerAchieve:achieveEvent(?Achieve_arena_win, [1]);
		_ ->
			skip
	end,
	{noreply, State};

handle_info({canEnterEscortMap, _Pid, Data}, State) ->
	playerEscort:canEnterEscortMap(Data),
	{noreply, State};

%%阻刷副本次数的
handle_info({goMap, MapID}, State) ->
	playerScene:onRequestEnterMap(MapID),
	{noreply, State};

handle_info({requestEnterCopyMap, _Pid, CopyMapID}, State) ->
	playerCopyMap:enterCopyMap(CopyMapID),
	{noreply, State};
handle_info({onEnterEscortMapAck, _Pid, Data}, State) ->
	playerEscort:onEnterEscortMapAck(Data),
	{noreply, State};

handle_info({sendEscortMsgToPlayer, _Pid, Data}, State) ->
	playerEscort:sendEscortMsgToPlayer(Data),
	{noreply, State};

handle_info({gm_delobj_rob_player, _Pid, GMRoleID}, State) ->
	?LOG_OUT("gm_delobj_rob_player gmroleid=~p, code=~p, robroleid=~p",
		[GMRoleID, playerState:getPlayerCode(), playerState:getRobRoleID()]),
	playerRob:sendToMeLRobPlayerExit(self(), playerState:getPlayerCode(), playerState:getRobRoleID()),
	{noreply, State};

handle_info(rob_max_life_time, State) ->
	?ERROR_OUT("rob_max_life_time code=~p,roleid=~p,robroleid=~p,pid=~p",
		[playerState:getPlayerCode(), playerState:getRoleID(), playerState:getRobRoleID(), self()]),
	playerRob:sendToMeLRobPlayerExit(self(), playerState:getPlayerCode(), playerState:getRobRoleID()),
	{noreply, State};

%% 进程退出
handle_info({robplayerExit, _From, {TargetCode, TargetRoleID}}, State) ->
	case playerRob:robPlayerCanExit(TargetCode, TargetRoleID) of
		true ->
			playerMsg:sendMsgToNearPlayer(#pk_GS2U_BroadcastDisapear{code = [TargetCode]}, false),
			{stop, normal, State};
		_ ->
			{noreply, State}
	end;

handle_info(rob_entermap_tick, State) ->
	playerRob:rob_enterMap_tick(),
	{noreply, State};

handle_info({ladder1v1_addprop, _Pid, Data}, State) ->
	playerLadder1v1:ladder1v1_addprop(Data),
	{noreply, State};

%%加入 王者战天下
handle_info({requestJoinKingBattleMapAck, _FromPid, Ret}, State) ->
	playerAcKingBattleAll:requestJoinKingBattleMapAck(Ret),
	{noreply, State};
%%成功进入到了守护世界地图
handle_info({enterKingBattleSenceSuccessAck, _FromPid, _}, State) ->
	playerAcKingBattleAll:enterKingBattleSenceSuccessAck(),
	{noreply, State};

%%战天下榜单数据
handle_info({requestKingBattleDamageRankAck, _FromPid, {MsgData,MsgExt}=Data }, State) ->
	?DEBUG_OUT("zzc=====RankAck ~p",[Data]),
	playerMsg:sendNetMsg(MsgData),
	playerMsg:sendNetMsg(MsgExt),
	{noreply, State};

%%Cross里初始玩家进程(cross)
handle_info({crossRolePidInit, _FromPid, RoleData }, State) ->
	playerCrossLogic:crossRolePidInit(RoleData),
	{noreply, State};

%%cross里，初始化玩家进程(未用)
handle_info({crossRolePidInitLogic, _FromPid }, State) ->
	?WARN_OUT("crossRolePidInitLogic"),
	{noreply, State};

%%申请创建进程(gs)
%% 这是切换到跨服的关键函数，非常重要，且必须要固定的格式。
%% {CrossMsgID,Data} = TransMsg,
%% undefined = TransMsg,
%% 在跨服创建玩家进程成功后，会
%% psMgr:sendMsg2PS(跨服上玩家新OTP_PID, CrossMsgID, Data)
handle_info({loginCross, _FromPid, TransMsg }, State) ->
	playerCrossLogic:loginCross(TransMsg),
	{noreply, State};

handle_info({cross_not_connect, _FromPid, _}, State) ->
	?ERROR_OUT("cross_not_connect:~p,~p", [playerState:getRoleID(), self()]),
	playerMsg:sendErrorCodeMsg(?ErrorCode_CrosBattle_AlreadyClose),
	{noreply, State};

%%申请创建进程Ack(gs)
handle_info({loginCrossAck, FromPid, TransMsg}, State) ->
	case TransMsg of
		{MsgID, Data} ->
			%% fixme 这个回调会各自处理，进入自己的需要进入的场景
			psMgr:sendMsg2PS(FromPid, MsgID, Data);
		undefined ->
			%% fixme 这里没有处理，所以需要处理进入普通场景
			psMgr:sendMsg2PS(FromPid, noticePlayerEnterMap, {globalCfg:getStartMap(), undefined}),
			skip
	end,

	%% 通知客户端进入跨服成功
	Msg = #pk_GS2U_CrossStep{index = 1},%%进到跨服
	playerMsg:sendNetMsg(Msg),

	playerPet:clearAllPets(),

	AccountID = playerState:getAccountID(),
	ets:update_element(?TABLE_PlayerInfoCross, AccountID, {#onlinePlayerInfo.playerPid,FromPid}),

	playerBase:onPlayerOffline(logCrossAck),
	?WARN_OUT("loginCross-4,loginCrossAck ~p-~p-~p",[FromPid, playerState:getRoleID(), TransMsg]),
	{stop, normal, State};

%%从Cross回来,自动选择当前角色(GS)
handle_info({loginGSFromCross, _FromPid, Data}, State) ->
	#rec_CrossToNormalData{
		roleID = RoleID,
		roleList = RoleList,
		accountID = AccountID,
		gMLevel = GMLevel,
		playerCode = PlayerCode,
		callBackTuple = CallBackTuple,
		funcellInfo = FuncellInfo,
		plateformAccountID = PlateformAccountID,
		plateformID = PlateformID,
		otherMsg = _OtherMsg %% 其它附带信息
	} = Data,
	?WARN_OUT("loginCross-6,loginGSFromCross,role[~p]",[RoleID]),
	NewRoleInfo = lists:keyfind(RoleID, #recRoleListInfo.roleID, RoleList),
	RoleList2 = lists:keystore(RoleID,#recRoleListInfo.roleID,RoleList,NewRoleInfo#recRoleListInfo{lastLogoutTime=time:getUTCNowMS()}),
	playerState:setRoleList(RoleList2),
	playerState:setAccountID(AccountID),
	playerState:setPlayerCode(PlayerCode),
	playerState:setPlayerOldCode(PlayerCode),
	playerState:setGmLevel(GMLevel),

	playerState:setFuncellInfo(FuncellInfo),
	playerState:setPlateformAccountID(PlateformAccountID),
	playerState:setPlateformID(PlateformID),

	Msg = #pk_GS2U_CrossStep{index=2},%%从跨服回来
	playerMsg:sendNetMsg(Msg),
	playerLogin:onLoadRoleData(#pk_U2GS_SelPlayerEnterGame{roleID =RoleID }),
	playerCrossLogic:doCallBack(CallBackTuple),
	{noreply, State};

%%本场跨服竞技场结束奖励(跨服里先存着)
handle_info({dealCrosAreadReward, _FromPid, Data}, State) ->
	playerState:setCrosAreadReward(Data),
	{noreply, State};

%% 加入混沌战场结果
handle_info({requestJoinHDBattleAck, _FromPid, Ret}, State) ->
	case Ret of
		{HDMapID, HDMapPID, {X, Y}} ->
			%% 进入混沌活动地图
			playerScene:onRequestEnterActivityMap(HDMapID, HDMapPID, float(X), float(Y)),
			playerLogAdd:addLogParticipatorInfo(?LogParticipator_HDBattlePlayerIn);
		{HDMapID, HDMapPID, _EnterPos} ->
			%% 进入混沌活动地图
			playerScene:onRequestEnterActivityMap(HDMapID, HDMapPID),
			playerLogAdd:addLogParticipatorInfo(?LogParticipator_HDBattlePlayerIn);
		ErrorCode ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	{noreply, State};

%%加入混沌战场结果
handle_info({requestJoinCroHDBattleAck, FromPid, {MapID, MapPID, Camp, Msg}}, State) ->
	%% 从CORE中读取
	Cfg = core:getMapCfg(MapID),
	case Cfg#recGameMapCfg.mapRelivePt of
		List when is_list(List) andalso length(List) >= 2 ->
			case Camp of
				?CampRedBattle ->
					#recMapObjData{mapX = RX, mapY = RY} = lists:nth(1, List);
				_ ->
					#recMapObjData{mapX = RX, mapY = RY} = lists:nth(2, List)
			end,

			case playerScene:onRequestEnterActivityMap(MapID, MapPID, float(RX), float(RY)) of
				true ->
					%playerliveness:onFinishLiveness(?LivenessFationCopy,1),
					playerState:setCrosCamp({Camp, MapPID, Msg}),
					playerLogAdd:addLogParticipatorInfo(?LogParticipator_CrosHDBattle);
				false ->
					psMgr:sendMsg2PS(FromPid, enterMapFail, {Camp, MapPID}),
					playerMsg:sendErrorCodeMsg(?ErrorCode_CrosBattle_EnterFailed)
			end;
		_ ->
			?ERROR_OUT("player[~ts] Error MapID[~p],not cfg In getRow",[playerState:getName(),MapID]),
			psMgr:sendMsg2PS(FromPid, enterMapFail, {Camp, MapPID}),
			playerMsg:sendErrorCodeMsg(?ErrorCode_CrosBattle_EnterFailed)
	end,
	{noreply, State};

%% 混沌战场增加荣誉
handle_info({hdaddHonorValue, _Pid, {RoleID,HonorValue}}, State) ->
	case RoleID =:= playerState:getRoleID() andalso HonorValue > 0 of
		true ->
			NowValue = playerDaily:getDailyCounter(?DailyType_HDBattleGetHonor, 1),
			MaxValue = case getCfg:getCfgPStack(cfg_globalsetup, battle_honor_max) of
						   #globalsetupCfg{setpara = [V]} ->
							   V;
						   _ ->
							   0
					   end,
			RealValue = case MaxValue - NowValue > HonorValue of
							true ->
								HonorValue;
							_ ->
								MaxValue - NowValue
						end,
			case RealValue > 0 of
				true ->
					playerDaily:addDailyCounter(?DailyType_HDBattleGetHonor, 1, RealValue),
					New_HonorValue = playerVipInter:getAddHonor(RealValue),
					playerMsg:sendErrorCodeMsg(?ErrorCode_ActivityHDGetHonorNumber, [New_HonorValue]),
					playerMoney:addCoin(?CoinTypeHonor, New_HonorValue,
						#recPLogTSMoney{reason=?CoinSourceActivity,param=RoleID,target=?PLogTS_PlayerSelf,source=?PLogTS_Activity_HD});
				_ ->
					%% 本日获得已达上限
					playerMsg:sendErrorCodeMsg(?ErrorCode_ActivityHDBattleGetHonorMax),
					skip
			end;
		_ ->
			skip
	end,
	{noreply,State};

%% 改变混沌战场玩家状态为和平状态
handle_info({changeHDKillStatus, _Pid, {RoleID,Status}}, State) ->
	case RoleID =:= playerState:getRoleID() of
		true ->
			playerPk:tranState(Status);
		_ ->
			skip
	end,
	{noreply,State};

%% 混沌战场击杀boss奖励
handle_info({hdKillBossReward, _Pid, {RoleID,ItemID}}, State) ->
	case RoleID =:= playerState:getRoleID() of
		true ->
			?LOG_OUT("hdKillBossReward:~p,~p", [RoleID,ItemID]),
			Plog = #recPLogTSItem{
				old = 0,
				new = 1,
				change = 1,
				target = ?PLogTS_PlayerSelf,
				source = ?PLogTS_Activity_HD,
				gold = 0,
				goldtype = 0,
				changReason = ?ItemSourceHDBattle,
				reasonParam = ItemID
			},
			playerPackage:addGoodsAndMail(ItemID, 1, true, 0, Plog);
		_ ->
			skip
	end,
	{noreply,State};

%%通知销毁位面
handle_info({noticeDestoryBitMap, GroupID}, State) ->
	psMgr:sendMsg2PS(playerState:getMapPid(), clearBitMapPlayer, GroupID),
	{noreply, State};

%%地图告知玩家可以进的位面ID（boss战）
handle_info({noticeBossEnd,_FormMapPid,{} },State) ->
%%	playerWorldBossWar:noticeEnd2OtherMapRole(),
	{noreply,State};

%%公告给玩家1分钟后切到主城（boss战）
handle_info({noticeWill2MainCity,_FormMapPid,{} },State) ->
%%	playerWorldBossWar:noticeWillToMainCity(),
	{noreply,State};

%%boss战结束（boss战）
handle_info({playerCanInGroup,_FormMapPid,GroupID },State) ->
%%	playerWorldBossWar:enterParallelUniverse(GroupID),
	?DEBUG_OUT("playerCanInGroup:~w",[{GroupID,self()}]),
	{noreply,State};

%%特殊的测试跨服使用，send_after来触发，建角色时（
handle_info(testCrossPlayer,State) ->
	ItemList = [
		[35340 ,35341 ,35342,35343,35344,35345,35346,35347],
		[35348,35349,35350,35351,35352,35353,35354,35355],
		[35356,35357,35358,35359,35360,35361,35362,35363],
		[35364,35365,35366,35367,35368,35369,35370,35371],
		[50228,50229,50230,50231,50232,50233,50234,50235],
		[]
	],
	playerGM:execGM("<t=0>,,&setlevel 70</t>"),
	playerGM:execGM("<t=0>,,&crack</t>"),
	Career = playerState:getCareer(),
	CI = lists:nth(Career,ItemList),
	Fun = fun(Item)->
		GMStr1 = io_lib:format("<t=0>,,&additem ~p 1 1</t>",[Item]),
		GMStr = lists:flatten(GMStr1),
		playerGM:execGM(GMStr)
		  end,
	[Fun(A) || A<- CI],
	playerGM:execGM("<t=0>,,&additem 21007 8 1</t>"),
	playerGM:execGM("<t=0>,,&additem 21057 8 1</t>"),
	playerGM:execGM("<t=0>,,&additem 21108 8 1</t>"),
	{noreply,State};


handle_info({worldBossState,_FormMapPid,{Flag}},State) ->
	playerWorldBossWar:activityFlagSync(Flag),
	{noreply,State};

%%接收BOSS战伤害排行
handle_info({worldBossDamageRank,_FormMapPid,RankList },State) ->
%%	playerWorldBossWar:worldBossDamageRank(RankList),
	{noreply,State};

%%接收BOSS战伤害排行奖励
handle_info({worldBossAward,_FormMapPid,ItemID },State) ->
	?DEBUG_OUT("worldBossAward"),
	Plog = #recPLogTSItem{
		old = 0,
		new = 1,
		change = 1,
		target = ?PLogTS_PlayerSelf,
		source = ?PLogTS_Activity_Boss,
		gold = 0,
		goldtype = 0,
		changReason = ?ItemSourcePassCopyMap,
		reasonParam = ItemID
	},
	playerPackage:addGoodsAndMail(ItemID, 1, true, 0, Plog),
	{noreply,State};

%%接收BOSS战伤害
handle_info({bossDamageAdd,_FormMapPid,OneDamageValue },State) ->
	?DEBUG_OUT("[debugwb]"),
%%	playerState:addWorldBossAddDamage(OneDamageValue),
	{noreply,State};

%% 有人获得了ipad道具币的奖励
handle_info({bossActivityGivePadItemStr, _Pid, Str}, State) ->
	%% 跑马灯
	playerGameNotice:sendMarquee(self(), Str),

	%% 系统消息
	playerGameNotice:sendSystemChat(Str),
	{noreply,State};

%%刷新累计签到
handle_info(refreshLogin,State) ->
	playerSignIn:addLogin(),
	{noreply, State};

%%野外boss仇恨目标或者仇恨列表变化
handle_info({wildBossChangeTarget, _FromPid, {TargetCode, IsShow}},State) ->
	playerWildBoss:wildBossChangeTarget(TargetCode, IsShow),
	{noreply, State};

%%野外boss红名状态改变
handle_info({changeBuffState, _FromPid, IsAddBuff},State) ->
	playerWildBoss:changeBuffState(IsAddBuff),
	{noreply, State};

handle_info(quit,State) ->
	%%这里需要捕获一下是否有异常，否则有异常会导致玩家进程退出不了
	try
		?LOG_OUT("playerOtp[~p] roleID[~p] code[~p] will quit",[self(),playerState:getRoleID(),playerState:getPlayerCode()]),
		playerBase:onPlayerQuit(quit),
		notifyLoginServer()
%%		codeMgr:reclaimCode(playerState:getPlayerCode())
	catch
		_:Reason ->
			?ERROR_OUT("Error PlayerOtp:~p RoleID:~p Quit Exception:~p",[self(),playerState:getRoleID(),Reason])
	end,
	timer:sleep(10),
	?LOG_OUT("playerOtp[~p] roleID[~p] code[~p] quit now",[self(),playerState:getRoleID(),playerState:getPlayerCode()]),
	{stop,normal, State};

%%执行回调（地宫类）
handle_info({demonBattleAward,_Pid,{MapLevel,CurrSchedule} },State) ->
	PlayerLevel = playerState:getLevel(),
	UseLevel =
		if
			PlayerLevel =< MapLevel ->
				PlayerLevel;
			true ->
				MapLevel
		end,
	?DEBUG_OUT("demonBattleAward,UseLevel:~w,playerRole:~w,~w,~w",[UseLevel,PlayerLevel,MapLevel,CurrSchedule]),
	#demonrewardCfg{
		expreward = Expreward,
		waverate = Waverate
	} = getDemonBattleAwardCnf(UseLevel,CurrSchedule),

	Exp = erlang:round(Expreward*Waverate),
	playerBase:addExp(Exp, ?ExpSourceCopyMap, playerState:getMapID()),
	CMapPid = playerState:getMapPid(),
	RecAward =
		case playerState:getMapAward() of
			#recMapAward{mapPid=MapPid,exp=OldExp,gold=_OldGold} = Old when CMapPid =:= MapPid ->
				Old#recMapAward{exp=OldExp+Exp,gold=0};
			_ ->
				#recMapAward{mapPid=playerState:getMapPid(),exp=Exp,gold=0}
		end,
	playerState:setMapAward(RecAward),

	{noreply, State};

%%新地宫结算
handle_info({goddessSettlement, _Pid,{Score, CopyMapID}}, State) ->
	PlayerLevel = playerState:getLevel(),
	playerBuff:addBuff(?OUTOFCONTROL,PlayerLevel),
	playerBuff:addBuff(?PLAYERBLUR,PlayerLevel),
	playerCopyMap:onPassCopyMap(Score, CopyMapID),
	{noreply, State};

%%排行榜刷新消息
handle_info({sendRefreshMsgToAllOLPlayer, _Pid, {RankType}}, State) ->
	%playerGuildHome:resetGuildHomeTask(),
	playerRank:sendRefreshMsgToAllOLPlayer(RankType),
	{noreply, State};
%% 排行榜领奖消息
handle_info({requestRankRewardAck, _Pid, Msg}, State) ->
	playerRank:requestRankRewardAck(Msg),
	{noreply, State};
%% 世界等级刷新消息
handle_info({refreshWorldLevelToAllPlayer, _Pid, {}}, State) ->
	playerWorldLevel:sendWorldLevel(),
	{noreply, State};

%%商城数据请求返回 from cs
handle_info({queryMallInfoAck, _Pid, Results}, State) ->
	playerMall:queryMallInfoAck(Results),
	{noreply, State};
%%商城数据请求返回 from cs
handle_info({onMallBuySuccessAck, _Pid, Results}, State) ->
	playerMall:onMallBuySuccessAck(Results),
	{noreply, State};
%%绑定手机结果
handle_info({bindPhoneAck, _Pid, Results}, State) ->
	playerSignIn:onBindPhoneAck(Results),
	{noreply, State};
%%处理dbs返回的账号绑定信息
handle_info({getBindPhoneAck, _Pid, PhoneNum}, State) ->
	playerState:setBindPhoneNum(PhoneNum),
	{noreply, State};

% 好友系统修改后没有幸运币的概念，屏蔽幸运币相关代码
%%%获得幸运币
%handle_info({giveLuckyCoin, FriendPid, {FriendRoleID, GiveTime, IsOneKey}}, State) ->
%	playerLuckyCoin:receiveLuckyCoin(FriendPid, FriendRoleID, GiveTime, IsOneKey),
%	{noreply, State};
%%%赠送幸运币返回结果
%handle_info({giveLuckyCoinAck, _FriendPid, Args}, State) ->
%	playerLuckyCoin:giveLuckyCoinAck(Args),
%	{noreply, State};

handle_info({checkedExtPlugin, _Pid, {}}, State) ->
	?LOG_OUT("role:[~p,~p], recv use plugin msg!", [playerState:getRoleID(), self()]),
	playerMsg:sendErrorCodeMsg(?ErrorCode_SystemWarning),
	checkExtPlugin(),
	{noreply, State};

%% gm请求查看我的地图信息，并想传送到我这里来
handle_info({gm_getplayermapinfo, PidFrom, GM_RoleID}, State) ->
	RoleID = playerState:getRoleID(),
	Code = playerState:getPlayerCode(),
	?LOG_OUT("gm_getplayermapinfo:gm=~p,self=~p,selfcode=~p", [GM_RoleID,RoleID,Code]),
	MapID = playerState:getMapID(),
	MapPID = playerState:getMapPid(),
	{X, Y} = playerState:getPos(),
	GroupID = playerState:getGroupID(),
	psMgr:sendMsg2PS(PidFrom, gm_getplayermapinfoAck, {RoleID, Code, MapID, MapPID, X, Y, GroupID}),
	{noreply, State};

handle_info({gm_getplayermapinfoAck, _PidFrom, {RoleID, Code, MapID, MapPID, X, Y, GroupID}}, State) ->
	Str = io_lib:format("roleid=~p,code=~p,groupid=~p", [RoleID,Code,GroupID]),
	playerChat:onSystemChatMsg(Str),
	playerScene:gm_requestEnterMap(MapID,MapPID,X,Y),
	playerState:setGMSSTargetGroupID(GroupID),
	{noreply, State};

%%伤害统计
handle_info({statHurt, _Pid, {MapID, DiffHp, AttackType, AttackID}}, State) ->
	playerStatistics:copyMapHurtStat(AttackType, AttackID, MapID, DiffHp),
	{noreply, State};

%%队友伤害统计
handle_info({teamStatHurt, _Pid, {RoleID, Hurt}}, State) ->
	playerStatistics:playerTeamCopyMapHurtStat(RoleID, Hurt),
	{noreply, State};

%%请求坐标
handle_info({requirePos,Pid,{RequestType,RoleID}},State) ->
	MapID = playerState:getMapID(),
	{X,Y} = playerState:getPos(),
	RoleID = playerState:getRoleID(),
	psMgr:sendMsg2PS(Pid,requirePosAck,{RequestType,MapID,X,Y}),
	{noreply, State};

%%请求坐标返回结果
handle_info({requirePosAck,_Pid,{RequestType,MapID,X,Y}},State) ->
	playerMove:requirePosAck(RequestType,MapID,X,Y),
	{noreply, State};

handle_info(gmShowProp,State) ->
	showProp(),
	{noreply, State};
%%收到远程玩家的照片数据
handle_info({sendPhotoData, _Pid, {RoleID, SectionNum, SectionIndex, Data, Type}}, State) ->
	playerMsg:sendNetMsg(#pk_UpLoadingPhoto{type = Type, roleID = RoleID, sectionNum = SectionNum, sectionIndex = SectionIndex, data = Data}),
	{noreply, State};
handle_info({warriorTrialEnterMap, Pid, {}}, State) ->
	playerWarriorTrial:missionInit(Pid),
	{noreply, State};
handle_info({warriorTrialKillBoss, _Pid, {}}, State) ->
	playerWarriorTrial:completeSchedule(),
	{noreply, State};
handle_info({warriorTrialBeKilled, _Pid, MapID}, State) ->
	playerWarriorTrial:playerBeKilled(MapID),
	{noreply, State};
%%勇士试炼重置副本
handle_info({warriorTrialResetCopyMap, MapID}, State) ->
	%%重置副本
	core:sendMsgToMapMgr(MapID, resetCopyMap, {playerState:getRoleID(), playerState:getTeamID(), MapID}),
	{noreply, State};
handle_info({sendGoblinOpenState, _Pid, {IsOpen,MapList}}, State) ->
	[MapID|_] = MapList,
	playerMsg:sendNetMsg(#pk_GS2U_Goblin_Open_State{isOpen = IsOpen, mapID = MapID}),
	{noreply, State};
%%藏宝贼数量通知
handle_info({goblinKilled, _Pid, LeftNum}, State) ->
	case LeftNum > 0 of
		true ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_Goblin_LeftNum, [LeftNum]);
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_Goblin_AllDead)
	end,
	{noreply, State};
handle_info({goblinBossKilled, _Pid}, State) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_Goblin_BossDead),
	{noreply, State};
%% 天梯1v1机器人镜像进程，会把网络消息包发给自己，这里匹配一下
handle_info({sendPackage, _Pid, _Data},State) ->
	{noreply, State};

%%
handle_info({canUseNewNameAck, _Pid, {Ret, RoleID, Name}},State) ->
	playerLogin:canUseNewNameAck(Ret, RoleID, Name),
	{noreply, State};


%% 玩家答题结果
handle_info({answerResultAck, _Pid, Data}, State) ->
	playerAnswer:answerResultAck(Data),
	{noreply, State};

%% 领取答题第一奖励
handle_info({addAnswerRewardFirst, _Pid, {Exp,Coin}}, State) ->
	playerAnswer:getAnswerRewardFirst(Exp,Coin),
	{noreply, State};
%% 领取答题幸运奖
handle_info({addAnswerRewardLucky, _Pid, {Exp,Coin}}, State) ->
	playerAnswer:getAnswerRewardLucky(Exp,Coin),
	{noreply, State};
%% 野外boss死啦
handle_info({wildBossDead, _Pid, {MapID, BossId, TargetCode, PlayerName, TarRoleID, TarTeamID, ListRoleID}}, State) ->
	playerWildBoss:wildBossDead(MapID, BossId, TargetCode, PlayerName, TarRoleID, TarTeamID, ListRoleID),
	{noreply, State};
%% 野外boss刷新了
handle_info({wildBossRefresh, _Pid, Content}, State) ->
	playerChat:onSystemChatMsg(Content),
	{noreply, State};
%% 清空玩家勇士试炼排行用到数据
handle_info({cleanPlayerWarriorData, _Pid, _Arg}, State) ->
	playerWarriorTrial:cleanRankData(),
	{noreply, State};

%%增加称号
handle_info({addTitle,_FromPid,{TitleID}},State)->
	playerTitle:addTitle(TitleID,?TitleSourceAchieve),
	{noreply,State};

%%增加限时骑宠
handle_info({addExpressPet, _, {PetID}}, State) ->
	playerPet:addExpressPet(PetID),
	{noreply, State};

handle_info({quickTamEnterMap,MapID},State)->
	?DEBUG_OUT("quickTamEnterMap ~p",[MapID]),
	%检查是否是小羊副本，要热更出去，写死在这儿
	RealMapID = case lists:member(MapID,[190,191,192,193,194,195]) of
					true->
%%						playerTask2:updateActiveTask(1),
						playerTask:updateTask(?TaskSubType_Active, 1),
						190;
					_ -> MapID
				end,

	playerCopyMap:enterCopyMap(RealMapID),

	{noreply,State};

%%跨服竞技场被邀请者反馈
handle_info({beInviteAck,_, {BeTeamID, Result, TeamInfo}},State)->
	playerCrosTeam:beInviteAck(TeamInfo, BeTeamID, Result),
	{noreply,State};

%%队长踢出玩家
handle_info({crosKick, _, {}}, State) ->
	playerState:setCrosTeamID(0),
	{noreply, State};

%%加入房间成功
handle_info({crosJoinSuc, _, {TeamID, MemberList}}, State) ->
	playerCrosTeam:beInviteSuc(TeamID, MemberList),
	{noreply, State};

%%进入跨服竞技场反馈
handle_info({requestJoinArenaBattleAck, FromPid, {MapID, MapPID, Camp}}, State) ->
	Cfg = core:getMapCfg(MapID),
	RoleID =  playerState:getRoleID(),
	?WARN_OUT("requestJoinArenaBattleAck"),
	case Cfg#recGameMapCfg.mapRelivePt of
		List when is_list(List) andalso length(List) >= 2 ->
			case Camp of
				?CampRedBattle ->
					#recMapObjData{mapX = RX, mapY = RY} = lists:nth(1, List);
				_ ->
					#recMapObjData{mapX = RX, mapY = RY} = lists:nth(2, List)
			end,
			case playerScene:onRequestEnterActivityMap(MapID, MapPID, float(RX), float(RY)) of
				true ->
					playerState:setCrosArenaCamp({Camp, MapPID, RoleID}),
					TeamID = playerState:getCrosTeamID(),
					playerCrosTeam:modifyState(TeamID, 1),
					%%psMgr:sendMsg2PS(FromPid, enterMapSuc, {Camp, MapPID, RoleID}),
					playerLogAdd:addLogParticipatorInfo(?LogParticipator_CrosArenaBattle);
				false ->
					?LOG_OUT("enter arena battle map fail [~ts], map id [~p], map pid [~p]",[playerState:getName(), MapID, MapPID]),
					psMgr:sendMsg2PS(FromPid, enterMapFail, {Camp, MapPID, RoleID}),
					playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaEnterFailed)
			end;
		_ ->
			?ERROR_OUT("player[~ts] Error MapID[~p],not cfg In getRow",[playerState:getName(),MapID]),
			psMgr:sendMsg2PS(FromPid, enterMapFail, {Camp, MapPID, RoleID}),
			playerMsg:sendErrorCodeMsg(?ErrorCode_CrosBattle_EnterFailed)
	end,
	{noreply, State};

%%匹配失败反馈
handle_info({matchFail, _FromPid, {Res}}, State) ->
	RoleID = playerState:getRoleID(),
	TeamID = playerState:getCrosTeamID(),
	?DEBUG_OUT("match fail, reason ~p, role id : [~p] teamID id :[~p]",[Res, RoleID, TeamID]),
	playerCrosTeam:modifyState(TeamID, 0),
	playerCrosTeam:ready(false, RoleID),
	{noreply, State};

%%取消匹配
handle_info({cancelMatch, _, {}}, State) ->
	RoleID = playerState:getRoleID(),
	TeamID = playerState:getCrosTeamID(),
	?DEBUG_OUT("cancel match role id: [~p] teamID [~p]", [RoleID, TeamID]),
	playerCrosTeam:matchCancelReady(RoleID, TeamID),
	{noreply, State};

%%取消匹配反馈
handle_info({cancelMatchAck, _, {Boolean}}, State) ->
	?LOG_OUT("cancel match Ack role id: [~p] res :[~p]", [playerState:getRoleID(), Boolean]),
	case Boolean of
		false ->
			playerState:setCrosTeamID(0);
		_ ->
			skip
	end,
	{noreply, State};

%%伤害反馈
handle_info({gatherHurtAck, _, {PcHurt}}, State) ->
	CurHp = playerState:getCurHp(),
	MaxHp = playerState:getMaxHp(),
	Hurt = trunc(MaxHp * PcHurt / 100),
	Str = stringCfg:getString(guildWarCollectMonester),
	case Hurt >= CurHp of
		true ->
			playerState:setCurHp(0),
			playerBattle:onDead(0, undefined, ?ObjTypeMonster, Str, 0);
		_ ->
			playerState:setCurHp(CurHp - Hurt),
			PC = skill:getPercent(CurHp - Hurt, MaxHp),
			playerBase:sendPropHpPC(PC)
	end,
	{noreply, State};

%handle_info({getLimitSalesConfAck, _FromPid, _}, State) ->
%	Items = [#pk_pushItem{ sku = 1,itemID = 1831,num = 2,isBinded = 1,price = 400,
%		rebate = 10,coinType = ?CoinTypeDiamond, limited = 1},
%		#pk_pushItem{ sku = 2, itemID = 3025,num = 1, isBinded = 1,price = 200,
%			rebate = 10,coinType = ?CoinTypeDiamond,limited = 1}],
%	Msg = #pk_GS2U_PushInfo{
%		items = Items,
%		startTime = time:getLocalNowSec1970(),
%		endTime = time:getLocalNowSec1970()+86399
%		},
%	playerMsg:sendNetMsg(Msg),
%	{noreply, State};

handle_info({ls_battleField_transfrom_player_out, _FromPid, _Data}, State) ->
	playerLSBattlefield:transformPlayerOut(),
	{noreply, State};
handle_info({ls_battleField_change_pk_state, _FromPid, _Data}, State) ->
	playerLSBattlefield:changePkState(),
	{noreply, State};
handle_info({ls_battleField_add_exp, _FromPid, _Data}, State) ->
	playerLSBattlefield:addExp(),
%%	?DEBUG_OUT("ls_battleField_add_exp====R=~p~n",[R]),
	{noreply, State};
handle_info({inviteOtherDoubleMount, FromPid, Data}, State) ->
	playerPetDouble:onOtherinviteDoubleMount(FromPid, Data),
	{noreply, State};
handle_info({inviteOtherDoubleMountAckAgree, FromPid, Data}, State) ->
	playerPetDouble:inviteOtherDoubleMountAck(FromPid, Data),
	{noreply, State};
handle_info({inviteOtherDoubleMountGo, FromPid, Data}, State) ->
	playerPetDouble:beInviteOtherDoubleMountGo(FromPid, Data),
	{noreply, State};
handle_info({inviteOtherDoubleMountGoAck, FromPid, Data}, State) ->
	playerPetDouble:inviteOtherDoubleMountGoAck(FromPid, Data),
	{noreply, State};
handle_info({doubleMountForceToPosition, _FromPid, Data}, State) ->
	playerPetDouble:forceMoveTo(Data),
	{noreply, State};
handle_info({guestSayByeByeToOwner, FromPid, Data}, State) ->
	playerPetDouble:ownerRecivedGuestSayByeBye(FromPid, Data),
	{noreply, State};
handle_info({ownerSayByeByeToGuest, FromPid, Data}, State) ->
	playerPetDouble:guestRecivedOwnerSayByeBye(FromPid, Data),
	{noreply, State};
handle_info({ownerChangeMapSuccess, FromPid, Data}, State) ->
	playerPetDouble:guestReciveOwnerChangeMap(FromPid, Data),
	{noreply, State};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 身份证系统 begin
handle_info({identity_editAck, _Pid, Msg}, State)->
	%?DEBUG_OUT("[DebugForIdentity] identity_editAck ~p", [Msg]),
	playerIdentity:editIdentityAck(Msg),
	{noreply, State};
handle_info({identity_edit_picAck, _Pid, Msg}, State)->
	%?DEBUG_OUT("[DebugForIdentity] identity_edit_picAck ~p", [Msg]),
	playerIdentity:editIdentity_PicsAck(Msg),
	{noreply, State};
handle_info({identity_picDownAck, _Pid, Msg}, State)->
	%?DEBUG_OUT("[DebugForIdentity] identity_picDownAck ~p", [Msg]),
	playerIdentity:picDownloadBeginAck(Msg),
	{noreply, State};
handle_info(identity_UpOrDwonLoadTaskOutTime, State)->
	%?DEBUG_OUT("[DebugForIdentity] identity_UpOrDwonLoadTaskOutTime", []),
	playerIdentity:picOutTime(),
	{noreply, State};
%% 身份证系统 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 新版好友系统 begin
handle_info({friend2_error, _Pid, Msg}, State)->
	%?DEBUG_OUT("[DebugForFriend2] friend2_error ~p", [Msg]),
	playerFriend2:error_code(Msg),
	{noreply, State};
handle_info({friend2_sync_formal, _Pid, _Msg}, State)->
	%?DEBUG_OUT("[DebugForFriend2] friend2_sync_formal", []),
	playerFriend2:queryList_Formal(playerState2:getFriend2PageFormal()),
	{noreply, State};
handle_info({friend2_sync_temp, _Pid, _Msg}, State)->
	%?DEBUG_OUT("[DebugForFriend2] friend2_sync_temp", []),
	playerFriend2:queryList_Temp(playerState2:getFriend2PageTemp()),
	{noreply, State};
handle_info({friend2_sync_black, _Pid, _Msg}, State)->
	%?DEBUG_OUT("[DebugForFriend2] friend2_sync_black", []),
	playerFriend2:queryList_Black(playerState2:getFriend2PageBlack()),
	{noreply, State};
handle_info({friend2_sync_apply, _Pid, _Msg}, State)->
	%?DEBUG_OUT("[DebugForFriend2] friend2_sync_apply", []),
	playerFriend2:queryList_Applicant(playerState2:getFriend2PageApp()),
	{noreply, State};
handle_info({friend2_relationAck, _Pid, Msg}, State)->
	%?DEBUG_OUT("[DebugForFriend2] friend2_recommendAck", []),
	playerFriend2:relationAck(Msg),
	{noreply, State};
handle_info({friend2_modifyVariant, _Pid, Msg}, State)->
	%?DEBUG_OUT("[DebugForFriend2] friend2_modifyVariant", []),
	playerFriend2:modifyVariant(Msg),
	{noreply, State};
handle_info({friend2_like, _Pid, {ID, Name, Like}}, State)->
	Msg = #pk_GS2u_Friend2Like_Ack{
		id = ID,
		name = Name,
		like = Like
	},
	%?DEBUG_OUT("[DebugForFriend2] friend2_like~n~p", [Msg]),
	playerMsg:sendNetMsg(Msg),
	{noreply, State};

%% 新版好友系统 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 跨服好友 begin

%% 收到好友申请
handle_info({friend2Cross_r_addAck, _Pid, Msg}, State)->
	playerFriend2Cross:onAddAck(Msg),
	{noreply, State};

%% 拒绝申请者成功，或者添加失败
handle_info({friend2Cross_r_add2Ack, _Pid, Msg}, State)->
	playerFriend2Cross:onAdd2Ack(Msg),
	{noreply, State};

%% 跨服聊天消息
handle_info({friend2Cross_chat, _Pid, Msg}, State)->
	?DEBUG_OUT("[DebugForCross] friend2Cross_chat ~ts.~w", [playerState:getName(), playerState:getRoleID()]),
	case erlang:is_list(Msg) of
		true ->
			[playerMsg:sendNetMsg(MsgCell) || MsgCell <- Msg];
		_ ->
			playerMsg:sendNetMsg(Msg)
	end,
	{noreply, State};

%% 跨服好友 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 约会地下城 begin
handle_info({date_enterTryAck, _Pid, Msg}, State)->
	%?DEBUG_OUT("[DebugForDate] date_enterTryAck", []),
	playerDate:enterTryAck(Msg),
	{noreply, State};
handle_info({date_enterTryAsk, Pid, Msg}, State)->
	%?DEBUG_OUT("[DebugForDate] date_enterTryAsk", []),
	playerDate:enterTryAsk(Pid, Msg),
	{noreply, State};
handle_info({date_enterTryReply, _Pid, Msg}, State)->
	%?DEBUG_OUT("[DebugForDate] date_enterTryReply", []),
	playerDate:enterTryReply(Msg),
	{noreply, State};
handle_info({date_link_addBuffSync, _Pid, Msg}, State)->
	%?DEBUG_OUT("[DebugForDate] date_link_addBuffSync", []),
	playerDate:link_addBuff(Msg),
	{noreply, State};
handle_info({date_link_resetPosSync, _Pid, Msg}, State)->
	%?DEBUG_OUT("[DebugForDate] date_link_resetPosSync", []),
	playerDate:link_resetPos(Msg),
	{noreply, State};
handle_info({date_error, _Pid, {ErrorCode, Param}}, State)->
	%?DEBUG_OUT("[DebugForDate] date_error", []),
	playerMsg:sendErrorCodeMsg(ErrorCode, Param),
	{noreply, State};
%% 约会地下城 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 金币副本 begin
handle_info({moneyDungeon_EnterAck, _Pid, Msg}, State)->
	?DEBUG_OUT("[DebugForMoneyDungeon] moneyDungeon_EnterAck", []),
	playerMoneyDungeon:enterCopyMap(Msg),
	{noreply, State};
handle_info({moneyDungeon_End, _Pid, {Score, CopyMapID, MC, FC, ListMonster, ?MapSubTypeMoneyDungeon}}, State) ->
	?DEBUG_OUT("[DebugForMoneyDungeon] moneyDungeon_End", []),
	FunGetIDAndKill =
		fun({ID, Count}, {L1, L2}) ->
			{[ID | L1], [Count | L2]}
		end,
	{L1, L2} = lists:foldl(FunGetIDAndKill, {[], []}, ListMonster),
	playerCopyMapReward:onPassCopyMap_MoneyDungeon(Score, CopyMapID, MC, FC, L1, L2),
	{noreply, State};
handle_info({moneyDungeon_error, _Pid, {ErrorCode, Param}}, State) ->
	?DEBUG_OUT("[DebugForMoneyDungeon] moneyDungeon_error", []),
	playerMsg:sendErrorCodeMsg(ErrorCode, Param),
	{noreply, State};
%% 金币副本 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 灵界活动 begin
handle_info({spiritArea_enterAck, _Pid, Msg}, State)->
	%?DEBUG_OUT("[DebugForSpiritArea] spiritArea_enterAck", []),
	playerSpiritArea:enterCopyMap(Msg),
	{noreply, State};
handle_info({spiritArea_reward, _Pid, Msg}, State)->
	%?DEBUG_OUT("[DebugForSpiritArea] spiritArea_enterAck", []),
	playerSpiritArea:reward(Msg),
	{noreply, State};
handle_info({spiritArea_keepWake, _Pid, Msg}, State)->
	%?DEBUG_OUT("[DebugForSpiritArea] spiritArea_keepWake", []),
	playerSpiritArea:keepWake(Msg),
	{noreply, State};
%% 灵界活动 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 姻缘系统 begin
handle_info({marriage_wantBuild, _Pid, Msg}, State)->
	playerMarriage:beWantBuild(Msg),
	{noreply, State};
handle_info({marriage_wantBuildAck, _Pid, Msg}, State)->
	playerMarriage:build(Msg),
	{noreply, State};
handle_info({marriage_buildAck, _Pid, Msg}, State)->
	playerMarriage:buildAck(Msg),
	{noreply, State};
handle_info({marriage_breakAck, _Pid, Msg}, State)->
	playerMarriage:breakAck(Msg),
	{noreply, State};
handle_info({marriage_closenessAddAck, _Pid, Msg}, State)->
	playerMarriage:closenessAddAck(Msg),
	{noreply, State};
handle_info({marriage_resetSkill, _Pid, _Msg}, State)->
	playerMarriage:resetSkill(true, false),
	{noreply, State};
handle_info({marriage_ringUp, _Pid, _Msg}, State)->
	playerMarriage:resetRingPropAdd(false),
	{noreply, State};
handle_info({marriage_acceptTaskAsk, Pid, _}, State)->
	case playerPropSync:getProp(?SerProp_MarriageTaskInfo) of
		{TaskIDCache, _} when TaskIDCache > 0 ->
			FunIsAccept =
				fun(#rec_task{taskID = ID}, {_, _}) ->
					case getCfg:getCfgByKey(cfg_task, ID) of
						#task_newCfg{tasktype = ?TaskMainType_Marriage} ->
							{true, 0};
						_ ->
							{false, 0}
					end
				end,
			case misc:foldlEx(FunIsAccept, {false, 0}, playerState:getAcceptedTask()) of
				{true, _} ->
					psMgr:sendMsg2PS(Pid, marriage_acceptTaskAck, ?ErrorCode_Marriage_AlreadyAcceptTask);
				_ ->
					psMgr:sendMsg2PS(Pid, marriage_acceptTaskAck, ?ErrorCode_Marriage_AcceptTaskDaily)
			end;
		_ ->
			psMgr:sendMsg2PS(Pid, marriage_acceptTaskAck, 0)
	end,
	{noreply, State};
handle_info({marriage_acceptTaskAck, Pid, 0}, State)->
	%% 随机产生一个首任务ID进行接受
	[TaskID|_] = misc:shuffle(marriageState:configTaskFidlist()),
	psMgr:sendMsg2PS(Pid, marriage_acceptTask, TaskID),
	playerMarriageTask:onAcceptTask(TaskID),
	{noreply, State};
handle_info({marriage_acceptTaskAck, _Pid, ErrorCode}, State)->
	playerMsg:sendErrorCodeMsg(ErrorCode),
	{noreply, State};
handle_info({marriage_acceptTask, _Pid, TaskID}, State)->
	playerMarriageTask:onAcceptTask(TaskID),
	{noreply, State};
handle_info({marriage_submitTask, _Pid, TaskID}, State)->
	#rec_marriage{targetRoleID = PartnerRoleID} = marriageState:queryRelation(playerState:getRoleID()),
	playerTask:submitTask(TaskID, 0, PartnerRoleID),
	{noreply, State};
handle_info({marriage_askTask, Pid, {TaskID, Code}}, State)->
	case playerMarriageTask:canSubmitTask(Code) of
		{true, TaskID} ->
			psMgr:sendMsg2PS(Pid, marriage_ackTask, {TaskID, Code});
		{true, TaskID2} ->
			?ERROR_OUT("RoleID(~p) TaskID(~p) TaskID2(~p)", [playerState:getRoleID(), TaskID, TaskID2]),
			psMgr:sendMsg2PS(Pid, marriage_ackTask, {TaskID2, Code});
		_E ->
			psMgr:sendMsg2PS(Pid, marriage_ackTask, {0, Code})
	end,
	{noreply, State};
handle_info({marriage_ackTask, Pid, {TaskID, Code}}, State)->
	playerMarriageTask:submitTask({Pid, TaskID, Code}),
	{noreply, State};
handle_info({marriage_completeTask, _Pid, _TaskID}, State)->
	playerMsg:sendErrorCodeMsg(?ErrorCode_Marriage_CompleteTask),
	{noreply, State};
%% 姻缘系统 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 新版骑宠系统 begin
handle_info({petTerritory_settleAck, _Pid, _Msg}, State)->
	playerPetTerritory:queryTerritory(),
	{noreply, State};
handle_info({petTerritory_rewardAck, _Pid, Msg}, State)->
	[playerPetTerritory:settleReward(MsgCell) || MsgCell <- Msg],
	{noreply, State};
handle_info({petTerritory_searchAck, _Pid, Msg}, State)->
	playerPetTerritory:searchAck(Msg),
	{noreply, State};
handle_info({petTerritory_plunderAck, _Pid, Msg}, State)->
	playerPetTerritory:plunderAck(Msg),
	{noreply, State};
%% 新版骑宠系统 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

handle_info({updateRankMin, _Pid, Msg}, State)->
	playerSevenDayAim:updateCondition(?SevenDayAim_Ranking, [Msg]),
	{noreply, State};
handle_info({updateProtectGod, _Pid, Msg}, State)->
	playerSevenDayAim:updateCondition(?SevenDayAim_ProtectGod, [Msg]),
	{noreply, State};
handle_info({updateMaterial, _Pid, Msg}, State)->
	playerSevenDayAim:updateCondition(?SevenDayAim_Material, [Msg]),
	{noreply, State};
handle_info({joinTeamOK, _Pid, _Msg}, State)->
	playerMarriage:resetSkill(true, true),
	{noreply, State};
handle_info({leaveTeamOK, _Pid, _Msg}, State)->
	playerMarriage:resetSkill(true, true),
	{noreply, State};

% 查询跨服活动报名情况，这里情况比较单一，可以参照采集物采集成功一样把函数列在这里调用
handle_info({cac_queryAck, _FromPid, Msg}, State) ->
	playerState2:setCrossApply(Msg),
	playerRace:onQueryAck(Msg),
	{noreply, State};
% 报名结果反馈，这里情况比较复杂，需要区分不同活动进行处理
handle_info({cac_applyAck, _FromPid, {_ErrorCode, #recCrossApply{activityType = ?ActivityType_CrossRace}} = Msg}, State) ->
	playerRace:onApplyAck(Msg),
	{noreply, State};
% 取消结果反馈，这里情况比较较单一，可以参照采集物采集成功一样把函数列在这里调用
handle_info({cac_cancelAck, _FromPid, Msg}, State) ->
	playerState2:setCrossApply(0),
	playerRace:onCancelAck(Msg),
	{noreply, State};
% 跨服骑宠竞速活动喊你进图啦
handle_info({race_enter, _FromPid, Msg}, State) ->
	playerRace:onNoticeEnter(Msg),
	{noreply, State};
% 收到下一场活动的模式
handle_info({race_mod, _FromPid, Msg}, State) ->
	playerRace:onModAck(Msg),
	{noreply, State};
% 需要添加BUFF，但是不能直接添加所有没有直接调用playerBuff:addBuff/2
handle_info({race_buff, _FromPid, Msg}, State) ->
	playerRace:onBuff(Msg),
	{noreply, State};
% 角色入场后尝试骑乘
handle_info({race_tryMount, _FromPid, Msg}, State) ->
	playerRace:onTryMount(Msg),
	{noreply, State};
% 准备倒计时结束后被通知如果没有骑乘则需要放弃比赛
handle_info({race_tryGiveUp, _FromPid, _Msg}, State) ->
	playerRace:onTryGiveUp(),
	{noreply, State};
% 被通知需要回到普通服
handle_info({backGS, _FromPid, _Msg}, State) ->
	playerCrossLogic:backGS(),
	{noreply, State};

%% 平台gm取消黑名单
handle_info({clearBan, _FromPid, {CallbackPid, CmdSerial}}, State) ->
	playerVariant:setPlayerVariant(?Setting_PlayerVarReadOnly_BeBlackCount, 0),
	psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CmdSerial, 0}),
	{noreply, State};

%%答对奖励
handle_info({answer_isright_addmoney, _Pid, Data}, State) ->
	playerAnswer:answer_right_addreward(Data),
	{noreply, State};

handle_info({addRingBuff, _Pid, Msg}, State) ->
	playerBuff:addRingBuff(Msg),
	{noreply, State};
handle_info({clearRingBuffOfMe, _Pid, Msg}, State) ->
	playerBuff:clearRingBuffFromOther(Msg),
	{noreply, State};

handle_info(Info,State) ->
	?ERROR_OUT("unhandle info:[~p] state[~p] in [~p] [~p,~p]",[Info,State,node(),?MODULE,self()]),
	{noreply,State}.
%% ====================================================================
%% Internal functions
%% ====================================================================

useItem(#recToTargetUseBuffItem{buffID = BuffID, buffID2 = BuffID2, level = Level}) ->
	playerBuff:addBuff(BuffID, Level),
	playerBuff:addBuff(BuffID2, Level);
useItem(#recToTargetCallCarrier{num = Num, arg = Arg, arg1 = Arg1}) ->
	Fun = fun(_) ->
		case Arg of
			#recCallCarrier{} ->
				playerPet:spawnCarrier(Arg1);
			_ ->
				playerPet:spawnMonster(Arg1)
		end
		  end,
	lists:foreach(Fun,lists:seq(1,Num)).

%%Type::(robKickOut|gmKickOut|normal)
notifyLoginServer() ->
	case playerState:getIsPlayer() of
		true ->
%%			playerWorldBossWar:saveMyworldBossDamage(variant:getGlobalBitVariant(?Setting_GlobalBitVar_WorldBossWar_Running)),%%boss战保存伤害
			Type = playerState:getOffLineFlag(),
			?LOG_OUT("notifyLoginServer playerOtp:~p accoutID:~p RoleID:~p OffLine type:~p",
				[self(),playerState:getAccountID(),playerState:getRoleID(),Type]),

			if
				Type =:= ?OffLineTypeRobKickOut orelse Type =:= ?OffLineTypeGmKickOut orelse
					Type =:= ?OffLineTypeNormal orelse Type =:= ?OffLineTypeChangeLine ->

					if
						Type =:= ?OffLineTypeGmKickOut ->
							case playerState:getGMKickoutCallBackPidAndCMDSerial() of
								undefined ->
									skip;
								{CallbackPid,CMDSerial} ->
									%% 异步回馈给gm结果接收进程
									psMgr:sendMsg2PS(CallbackPid, handleMsgAck, {CMDSerial,0})
							end;
						true ->
							skip
					end,
					%% 通知LS删掉此账号登陆信息
					psMgr:sendMsg2PS(?PsNameLS, playerOffline, {playerState:getAccountID(),Type}),

					%% 通知对方好友中有自己的玩家
%%					playerFriend:myStateChangeTellMyFriend(0),
					ok;
				true ->
					?DEBUG_OUT("offline kickout"),
					skip
			end;
		_ ->
			skip
	end.


%% 玩家进程检查网络进程是否还活着
netPidIsAlive() ->
	NetPid = playerState:getNetPid(),
%% 	?DEBUG_OUT("netPidIsAlive[~p]",[self()]),
	Continue = misc:is_process_alive( NetPid ),
	case Continue of
		true ->
			erlang:send_after(1000*5, self(), {netPidIsAlive,self(),{}});
		false ->
			?ERROR_OUT("netPid is die,I wait for reconnect,[~p]",[self()])
%% 			psMgr:sendMsg2PS(self(), netQuit, {})
	end,
	ok.

-spec kickClient(NetPid::pid(),Type::term()) ->ok.
kickClient(NetPid,Type) ->
	IsAlive = misc:is_process_alive(NetPid),
	if
		IsAlive =:= true ->
			psMgr:cast(playerState:getNetPid(), kickOut, Type);
		true ->
			?LOG_OUT("kickout User[~w],but netpid[~w] has exited before",[Type,NetPid])
	end,
	%%由于前面的发消息给网络进程的时候，有可能网络进程在消息还未发送到的时候，已经退出
	%%这个时候，网络进程是无法回复给玩家进程，这样会导致玩家进程退出不了
	%%所以这里需要强制要玩家进程退出
	timer:sleep(1000),
	psMgr:sendMsg2PS(self(), netQuit, "kickOut"),
	ok.

%%======地宫奖励配置
-spec getDemonBattleAwardCnf(Level::integer(),Schedule::integer()) -> #demonrewardCfg{}.
getDemonBattleAwardCnf(Level,Schedule) ->
	#demonrewardCfg{
		expreward = Expreward
	} = getCfg:getCfgPStack(cfg_demonreward, Level),%%根据等级取物品等
	#demonrewardCfg{waverate = Waverate}=getCfg:getCfgPStack(cfg_demonreward, Schedule),%%根据波数取倍率

	#demonrewardCfg{
		expreward = Expreward,
		waverate = Waverate
	}.

-ifdef(RELEASE).

%%只有RELEASE版本才检测外挂
checkExtPlugin() ->
	Now = time:getUTCNowMS(),
	StartTime = playerState:getUseExtPluginStartTime(),
	Count = case Now - StartTime =< 600000 of
				true ->
					%%本次检测到使用外挂在一个计时周期内（10分钟），则计数器加1
					N = playerState:getUseExtPluginCount(),
					case N =:= 0 of
						true ->
							%%记录开始使用外挂的时间
							playerState:setUseExtPluginStartTime(Now);
						_ ->
							skip
					end,
					Num = N + 1,
					playerState:setUseExtPluginCount(Num),
					Num;
				_ ->
					%%距离上次检测到使用外挂的时间超过一个计时周期（10分钟），则使用次数重新开始计算
					playerState:setUseExtPluginCount(1),
					playerState:setUseExtPluginStartTime(Now),
					1
			end,
	checkExtPlugin1(Count),
	ok.

checkExtPlugin1(Num) ->
	case Num >= ?GameProtect_Err_Count of
		true ->
			%%检测到有使用外挂，达到限定次数，封号
			AccountID = playerState:getAccountID(),
			PlayerID = playerState:getRoleID(),
			%%封号
			psMgr:sendMsg2PS(?PsNameLS, gsForbiddenAccount, {AccountID, ?GameProtect_Freeze_Time}),
			%%存日志
			dbLog:sendSaveLogForbidden(PlayerID,AccountID,?ForbiddenType_WG,?GameProtect_Freeze_Time),
			%%踢玩家
			kickClient(playerState:getNetPid(), gmKickOut),
			?WARN_OUT("Role:~p ~ts AID:~p NetPid:~p checkExtPlugin Count:~p today,forbid it",
				[playerState:getRoleID(),
					playerState:getName(),
					playerState:getAccountID(),
					playerState:getNetPid(),
					Num]);
		_ ->
			%%记录下使用外挂的情况
			?WARN_OUT("Role:~p ~ts AID:~p NetPid:~p checkExtPlugin Count:~p today",
				[playerState:getRoleID(),
					playerState:getName(),
					playerState:getAccountID(),
					playerState:getNetPid(),
					Num])
	end,
	ok.

-else.

checkExtPlugin() ->
	ok.

-endif.


%%打印人物属性日志
showProp() ->
	case file:open( "roleProp.txt", [append,raw,binary]) of
		{ok,File} ->
			{Date, Time}   = erlang:localtime(),
			{YYYY,MM,DD}   = Date,
			{Hour,Min,Sec} = Time,

			EquipList = playerState:getPackage(?Item_Location_BodyEquipBag),
			BuffList = playerBuff:getBuffInfoList(),
			BP = playerCalcProp:getBattleProp(),
			S = io_lib:format("[~.4w-~.2.0w-~.2.0w ~.2.0w:~.2.0w:~.2.0w] Role:~p ~ts EquipList:~p~n~n BuffList:~p~n~n BattleProp:~p~n~n~n~n~n",
				[YYYY,MM,DD,Hour,Min,Sec,playerState:getRoleID(),playerState:getName(),EquipList,BuffList,BP]),
			file:write(File, S),
			file:close(File),
			ok;
		_ ->
			skip
	end,
	ok.
