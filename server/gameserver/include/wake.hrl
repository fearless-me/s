%%觉醒系统
-author(luowei).

-ifndef(Wake_hrl).
-define(Wake_hrl,1).

-record(recWake,{
	cardID = 0,				%%卡片ID
	curLevel = 0,			%%当前等级
	curNum = 0,				%%当前数量
	activeProgress = 0,      %%激活进度
	unLockStateMax = 0,     %%解锁最大等级
	curState = 0            %%当前使用状态
}).

-define(ProgressMax, 100).
-define(ProgressUnlocked, 10000).

-endif.
