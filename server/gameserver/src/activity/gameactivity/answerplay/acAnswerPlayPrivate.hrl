-ifndef(AcAcswerPlayPrivate_hrl).
-define(AcAcswerPlayPrivate_hrl, 1).

-include("gsInc.hrl").
-include("activityDef.hrl").

-define(AnswerQuestionMax, 3).

-record(recAnswerResult, {
		roleID = 0,			%%角色ID
        roleName = "",      %%角色名字
		answerTime = 0,		%%角色答题时间
        trueNum = 0,        %%答题正确数
		rusult = 0,  	    %%角色答题结果
        exp = 0 :: uint(),  %%角色累积经验
        coin = 0 ::uint(),  %%角色累积金币
        answerNum=0         %%答题次数
	 }).

-record(recAnswerTrue, {
    questionID = 0,     %%题目ID
    answer::list()      %%答案列表
}).

-record(recRobitAnswer, {
	startTime = 0,		%%开始时间
	prepareTime = 0		%%间隔时间					 
 }).
-endif.