%%
%% @author luowei
%% @doc @todo Add description to monsterBuff.


-module(monsterBuff).
-author(luowei).

-include("gsInc.hrl").
-include("bst.hrl").


%% ====================================================================
%% API functions
%% ====================================================================
-export([
	clearRingBuffFromOther/1,
	addRingBuff/1,
	addBuff/3,
	tickBuff/2,
	delBuff/1,
	delBuff/2,
	delBuff/3,
	delNoRepeatBuff/2,
	addNoRepeatBuff/3,
	delBuffByState/2,
	getBuffByEffect/2,
	getBuffInfoList/1,
	syncBuffToEts/1
]).


%%添加buff
-spec addBuff(MonsterCode :: uint(), BuffID :: uint(), Arg :: uint() | #recBuffInfo{} | #recSkillEffect{}) -> ok.
addBuff(MonsterCode, BuffID, _RecEffect) when BuffID < 1 ->
	?ERROR_OUT("addBuff:~p,~p,~p", [MonsterCode, BuffID, misc:getStackTrace()]),
	ok;
addBuff(MonsterCode, BuffID, #recSkillEffect{attackerProp = BattleProp} = RecEffect) ->
	case checkBuff(MonsterCode, BuffID) of
		true ->
			case isAddBuff(MonsterCode, BuffID, BattleProp) of
				true ->
					BuffData = buff:initBuffData(BuffID, RecEffect),
					addBuff(MonsterCode, BuffID, BuffData);
				_ ->
					skip
			end;
		_ ->
			skip
	end;
addBuff(MonsterCode, BuffID, #recBuffInfo{} = BuffData) ->
	BuffList = monsterState:getBuffList(MonsterCode),
	case lists:keymember(BuffID, #recBuff.buffID, BuffList) of
		true ->
			NewBuffList = sameBuffRule(MonsterCode, BuffData, BuffList);
		false ->
			NewBuffList = diffBuffRule(MonsterCode, BuffData, BuffList)
	end,
	?DEBUG_OUT("addbuff id=~p, level =~p#", [BuffData#recBuffInfo.buffID, BuffData#recBuffInfo.level]),
	monsterState:setBuffList(MonsterCode, NewBuffList);
addBuff(MonsterCode, BuffID, Level) ->
	case checkBuff(MonsterCode, BuffID) of
		true ->
			BuffCfg = getCfg:getCfgPStack(cfg_buff, BuffID),
			Factor = monsterState:getBattlePropTotal(MonsterCode, BuffCfg#buffCfg.durationFactor),
			EndTime = buff:calcBuffEndTime(Level, Factor, BuffCfg),
			BuffData = initBuffData(MonsterCode, BuffID, Level, 0, trunc(EndTime)),
			addBuff(MonsterCode, BuffID, BuffData);
		_ ->
			skip
	end.


addBuffWithCasterCode(MonsterCode, BuffID, Level, {CasterCode, CasterPid, CasterName}) ->
	case checkBuff(MonsterCode, BuffID) of
		true ->
			BuffCfg = getCfg:getCfgPStack(cfg_buff, BuffID),
			Factor = monsterState:getBattlePropTotal(MonsterCode, BuffCfg#buffCfg.durationFactor),
			EndTime = buff:calcBuffEndTime(Level, Factor, BuffCfg),
			BuffData = initBuffData(MonsterCode, BuffID, Level, 0, trunc(EndTime)),
			NewBuffData = BuffData#recBuffInfo{
				attackerCode = CasterCode,
				attackerPid = CasterPid,
				attackerName = CasterName
			},
			addBuff(MonsterCode, BuffID, NewBuffData);
		_ ->
			skip
	end.

%%添加无重复buff
-spec addNoRepeatBuff(MonsterCode, BuffID, Level) -> ok when
	MonsterCode :: uint(),
	BuffID :: uint(),
	Level :: uint().
addNoRepeatBuff(MonsterCode, BuffID, Level) ->
	case isExist(MonsterCode, BuffID) of
		true ->
			ok;
		_ ->
			addBuff(MonsterCode, BuffID, Level)
	end.

%%更新BUFF
-spec tickBuff(MonsterCode, Now) -> ok when
	MonsterCode :: uint(),
	Now :: uint().
tickBuff(MonsterCode, Now) ->
	BuffList = monsterState:getBuffList(MonsterCode),
	Fun =
		fun(Buff) ->
			tickOneBuff(MonsterCode, Now, Buff)
		end,
	lists:foreach(Fun, BuffList),
	tickCheckRingBuff(MonsterCode, monsterState:getRingBuffIDList(MonsterCode)).

%%根据buff特定状态删除(并且为可移buff)
-spec delBuffByState(MonsterCode, State) -> ok when
	MonsterCode :: uint(),
	State :: uint().
delBuffByState(MonsterCode, State) ->
	BuffList = monsterState:getBuffList(MonsterCode),
	Fun = fun(#recBuff{effect = Effect, remove = IsMove} = Buff, List) ->
		case State =:= Effect andalso IsMove =:= 1 of
			true ->
				deleteOneBuff(MonsterCode, Buff, List);
			_ ->
				List
		end
	      end,
	NewBuffList = lists:foldl(Fun, BuffList, BuffList),
	monsterState:setBuffList(MonsterCode, NewBuffList),
	ok.

%%死亡移除buff
-spec delBuff(MonsterCode) -> ok when
	MonsterCode :: uint().
delBuff(MonsterCode) ->
	BuffList = monsterState:getBuffList(MonsterCode),
	Fun = fun(#recBuff{buffID = ID} = Buff, Acc) ->
		#buffCfg{
			buffDeathdel = IsDeathDel
		} = getCfg:getCfgPStack(cfg_buff, ID),
		case IsDeathDel of
			?BuffRemove_Dead ->
				deleteOneBuff(MonsterCode, Buff, Acc);
			_ ->
				Acc
		end
	      end,
	NewBuffList = lists:foldl(Fun, BuffList, BuffList),
	monsterState:setBuffList(MonsterCode, NewBuffList).

%%根据buffID移除
-spec delBuff(MonsterCode, BuffID) -> ok when
	MonsterCode :: uint(),
	BuffID :: uint().
delBuff(MonsterCode, BuffID) ->
	BuffList = monsterState:getBuffList(MonsterCode),
	Fun = fun(#recBuff{buffID = ID} = Buff, List) ->
		case ID =:= BuffID of
			true ->
				deleteOneBuff(MonsterCode, Buff, List);
			_ ->
				List
		end
	      end,
	NewBuffList = lists:foldl(Fun, BuffList, BuffList),
	monsterState:setBuffList(MonsterCode, NewBuffList),
	ok.

%%删除无重复buff
-spec delNoRepeatBuff(MonsterCode, BuffID) -> ok when
	MonsterCode :: uint(),
	BuffID :: uint().
delNoRepeatBuff(MonsterCode, BuffID) ->
	case isExist(MonsterCode, BuffID) of
		true ->
			delBuff(MonsterCode, BuffID);
		_ ->
			ok
	end.

%%根据buff类型移除(并且为可移buff)
-spec delBuff(MonsterCode, Type, Num) -> ok when
	MonsterCode :: uint(),
	Type :: uint(),
	Num :: uint().
delBuff(MonsterCode, Type, Num) ->
	BuffList = monsterState:getBuffList(MonsterCode),
	RemoveList = getBuffByType(Type, BuffList),
	if
		Num =:= 0 orelse Num >= length(RemoveList) ->
			removeBuffList(MonsterCode, RemoveList);
		Num < length(RemoveList) ->
			NewBuffList = lists:sublist(RemoveList, Num),
			removeBuffList(MonsterCode, NewBuffList);
		true ->
			skip
	end.

%%获取buff信息
-spec getBuffInfoList(MonsterCode) -> list() when
	MonsterCode :: uint().
getBuffInfoList(MonsterCode) ->
	BuffList = monsterState:getBuffList(MonsterCode),
	Fun = fun(#recBuff{
		buffID = BuffID,
		counter = BuffUID,
		endTime = EndTime
	}, Acc) ->
		Now = time:getUTCNowMS(),
		case EndTime - Now > 0 of
			true ->
				Time = EndTime - Now;
			_ ->
				Time = 0
		end,
		[#pk_BuffBaseInfo{
			time = Time,
			buffID = BuffID,
			buffUID = BuffUID
		} | Acc]
	      end,
	lists:foldl(Fun, [], BuffList).

%%获取buff根据效果类型
-spec getBuffByEffect(MonsterCode, Effect) -> list() when
	MonsterCode :: uint(),
	Effect :: uint().
getBuffByEffect(MonsterCode, Effect) ->
	BuffList = monsterState:getBuffList(MonsterCode),
	Fun = fun(#recBuff{effect = Eff} = Buff, Acc) ->
		case Eff =:= Effect of
			true ->
				[Buff | Acc];
			_ ->
				Acc
		end
	      end,
	lists:foldl(Fun, [], BuffList).

%%同步buff数据到地图ets表中
-spec syncBuffToEts(Code) -> boolean() when
	Code :: uint().
syncBuffToEts(Code) ->
	BuffList = getBuffInfoList(Code),
	case monsterState:getCodeType(Code) of
		?SpawnPet ->
			Ets = monsterState:getMapPetEts(Code);
		?SpawnCallPet ->
			Ets = monsterState:getMapPetEts(Code);
		_ ->
			Ets = monsterState:getMapMonsterEts(Code)
	end,
	List = [{#recMapObject.buffList, BuffList}],
	myEts:updateEts(Ets, Code, List).

%% ====================================================================
%% Internal functions
%% ====================================================================

%%检查是否增加buff
-spec checkBuff(Code, BuffID) -> boolean() when
	Code :: uint(),
	BuffID :: uint().
checkBuff(Code, BuffID) ->
	Status = monsterState:getStatus(Code),
	case getCfg:getCfgPStack(cfg_buff, BuffID) of
		#buffCfg{buffEffect = Eeffect} ->
			case misc:testBit(Status, ?CreatureSpecStautsImmune) of
				true ->
					case lists:member(Eeffect, ?ImmumeList) of
						true ->
							false;
						_ ->
							true
					end;
				_ ->
					true
			end;
		_ -> skip
	end.
%%	#buffCfg{buffEffect = Eeffect} = getCfg:getCfgPStack(cfg_buff, BuffID),
%%	case misc:testBit(Status, ?CreatureSpecStautsImmune) of
%%		true ->
%%			case lists:member(Eeffect, ?ImmumeList) of
%%				true ->
%%					false;
%%				_ ->
%%					true
%%			end;
%%		_ ->
%%			true
%%	end.

-spec isAddBuff(Code :: uint(), BuffID :: uint(), BattleProp :: list()) -> boolean().
isAddBuff(_Code, _BuffID, _BattleProp) ->
	true.
%% 	#buffCfg{
%% 		buffEffect = Effect
%% 	} = getCfg:getCfgPStack(cfg_buff, BuffID),
%% 	case Effect of
%% 		?SLEEP ->
%% 			TargetNum = buff:getPropValue(?Prop_sleepprob, BattleProp),
%% 			SourceNum = monsterState:getBattlePropTotal(Code, ?Prop_sleepimmunity),
%% 			buff:calcProb(TargetNum - SourceNum);
%% 		?FREEZE ->
%% 			TargetNum = buff:getPropValue(?Prop_freezerprob, BattleProp),
%% 			SourceNum = monsterState:getBattlePropTotal(Code, ?Prop_freezeimmunity),
%% 			buff:calcProb(TargetNum - SourceNum);
%% 		?SLOWDOWN ->
%% 			TargetNum = buff:getPropValue(?Prop_slowdownprob, BattleProp),
%% 			SourceNum = monsterState:getBattlePropTotal(Code, ?Prop_slowdownimmunity),
%% 			buff:calcProb(TargetNum - SourceNum);
%% 		_ ->
%% 			true
%% 	end.

%%初始化buff自身
-spec initBuffData(MonsterCode, BuffID, Level, SkillID, EndTime) -> #recBuffInfo{} when
	MonsterCode :: uint(),
	BuffID :: uint(),
	Level :: uint(),
	SkillID :: uint(),
	EndTime :: uint().
initBuffData(MonsterCode, BuffID, Level, SkillID, EndTime) ->
	InitBaseData =
		#recBuffInfo{
			endTime = EndTime,
			buffID = BuffID,
			skillID = SkillID,
			attackerLevel = monsterState:getLevel(MonsterCode),
			attackerType = ?AttackerTypePlayer,
			attackerCode = MonsterCode,
			level = Level,
			attackerPid = self(),
			casterSerial = 0,
			attackerName = monsterState:getName(MonsterCode),
			attackPropList = monsterState:getBattleProp(MonsterCode)
		},
	BattleProp = monsterState:getBattleProp(MonsterCode),
	buff:setParam(InitBaseData, BattleProp, Level, 0).


%%相同buff共存规则
-spec sameBuffRule(MonsterCode, BuffData, BuffList) -> list() when
	MonsterCode :: uint(),
	BuffData :: #recBuffInfo{},
	BuffList :: list().
sameBuffRule(MonsterCode, #recBuffInfo{buffID = BuffID, attackerCode = CasterCode} = BuffData, BuffList) ->
	case getCfg:getCfgPStack(cfg_buff, BuffID) of
		#buffCfg{oneBuffMultiCaster = MulCaster, oneBuffOneCaster = OneCaster, buffDuration = Delay} ->
			[SameList, DiffList, DiffBuffList] = sameBuffSplit(BuffID, CasterCode, BuffList),
			if
				SameList =:= [] andalso DiffList =:= [] ->
					BuffList;
				SameList =:= [] ->
					if
						MulCaster =:= 0 ->  %%不同施法者可以共存，
							addOneBuff(MonsterCode, BuffData, BuffList);
						MulCaster =:= 1 ->  %%不同施法者不可以共存，需要等级替换
							%%有不同施法者buff,进行等级替换(替换规则是先删除后增加)
							levelReplace(MonsterCode, BuffData, DiffList) ++ DiffBuffList;
						true ->
							BuffList
					end;
				DiffList =:= [] ->
					if
						OneCaster =:= 0 ->
							%%相同施法者可以共存
							addOneBuff(MonsterCode, BuffData, BuffList);
						OneCaster =:= 1 ->
							%%相同施法者列表等级刷新，Buff只有一层
							NewSameList = levelUpdate(MonsterCode, BuffData, Delay, SameList),
							DiffBuffList ++ NewSameList;
						OneCaster > 1 ->
							%%相同施法者列表叠加刷新
							NewSameList = layerUpdate(MonsterCode, BuffData, Delay, OneCaster, SameList),
							DiffBuffList ++ NewSameList;
						true ->
							BuffList
					end;
				true ->
					if
						MulCaster =:= 0 ->
							%%有相同施法者buff，判断OneCaster
							if
								OneCaster =:= 0 ->
									%%相同施法者可以共存
									addOneBuff(MonsterCode, BuffData, BuffList);
								OneCaster =:= 1 ->
									%%相同施法者列表等级刷新，Buff只有一层
									NewSameList = levelUpdate(MonsterCode, BuffData, Delay, SameList),
									NewSameList ++ DiffList ++ DiffBuffList;
								OneCaster > 1 ->
									%%相同施法者列表叠加刷新
									NewSameList = layerUpdate(MonsterCode, BuffData, Delay, OneCaster, SameList),
									NewSameList ++ DiffList ++ DiffBuffList;
								true ->
									BuffList
							end;
						MulCaster =:= 1 ->
							%%有不同施法者buff,进行等级替换(替换规则是先删除后增加)
							NewDiffList = levelReplace(MonsterCode, BuffData, DiffList),
							NewDiffList ++ SameList ++ DiffBuffList;
						true ->
							BuffList
					end
			end;
		_ ->
			BuffList
	end.

%%相同Buff分离
-spec sameBuffSplit(BuffID, CasterCode, BuffList) -> list() when
	BuffID :: uint(),
	CasterCode :: uint(),
	BuffList :: list().
sameBuffSplit(BuffID, CasterCode, BuffList) ->
	Fun = fun(#recBuff{buffID = ID, casterCode = Code} = Buff, Acc) ->
		[SameCaster, DiffCaster, DiffBuff] = Acc,
		if
			ID =:= BuffID andalso Code =:= CasterCode ->
				[[Buff | SameCaster], DiffCaster, DiffBuff];
			ID =:= BuffID andalso Code =/= CasterCode ->
				[SameCaster, [Buff | DiffCaster], DiffBuff];
			true ->
				[SameCaster, DiffCaster, [Buff | DiffBuff]]
		end
	      end,
	lists:foldl(Fun, [[], [], []], BuffList).

%%等级刷新
-spec levelUpdate(MonsterCode, BuffData, Delay, BuffList) -> list() when
	MonsterCode :: uint(),
	BuffData :: #recBuffInfo{},
	Delay :: uint(),
	BuffList :: list().
levelUpdate(MonsterCode, #recBuffInfo{level = Level, buffID = BuffID} = BuffData, [NewDuration, AddLv], BuffList) ->
	NewDuration = trunc(NewDuration + AddLv * (Level - 1)),
	Now = time:getUTCNowMS(),
	EndTime =
		case NewDuration of
			0 ->
				0;
			_ ->
				Now + NewDuration
		end,
	BuffDamage = buffHurt(MonsterCode, BuffData),
	Fun = fun(Buff, List) ->
		if
			Level > Buff#recBuff.level ->
				BuffProp = buff:calcProp(BuffID, Level, Buff#recBuff.layer),
				NewBuff = Buff#recBuff{
					damage = BuffDamage,
					propList = BuffProp,
					level = Level,
					endTime = EndTime
				},
				updateOneBuff(MonsterCode, NewBuff, List, Buff#recBuff.propList);
			Level =:= Buff#recBuff.level ->
				NewBuff = Buff#recBuff{
					damage = BuffDamage,
					endTime = EndTime
				},
				updateOneBuff1(MonsterCode, NewBuff, List);
			true ->
				List
		end
	      end,
	lists:foldl(Fun, BuffList, BuffList).

%%层数刷新
-spec layerUpdate(MonsterCode, BuffData, Delay, OneCaster, BuffList) -> list() when
	MonsterCode :: uint(),
	BuffData :: #recBuffInfo{},
	Delay :: uint(),
	OneCaster :: uint(),
	BuffList :: list().
layerUpdate(MonsterCode, #recBuffInfo{level = Level, buffID = BuffID} = BuffData, [Dura, AddLv], OneCaster, BuffList) ->
	NewDura = trunc(Dura + AddLv * (Level - 1)),
	BuffDamage = buffHurt(MonsterCode, BuffData),
	Now = time:getUTCNowMS(),
	Fun = fun(Buff, List) ->
		if
			Level >= Buff#recBuff.level andalso Buff#recBuff.layer < OneCaster ->
				Layer = Buff#recBuff.layer + 1,
				BuffProp = buff:calcProp(BuffID, Level, Layer),
				NewBuff = Buff#recBuff{
					damage = BuffDamage,
					propList = BuffProp,
					layer = Layer,
					endTime = Now + NewDura
				},
				NewList = updateOneBuff(MonsterCode, NewBuff, List, Buff#recBuff.propList),
				NewList;
			Level >= Buff#recBuff.level andalso Buff#recBuff.layer >= OneCaster ->
				BuffProp = buff:calcProp(BuffID, Level, Buff#recBuff.layer),
				NewBuff = Buff#recBuff{damage = BuffDamage,
					propList = BuffProp,
					endTime = Now + NewDura},
				NewList = updateOneBuff(MonsterCode, NewBuff, List, Buff#recBuff.propList),
				NewList;
			true ->
				List
		end
	      end,
	lists:foldl(Fun, BuffList, BuffList).

%%等级替换
-spec levelReplace(MonsterCode, BuffData, BuffList) -> list() when
	MonsterCode :: uint(),
	BuffData :: #recBuffInfo{},
	BuffList :: list().
levelReplace(MonsterCode, #recBuffInfo{level = Level} = BuffData, BuffList) ->
	Fun = fun(Buff, List) ->
		case Level >= Buff#recBuff.level of
			true ->
				deleteOneBuff(MonsterCode, Buff, List);
			_ ->
				List
		end
	      end,
	addOneBuff(MonsterCode, BuffData, lists:foldl(Fun, BuffList, BuffList)).

%%不同buff共存规则
-spec diffBuffRule(MonsterCode, BuffData, BuffList) -> list() when
	MonsterCode :: uint(),
	BuffData :: #recBuffInfo{},
	BuffList :: list().
diffBuffRule(MonsterCode, #recBuffInfo{buffID = BuffID, attackerCode = CasterCode} = BuffData, BuffList) ->
	case getCfg:getCfgPStack(cfg_buff, BuffID) of
		#buffCfg{multiBuffMultiCaster = MulCaster, multiBuffOneCaster = OneCaster} ->
			[SameList, DiffList] = diffBuffSplit(BuffID, CasterCode, BuffList),
			if
				SameList =:= [] andalso DiffList =:= [] ->
					addOneBuff(MonsterCode, BuffData, BuffList);
				SameList =:= [] ->
					if
						MulCaster =:= 0 ->
							addOneBuff(MonsterCode, BuffData, BuffList);
						MulCaster > 0 ->
							multiOrderReplace(MonsterCode, BuffData, MulCaster, DiffList);
						true ->
							BuffList
					end;
				DiffList =:= [] ->
					if
						OneCaster =:= 0 ->
							%%相同施法者可以共存
							addOneBuff(MonsterCode, BuffData, BuffList);
						OneCaster > 0 ->
							%%拥有相同值得先后替换
							oneOrderReplace(MonsterCode, BuffData, OneCaster, SameList);
						true ->
							BuffList
					end;
				true ->
					if
						MulCaster =:= 0 ->
							%%有相同施法者buff，判断OneCaster
							if
								OneCaster =:= 0 ->
									%%相同施法者可以共存
									addOneBuff(MonsterCode, BuffData, BuffList);
								OneCaster > 0 ->
									%%拥有相同值得先后替换
									NewSameList = oneOrderReplace(MonsterCode, BuffData, OneCaster, SameList),
									NewSameList ++ DiffList;
								true ->
									BuffList
							end;
						MulCaster > 0 -> %%不同施法者不可以共存，需要先后替换
							%%有不同施法者buff,进行等级替换(替换规则是先删除后增加)
							NewDiffList = multiOrderReplace(MonsterCode, BuffData, MulCaster, DiffList),
							NewDiffList ++ SameList;
						true ->
							BuffList
					end
			end;
		_ ->
			BuffList
	end.

%%不同Buff分离
-spec diffBuffSplit(BuffID, CasterCode, BuffList) -> list() when
	BuffID :: uint(),
	CasterCode :: uint(),
	BuffList :: list().
diffBuffSplit(BuffID, CasterCode, BuffList) ->
	Fun = fun(#recBuff{buffID = ID, casterCode = Code} = Buff, Acc) ->
		[SameCaster, DiffCaster] = Acc,
		if
			ID =/= BuffID andalso Code =:= CasterCode ->
				[[Buff | SameCaster], DiffCaster];
			ID =/= BuffID andalso Code =/= CasterCode ->
				[SameCaster, [Buff | DiffCaster]];
			true ->
				Acc
		end
	      end,
	lists:foldl(Fun, [[], []], BuffList).

%%多施法者先后进行替换
-spec multiOrderReplace(MonsterCode, BuffData, MulCaster, BuffList) -> list() when
	MonsterCode :: uint(),
	BuffData :: #recBuffInfo{},
	MulCaster :: uint(),
	BuffList :: list().
multiOrderReplace(MonsterCode, #recBuffInfo{level = Level} = BuffData, MulCaster, BuffList) ->
	Fun = fun(Buff, List) ->
		case MulCaster =:= Buff#recBuff.multiBuffMultiCaster andalso Level >= Buff#recBuff.level of
			true ->
				deleteOneBuff(MonsterCode, Buff, List);
			_ ->
				List
		end
	      end,

	addOneBuff(MonsterCode, BuffData, lists:foldl(Fun, BuffList, BuffList)).

%%相同施法者先后进行替换
-spec oneOrderReplace(MonsterCode, BuffData, OneCaster, BuffList) -> list() when
	MonsterCode :: uint(),
	BuffData :: #recBuffInfo{},
	OneCaster :: uint(),
	BuffList :: list().
oneOrderReplace(MonsterCode, #recBuffInfo{level = Level} = BuffData, OneCaster, BuffList) ->
	Fun = fun(Buff, List) ->
		case OneCaster =:= Buff#recBuff.multiBuffOneCaster andalso Level >= Buff#recBuff.level of
			true ->
				deleteOneBuff(MonsterCode, Buff, List);
			_ ->
				List
		end
	      end,
	addOneBuff(MonsterCode, BuffData, lists:foldl(Fun, BuffList, BuffList)).

%%新增buff
-spec addOneBuff(MonsterCode, BuffData, BuffList) -> list() when
	MonsterCode :: uint(),
	BuffData :: #recBuffInfo{},
	BuffList :: list().
addOneBuff(MonsterCode, BuffData, BuffList) ->
	Buff = initBuff(MonsterCode, BuffData),
	addProp(MonsterCode, Buff#recBuff.propList, true),
	broadcastBuffEffect(MonsterCode, Buff#recBuff.buffID, Buff#recBuff.skillID, Buff#recBuff.level, Buff#recBuff.counter, ?OPERATEADD, Buff#recBuff.casterSerial),
	[Buff | BuffList].

%%更新Buff
-spec updateOneBuff(MonsterCode, Buff, BuffList, OldPropList) -> list() when
	MonsterCode :: uint(),
	Buff :: #recBuff{},
	BuffList :: list(),
	OldPropList :: list().
updateOneBuff(MonsterCode, Buff, BuffList, OldPropList) ->
	Cfg = getCfg:getCfgPStack(cfg_buff, Buff#recBuff.buffID),
	updateProp(MonsterCode, Buff#recBuff.propList, OldPropList),
	delEffect(MonsterCode, Buff, BuffList),
	addEffect(MonsterCode, Buff, Cfg),
	broadcastBuffEffect(MonsterCode, Buff#recBuff.buffID, Buff#recBuff.skillID, Buff#recBuff.level, Buff#recBuff.counter, ?OPERATEREPLACE, Buff#recBuff.casterSerial),
	NewBuffList = lists:keyreplace(Buff#recBuff.counter, #recBuff.counter, BuffList, Buff),
	NewBuffList.

updateOneBuff1(MonsterCode, Buff, BuffList) ->
	Cfg = getCfg:getCfgPStack(cfg_buff, Buff#recBuff.buffID),
	delEffect(MonsterCode, Buff, BuffList),
	addEffect(MonsterCode, Buff, Cfg),
	broadcastBuffEffect(MonsterCode, Buff#recBuff.buffID, Buff#recBuff.skillID, Buff#recBuff.level, Buff#recBuff.counter, ?OPERATEREPLACE, Buff#recBuff.casterSerial),
	lists:keyreplace(Buff#recBuff.counter, #recBuff.counter, BuffList, Buff).

updateOneBuff(Buff, BuffList) ->
	NewBuffList = lists:keyreplace(Buff#recBuff.counter, #recBuff.counter, BuffList, Buff),
	NewBuffList.

%%删除Buff
-spec deleteOneBuff(MonsterCode, Buff, BuffList) -> list() when
	MonsterCode :: uint(),
	Buff :: #recBuff{},
	BuffList :: list().
deleteOneBuff(MonsterCode, Buff, BuffList) ->
	deleteProp(MonsterCode, Buff#recBuff.propList, true),
	delEffect(MonsterCode, Buff, BuffList),
	broadcastBuffEffect(MonsterCode, Buff#recBuff.buffID, Buff#recBuff.skillID, Buff#recBuff.level, Buff#recBuff.counter, ?OPERATEREMOVE, Buff#recBuff.casterSerial),
	NewBuffList = lists:keydelete(Buff#recBuff.counter, #recBuff.counter, BuffList),
	NewBuffList.

%%初始化新buff
-spec initBuff(MonsterCode, BuffData) -> #recBuff{} when
	MonsterCode :: uint(),
	BuffData :: #recBuffInfo{}.
initBuff(MonsterCode, #recBuffInfo{buffID = BuffID} = BuffData) ->
	Now = time:getUTCNowMS(),
	Cfg = getCfg:getCfgPStack(cfg_buff, BuffID),
	BuffDamage = buffHurt(MonsterCode, BuffData),
	Counter = setCounter(MonsterCode),
	BuffDelay = Cfg#buffCfg.buffDelay,
	BuffStart = Cfg#buffCfg.buffStart,
	if
		BuffDelay =:= 0 ->
			TriggerTime = 0;
		BuffStart =:= 0 ->
			TriggerTime = BuffDelay + Now - ?Buff_DELAY_TIME;
		true ->
			TriggerTime = Now   %%立即触发有延迟
	end,
	Buff = buff:initBuffRec(Counter, BuffDamage, BuffData),

	%%判断是否立即触发buff效果
	case TriggerTime =:= 0 of
		true ->
			addEffect(MonsterCode, Buff, Cfg),
			Buff;
		_ ->
			Buff
	end.

%%设置buff计数器值
-spec setCounter(MonsterCode) -> uint() when
	MonsterCode :: uint().
setCounter(MonsterCode) ->
	MaxCounter = getMaxCounter(MonsterCode),
	if
		MaxCounter >= ?Buff_MAX_COUNTER ->
			1;
		true ->
			MaxCounter + 1
	end.

%%获取buff列表最大计数器值
-spec getMaxCounter(MonsterCode) -> uint() when
	MonsterCode :: uint().
getMaxCounter(MonsterCode) ->
	BuffList = monsterState:getBuffList(MonsterCode),
	Fun = fun(Buff, Max) ->
		case Buff#recBuff.counter > Max of
			true ->
				Buff#recBuff.counter;
			_ ->
				Max
		end
	      end,
	lists:foldl(Fun, 0, BuffList).

%%根据类型获取可移除buff
-spec getBuffByType(Type, BuffList) -> list() when
	Type :: uint(),
	BuffList :: list().
getBuffByType(?BuffTypeAll, BuffList) ->
	Fun = fun(Buff, Acc) ->
		case Buff#recBuff.remove =:= 1 of
			true ->
				[Buff | Acc];
			_ ->
				Acc
		end
	      end,
	lists:foldl(Fun, [], BuffList);
getBuffByType(Type, BuffList) ->
	Fun = fun(#recBuff{buffID = BuffID} = Buff, Acc) ->
		CfgBuff = getCfg:getCfgPStack(cfg_buff, BuffID),
		case Buff#recBuff.remove =:= 1 andalso CfgBuff#buffCfg.buffType =:= Type of
			true ->
				[Buff | Acc];
			_ ->
				Acc
		end
	      end,
	lists:foldl(Fun, [], BuffList).

%%移除buff
-spec removeBuff(MonsterCode, Buff) -> boolean() when
	MonsterCode :: uint(),
	Buff :: #recBuff{}.
removeBuff(MonsterCode, #recBuff{buffID = BuffID} = Buff) ->
	BuffList = monsterState:getBuffList(MonsterCode),
	case lists:keymember(BuffID, #recBuff.buffID, BuffList) of
		true ->
			NewBuffList = deleteOneBuff(MonsterCode, Buff, BuffList),
			monsterState:setBuffList(MonsterCode, NewBuffList),
			true;
		false ->
			false
	end.

%%移除buff列表
-spec removeBuffList(MonsterCode, BuffList) -> ok when
	MonsterCode :: uint(),
	BuffList :: list().
removeBuffList(MonsterCode, BuffList) ->
	AllList = monsterState:getBuffList(MonsterCode),
	Fun = fun(Buff, List) ->
		deleteOneBuff(MonsterCode, Buff, List)
	      end,
	NewList = lists:foldl(Fun, AllList, BuffList),
	monsterState:setBuffList(MonsterCode, NewList),
	ok.


%%增加buff引起属性变化
-spec addProp(MonsterCode, PropList, IsModifySpeed) -> ok when
	MonsterCode :: uint(),
	PropList :: list(),
	IsModifySpeed :: boolean().
addProp(MonsterCode, PropList, _) ->
	{PlusList, MultiList} = battleProp:calcPropGroup(PropList, ?EquipOn),
	monsterInterface:changeProp_AddMulti(MonsterCode, PlusList, MultiList, true),
	case lists:keyfind(?Prop_MoveSpeed, 1, PropList) of
		false ->
			skip;
		_ ->
			monsterMove:notifyMonsterSpeedToClient(MonsterCode)
	end.

%%更新buff引起属性变化
-spec updateProp(MonsterCode, PropList, OldPropList) -> ok when
	MonsterCode :: uint(),
	PropList :: list(),
	OldPropList :: list().
updateProp(MonsterCode, ProList, OldPropList) ->
	deleteProp(MonsterCode, OldPropList, false),
	addProp(MonsterCode, ProList, false).

%%删除buff引起属性变化
-spec deleteProp(MonsterCode, PropList, IsModifySpeed) -> ok when
	MonsterCode :: uint(),
	PropList :: list(),
	IsModifySpeed :: boolean().
deleteProp(MonsterCode, PropList, _) ->
	{PlusList, MultiList} = battleProp:calcPropGroup(PropList, ?EquipOff),
	monsterInterface:changeProp_AddMulti(MonsterCode, PlusList, MultiList, false),
	case lists:keyfind(?Prop_MoveSpeed, 1, PropList) of
		false ->
			skip;
		_ ->
			monsterMove:notifyMonsterSpeedToClient(MonsterCode)
	end.


%%更新指定BUFF
-spec tickOneBuff(MonsterCode, Now, #recBuff{}) -> ok when
	MonsterCode :: uint(),
	Now :: uint().
tickOneBuff(MonsterCode, Now, #recBuff{buffID = BuffID, endTime = EndTime, triggerTime = TriggerTime, count = Count} = Buff) ->
	if
		Now >= EndTime andalso EndTime =/= 0 andalso Count =< 0 ->
			removeBuff(MonsterCode, Buff);
		TriggerTime =/= 0 andalso Now >= TriggerTime ->
			triggerBuff(MonsterCode, Buff),
			Cfg = getCfg:getCfgPStack(cfg_buff, BuffID),
			BuffDelay = Cfg#buffCfg.buffDelay,
			if
				BuffDelay > 0 ->
					BuffList = monsterState:getBuffList(MonsterCode),
					NewBuff = Buff#recBuff{triggerTime = Now + BuffDelay, count = Count - 1},
					NewBuffList = updateOneBuff(NewBuff, BuffList),
					monsterState:setBuffList(MonsterCode, NewBuffList);
				true ->
					skip
			end;
		true ->
			skip
	end,
	ok.

%%通知客服端buff变化
-spec broadcastBuffEffect(MonsterCode, BuffID, SkillID, Level, Counter, Type, Serial) -> ok when
	MonsterCode :: uint(),
	BuffID :: uint(),
	SkillID :: uint(),
	Level :: uint(),
	Counter :: uint(),
	Type :: uint(),
	Serial :: uint().
broadcastBuffEffect(MonsterCode, BuffID, SkillID, Level, Counter, Type, Serial) ->
	PlayerEts = monsterState:getMapPlayerEts(MonsterCode),
	if
		Type =:= 0 ->
			syncBuffToEts(MonsterCode);
	%%?LOG_OUT("monster code ~p add buff ~p, counter ~p~n", [MonsterCode, BuffID, Counter]);
		Type =:= 1 ->
			syncBuffToEts(MonsterCode);
	%%?LOG_OUT("monster code ~p remove buff ~p, counter~p~n",[MonsterCode, BuffID, Counter]);
		true ->
			skip
	%%?LOG_OUT("monster  code ~p replace buff~p, counter ~p~n",[MonsterCode, BuffID, Counter])
	end,
	MapPid = monsterState:getMapPid(MonsterCode),
	{X, Y} = monsterState:getMonsterPos(MonsterCode),
	SelfGroupID = monsterState:getGroupID(MonsterCode),
%%	CasterInfo = monsterState:getCasterInfo(MonsterCode),
%% 	mapView:sendMsgToNearPlayerByPosIncludeChangeMap(
%% 		MapPid,
%% 		PlayerEts, 
%% 		#pk_GS2U_BuffInfo{
%% 			code = MonsterCode,
%% 			buffUID = Counter,
%% 			buffID = BuffID,
%% 			skillID = SkillID,
%% 			level = Level,
%% 			serial = Serial,
%% 			flag = Type
%% 		},
%% 		X, 
%% 		Y,
%% 		SelfGroupID,
%% 		0
%% 		),
	Msg = #pk_GS2U_BuffInfo{
		code = MonsterCode,
		buffUID = Counter,
		buffID = BuffID,
		skillID = SkillID,
		level = Level,
		serial = Serial,
		flag = Type
	},
%%	CasterPid = CasterInfo#recCasterInfo.casterPid,
%%	CasterType = CasterInfo#recCasterInfo.casterType,
	NearPlayerList = mapView:getMutualObject(MapPid, PlayerEts, ?ObjTypePlayer, {X, Y}, SelfGroupID),
%%	case lists:keyfind(CasterPid, #recMapObject.pid, NearPlayerList) of
%%		false ->
%%			case CasterType =:= ?AttackerTypePlayer andalso
%%				misc:is_process_alive(CasterPid) =:= true of
%%				true ->
%%					psMgr:sendMsg2PS(CasterPid, broadcast, Msg);
%%				_ ->
%%					skip
%%			end;
%%		_ ->
%%			skip
%%	end,
	[mapView:sendNetMsgToNetPid(NetPid, Msg) || #recMapObject{netPid = NetPid} <- NearPlayerList],
	ok.

%%广播客服端buff伤害
-spec broadcastBuffDamage(MonsterCode, BuffID, Counter, BuffDamage) -> ok when
	MonsterCode :: uint(),
	BuffID :: uint(),
	Counter :: uint(),
	BuffDamage :: float().
broadcastBuffDamage(MonsterCode, BuffID, Counter, BuffDamage) ->
	PlayerEts = monsterState:getMapPlayerEts(MonsterCode),
	CurHp = monsterState:getCurHp(MonsterCode),
	MaxHp = monsterState:getBattlePropTotal(MonsterCode, ?Prop_MaxHP),
	Hp_Per = skill:getPercent(CurHp, MaxHp),
%%	?DEBUG_OUT("monstercode ~p has ~p buff hurt is ~p, hp_per is ~p", [MonsterCode, BuffID, BuffDamage,Hp_Per]),
	{X, Y} = monsterState:getMonsterPos(MonsterCode),
	mapView:sendMsg2NearPlayerByPos(monsterState:getMapPid(MonsterCode), PlayerEts, #pk_GS2U_BuffHurt{code = MonsterCode,
		buffUID = Counter,
		buffID = BuffID,
		hp_per = Hp_Per,
		damageHp = BuffDamage}, X, Y, monsterState:getGroupID(MonsterCode)),
	ok.

%%buff伤害计算
buffHurt(
	MonsterCode,
	#recBuffInfo{damageMultiply = DamageMultiply, damagePlus = DamagePlus} = BuffData
) ->
	Status = monsterState:getStatus(MonsterCode),
	case buff:isCalcHurt(DamagePlus, DamageMultiply, Status) of
		true ->
			AbsorbValue = monsterState:getAbsorbShield(MonsterCode),
			{RealDamage, NewAbsorbValue} = buff:calcBuffDamageToMe(
				BuffData
				, MonsterCode
				, AbsorbValue
				, monsterState:getLevel(MonsterCode)
				, monsterState:getBattleProp(MonsterCode)
			),
			monsterState:setAbsorbShield(MonsterCode, NewAbsorbValue),
			erlang:trunc(RealDamage);
		_ ->
			0
	end;
buffHurt(
	MonsterCode,
	#recBuff{damageMultiply = DamageMultiply, damagePlus = DamagePlus} = Buff
) ->
	BuffData = buff:makeBuffInfoFromBuff(Buff),
	buffHurt(MonsterCode, BuffData).


%%判断死亡buff是否删除
-spec isDeathDelete(Flag) -> boolean() when
	Flag :: uint().
isDeathDelete(Flag) ->
	case Flag =:= 1 of
		true ->
			true;
		_ ->
			false
	end.

%%触发一个BUFF的效果   
-spec triggerBuff(MonsterCode, #recBuff{}) -> ok when
	MonsterCode :: uint().
triggerBuff(MonsterCode, Buff) ->
	Cfg = getCfg:getCfgPStack(cfg_buff, Buff#recBuff.buffID),
	doTriggerBuff(
		MonsterCode,
		Buff,
		Cfg,
		Cfg#buffCfg.damageType =/= ?SkillDamageTypeMedicine
	),
	ok.

doTriggerBuff(MonsterCode, Buff, Cfg, false) ->
	NewBuff = Buff#recBuff{
		damage = buffHurt(MonsterCode, Buff)
	},
	addEffect(MonsterCode, NewBuff, Cfg);
doTriggerBuff(MonsterCode, Buff, Cfg, true) ->
	Hp = monsterState:getCurHp(MonsterCode),
	case Hp > 0 of
		true ->
			BuffDamage = buffHurt(MonsterCode, Buff),
			?DEBUG_OUT("monster [~p] trigger buff [~p],andalso hurt is ~p",
				[MonsterCode, Buff#recBuff.buffID, BuffDamage]),
			case BuffDamage > 0 of
				true ->
					NewHp = Hp - BuffDamage,
					case NewHp > 0 of
						true ->
							case monsterWorldBoss:isDirectDecHP(MonsterCode) of
								true ->
									monsterState:setCurHp(MonsterCode, NewHp);
								_ ->
									skip
							end,
							broadcastBuffDamage(
								MonsterCode,
								Buff#recBuff.buffID,
								Buff#recBuff.counter,
								-(BuffDamage)
							),
							addEffect(MonsterCode, Buff, Cfg);
						_ ->

							case monsterWorldBoss:isDirectDecHP(MonsterCode) of
								true ->
									monsterState:setCurHp(MonsterCode, 0),

									broadcastBuffDamage(
										MonsterCode,
										Buff#recBuff.buffID,
										Buff#recBuff.counter,
										-(BuffDamage)
									),
									addEffect(MonsterCode, Buff, Cfg),

									case isDeathDelete(Cfg#buffCfg.buffDeathdel) of
										true ->
											removeBuff(MonsterCode, Buff);
										_ ->
											skip
									end,
									monsterBattle:onDead(
										MonsterCode,
										Buff#recBuff.casterPid,
										Buff#recBuff.casterCode,
										Buff#recBuff.casterName,
										Buff#recBuff.skillID
									);
								_ ->
									broadcastBuffDamage(
										MonsterCode,
										Buff#recBuff.buffID,
										Buff#recBuff.counter,
										-(BuffDamage)
									),
									addEffect(MonsterCode, Buff, Cfg)
							end
					end;
				_ ->
					addEffect(MonsterCode, Buff, Cfg)
			end;
		_ ->
			skip
	end,
	ok.

%%buff效果
-spec addEffect(MonsterCode, #recBuff{}, #buffCfg{}) -> ok when
	MonsterCode :: uint().
%%默认效果
addEffect(_MonsterCode, #recBuff{effect = ?DEFAULT}, #buffCfg{}) ->
	ok;

%%无敌效果
addEffect(MonsterCode, #recBuff{effect = ?INVINCIBLE}, #buffCfg{}) ->
	%%delBuff(MonsterCode, ?BuffTypeSub, 0), 
	monsterState:addStatus(MonsterCode, ?CreatureSpeStautsInvincible);

%%睡眠效果
addEffect(MonsterCode, #recBuff{effect = ?SLEEP}, #buffCfg{}) ->
	monsterSkill:breakUseSkill(MonsterCode),
	monsterState:addStatus(MonsterCode, ?CreatureSpeStatusComa);

%%冰冻效果
addEffect(MonsterCode, #recBuff{effect = ?FREEZE}, #buffCfg{}) ->
	monsterSkill:breakUseSkill(MonsterCode),
	monsterState:addStatus(MonsterCode, ?CreatureSpeStautsFreeze);

%%形变效果
addEffect(MonsterCode, #recBuff{effect = ?RESHAPE}, #buffCfg{}) ->
	monsterSkill:breakUseSkill(MonsterCode),
	monsterState:addStatus(MonsterCode, ?CreatureSpeStautsDeformation);

%%沉默效果
addEffect(MonsterCode, #recBuff{effect = ?SLIENCE}, #buffCfg{}) ->
	case monsterState:getCurUseSkill(MonsterCode) of
		#recCurUseSkill{skillID = SkillID} ->
			#skillCfg{skillSchool = School} = getCfg:getCfgPStack(cfg_skill, SkillID),
			case School =:= ?SkillMagic of
				true ->
					monsterSkill:breakUseSkill(MonsterCode);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	monsterState:addStatus(MonsterCode, ?CreatureSpeStautsSilence);

%%缴械效果
addEffect(MonsterCode, #recBuff{effect = ?DISARM}, #buffCfg{}) ->
	monsterState:addStatus(MonsterCode, ?CreatureSpeStautsDisarm);

%%减速效果
addEffect(_MonsterCode, #recBuff{effect = ?SLOWDOWN}, #buffCfg{}) ->
	ok;

%%PK保护效果
addEffect(MonsterCode, #recBuff{effect = ?PKPROTECT}, #buffCfg{}) ->
	monsterState:addStatus(MonsterCode, ?CreatureSpeStautsPkProtect);

%%和平使者
addEffect(MonsterCode, #recBuff{effect = ?PeaceEnvoy}, #buffCfg{}) ->
	monsterState:addStatus(MonsterCode, ?CreatureSpecStautsPeaceEnvoy);

%%获取触发技能效果
addEffect(MonsterCode, #recBuff{effect = ?GETTRISKILL, level = Level}, #buffCfg{} = Cfg) ->
	B1 = Cfg#buffCfg.buffParam1,
	B2 = Cfg#buffCfg.buffParam2,
	B3 = Cfg#buffCfg.buffParam3,
	B4 = Cfg#buffCfg.buffParam4,
	[monsterSkill:addTriggerSkill(MonsterCode, SkillID, Level) || SkillID <- [B1, B2, B3, B4]],
	ok;

%%属性转换
addEffect(MonsterCode, #recBuff{effect = ?PROPCONVERT}, #buffCfg{} = Cfg) ->
	B1 = Cfg#buffCfg.buffParam1,
	B2 = Cfg#buffCfg.buffParam2,
	B3 = Cfg#buffCfg.buffParam3,
	B4 = Cfg#buffCfg.buffParam4,
	delOldConvert(Cfg, MonsterCode, B2, B4),
	BattleProp = monsterState:getBattleProp(MonsterCode),
	PropValue = battleProp:getBattlePropTotalValue(BattleProp, B1),
	ConvertValue = PropValue * B3,

	put({oldConvert, MonsterCode}, ConvertValue),

	case B4 of
		?PropCalcType_Add ->
			monsterInterface:changeProp_AddMulti(MonsterCode, [{B2, ConvertValue}], [], true);
		?PropCalcType_Mul ->
			monsterInterface:changeProp_AddMulti(MonsterCode, [], [{B2, ConvertValue}], true);
		_ ->
			?ERROR_OUT("buff(~p) unknown calc type(~p)", [Cfg#buffCfg.buffId, B4])
	end;

%%buff伤害转换效果
addEffect(MonsterCode, #recBuff{effect = ?CONVERT} = Buff, #buffCfg{buffParam1 = B1}) ->
	MaxHp = monsterState:getBattlePropTotal(MonsterCode, ?Prop_MaxHP),
	HpConvert = (Buff#recBuff.damage * Buff#recBuff.layer * B1),
	Hp = monsterState:getCurHp(MonsterCode),
	NewHp = misc:clamp(Hp + HpConvert, 0, MaxHp),
	broadcastBuffDamage(
		MonsterCode,
		Buff#recBuff.buffID,
		Buff#recBuff.counter,
		HpConvert
	),
	monsterState:setCurHp(MonsterCode, NewHp);

%%修改生命值效果
addEffect(MonsterCode, #recBuff{effect = ?MODIFYHP}, #buffCfg{buffParam1 = B1, buffParam2 = B2}) ->
	Hp = monsterState:getCurHp(MonsterCode),
	MaxHp = monsterState:getBattlePropTotal(MonsterCode, ?Prop_MaxHP),
	GetHealthFactor = monsterState:getBattlePropTotal(MonsterCode, ?Prop_GetHealthFactor),
	ModifyValue = B1 + MaxHp * B2,
	ModifyHp =
		case ModifyValue > 0 of
			true ->
				ModifyValue * GetHealthFactor;
			_ ->
				ModifyValue
		end,
	NewHp = misc:clamp(Hp + ModifyHp, 0, MaxHp),
	monsterState:setCurHp(MonsterCode, NewHp);

%%修改魔法值效果
addEffect(_MonsterCode, #recBuff{effect = ?MODIFYMP}, #buffCfg{}) ->
	ok;

%%虚无效果
addEffect(MonsterCode, #recBuff{effect = ?BLUR}, #buffCfg{}) ->
	monsterState:addStatus(MonsterCode, ?CreatureSpeStautsBlur);

%%伤害吸收效果
addEffect(MonsterCode, #recBuff{effect = ?HURTABSORB}, #buffCfg{} = Cfg) ->
	B1 = Cfg#buffCfg.buffParam1,
	B2 = Cfg#buffCfg.buffParam2,
	B3 = Cfg#buffCfg.buffParam3,
	AbsorbValue = (B1 + B2 * B3) * monsterState:getBattleProp(MonsterCode, ?Prop_AbsorbShield),
	monsterState:setAbsorbShield(MonsterCode, AbsorbValue),
	ok;


%%变身效果
addEffect(MonsterCode, #recBuff{effect = ?SHAPESHIFTE}, #buffCfg{}) ->
	monsterState:addStatus(MonsterCode, ?CreatureSpeStautsShapeShifte);

%%变身获得技能效果
addEffect(_MonsterCode, #recBuff{effect = ?SHAPESKILL}, #buffCfg{}) ->
	ok;

%%修改能量值效果(怪物,无能量值)
addEffect(_MonsterCode, #recBuff{effect = ?MODIFYENERGY}, #buffCfg{}) ->
	ok;

%%免疫效果
addEffect(MonsterCode, #recBuff{effect = ?IMMUNE}, #buffCfg{} = _Cfg) ->
	%%B1 = Cfg#buffCfg.buffParam1,
	%%B2 = Cfg#buffCfg.buffParam2,
	%%B3 = Cfg#buffCfg.buffParam3,
	%%B4 = Cfg#buffCfg.buffParam4,
	%%[delBuffByState(MonsterCode, State) || State <- [B1, B2, B3, B4]],
	monsterState:addStatus(MonsterCode, ?CreatureSpecStautsImmune),
	ok;

%%免疫抓取,击退效果
addEffect(_MonsterCode, #recBuff{effect = ?IMMUNEEFFECT}, #buffCfg{}) ->
	ok;

%%不受控制效果
addEffect(MonsterCode, #recBuff{effect = ?NOCONTROL}, #buffCfg{}) ->
	monsterState:addStatus(MonsterCode, ?CreatureSpeStautsNoControl);

%%获取调用技能
addEffect(MonsterCode, #recBuff{effect = ?CALLSKILL, level = Level}, #buffCfg{buffParam1 = B1}) ->
	monsterSkill:addBuffCallSkill(MonsterCode, B1, Level);

%%定身
addEffect(MonsterCode, #recBuff{effect = ?FIXEDBODY}, #buffCfg{}) ->
	monsterState:addStatus(MonsterCode, ?CreatureSpeStautsFixed);

%%嘲讽
addEffect(MonsterCode, #recBuff{effect = ?RIDICULE}, #buffCfg{}) ->
	monsterState:addStatus(MonsterCode, ?CreatureSpecStautsRidicule);

addEffect(MonsterCode, #recBuff{effect = ?Polymorph}, #buffCfg{buffParam1 = TargetType, buffParam2 = TargetID}) ->
	onPolymorph(true, TargetType, MonsterCode, TargetID),
	ok;

addEffect(
	MonsterCode,
	#recBuff{effect = ?Ring},
	#buffCfg{buffId = BuffID, buffParam1 = P1}
) ->
	MapPid = monsterState:getMapPid(MonsterCode),
	Level = monsterState:getLevel(MonsterCode),
	MonsterEts = monsterState:getMapMonsterEts(MonsterCode),
	PlayerEts = monsterState:getMapPlayerEts(MonsterCode),
	KillList = monsterSkill:getKillList(MonsterCode),
	BuffTargetList =
		case myEts:readRecord(MonsterEts, MonsterCode) of
			#recMapObject{} = Target ->
				buff:getRingBuffTarget(BuffID, Target, MapPid, PlayerEts, MonsterEts, KillList, P1);
			_ ->
				[]
		end,
	Msg = #recRingBuff{
		srcCode = MonsterCode
		, srcLevel = Level
		, srcPid = self()
		, srcMapPid = MapPid
		, targetCode = 0
		, ringBuffID = BuffID
	},
	[psMgr:sendMsg2PS(TargetPid, addRingBuff, Msg#recRingBuff{targetCode = TargetCode})
		|| #recMapObject{pid = TargetPid, code = TargetCode} <- BuffTargetList
		, TargetCode =/= MonsterCode
	],
	ok;
addEffect(MonsterCode, #recBuff{effect = ?AntiInjury}, #buffCfg{buffParam1 = Type, buffParam2 = Percent}) ->
	case Type of
		?SkillDamageTypePhys ->
			monsterState:setPhysicalAntiInjury(MonsterCode, Percent);
		?SkillDamageTypeMagic ->
			monsterState:setMagicAntiInjury(MonsterCode, Percent);
		_ ->
			monsterState:setPhysicalAntiInjury(MonsterCode, Percent),
			monsterState:setMagicAntiInjury(MonsterCode, Percent),
			skip
	end,
	ok;
addEffect(_, _, _) ->
	ok.

%% 别人给我加的
addRingBuff(#recRingBuff{ringBuffID = RingBuffID, targetCode = TargetCode} = Msg) ->
	case canAddRingBuff(TargetCode, RingBuffID) of
		true ->
			doAddRingBuff(Msg);
		_ ->
			skip
	end,
	ok.

doAddRingBuff(#recRingBuff{
	srcCode = SrcCode
	, srcLevel = SrcLevel
	, srcPid = SrcPid
	, srcMapPid = SrcMapPid
	, ringBuffID = RingBuffID
	, targetCode = TargetCode
} = Msg) ->
	MapPid = monsterState:getMapPid(TargetCode),
	PlayerEts = monsterState:getMapPlayerEts(TargetCode),
	MonsterEts = monsterState:getMapPlayerEts(TargetCode),
	#buffCfg{
		buffEffect = ?Ring
		, buffParam1 = P1
		, buffParam2 = P2
		, buffParam3 = P3
		, buffParam4 = P4
	} = getCfg:getCfgByArgs(cfg_buff, RingBuffID),
	if
		MapPid =/= SrcMapPid ->
			skip;
		true ->
			case checkRingBuffDistance([PlayerEts, MonsterEts], SrcCode, TargetCode, P1) of
				true ->
					saveNewRingBuff(Msg),
					[addBuffWithCasterCode(TargetCode, BuffID, SrcLevel, {SrcCode, SrcPid, ""})
						|| BuffID <- [P2, P3, P4], BuffID > 0
					];
				_ ->
					skip
			end
	end,
	ok.

canAddRingBuff(TargetCode, BuffID) ->
	L = monsterState:getRingBuffIDList(TargetCode),
	case lists:keyfind(BuffID, #recRingBuff.ringBuffID, L) of
		false ->
			true;
		_ ->
			false
	end.

%% 保存别人给我加的光环
saveNewRingBuff(#recRingBuff{targetCode = MonsterCode} = Msg) ->
	L0 = monsterState:getRingBuffIDList(MonsterCode),
	L1 = lists:keystore(
		Msg#recRingBuff.ringBuffID
		, #recRingBuff.ringBuffID
		, L0
		, Msg
	),
	monsterState:setRingBuffIDList(MonsterCode, L1).

%% 删除别人给我加的光环
removeRingBuff(MonsterCode, RingBuffID) ->
	L0 = monsterState:getRingBuffIDList(MonsterCode),
	L1 = lists:keydelete(RingBuffID, #recRingBuff.ringBuffID, L0),
	monsterState:setRingBuffIDList(MonsterCode, L1).

%% 删除光环技能加的buff
removeBuffFromRing(MonsterCode, RingBuffID) ->
	#buffCfg{
		buffParam2 = P2
		, buffParam3 = P3
		, buffParam4 = P4
	} = getCfg:getCfgByArgs(cfg_buff, RingBuffID),
	[delBuff(MonsterCode, BuffID) || BuffID <- [P2, P3, P4], BuffID > 0].

checkRingBuffDistance(_EtsList, SrcCode, SrcCode, _MaxDist) ->
	false;
checkRingBuffDistance(EtsList, SrcCode, TargetCode, MaxDist) ->
	case mapView:getObjectDist(EtsList, SrcCode, TargetCode) of
		{ok, Dist, _SrcObj, _TargetObj} ->
			MaxDist >= Dist;
		_ ->
			false
	end.

%% 周期检查别人给我加的buff
tickCheckRingBuff(_MonsterCode, []) ->
	skip;
tickCheckRingBuff(MonsterCode, [Msg | L]) ->
	tickCheckRingBuff1(MonsterCode, Msg),
	tickCheckRingBuff(MonsterCode, L).


tickCheckRingBuff1(MonsterCode, #recRingBuff{
	srcPid = SrcPid,
	srcCode = SrcCode,
	srcLevel = SrcLevel,
	ringBuffID = RingBuffID
}) ->
	#buffCfg{
		buffEffect = ?Ring
		, buffParam1 = MaxDist
		, buffParam2 = P2
		, buffParam3 = P3
		, buffParam4 = P4
	} = getCfg:getCfgByArgs(cfg_buff, RingBuffID),
	IsSrcAlive = is_process_alive(SrcPid),
	PlayerEts = monsterState:getMapPlayerEts(MonsterCode),
	MonsterEts = monsterState:getMapPlayerEts(MonsterCode),
	NeedRemove =
		if
			IsSrcAlive =:= false ->
				true;
			true ->
				case
					checkRingBuffDistance(
						[PlayerEts, MonsterEts], SrcCode, MonsterCode, MaxDist)
				of
					false ->
						true;
					_ ->
						false
				end
		end,
	case NeedRemove of
		true ->
			removeBuffFromRing(MonsterCode, RingBuffID),
			removeRingBuff(MonsterCode, RingBuffID),
			[removeBuff(MonsterCode, BuffID) || BuffID <- [P2, P3, P4], BuffID > 0];
		_ ->
			[addBuffWithCasterCode(MonsterCode, BuffID, SrcLevel, {SrcCode, SrcPid, ""})
				|| BuffID <- [P2, P3, P4], BuffID > 0
			]
	end,
	ok.

%% 删除所有别人给我加的buff
clearRingBuffFromOther({SrcCode, MonsterCode}) ->
	L0 = monsterState:getRingBuffIDList(MonsterCode),
	L1 =
		lists:foldl(
			fun(#recRingBuff{ringBuffID = RingBuffID, srcCode = CurCode} = Rec, Acc) ->
				case SrcCode =:= 0 orelse SrcCode =:= CurCode of
					true ->
						removeBuffFromRing(MonsterCode, RingBuffID),
						Acc;
					_ ->
						[Rec | Acc]
				end
			end, [], L0),
	monsterState:setRingBuffIDList(MonsterCode, L1),
	ok.

%% 通知别人删除我给TA加的buff
clearRingBuffOfMe(MonsterCode) ->
	PlayerEts = monsterState:getMapPlayerEts(MonsterCode),
	MonsterEts = monsterState:getMapPlayerEts(MonsterCode),
	Fun =
		fun(#recMapObject{pid = TargetPid, code = TargetCode}) ->
			psMgr:sendMsg2PS(TargetPid, clearRingBuffOfMe, {MonsterCode, TargetCode})
		end,
	myEts:etsFor(PlayerEts, Fun),
	myEts:etsFor(MonsterEts, Fun),
	ok.

%% 1 monster,2 NPC
onPolymorph(true, 1, MonsterCode, TargetID) ->
	monsterState:addStatus(MonsterCode, ?CreatureSpeStatusPolymorph),
	Level = monsterState:getLevel(MonsterCode),
	#monsterCfg{monsterSkill = Skills} = getCfg:getCfgByArgs(cfg_monster, TargetID),
	[monsterSkill:addTempSkill(MonsterCode, SkillID, Level) || SkillID <- Skills],
	ok;
onPolymorph(false, 1, MonsterCode, TargetID) ->
	monsterState:clearStatus(MonsterCode, ?CreatureSpeStatusPolymorph),
	#monsterCfg{monsterSkill = Skills} = getCfg:getCfgByArgs(cfg_monster, TargetID),
	[monsterSkill:delTempSkill(MonsterCode, SkillID) || SkillID <- Skills],
	ok;
onPolymorph(true, 2, MonsterCode, _TargetID) ->
	monsterAI:setAIEvent(MonsterCode, ?BSTCondVar_IsAttackCD, 1),
	monsterState:addStatus(MonsterCode, ?CreatureSpeStatusPolymorph),
	monsterState:addStatus(MonsterCode, ?CreatureSpeStautsDisarm),
	ok;
onPolymorph(false, 2, MonsterCode, _TargetID) ->
	monsterAI:setAIEvent(MonsterCode, ?BSTCondVar_IsAttackCD, 0),
	monsterState:clearStatus(MonsterCode, ?CreatureSpeStatusPolymorph),
	monsterState:clearStatus(MonsterCode, ?CreatureSpeStautsDisarm),
	ok;
onPolymorph(_Flag, _Type, _MonsterCode, _TargetID) ->
	ok.

%%还原buff效果属性
-spec delEffect(MonsterCode, Buff, BuffList) -> ok when
	MonsterCode :: uint(),
	Buff :: #recBuff{},
	BuffList :: list().
delEffect(MonsterCode, #recBuff{} = Buff, BuffList) ->
	Cfg = getCfg:getCfgPStack(cfg_buff, Buff#recBuff.buffID),
	delEffect(MonsterCode, Buff, Cfg, BuffList).

%%移除无敌
delEffect(MonsterCode, #recBuff{effect = ?INVINCIBLE}, #buffCfg{}, BuffList) ->
	case isRemoveEff(MonsterCode, ?INVINCIBLE, BuffList) of
		true ->
			monsterState:clearStatus(MonsterCode, ?CreatureSpeStautsInvincible);
		_ ->
			skip
	end,
	ok;

%%移除睡眠
delEffect(MonsterCode, #recBuff{effect = ?SLEEP}, #buffCfg{}, BuffList) ->
	case isRemoveEff(MonsterCode, ?SLEEP, BuffList) of
		true ->
			monsterState:clearStatus(MonsterCode, ?CreatureSpeStatusComa);
		_ ->
			skip
	end,
	ok;

%%移除冰冻
delEffect(MonsterCode, #recBuff{effect = ?FREEZE}, #buffCfg{}, BuffList) ->
	case isRemoveEff(MonsterCode, ?FREEZE, BuffList) of
		true ->
			monsterState:clearStatus(MonsterCode, ?CreatureSpeStautsFreeze);
		_ ->
			skip
	end,
	ok;

%%移除形变
delEffect(MonsterCode, #recBuff{effect = ?RESHAPE}, #buffCfg{}, BuffList) ->
	case isRemoveEff(MonsterCode, ?RESHAPE, BuffList) of
		true ->
			monsterState:clearStatus(MonsterCode, ?CreatureSpeStautsDeformation);
		_ ->
			skip
	end,
	ok;

%%移除沉默
delEffect(MonsterCode, #recBuff{effect = ?SLIENCE}, #buffCfg{}, BuffList) ->
	case isRemoveEff(MonsterCode, ?SLIENCE, BuffList) of
		true ->
			monsterState:clearStatus(MonsterCode, ?CreatureSpeStautsSilence);
		_ ->
			skip
	end,
	ok;

%%移除缴械
delEffect(MonsterCode, #recBuff{effect = ?DISARM}, #buffCfg{}, BuffList) ->
	case isRemoveEff(MonsterCode, ?DISARM, BuffList) of
		true ->
			monsterState:clearStatus(MonsterCode, ?CreatureSpeStautsDisarm);
		_ ->
			skip
	end,
	ok;

%%移除虚无
delEffect(MonsterCode, #recBuff{effect = ?BLUR}, #buffCfg{}, BuffList) ->
	case isRemoveEff(MonsterCode, ?BLUR, BuffList) of
		true ->
			monsterState:clearStatus(MonsterCode, ?CreatureSpeStautsBlur);
		_ ->
			skip
	end,
	ok;

%%移除PK保护
delEffect(MonsterCode, #recBuff{effect = ?PKPROTECT}, #buffCfg{}, BuffList) ->
	case isRemoveEff(MonsterCode, ?PKPROTECT, BuffList) of
		true ->
			monsterState:clearStatus(MonsterCode, ?CreatureSpeStautsPkProtect);
		_ ->
			skip
	end,
	ok;

%%移除和平使者
delEffect(MonsterCode, #recBuff{effect = ?PeaceEnvoy}, #buffCfg{}, BuffList) ->
	case isRemoveEff(MonsterCode, ?PeaceEnvoy, BuffList) of
		true ->
			monsterState:clearStatus(MonsterCode, ?CreatureSpecStautsPeaceEnvoy);
		_ ->
			skip
	end,
	ok;

%%移除免疫
delEffect(MonsterCode, #recBuff{effect = ?IMMUNE}, #buffCfg{}, BuffList) ->
	case isRemoveEff(MonsterCode, ?IMMUNE, BuffList) of
		true ->
			monsterState:clearStatus(MonsterCode, ?CreatureSpecStautsImmune);
		_ ->
			skip
	end,
	ok;

%%移除免疫抓取等
delEffect(MonsterCode, #recBuff{effect = ?IMMUNEEFFECT}, #buffCfg{}, BuffList) ->
	case isRemoveEff(MonsterCode, ?IMMUNEEFFECT, BuffList) of
		true ->
			monsterState:clearStatus(MonsterCode, ?CreatureSpecStautsImmuneShift);
		_ ->
			skip
	end,
	ok;

%%移除不受状态
delEffect(MonsterCode, #recBuff{effect = ?NOCONTROL}, #buffCfg{}, BuffList) ->
	case isRemoveEff(MonsterCode, ?NOCONTROL, BuffList) of
		true ->
			monsterState:clearStatus(MonsterCode, ?CreatureSpeStautsNoControl);
		_ ->
			skip
	end,
	ok;

%%移除定身
delEffect(MonsterCode, #recBuff{effect = ?FIXEDBODY}, #buffCfg{}, BuffList) ->
	case isRemoveEff(MonsterCode, ?FIXEDBODY, BuffList) of
		true ->
			monsterState:clearStatus(MonsterCode, ?CreatureSpeStautsFixed);
		_ ->
			skip
	end,
	ok;

%%移除嘲讽
delEffect(MonsterCode, #recBuff{effect = ?RIDICULE}, #buffCfg{}, BuffList) ->
	case isRemoveEff(MonsterCode, ?RIDICULE, BuffList) of
		true ->
			monsterState:clearStatus(MonsterCode, ?CreatureSpecStautsRidicule);
		_ ->
			skip
	end,
	ok;

%%移除buff获取的触发技能
delEffect(MonsterCode, #recBuff{effect = ?GETTRISKILL}, #buffCfg{} = Cfg, _BuffList) ->
	B1 = Cfg#buffCfg.buffParam1,
	B2 = Cfg#buffCfg.buffParam2,
	B3 = Cfg#buffCfg.buffParam3,
	B4 = Cfg#buffCfg.buffParam4,
	[monsterSkill:delTriggerSkill(MonsterCode, SkillID) || SkillID <- [B1, B2, B3, B4]],
	ok;

%%移除buff转换属性
delEffect(MonsterCode, #recBuff{effect = ?PROPCONVERT}, #buffCfg{} = Cfg, _BuffList) ->
	B2 = Cfg#buffCfg.buffParam2,
	B4 = Cfg#buffCfg.buffParam4,
	delOldConvert(Cfg, MonsterCode, B2, B4);

%%移除调用技能
delEffect(MonsterCode, #recBuff{effect = ?CALLSKILL}, #buffCfg{buffParam1 = B1}, _BuffList) ->
	monsterSkill:delBuffCallSkill(MonsterCode, B1);

%%移除伤害吸收效果
delEffect(MonsterCode, #recBuff{effect = ?HURTABSORB}, #buffCfg{}, _BuffList) ->
	delOldAbsor(MonsterCode);

delEffect(MonsterCode, #recBuff{effect = ?Polymorph}, #buffCfg{buffParam1 = TargetType, buffParam2 = TargetID}, _BuffList) ->
	onPolymorph(false, TargetType, MonsterCode, TargetID),
	ok;
delEffect(MonsterCode, #recBuff{effect = ?Ring}, #buffCfg{}, _BuffList) ->
	clearRingBuffOfMe(MonsterCode),
	ok;
delEffect(MonsterCode, #recBuff{effect = ?AntiInjury}, #buffCfg{buffParam1 = Type}, _BuffList) ->
	case Type of
		?SkillDamageTypePhys ->
			monsterState:setPhysicalAntiInjury(MonsterCode, Type, 0);
		?SkillDamageTypeMagic ->
			monsterState:setMagicAntiInjury(MonsterCode, Type, 0);
		_ ->
			monsterState:setPhysicalAntiInjury(MonsterCode, Type, 0),
			monsterState:setMagicAntiInjury(MonsterCode, Type, 0),
			ok
	end,
	ok;
delEffect(_, _, _, _) ->
	ok.


%%是否移除当前效果
-spec isRemoveEff(Code, Eff, BuffList) -> boolean() when
	Code :: uint(),
	Eff :: uint(),
	BuffList :: list().
isRemoveEff(Code, Eff, BuffList) ->
	BuffNum = getBuffNum(Code, Eff, BuffList),
	case BuffNum > 1 of
		true ->
			false;
		_ ->
			true
	end.

%%判断buff是否存在
-spec isExist(Code, BuffID) -> boolean() when
	Code :: uint(),
	BuffID :: uint().
isExist(Code, BuffID) ->
	BuffList = monsterState:getBuffList(Code),
	case lists:keyfind(BuffID, #recBuff.buffID, BuffList) of
		false ->
			false;
		_ ->
			true
	end.

%%根据状态获取buff数量
-spec getBuffNum(Code, Effect, BuffList) -> uint() when
	Code :: uint(),
	Effect :: uint(),
	BuffList :: list().
getBuffNum(_Code, Effect, BuffList) ->
	Fun = fun(#recBuff{effect = Eff}, Num) ->
		case Eff =:= Effect of
			true ->
				Num + 1;
			_ ->
				Num
		end
	      end,
	lists:foldl(Fun, 0, BuffList).

%%删除更新前效果改变的属性
-spec delOldConvert(Cfg, MonsterCode, Prop, MultiOrPlus) -> ok when
	Cfg :: #buffCfg{},
	MonsterCode :: uint(),
	Prop :: uint(),
	MultiOrPlus :: uint().
delOldConvert(Cfg, MonsterCode, Prop, MultiOrPlus) ->
	case get({oldConvert, MonsterCode}) of
		undefined ->
			skip;
		OldValue ->
			erase({oldConvert, MonsterCode}),

			case MultiOrPlus of
				?PropCalcType_Add ->
					monsterInterface:changeProp_AddMulti(MonsterCode, [{Prop, -OldValue}], [], false);
				?PropCalcType_Mul ->
					monsterInterface:changeProp_AddMulti(MonsterCode, [], [{Prop, -OldValue}], false);
				_ ->
					?ERROR_OUT("buff(~p) unknown calc type(~p)", [Cfg#buffCfg.buffId, MultiOrPlus])
			end
	end,
	ok.

%%删除上次吸收盾属性值
-spec delOldAbsor(MonsterCode) -> ok when
	MonsterCode :: uint().
delOldAbsor(MonsterCode) ->
	monsterState:setAbsorbShield(MonsterCode, 0),
	ok.
%%	BattleProp = monsterState:getBattleProp(MonsterCode),
%%	case get({oldAbsor, MonsterCode}) of
%%		undefined ->
%%			skip;
%%		OldValue ->
%%			erase({oldAbsor, MonsterCode}),
%%			NewBattleProp = battleProp:addBattlePropAddValue(BattleProp, [{?Prop_Absorbshield, -OldValue}]),
%%			NewBattleProp1 = battleProp:calcCharBattleProp(NewBattleProp),
%%			monsterState:setBattleProp(MonsterCode, NewBattleProp1),
%%			monsterBattle:noticeBattleList(MonsterCode, NewBattleProp1),
%%			BattlePropList1 = monsterState:getBattleProp(MonsterCode),
%%			CurAbsor = monsterState:getAbsorbShield(MonsterCode),
%%			MaxAbsor = battleProp:getBattlePropTotalValue(BattlePropList1, ?Prop_Absorbshield),
%%			case CurAbsor >= MaxAbsor of
%%				true ->
%%					monsterState:setAbsorbShield(MonsterCode, MaxAbsor);
%%				_ ->
%%					skip
%%			end
%%	end,
%%	ok.
