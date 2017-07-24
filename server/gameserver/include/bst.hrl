%% @author zhongyunawei
%% @doc @todo 行为选择树的条件变量与行为定义及其说明.

-ifndef(BST_HRL).
-define(BST_HRL,1).

-author(zhongyuanwei).

%% ====================================================================
%% AI类型
%% ====================================================================

-define(AI_TYPE_Min, 0).
-define(AI_TYPE_None,					0).	%% 无AI
-define(AI_Type_PassivePursue,			1).	%% 被动怪
-define(AI_Type_Active,       			2).	%% 主动怪
-define(AI_Type_Carrier,      			3).	%% 载体
-define(AI_Type_SpecWay1,      			4).	%% 按本地图路点移动的怪，正走
-define(AI_Type_SpecWay2,      			5).	%% 按本地图路点移动的怪，反走
-define(AI_Type_SpecWayList,			6).	%% 多岔路正走
-define(AI_Type_PassiveSpecWay,			7).	%% 多岔路正走'打怪
-define(AI_TYPE_ConvoyFollowPlayer,		8).	%% 护送，跟随玩家
-define(AI_TYPE_ConvoyPlayerFollow,		9).	%% 护送(固定路线行走)，玩家跟随
-define(AI_Type_ActiveCopyMapConvoy,	10).%% 主动怪，副本护送助战怪，选择目标必须是5
-define(AI_TYPE_Max, 9).
-export_type([ai_type/0]).
-type ai_type() :: ?AI_TYPE_Min .. ?AI_TYPE_Max.

%% ====================================================================
%% 条件变量
%% ====================================================================

%%是否有目标
-define(BSTCondVar_HasTarget,1).

%%判断是否被攻击
-define(BSTCondVar_IsBeAttacked,2).

%%判断目标是否存活
-define(BSTCondVar_IsTargetAlive,3).

%%判断目标是否存在
-define(BSTCondVar_IsTargetExist,4).

%%判断自己是否在攻击CD中
-define(BSTCondVar_IsAttackCD,5).

%%判断自己是否存活
-define(BSTCondVar_IsSelfAlive,6).

%%判断是否在攻击范围内
-define(BSTCondVar_IsInAttackRange,7).

%%判断是否追踪目标
-define(BSTCondVar_IsTrace,8).

%%判断定时使用技能
%%-define(BSTCondVar_IsTimerUseSkill, 9).

%%判定是否正在释放技能(引导，吟唱)
-define(BSTCondVar_IsCast, 10).

-type bstCondVar() :: 1 .. 10.

%% ====================================================================
%% 行为
%% ====================================================================

%%空闲 无参数
-define(BSTActionIdle,0).
%%移动 参数：{随机、向目标移动，移动速度}
-define(BSTActionMove,1).
%%选择目标 参数：第一次攻击我的、血量最少的、仇恨值最大的
-define(BSTActionSelTarget,2).
%%选择技能
-define(BSTActionSelSkill,3).
%%追击
-define(BSTActionPursue,4).
%%逃跑
-define(BSTActionFlee,5).
%%攻击
-define(BSTActionAttack,6).

-type bstActionType() :: 0 .. 6.

%% ====================================================================
%% 移动行为参数
%% ====================================================================

-define(BST_MOVE_STAND, -1).
%%目标位置
-define(BST_MOVE_TARGET,0).
%%向目标移动不跟踪
-define(BST_MOVE_NO_TRACE_TARGET,1).
%%向目标移动跟踪，
-define(BST_MOVE_TRACE_TARGET,2).
%%随机向一个方向移动
-define(BST_MOVE_RAND_DIR,3).
%%随机向一个目标移动
-define(BST_MOVE_RAND_TARGET,4).
%%随机向一个目标移动
-define(BST_MOVE_WAY_LIST,5).
%%纯粹向护送目标移动
-define(BST_MOVE_CONVOY,6).


-type bstMoveType() :: 0 .. 5.


%% ====================================================================
%% 选择目标行为参数
%% ====================================================================


-define(BST_SELTARGET_RANDOM,             		1).   	%%随机攻击目标
-define(BST_SELTARGET_HIGHESTHATE,        		2).   	%%选择仇恨值最高
-define(BST_SELTARGET_TIMER,              		3).   	%%定时随机目标
-define(BST_SELTARGET_ENEMY_CTRLER,		  		4).		%%选择敌对玩家或者宠物
-define(BST_SELTARGET_ENEMY_MONSTER,	  		5).		%%选择敌对怪物
-define(BST_SELTARGET_ENEMY_MONSTER_FIRST,		6).		%%选择敌对玩家或者宠物
-define(BST_SELTARGET_DEAD_RANDOM,             	7).   	%%随机攻击目标,目标死亡后,未脱离战斗,则再次随机




%%额外技能选择目标
-define(BST_EXT_SKILL_SELTARGET_MYSELF,         0).   	%%自己
-define(BST_EXT_SKILL_SELTARGET_DEFALT,        	4).   	%%默认当前目标
-define(BST_EXT_SKILL_SELTARGET_RANDOM1,       	5).   	%%非当前目标随机(玩家)
-define(BST_EXT_SKILL_SELTARGET_RANDOM2,       	6).   	%%随机攻击目标(玩家)

-type bstActSelTargetType() :: 1 .. 5.

%% ====================================================================
%% 选择技能行为参数
%% ====================================================================

-define(BST_SELSKILL_NORMAL_MONSTER,              1).   %%普通怪物选择技能
-define(BST_SELSKILL_BOSS,                        2).   %%BOSS技能选择

-type bstActSelSkillType() :: 1 .. 2.

%% ====================================================================
%% 攻击行为参数
%% ====================================================================
	
-endif.
