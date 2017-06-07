%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2015, <公司>
%%% @doc
%%%
%%% @end
%%% Created : 17. 六月 2015 10:51
%%%-------------------------------------------------------------------

-module(operateExchangeLogic).
-author("ZhongYuanWei").

-include("operateActivityPrivate.hrl").

-define(HandleExchangeOK, 	   					0).		%% 更新成功
-define(HandleExchangeDelFailed,   		    -1001).		%% 未配置的兑换,操作失败
-define(HandleExchangeError1,   		    -1002).
-define(HandleExchangeError2,   		    -1003).

%% API
-export([
	refreshExchange/2,
	handleExchange/4
]).

refreshExchange(RoleID,NetPid) ->
	ExchangeList = edb:readAllRecord(rec_operate_exchange),
	NowTime = time:getSyncUTCTime1970FromDBS() - ?SECS_FROM_0_TO_1970,
	Fun = fun(#rec_operate_exchange{startTime = ST,endTime = ET} = V) ->
		case NowTime >= ST andalso NowTime < ET of
			true ->
				showExchange(RoleID,NetPid,V),
				ok;
			_ ->
				skip
		end
	end,
	lists:foreach(Fun,ExchangeList),
	ok.

showExchange(RoleID,NetPid,#rec_operate_exchange{id = ID,exchangeType = Type,exchangeTarget = Arg,exchangeNum = Num,
	require = RequireList,limitCount = MaxCount,startTime = ST,endTime = ET,name = Name,title = Title,content = Content}) ->
	Fun = fun({ItemID,ItemNum},AccIn) ->
		[#pk_OperateActExchangeRequire
		{
			itemID = ItemID,
			itemNum = ItemNum
		} | AccIn]
	end,
	List = lists:foldl(Fun,[],RequireList),
	CurCount = case getExchangeRoleData({RoleID,ID}) of
		           #rec_operate_exchange_data{exchangeCount = Count} ->
			           Count;
		           _ ->
			           0
	           end,
	AdjustTime = time:getLocalTimeAdjustHour() * 3600,
	Msg = #pk_GS2U_OperateAct_Exchange{
		exchangeID = ID,
		exchangeType = Type,
		exchangeArg = Arg,
		exchangeNum = Num,
		requireList = List,
		startTime = ST + AdjustTime,
		endTime = ET + AdjustTime,
		name = Name,
		title = Title,
		content = Content,
		roleExchangedNum = CurCount,
		roleMaxExchangeNum = MaxCount
	},
	%%?WARN_OUT("ExchangeID:~p CurCount:~p",[ID,CurCount]),
    gsSendMsg:sendNetMsg(NetPid, Msg).

handleExchange(PidFromLS, CmdSerial, OpCode, Arg) ->
	try
		case OpCode of
			add ->
				addExchange(PidFromLS, CmdSerial, Arg);
			del ->
				delExchange(PidFromLS, CmdSerial, Arg);
			_ ->
				skip
		end
	catch
		_: Why ->
			?ERROR_OUT("handleExchange:~p ~p exception:~p",[OpCode,Arg,Why])
	end,		
	ok.


%%增加配置
addExchange(PidFromLS, CmdSerial, #rec_operate_exchange{} = Exchange) ->
	ID = getActExchangeMaxID() + 1,
	saveExchange(Exchange#rec_operate_exchange{id = ID}),
	psMgr:sendMsg2PS(PidFromLS, handleMsgAck, {CmdSerial, ?HandleExchangeOK}),
	ok.

%%删除配置
delExchange(PidFromLS, CmdSerial, ActID) when erlang:is_integer(ActID), ActID > 0 ->
	Ret = case getActExchange(ActID) of
		      #rec_operate_exchange{} = EX ->
			      saveExchange(EX#rec_operate_exchange{endTime = 0}),
			      edb:deleteRecord(rec_operate_exchange,ActID),
			      ?HandleExchangeOK;
		      _ ->
			      ?HandleExchangeDelFailed
	      end,
	psMgr:sendMsg2PS(PidFromLS, handleMsgAck, {CmdSerial, Ret}),
	ok.

%%获取活动兑换的配置信息
getActExchange(ActID) ->
	case edb:readRecord(rec_operate_exchange, ActID) of
		[#rec_operate_exchange{} = V] ->
			V;
		_ ->
			[]
	end.

%%获取当前最大的ID
getActExchangeMaxID() ->
	List = edb:selectRecord(qlc:q([ID || #rec_operate_exchange{id = ID} <- mnesia:table(rec_operate_exchange)])),
	case List of
		[] ->
			0;
		_ ->
			lists:max(List)
	end.

getExchangeRoleData(Key) ->
	case edb:readRecord(rec_operate_exchange_data,Key) of
		[#rec_operate_exchange_data{} = V] ->
			V;
		_ ->
			[]
	end.


%%保存运营活动的兑换配置
saveExchange(#rec_operate_exchange{id = ID} = V) ->
	edb:checkAndSave(rec_operate_exchange,ID,V,new_rec_operate_exchange,update_rec_operate_exchange).