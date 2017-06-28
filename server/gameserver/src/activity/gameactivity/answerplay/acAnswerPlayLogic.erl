%% @author wangjie
%% @doc @todo Add description to acAnswerPlayLogic.


-module(acAnswerPlayLogic).

-include("../../activityPrivate.hrl").
-include("acAnswerPlayPrivate.hrl").
-include("../activityPhaseDefine.hrl").
-include("common/db.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([init/0,
		 activityChangeCallBack/1,
         playerAnswerInfo/2,
         playerAnswerResult/6,
		 sendAnswerReward/0,
         sendQuestionToClient/0
         ]).

-spec init() -> ok.
init() ->
	ok.
%%玩家请求答题信息
playerAnswerInfo(RoleID, NetPid) ->
    case getAnswerState() of
        true ->
			case getAnswerResult() of
            [] ->
				false;
			Dict ->
	            %%判断是否已经答过题 发送没答的题目和答案
	            case dict:find(RoleID, Dict) of
	                {ok,Value} ->
						#recAnswerResult{answerNum = AnswerNum, trueNum = TrueNum, exp = TotalExp, coin = TotalCoin} = Value,
						playerOnlineSendAnswerInfo(NetPid,AnswerNum, TrueNum, TotalExp, TotalCoin);
	                _ ->
						playerOnlineSendAnswerInfo(NetPid,0, 0, 0, 0)
	            end
			end;
        _ ->
            DBID = gsMainLogic:getDBID4GS(),
			NameList = case memDBCache:getSundries(?Sundries_ID_AnswerRewardName, DBID) of
							[] ->
								[];
							[Name] ->
								Name#rec_sundries.value
						end,
    		Msg2 = #pk_GS2U_AnswerFirstAndLuckyPlayer{playerName = NameList},
    		gsSendMsg:sendNetMsg(NetPid,Msg2),
            false
    end,
    ok.

%% 主活动模块进程回调
-spec activityChangeCallBack(Phase::uint()) -> ok.
activityChangeCallBack(?ActivityPhase_AnswerPlay_1) ->
	?LOG_OUT("~p ~p answer wait start", [?MODULE, self()]),
	ok;
%% 答题活动准备开始
activityChangeCallBack(?ActivityPhase_AnswerPlay_2) ->
	?LOG_OUT("~p ~p answer wait start", [?MODULE, self()]),
	setNowStartTime(time:getSyncTimeFromDBS()),
	setAnswerState(true),
    Content = stringCfg:getString(answerPlayWaitStart),
	activityCommon:sendBroadcastNotice(Content),
	sendQuestionToClient(),
	ok;

%% 答题活动开始
activityChangeCallBack(?ActivityPhase_AnswerPlay_3) ->
	?LOG_OUT("~p ~p answer start", [?MODULE, self()]),
	Content = stringCfg:getString(answerPlayStart),
	activityCommon:sendBroadcastNotice(Content),
    ok;

%% 答题活动结束
activityChangeCallBack(?ActivityPhase_Close) ->
	case getAnswerState() of
		true ->
			Ntime = time:getSyncTimeFromDBS(),
			Stime = getNowStartTime(),
			PrePareTime = getglobValue(qa_prepare_time),
		    AnserTime = getglobValue(qa_time),
			Ctime = Stime + PrePareTime + AnserTime,
			case Ctime =< Ntime of
				true ->
					setAnswerState(false),
					setNowStartTime(0),
					delAnswerTrue(),
					sendAnswerReward(),
					delRobitResult(),
					?LOG_OUT("~p ~p answer closed", [?MODULE, self()]);
				_ ->
					erlang:send_after((Ctime - Ntime) * 1000, self(), answerClose)
			end;
		 _ ->
			skip
	end,
	ok.

%% 发送题目给所有在线玩家
-spec sendQuestionToClient() -> ok.
sendQuestionToClient() ->
    case getAnswerState() of
        true ->
            Problem = getProblem(),
            saveAnswerResult(Problem),
            Msg = #pk_GS2U_AnswerQuestion{startTime = getNowStartTime(), answerNum = 0,questionList = Problem},
            playerMgrOtp:sendMsgToAllPlayer([Msg]);
        _ ->
            skip
    end,
	ok.

%% 获取玩家答题结果，设置玩家答题表的信息
-spec playerAnswerResult(RoleID, Name, Level ,QuestionID, Result, Pid) -> term() when
	RoleID::uint(), Name :: term(), Level::uint(),QuestionID::uint(), Result :: uint(), Pid::pid().
playerAnswerResult(RoleID, Name, Level,QuestionID, Result, Pid) ->
	 case getAnswerState() of
        true ->
		    {TrueResult, TrueAnswer} = isTrueResult(QuestionID, Result),
		    Dict = getAnswerResult(),
		    {NewQexp, NewQmoney, TrueNum} = getAnswerRewardNum(Level, TrueResult),
		    case dict:find(RoleID, Dict) of
				{ok, #recAnswerResult{answerNum = AnswerNum, exp = Exp, coin = Coin, rusult = BeforeResult, trueNum = OldTrueNum}}->
				            NewResult = #recAnswerResult{
				                roleID = RoleID,
				                roleName = Name,
				                answerTime = time:getUTCNowMS(),
				                trueNum = OldTrueNum + TrueNum,
				                exp = NewQexp + Exp,
				                coin = NewQmoney + Coin,
				                answerNum = AnswerNum + 1,
				                rusult = TrueResult band BeforeResult
				            },
				            List = dict:store(RoleID, NewResult, Dict),
							setAnswerResult(List);
		        _ ->
		            addAnswerTable(RoleID, Name, Level,TrueResult)
		    end,
		    Value = getAnswerResult(),
			QuestionNum = getglobValue(question_quantity),
		    Ret =  case dict:find(RoleID, Value) of
		        {ok, #recAnswerResult{answerNum = NewAnswerNum, exp = NewExp, coin = NewCoin, trueNum = NewTrueNum}} ->
					case NewAnswerNum > QuestionNum of
						false ->
				            {TrueResult, TrueAnswer, Result,NewExp,NewCoin, NewTrueNum, NewAnswerNum};
						_ ->
							{0,0,0,0,0,0,0}
					end;
		        _ ->
		            {TrueResult, TrueAnswer, Result,0,0,0,0}
		    end,
			psMgr:sendMsg2PS(Pid, answerResultAck, Ret);
		 _ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_CnTextAnswerPlayNoStart)
	 end.

%%活动结束发送玩家奖励
-spec sendAnswerReward() -> ok.
sendAnswerReward() ->
    ResultDicts = getAnswerResult(),
	QuestionNum = getglobValue(question_quantity),
	Funs = fun(_Key, List,Acc) ->
                case List of
                    #recAnswerResult{} ->
                        [List|Acc];
                    _ ->
                        Acc
                end
		   end,
    ResultDict = dict:fold(Funs, [],ResultDicts),
	Onlist = getOnlinePlayerlist(ResultDict),
	case Onlist of
		[] ->
			deleteDictResult();
		_ ->
			%%幸运选择题答题人数
			Size = misc:size(Onlist),
			if
				%%奖励玩家为1个抢答王10个幸运玩家
				Size >= 11 ->
					%%获取答题全对玩家
					NewOnlist = lists:filter(fun(X) -> X#recAnswerResult.trueNum =:= QuestionNum end, Onlist),
					case misc:size(NewOnlist) > 0 of
						true ->
						%%选取抢答王和幸运玩家，不在线不统计
						    Fun = fun(A, B) ->
						        case A#recAnswerResult.trueNum =:= QuestionNum andalso
									 B#recAnswerResult.trueNum =:= QuestionNum  of
									true ->
					            		A#recAnswerResult.answerTime =< B#recAnswerResult.answerTime;
									_ ->
										false
									end
						    end,
							%%获取抢答王(答题全对，答题时间最短)
							[FirstPlayer|_] = lists:sort(Fun, NewOnlist),
							LastPlayer = Onlist -- [FirstPlayer],
						    LuckyPlayer = getLuckyPlayer(LastPlayer, [], 10),
			 		    	sendFirstAndLuckyPlayerToClient([FirstPlayer | LuckyPlayer]);
						_ ->
							LuckyPlayer = getLuckyPlayer(Onlist, [], 11),
			 		    	sendFirstAndLuckyPlayerToClient(LuckyPlayer)
					end;
				Size >= 2 andalso Size < 11 ->
					%%获取答题全对玩家
					NewOnlist = lists:filter(fun(X) -> X#recAnswerResult.trueNum =:= QuestionNum end, Onlist),
					case misc:size(NewOnlist) > 0 of
						true ->
							Fun = fun(A, B) ->
							        case A#recAnswerResult.trueNum =:= QuestionNum andalso
										 B#recAnswerResult.trueNum =:= QuestionNum  of
										true ->
						            		A#recAnswerResult.answerTime =< B#recAnswerResult.answerTime;
										_ ->
											false
									end
						    end,
							%%获取抢答王(答题全对，答题时间最短)
							[FirstPlayer|_] = lists:sort(Fun, NewOnlist),
							LastPlayer = Onlist -- [FirstPlayer],
				 		 	sendFirstAndLuckyPlayerToClient([FirstPlayer|LastPlayer]);
						_ ->
							sendFirstAndLuckyPlayerToClient(Onlist)
					end;
				true ->
		 			sendFirstAndLuckyPlayerToClient(Onlist)
			end
	end,
	ok.

%% 发送抢答王和幸运玩家给客户端
-spec sendFirstAndLuckyPlayerToClient(Players::[#recAnswerResult{},...]) -> ok.
sendFirstAndLuckyPlayerToClient([]) ->
	deleteDictResult(),
	ok;
sendFirstAndLuckyPlayerToClient(Players) ->
	QuestionNum = getglobValue(question_quantity),
    DBID = gsMainLogic:getDBID4GS(),
	[First|Lucky] = Players,
	Size = misc:size(Players),
	if
		Size >= 11 ->
			case First /= [] andalso First#recAnswerResult.answerNum =:= QuestionNum andalso First#recAnswerResult.trueNum =:= QuestionNum of
				true ->
					%%给全服玩家发送 抢题王和幸运玩家
				    Fun = fun(#recAnswerResult{roleName = Name}, Acc) ->
				            [Name|Acc]
				        end,
				    NameList = lists:foldr(Fun, [], Players),
				    Msg = #pk_GS2U_AnswerFirstAndLuckyPlayer{playerName = NameList},
					playerMgrOtp:sendMsgToAllPlayer([Msg]),
					%%设置全局答题玩家抢答王和幸运玩家
 					memDBCache:saveSundries(?Sundries_ID_AnswerRewardName, DBID, NameList),
					%%全服通告获得抢答王和幸运玩家名字
					LuckyName = getLuckyPlayerName(Lucky),
					SpaceNum = 10 - misc:size(Lucky),
					SpaceNname = lists:duplicate(SpaceNum, []),
				  	Append = lists:append([First#recAnswerResult.roleName], LuckyName),
					Append1 = lists:append(Append, SpaceNname),
			  		Content1 = stringCfg:getString(answerPlayFirstAndLucky,Append1),
 				   	activityCommon:sendBroadcastNotice(Content1),

					%%通知抢答王幸运玩家领取奖励
                    #rec_OnlinePlayer{pid = FirstPid} = playerMgrOtp:getOnlinePlayerInfoByID(First#recAnswerResult.roleID),
                    psMgr:sendMsg2PS(FirstPid, addAnswerRewardFirst, {First#recAnswerResult.exp, First#recAnswerResult.coin}),
                    Fun1 =
                        fun(LuckyPlayer) ->
                            #rec_OnlinePlayer{pid = LuckyPid} = playerMgrOtp:getOnlinePlayerInfoByID(LuckyPlayer#recAnswerResult.roleID),
                            psMgr:sendMsg2PS(LuckyPid, addAnswerRewardLucky,{LuckyPlayer#recAnswerResult.exp,LuckyPlayer#recAnswerResult.coin})
                        end,
                    lists:foreach(Fun1, Lucky);
				_ ->
				    Fun = fun(#recAnswerResult{roleName = Name}, Acc) ->
				            [Name|Acc]
				        end,
				    NameList = lists:foldr(Fun, [], Lucky),
				    Msg = #pk_GS2U_AnswerFirstAndLuckyPlayer{playerName = [[]|NameList]},
					playerMgrOtp:sendMsgToAllPlayer([Msg]),
					%%设置全局答题玩家抢答王和幸运玩家
 					memDBCache:saveSundries(?Sundries_ID_AnswerRewardName, DBID, [[]|NameList]),
					ContentNull = stringCfg:getString(answerReswardFirstNull),
				   	activityCommon:sendBroadcastNotice(ContentNull),

					%%跑马灯抢答王幸运玩家信息
					LuckyName = getLuckyPlayerName(Lucky),
					SpaceNum = 10 - misc:size(Lucky),
					SpaceNname = lists:duplicate(SpaceNum, []),
					Append1 = lists:append(LuckyName, SpaceNname),
			  		Content1 = stringCfg:getString(answerPlayLuckyPlayers, Append1),
			   		activityCommon:sendBroadcastNotice(Content1),
					%%通知抢答王幸运玩家领取奖励
                    Fun1 = fun(LuckyPlayer) ->
                        #rec_OnlinePlayer{pid = LuckyPid} = playerMgrOtp:getOnlinePlayerInfoByID(LuckyPlayer#recAnswerResult.roleID),
                        psMgr:sendMsg2PS(LuckyPid, addAnswerRewardLucky,{LuckyPlayer#recAnswerResult.exp,LuckyPlayer#recAnswerResult.coin})
                    end,
                    lists:foreach(Fun1, Lucky)
			end;
		Size >= 2 andalso Size < 11  ->
			%%答题人数少于10个
			%%给全服玩家发送 抢题王和幸运玩家
			case First /= [] andalso First#recAnswerResult.answerNum =:= QuestionNum andalso First#recAnswerResult.trueNum =:= QuestionNum of
				true ->
				    Fun = fun(#recAnswerResult{roleName = Name}, Acc) ->
				            [Name|Acc]
				        end,
				    NameList = lists:foldr(Fun, [], Players),
				    Msg = #pk_GS2U_AnswerFirstAndLuckyPlayer{playerName = NameList},
					playerMgrOtp:sendMsgToAllPlayer([Msg]),

					%%跑马灯抢答王幸运玩家信息
					LuckyName = getLuckyPlayerName(Lucky),
					SpaceNum = 10 - misc:size(Lucky),
					SpaceNname = lists:duplicate(SpaceNum, []),
				  	Append = lists:append([First#recAnswerResult.roleName], LuckyName),
					Append1 = lists:append(Append, SpaceNname),
			  		Content1 = stringCfg:getString(answerPlayFirstAndLucky, Append1),
 				   	activityCommon:sendBroadcastNotice(Content1),
					%%设置全局答题玩家抢答王和幸运玩家
 					memDBCache:saveSundries(?Sundries_ID_AnswerRewardName, DBID, NameList),
					%%发送抢答王领奖
                    #rec_OnlinePlayer{pid = FirstPid} = playerMgrOtp:getOnlinePlayerInfoByID(First#recAnswerResult.roleID),
                    psMgr:sendMsg2PS(FirstPid, addAnswerRewardFirst, {First#recAnswerResult.exp, First#recAnswerResult.coin}),
                    Fun1 = fun(LuckyPlayer) ->
                        #rec_OnlinePlayer{pid = LuckyPid} = playerMgrOtp:getOnlinePlayerInfoByID(LuckyPlayer#recAnswerResult.roleID),
                        psMgr:sendMsg2PS(LuckyPid, addAnswerRewardLucky,{LuckyPlayer#recAnswerResult.exp,LuckyPlayer#recAnswerResult.coin})
                    end,
                    lists:foreach(Fun1, Lucky);
				_ ->
					Fun = fun(#recAnswerResult{roleName = Name}, Acc) ->
				            [Name|Acc]
				        end,
				    NameList = lists:foldr(Fun, [], Lucky),
					ContentNull = stringCfg:getString(answerReswardFirstNull),
				   	activityCommon:sendBroadcastNotice(ContentNull),

					%%跑马灯抢答王幸运玩家信息
					LuckyName = getLuckyPlayerName(Lucky),
					SpaceNum = 10 - misc:size(Lucky),
					SpaceNname = lists:duplicate(SpaceNum, []),
					Append1 = lists:append(LuckyName, SpaceNname),
			  		Content1 = stringCfg:getString(answerPlayLuckyPlayers, Append1),
			   		activityCommon:sendBroadcastNotice(Content1),
					%%设置全局答题玩家抢答王和幸运玩家
 					memDBCache:saveSundries(?Sundries_ID_AnswerRewardName, DBID, [[]|NameList]),
				    Msg = #pk_GS2U_AnswerFirstAndLuckyPlayer{playerName = [[]|NameList]},
					playerMgrOtp:sendMsgToAllPlayer([Msg]),
                    Fun1 = fun(LuckyPlayer) ->
                        #rec_OnlinePlayer{pid = LuckyPid} = playerMgrOtp:getOnlinePlayerInfoByID(LuckyPlayer#recAnswerResult.roleID),
                        psMgr:sendMsg2PS(LuckyPid, addAnswerRewardLucky,{LuckyPlayer#recAnswerResult.exp,LuckyPlayer#recAnswerResult.coin})
                    end,
                    lists:foreach(Fun1, Lucky)
			end;
		true ->
				%%只有一个玩家答题(默认为抢答王)
				%%跑马灯抢答王幸运玩家信息
				LuckyName = getLuckyPlayerName(Lucky),
				SpaceNum = 10 - misc:size(Lucky),
				SpaceNname = lists:duplicate(SpaceNum, []),
				Append = lists:append([First#recAnswerResult.roleName], LuckyName),
				Append1 = lists:append(Append, SpaceNname),
			  	Content1 = stringCfg:getString(answerPlayFirstAndLucky, Append1),
			   	activityCommon:sendBroadcastNotice(Content1),
				memDBCache:saveSundries(?Sundries_ID_AnswerRewardName, DBID, [First#recAnswerResult.roleName]),
			    Msg = #pk_GS2U_AnswerFirstAndLuckyPlayer{playerName = [First#recAnswerResult.roleName]},
				playerMgrOtp:sendMsgToAllPlayer([Msg]),
                #rec_OnlinePlayer{pid = LuckyPid} = playerMgrOtp:getOnlinePlayerInfoByID(First#recAnswerResult.roleID),
				psMgr:sendMsg2PS(LuckyPid, addAnswerRewardFirst, {First#recAnswerResult.exp, First#recAnswerResult.coin})

	end,
	deleteDictResult(),
	ok.

%% -spec robitAutoAnswer() -> ok.
%% robitAutoAnswer() ->
%%     {MinNum, MaxNum} = getglobValue(question_num),
%%     NewNum = misc:rand(MinNum,MaxNum),
%%     List = getRobitInfo([], NewNum),
%% 	Fun = fun(#pk_RobitAnswer{startTime = StartTime, intervalTime = Time}) ->
%% 			  #recRobitAnswer{startTime = StartTime,
%% 							  prepareTime = Time}
%% 	end,
%% 	RobitList = lists:map(Fun, List),
%% 	setRobitResult(RobitList),
%%  Msg = #pk_GS2U_RobitAutoAnswer{answerList = List},
%%  PlayersInfo = playerMgrOtp:getAllPlayerNetPidInfo(),
%%  [gsSendMsg:sendNetMsg(NetPID, Msg) || NetPID <- PlayersInfo],
%%  ok.

%% ====================================================================
%% Internal functions
%% ====================================================================
getOnlinePlayerlist(Player) ->
	Fun = fun(A) ->
		playerMgrOtp:getOnlinePlayerInfoByName(A#recAnswerResult.roleName) =/= undefined
	end,
	lists:filter(Fun, Player).

%%%获取自动答题信息
%getRobitInfo(Acc, 0) ->
%    Acc;
%getRobitInfo(Acc, Num) ->
%    {MinTime, MaxTime} = getglobValue(question_time),
%	PrePareTime = getglobValue(qa_prepare_time),
%    AnserTime = getglobValue(qa_time),
%    NewTime = misc:rand(MinTime, MaxTime),
%    StartTotalTime = getNowStartTime() + PrePareTime + NewTime,
%    NewStartTotalTime = misc:clamp(StartTotalTime, getNowStartTime(), getNowStartTime() + PrePareTime + AnserTime),
%    NTime =
%        case StartTotalTime - NewStartTotalTime of
%            Time when Time > 0 ->
%                Time;
%            L when L =< 0 ->
%                0
%     end,
%    Accs = #pk_RobitAnswer{startTime = NewStartTotalTime - NTime, intervalTime = NewTime},
%    getRobitInfo([Accs|Acc], Num - 1).

%%清空答题表
deleteDictResult() ->
	Dict = getAnswerResult(),
	Fun = fun(_Key ,#recAnswerResult{roleID = RoleID}, DD) ->
		dict:erase(RoleID, DD)
	end,
	NDict = dict:fold(Fun, Dict, Dict),
	setAnswerResult(NDict),
	ok.
%%玩家上线同步答题信息
playerOnlineSendAnswerInfo(NetPid,AnswerNum, TrueNum, TotalExp, TotalCoin) ->   
	AnswerList1 = getTrueResult(),
	ProblemList1 = changeAnswerStruct(AnswerList1),
    Msg = #pk_GS2U_AnswerQuestion{startTime = getNowStartTime(), answerNum = AnswerNum, questionList = ProblemList1},
    gsSendMsg:sendNetMsg(NetPid, Msg),
    Msg1 = #pk_GS2U_PlayerAnswerInfo{trueNum = TrueNum, totalExp = erlang:round(TotalExp), totalCoin = erlang:round(TotalCoin)},
    gsSendMsg:sendNetMsg(NetPid,Msg1),
	ok.

%%获取幸运玩家名字
getLuckyPlayerName(Lucky) ->
	getNme(Lucky, [], misc:size(Lucky)).
  
getNme(_, Acc, 0) ->
	Acc;
getNme([], Acc, _Num) ->
	Acc;
getNme([Lucky|LastLucky], Acc, Num) ->
	Accs = [Lucky#recAnswerResult.roleName|Acc],
	getNme(LastLucky,Accs, Num - 1).


%% 获取玩家答题奖励数量
getAnswerRewardNum(Level, Result) ->
    #indexFunctionCfg{question_exp = Qexp, question_money = Qmoney} = getCfg:getCfgPStack(cfg_indexFunction, Level),
    case Result =:= 1 of
        true ->
            NewQexp = Qexp,
            NewQmoney = Qmoney,
            {NewQexp, NewQmoney, 1};
        _ ->
            NewQexp = Qexp/2,
            NewQmoney = Qmoney/2,
            {NewQexp, NewQmoney, 0}
    end.

%% 保存随机题目的答案
saveAnswerResult(Problem) ->
    Fun = fun(#pk_Question{
        questionID = QuestionID,
        answers = [A,B,C,D]
    }) ->
        #recAnswerTrue{
            questionID = QuestionID,
            answer = [{1, A},{2, B},{3, C},{4,D}]
        }
    end,
    ProblemList = lists:map(Fun, Problem),
    setTrueResult(ProblemList).

%% 获取协议结构
changeAnswerStruct(QuestionList) ->
    Fun = fun(#recAnswerTrue{
        questionID = QuestionID,
        answer = Answer
    }) ->
		[{_, A},{_, B},{_,C},{_,D}] = Answer,
        #pk_Question{
            questionID = QuestionID,
            answers = [A,B,C,D]
        }
    end,
    lists:map(Fun, QuestionList).

%% 获取幸运玩家
-spec getLuckyPlayer(List::list(), Acc::list(), N ::uint()) -> [#recAnswerResult{},...].
getLuckyPlayer(_, Acc, 0) ->
    Acc;
getLuckyPlayer([], Acc, _N) ->
	Acc;
getLuckyPlayer(LastPlayer, Accs, N) ->
    Num = misc:rand(1, misc:size(LastPlayer)),
    GoodPlayer = lists:nth(Num, LastPlayer),
    NewList = lists:delete(GoodPlayer, LastPlayer),
    Acc = [GoodPlayer | Accs],
    getLuckyPlayer(NewList, Acc, N -1).

%% 判断是否正确
isTrueResult(ID, Result) ->
    TrueList = getTrueResult(),
        case lists:keyfind(ID, #recAnswerTrue.questionID, TrueList) of
            #recAnswerTrue{answer = AnswerList} ->
                {Result0, Result1} = lists:keyfind(Result, 1, AnswerList),
                case Result1 =:= 1 of
                    true ->
                        {1, Result0};
                    _ ->
                        Predicate = fun({_,B}) ->
                            B =:= 1
                            end,  
                        [{True, _}] = lists:filter(Predicate, AnswerList),
                        {0, True}
                end;
            _ ->
				?ERROR_OUT("error answer id:~p,Rusult:~p,ResultTable:~p", [ID, Result,TrueList]),
                {1, Result}
        end.

%%从题库随机获取任务
getProblem() ->
    KeyList = getCfg:get1KeyList(cfg_question),
	QuestionNum = getglobValue(question_quantity),
    NumList = randAnswerNum(KeyList, [], QuestionNum),
    Fun = fun(QuestionID, Acc) ->
                Answers = setRandomAnswer([1, 2, 3, 4], [], 4),
                Result =
                    #pk_Question{
                        questionID = QuestionID,
                        answers = Answers
                    },
                [Result | Acc]
        end,
    lists:foldr(Fun, [],NumList).

%% 随机生成3个题目
randAnswerNum(_, Acc, 0) ->
    Acc;
randAnswerNum([], Acc, _Num) ->
	Acc;
randAnswerNum(KeyList, Acc, Num) ->
    Num1 = misc:rand(1, misc:size(KeyList)),
    NewNum = lists:nth(Num1, KeyList),
    NewKeyList = lists:delete(NewNum, KeyList),
    Accs = [NewNum | Acc],
    randAnswerNum(NewKeyList, Accs, Num - 1).


%% 打乱答题答案
setRandomAnswer(_, Acc, 0) ->
    Acc;
setRandomAnswer([], Acc, _Num) ->
	Acc;
setRandomAnswer(KeyList, Acc, Num) ->
    Num1 = misc:rand(1, misc:size(KeyList)),
    NewNum = lists:nth(Num1, KeyList),
    NewKeyList = lists:delete(NewNum, KeyList),
    Accs = [NewNum | Acc],
    setRandomAnswer(NewKeyList, Accs, Num -1).


%%添加玩家答题表
addAnswerTable(RoleID, Name, Level, TrueResult) ->
    {NewQexp, NewQmoney, TrueNum} = getAnswerRewardNum(Level, TrueResult),
	R = #recAnswerResult{
			roleID = RoleID,
            roleName = Name,
            trueNum = TrueNum,
            exp = NewQexp,
            coin = NewQmoney,
            answerNum = 1,
			answerTime = time:getUTCNowMS(),
			rusult = TrueResult
			},
	Dict = getAnswerResult(),
	NDict = dict:store(RoleID, R, Dict),
	setAnswerResult(NDict),
	ok.

%% 设置答题信息Dict
setAnswerResult(Dict) ->
    put('AnswerResult',Dict),
    ok.

%% 获取答题信息Dict
getAnswerResult() ->
	case get('AnswerResult') of
		undefined ->
			dict:new();
		V ->
			V
	end.


%% 答题活动开启状态
setAnswerState(IsState) ->
	put('AnswerState', IsState),
	ok.

getAnswerState() ->
	case get('AnswerState') of
		undefined ->
			false;
		V ->
			V
	end.

%% 当前正确答案
setTrueResult(Result) ->
	put('TrueResult', Result),
	ok.

getTrueResult() ->
	case get('TrueResult') of
		undefined ->
			[];
		V ->
			V
	end.

%%% 设置机器人答题结构
%setRobitResult(Result) ->
%	put('RobitAnswer', Result),
%	ok.
%
%getRobitResult() ->
%	case get('RobitAnswer') of
%		undefined ->
%			[];
%		V ->
%			V
%	end.

delRobitResult() ->
	erlang:erase('RobitAnswer').

%%删除答案表
delAnswerTrue() ->
    erlang:erase('TrueResult').

%%设置答题时间
setNowStartTime(Time) ->
	put('StartTime', Time),
	ok.
%%获取答题时间
getNowStartTime() ->
	case get('StartTime') of
		undefined ->
			0;
		T ->
			T
	end.

getglobValue(Key) ->
    case getCfg:getCfgPStack(cfg_globalsetup, Key) of
        #globalsetupCfg{setpara = [Para]} ->
            Para;
        [] ->
            undefined
    end.

