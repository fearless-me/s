%% @author zhengzhichun
%% @doc @todo Add description to playerACChargeOrUse.


-module(playerACChargeOrUse).
-include("setup.hrl").
-include("playerPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([
		onUseDiamon/1,
		onChargeDiamon/1,
		
		getChargeOrUseList/1,
		getChargeOrUseGift/2,
		
		onPlayerLogin/0
]).
%%client取配置
-spec getChargeOrUseList(Type::uint() ) ->ok.
getChargeOrUseList(Type) ->
	RoleID = playerState:getRoleID(),
	Data = getACData(Type,RoleID),
	Msg = creatMsgData(Type,Data),
	playerMsg:sendNetMsg(Msg),
	ok.

%%client领取奖励，要回一个ack
-spec getChargeOrUseGift(Type::uint(),RuleID::uint64()) ->ok.
getChargeOrUseGift(Type,RuleID) ->
	RoleID = playerState:getRoleID(),
	Data = getACData(Type,RoleID),
	IsOk = doGetChargeOrUseGift(RuleID,Data),
	
	GetStatus = 
		case IsOk of
			true ->?ErrorCode_SystemGettingSuccess;
			false ->?ErrorCode_SystemGettingFailed
		end,
	playerMsg:sendTipsErrorCodeMsg(GetStatus),
	
	Msg = #pk_GS2U_GetChargeOrUseGiftAck{ type=Type, ruleID=RuleID, success =IsOk},
	playerMsg:sendNetMsg(Msg),
	ok.

-spec doGetChargeOrUseGift(RuleID::uint(),Data::tuple()|skip) ->boolean().
doGetChargeOrUseGift(_RuleID,skip) ->
	false;
doGetChargeOrUseGift(RuleID,{Conf,ACData4ID}) ->
	#recAcChargeOrUseData{ diamonAmount = DiamonAmount, 
						   hasTakeRuleIDList =HasList } = ACData4ID,
	case lists:member(RuleID, HasList) of
		true ->true;
		false ->
			RuleIDList = Conf#rec_operate_activity.arg1,
			case lists:keyfind(RuleID, #recAcChargeOrUse.ruleID, RuleIDList) of
				false ->false;
				#recAcChargeOrUse{diamon = DiamonCondtion,item = ItmeJsonStr}  when DiamonAmount >= DiamonCondtion ->
					{ok,AttachmentList,[]} = rfc4627:decode(ItmeJsonStr),
					{ItemSourceCode,MailTitle,MailContent} = 
						case Conf#rec_operate_activity.type of
							?OperateActType_DiamonCharge ->
								MailTitle1 = stringCfg:getString(opACChargeMailTitle, [misc:binToString(Conf#rec_operate_activity.name)]),
								MailContent1 = stringCfg:getString(opACChargeMailContent, [DiamonCondtion]),
								{?ItemSourceOPChargeGift,MailTitle1,MailContent1};
							?OperateActType_DiamonUse ->
								MailTitle2 = stringCfg:getString(opACUseMailTitle, [misc:binToString(Conf#rec_operate_activity.name)]),
								MailContent2 = stringCfg:getString(opACUseMailContent, [DiamonCondtion]),
								{?ItemSourceOPUseGift,MailTitle2,MailContent2}
						end,
					systemMail:sendMail(AttachmentList, [playerState:getRoleID()], ItemSourceCode, MailTitle, MailContent, ""),
					NewOPData = #rec_operate_data
					{
					 roleID = {playerState:getRoleID(),Conf#rec_operate_activity.id},
					 id = Conf#rec_operate_activity.id,
					 arg1 = ACData4ID#recAcChargeOrUseData{hasTakeRuleIDList =[RuleID|HasList]}
					},
					operateActivityLogic:saveAcData(NewOPData),
					true;
				_ ->
					false
			end
	end.

-spec getACData(Type,RoleID) ->{Conf,ACData4ID} |skip when
		  Type::uint(),RoleID::uint64(),
		  Conf::#rec_operate_activity{},ACData4ID::#recAcChargeOrUseData{}.
getACData(Type,RoleID) ->
	case activity:getOperateActCfgByType(Type) of
		[] ->skip;
		[#rec_operate_activity{id=ACID} = Conf |_] ->
			case activity:getOperateActData(RoleID,ACID) of
				[] ->{Conf,#recAcChargeOrUseData{}};
				#rec_operate_data{arg1 = ACData4ID} ->
					{Conf,ACData4ID}
			end
	end.

-spec creatMsgData(Type::uint(),Data::tuple() |skip) -> #pk_GS2U_RequestChargeOrUseListAck{}.
creatMsgData(Type,skip) ->
	#pk_GS2U_RequestChargeOrUseListAck
	{
	 type = Type, 
	 activityName = "", 
	 activityDesc = "", 
	 beginTime = 0, 
	 endTime = 0, 
	 amountInTime = 0, 
	 ruleInfoList = []
	};
creatMsgData(_Type,{Conf,ACData4ID}) ->
	#recAcChargeOrUseData{ diamonAmount = DiamonAmount, 
						   hasTakeRuleIDList =HasList } = ACData4ID,
	F = fun(One,Acc) ->
				IsTake = lists:member(One#recAcChargeOrUse.ruleID, HasList),
				[ #pk_ChargeOrUseRuleInfo{
										ruleID = One#recAcChargeOrUse.ruleID,
										diamon = One#recAcChargeOrUse.diamon,
										itemJson  = misc:binToString(One#recAcChargeOrUse.item),
										hasTake = IsTake
									   } | Acc]
		end,
	RuleInfoList = lists:foldl(F, [], Conf#rec_operate_activity.arg1),
	
	LoaclSecond = time:getLocalTimeAdjustHour()*3600, 
	#pk_GS2U_RequestChargeOrUseListAck
	{
	 type = Conf#rec_operate_activity.type, 
	 activityName =misc:binToString(Conf#rec_operate_activity.name), 
	 activityDesc = misc:binToString(Conf#rec_operate_activity.desc), 
	 beginTime = Conf#rec_operate_activity.starttime + LoaclSecond, 
	 endTime = Conf#rec_operate_activity.endtime + LoaclSecond, 
	 amountInTime = DiamonAmount, 
	 ruleInfoList = RuleInfoList
	 }.

%%消费事件触发
-spec onUseDiamon(UseDiamonAmount::uint()) ->ok.
onUseDiamon(UseDiamonAmount) ->
	onChargeOrUseDiamon(?OperateActType_DiamonUse,UseDiamonAmount).

%%充值事件触发(有try,是安全的)
-spec onChargeDiamon(ChargeDiamonAmount::uint()) ->ok.
onChargeDiamon(ChargeDiamonAmount) ->
	try
		onChargeOrUseDiamon(?OperateActType_DiamonCharge,ChargeDiamonAmount)
	catch
		_:_ ->
			?ERROR_OUT("onChargeDiamon err ~p",[self()])
	end.

-spec onChargeOrUseDiamon(Type::uint(),UseDiamonAmount::uint()) ->ok.
onChargeOrUseDiamon(Type,UseDiamonAmount) ->
	RoleID = playerState:getRoleID(),
	case activity:getOperateActCfgByType(Type) of
		[] ->skip;
		[#rec_operate_activity{id=ACID} = Ac|_] ->
			NewData = 
				case activity:getOperateActData(RoleID,ACID) of
					[] ->
						#rec_operate_data{
										  roleID = {RoleID,ACID},
										  id = ACID,
										  arg1 = 
											  #recAcChargeOrUseData{
																	diamonAmount=UseDiamonAmount
																   }
										 };
					#rec_operate_data{arg1 = Arg1}=OldData ->
						OldData#rec_operate_data{arg1 = 
													 Arg1#recAcChargeOrUseData{
																			   diamonAmount=Arg1#recAcChargeOrUseData.diamonAmount+UseDiamonAmount
																			  }
												}
				end,
			ActArg = #recOperateActivityArg{
											roleID = RoleID,
											lv = playerState:getLevel(),
											type = Type,
											pid = self(),
											arg = NewData
										   },
			activity:castOperateActEvent([Ac], ActArg)
	end,
	ok.

%%充值活动检查，如果有，就点亮icon
-spec onPlayerLogin() ->ok.
onPlayerLogin() ->
	ACList = activity:getOperateActCfgByType(?OperateActType_DiamonCharge)++activity:getOperateActCfgByType(?OperateActType_DiamonUse),
		case ACList of
		[] ->skip;
		_ ->
			Msg = #pk_GS2U_IconLight{
									 id = 1,%%充值活动
									 light = true
									 },
			playerMsg:sendNetMsg(Msg)
		end,
	ok.

