%%
%% @author chengxs
%% @doc @todo 签到模块.


-module(playerSignIn).
-author(chengxs).
-include("gsInc.hrl").
-include("cfg_signinaward.hrl").
-include("playerPrivate.hrl").

-define(Sign_State_Not_Sign, 0).
-define(Sign_State_Signed, 1).
-define(Sign_State_Can_Not_Sign, 2).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	init/0,
	sendSignInfo/0,
	%% 每日签到功能转由协议CMD_U2GS_SignIn与模块playerDailySignIn实现
	%playerEveryDaySignIn/0,
	playerSevenDaySignIn/1,
	setSignIn/1,
	isSignIn/1,
	addLogin/0,
	onFirstLoginEachLevel/1,
	checkAndSendInfo/1,
	bindPhone/5,
	onBindPhoneAck/1,
	onBindPhoneAwardGet/0
]).
%%初始化
init() ->
	case playerState:getIsPlayer() of
		true ->
			AccountID = playerState:getAccountID(),
			%%向查询玩家账号绑定信息
			gsSendMsg:sendMsg2DBServer(getBindPhone, AccountID, {AccountID});
		_ ->
			skip
	end,
	ok.

%%查询玩家当天是否签到
-spec isSignIn(SignType) -> boolean() when
	SignType :: integer().

isSignIn(SignType) ->
	DailyCounter = playerDaily:getDailyCounter(?DailyType_SignIn, SignType),
	case DailyCounter >= 1 of
		true -> true;
		_ ->
			false
	end.

%%查询签到状态
-spec checkSignInState(SignType) -> integer() when
	SignType :: integer().
checkSignInState(SignType) ->
	Level = playerState:getLevel(),
	RoleId = playerState:getRoleID(),
	if
		SignType =:= ?Sign_Type_Daily_Sign_In ->
			IsSign = isSignIn(?Sign_Type_Daily_Sign_In),
			case getCfg:getCfgPStack(cfg_welfare, 1) of
				#welfareCfg{parameter = Value1} ->
					if
						Level < Value1 ->
							%%等级不到不开放每日签到
							?Sign_State_Can_Not_Sign;
						IsSign ->
							?Sign_State_Signed;
						true ->
							?Sign_State_Not_Sign
					end;
				_ ->
					?ERROR_OUT("[~p] cfg_welfare No Config: [1]", [?MODULE]),
					if
						IsSign ->
							?Sign_State_Signed;
						true ->
							?Sign_State_Not_Sign
					end
			end;
		SignType >= ?Sign_Type_SevenDay_Sign_In_1 andalso SignType =< ?Sign_Type_SevenDay_Sign_In_7 ->
			case getCfg:getCfgPStack(cfg_welfare, 2) of
				#welfareCfg{parameter = Value2} ->
					if
						Level < Value2 ->
							%%等级不到不开放七日签到
							?Sign_State_Can_Not_Sign;
						true ->
							case SignType > variant:getPlayerVariant(RoleId, ?Setting_PlayerVarReadOnly_AccLoginDay) of
							%% 还没开启
								true -> ?Sign_State_Can_Not_Sign;
								_ ->
									case getSevenDaySignState(SignType) of
										false ->
											?Sign_State_Not_Sign;%% 未签
										_ ->
											?Sign_State_Signed %% 已签
									end
							end
					end;
				_ ->
					?ERROR_OUT("[~p] cfg_welfare No Config: [2]", [?MODULE]),
					?Sign_State_Can_Not_Sign
			end;
		SignType == ?Sign_Type_Bind_Phone ->
			case getCfg:getCfgPStack(cfg_welfare, 3) of
				#welfareCfg{parameter = Value3} ->
					Num = playerState:getBindPhoneNum(),
					if
						Level < Value3 orelse Num =< 0 orelse Num == undefined ->
							%%等级不到或者没有绑定，不能领取奖励
							?Sign_State_Can_Not_Sign;
						true ->
							case getSevenDaySignState(SignType) of
								false ->
									?Sign_State_Not_Sign;%% 已经领取
								_ ->
									?Sign_State_Signed %% 还没领取
							end
					end;
			_ ->
				?ERROR_OUT("[~p] cfg_welfare No Config: [3]", [?MODULE]),
				?Sign_State_Can_Not_Sign
			end

	end.

-spec getSevenDaySignState(SignType) -> boolean() when
	SignType::integer().
getSevenDaySignState(SignType) ->
	RoleId = playerState:getRoleID(),
	case SignType of
		?Sign_Type_SevenDay_Sign_In_1 ->
			variant:getPlayerBitVariant(RoleId, ?Setting_PlayerBitVarReadOnly_SignPrize1);
		?Sign_Type_SevenDay_Sign_In_2 ->
			variant:getPlayerBitVariant(RoleId, ?Setting_PlayerBitVarReadOnly_SignPrize2);
		?Sign_Type_SevenDay_Sign_In_3 ->
			variant:getPlayerBitVariant(RoleId, ?Setting_PlayerBitVarReadOnly_SignPrize3);
		?Sign_Type_SevenDay_Sign_In_4 ->
			variant:getPlayerBitVariant(RoleId, ?Setting_PlayerBitVarReadOnly_SignPrize4);
		?Sign_Type_SevenDay_Sign_In_5 ->
			variant:getPlayerBitVariant(RoleId, ?Setting_PlayerBitVarReadOnly_SignPrize5);
		?Sign_Type_SevenDay_Sign_In_6 ->
			variant:getPlayerBitVariant(RoleId, ?Setting_PlayerBitVarReadOnly_SignPrize6);
		?Sign_Type_SevenDay_Sign_In_7 ->
			variant:getPlayerBitVariant(RoleId, ?Setting_PlayerBitVarReadOnly_SignPrize7);
		?Sign_Type_Bind_Phone ->
			variant:getPlayerBitVariant(RoleId, ?Setting_PlayerBitVarReadOnly_BindPhonePrize)
	end.

-spec setSevenDaySignState(SignType) -> boolean() when
	SignType::integer().
setSevenDaySignState(SignType) ->
	case SignType of
		?Sign_Type_SevenDay_Sign_In_1 ->
			playerVariant:setPlayerBitVariant(?Setting_PlayerBitVarReadOnly_SignPrize1, true);
		?Sign_Type_SevenDay_Sign_In_2 ->
			playerVariant:setPlayerBitVariant(?Setting_PlayerBitVarReadOnly_SignPrize2, true);
		?Sign_Type_SevenDay_Sign_In_3 ->
			playerVariant:setPlayerBitVariant(?Setting_PlayerBitVarReadOnly_SignPrize3, true);
		?Sign_Type_SevenDay_Sign_In_4 ->
			playerVariant:setPlayerBitVariant(?Setting_PlayerBitVarReadOnly_SignPrize4, true);
		?Sign_Type_SevenDay_Sign_In_5 ->
			playerVariant:setPlayerBitVariant(?Setting_PlayerBitVarReadOnly_SignPrize5, true);
		?Sign_Type_SevenDay_Sign_In_6 ->
			playerVariant:setPlayerBitVariant(?Setting_PlayerBitVarReadOnly_SignPrize6, true);
		?Sign_Type_SevenDay_Sign_In_7 ->
			playerVariant:setPlayerBitVariant(?Setting_PlayerBitVarReadOnly_SignPrize7, true);
		?Sign_Type_Bind_Phone ->
			playerVariant:setPlayerBitVariant(?Setting_PlayerBitVarReadOnly_BindPhonePrize, true)
	end.
%%是否七天签到都签了
-spec isAllSigned() -> boolean().
isAllSigned() ->
	RoleId = playerState:getRoleID(),

	case variant:getPlayerVariant(RoleId, ?Setting_PlayerVarReadOnly_AccLoginDay) >= 7 of
		false ->
			false;
		_ ->
			variant:getPlayerBitVariant(RoleId, ?Setting_PlayerBitVarReadOnly_SignPrize1) andalso
				variant:getPlayerBitVariant(RoleId, ?Setting_PlayerBitVarReadOnly_SignPrize2) andalso
				variant:getPlayerBitVariant(RoleId, ?Setting_PlayerBitVarReadOnly_SignPrize3) andalso
				variant:getPlayerBitVariant(RoleId, ?Setting_PlayerBitVarReadOnly_SignPrize4) andalso
				variant:getPlayerBitVariant(RoleId, ?Setting_PlayerBitVarReadOnly_SignPrize5) andalso
				variant:getPlayerBitVariant(RoleId, ?Setting_PlayerBitVarReadOnly_SignPrize6) andalso
				variant:getPlayerBitVariant(RoleId, ?Setting_PlayerBitVarReadOnly_SignPrize7)

	end.

%%设置玩家签到
-spec setSignIn(SignType) -> ok when
	SignType :: integer().

setSignIn(SignType) ->
	playerDaily:incDailyCounter(?DailyType_SignIn, SignType),
	ok.


%% 每日签到功能转由协议CMD_U2GS_SignIn与模块playerDailySignIn实现
%-spec playerEveryDaySignIn() -> ok.
%playerEveryDaySignIn() ->
%	Level = playerState:getLevel(),
%	case getCfg:getCfgPStack(cfg_welfare, 1) of
%		#welfareCfg{parameter = Value} ->
%			if
%				Level >= Value ->
%					case isSignIn(?Sign_Type_Daily_Sign_In) of
%					%%当天没签过
%						false ->
%							setSignIn(?Sign_Type_Daily_Sign_In),
%							ItemInfoList = getSignAwardInfoList(?Sign_Type_Daily_Sign_In),
%							createRewardItems(ItemInfoList),%%获取奖励
%							%%签到成就统计
%							playerAchieve:achieveEvent(?Achieve_SignIn, [1]),
%							playerMsg:sendNetMsg(#pk_EveryDaySignIn{}),
%							ok;
%					%%当天签过了
%						_ ->
%							playerMsg:sendErrorCodeMsg(?ErrorCode_SignIn_Have_Signed),
%							ok
%					end;
%				true ->
%					playerMsg:sendErrorCodeMsg(?ErrorCode_SignIn_Can_Not_Signed)
%			end;
%		_ ->
%			?ERROR_OUT("[~p] No Config: [1]", [?MODULE])
%	end.

-spec playerSevenDaySignIn(DayCount) -> ok when
	DayCount :: integer().
playerSevenDaySignIn(DayCount) ->
	?DEBUG_OUT("[DebugForSignIn] playerSevenDaySignIn DayCount(~p)", [DayCount]),
	Level = playerState:getLevel(),
	AccLoginDay = variant:getPlayerVariant(playerState:getRoleID(), ?Setting_PlayerVarReadOnly_AccLoginDay),
	case AccLoginDay >= DayCount of
		true ->
			case getCfg:getCfgPStack(cfg_welfare, 2) of
				#welfareCfg{parameter = Value} ->
					if
						Level >= Value ->
							case getSevenDaySignState(DayCount) of
							%% 没签过
								false ->
									%% 先设为签过再发奖
									case setSevenDaySignState(DayCount) of
										true ->
											ItemInfoList = getSignAwardInfoList(DayCount),
											createRewardItems(ItemInfoList),%%获取奖励
											?LOG_OUT("player [~p] playerSevenDaySignIn success day [~p]!", [playerState:getRoleID(),DayCount]),
											playerMsg:sendNetMsg(#pk_SevenDaySignIn{dayCount = DayCount});
										_ ->
											playerMsg:sendErrorCodeMsg(?ErrorCode_SignIn_Can_Not_Signed)
									end;
							%% 已经签过了
								_ ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_SignIn_Have_Signed)
							end;
						true ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_SignIn_Can_Not_Signed)
					end;
				_ ->
					?ERROR_OUT("[~p] cfg_welfare No Config: [2]", [?MODULE])
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_SignIn_Can_Not_Signed)
	end.


%%发送签到相关信息
-spec sendSignInfo() -> ok.
sendSignInfo() ->
	Fun = fun(SignType, AccItemList) ->
		ItemInfoList = getItemInfoToSend(SignType),
		State = checkSignInState(SignType),
		SignInfo = #pk_SignInInfo{
			signType = SignType,
			itemList = ItemInfoList,
			signState = State
		},
		[SignInfo | AccItemList]
	end,

	Time = time:getSyncTime1970FromDBS(),
	IsAllSigned = isAllSigned(),
	TypeList = case IsAllSigned of
				   true ->
					   case getSevenDaySignState(?Sign_Type_Bind_Phone) of
						   false ->
							   lists:append([?Sign_Type_Daily_Sign_In], [?Sign_Type_Bind_Phone]);
						   _ ->
							   [?Sign_Type_Daily_Sign_In]
					   end;
				   _ ->
					   case getSevenDaySignState(?Sign_Type_Bind_Phone) of
						   false ->
							   lists:append(?Sign_Type_List, [?Sign_Type_Bind_Phone]);
						   _ ->
							   ?Sign_Type_List
					   end
			   end,

	SignInfoList = lists:foldl(Fun, [], TypeList),
	playerMsg:sendNetMsg(#pk_GS2U_SignIn{info_list = lists:reverse(SignInfoList), time = Time}).

%%根据签到类型获取奖励信息列表（{道具id，道具数量}）
-spec getSignAwardInfoList(SignType) -> InfoList when
	SignType::uint(),
	InfoList::list().
getSignAwardInfoList(SignType) ->
	ItemList = getCfg:get2KeyList(cfg_signinaward,SignType),
	FunItemInfo = fun(ItemID, AccItemInfoList) ->
		case getCfg:getCfgPStack(cfg_signinaward, SignType, ItemID) of
			#signinawardCfg{itemnum = ItemNum} ->
				[{ItemID, ItemNum} | AccItemInfoList];
			_ ->
				skip
		end
	end,
	ItemInfoList = lists:foldl(FunItemInfo, [], ItemList),
	ItemInfoList.
%%根据道具信息列表生成奖励{道具id，道具数量}
createRewardItems(ItemInfoList) ->
	Fun = fun({ItemID, ItemNum}) ->
		case erlang:is_integer(ItemID) andalso ItemNum > 0 of
			true ->
				Plog = #recPLogTSItem{
					old = 0,
					new = ItemNum,
					change = ItemNum,
					target = ?PLogTS_PlayerSelf,
					source = ?PLogTS_SignIn,
					gold = 0,
					goldtype = 0,
					changReason = ?ItemSourceSignIn,
					reasonParam = 0
				},
				playerPackage:addGoodsAndMail(ItemID, ItemNum, true, 0, Plog);
			_ ->
				skip
		end
	end,
	lists:foreach(Fun, ItemInfoList),
	ok.
%%获取要发送的itemlist
getItemInfoToSend(SignType) ->
	ItemList = getCfg:get2KeyList(cfg_signinaward,SignType),
	FunItemInfo = fun(ItemID, AccItemInfoList) ->
		case getCfg:getCfgPStack(cfg_signinaward, SignType, ItemID) of
			#signinawardCfg{itemnum = ItemNum} ->
				SignItem = #pk_SignItem{
					itemID = ItemID,
					itemNumber = ItemNum
				},
				[SignItem | AccItemInfoList];
			_ ->
				AccItemInfoList
		end
	end,
	ItemInfoList = lists:foldl(FunItemInfo, [], ItemList),
	%%反转下
	ItemInfoListReverse = lists:reverse(ItemInfoList),
	ItemInfoListReverse.
%%累计登陆
addLogin() ->
	Level = playerState:getLevel(),
	addLogin(Level).
-spec addLogin(Level) -> ok when
	Level::uint().
addLogin(Level) ->
	RoleId = playerState:getRoleID(),
	case getCfg:getCfgPStack(cfg_welfare, 2) of
		#welfareCfg{parameter = Value} ->
			if
				Level >= Value ->
					IsSigned = isSignIn(?Sign_Type_SevenDay_Sign_In),
					if
						IsSigned ->
							skip;
						true ->
							addDayCount(RoleId)
					end,
					countRefreshTime();
				true ->
					skip
			end;
		_ ->
			?ERROR_OUT("[~p] cfg_welfare No Config: [2]", [?MODULE])
	end.
-spec onFirstLoginEachLevel(Level :: uint()) -> ok.
onFirstLoginEachLevel(Level) ->
	case getCfg:getCfgPStack(cfg_welfare, 1) of
		#welfareCfg{parameter = Value1} ->
			case getCfg:getCfgPStack(cfg_welfare, 2) of
				#welfareCfg{parameter = Value2} ->
					Min = erlang:min(Value1, Value2),
				if
					Level =:= Value2 ->
						addLogin(Level),
						checkAndSendInfo(Level);
					Level =:= Min ->
						checkAndSendInfo(Level);
					true ->
						skip
				end;
			_ ->
				?ERROR_OUT("[~p] cfg_welfare No Config: [2]", [?MODULE])
			end;
		_ ->
			?ERROR_OUT("[~p] cfg_welfare No Config: [1]", [?MODULE])
	end.

%% 检查是否发送签到消息，如果可发则发送
-spec checkAndSendInfo(Level :: uint()) -> ok.
checkAndSendInfo(Level) ->
	%%开启的时候无论如何发一次
	case getCfg:getCfgPStack(cfg_welfare, 2) of
		#welfareCfg{parameter = Value} ->
			case Level =:= Value of
				true ->
					playerState:setSignInInfoSendFlag(true),
					playerSignIn:sendSignInfo();
				_ ->
					skip
			end;
		_ ->
			?ERROR_OUT("[~p] cfg_welfare No Config: [2]", [?MODULE])
	end,

	IsSend = playerState:getSignInInfoSendFlag(),
	if
		IsSend ->
			skip;
		true ->
			case getCfg:getCfgPStack(cfg_welfare, 1) of
				#welfareCfg{parameter = Value1} ->
					case getCfg:getCfgPStack(cfg_welfare, 2) of
						#welfareCfg{parameter = Value2} ->
							Value3 = erlang:min(Value1, Value2),
							case Level >= Value3 of
								true ->
									playerState:setSignInInfoSendFlag(true),
									playerSignIn:sendSignInfo();
								false ->
									skip
							end;
						_ ->
							?ERROR_OUT("[~p] cfg_welfare No Config: [2]", [?MODULE])
					end;
				_ ->
					?ERROR_OUT("[~p] cfg_welfare No Config: [1]", [?MODULE])
			end
	end.

addDayCount(RoleId) ->
	playerSignIn:setSignIn(?Sign_Type_SevenDay_Sign_In),
	DayCount = variant:getPlayerVariant(RoleId, ?Setting_PlayerVarReadOnly_AccLoginDay),
	case DayCount < 7 of
		true ->
			playerVariant:setPlayerVariant(?Setting_PlayerVarReadOnly_AccLoginDay, DayCount + 1);
		_ ->
			skip
	end.

countRefreshTime() ->
	%%计算下次刷新时间，如果玩家在线才好刷新
	Time = time:getSyncTime1970FromDBS(),
	{{Y, M, D}, {_H, _Min, _S}} = time:convertSec2DateTime(Time),
	RefreshTime = time:convertDateTime1970ToSec({{Y, M, D}, {?ResetTimeHour, 0, 0}}),
	if
		RefreshTime < Time ->
			?WARN_OUT("sign countRefreshTime [~p]",[RefreshTime + ?One_Day_Second - Time]),
			erlang:send_after((RefreshTime + ?One_Day_Second - Time) * 1000, self(), refreshLogin);
		true ->
			?WARN_OUT("sign countRefreshTime [~p]",[RefreshTime - Time + 1]),
			erlang:send_after((RefreshTime - Time + 1) * 1000, self(), refreshLogin)
	end.

%%绑定手机号
bindPhone(FuncellCilentID, AccToken, PhoneNum, Verifyid, Content) ->
	Num = playerState:getBindPhoneNum(),
	%%如果角色没绑定就绑定
	case Num == 0 orelse Num == undefined of
		true ->
			psMgr:sendMsg2PS(?PsNameLS, verifyBindPhone, {FuncellCilentID, AccToken, PhoneNum, Verifyid, Content});
		_ ->
			%%账号已经绑定了手机号
			playerMsg:sendErrorCodeMsg(?ErrorCode_BindPhone_Role_Has_Bind)
	end.

%%绑定手机结果处理
onBindPhoneAck(Results) ->
	{Ret, Num} = Results,
	case Ret of
		skip ->
			%%平台返回的json有问题
			playerMsg:sendErrorCodeMsg(?ErrorCode_BindPhone_Funcell_Error);
		{failed, ErrorMsg} ->
			if
				ErrorMsg =:= <<"PAB101">> ->
					%%账户已绑定相同账号,但是角色没绑定
					playerState:setBindPhoneNum(Num),
					gsSendMsg:sendMsg2DBServer(setBindPhone, playerState:getAccountID(), {playerState:getRoleID(), Num}),
					playerMsg:sendNetMsg(#pk_GS2U_BindPhoneResult{isSuccess = true});
				ErrorMsg =:= <<"PAB102">> ->
					%%手机号码已绑定其他账号
					playerMsg:sendErrorCodeMsg(?ErrorCode_BindPhone_Number_Has_Bind);
				ErrorMsg =:= <<"PAB103">> ->
					%%账户绑定的号码与输入不一致
					playerMsg:sendErrorCodeMsg(?ErrorCode_BindPhone_Number_Is_Different);
				true ->
					%%绑定失败
					playerMsg:sendErrorCodeMsg(?ErrorCode_BindPhone_Failed)
			end;
		{success, _Msg} ->
			playerState:setBindPhoneNum(Num),
			Account = playerState:getAccountID(),
			gsSendMsg:sendMsg2DBServer(setBindPhone, Account, {Account, Num}),
			playerMsg:sendNetMsg(#pk_GS2U_BindPhoneResult{isSuccess = true}),
			%%绑定成功
			playerMsg:sendErrorCodeMsg(?ErrorCode_BindPhone_Bind_Success)
	end.
onBindPhoneAwardGet() ->
	Num = playerState:getBindPhoneNum(),

	case Num == 0 orelse Num == undefined of
		false ->
			case getSevenDaySignState(?Sign_Type_Bind_Phone) of
				false ->
					setSevenDaySignState(?Sign_Type_Bind_Phone),
					ItemInfoList = getSignAwardInfoList(?Sign_Type_Bind_Phone),
					createRewardItems(ItemInfoList),
					playerMsg:sendNetMsg(#pk_BindPhoneAwardGet{});
				_ ->
					%%已经领取了奖励了
					playerMsg:sendErrorCodeMsg(?ErrorCode_BindPhone_Has_Get_Award)
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_BindPhone_Not_Bind)
	end.


