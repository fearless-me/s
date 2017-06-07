%% @author zhongyunawei
%% @doc @todo 怪物相关定义.

-author(zhongyuanwei).

-ifndef(Monster_hrl).
-define(Monster_hrl,1).

-include("skill.hrl").

-define(SpawnMonster,     0).
-define(SpawnPet,         1).
-define(SpawnCallMonster, 2).
-define(SpawnCarrier,     3).
-define(SpawnCallPet,     4).

-define(InitPet,          0). %%初始化宠物
-define(InitMonster,      1). %%初始化怪物
-define(InitCarrier,      2). %%初始化载体
%% 怪物子类型
-define(MonsterSTypeNormal, 0).
-define(MonsterSTypeWildBoss, 1).
-define(MonsterSTypeTower, 2).
-define(MonsterSTypeWorldBoss, 3).


-record(recSpawnMonster,{
	id = 0,							    %%怪物的ID
	mapPid = 0,                            %%怪物所在的地图Pid
	mapID = 0,                             %%怪物所在的地图ID
	x = 0,								    %%怪物的位置X
	y = 0,								    %%怪物的位置Y
	rotW = 0.0,                            %%旋转量
	spawnCD = 0,						    %%刷新间隔
	deadTime = 0,                          %%死亡时间
	level = 0,							    %%设置怪物的等级
	teamID = 0,                            %%怪物归宿战队ID
	camp = 0,                              %%怪物阵营
	guildID = 0,                           %%怪物所属于公会
	code = 0,                              %%怪物生成code
	playerEts,                             %%怪物所在地图的人物表
	monsterEts,                            %%怪物所在地图的怪物表
	petEts,                                %%怪物所在地图的宠物表
	groupID = 0,                           %%怪物的所属分组ID
	name = "",								%%怪物名字
	params = 0,
	other = {},                            %%普通怪物默认为{},载体#recCallCarrier{}召唤怪物#recCallMonster{}
	initBattlePropCallBack :: function() | undefined    %%在怪物初始化完基础值后回调的一个函数
}).

%%召唤怪物
-record(recCallMonster,{
	caller = 0,												%%召唤者
	lifeTime = 0,											%%召唤时间
	callCaster = #recCasterInfo{}							%%召唤主人信息
}).

%%召唤载体
-record(recCallCarrier,{
	moveAi = 0,												%%载体移动Ai
	releaseAi = 0,											%%技能释放Ai
	skillLv = 0,											%%技能等级
	lifeTime = 0,											%%载体召唤时间
	targetCode = 0,											%%目标Code
	battleProp = [],										%%战斗属性[#battleProp{},...]
	callCaster = #recCasterInfo{}							%%召唤主人信息
}).

%%召唤护送
-record(recCallConvoy,{
	roleID = 0,
	roleCode = 0
}).

-record(recMonster,{
	code = 0,							%%怪物的Code
	id = 0,								%%怪物ID
	curHp = 0,							%%怪物当前血量
	curMp = 0,							%%怪物当前魔法
	x,									%%当前X
	y,									%%当前Y
	level,								%%怪物等级
	actionStatus = 0,					%%怪物主动状态
	status,								%%怪物被迫状态
	hateDict,							%%怪物仇恨列表
	hitRestoreHp = {0,0},				%%击中回血信息{SkillID,SN}
	moveTargetPos = {0,0},				%%移动目标
	moveSpeed = 0,						%%移动速度
	firstAttackerCode,					%%第一次攻击者
	name = "",							%%怪物的名字
	aiPid,								%%怪物AI的进程Pid
	curSelSkillID = 0,					%%当前选择的技能ID
	targetCode = 0,						%%怪物的攻击目标
	spawnArg = #recSpawnMonster{},
	battleProp = #battleProp{}
}).

-record(selSkill,{
	skillID = 0,     %%选择技能ID
	castTime = 0,    %%技能施法时间
	waitTime = 0,    %%技能获取时间
	count = 0,       %%连续选择技能次数
	lastSkillID = 0, %%上次选择的技能
	targetType  = 0  %%技能选择目标类型
}).

-endif.