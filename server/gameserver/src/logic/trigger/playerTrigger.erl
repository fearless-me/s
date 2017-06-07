%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. 九月 2016 11:55
%%%-------------------------------------------------------------------
-module(playerTrigger).
-author("wenshaofei").
-include("../private_logic.hrl").
%% API
-compile(export_all).
%%增加玩家每日计数数据
addPlayerDailyCountByCfgArgu(#triggerCfg{argu = [DailyType, DailyID, AddValue]} = Cfg, Args, FromCondationArgu) ->
	?CheckDailyType(DailyType),
	OldValue = playerDaily:getDailyCounter(DailyType, DailyID),
	ok = playerDaily:incCounter(DailyType, DailyID, AddValue + OldValue),
	triggerLib:getSuccessReturn(Cfg, Args, FromCondationArgu).
%%程序自己控制每日计数器增加的值
addPlayerDailyCountByProgram(#triggerCfg{} = Cfg, FromProgramArgs, FromCondationArgu) ->
	{ok, [DailyType, DailyID, AddValue]} = logicLib:getLogicArguValue(?LK_ADD_DAILY_COUNTER, FromProgramArgs),
	?CheckDailyType(DailyType),
	OldValue = playerDaily:getDailyCounter(DailyType, DailyID),
	ok = playerDaily:incCounter(DailyType, DailyID, AddValue + OldValue),
	triggerLib:getSuccessReturn(Cfg, FromProgramArgs, FromCondationArgu).

%%通过货币的使用规则来进行扣除CoinType货币类型,Value货币值，Reason货币消耗原因码，Target货币去向
useCoinByRuleFromConfig(#triggerCfg{id = TriggerID, argu = [CoinType, ValueList, Reason, Target]} = Cfg, Args, FromCondationArgu) when is_list(ValueList) ->
	Num = case Reason of
			  ?CoinBuyActionPoint->
				  playerDaily:getDailyCounter(?DailyType_Action_Piont_Buy_Number, 0);
			  _ ->
				  1
		  end,
	Value = misc:getListValue(Num+1,lists:reverse(ValueList)),
	playerMoney:useCoin(CoinType, Value, #recPLogTSMoney{reason = Reason, param = TriggerID, target = Target, source = ?PLogTS_PlayerSelf}),
	triggerLib:getSuccessReturn(Cfg, Args, FromCondationArgu);
useCoinByRuleFromConfig(#triggerCfg{id = TriggerID, argu = [CoinType, Value, Reason, Target]} = Cfg, Args, FromCondationArgu) ->
	playerMoney:useCoin(CoinType, Value, #recPLogTSMoney{reason = Reason, param = TriggerID, target = Target, source = ?PLogTS_PlayerSelf}),
	triggerLib:getSuccessReturn(Cfg, Args, FromCondationArgu).
%%通过货币类型来进行扣钱CoinType货币类型,Value货币值，Reason货币消耗原因码，Target货币去向
decCoinByTypeFromConfig(#triggerCfg{id = TriggerID, argu = [CoinType, Value, Reason, Target]} = Cfg, Args, FromCondationArgu) ->
	playerMoney:useCoin(CoinType, Value, #recPLogTSMoney{reason = Reason, param = TriggerID, target = Target, source = ?PLogTS_PlayerSelf}),
	triggerLib:getSuccessReturn(Cfg, Args, FromCondationArgu).
%%通过程序给玩家添加道具，如果背包满了则发送邮件
addGoodsAndMailByProgram(#triggerCfg{argu = [Source,Reason]} = Cfg, FromProgramArgs, FromCondationArgu) ->
	{ok, ItemInfoList} = logicLib:getLogicArguValue(?LK_ADD_GOODS_AND_MAIL, FromProgramArgs),
	GiveItemToPlayer =
		fun({ItemId, ItemNumber, IsBindInt}) ->
			Quality = case goods:getGoodsCfg(ItemId) of
						  #equipmentCfg{qualityType = TempQuality} ->
							  TempQuality;
						  #itemCfg{} ->
							  0;
						  _ ->
							  ?ERROR_OUT("Error ItemId[~p] in ~p:give_goods_to_player", [ItemId, {?MODULE, ?LINE}]),
							  throw("Error in getGoodsCfg")
					  end,
			Plog = #recPLogTSItem{
				old = 0,
				new = ItemNumber,
				change = ItemNumber,
				target = ?PLogTS_PlayerSelf,%%
				source =Source,%%
				gold = ItemId,
				goldtype = 0,
				changReason = Reason,
				reasonParam = 0
			},
			IsBind = IsBindInt =:= 1,
			playerPackage:addGoodsAndMail(ItemId, ItemNumber, IsBind, Quality, Plog)
		end,
	[GiveItemToPlayer(E) || E <- ItemInfoList],
	triggerLib:getSuccessReturn(Cfg, FromProgramArgs, FromCondationArgu).

%%通过程序给玩家发送道具邮件
sendGoodsMailByProgram(#triggerCfg{id = ID, argu = [MailTitleKey, MailContextKey, ItemSource]} = Cfg, FromProgramArgs, FromCondationArgu) ->
	{ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, FromProgramArgs),
	{ok, {MailTitleFormatArgu, MailContextFormatArgu, ItemInfoList}} = logicLib:getLogicArguValue(?LK_MAIL_GOODS, FromProgramArgs),
	TempMailItems = [playerMail:createMailGoods(ItemID, ItemNumber, IsBindInt =:= 0,0, RoleID, ItemSource) || {ItemID, ItemNumber, IsBindInt} <- ItemInfoList],
	?DEBUG_OUT("MailItems========~p~n",[{MailContextKey, MailContextFormatArgu}]),
	MailItems=lists:flatten(TempMailItems),
	Title = stringCfg:getString(MailTitleKey, MailTitleFormatArgu),
	Content = stringCfg:getString(MailContextKey, MailContextFormatArgu),
	mail:sendSystemMail(RoleID, Title, Content, MailItems, integer_to_list(ID)),
	triggerLib:getSuccessReturn(Cfg, FromProgramArgs, FromCondationArgu).


%%通过程序给玩家发送道具邮件
sendGoodsMailByCfg(#triggerCfg{id = ID, argu = [MailTitleKey, MailContextKey, ItemSource,ItemID, ItemNumber, IsBindInt]} = Cfg, FromProgramArgs, FromCondationArgu) ->
	{ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, FromProgramArgs),
	case  logicLib:getLogicArguValue(?LK_MAIL_GOODS, FromProgramArgs) of
		{ok,{MailTitleFormatArgu, MailContextFormatArgu, []}} ->
			ok;
		_->
			MailTitleFormatArgu=[],
			MailContextFormatArgu=[]
	end,
	MailItems=playerMail:createMailGoods(ItemID, ItemNumber, IsBindInt =:= 0, RoleID, ItemSource) ,
	Title = stringCfg:getString(MailTitleKey, MailTitleFormatArgu),
	Content = stringCfg:getString(MailContextKey, MailContextFormatArgu),
	mail:sendSystemMail(RoleID, Title, Content, MailItems, integer_to_list(ID)),
	triggerLib:getSuccessReturn(Cfg, FromProgramArgs, FromCondationArgu).

%%给玩家加经验
addExpCurrentRole(#triggerCfg{id = ID, argu = [ExpValue, Reason]} = Cfg, FromProgramArgs, FromCondationArgu) ->
	playerBase:addExp(ExpValue, Reason, ID),
	triggerLib:getSuccessReturn(Cfg, FromProgramArgs, FromCondationArgu).
%%通过程序给当前的用户增加经验
addExpCurrentRoleByProgrom(#triggerCfg{id = ID} = Cfg, FromProgramArgs, FromCondationArgu) ->
	case logicLib:getLogicArguValue(?LK_EXP_VALUE, FromProgramArgs) of
		{ok,{ExpValue, Reason}} ->
			ReasonArgu=ID;
		{ok,{ExpValue, Reason,ReasonArgu}}->
			ok
	end ,
	playerBase:addExp(ExpValue, Reason, ReasonArgu),
	triggerLib:getSuccessReturn(Cfg, FromProgramArgs, FromCondationArgu).

%%给用户添加buff
addBuffCurrentRole(#triggerCfg{argu = BuffIDs} = Cfg, FromProgramArgs, FromCondationArgu) ->
	RoleLevel = playerState:getLevel(),
	[ ?DEBUG_OUT("=======addBuffCurrentRole==22222=====~p~n",[{playerState:getRoleID(),Cfg,BuffID}]) || BuffID <- BuffIDs],
	[playerBuff:addBuff(BuffID, RoleLevel) || BuffID <- BuffIDs],
	triggerLib:getSuccessReturn(Cfg, FromProgramArgs, FromCondationArgu).
%%将buff添加到筛选出来的目标上面
addBuff2SelectTarget(#triggerCfg{argu = BuffIDs} = Cfg, FromProgramArgs, FromCondationArgu) ->
	{ok, AddBuffRoleIDList} = logicLib:getLogicArguValue(?LK_TARGET_ROLE_ID_LIST, FromProgramArgs),
	?DEBUG_OUT("=======addBuff2SelectTarget=======~p~n",[{AddBuffRoleIDList,BuffIDs}]),
	lists:foreach(
		fun(RoleID) ->

			[#rec_base_role{level = Level}] = ets:lookup(ets_rec_base_role, RoleID),

			?DEBUG_OUT("=======addBuff2SelectTarget=======~p~n",[{AddBuffRoleIDList,BuffIDs}]),
			[gsSendMsg:sendRolePidMsgByRoleID(RoleID, addBuff, {Level,BuffID}) || BuffID <- BuffIDs]
		end, AddBuffRoleIDList),
	triggerLib:getSuccessReturn(Cfg, FromProgramArgs, FromCondationArgu).