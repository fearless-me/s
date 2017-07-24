%% @author wangjie
%% @doc @todo Add description to acAnswerPlayLogic.


-module(acAnswerPlayLogic).

-include("../../activityPrivate.hrl").
-include("acAnswerPlayPrivate.hrl").
-include("../activityPhaseDefine.hrl").
-include("common/db.hrl").
-include("cfg_allplayerquestion.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([init/0,
		 activityChangeCallBack/1,
         playerAnswerResult/7,
		 sendAnswerReward/0,
         sendQuestionToClient/0,
	     onTimerTick/0,
	     applyAnswer/1
         ]).

-spec init() -> ok.
init() ->
	%%erlang:send_after(?TimeTick, self(), ?MsgTypeTimerTick),
	ok.

%% 秒级心跳消息响应
-spec onTimerTick() -> ok.
onTimerTick() ->
	%?DEBUG_OUT("[DebugForDate] onTimerTick"),
	case getAnswerState() of
		true->
			acDanceState:setTimerRef(erlang:send_after(configAllplayerquestion_times()*1000, self(), answer_timerTick)),
			initNextQuestion(),
			sendQuestionToClient();
		_->skip
	end,

	ok.

applyAnswer({RoleID, Pid, NetPid}) ->
	ECode =
		case getCanApply() of
			true ->
				{NewApply, ErrorCode,Result} =
					case getAnswerApplyObject(RoleID) of
						false ->
							{RoleName,Level,Career,Race,Sex,Head} =
							case core:queryRoleKeyInfoByRoleID(RoleID) of
								#?RoleKeyRec{roleName = Name,level = Ll,career = Cr,race = Re,sex = Sx,head = Hd} ->
									{Name,Ll,Cr,Re,Sx,Hd};
								_->
									{"",0,0,0,0,0}
							end,
							Msg = playerMsg:getErrorCodeMsg(?ErrorCode_ApplyDanceSuccess),
							gsSendMsg:sendNetMsg(NetPid, Msg),
							{#recAnswerResult{roleID = RoleID, roleName = RoleName,pid = Pid, netPid = NetPid,level = Level,career = Career,race = Race,sex = Sex,head = Head}, ?ErrorCode_ApplyDanceSuccess,1};
						#recAnswerResult{} = Apply ->
							{Apply#recAnswerResult{pid = Pid, netPid = NetPid}, 0,3}
					end,

				PrepareTime =  getPrepareTime(),
				EndTime =
				case   PrepareTime >0 of
					  true ->
						  configAllplayerquestion_activitytotaltime()  - (time:getSyncUTCTimeFromDBS() - PrepareTime );
						_->
							0
                end,
				putAnswerApplyObject(NewApply),

				Msg2 = #pk_GS2U_ApplyAnswerResult{result = Result,endTime = EndTime},
				gsSendMsg:sendNetMsg(NetPid,Msg2),


				case getAnswerState() of
					true->
						sendQuestionToClient();
					_->
						Sortlist = sortAnswerByScore(),
						RankList =  createRankMsg([], 1, 50, Sortlist),

						Sortlist1=  lists:reverse(Sortlist),
						createExtData(RoleID,Sortlist1,NetPid),
						Msg3 = #pk_GS2U_AnswerRank{ isover =  false,data = RankList},
						Fun =
							fun(_Key, #recAnswerResult{netPid = NetPid, roleID = RoleID}, _) ->
								gsSendMsg:sendNetMsg(NetPid, Msg3)
							end,
						dict:fold(Fun, ok, getAnswerApply())
				end,
				?DEBUG_OUT("applyDance:~p", [RoleID]),

				ErrorCode;
			_ ->
				?ErrorCode_DanceActivityNotStart
		end,
	ok.
%% 主活动模块进程回调
-spec activityChangeCallBack(Phase::uint()) -> ok.
activityChangeCallBack(?ActivityPhase_AnswerPlay_1) ->
	?LOG_OUT("~p ~p answer wait start", [?MODULE, self()]),
	ok;
%% 答题活动准备开始倒计时5分钟
activityChangeCallBack(?ActivityPhase_AnswerPlay_2) ->
	?LOG_OUT("~p ~p answer wait start", [?MODULE, self()]),
	setCanApply(true),
	setAnswerState(false),
	setPrepareTime(time:getSyncUTCTimeFromDBS()),
    Content = stringCfg:getString(allplayerquestion_serverstrings_1),
	activityCommon:sendBroadcastNotice(Content),
	%%sendQuestionToClient(),
	ok;

%% 答题活动准备开始倒计时3分钟
activityChangeCallBack(?ActivityPhase_AnswerPlay_3) ->
	?LOG_OUT("~p ~p answer wait start", [?MODULE, self()]),
	setCanApply(true),
	%%setAnswerState(true),
	Content = stringCfg:getString(allplayerquestion_serverstrings_2),
	activityCommon:sendBroadcastNotice(Content),
	%%sendQuestionToClient(),
	ok;

%% 答题活动准备开始倒计时3分钟
activityChangeCallBack(?ActivityPhase_AnswerPlay_4) ->
	?LOG_OUT("~p ~p answer wait start", [?MODULE, self()]),
	setCanApply(true),
	%%setAnswerState(true),
	Content = stringCfg:getString(allplayerquestion_serverstrings_3),
	activityCommon:sendBroadcastNotice(Content),
	%%sendQuestionToClient(),
	ok;

%% 答题活动开始
activityChangeCallBack(?ActivityPhase_AnswerPlay_5) ->
	?LOG_OUT("~p ~p answer start", [?MODULE, self()]),
	Content = stringCfg:getString(allplayerquestion_serverstrings_4),
	activityCommon:sendBroadcastNotice(Content),
	setPrepareTime(0),
	setCanApply(true),
	setAnswerState(true),


	case getTimerRef() of
		undefined ->
			setTimerRef(erlang:send_after(configAllplayerquestion_times()*1000, self(), answer_timerTick));
		_ ->
			skip
	end,
	initNextQuestion(),
	sendQuestionToClient(),
    ok;

%% 答题活动结束
activityChangeCallBack(?ActivityPhase_Close) ->
	case getAnswerState() of
		true ->

			Content = stringCfg:getString(allplayerquestion_serverstrings_5),
			activityCommon:sendBroadcastNotice(Content),
			sendAnswerReward(),

			setAnswerState(false),
			setNowStartTime(0),
			delAnswerTrue(),
			delRobitResult(),

			case getTimerRef() of
				undefined ->
					skip;
				TimerRef ->
					erlang:cancel_timer(TimerRef)
			end,
			setTimerRef(undefined),
			%%delTimerRef(),
			delAaswerFirstAndSecond(),
			delCurrentQuision(),
			delAnswerQuestion(),
			%% 结束
			setCanApply(false),
			deAllAnswerApply(),
			delNowStartTime(),
			setPrepareTime(0);
		 _ ->
			skip
	end,
	ok.
%%积分列表排序
sortAnswerByScore() ->
	AllAPPLY = getAnswerApply(),
	ScoreList =  dict:to_list(AllAPPLY),
	F = fun({_Key, Value}) ->
			case Value of
				#recAnswerResult{}  ->
					Value
			end
	    end,
	ScoreList2 = lists:map(F, ScoreList),
	AscSortList = lists:keysort(#recAnswerResult.score, ScoreList2),
	AscSortList.

%%榜单扩展数据
createExtData(RoleID, Data,NetPid) ->
	case getAnswerRankIndex(RoleID, Data, 1) of
		{ok, {Index, #recAnswerResult{score  = Score}}} ->
			Msg = #pk_GS2U_MyAnswerRank{ranking  = Index, value =Score },
			gsSendMsg:sendNetMsg(NetPid, Msg);
		_->
			?ERROR_OUT("NO (~p) this id in Apply",[RoleID]),
			none
	end.


getAnswerRankIndex(_RoleID, [], _Index) ->
	{error, none};
getAnswerRankIndex(RoleID, [#recAnswerResult{roleID = RoleID} = AnswerInfo | _], Index) ->
	{ok, {Index, AnswerInfo}};
getAnswerRankIndex(RoleID, [_ | AnswerSortList], Index) ->
	getAnswerRankIndex(RoleID, AnswerSortList, Index + 1).



%%取前N名
-spec createRankMsg(HasMsgList :: [#pk_ActivityAnswerRankData{}], CurrNum :: uint(), MaxNum :: uint(), List :: list()) -> [#pk_ActivityAnswerRankData{}].
createRankMsg(HasMsgList, CurrNum, MaxNum, [#recAnswerResult{roleID = RoleID,roleName =RoleName, score = Score} | Tail]) when CurrNum =< MaxNum ->
	%%RoleName = playerNameUID:getPlayerNameByUID(RoleID),
	N = #pk_ActivityAnswerRankData{name  = RoleName, value = Score},
	createRankMsg([N | HasMsgList], CurrNum + 1, MaxNum, Tail);
createRankMsg(HasMsgList, _CurrNum, _MaxNum, []) ->
	HasMsgList.


-spec initNextQuestion() -> ok.
initNextQuestion() ->


	initAllAnswerApply(),
	setAaswerFirstAndSecond(0),
	setNowStartTime(time:getSyncUTCTimeFromDBS()),
	QuistionList = getCfg:get1KeyList(cfg_allplayerquestion),
	NewQuisiontList =
		case getAnswerQuestion() of
			[]->
				setAnswerQuestion(QuistionList),
				QuistionList;
			KeyList ->
				case misc:size(KeyList) =< 0 of
					true ->
						setAnswerQuestion(QuistionList),
						QuistionList;
					_->
						KeyList
				end
		end,
	Index = misc:rand(1, misc:size(NewQuisiontList)),
	QustionID = lists:nth(Index, NewQuisiontList),
	setCurrentQuision(QustionID),
	NewKeyList = lists:delete(QustionID, NewQuisiontList),
	setAnswerQuestion(NewKeyList),
	ok.
%% 发送题目给所有在线玩家
-spec sendQuestionToClient() -> ok.
sendQuestionToClient() ->


	QustionID = getCurrentQuision(),
	Question_times = configAllplayerquestion_times(),
	EndTime =  Question_times- ( time:getSyncUTCTimeFromDBS() -  getNowStartTime()),

	case  QustionID of
		 [] ->  ?ERROR_OUT("NO  getCurrentQuision ");
		_->
			%%Msg = #pk_GS2U_AllAnswerQuestion{questionID = QustionID,startTime = getNowStartTime()},
			Sortlist = sortAnswerByScore(),
			RankList =   createRankMsg([], 1, 50, Sortlist),
			Msg = #pk_GS2U_SendAnswerData{questionID = QustionID,endTime  =EndTime,data = RankList},
			ReverseList =  lists:reverse(Sortlist),
			Fun =
				fun(#recAnswerResult{netPid = NetPid,score = Score, roleID = _RoleID}, Idx) ->
					Msg1 = #pk_GS2U_MyAnswerRank{ranking  = Idx, value =Score },
					gsSendMsg:sendNetMsg(NetPid, Msg1),
					gsSendMsg:sendNetMsg(NetPid, Msg),
					Idx+1
				end,
			lists:foldl(Fun, 1, ReverseList)
	end,
	ok.

%% 获取玩家答题结果，设置玩家答题表的信息
-spec playerAnswerResult(RoleID, Name, Level ,QuestionID, IsRight,Result, Pid) -> term() when
	RoleID::uint(), Name :: term(), Level::uint(),QuestionID::uint(), IsRight::boolean(), Result ::string(), Pid::pid().
playerAnswerResult(RoleID, Name, Level,QuestionID, IsRight, Result, Pid) ->
	 case IsRight  andalso getCurrentQuision() =:= QuestionID  of
        true ->
	        case getAnswerState() of
		          true ->
			          case getCfg:getCfgByArgs(cfg_allplayerquestion,QuestionID) of
				          #allplayerquestionCfg{answer = Answer,reward_server = Reward} ->
					          case string:str(Answer, Result) >= 0 of
								  true ->
									  case getAnswerApplyObject(RoleID) of
										  #recAnswerResult{isRusult = true} = OldResult
											  ->
											 skip;
										  false ->
											  ?ERROR_OUT("No registration");
										  #recAnswerResult{head = Head,level = Level,race = Race,career = Career,sex = Sex,score = OldScore,isRusult = false} = OldResult
											  ->
											  %%设置答题排位
											  QuestionRewardList =  configAllplayerquestion_ratio(),
											  QuestionScoreList = configAllplayerquestion_integral(),
											  Num =
												  case getAaswerFirstAndSecond() of
													  [] ->
														  setAaswerFirstAndSecond(1),
														  1;

													  V->
														  Ranking = V+1,
														  setAaswerFirstAndSecond(Ranking),
														  Ranking
												  end,

											  %%发放答对奖励
											  Fun =
												  fun({RankStart,RankEnd,Term},{_,Rank}) ->
													  case Rank>= RankStart andalso Rank < RankEnd of
														  true ->
															  {true,Term};
														  _->
															  {false,Term}
													  end
												  end,
											  {_, Magnification} =   misc:foldlEx(Fun,{false,Num},QuestionRewardList),%% lists:foldl(Fun, 0, QuestionRewardList),


											  Fun1 =
												  fun({MoneyType,MoneyNum}) ->
													  psMgr:sendMsg2PS(Pid, answer_isright_addmoney, {RoleID, MoneyType,MoneyNum * Magnification})
												  end,

											  lists:foreach(Fun1,Reward),

											  %%积分奖励
											  {_, Score} =   misc:foldlEx(Fun,{false,Num},QuestionScoreList),

											  NewResult = OldResult#recAnswerResult{
												  roleID = RoleID,
												  roleName = Name,
												  isRusult = true,
												  score =OldScore + Score
											  },
											  putAnswerApplyObject(NewResult),

											  %%转发 所有报名 玩家 同步聊天信息
											  Msg1 = #pk_GS2U_PlayerAnswer{roleID = RoleID, questionID = QuestionID,isright = true,answers = Result
												  ,isFirstAnser = Num,roleName = Name,level = Level,career = Career,sex = Sex,race = Race,head = Head},
											  Fun2 =
												  fun(_Key, #recAnswerResult{netPid = NetPid, roleID = _RoleID}, _) ->
													  case RoleID =:= _RoleID of
														  true ->
															  Sortlist = sortAnswerByScore(),
															  RankList =   createRankMsg([], 1, 50, Sortlist),

															  ReverseList =  lists:reverse(Sortlist),
															  createExtData(RoleID,ReverseList,NetPid),
															  Msg = #pk_GS2U_AnswerRank{ isover =  false,data = RankList},
															  gsSendMsg:sendNetMsg(NetPid, Msg);
														  _->skip
													  end,
													  gsSendMsg:sendNetMsg(NetPid, Msg1)
												  end,
											  dict:fold(Fun2, ok, getAnswerApply())
									  end;
								  _ ->
									  case getAnswerApplyObject(RoleID) of
										  false ->
											  ?ERROR_OUT("No registration");
										  #recAnswerResult{head = Head,level = Level,race = Race,career = Career,sex = Sex}
											  ->
											  Msg1 = #pk_GS2U_PlayerAnswer{roleID = RoleID, questionID = QuestionID,isright = false,answers = Result
												  ,isFirstAnser = 0,roleName = Name,level = Level,career = Career,sex = Sex,race = Race,head = Head},
											  Fun =
												  fun(_Key, #recAnswerResult{netPid = NetPid, roleID = RoleID}, _) ->
													  gsSendMsg:sendNetMsg(NetPid, Msg1)
												  end,
											  dict:fold(Fun, ok, getAnswerApply())
									  end
					          end;
					          _->
						          case getAnswerApplyObject(RoleID) of
							          false ->
								          ?ERROR_OUT("No registration");
							          #recAnswerResult{head = Head,level = Level,race = Race,career = Career,sex = Sex}
								          ->
								          Msg1 = #pk_GS2U_PlayerAnswer{roleID = RoleID, questionID = QuestionID,isright = false,answers = Result
									          ,isFirstAnser = 0,roleName = Name,level = Level,career = Career,sex = Sex,race = Race,head = Head},
								          Fun =
									          fun(_Key, #recAnswerResult{netPid = NetPid, roleID = RoleID}, _) ->
										          gsSendMsg:sendNetMsg(NetPid, Msg1)
									          end,
								          dict:fold(Fun, ok, getAnswerApply())
						          end
			          end;
				_->
					case getAnswerApplyObject(RoleID) of
						false ->
							?ERROR_OUT("No registration");
						#recAnswerResult{head = Head,level = Level,race = Race,career = Career,sex = Sex}
							->
							Msg1 = #pk_GS2U_PlayerAnswer{roleID = RoleID, questionID = QuestionID,isright = false,answers = Result
								,isFirstAnser = 0,roleName = Name,level = Level,career = Career,sex = Sex,race = Race,head = Head},
							Fun =
								fun(_Key, #recAnswerResult{netPid = NetPid, roleID = RoleID}, _) ->
									gsSendMsg:sendNetMsg(NetPid, Msg1)
								end,
							dict:fold(Fun, ok, getAnswerApply())
					end
	        end;
	    _->
			  case getAnswerApplyObject(RoleID) of
				false ->
					?ERROR_OUT("No registration");
                #recAnswerResult{head = Head,level = Level,race = Race,career = Career,sex = Sex}
					->

					Msg1 = #pk_GS2U_PlayerAnswer{roleID = RoleID, questionID = QuestionID,isright = false,answers = Result
					,isFirstAnser = 0,roleName = Name,level = Level,career = Career,sex = Sex,race = Race,head = Head},
					Fun =
						fun(_Key, #recAnswerResult{netPid = NetPid, roleID = RoleID}, _) ->
							gsSendMsg:sendNetMsg(NetPid, Msg1)
						end,
			        dict:fold(Fun, ok, getAnswerApply())
			end
      end,
	ok.


%%活动结束发送玩家奖励
-spec sendAnswerReward() -> ok.
sendAnswerReward() ->

	RewardList =  configAllplayerquestion_reward(),

	AllPlayer = getAnswerApply(),

	AscSortList = sortAnswerByScore(),%%lists:keysort(#recAnswerResult.score, ListScore),
	F =
		fun({RankStart,RankEnd,Term},{_,Rank}) ->
			case Rank>= RankStart andalso Rank < RankEnd of
				true ->
					{true,Term};
				_->
					{false,Term}
			end
		end,
	Fun1 =
		fun(#recAnswerResult{roleID =  RoleID},Rank) ->

			{_, RewardID} =   misc:foldlEx(F,{false,Rank},RewardList),
			case playerMail:createMailGoods(RewardID, 1, true, 0, RoleID, ?ItemSourceLuckDraw) of
				[#recMailItem{}|_] = MailItemList ->

					Content = stringCfg:getString(allplayerquestion_mail_2, [Rank]),
					Title = stringCfg:getString(allplayerquestion_mail_1),
					mail:sendSystemMail(RoleID, Title, Content, MailItemList, "");
				_ ->
					?ERROR_OUT("settle_Reward RewardID(~p)", [RewardID])
			end,
			Rank+1
		end,
	lists:foldl(Fun1,1,AscSortList),
	RankList =   createRankMsg([], 1, 50, AscSortList),
	Msg = #pk_GS2U_AnswerRank{ isover =  true,data = RankList},
	ReverseList =  lists:reverse(AscSortList),
	Fun2 =
		fun(#recAnswerResult{netPid = NetPid,score = Score, roleID = _RoleID}, Idx) ->
					Msg1 = #pk_GS2U_MyAnswerRank{ranking  = Idx, value =Score },
					gsSendMsg:sendNetMsg(NetPid, Msg1),
					gsSendMsg:sendNetMsg(NetPid, Msg),
					Idx+1
		end,
	lists:foldl(Fun2, 1, ReverseList),

	ok.


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


%% 答题tick
setTimerRef(TimerRef) ->
	put('TimerRef', TimerRef).
getTimerRef() ->
	get('TimerRef').
delTimerRef() ->
	erlang:erase('TimerRef').

getAnswerApplyObject(RoleID) ->
	Dict = getAnswerApply(),
	case dict:find(RoleID, Dict) of
		{ok, #recAnswerResult{} = Apply} -> Apply;
		_ -> false
	end.
putAnswerApplyObject(#recAnswerResult{roleID = RoleID} = Apply) ->
	Dict = getAnswerApply(),
	setAanswerApply(dict:store(RoleID, Apply, Dict)).
%% 报名字典
getAnswerApply() ->
	case get('AnswerApply') of
		undefined -> dict:new();
		Dict -> Dict
	end.
setAanswerApply(Dict) ->
	put('AnswerApply', Dict).

%% 能否报名
setCanApply(Apply) ->
	put('CanApply', Apply).
getCanApply() ->
	get('CanApply').


initAllAnswerApply()->
	Fun2 =
		fun(_Key, #recAnswerResult{} = Answer, _) ->
			NewAnswer =  Answer#recAnswerResult{
				isRusult = false
			 },
			putAnswerApplyObject(NewAnswer)
		end,
	dict:fold(Fun2, ok, getAnswerApply()),

	ok.

deAllAnswerApply() ->
	Dict = getAnswerApply(),
	lists:foreach(fun(RID) -> delAnswerApply(RID) end, dict:fetch_keys(Dict)),
	%% 最后删掉DICT
	erlang:erase('AnswerApply').
delAnswerApply(RoleID) ->
	D = getAnswerApply(),
	NewD = dict:erase(RoleID, D),
	setAanswerApply(NewD).
%% 设置每题抢答前两位
setAaswerFirstAndSecond(Num) ->
	put('FirstAndSecond', Num),
	ok.

%% 设置每题抢答前两位
getAaswerFirstAndSecond() ->
	case get('FirstAndSecond') of
		undefined ->
			[];
		V ->
			V
	end.


delAaswerFirstAndSecond() ->
	erlang:erase('FirstAndSecond').

setCurrentQuision(Question) ->
	put('CurrentQuision', Question),
ok.

%% 获取当前所有题目
getCurrentQuision() ->
	case get('CurrentQuision') of
		undefined ->
			[];
		V ->
			V
	end.

delCurrentQuision() ->
	erlang:erase('CurrentQuision').


%% 设置所有题目
setAnswerQuestion(QuestionList) ->
	put('AnswerQuestion', QuestionList),
	ok.

%% 获取当前所有题目
getAnswerQuestion() ->
	case get('AnswerQuestion') of
		undefined ->
			[];
		V ->
			V
	end.

delAnswerQuestion() ->
	erlang:erase('AnswerQuestion').

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


%%设置准备时间
setPrepareTime(Time)->
	put('PrepareTime', Time),
ok.


%%获取备时间
getPrepareTime()->
	case get('PrepareTime') of
		undefined ->
			0;
		T ->
			T
	end.
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
%%删除答题时间
delNowStartTime() ->
	erlang:erase('StartTime').

getglobValue(Key) ->
    case getCfg:getCfgPStack(cfg_globalsetup, Key) of
        #globalsetupCfg{setpara = [Para]} ->
            Para;
        [] ->
            undefined
    end.

%%每题的间隔时间
configAllplayerquestion_times() ->
	#globalsetupCfg{setpara = [List]} =
		getCfg:getCfgPStack(cfg_globalsetup, allplayerquestion_time),
	List.

%%奖励倍数
configAllplayerquestion_ratio() ->
	#globalsetupCfg{setpara = List} =
		getCfg:getCfgPStack(cfg_globalsetup, allplayerquestion_ratio),
	List.

%%积分奖励
configAllplayerquestion_integral() ->
	#globalsetupCfg{setpara = List} =
		getCfg:getCfgPStack(cfg_globalsetup, allplayerquestion_integral),
	List.


%%活动结束后奖励
configAllplayerquestion_reward() ->
	#globalsetupCfg{setpara = List} =
		getCfg:getCfgPStack(cfg_globalsetup, allplayerquestion_reward),
	List.

%%活动时间
configAllplayerquestion_activitytotaltime() ->
	#globalsetupCfg{setpara = [List]} =
		getCfg:getCfgPStack(cfg_globalsetup, allplayerquestion_activitytotaltime),
	List.




