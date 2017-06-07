%% @author wagnjie
%% @doc @todo 答题玩法


-module(playerAnswer).

-include("playerPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([answerQuestionInit/0,
        answerResult/2,
        answerResultAck/1,
        getAnswerRewardFirst/2,
        getAnswerRewardLucky/2
        ]).


%%玩家上线获取答题信息
-spec answerQuestionInit() -> ok.
answerQuestionInit() ->
    core:sendMsgToActivity(?ActivityType_AnswerPlay,
        getAnswerInfo,
        {
            playerState:getRoleID(),
            playerState:getNetPid()
        }),
    ok.

%% 玩家答题结果
-spec answerResult(QuestionID::uint(), Answers::uint()) -> ok.
answerResult(0, 0) ->
	?ERROR_OUT("error answerResult:~s", [playerState:getName()]),
	ok;
answerResult(QuestionID, Answers) ->
    core:sendMsgToActivity(?ActivityType_AnswerPlay,
					   answerResult,
					   {
						playerState:getRoleID(),
                        playerState:getName(),
                        playerState:getLevel(),
						QuestionID,
						Answers
					   }),
	ok.

%% 活动进程处理答题结果
-spec answerResultAck(term()) -> ok.
answerResultAck({0,0,0,0,0,0,0}) ->
	ok;
answerResultAck({True, TrueAnswer, _Answers, TotalExp, TotalCoin, TrueNum, _NewAnswerNum}) ->
	case playerDaily:getDailyCounter(?DailyType_Answer, 0) of
		0 ->
			playerLogAdd:addLogParticipatorInfo(?LogParticipator_PlayerUseAnswer);
		_ ->
			skip
	end,
	playerDaily:incDailyCounter(?DailyType_Answer, 0),
    #indexFunctionCfg{question_exp = Qexp, question_money = Qmoney} = getCfg:getCfgPStack(cfg_indexFunction, playerState:getLevel()),
    if 
		True =:= 1 ->
	        playerBase:addExp(Qexp, ?ExpSourceAnswerPlay, 0),
	        playerMoney:addCoin(?CoinTypeGold, Qmoney,
	            #recPLogTSMoney{reason = ?CoinSourceAnswerReward, param = 0, target = ?PLogTS_PlayerSelf, source = ?PLogTS_AnswerReward});
	    True =:= 0 ->
	        playerBase:addExp(erlang:round(Qexp/2), ?ExpSourceAnswerPlay, 0),
	        playerMoney:addCoin(?CoinTypeGold, erlang:round(Qmoney/2),
	            #recPLogTSMoney{reason = ?CoinSourceAnswerReward, param = 0, target = ?PLogTS_PlayerSelf, source = ?PLogTS_AnswerReward});
		true ->
			skip
    end,
    Msg = #pk_GS2U_PlayerAnswerResult{result = True, trueAnswer = TrueAnswer},
    playerMsg:sendNetMsg(Msg),
    Msg1 = #pk_GS2U_PlayerAnswerInfo{trueNum = TrueNum, totalExp = erlang:round(TotalExp), totalCoin = erlang:round(TotalCoin)},
    playerMsg:sendNetMsg(Msg1),
    ok.

%% 抢题王奖励
-spec getAnswerRewardFirst(Exp::uint(),Coin::uint()) -> ok.
getAnswerRewardFirst(Exp,Coin) ->
	ItemID = getglobValue(question_gift_n1),
	GemMailTitle = stringCfg:getString(answerReswardFirstTitle),
	GemMailContent = stringCfg:getString(answerReswardFirstContent),
	playerMail:sendGoodsMailTitleAndContent(ItemID,1,true,0,GemMailTitle,GemMailContent,?ItemSourceAnswerReward),
    playerBase:addExp(round(Exp * 3), ?ExpSourceAnswerPlay, 0),
    playerMoney:addCoin(?CoinTypeGold, round(Coin * 3),
        #recPLogTSMoney{reason = ?CoinSourceAnswerReward, param = 0, target = ?PLogTS_PlayerSelf, source = ?PLogTS_AnswerReward}),
    playerGameNotice:sendSystemChatByECode(?ErrorCode_CnTextAnswerRewardFirst, [round(Exp * 3), round(Coin * 3)]),
    ok.

%% 幸运玩家奖励
-spec getAnswerRewardLucky(Exp::uint(),Coin::uint()) -> ok.
getAnswerRewardLucky(Exp,Coin) ->
    playerBase:addExp(round(Exp * 2), ?ExpSourceAnswerPlay, 0),
    playerMoney:addCoin(?CoinTypeGold, round(Coin * 2),
        #recPLogTSMoney{reason = ?CoinSourceAnswerReward, param = 0, target = ?PLogTS_PlayerSelf, source = ?PLogTS_AnswerReward}),
    playerGameNotice:sendSystemChatByECode(?ErrorCode_CnTextAnswerRewardLucky,[round(Exp * 2), round(Coin * 2)]),
    ok.

%% ====================================================================
%% Internal functions
%% ====================================================================
getglobValue(Key) ->
    case getCfg:getCfgPStack(cfg_globalsetup, Key) of
        #globalsetupCfg{setpara = [Para]} ->
            Para;
        [] ->
            undefined
    end.

