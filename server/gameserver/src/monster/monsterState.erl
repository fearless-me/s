%%
%% @author zhongyunawei
%% @doc @todo 怪物进程字典存取接口，此文件中的所有函数只能是怪物进程调用，其它进程不能调用.


-module(monsterState).
-author(zhongyuanwei).

-include("gsInc.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-compile(export_all).

-define(DictList,[
	absorb,
	bstState,
	actionStatus,
	afterCast,
	attackIntervalTime,
	attackSN,
	attackTargetCode,
	battleProp,
	bossSelSkillTime,
	buffList,
	callCarrier,
	callMonster,
	camp,
	carrierAttackList,
	casterInfo,
	curHp,
	curMp,
	curSelSkill,
	curUseSkill,
	curUseSkillEffect,
	exSkillAttackTargetCode,
	faceDir,
	facePos,
	firstAttackerCode,
	globalCDEndTime,
	groupID,
	guildID,
	hate,
	hitRestoreHp,
	id,
	isMapSleep,
	kingMarror,
	level,
	mapID,
	mapPid,
    monsterAreaID,
	mapPlayerEts,
	monsterAliveTime,
	monsterEts,
	move,
	moveCD,
	moveOverDist,
	moveStatus,
	moveTargetPos,
	moveType,
	name,
	ownSkill,
	petEts,
	petGlobalCD,
	petSkillCD,
	pos,
	skillCD,
	spawnInfo,
	startUseSkillTime,
	status,
	teamID,
	caller,
	timerSelTargetTime,
	triskill,
	type,
	hpstat,
	hourseStat,
	isConvoy,
	isInAttackRange,
	direction,
	fakeId,
	ringBuffList,
	magicAntiInjury,
	physicalAntiInjury
]).

%%删除指定Code的所有属性
-spec eraseProperty(Code) -> ok when Code::uint().
eraseProperty(Code) ->
	List = ?DictList,
	Fun = fun(Tag) ->
		erlang:erase({Tag,Code})
	end,
	lists:foreach(Fun, List).

%%=================================================
%%以下使用带Code的进程字典后面需要逐步改为上面的使用方式
%%=================================================
-spec setMapPid(Code::uint(), MapPid::pid()) -> pid() | undefined.
setMapPid(Code, MapPid) ->
	put({mapPid, Code}, MapPid).

-spec getMapPid(Code) -> pid() | undefined when
       Code::uint().
getMapPid(Code) ->
	get({mapPid, Code}).

-spec setMapID(Code::uint(), MapID::uint()) -> uint() | undefined.
setMapID(Code, MapID) ->
	put({mapID, Code}, MapID).

-spec getMapID(Code) -> uint() | undefined when
       Code::uint().
getMapID(Code) ->
	get({mapID, Code}).

%% 设置分组ID
-spec setGroupID(Code::uint(), GroupID::uint()) -> ok.
setGroupID(Code, GroupID) ->
	put({groupID, Code}, GroupID),
	ok.

-spec getGroupID(Code::uint()) -> uint() | undefined.
getGroupID(Code) ->
	get({groupID, Code}).

-spec getMapMonsterEts(Code) -> etsTab() | undefined when
       Code::uint().
getMapMonsterEts(Code) ->
	get({monsterEts, Code}).


-spec setMapMonsterEts(Code,Ets) -> ok when
	   Code::uint(),Ets::etsTab().
setMapMonsterEts(Code,Ets) ->
	put({monsterEts,Code}, Ets),
	ok.

-spec getMapPetEts(Code) -> etsTab() | undefined when
       Code::uint().
getMapPetEts(Code) ->
	get({petEts,Code}).

-spec setMapPetEts(Code,Ets) -> ok when
		  Code::uint(),Ets::etsTab().
setMapPetEts(Code,Ets) ->
	put({petEts,Code},Ets),
	ok.

% 获取玩家所在地图的所有玩家表
-spec getMapPlayerEts(Code) -> etsTab() | undefined when
       Code::uint().
getMapPlayerEts(Code) ->
	get({mapPlayerEts,Code}).

% 设置玩家所在地图的所有玩家表
-spec setMapPlayerEts(Code,PlayerEts) -> ok when
		  Code :: uint(),PlayerEts :: etsTab().
setMapPlayerEts(Code,PlayerEts) ->
	put({mapPlayerEts,Code},PlayerEts).

setMonsterAreaID(Code, AreaID) ->
    put({monsterAreaID, Code}, AreaID).

getMonsterAreaID(Code) ->
    get({monsterAreaID, Code}).

setCodeType(Code,Type) ->
	put({type,Code},Type),
	ok.

getCodeType(Code) ->
	get({type,Code}).

%%获取召唤物归宿信息
-spec getCasterInfo(Code) -> #recCasterInfo{} | undefined when
       Code :: uint().
getCasterInfo(Code) -> 
	get({casterInfo,Code}).

%%设置召唤物归宿code
-spec setCasterInfo(Code, CasterInfo) -> ok when
       Code :: uint(), CasterInfo :: #recCasterInfo{}.
setCasterInfo(Code, CasterInfo) ->
	put({casterInfo,Code}, CasterInfo),
	ok.

setIsConvoy(Code, Bool) ->
	put({isConvoy, Code}, Bool),
	ok.
getIsConvoy(Code) ->
	get({isConvoy, Code}).

%%获取怪物存活时间
-spec getMonsterAliveTime(Code) -> uint() | undefined when
	Code::uint().
getMonsterAliveTime(Code) ->
	get({monsterAliveTime,Code}).

%%设置怪物存活时间
-spec setMonsterAliveTime(Code,Time) -> ok when
	Code::uint(),Time::uint().
setMonsterAliveTime(Code,Time) ->
	put({monsterAliveTime,Code},Time),
	ok.

-spec deleteMonsterAliveTime(Code) -> ok when
	Code::uint().
deleteMonsterAliveTime(Code) ->
	erase({monsterAliveTime,Code}),
	ok.

%%获取怪物列表
-spec getMonsterList() -> list().
getMonsterList() ->
	case get(monsterList) of
		undefined ->
			[];
		List ->
			List
	end.

%%设置怪物列表
-spec setMonsterList(list()) -> ok.
setMonsterList(List) when erlang:is_list(List)->
	put(monsterList,List),
	ok.

%%获取回收怪物列表
-spec getDelMonster() -> list().
getDelMonster() ->
	case get(delMonster) of
		undefined ->
			[];
		List ->
			List
	end.

%%设置回收怪物列表
-spec setDelMonster(list()) -> ok.
setDelMonster(List) ->
	put(delMonster, List),
	ok.

-spec getLastTickTime() -> uint().
getLastTickTime() ->
	get(lastTickTime).

-spec setLastTickTime(TickTime) -> ok when
		  TickTime::uint().
setLastTickTime(TickTime) when erlang:is_integer(TickTime)->
	put(lastTickTime,TickTime),
	ok.

-spec getLastMoveTickTime() -> uint().
getLastMoveTickTime() ->
	get(getLastMoveTickTime).

-spec setLastMoveTickTime(TickTime) -> ok when
	TickTime::uint().
setLastMoveTickTime(TickTime) when erlang:is_integer(TickTime)->
	put(getLastMoveTickTime,TickTime),
	ok.

-spec getLastAIMoveTickTime() -> uint().
getLastAIMoveTickTime() ->
	get(getLastAIMoveTickTime).

-spec setLastAIMoveTickTime(TickTime) -> ok when
	TickTime::uint().
setLastAIMoveTickTime(TickTime) when erlang:is_integer(TickTime)->
	put(getLastAIMoveTickTime,TickTime),
	ok.

-spec getDeadMonsterList() -> list() | undefined.
getDeadMonsterList() ->
	get(deadMonsterList).

-spec setDeadMonsterList(List) -> ok when
		  List::list().
setDeadMonsterList(List) when erlang:is_list(List) ->
	put(deadMonsterList,List),
	ok.

-spec getId(Code) -> ID | undefined when
		  Code::uint(),ID::uint().
getId(Code) ->
	get({id,Code}).

-spec setId(Code,ID) -> ok when
		  Code::uint(),ID::uint().
setId(Code,ID) ->
	put({id,Code},ID),
	ok.

getId2(Code)->
	case getFakeId(Code) of
		undefined ->
			getId(Code);
		V ->
			V
	end.

-spec getFakeId(Code) -> ID | undefined when
	Code::uint(),ID::uint().
getFakeId(Code) ->
	get({fakeId,Code}).

-spec setFakeId(Code,ID) -> ok when
	Code::uint(),ID::uint().
setFakeId(Code,ID) ->
	put({fakeId,Code},ID),
	ok.

-spec getName(Code) -> Name when
		  Code::uint(), Name::string().
getName(Code) ->
	case get({name,Code}) of
		Name when erlang:is_list(Name) ->
			Name;
		_ErrorName ->
			""
	end.

-spec setName(Code,Name) -> ok when
		  Code::uint(),Name::string().
setName(Code,Name) ->
	put({name,Code},Name),
	ok.

-spec getCurHp(Code) -> uint() | undefined when 
		  Code::uint().
getCurHp(Code) ->
	get({curHp,Code}).

-spec setCurHp(Code,Hp) -> ok when
		  Code::uint(),Hp::number().	
setCurHp(Code,Hp) when erlang:is_float(Hp) ->
	put({curHp,Code},erlang:trunc(Hp)),
	ok;
setCurHp(Code,Hp) when erlang:is_integer(Hp)->
	MaxHp = erlang:trunc(monsterState:getBattlePropTotal(Code,?Prop_MaxHP)),
	CurHp = misc:clamp(Hp, 0, MaxHp),
	put({curHp,Code},CurHp),
	ok.

getMaxHp(Code)->
	MaxHp = monsterState:getBattlePropTotal(Code, ?Prop_MaxHP).

-spec getCurMp(Code) -> uint() | undefined when
		  Code::uint(). 
getCurMp(Code) ->
	get({curMp,Code}).

-spec setCurMp(Code,Mp) -> ok when
		  Code::uint(),Mp::number().
setCurMp(Code,Mp) when erlang:is_integer(Mp)->
	put({curMp,Code},Mp),
	ok;
setCurMp(Code,Mp) when erlang:is_float(Mp)->
	put({curMp,Code},erlang:trunc(Mp)),
	ok.

-spec getLevel(Code) -> uint() | undefined when
		  Code::uint(). 
getLevel(Code) ->
	get({level,Code}).

-spec setLevel(Code,Level) -> ok when
		  Code::uint(),Level::uint().
setLevel(Code,Level) ->
	put({level,Code},Level),
	ok.

%%获取动作状态
-spec getActionStatus(Code) -> int() | undefined  when
		  Code::uint().
getActionStatus(Code) ->
	get({actionStatus,Code}).

%%设置动作状态，比如站立，移动，死亡，拾取等等不由技能
-spec setActionStatus(Code,ActionStatus) -> ok when
		  Code::uint(),ActionStatus::uint().
setActionStatus(Code,ActionStatus) when ActionStatus > 0 andalso ActionStatus =< ?CreatureActionStatusMax ->
	put({actionStatus,Code},ActionStatus),
	ok.

%%获取指定Code的怪物的状态
-spec getStatus(Code) -> uint() when
		  Code::uint().
getStatus(Code) -> 
	case get({status, Code}) of
		undefined ->
			0;
		Status ->
			Status
	end.

%%设置指定Code的怪物的状态
-spec setStatus(Code,Value) -> ok when
		  Code::uint(),Value::uint().
setStatus(Code,Value) -> 
	put({status,Code},Value),
	ok.

%%添加指定Code的怪物的指定状态
-spec addStatus(Code,Status) -> ok when
		  Code::uint(),Status::uint().
addStatus(Code,Status) ->
	OldStatus = getStatus(Code),
	NewStatus = OldStatus bor Status,
	put({status, Code}, NewStatus),
	ok.

-spec clearStatus(Code,Status) -> ok when
          Code::uint(),Status::uint().
%%清除指定Code的怪物的指定状态
clearStatus(Code,Status) ->
	OldStatus = getStatus(Code),
	NewStatus = OldStatus band (bnot Status),
	put({status, Code}, NewStatus),
    ok.

%%重置指定Code的怪物的状态
-spec resetStatus(Code) -> ok when
		  Code::uint().
resetStatus(Code) ->
	put({status,Code},0),
	ok.	

%%获取指定Code的怪物的战斗属性，需要注意的是，修改了battleProp中的Base，Add以及PC值后，需要修改Mod标记
%%最好使用battleProp.erl中的相应函数去修改上述值，而不要手动修改，以免忘记修改Mod标记
-spec getBattleProp(Code) -> BattlePropList when
		  Code::uint(),BattlePropList::[#battleProp{},...].
getBattleProp(Code) ->
	case get({battleProp, Code}) of
		undefined ->
			[#battleProp{}];
		BattlePropList ->
			BattlePropList
	end.


%%设置指定Code的怪物的战斗属性，需要注意的是，修改了battleProp中的Base，Add以及PC值后，需要修改Mod标记
%%最好使用battleProp.erl中的相应函数去修改上述值，而不要手动修改，以免忘记修改Mod标记
-spec setBattleProp(Code, BattlePropList) -> ok when
		  Code ::uint(), BattlePropList:: [#battleProp{},...] | [].
setBattleProp(Code, BattlePropList) ->
	put({battleProp, Code},BattlePropList).

-spec getBattlePropTotal(Code,Prop) -> float() when
		  Code::uint(),Prop::battle_prop().
getBattlePropTotal(Code,Prop) ->
	BattlePropList = getBattleProp(Code),
	battleProp:getBattlePropTotalValue(BattlePropList, Prop).

%%获取仇恨值
-spec getHateList(Code) -> list() when
		  Code::uint().
getHateList(Code) ->
	case get({hate,Code}) of
		undefined ->
			[];
		List ->
			List
	end.

%%设置仇恨值
-spec setHateList(Code,HateList) -> ok when
		  Code::uint(),HateList::list().
setHateList(Code,HateList) ->
	put({hate,Code},HateList),
	ok.

%%获取攻击回血技能信息
-spec getHitRestoreHp(Code) -> {SkillID,SN} | undefined when 
		  Code::uint(),SkillID::uint(),SN::uint().
getHitRestoreHp(Code) ->
	get({hitRestoreHp,Code}).

%%设置攻击回血技能信息
-spec setHitRestoreHp(Code,{SkillID,SN}) -> ok  when
		  Code::uint(),SkillID::uint(),SN::uint().
setHitRestoreHp(Code,{SkillID,SN} = Info) when SkillID >= 0 andalso SN >= 0 ->
	put({hitRestoreHp,Code},Info),
	ok.

-spec getFirstAttacker(Code) -> uint() when
		  Code::uint().
getFirstAttacker(Code) ->
	case get({firstAttackerCode, Code}) of
		undefined ->
			0;
		AttackerCode ->
			AttackerCode
	end.

-spec setFirstAttacker(Code, AttackerCode) -> ok  when
		  Code :: uint(), 
		  AttackerCode :: uint() | undefined.
setFirstAttacker(Code, AttackerCode) ->
	put({firstAttackerCode,Code},AttackerCode),
	ok.	

%%获取怪物位置
-spec getMonsterPos(Code) -> {X,Y} | undefined when
		  Code::uint(),X::float(),Y::float().
getMonsterPos(Code) ->
	get({pos,Code}).

%%设置怪物位置
-spec setMonsterPos(Code,X,Y) -> ok when
		  Code::uint(),X :: number(),Y::number().
setMonsterPos(Code,X,Y) when is_float(X) andalso is_float(Y) ->
	put({pos,Code},{X,Y}),
	ok;
setMonsterPos(Code, X, Y) ->
	put({pos,Code},{float(X), float(Y)}),
	ok.

%%获取怪物的出生信息
-spec getSpawnInfo(Code) -> #recSpawnMonster{} | #recSpawnPet{} | undefined when
		  Code::uint().
getSpawnInfo(Code) ->
	get({spawnInfo,Code}).

%%设置怪物的出生信息
-spec setSpawnInfo(Code,SpawnArg) -> ok when
		  Code::uint(),
          SpawnArg::#recSpawnMonster{} | #recSpawnPet{}.
setSpawnInfo(Code,#recSpawnMonster{} = SpawnArg) ->
	put({spawnInfo,Code},SpawnArg),
	ok;
setSpawnInfo(Code,#recSpawnPet{} = SpawnArg) ->
	put({spawnInfo,Code},SpawnArg),
	ok.

%%获取怪物位置
-spec getMonsterSpawnPos(Code) -> {X,Y} | undefined  when
		  Code::uint(),X::number(),Y::number().
getMonsterSpawnPos(Code) ->
	Arg = getSpawnInfo(Code),
	case Arg of
		#recSpawnMonster{} ->
			{Arg#recSpawnMonster.x,Arg#recSpawnMonster.y};
		_ ->
			undefined
	end.

	
%%获取怪物的移动速度
-spec getMoveSpeed(Code) -> float() when
		  Code::uint().
getMoveSpeed(Code) ->
    monsterState:getBattlePropTotal(Code,?Prop_MoveSpeed).

%%设置怪物移动
-spec setMoveSpeed(Code,Speed) -> ok when
		  Code::uint(),Speed::float().
setMoveSpeed(Code,Speed) ->
	OldMoveSpeed = monsterState:getMoveSpeed(Code),

	BattleProp = getBattleProp(Code),
	BP = battleProp:setBattlePropBaseValue(BattleProp, [{?Prop_MoveSpeed,Speed}]),
	BP1 = battleProp:calcCharBattleProp(BP),
	setBattleProp(Code,BP1),

	NewMoveSpeed = monsterState:getMoveSpeed(Code),
	case OldMoveSpeed =/= NewMoveSpeed of
		true ->
			%%最后通知客户端
			monsterMove:notifyMonsterSpeedToClient(Code);
		_ ->
			skip
	end,
	ok.


%%设置怪物的移动状态（走，跑）
setMoveStatus(Code,Status) ->
	put({moveStatus,Code},Status).

%%获取怪物的移动状态（走，跑）
getMoveStatus(Code) ->
	get({moveStatus,Code}).

%%获取怪物移动目标位置
-spec getMoveTarget(Code) -> {X,Y} | undefined when
		  Code::uint(),X::number(),Y::number().
getMoveTarget(Code) ->
	get({moveTargetPos,Code}).

%%设置怪物移动目标位置
-spec setMoveTarget(Code,X,Y) -> ok when
		  Code::uint(),X::number(),Y::number().
setMoveTarget(Code,X,Y) when erlang:is_number(X),erlang:is_number(Y)->
	put({moveTargetPos,Code},{X,Y}),
	ok.

%%设置怪物的移动路径
setMoveTargetList(Code,List) ->
	put({moveTargetList,Code},List),
	ok.

%%获取怪物的移动路径，注意这里不能统一返回一个列表，需要undefine为判定
getMoveTargetList(Code) ->
	get({moveTargetList,Code}).

%%获取怪物移动方式
-spec getMoveType(Code) -> uint() when
		  Code::uint().
getMoveType(Code) ->
	get({moveType, Code}).

isInAttackRange(Code)->
	case get({isInAttackRange,Code}) of
		undefined ->
			false;
		V ->
			V
	end.

setInAttackRange(Code, Bool)->
	put({isInAttackRange,Code},Bool).

%%设置怪物移动方式
-spec setMoveType(Code, MoveType) -> ok when
		  Code :: uint(),
		  MoveType :: uint().
setMoveType(Code, MoveType) ->
	put({moveType, Code}, MoveType),
	ok.

%%获取载体攻击列表
-spec getCarrierAttackList(Code) -> list() when
		  Code :: uint().
getCarrierAttackList(Code) ->
	case get({carrierAttackList, Code}) of
		undefined ->
			[];
		List ->
			List
	end.

%%设置载体攻击列表
-spec setCarrierAttackList(Code, List) -> ok when
		  Code :: uint(),
		  List :: list().
setCarrierAttackList(Code, List) ->
	put({carrierAttackList, Code}, List),
	ok.

%%获取上次移动超过的距离
getMoveOverDist(Code) ->
	get({moveOverDist,Code}).

%%设置移动超过的距离
setMoveOverDist(Code,Dist) ->
	put({moveOverDist,Code},Dist).

%%获取怪物的攻击目标Code
-spec getAttackTarget(Code) -> uint() | undefined when
		  Code::uint().
getAttackTarget(Code) ->
	get({attackTargetCode,Code}).

%%设置怪物的攻击目标Code
-spec setAttackTarget(Code,TargetCode) -> OldTargetCode::uint()| undefined when
		  Code::uint(),TargetCode::uint() | undefined.
setAttackTarget(Code,TargetCode) ->
%%	case getId(Code) >= 8300 andalso  getId(Code) < 8302 of
%%		true ->
%%			?DEBUG_OUT("@@@@@@@@@@@@@@@@@@@@@@@@@@ setAttackTarget(~w,~w -> ~w,~w,~p)",
%%				[ getId(Code),monsterState:getAttackTarget(Code), TargetCode,monsterState:getHateList(Code),misc:getStackTrace()]);
%%		_ -> skip
%%	end,
	put({attackTargetCode,Code},TargetCode).

%%获取怪物额外技能重置的攻击目标Code
-spec getExSkillAttackTarget(Code) -> uint() | undefined when
		  Code::uint().
getExSkillAttackTarget(Code) ->
	get({exSkillAttackTargetCode,Code}).

%%设置怪物额外技能重置的攻击目标Code
-spec setExSkillAttackTarget(Code,TargetCode) -> ok when
		  Code::uint(),TargetCode::uint() | undefined.
setExSkillAttackTarget(Code,TargetCode) ->
	put({exSkillAttackTargetCode,Code},TargetCode),
	ok.

%%获取怪物的当前选择的技能信息
-spec getSelSkill(Code) -> #selSkill{} when
		Code::uint().
getSelSkill(Code) ->
	get({curSelSkill,Code}).

%%设置怪物的当前选择的技能信息
-spec setSelSkill(Code::uint(),SkillInfo::#selSkill{}) -> ok.
setSelSkill(Code,SkillInfo) ->
	put({curSelSkill,Code},SkillInfo),
	ok.

%%获取角色当前使用技能效果作用次数
-spec getCurUseSkillEffect(Code) -> Val | undefined when 
       Code :: uint(),  
       Val :: list().
getCurUseSkillEffect(Code) ->
	get({curUseSkillEffect,Code}).

%%设置角色当前使用技能效果作用次数
-spec setCurUseSkillEffect(Code,SkillEffectList) -> OldVal | undefined when 
                   Code :: uint(), SkillEffectList :: list(), OldVal :: list().
setCurUseSkillEffect(Code,SkillEffectList) ->
	put({curUseSkillEffect,Code}, SkillEffectList).

%%设置技能
-spec setMonsterSkill(Code, SkillList) -> ok when
	   Code :: uint(), SkillList :: list().
setMonsterSkill(Code, SkillList) ->
	put({ownSkill, Code}, SkillList),
	ok.

-spec getMonsterSkill(Code) -> list() when
	   Code :: uint().
getMonsterSkill(Code) ->
	case get({ownSkill, Code}) of
		undefined ->
			[];
		List ->
			List
	end.

%获取本次触发技能
-spec getTriggerSkill(Code) -> list() when 
		  Code :: uint().
getTriggerSkill(Code) ->
    case get({triskill, Code}) of
		undefined ->
			[];
        List ->
			List
	end.

%设置本次触发技能
-spec setTriggerSkill(Code, SkillList) -> list() when
        Code :: uint(),
        SkillList :: list().
setTriggerSkill(Code, SkillList) when erlang:is_list(SkillList) ->
	put({triskill, Code}, SkillList).

%%获取开始使用技能的时间
-spec getStartUseSkillTime(Code) -> uint() | undefined when
		  Code::uint().
getStartUseSkillTime(Code) ->
	get({startUseSkillTime,Code}).

%%设置开始使用技能的时间
-spec setStartUseSkillTime(Code,Time) -> OldVal | undefined when
		  Code::uint(),Time::uint(),OldVal::uint().
setStartUseSkillTime(Code,Time) when erlang:is_integer(Time)->
	put({startUseSkillTime,Code},Time).

setDirection(Code, Dir) ->
	put({direction,Code},Dir).

getDirection(Code) ->
	case get({direction,Code}) of
		V when is_float(V)->
			V;
		_ ->
			float(0.0)
	end.

%%获取角色的面部朝向
-spec getFaceDir(Code) -> {DirX,DirY} when
		  Code::uint(),DirX::float(),DirY::float().
getFaceDir(Code) ->
	get({faceDir,Code}).

%%设置角色的面部朝向
-spec setFaceDir(Code,DirX,DirY) -> OldVal | undefined when
		  Code::uint(),OldVal::{DirX,DirY},DirX::float(),DirY::float().
setFaceDir(Code,DirX,DirY) ->
	case DirX =:= 0 andalso DirY =:= 0 of
		true ->
			?ERROR_OUT("Error Face Dir[~p,~p] Value",[DirX,DirY]),
			throw("Error Face Dir");
		_ ->
			skip
	end,
	put({faceDir,Code},{DirX,DirY}).

getMonsterSkillCDList(Code) ->
	case get({skillCD, Code}) of
		undefined ->
			[];
		L ->
			L
	end.

setMonsterSkillCDList(Code, List) ->
	put({skillCD, Code}, List),
	ok.

%%获取攻击间隔时间
-spec getAttackIntervalTime(Code) -> uint() when
	Code::uint().
getAttackIntervalTime(Code) ->
	case get({attackIntervalTime,Code}) of
		undefined ->
			?DefaultAttackInternalTime; %%默认情况下为1000毫秒
		Time ->
			Time
	end.

%%设置攻击间隔时间，只有在更改了武器的情况下才会更新，默认情况下为1000毫秒
setAttackIntervalTime(Code,Time) when erlang:is_integer(Time) andalso Time > 0 ->
	put({attackIntervalTime,Code},Time);
setAttackIntervalTime(Code,_) ->
	put({attackIntervalTime,Code},?DefaultAttackInternalTime).

%%获取最终攻击间隔时间
-spec getFinalAttackIntervalTime(Code) -> float() when
		  Code::uint().
getFinalAttackIntervalTime(Code) ->
	BattlePropList = getBattleProp(Code),
	AttackSpeed = 0, %% battleProp:getBattlePropTotalValue(BattlePropList,?Prop_attackspeed),
	AIT0 = getAttackIntervalTime(Code),
	AIT = AIT0 / (1 + AttackSpeed),
	%%?DEBUG_OUT("Monster[~p] AIT[~f]",[Code,AIT]),
	AIT.

%%设置攻击公共CD的结束时间
-spec setGlobalCDEndTime(Code,Time) -> ok when
	Code::uint(),Time::uint().
setGlobalCDEndTime(Code,Time) ->
	put({globalCDEndTime,Code},Time),
	ok.

%%获取攻击公共CD的结束时间
-spec getGlobalCDEndTime(Code) -> uint() | undefined when
	Code::uint().
getGlobalCDEndTime(Code) ->
	get({globalCDEndTime,Code}).

% 获取当前使用技能
-spec getCurUseSkill(Code) -> Val | undefined when 
        Val :: #recCurUseSkill{}, Code :: uint().
getCurUseSkill(Code) ->
	get({curUseSkill, Code}).

% 设置当前使用技能
-spec setCurUseSkill(Code, #recCurUseSkill{} | undefined) -> ok when
	   Code :: uint().
setCurUseSkill(Code, #recCurUseSkill{} = CurUseSkill) when CurUseSkill#recCurUseSkill.skillID >= 0 ->
	put({curUseSkill, Code}, CurUseSkill),
	ok;
setCurUseSkill(Code,undefined) ->
	erase({curUseSkill, Code}),
	ok.

%%获取BUFF字典
-spec getBuffList(Code) -> list() when  Code::uint().
getBuffList(Code) ->
	case get({buffList,Code}) of
		undefined ->
			[];
		List ->
			List
	end.


getRingBuffIDList(Code)->
	case get({ringBuffList, Code}) of
		undefined ->
			[];
		L ->
			L
	end.

setRingBuffIDList(Code,L)->
	put({ringBuffList, Code}, L).

%%设置BUFF字典
-spec setBuffList(Code,List) -> ok when
		  Code   :: uint(),
          List   :: list().
setBuffList(Code, List) ->
	put({buffList,Code},List),
	ok.

%%设置攻击序号
-spec setAttackSN(Code::uint(), SN::uint()) -> ok.
setAttackSN(Code, SN) when erlang:is_integer(SN)->
	put({attackSN, Code},SN),
	ok.

%%获取攻击序号
-spec getAttackSN(Code::uint()) -> uint().
getAttackSN(Code) ->
	get({attackSN, Code}).

%%是否处于睡眠状态
-spec isCreatureSleep(Code) -> boolean() when
	Code::uint().
isCreatureSleep(Code) ->
	case get({isMapSleep,Code}) of
		undefined ->
			false;
		Bool ->
			Bool
	end.

%%设置处于睡眠状态
-spec setCreatureSleep(Code,IsSleep) -> ok when
	Code::uint(),IsSleep::boolean().
setCreatureSleep(Code,IsSleep) when erlang:is_boolean(IsSleep) ->
	put({isMapSleep,Code},IsSleep),
	ok.

%%获取当前吸收盾值
-spec getAbsorbShield(Code) -> number() when
         Code :: uint().
getAbsorbShield(Code) ->
	case get({absorb, Code}) of
		undefined ->
			0;
		Value ->
			Value
	end.

%%设置当前吸收盾
-spec setAbsorbShield(Code, Value) -> ok when
		  Code :: uint(),
		  Value :: number().
setAbsorbShield(Code, Value) ->
	put({absorb, Code}, Value).

%%
setMagicAntiInjury(Code, Percent)->
	put({magicAntiInjury, Code}, Percent).

getMagicAntiInjury(Code)->
	case get({magicAntiInjury, Code}) of
		undefined ->
			0;
		V ->
			V
	end.

setPhysicalAntiInjury(Code, Percent)->
	put({physicalAntiInjury, Code}, Percent).

getPhysicalAntiInjury(Code)->
	case get({physicalAntiInjury, Code}) of
		undefined ->
			0;
		V ->
			V
	end.

%%获取当前阵营关系
-spec setCamp(Code, Camp) -> ok when
		  Code :: uint(),
          Camp :: uint().
setCamp(Code, Camp) ->
	put({camp, Code}, Camp),
	ok.

%%设置当前阵营关系
-spec getCamp(Code) -> uint() when
		  Code :: uint().
getCamp(Code) ->
	case get({camp, Code}) of
		undefined ->
			0;
		Value ->
			Value
	end.

%%设置召唤怪物归宿主人
-spec setCaller(Code::uint(), CasterCode::uint()) -> ok.
setCaller(Code, CasterCode) ->
	put({caller, Code}, CasterCode).

%%获取召唤怪物归宿主人
-spec getCaller(Code::uint()) -> ok.
getCaller(Code) ->
	case get({caller, Code}) of
		undefined ->
			0;
		CasterCode ->
			CasterCode
	end.

%%设置当前所属于公会
-spec setGuildID(Code, GuildID) -> ok when
		  Code :: uint(),
          GuildID :: uint().
setGuildID(Code, GuildID) ->
	put({guildID, Code}, GuildID),
	ok.

%%获取当前所属公会
-spec getGuildID(Code) -> uint() when
		  Code :: uint().
getGuildID(Code) ->
	case get({guildID, Code}) of
		undefined ->
			0;
		Value ->
			Value
	end.

%%获取当前队伍信息
-spec getTeamInfo(Code) -> #rec_team{} | undefined when
		  Code :: uint().
getTeamInfo(Code) ->
	TeamID = getTeamID(Code),
	case TeamID =:= 0 of
		true ->
			undefined;
		_ ->
			teamInterface:getTeamInfoWithTeamID(TeamID)
%%			team2:getTeamInfoByTeamID(TeamID)
	end.

%%获取当前队伍信息ID
-spec getTeamID(Code) -> uint() when
		  Code :: uint().
getTeamID(Code) ->
	case get({teamID, Code}) of
		undefined ->
			0;
		TeamID ->
			TeamID
	end.

%%设置当前队伍信息ID
-spec setTeamID(Code, TeamID) -> uint() when
		  Code :: uint(),
          TeamID :: uint().
setTeamID(Code, TeamID) ->
	put({teamID, Code}, TeamID).

%%获取当前召唤的载体
-spec getCallCarrierList(Code) -> list() when 
		  Code :: uint().
getCallCarrierList(Code) ->
	case get({callCarrier, Code}) of
		undefined ->
			[];
		List ->
			List
	end.

%%设置当前召唤的载体
-spec setCallCarrierList(Code, List) -> ok when
		  Code :: uint(),
		  List :: list().
setCallCarrierList(Code, List) ->
	put({callCarrier, Code}, List),
	ok.

%%获取当前召唤的怪物
-spec getCallMonsterList(Code) -> list() when
           Code :: uint().
getCallMonsterList(Code) ->
	case get({callMonster, Code}) of
		undefined ->
			[];
		List ->
			List
	end.

%%设置当前召唤的怪物
-spec setCallMonsterList(Code, List) -> ok when
		  Code :: uint(),
		  List :: list().
setCallMonsterList(Code, List) ->
	put({callMonster, Code}, List),
	ok.

%%获取定时选择目标时间
-spec getTimerSelTargetTime(Code) -> uint() | undefined when
		  Code :: uint().
getTimerSelTargetTime(Code) ->
	get({timerSelTargetTime, Code}).

%%定时选择目标时间
-spec setTimerSelTargetTime(Code, Time) -> ok when
          Code :: uint(),
          Time :: uint() | undefined.
setTimerSelTargetTime(Code, Time) ->
	put({timerSelTargetTime, Code}, Time),
	ok.

%%获取boss下次选择技能时间
-spec getBossSelSkillTime(Code) -> uint() when
          Code :: uint().
getBossSelSkillTime(Code) ->
	case get({bossSelSkillTime, Code}) of
		undefined ->
			0;
		Time ->
			Time
	end.

%%设置boss下次释放技能时间
-spec setBossSelSkillTime(Code, Time) -> ok when
		  Code :: uint(),
          Time :: uint() | undefined.
setBossSelSkillTime(Code, Time) ->
	put({bossSelSkillTime, Code}, Time),
	ok.

%%删除指定Code为相关Key的所有进程字典
-spec eraseAllProcessDict(CodeList) -> ok when CodeList::list().
eraseAllProcessDict(CodeList) when erlang:is_list(CodeList)->
	List = ?DictList,
	Fun = fun(Tag,Code) ->
		erlang:erase({Tag,Code}),
		Code
	end,
	F = fun(Code) ->
		lists:foldl(Fun, Code, List)
	end,
	lists:foreach(F,CodeList).

%%获取Boss朝向
-spec getBossFacePos(Code) -> {X, Y} when
		  Code::uint(),
          X::float(),
          Y::float().
getBossFacePos(Code) ->
	get({facePos,Code}).

%%设置怪物位置
-spec setBossFacePos(Code,X,Y) -> ok when
		  Code::uint(),X :: number(),Y::number().
setBossFacePos(Code,X,Y) when is_float(X) andalso is_float(Y) ->
	put({facePos,Code},{X,Y}),
	ok;
setBossFacePos(Code, X, Y) ->
	put({facePos,Code},{float(X), float(Y)}),
	ok. 

%%设置施法动作时间
-spec setAfterCastTime(Code, Time) -> ok when
		  Code :: uint(),
          Time :: uint().
setAfterCastTime(Code, Time) ->
	put({afterCast, Code}, Time),
	ok.

%%获取施法动作时间
-spec getAfterCastTime(Code) -> uint() | undefined when
		  Code :: uint().
getAfterCastTime(Code) ->
	get({afterCast, Code}).

%%设置宠物公共CD
-spec setPetGlobalCD(Code::uint(), Time::number()) -> ok.
setPetGlobalCD(Code, Time) ->
	put({petGlobalCD, Code}, Time),
	ok.

%%获取宠物公共CD
-spec getPetGlobalCD(Code::uint()) -> number().
getPetGlobalCD(Code) ->
	case get({petGlobalCD, Code}) of
		undefined ->
			0;
		Time ->
			Time
	end.

%%设置宠物技能CD
-spec setPetSkillCD(Code::uint(), List::list()) -> ok.
setPetSkillCD(Code, List) ->
	put({petSkillCD, Code}, List),
	ok.

%%获取宠物公共CD
-spec getPetSkillCD(Code::uint()) -> list().
getPetSkillCD(Code) ->
	case get({petSkillCD, Code}) of
		undefined ->
			[];
		List ->
			List
	end.

%%记录攻击怪物的attackerID
-spec setAttackerID4Marror(Code::uint(),AttackerID::uint64()) ->term().
setAttackerID4Marror(Code,AttackerID) ->
	A = getAttackerID4Marror(Code),
	case lists:member(AttackerID, A) of
		true ->
			skip;
		false ->
			put({kingMarror,Code},[AttackerID|A])
	end.

-spec getAttackerID4Marror(Code::uint()) ->[uint64()].
getAttackerID4Marror(Code) ->
	case get({kingMarror,Code}) of
		undefined ->
			[];
		List ->
			List
	end.

%% 怪物世界等级设置
-spec setMonsterWorldLevel(Code :: uint(), Level :: uint()) -> ok.
setMonsterWorldLevel(Code, Level) ->
    put({monsterWorldLevel, Code}, Level),
    ok.

-spec getMonsterWorldLevel(Code :: uint()) -> uint()|undefined.
getMonsterWorldLevel(Code) ->
    case get({monsterWorldLevel,Code}) of
        undefined ->
            undefined;
        Val ->
            Val
    end.


%%设置怪物水晶血量统计
-spec setMonsterHpStat(Code::uint(), Tuple::tuple()) -> ok.
setMonsterHpStat(Code, Tuple) ->
	put({hpStat, Code}, Tuple),
	ok.

%%获取怪物水晶血量统计
-spec getMonsterHpStat(Code::uint()) -> {uint(), uint()}.
getMonsterHpStat(Code) ->
	case get({hpStat, Code}) of
		undefined ->
			{0, 0};
		Tuple ->
			Tuple
	end.

-spec setHourseHpStat(Code::uint(), Hp::uint()) -> ok.
setHourseHpStat(Code, Hp) ->
	put({hourseStat, Code}, Hp),
	ok.

%%获取马车水晶血量统计
-spec getHourseHpStat(Code::uint()) -> uint().
getHourseHpStat(Code) ->
	case get({hourseStat, Code}) of
		undefined ->
			0;
		Hp ->
			Hp
	end.
%% ====================================================================
%% Internal functions
%% ====================================================================

