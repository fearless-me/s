%%
%% @author zhongyunawei
%% @doc @todo 怪物进程私有头文件

-author(zhongyuanwei).

-ifndef(MonsterPrivate_hrl).
-define(MonsterPrivate_hrl,1).

-include("gsInc.hrl").
-include("bst.hrl").
-include("bstTree.hrl").

-define(MonsterMoveStatusWalk,0).
-define(MonsterMoveStatusRun,1).

-define(MonsterPSEts,monsterPsEts).

-record(recMonsterPs,{
	mapID,
	monsterPid,
	monsterNum = 0
}).

-endif.
