%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2015, <公司>
%%% @doc
%%%
%%% @end
%%% Created : 20. 七月 2015 19:41
%%%-------------------------------------------------------------------

-module(operateActivityCollectItemLogic).
-author("ZhongYuanWei").

-include("operateActivityPrivate.hrl").

%% API
-export([
	init/0,
	executeAct/2,
	onCreateNewMap/2,
	spawnCollectAck/4
]).

%%回调函数
-export([
	startAct/1,
	closeAct/1,
	tick/1,
	addAct/1,
	updateAct/2
]).

-record(recRefreshData,{
	mapPid,
	mapID,
	x,
	y,
	code,
	collectID
}).


init() ->
	operateActivityLogic:addActHandler(?OperateActType_CollectItem,?MODULE),
	ok.

startAct(#rec_operate_activity{id = ActID,type = ?OperateActType_CollectItem,arg1 = CfgArgList} = Act) ->
	Fun = fun(#recAcCollectItemCfg{} = Cfg,AccIn) ->
		[refreshCfg(Cfg,ActID) | AccIn]
	end,
	CfgList = lists:foldl(Fun,[],CfgArgList),
	Act#rec_operate_activity{arg1 = CfgList}.

refreshCfg(#recAcCollectItemCfg{
	mapID = MapID,									    %%地图ID
	freshNum = FreshNum,								%%单次刷新数量
	alreadyFreshNum = AlreadyFreshNum,                  %%已经刷新的数量
	totalFreshNum = TotalFreshNum,						%%总刷新数量
	collectID = CollectID,								%%采集ID
	turnFreshInterval = TFI
} = Cfg,ActID) ->
	%%筛选出已经开启的地图ID，向其发送刷新采集物的消息
	MatchSpec = ets:fun2ms(fun(Row) when Row#recMapPidInfo.mapID =:= MapID ->
		Row
	end),
	N = case myEts:selectEts(?MapInfoEts,MatchSpec) of
		    [#recMapPidInfo{} | _] = MapInfoList ->
			    startActRefresh(MapInfoList,ActID,CollectID,TotalFreshNum,AlreadyFreshNum,FreshNum,TFI);
		    _ ->
			    %%要刷新采集物的地图还没有实例
			    freshCollect1(ActID,MapID,0,CollectID,FreshNum,TFI)
	    end,
	Cfg#recAcCollectItemCfg{alreadyFreshNum = N}.


closeAct(#rec_operate_activity{type = ?OperateActType_CollectItem,id = ActID,arg1 = Arg} = Ac) ->
	List = getRefreshData(ActID),
	Fun = fun(#recRefreshData{mapPid = MapPid,code = Code}) ->
		psMgr:sendMsg2PS(MapPid,clearCollect,[Code])
	end,
	lists:foreach(Fun,List),
	setRefreshData(ActID,[]),
	
	Fun1 = fun(#recAcCollectItemCfg{mapID = MapID}) ->
		eraseRefreshTime(MapID),
		erasePreRefreshInfo(ActID,MapID)
	end,
	lists:foreach(Fun1, Arg),
	Ac.

tick(#rec_operate_activity{id = ActID,arg1 = CfgArg,type = ?OperateActType_CollectItem} = Ac) ->
	Now = time:getUTCNowMS(),
	Fun = fun(#recAcCollectItemCfg{mapID = MapID} = Cfg,AccInCfg) ->
		NextRefreshTime = getRefreshTime(MapID),
		case Now >= NextRefreshTime of
			true ->
				%%时间到了，该进行下一轮的刷新了，先清除掉现在已经有的Code，再刷新
				List = getRefreshData(ActID),
				Fun1 = fun(#recRefreshData{mapPid = MapPid,mapID = MID,code = Code} = Data,AccIn) ->
					case MapID =:= MID of
						true ->
							%%要删除，不累加
							psMgr:sendMsg2PS(MapPid,clearCollect,[Code]),
							AccIn;
						_ ->
							[Data | AccIn]
					end
				end,
				L = lists:foldl(Fun1,[],List),
				setRefreshData(ActID,L),

				%%刷新
				[refreshCfg(Cfg#recAcCollectItemCfg{alreadyFreshNum = 0},ActID) | AccInCfg];
			_ ->
				[Cfg | AccInCfg]
		end
	end,
	RetList = lists:foldl(Fun,[],CfgArg),
	Ac#rec_operate_activity{arg1 = RetList};
tick(#rec_operate_activity{type = Type} = Ac) ->
	?ERROR_OUT("Error operate_activity type:~p",[Type]),
	Ac.

-spec addAct(#rec_operate_activity{}) -> #rec_operate_activity{}.
addAct(#rec_operate_activity{} = Ac) ->
	%%不做处理
	Ac.
	
-spec updateAct(#rec_operate_activity{}, #rec_operate_activity{}) -> #rec_operate_activity{}.
updateAct(#rec_operate_activity{type = Type,arg1 = NewArg} = Act, #rec_operate_activity{phase = Phase,arg1 = OldArg} = OldAct) ->
	ActList = operateActivityLogic:getAc(Type),
	Fun = fun(#rec_operate_activity{arg1 = CfgList},AccIn) ->
		CfgList ++ AccIn
		end,
	List = lists:foldl(Fun,[],ActList),
	OldAct#rec_operate_activity{
		name = Act#rec_operate_activity.name,
		endtime = Act#rec_operate_activity.endtime,
		minlevel = Act#rec_operate_activity.minlevel,
		maxlevel = Act#rec_operate_activity.maxlevel,
		arg1 = updateArg(Phase,NewArg,OldArg,List)
	}.

updateArg(_Phase,[],OldArg,_List) ->
	OldArg;
updateArg(?OperateAct_StateRun = Phase,[#recAcCollectItemCfg{mapID = MapID} = H | T],OldArg,CfgList) ->
	case lists:keyfind(MapID,#recAcCollectItemCfg.mapID,OldArg) of
		#recAcCollectItemCfg{mapID = MapID} ->
			%%活动开启了，不允许修改
			updateArg(Phase,T,OldArg,CfgList);
		_ ->
			%%没找到
			case lists:keyfind(MapID,#recAcCollectItemCfg.mapID,CfgList) of
				false ->
					%%确保其它同类型的活动不能在此地图刷新采集物
					updateArg(Phase,T,[H | OldArg],CfgList);
				_ ->
					updateArg(Phase,T,OldArg,CfgList)
			end
	end;
updateArg(Phase,[#recAcCollectItemCfg{mapID = MapID} = H | T],OldArg,CfgList) ->
	case lists:keyfind(MapID,#recAcCollectItemCfg.mapID,OldArg) of
		#recAcCollectItemCfg{} ->
			%%找到了替换
			List = lists:keyreplace(MapID,#recAcCollectItemCfg.mapID,OldArg,H),
			updateArg(Phase,T,List,CfgList);
		_ ->
			%%没找到
			case lists:keyfind(MapID,#recAcCollectItemCfg.mapID,CfgList) of
				false ->
					%%确保其它同类型的活动不能在此地图刷新采集物
					updateArg(Phase,T,[H | OldArg],CfgList);
				_ ->
					updateArg(Phase,T,OldArg,CfgList)
			end
	end.


%%有新地图开启
onCreateNewMap(MapID,MapPid) ->
	ActList = operateActivityLogic:getAc(?OperateActType_CollectItem),
	Fun = fun(#rec_operate_activity{id = ActID,phase = Phase,arg1 = CfgArgList} = Act) ->
		case Phase of
			?OperateAct_StateRun ->
				%%只有活动开启才刷新
				case getPreRefreshInfo(ActID,MapID) of
					[] ->
						%%没有预生成的采集
						CfgList = freshCollect(CfgArgList,ActID,MapID,MapPid,[]),
						operateActivityLogic:saveAc(Act#rec_operate_activity{arg1 = CfgList});
					MapObjList ->
						%%有预生成的采集
						psMgr:sendMsg2PS(MapPid,spawnCollect,{ActID,MapObjList})
				end;
			_ ->
				skip
		end
	end,
	lists:foreach(Fun,ActList),
	ok.

spawnCollectAck(ActID,MapPid,MapID,MapCollectObjList) ->
	ActList = operateActivityLogic:getAc(?OperateActType_CollectItem),
	case lists:keyfind(ActID,#rec_operate_activity.id,ActList) of
		#rec_operate_activity{id = ActID,phase = Phase} when Phase =:= ?OperateAct_StateRun ->
			List = getRefreshData(ActID),
			Fun = fun({Code,ID,X,Y},AccIn) ->
				[#recRefreshData{
					mapID = MapID,
					mapPid = MapPid,
					x = X,
					y = Y,
					code = Code,
					collectID = ID
				} | AccIn]
			      end,
			L = lists:foldl(Fun,List,MapCollectObjList),
			setRefreshData(ActID,L);
		_ ->
			Fun = fun({Code,_ID,_X,_Y},AccIn) ->
					[Code | AccIn]
			      end,
			CodeList = lists:foldl(Fun,[],MapCollectObjList),
			psMgr:sendMsg2PS(MapPid,clearCollect,CodeList)
	end,
	ok.


startActRefresh([],_CollectID,_ActID,_TotalFreshNum,AlreadyFreshNum,_FreshNum,_TFI) ->
	AlreadyFreshNum;
startActRefresh(_List,_CollectID,_ActID,TotalFreshNum,TotalFreshNum,_FreshNum,_TFI) ->
	TotalFreshNum;
startActRefresh([#recMapPidInfo{mapID = MapID,pid = MapPid} | T],ActID,CollectID,TotalFreshNum,AlreadyFreshNum,FreshNum,TFI) ->
	RemainNum = TotalFreshNum - AlreadyFreshNum,
	NeedRefreshNum = case RemainNum >= FreshNum of
						 true ->
							 FreshNum;
						 _ ->
							 RemainNum
	                 end,
	RealRefreshNum = freshCollect1(ActID,MapID,MapPid,CollectID,NeedRefreshNum,TFI),
	startActRefresh(T,ActID,CollectID,TotalFreshNum,AlreadyFreshNum + RealRefreshNum,FreshNum,TFI).

freshCollect([],_ActID,_MapID,_MapPid,AccIn) ->
	AccIn;
freshCollect([#recAcCollectItemCfg{
	mapID = MapID,										%%地图ID
	freshNum = FreshNum,								%%单次刷新数量
	alreadyFreshNum = AlreadyFreshNum,					%%已经刷新的数量
	totalFreshNum = TotalFreshNum,						%%总刷新数量
	collectID = CollectID,								%%采集ID
	turnFreshInterval = TFI
} = Cfg | T],ActID,MapID,MapPid,AccIn) when AlreadyFreshNum < TotalFreshNum ->
	RemainNum = TotalFreshNum - AlreadyFreshNum,
	N = case RemainNum >= FreshNum of
		    true ->
			    freshCollect1(ActID,MapID,MapPid,CollectID,FreshNum,TFI);
		    _ ->
			    freshCollect1(ActID,MapID,MapPid,CollectID,RemainNum,TFI)
	    end,
	freshCollect(T,ActID,MapID,MapPid,[Cfg#recAcCollectItemCfg{alreadyFreshNum = AlreadyFreshNum + N} | AccIn]);
freshCollect([H|T],ActID,MapID,MapPid,AccIn) ->
	freshCollect(T,ActID,MapID,MapPid,[H | AccIn]).

%%在指定地图ID刷新指定数量的采集物，返回实际刷新的个数
freshCollect1(ActID,MapID,MapPid,CollectID,FreshNum,RefreshInterval) ->
	case getCfg:getCfgByKey(cfg_collectActivity,MapID) of
		#collectActivityCfg{coordinate = PosList0} ->
			case getCfg:getCfgPStack(cfg_object, CollectID) of
				#objectCfg{name = ObjectName} ->
					PosList = filterPos(PosList0,MapPid,ActID),
					PosNum = erlang:length(PosList),
					{FreshPosList,RealNum} = case FreshNum < PosNum of
						                         true ->
							                         {misc:randUniqueFromList(FreshNum,PosList),FreshNum};
						                         _ ->
							                         {PosList,PosNum}
					                         end,
					Time = time:getUTCNowMS() + RefreshInterval,
					setRefreshTime(MapID,Time),
					Fun = fun({X,Y},AccIn) ->
						%%<t=0>,,~p在【</t><t=4>,~p,[~p,~p]</t><t=0>,,】刷新了！赶紧去抢夺，手快有手慢就木有啦！</t>
						Notify = stringCfg:getString(opActCollectRefresh,
							[ObjectName,MapID,trunc(X),trunc(Y)]),
						core:sendBroadcastNotice(Notify),
						[#recMapObjData{id = CollectID,mapX = X,mapY = Y} | AccIn]
					end,
					MapObjList = lists:foldl(Fun,[],FreshPosList),
					case MapObjList of
						[] ->
							0;
						_ ->
							case erlang:is_pid(MapPid) of
								true ->
									psMgr:sendMsg2PS(MapPid,spawnCollect,{ActID,MapObjList});
								_ ->
									setPreRefreshInfo(ActID,MapID,MapObjList)
							end,

							RealNum
					end;
				_ ->
					?ERROR_OUT("can not find cfg of collectID:~p from cfg_object",[CollectID]),
					0
			end;
		_ ->
			?ERROR_OUT("can not find cfg of mapid:~p from cfg_collectActivity",[MapID]),
			0
	end.

filterPos(PosList,MapPid,ActID) ->
	List = getRefreshData(ActID),
	%%筛选出指定地图的列表
	L = [D || D = #recRefreshData{mapPid = Pid} <- List,Pid =:= MapPid],
	Fun = fun({X,Y},AccIn) -> 
		case isMember(L,X,Y) of
			true ->
				%%该位置已经有采集物了
				AccIn;
			_ ->
				[{X,Y} | AccIn]
		end
	end,
	lists:foldl(Fun,[],PosList).

isMember([],_X,_Y) ->
	false;
isMember([#recRefreshData{x = X,y = Y} | _T],X,Y) ->
	true;
isMember([#recRefreshData{} | T],X,Y) ->
	isMember(T,X,Y).

-spec executeAct(Ac::#rec_operate_activity{}, AcArg::#recOperateActivityArg{}) -> ok.
executeAct(#rec_operate_activity{id = ActID,phase = Phase,arg1 = L} = Act,#recOperateActivityArg{arg = EventArg}) ->
	case Phase =:= ?OperateAct_StateRun of
		true ->
			ModifiedCfgArg = executeAct(L, ActID, EventArg, []),
			operateActivityLogic:saveAc(Act#rec_operate_activity{arg1 = ModifiedCfgArg});
		_ ->
			skip
	end,
	ok.

executeAct([], _ActID, #recAcCollectItemArg{},AccIn) ->
	AccIn;
%%采集的地图ID、采集ID与配置的一致
executeAct([#recAcCollectItemCfg{
	mapID = MapID,									    %%地图ID
	alreadyFreshNum = AlreadyFreshNum,                  %%已经刷新的数量
	totalFreshNum = TotalFreshNum,						%%总刷新数量
	collectID = CollectID								%%采集ID
} = Cfg | T],ActID,#recAcCollectItemArg{mapID = MapID,mapPid = MapPid,collectID = CollectID,x = X,y = Y,code = Code} = Arg,AccIn) ->
	case AlreadyFreshNum < TotalFreshNum of
		true ->
			%%删除已经采集过的Code
			deleteCodeFromMem(ActID,Code),
			MapObjList = [#recMapObjData{id = CollectID,mapX = X,mapY = Y}],
			psMgr:sendMsg2PS(MapPid,spawnCollect,{ActID,MapObjList}),
			[Cfg#recAcCollectItemCfg{alreadyFreshNum = AlreadyFreshNum + 1} | AccIn] ++ T;
		_ ->
			executeAct(T,ActID,Arg,AccIn)
	end;
%%采集的地图ID、采集ID与配置的不一致
executeAct([H | T], ActID, Arg, AccIn) ->
	executeAct(T,ActID,Arg,[H | AccIn]).

%%从内存中删除记录的采集物Code
deleteCodeFromMem(ActID,DeleteCode) ->
	List = getRefreshData(ActID),
	Fun = fun(#recRefreshData{code = Code} = Data,AccIn) ->
		case Code =:= DeleteCode of
			true ->
				AccIn;
			_ ->
				[Data | AccIn]
		end
	end,
	L = lists:foldl(Fun,[],List),
	setRefreshData(ActID,L),
	ok.

getRefreshData(ActID) ->
	case get({refreshData,ActID}) of
		undefined ->
			[];
		List ->
			List
	end.

setRefreshData(ActID,List) ->
	put({refreshData,ActID},List),
	ok.

setRefreshTime(MapID,Time) ->
	put({refreshTime,MapID},Time),
	ok.

getRefreshTime(MapID) ->
	case get({refreshTime,MapID}) of
		undefined ->
			0;
		Time ->
			Time
	end.

eraseRefreshTime(MapID) ->
	erase({refreshTime,MapID}).

setPreRefreshInfo(ActID,MapID,MapObjList) ->
	put({preRefreshInfo,ActID,MapID},MapObjList),
	ok.

getPreRefreshInfo(ActID,MapID) ->
	case get({preRefreshInfo,ActID,MapID}) of
		undefined ->
			[];
		MapObjList ->
			MapObjList
	end.

erasePreRefreshInfo(ActID,MapID) ->
	erase({preRefreshInfo,ActID,MapID}).


