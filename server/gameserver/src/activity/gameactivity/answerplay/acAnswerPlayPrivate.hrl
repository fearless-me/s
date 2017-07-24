-ifndef(AcAcswerPlayPrivate_hrl).
-define(AcAcswerPlayPrivate_hrl, 1).

-include("gsInc.hrl").
-include("activityDef.hrl").

-define(AnswerQuestionMax, 3).

-record(recAnswerResult, {
		roleID = 0,			%%角色ID
		pid = undefined,
		netPid = undefined,
        roleName = ""     ::string(),      %%角色名字
		isRusult =   false ::boolean(),  	    %%是否已经答题
		score = 0 , %%积分
		race			= 0, %% 玩家种族
		career          = 0, %% 职业
		sex				= 0, %% 性别
		level           = 0, %% 等级
		head            = 0  %%头像

	 }).

-record(recAnswerTrue, {
    questionID = 0,     %%题目ID
    answer::list()      %%答案列表
}).

-record(recRobitAnswer, {
	startTime = 0,		%%开始时间
	prepareTime = 0		%%间隔时间					 
 }).

%% 心跳，用于驱动地图状态
-define(AnswerTimerTick, answer_timerTick).	% 秒级心跳消息
-define(TimeTick, 30000).							% 心跳时间
-endif.