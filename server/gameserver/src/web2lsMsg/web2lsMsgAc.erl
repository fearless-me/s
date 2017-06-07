%% @author luowei
%% @doc @todo 运营活动.


-module(web2lsMsgAc).


-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").
-include("gsDef.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([doMsg/2,msgAck/4]).

-spec doMsg( CmdSerial, Data ) ->term() when
		  CmdSerial::integer(), Data::tuple().
doMsg( CmdSerial, Data ) ->
	?DEBUG_OUT("web2lsMsgAc:~p",[Data]),
	case parseArgs(Data) of
		{OpUser, #rec_operate_activity{id = AcID} = Ac} ->
			web2lsMsgAc({CmdSerial, self(), Ac}),
			put({gmCmdLog,CmdSerial},#recWeb2LsCommandLog{
														  opCode = ?Web2lsMsgAc,
														  opUser = OpUser,
														  opSerial = CmdSerial,
														  arg1  = AcID
														 }),
			
			web2lsNetDispatcher:setCmdResults({gmMsg,CmdSerial},
													  #cmdAckInfo{m=?MODULE, gsNum = 1, beginTime = time:getUTCNowSec() }),
			true;
		_ ->
			false
	end.

-spec msgAck(CmdSerial,S,GSNum,OldGSResults) -> JsonStr when
		  CmdSerial::integer(),S::port(),GSNum::integer(),OldGSResults::list(),JsonStr::string().
msgAck(CmdSerial,S,GSNum,OldGSResults) ->
	?LOG_OUT("web2lsMsgKickoutACK json:~p",[{CmdSerial,S,GSNum,OldGSResults}]),
	erlang:erase({gmMsg,CmdSerial}),
	DealCode = web2lsNetDispatcher:msgDeal(GSNum, OldGSResults),
	
	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, DealCode),
	return2Web(CmdSerial,DealCode).

%% ====================================================================
%% Internal functions
%% ====================================================================
-spec return2Web( CmdSerial, DealCode ) -> JsonStr when
		  CmdSerial::integer(), DealCode::integer(),JsonStr::string().
return2Web( CmdSerial, DealCode ) ->
	web2lsNetDispatcher:sendOpLog2logDb(CmdSerial, DealCode),
	
	SendData = {obj,[
					 {"command",?Web2lsMsgAcAck},
					 {"serial",CmdSerial},
					 {"code",DealCode}
					]},
	rfc4627:encode(SendData).



-spec parseArgs(Data) -> tuple() | false when
		  Data::tuple().
parseArgs(Data) ->
	try
		{ok,OpUser} = rfc4627:get_field(Data,"opUser"),
		{ok,AcID} = rfc4627:get_field(Data,"activityID"),
		{ok,Type} = rfc4627:get_field(Data,"type"),
		{ok,Name} = rfc4627:get_field(Data,"name"),
		{ok,Desc} = rfc4627:get_field(Data,"desc"),
		{ok,BeginTime} = rfc4627:get_field(Data,"beginTime"),
		{ok,EndTime} = rfc4627:get_field(Data,"endTime"),
		{ok,MinLevel} = rfc4627:get_field(Data,"minLevel"),
		{ok,MaxLevel} = rfc4627:get_field(Data,"maxLevel"),
		{ok,Rules} = rfc4627:get_field(Data,"rules"),
		
		{RuleList,NArg2,NArg3,NArg4,NArg5} = makeArgs(Type,Rules),
		Ac = #rec_operate_activity{
			id = AcID,
			type = Type,
			name = Name,
			desc = Desc,
			starttime = BeginTime,
			endtime = EndTime,
			minlevel = MinLevel,
			maxlevel = MaxLevel,
			arg1 = RuleList,
			arg2 = NArg2,
			arg3 = NArg3,
			arg4 = NArg4,
			arg5 = NArg5
		},
		{OpUser, Ac}
	catch
		_:Error ->
			S = erlang:get_stacktrace(),
			?ERROR_OUT("~p   ~p",[Error,S]),
			false
	end.

%%不同活动要重载的arg系列值生成器
-spec makeArgs(Type,Rules) ->{NewRuleList,NArg2,NArg3,NArg4,NArg5} when
		   Type::operateActType(),
		Rules::term(),
		NewRuleList::term(),NArg2::string(),NArg3::string(),NArg4::string(),NArg5::string().
makeArgs(Type,Rules) when 
  Type == ?OperateActType_DiamonCharge orelse Type == ?OperateActType_DiamonUse ->
	Fun = fun(Rule) ->
				  {ok, RuleID} = rfc4627:get_field(Rule,"rule_id"),
				  {ok, ItemList} = rfc4627:get_field(Rule,"item"),
				  {ok, Diamon} = rfc4627:get_field(Rule,"diamon"),
				  #recAcChargeOrUse{
									ruleID = RuleID,
									diamon = Diamon,
									item = ItemList
								   }
		  end,
	RuleList = lists:map(Fun, Rules),
	{RuleList,"","","",""};
makeArgs(?OperateActType_KilledMonster,Rules) ->
	{ok, Rules1, _} = rfc4627:decode(Rules),
	Fun = fun(Rule) ->
		{ok, R, _} = rfc4627:decode(Rule),
		{ok, RuleID} = rfc4627:get_field(R,"rule_id"),
		{ok, RuleType} = rfc4627:get_field(R,"rule_type"),
		{ok, ItemID} = rfc4627:get_field(R,"item_id"),
		{ok, MonsterID} = rfc4627:get_field(R,"monster_id"),
		{ok, DiffLv} = rfc4627:get_field(R,"diff_lv"),
		{ok, Odd} = rfc4627:get_field(R,"odd"),
		{ok, PlayerLimit} = rfc4627:get_field(R,"player_limit"),
		{ok, ServerLimit} = rfc4627:get_field(R,"server_limit"),
		{ok, MapIDs} = rfc4627:get_field(R,"map_ids"),
		#recAcKilledMonster{
			ruleID = RuleID,
			itemID = ItemID,
			diffLv = DiffLv,
			mapIDs = MapIDs,
			monsterID = MonsterID,
			odds = Odd,
			playerLimit = PlayerLimit,
			serverLimit = ServerLimit,
			type = RuleType
		}
	end,
	RuleList = lists:map(Fun, Rules1),
	{RuleList,"","","",""};
makeArgs(?OperateActType_CollectItem,Rules) ->
	Fun = fun(R) ->
		{ok,MapID} = rfc4627:get_field(R,"mapId"),
		{ok,FreshNum} = rfc4627:get_field(R,"freshNum"),
		{ok,TotalFreshNum} = rfc4627:get_field(R,"totalFreshNum"),
		{ok,TurnFreshInterval} = rfc4627:get_field(R,"turnFreshInterval"),
		{ok,CollectID} = rfc4627:get_field(R,"collectId"),
		case getCfg:getCfgByArgs(cfg_mapsetting,MapID) of
			#mapsettingCfg{} ->
				skip;
			_ ->
				?ERROR_OUT("Error MapID:~p,not found in cfg @ Module:~p",[MapID,?MODULE]),
				throw("Error MapID not found in cfg")
		end,
		case getCfg:getCfgByArgs(cfg_object, CollectID) of
			#objectCfg{} ->
				#recAcCollectItemCfg{
					mapID = MapID,									%%地图ID
					freshNum = FreshNum,							%%单次刷新数量
					alreadyFreshNum = 0,                            %%已经刷新的次数
					totalFreshNum = TotalFreshNum,					%%总刷新数量
					turnFreshInterval = TurnFreshInterval * 1000,   %%轮次刷新间隔，单位：毫秒，平台发过来的单位是秒
					collectID = CollectID						    %%采集ID
				};
			_ ->
				?ERROR_OUT("Error collectID:~p,not found in cfg @ Module:~p",[CollectID,?MODULE]),
				throw("Error collectID not found in cfg")
		end
	end,
	RuleList = lists:map(Fun,Rules),
	{RuleList,"","","",""};
makeArgs(?OperateActType_FeastBoss,Rules) ->
	Fun = fun(R) ->
		{ok,MapID} = rfc4627:get_field(R,"mapId"),
		{ok,BossID} = rfc4627:get_field(R,"bossId"),
		{ok,BossNum} = rfc4627:get_field(R,"bossNum"),
		{ok,LineNum} = rfc4627:get_field(R,"lineNum"),
		{ok,Interval} = rfc4627:get_field(R,"intervalTime"),
		#recAcFeastBossCfg{
			mapID = MapID, 
			bossID = BossID, 
			bossNum = BossNum, 
			freshLine = LineNum, 
			freshInterval = Interval		
		}
	end,
	RuleList = lists:map(Fun,Rules),
	{RuleList,"","","",""};
makeArgs(_Type,_Rules) ->
	%%上层会catch异常，给web返回参数错误
	err.

%% 平台gm 平台活动
web2lsMsgAc({CmdSerial,CallbackPid,Ac}) ->
	?LOG_OUT("web2lsMsgAc ~p ,~p", [CmdSerial, Ac]),
	psMgr:sendMsg2PS(?PsNameOperateActivity, updateActivity, {CmdSerial,CallbackPid,Ac}),
	ok.