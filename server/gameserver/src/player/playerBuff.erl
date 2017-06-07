%%%
%%%-------------------------------------------------------------------
%%% @author 罗维
%%% @copyright (C) 2014, <haowan123>
%%% @doc
%%% 技能buff
%%% @end
%%% Created : 23. 五月 2014 17:27
%%%-------------------------------------------------------------------

-module(playerBuff).
-author(luowei).

-include("gsInc.hrl").


%% ====================================================================
%% API functions
%% ====================================================================
-export([
	addBuff/2,
	addBuff/3,
	addBuffWithCasterCode/3,
	delBuff/0,
	delBuff/1,
	delBuff/2,
	tickBuff/1,
	addSpecBuff/2,
	delSpecBuff/1,
	delBuffByScene/0,
	delBuffByState/1,
	delNoRepeatBuff/1,
	addNoRepeatBuff/2,
	addBossBattleBuff/0,
	getBuffInfoList/0,
	reConnectBuffList/0,
	triggerBuffOnDead/0
]).

-export([
	addProp/3
]).

%%添加buff
-spec addBuff(BuffID, Arg) -> ok when
	BuffID :: uint(),
	Arg :: uint() | #recBuffInfo{} | #recSkillEffect{}.
addBuff(0, _) ->
	ok;
addBuff(BuffID, #recSkillEffect{attackerProp = BattleProp} = RecEffect) ->
	case checkBuff(BuffID) of
		true ->
			case isAddBuff(BuffID, BattleProp) of
				true ->
					BuffData = buff:initBuffData(BuffID, RecEffect),
					addBuff(BuffID, BuffData);
				_ ->
					skip
			end;
		_ ->
			ok
	end;
addBuff(BuffID, #recBuffInfo{} = BuffData) ->
	BuffList = playerState:getBuffList(),
	case lists:keymember(BuffID, #recBuff.buffID, BuffList) of
		true ->
			NewBuffList = sameBuffRule(BuffData, BuffList);
		false ->
			NewBuffList = diffBuffRule(BuffData, BuffList)
	end,
	playerState:setBuffList(NewBuffList);
addBuff(BuffID, Level) ->
	case checkBuff(BuffID) of
		true ->
			Now = time:getUTCNowMS(),
			#buffCfg{
				buffDuration = [Dura, AddLv],
				durationFactor = Factor
			} = getCfg:getCfgPStack(cfg_buff, BuffID),
			NewDura = trunc(Dura + AddLv * (Level - 1)),
			if
				Dura =:= 0 ->
					EndTime = 0;
				true ->
					EndTime = (Now + NewDura * (1 + playerState:getBattlePropTotal(Factor)))
			end,
			BuffData = initBuffData(BuffID, 0, Level, trunc(EndTime)),
			addBuff(BuffID, BuffData);
		_ ->
			ok
	end.

addBuff(BuffID, Level, EndTime) ->
	case checkBuff(BuffID) of
		true ->
			BuffData = initBuffData(BuffID, 0, Level, EndTime),
			addBuff(BuffID, BuffData);
		_ ->
			skip
	end.

addBuffWithCasterCode(BuffID, Level, {CasterCode, CasterPid, CasterName}) ->
	case checkBuff(BuffID) andalso playerState:getCurHp() > 0 of
		true ->
			Now = time:getUTCNowMS(),
			#buffCfg{
				buffDuration = [Dura, AddLv],
				durationFactor = Factor
			} = getCfg:getCfgPStack(cfg_buff, BuffID),
			NewDura = trunc(Dura + AddLv * (Level - 1)),
			if
				Dura =:= 0 ->
					EndTime = 0;
				true ->
					EndTime = (Now + NewDura * (1 + playerState:getBattlePropTotal(Factor)))
			end,
			BuffData = initBuffData(BuffID, 0, Level, trunc(EndTime)),
			NewBuffData = BuffData#recBuffInfo{attackerCode = CasterCode, attackerPid = CasterPid, attackerName = CasterName},
			addBuff(BuffID, NewBuffData);
		_ ->
			ok
	end.


%%添加无重复buff
-spec addNoRepeatBuff(BuffID, Level) -> ok when
	BuffID :: uint(),
	Level :: uint().
addNoRepeatBuff(BuffID, Level) ->
	case isExist(BuffID) of
		true ->
			ok;
		_ ->
			addBuff(BuffID, Level)
	end.

%%添加一些特殊buff
-spec addSpecBuff(BuffID, Level) -> ok when
	BuffID :: uint(),
	Level :: uint().
addSpecBuff(?KillBuff, Level) ->
	addBuff(?KillBuff, Level);
addSpecBuff(?RedNameBuff, Level) ->
	addBuff(?RedNameBuff, Level);
addSpecBuff(?PkBuff, Level) ->
	AttackType = playerState:getKillSelfType(),
	case AttackType =:= ?AttackerTypePlayer orelse
		AttackType =:= ?AttackerTypePet of
		true ->
			addBuff(?PkBuff, Level);
		_ ->
			ok
	end;
addSpecBuff(?EnergyBuff, Level) ->
	Carrer = playerState:getCareer(),
	case Carrer of
		?CareerTrainee ->
			addBuff(?EnergyBuff, Level);
		_ ->
			ok
	end;
addSpecBuff(BuffID, Level) ->
	addBuff(BuffID, Level).

%%更新BUFF
-spec tickBuff(Now) -> ok when
	Now :: uint().
tickBuff(Now) ->
	case playerState:getActionStatus() of
		?CreatureActionStatusChangeMap ->
			skip;
		_ ->
			BuffList = playerState:getBuffList(),
			Fun =
				fun(Buff) ->
					tickOneBuff(Now, Buff)
				end,
			lists:foreach(Fun, BuffList)
	end.

%%删除一些特殊buff
-spec delSpecBuff(BuffID) -> ok when
	BuffID :: uint().
delSpecBuff(?KillBuff) ->
	delBuff(?KillBuff);
delSpecBuff(?PkBuff) ->
	delBuff(?PkBuff);
delSpecBuff(?RedNameBuff) ->
	delBuff(?RedNameBuff);
delSpecBuff(?EnergyBuff) ->
	Carrer = playerState:getCareer(),
	case Carrer of
		?CareerTrainee ->
			delBuff(?EnergyBuff);
		_ ->
			ok
	end;
delSpecBuff(BuffID) ->
	delBuff(BuffID).

%%根据buff特定状态删除(并且为可移buff)
-spec delBuffByState(State) -> ok when
	State :: uint().
delBuffByState(State) ->
	BuffList = playerState:getBuffList(),
	Fun = fun(#recBuff{effect = Effect, remove = IsMove} = Buff, List) ->
		case State =:= Effect andalso IsMove =:= 1 of
			true ->
				deleteOneBuff(Buff, List);
			_ ->
				List
		end
	      end,
	NewBuffList = lists:foldl(Fun, BuffList, BuffList),
	playerState:setBuffList(NewBuffList),
	ok.

%%夸场景移除buff
-spec delBuffByScene() -> ok.
delBuffByScene() ->
	BuffList = playerState:getBuffList(),
	Fun = fun(#recBuff{buffID = BuffID} = Buff, Acc) ->
		#buffCfg{outSenceDel = OutSenceDel} = getCfg:getCfgPStack(cfg_buff, BuffID),
		case OutSenceDel of
			?BuffRemove_OutSence ->
				deleteOneBuff(Buff, Acc);
			_ ->
				Acc
		end
	      end,
	NewBuffList = lists:foldl(Fun, BuffList, BuffList),
	playerState:setBuffList(NewBuffList).

%%死亡删除可移除buff
-spec delBuff() -> ok.
delBuff() ->
	BuffList = playerState:getBuffList(),
	Fun = fun(#recBuff{buffID = ID} = Buff, Acc) ->
		#buffCfg{buffDeathdel = IsDeathDel} = getCfg:getCfgPStack(cfg_buff, ID),
		case IsDeathDel of
			?BuffRemove_Dead ->
				deleteOneBuff(Buff, Acc);
			_ ->
				Acc
		end
	      end,
	NewBuffList = lists:foldl(Fun, BuffList, BuffList),
	playerState:setBuffList(NewBuffList).

%%根据buffID移除
-spec delBuff(BuffID) -> ok when
	BuffID :: uint().
delBuff(BuffID) ->
	BuffList = playerState:getBuffList(),
	Fun = fun(#recBuff{buffID = ID} = Buff, List) ->
		case ID =:= BuffID of
			true ->
				deleteOneBuff(Buff, List);
			_ ->
				List
		end
	      end,
	NewBuffList = lists:foldl(Fun, BuffList, BuffList),
	playerState:setBuffList(NewBuffList),
	ok.

%%根据buff类型移除(并且为可移buff)
-spec delBuff(Type, Num) -> ok when
	Type :: uint(),
	Num :: uint().
delBuff(Type, Num) ->
	BuffList = playerState:getBuffList(),
	RemoveList = getBuffByType(Type, BuffList),
	if
		Num =:= 0 orelse Num >= length(RemoveList) ->
			removeBuffList(RemoveList);
		Num < length(RemoveList) ->
			NewBuffList = lists:sublist(RemoveList, Num),
			removeBuffList(NewBuffList);
		true ->
			skip
	end.

%%删除无重复buff
-spec delNoRepeatBuff(BuffID) -> ok when
	BuffID :: uint().
delNoRepeatBuff(BuffID) ->
	case isExist(BuffID) of
		true ->
			delBuff(BuffID);
		_ ->
			ok
	end.

%%获取buff信息
-spec getBuffInfoList() -> list().
getBuffInfoList() ->
	BuffList = playerState:getBuffList(),
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
			time = erlang:trunc(Time),
			buffID = BuffID,
			buffUID = BuffUID
		} | Acc]
	      end,
	lists:foldl(Fun, [], BuffList).

%%断线重连buffList重新发送给客服端
-spec reConnectBuffList() -> ok.
reConnectBuffList() ->
	Buffs = playerState:getBuffList(),
	Fun = fun(#recBuff{
		buffID = ID,
		level = Level,
		casterSerial = Serial,
		counter = Counter,
		skillID = SkillID
	}) ->
		broadcastBuffEffect(ID,
			SkillID,
			Level,
			Counter,
			?OPERATEADD,
			Serial
		)
	      end,
	lists:foreach(Fun, Buffs).

%%特殊处理牛头怪物战斗过程中
%%处理在boss战斗过程中增加的变身buff和其他buff
addBossBattleBuff() ->
	Now = time:getUTCNowMS(),
	case playerState:isPlayerBattleStatus() of
		true ->
			BossID = getBossID(),
			AddTime = getTime(),
			HateList = playerState:getHateList(),

			%%是否与牛头怪物战斗
			case isBossBattle(HateList, BossID) of
				{true, Pid, Code} ->
					%%判断战斗时间
					case get(bossBattleTime) of
						undefined ->
							put(bossBattleTime, Now),
							erlang:send_after(500, self(), addBossBattleBuff);
						Time ->
							case Now - Time >= AddTime of
								true ->
									%%增加玩家变身buff
									Level = playerState:getLevel(),
									addBuff(addPlayerBuff(), Level),

									%%通知怪物移除buff
									psMgr:sendMsg2PS(Pid, delBuff, {Code, delBossBuff()}),

									%%通知客服端播放剧情对话
									noticeDialogue();
								_ ->
									erlang:send_after(500, self(), addBossBattleBuff)
							end
					end;
				_ ->
					erlang:send_after(500, self(), addBossBattleBuff)
			end;
		_ ->
			erlang:send_after(500, self(), addBossBattleBuff)
	end.

%%根据仇恨值判断玩家是否正在和牛头怪物战斗
-spec isBossBattle(HateList, BossID) -> false | {true, pid(), uint()} when
	HateList :: list(),
	BossID :: uint().
isBossBattle([], _BossID) ->
	false;
isBossBattle([#recHate{hateCode = Code, hatePid = Pid} | List], BossID) ->
	case playerSkill:getObject(Code) of
		#recMapObject{id = ID} when ID =:= BossID ->
			{true, Pid, Code};
		_ ->
			isBossBattle(List, BossID)
	end.

%%牛头怪物ID
getBossID() ->
	663.

%%释放buff时间
getTime() ->
	#globalsetupCfg{
		setpara = [ParaA]
	} = getCfg:getCfgPStack(cfg_globalsetup, fistplanes),
	ParaA.

%%移除bossID
delBossBuff() ->
	108.

%%增加玩家变身buff
addPlayerBuff() ->
	107.

%%通知客服端播放剧情对话
noticeDialogue() ->
	DiaLogue = 1504,
	Msg = #pk_GS2U_PlotDialogue{id = DiaLogue},
	playerMsg:sendNetMsg(Msg).

%% ====================================================================
%% Internal functions
%% ====================================================================

%%检查是否增加buff
-spec checkBuff(BuffID) -> boolean() when
	BuffID :: uint().
checkBuff(BuffID) ->
	Status = playerState:getStatus(),
	case getCfg:getCfgByKey(cfg_buff, BuffID) of
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
		_ ->
			false
	end.

-spec isAddBuff(BuffID :: uint(), BattleProp :: list()) -> boolean().
isAddBuff(_BuffID, _BattleProp) ->
	true.
%% 	#buffCfg{
%% 		buffEffect = Effect
%% 	} = getCfg:getCfgPStack(cfg_buff, BuffID),
%% 	case Effect of
%% 		?SLEEP ->
%% 			TargetNum = buff:getPropValue(?Prop_sleepprob, BattleProp),
%% 			SourceNum = playerState:getBattlePropTotal(?Prop_sleepimmunity),
%% 			buff:calcProb(TargetNum - SourceNum);
%% 		?FREEZE ->
%% 			TargetNum = buff:getPropValue(?Prop_freezerprob, BattleProp),
%% 			SourceNum = playerState:getBattlePropTotal(?Prop_freezeimmunity),
%% 			buff:calcProb(TargetNum - SourceNum);
%% 		?SLOWDOWN ->
%% 			TargetNum = buff:getPropValue(?Prop_slowdownprob, BattleProp),
%% 			SourceNum = playerState:getBattlePropTotal(?Prop_slowdownimmunity),
%% 			buff:calcProb(TargetNum - SourceNum);
%% 		_ ->
%% 			true
%% 	end.

%%玩家自身buff初始化
-spec initBuffData(BuffID, SkillID, Level, EndTime) -> #recBuffInfo{} when
	BuffID :: uint(),
	SkillID :: uint(),
	Level :: uint(),
	EndTime :: uint().
initBuffData(BuffID, SkillID, Level, EndTime) ->
	InitBaseData = #recBuffInfo{
		buffID = BuffID,
		skillID = SkillID,
		attackerLevel = Level,
		attackerPid = self(),
		endTime = EndTime,
		level = Level,
		casterSerial = 0,
		attackerType = ?AttackerTypePlayer,
		attackerName = playerState:getName(),
		attackerCode = playerState:getPlayerCode(),
		attackPropList = playerCalcProp:getBattleProp()
	},
	BattleProp = playerCalcProp:getBattleProp(),
	Energy = playerBase:getSpecBattlePropPower(),
	buff:setParam(InitBaseData, BattleProp, Level, Energy). %%初始化伤害系数参数

%%相同buff共存规则
-spec sameBuffRule(BuffData, BuffList) -> list() when
	BuffData :: #recBuffInfo{},
	BuffList :: list().
sameBuffRule(#recBuffInfo{buffID = BuffID, attackerCode = CasterCode} = BuffData, BuffList) ->
	case getCfg:getCfgPStack(cfg_buff, BuffID) of
		#buffCfg{oneBuffMultiCaster = MulCaster, oneBuffOneCaster = OneCaster, buffDuration = Delay} = Conf ->
			[SameList, DiffList, DiffBuffList] = sameBuffSplit(BuffID, CasterCode, BuffList),
			RetBuffList =
				if
					SameList =:= [] andalso DiffList =:= [] ->
						BuffList;
				%%应该存在buff,所以忽略
					SameList =:= [] ->
						if
							MulCaster =:= 0 ->  %%不同施法者可以共存，
								addOneBuff(BuffData, BuffList);
							MulCaster =:= 1 ->  %%不同施法者不可以共存，需要等级替换
								%%有不同施法者buff,进行等级替换(替换规则是先删除后增加)
								levelReplace(BuffData, DiffList) ++ DiffBuffList;
							true ->
								BuffList
						end;
					DiffList =:= [] ->
						if
							OneCaster =:= 0 ->
								%%相同施法者可以共存
								addOneBuff(BuffData, BuffList);
							OneCaster =:= 1 ->
								%%相同施法者列表等级刷新，Buff只有一层
								NewSameList = levelUpdate(BuffData, Delay, SameList),
								NewSameList ++ DiffBuffList;
							OneCaster > 1 ->
								%%相同施法者列表叠加刷新
								NewSameList = layerUpdate(BuffData, Delay, OneCaster, SameList),
								NewSameList ++ DiffBuffList;
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
										addOneBuff(BuffData, BuffList);
									OneCaster =:= 1 ->
										%%相同施法者列表等级刷新，Buff只有一层
										NewSameList = levelUpdate(BuffData, Delay, SameList),
										NewSameList ++ DiffList ++ DiffBuffList;
									OneCaster > 1 ->
										%%相同施法者列表叠加刷新
										NewSameList = layerUpdate(BuffData, Delay, OneCaster, SameList),
										NewSameList ++ DiffList ++ DiffBuffList;
									true ->
										BuffList
								end;
							MulCaster =:= 1 ->
								%%有不同施法者buff,进行等级替换(替换规则是先删除后增加)
								NewDiffList = levelReplace(BuffData, DiffList),
								NewDiffList ++ SameList ++ DiffBuffList;
							true ->
								BuffList
						end
				end,
			case BuffID of
				400 ->
					Buff400s = lists:filter(fun(#recBuff{buffID = BID}) -> BID =:= 400 end, RetBuffList),
					case erlang:length(Buff400s) > 1 of
						true ->
							?ERROR_OUT("sameBuffRule,roleID:~p,code:~p,buffData:~p,OldBuffList:~p,NewBuffList:~p,Conf:~p,
							SameList:~p, DiffList:~p, DiffBuffList:~p,stack:~p",
								[
									playerState:getRoleID(),
									playerState:getPlayerCode(),
									BuffData,
									BuffList,
									RetBuffList,
									Conf,
									SameList, DiffList, DiffBuffList, misc:getStackTrace()
								]),
							ok;
						_ ->
							skip
					end;
				_ ->
					skip
			end,
			RetBuffList;
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
-spec levelUpdate(BuffData, Delay, BuffList) -> list() when
	BuffData :: #recBuffInfo{},
	Delay :: uint(),
	BuffList :: list().
levelUpdate(#recBuffInfo{level = Level, buffID = BuffID} = BuffData, [Dura, AddLv], BuffList) ->
	Now = time:getUTCNowMS(),
	NewDura = trunc(Dura + AddLv * (Level - 1)),
	EndTime = case NewDura of
		          0 ->
			          0;
		          _ -> Now + NewDura
	          end,
	BuffDamage = buffHurt(BuffData),
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
				updateOneBuff(NewBuff, List, Buff#recBuff.propList);
			Level =:= Buff#recBuff.level ->
				NewBuff = Buff#recBuff{
					damage = BuffDamage,
					endTime = EndTime
				},
				updateOneBuff1(NewBuff, List);
			true ->
				List
		end
	      end,
	lists:foldl(Fun, BuffList, BuffList).

%%层数刷新
-spec layerUpdate(BuffData, Delay, OneCaster, BuffList) -> list() when
	BuffData :: #recBuffInfo{},
	Delay :: uint(),
	OneCaster :: uint(),
	BuffList :: list().
layerUpdate(#recBuffInfo{level = Level, buffID = BuffID} = BuffData, [Dura, AddLv], OneCaster, BuffList) ->
	NewDura = trunc(Dura + AddLv * (Level - 1)),
	BuffDamage = buffHurt(BuffData),
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
				updateOneBuff(NewBuff, List, Buff#recBuff.propList);
			Level >= Buff#recBuff.level andalso Buff#recBuff.layer >= OneCaster ->
				BuffProp = buff:calcProp(BuffID, Level, Buff#recBuff.layer),
				NewBuff = Buff#recBuff{
					damage = BuffDamage,
					propList = BuffProp,
					endTime = Now + NewDura
				},
				updateOneBuff(NewBuff, List, Buff#recBuff.propList);
			true ->
				List
		end
	      end,
	lists:foldl(Fun, BuffList, BuffList).

%%等级替换
-spec levelReplace(BuffData, BuffList) -> list() when
	BuffData :: #recBuffInfo{},
	BuffList :: list().
levelReplace(#recBuffInfo{level = Level} = BuffData, BuffList) ->
	Fun =
		fun(Buff, {IsDelete, List}) ->
			case Level > Buff#recBuff.level of
				true ->
					{true, deleteOneBuff(Buff, List)};
				_ ->
					{IsDelete, List}
			end
		end,
	case lists:foldl(Fun, {false, BuffList}, BuffList) of
		{false, _} -> BuffList;
		{true, BuffList1} ->
			addOneBuff(BuffData, BuffList1)
	end.

%%不同buff共存规则
-spec diffBuffRule(BuffData, BuffList) -> list() when
	BuffData :: #recBuffInfo{},
	BuffList :: list().
diffBuffRule(#recBuffInfo{buffID = BuffID, attackerCode = CasterCode} = BuffData, BuffList) ->
	case getCfg:getCfgPStack(cfg_buff, BuffID) of
		#buffCfg{multiBuffMultiCaster = MulCaster, multiBuffOneCaster = OneCaster} ->
			[SameList, DiffList] = diffBuffSplit(BuffID, CasterCode, BuffList),
			if
				SameList =:= [] andalso DiffList =:= [] ->
					addOneBuff(BuffData, BuffList);
				SameList =:= [] ->
					if
						MulCaster =:= 0 ->
							addOneBuff(BuffData, BuffList);
						MulCaster > 0 ->
							multiOrderReplace(BuffData, MulCaster, DiffList);
						true ->
							BuffList
					end;
				DiffList =:= [] ->
					if
						OneCaster =:= 0 ->
							%%相同施法者可以共存
							addOneBuff(BuffData, BuffList);
						OneCaster > 0 ->
							%%拥有相同值得先后替换
							oneOrderReplace(BuffData, OneCaster, SameList);
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
									addOneBuff(BuffData, BuffList);
								OneCaster > 0 ->
									%%拥有相同值得先后替换
									NewSameList = oneOrderReplace(BuffData, OneCaster, SameList),
									NewSameList ++ DiffList;
								true ->
									BuffList
							end;
						MulCaster > 0 -> %%不同施法者不可以共存，需要先后替换
							%%有不同施法者buff,进行等级替换(替换规则是先删除后增加)
							NewDiffList = multiOrderReplace(BuffData, MulCaster, DiffList),
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
-spec multiOrderReplace(BuffData, MulCaster, BuffList) -> list() when
	BuffData :: #recBuffInfo{},
	MulCaster :: uint(),
	BuffList :: list().
multiOrderReplace(#recBuffInfo{level = Level} = BuffData, MulCaster, BuffList) ->
	Fun = fun(Buff, List) ->
		case MulCaster =:= Buff#recBuff.multiBuffMultiCaster andalso Level >= Buff#recBuff.level of
			true ->
				deleteOneBuff(Buff, List);
			_ ->
				List
		end
	      end,

	addOneBuff(BuffData, lists:foldl(Fun, BuffList, BuffList)).

%%相同施法者先后进行替换
-spec oneOrderReplace(BuffData, OneCaster, BuffList) -> list() when
	BuffData :: #recBuffInfo{},
	OneCaster :: uint(),
	BuffList :: list().
oneOrderReplace(#recBuffInfo{level = Level} = BuffData, OneCaster, BuffList) ->
	Fun = fun(Buff, List) ->
		case OneCaster =:= Buff#recBuff.multiBuffOneCaster andalso Level >= Buff#recBuff.level of
			true ->
				deleteOneBuff(Buff, List);
			_ ->
				List
		end
	      end,
	addOneBuff(BuffData, lists:foldl(Fun, BuffList, BuffList)).

%%新增buff
-spec addOneBuff(BuffData, BuffList) -> list() when
	BuffData :: #recBuffInfo{},
	BuffList :: list().
addOneBuff(BuffData, BuffList) ->
	Buff = initBuff(BuffData),
	addProp(Buff#recBuff.buffID, Buff#recBuff.propList, true),
	broadcastBuffEffect(Buff#recBuff.buffID, Buff#recBuff.skillID, Buff#recBuff.level, Buff#recBuff.counter, ?OPERATEADD, Buff#recBuff.casterSerial),
	[Buff | BuffList].

%%更新Buff
-spec updateOneBuff(Buff, BuffList, OldPropList) -> list() when
	Buff :: #recBuff{},
	BuffList :: list(),
	OldPropList :: list().
updateOneBuff(Buff, BuffList, OldPropList) ->
	Cfg = getCfg:getCfgPStack(cfg_buff, Buff#recBuff.buffID),
	updateProp(Buff#recBuff.buffID, Buff#recBuff.propList, OldPropList),
	%%delEffect(Buff),
	addEffect(Buff, Cfg),
	broadcastBuffEffect(Buff#recBuff.buffID, Buff#recBuff.skillID, Buff#recBuff.level, Buff#recBuff.counter, ?OPERATEREPLACE, Buff#recBuff.casterSerial),
	NewBuffList = lists:keyreplace(Buff#recBuff.counter, #recBuff.counter, BuffList, Buff),
	NewBuffList.

updateOneBuff(Buff, BuffList) ->
	%%Cfg = getCfg:getCfgPStack(cfg_buff, Buff#recBuff.id),
	%%delEffect(Buff),
	%%addEffect(Buff, Cfg),
	NewBuffList = lists:keyreplace(Buff#recBuff.counter, #recBuff.counter, BuffList, Buff),
	NewBuffList.

updateOneBuff1(Buff, BuffList) ->
	%%Cfg = getCfg:getCfgPStack(cfg_buff, Buff#recBuff.id),
	%%delEffect(Buff),
	%%addEffect(Buff, Cfg),
	broadcastBuffEffect(Buff#recBuff.buffID, Buff#recBuff.skillID, Buff#recBuff.level, Buff#recBuff.counter, ?OPERATEREPLACE, Buff#recBuff.casterSerial),
	lists:keyreplace(Buff#recBuff.counter, #recBuff.counter, BuffList, Buff).

%%删除Buff
-spec deleteOneBuff(Buff, BuffList) -> list() when
	Buff :: #recBuff{},
	BuffList :: list().
deleteOneBuff(Buff, BuffList) ->
	deleteProp(Buff#recBuff.buffID, Buff#recBuff.propList, true),
	delEffect(Buff, BuffList),
	broadcastBuffEffect(Buff#recBuff.buffID, Buff#recBuff.skillID, Buff#recBuff.level, Buff#recBuff.counter, ?OPERATEREMOVE, Buff#recBuff.casterSerial),
	NewBuffList = lists:keydelete(Buff#recBuff.counter, #recBuff.counter, BuffList),
	NewBuffList.

%%初始化Buff
-spec initBuff(BuffData) -> #recBuff{} when
	BuffData :: #recBuffInfo{}.
initBuff(#recBuffInfo{buffID = BuffID, level = Level} = BuffData) ->
	Now = time:getUTCNowMS(),
	Cfg = getCfg:getCfgPStack(cfg_buff, BuffID),
	BuffDamage = buffHurt(BuffData),
	Counter = setCounter(),
	BuffDelay = Cfg#buffCfg.buffDelay,
	BuffStart = Cfg#buffCfg.buffStart,
	if
		BuffDelay =:= 0 ->
			TriggerTime = 0;
		BuffStart =:= 0 ->
			TriggerTime = BuffDelay + Now - ?Buff_DELAY_TIME;
		true ->
			TriggerTime = Now
	end,
	Buff = buff:initBuffRec(Counter, BuffDamage, BuffData),
%%	?DEBUG_OUT("&&&&&&&&&&&&&&&&&&&addbuff:id:~p, effect:~p:~p", [BuffID,  Cfg#buffCfg.buffEffect,Buff#recBuff.effect ]),
	%%判断是否立即触发buff效果
	case TriggerTime =:= 0 of
		true ->
			addEffect(Buff, Cfg),
			Buff;
		_ ->
			Buff
	end.

%%设置buff计数器值
-spec setCounter() -> uint().
setCounter() ->
	MaxCounter = getMaxCounter(),
	if
		MaxCounter >= ?Buff_MAX_COUNTER ->
			1;
		true ->
			MaxCounter + 1
	end.

%%获取buff列表最大计数器值
-spec getMaxCounter() -> uint().
getMaxCounter() ->
	BuffList = playerState:getBuffList(),
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
-spec removeBuff(Buff) -> boolean() when
	Buff :: #recBuff{}.
removeBuff(#recBuff{buffID = BuffID} = Buff) ->
	BuffList = playerState:getBuffList(),
	case lists:keymember(BuffID, #recBuff.buffID, BuffList) of
		true ->
			NewBuffList = deleteOneBuff(Buff, BuffList),
			playerState:setBuffList(NewBuffList),
			true;
		false ->
			false
	end.

%%移除buff列表
-spec removeBuffList(BuffList) -> ok when
	BuffList :: list().
removeBuffList(BuffList) ->
	AllList = playerState:getBuffList(),
	Fun = fun(Buff, List) ->
		deleteOneBuff(Buff, List)
	      end,
	NewList = lists:foldl(Fun, AllList, BuffList),
	playerState:setBuffList(NewList),
	ok.

%%增加buff引起属性变化
-spec addProp(BuffID :: uint(), PropList :: list(), IsNotify::boolean()) -> ok.
addProp(BuffID, PropList,IsNotify) ->
	{PlusList, MultiList} = battleProp:calcPropGroup(PropList, ?EquipOn),
%%	NewBattleProp = battleProp:addBattlePropAddValue(BattleProp, PlusList),
%%	NewBattleProp1 = battleProp:addBattlePropRateValue(NewBattleProp, MultList),
%%	playerCalcProp:calcBattleProp(NewBattleProp1, false, true),
	playerCalcProp:changeProp_CalcType(PropList, ?EquipOn, true),
	playerForce:calcPlayerForce(IsNotify),
	playerCalcProp:saveBuffProp(BuffID, PlusList, MultiList, add).

%%删除buff引起属性变化
-spec deleteProp(BuffID :: uint(), PropList :: list(), IsNotify::boolean()) -> ok.
deleteProp(BuffID, PropList,IsNotify) ->
%%	BattleProp = playerCalcProp:getBattleProp(),
	{PlusList, MultiList} = battleProp:calcPropGroup(PropList, ?EquipOff),
%%	NewBattleProp = battleProp:addBattlePropAddValue(BattleProp, PlusList),
%%	NewBattleProp1 = battleProp:delBattlePropRateValue(NewBattleProp, MultList),
%%	playerCalcProp:calcBattleProp(NewBattleProp1, false, true),
	playerCalcProp:changeProp_CalcType(PropList, ?EquipOff, true),
	playerForce:calcPlayerForce(IsNotify),
	playerCalcProp:saveBuffProp(BuffID, PlusList, MultiList, del).

%%更新buff属性
-spec updateProp(BuffID :: uint(), PropList :: list(), OldPropList :: list()) -> ok.
updateProp(BuffID, PropList, OldPropList) ->
	deleteProp(BuffID, OldPropList, false),
	addProp(BuffID, PropList, true).

%%更新指定BUFF
-spec tickOneBuff(Now, #recBuff{}) -> ok when
	Now :: uint().
tickOneBuff(Now, #recBuff{effect = Effect, buffID = BuffID, endTime = EndTime, triggerTime = TriggerTime, count = Count} = Buff) ->
	ID = addPlayerBuff(),
	if
		Now >= EndTime andalso EndTime =/= 0 andalso Count =< 0 ->
			removeBuff(Buff);
		(Effect =:= ?SHAPESHIFTE andalso Count =/= 0) orelse
			(Effect =:= ?SHAPESHIFTE andalso EndTime =:= 0 andalso BuffID =/= ID) ->
			?ERROR_OUT("roleID [~p] buff [~p] tick arg error:[~p], [~p]", [playerState:getRoleID(), BuffID, Count, EndTime]),
			removeBuff(Buff);
		Effect =:= ?EXPLODE ->
			skip; %% 爆炸跳过周期性触发，只有死亡时触发
		TriggerTime =/= 0 andalso Now >= TriggerTime ->
			triggerBuff(Buff),
			Cfg = getCfg:getCfgPStack(cfg_buff, BuffID),
			BuffDelay = Cfg#buffCfg.buffDelay,
			if
				BuffDelay > 0 ->
					BuffList = playerState:getBuffList(),
					NewBuff = Buff#recBuff{triggerTime = Now + BuffDelay, count = Count - 1},
					NewBuffList = updateOneBuff(NewBuff, BuffList),
					playerState:setBuffList(NewBuffList);
				true ->
					skip
			end;
		true ->
			skip
	end,
	ok.

%%广播buff效果变化
-spec broadcastBuffEffect(BuffID, SkillID, Level, Counter, Type, Serial) -> ok when
	BuffID :: uint(),
	SkillID :: uint(),
	Level :: uint(),
	Counter :: uint(),
	Type :: uint(),
	Serial :: uint().
broadcastBuffEffect(BuffID, SkillID, Level, Counter, Type, Serial) ->
	Code = playerState:getPlayerCode(),
	List = lists:seq(132, 147) ++ [55, 63, 64, 65, 107],
	case lists:member(BuffID, List) of
		true ->
			if
				Type =:= 0 ->
					?LOG_OUT("code ~p add buff ~p , counter is ~p", [Code, BuffID, Counter]);
				Type =:= 1 ->
					?LOG_OUT("code ~p remove buff ~p, counter is ~p", [Code, BuffID, Counter]);
				true ->
					?LOG_OUT("code ~p replace buff ~p, counter is ~p", [Code, BuffID, Counter]),
					ok
			end;
		_ ->
			skip
	end,
	Msg =
		#pk_GS2U_BuffInfo{
			code = Code,
			buffUID = Counter,
			buffID = BuffID,
			serial = Serial,
			skillID = SkillID,
			level = Level,
			flag = Type
		},
%%	?DEBUG_OUT("broadcastBuffEffect,~p",[Msg]),
	playerMsg:sendMsgToNearPlayer(Msg, true),
	ok.

%%广播客服端buff伤害
-spec broadcastBuffDamage(BuffID, Counter, BuffDamage) -> ok when
	BuffID :: uint(),
	Counter :: uint(),
	BuffDamage :: float().
broadcastBuffDamage(BuffID, Counter, BuffDamage) ->
	CasterCode = playerState:getPlayerCode(),
	CurHp = playerState:getCurHp(),
	MaxHp = playerState:getMaxHp(),
	HpPer = skill:getPercent(CurHp, MaxHp),
	%%?DEBUG_OUT("code ~p has ~p buff hurt is ~p~n",[CasterCode, BuffID, BuffDamage]),
	playerMsg:sendMsgToNearPlayer(#pk_GS2U_BuffHurt{
		code = CasterCode,
		buffUID = Counter,
		buffID = BuffID,
		hp_per = HpPer,
		damageHp = BuffDamage
	}, true).

%%buff伤害计算
buffHurt(
	#recBuffInfo{damageMultiply = DamageMultiply, damagePlus = DamagePlus} = BuffData
) ->
	case buff:isCalcHurt(DamagePlus, DamageMultiply) of
		true ->
			AbsorbValue = playerState:getAbsorbShield(),
			{TargetTotalDamage,NewAbsorbValue} = buff:calcBuffDamageToMe(
				BuffData
				, playerState:getPlayerCode()
				, AbsorbValue
				, playerState:getLevel()
				, playerCalcProp:getBattleProp()
			),
			playerState:setAbsorbShield(NewAbsorbValue),
			erlang:trunc(TargetTotalDamage);
		_ ->
			0
	end;
buffHurt(
	#recBuff{damageMultiply = DamageMultiply, damagePlus = DamagePlus} = Buff
) ->
	case buff:isCalcHurt(DamagePlus, DamageMultiply) of
		true ->
			BuffData = buff:makeBuffInfoFromBuff(Buff),
			buffHurt(BuffData);
		_ ->
			0
	end.

%%判断buff是否存在
-spec isExist(BuffID) -> boolean() when
	BuffID :: uint().
isExist(BuffID) ->
	BuffList = playerState:getBuffList(),
	lists:keymember(BuffID, #recBuff.buffID, BuffList).

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
-spec triggerBuff(#recBuff{}) -> ok.
triggerBuff(Buff) ->
	Cfg = getCfg:getCfgPStack(cfg_buff, Buff#recBuff.buffID),
	doTriggerBuff(
		Buff, Cfg,
		Cfg#buffCfg.damageType =/= ?SkillDamageTypeMedicine
	),
	ok.

doTriggerBuff(Buff, Cfg, false) ->
	NewBuff = Buff#recBuff{
		damage =  buffHurt(Buff)
	},
	addEffect(NewBuff, Cfg);
doTriggerBuff(Buff, Cfg, true) ->
	Hp = playerState:getCurHp(),
	case Hp > 0 of
		true ->
			BuffDamage = buffHurt(Buff),
			case BuffDamage > 0 of
				true ->
					NewHp = Hp - BuffDamage,
					?DEBUG_OUT("player[~p] trigger buff [~p],andalso hurt is ~p",
						[Buff#recBuff.casterCode, Buff#recBuff.buffID, BuffDamage]),
					case NewHp > 0 of
						true ->
							playerState:setCurHp(NewHp),
							broadcastBuffDamage(
								Buff#recBuff.buffID,
								Buff#recBuff.counter,
								-(BuffDamage)
							),
							addEffect(Buff, Cfg);
						_ ->
							playerState:setCurHp(0),
							broadcastBuffDamage(
								Buff#recBuff.buffID,
								Buff#recBuff.counter,
								-(BuffDamage)
							),
							addEffect(Buff, Cfg),
							case isDeathDelete(Cfg#buffCfg.buffDeathdel) of
								true ->
									removeBuff(Buff);
								_ ->
									skip
							end,
							playerBattle:onDead(
								Buff#recBuff.casterCode,
								Buff#recBuff.casterPid,
								Buff#recBuff.casterType,
								Buff#recBuff.casterName,
								Buff#recBuff.skillID
							)
					end;
				_ ->
					addEffect(Buff, Cfg)
			end;
		_ ->
			skip
	end.

%%buff效果
-spec addEffect(#recBuff{}, #buffCfg{}) -> ok.

%%默认效果
addEffect(#recBuff{effect = ?DEFAULT}, #buffCfg{}) ->
	ok;

%%无敌效果
addEffect(#recBuff{effect = ?INVINCIBLE}, #buffCfg{}) ->
	%%delBuff(?BuffTypeSub, 0), 
	playerState:addStatus(?CreatureSpeStautsInvincible);

%%睡眠效果
addEffect(#recBuff{effect = ?SLEEP}, #buffCfg{}) ->
	playerMove:stopMove(true),
	playerSkill:breakUseSkill(true),
	playerState:addStatus(?CreatureSpeStatusComa);

%%冰冻效果
addEffect(#recBuff{effect = ?FREEZE}, #buffCfg{}) ->
	playerMove:stopMove(true),
	playerSkill:breakUseSkill(true),
	playerState:addStatus(?CreatureSpeStautsFreeze);

%%形变效果
addEffect(#recBuff{effect = ?RESHAPE}, #buffCfg{}) ->
	playerSkill:breakUseSkill(true),
	playerState:addStatus(?CreatureSpeStautsDeformation);

%%沉默效果
addEffect(#recBuff{effect = ?SLIENCE}, #buffCfg{}) ->
	case playerState:getCurUseSlowSkill() of
		#recCurUseSkill{skillID = SkillID} ->
			#skillCfg{skillSchool = School} = getCfg:getCfgPStack(cfg_skill, SkillID),
			case School =:= ?SkillMagic of
				true ->
					playerSkill:breakUseSkill(true);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	playerState:addStatus(?CreatureSpeStautsSilence);

%%缴械效果
addEffect(#recBuff{effect = ?DISARM}, #buffCfg{}) ->
	case playerState:getCurUseSlowSkill() of
		#recCurUseSkill{skillID = SkillID} ->
			#skillCfg{weaponNeed = WeaponNeed} = getCfg:getCfgPStack(cfg_skill, SkillID),
			if
				WeaponNeed >= 1 andalso WeaponNeed =< 4 ->
					playerSkill:breakUseSkill(true);
				true ->
					skip
			end;
		_ ->
			skip
	end,
	playerState:addStatus(?CreatureSpeStautsDisarm);

%%减速效果
addEffect(#recBuff{effect = ?SLOWDOWN}, #buffCfg{}) ->
	ok;
%%PK保护效果
addEffect(#recBuff{effect = ?PKPROTECT}, #buffCfg{}) ->
	playerState:addStatus(?CreatureSpeStautsPkProtect);

%%获取触发技能效果
addEffect(#recBuff{effect = ?GETTRISKILL, level = Level}, #buffCfg{} = Cfg) ->
	B1 = Cfg#buffCfg.buffParam1,
	B2 = Cfg#buffCfg.buffParam2,
	B3 = Cfg#buffCfg.buffParam3,
	B4 = Cfg#buffCfg.buffParam4,
	[playerSkill:addTriggerSkill(SkillID, Level) || SkillID <- [B1, B2, B3, B4]],
	ok;

%%属性转换
addEffect(#recBuff{counter = BuffUID, buffID = BuffID, effect = ?PROPCONVERT}, #buffCfg{} = Cfg) ->
	B1 = Cfg#buffCfg.buffParam1,
	B2 = Cfg#buffCfg.buffParam2,
	B3 = Cfg#buffCfg.buffParam3,
	B4 = Cfg#buffCfg.buffParam4,
	delOldConvert(BuffUID, BuffID),
	BattleProp = playerCalcProp:getBattleProp(),
	PropValue = battleProp:getBattlePropTotalValue(BattleProp, B1),
	ConvertValue = PropValue * B3,
	put({oldConvert, BuffUID}, {B2, B4, ConvertValue}),
	{AddProps, MultiProps} =
		case B4 =:= 0 of
			true ->
				playerCalcProp:saveBuffProp(BuffID, [{B2, ConvertValue}], [], add),
				{[{B2, ConvertValue}], []};
			_ ->
				playerCalcProp:saveBuffProp(BuffID, [], [{B2, ConvertValue}], add),
				{[], [{B2, ConvertValue}]}
		end,
	playerCalcProp:changeProp_AddMulti(AddProps, MultiProps, ?EquipOn, true);

%%红名buff
addEffect(#recBuff{effect = ?RedName}, #buffCfg{}) ->
	playerState:addStatus(?CreatureSpecStautsRedName);

%%buff伤害转换效果
addEffect(#recBuff{effect = ?CONVERT} = Buff, #buffCfg{buffParam1 = B1}) ->
	Hp = playerState:getCurHp(),
	Max = playerState:getMaxHp(),
	HpConvert = (Buff#recBuff.damage * Buff#recBuff.layer * B1),
	NewHp = erlang:trunc(misc:clamp(Hp + HpConvert, 0, Max)),
	playerBattle:noticeBlood(NewHp, Hp),
	broadcastBuffDamage(Buff#recBuff.buffID, Buff#recBuff.counter, HpConvert),
	playerState:setCurHp(NewHp);

%%修改生命值效果
addEffect(#recBuff{effect = ?MODIFYHP, casterCode = Code, casterPid = Pid, casterName = Name, casterType = Type, skillID = SkillID} = Buff, #buffCfg{buffParam1 = B1, buffParam2 = B2}) ->
	Hp = playerState:getCurHp(),
	MaxHp = playerState:getMaxHp(),
	GetHealthFactor = playerState:getBattlePropTotal(?Prop_GetHealthFactor),
	ModifyValue = B1 + MaxHp * B2,
	ModifyHp =
		case ModifyValue > 0 of
			true ->
				ModifyValue * GetHealthFactor;
			_ ->
				ModifyValue
		end,

	NewHp = erlang:trunc(misc:clamp(ModifyHp + Hp, 0, MaxHp)),
	playerBattle:noticeBlood(NewHp, Hp),
	playerState:setCurHp(NewHp),
	case NewHp > 0 of
		true ->
			skip;
		_ when Hp /= NewHp ->
			broadcastBuffDamage(Buff#recBuff.buffID, Buff#recBuff.counter, ModifyHp),
			playerBattle:onDead(Code, Pid, Type, Name, SkillID);

		_ ->
			skip
	end,
	ok;

%%修改魔法值效果
addEffect(#recBuff{effect = ?MODIFYMP}, #buffCfg{buffParam1 = B1, buffParam2 = B2}) ->
	ok;
%%	Mp = playerState:getCurMp(),
%%	MaxMp = playerState:getBattlePropTotal(?Prop_mana),
%%	NewMp = Mp - B1 - MaxMp * B2,
%%	playerState:setCurMp(NewMp);

%%虚无效果
addEffect(#recBuff{effect = ?BLUR}, #buffCfg{}) ->
	playerState:addStatus(?CreatureSpeStautsBlur);

%%伤害吸收效果
addEffect(#recBuff{effect = ?HURTABSORB}, #buffCfg{} = Cfg) ->
	B1 = Cfg#buffCfg.buffParam1,
	B2 = Cfg#buffCfg.buffParam2,
	B3 = Cfg#buffCfg.buffParam3,
	AbsorbValue = (B1 + B2 * B3) * playerState:getBattlePropTotal(?Prop_AbsorbShield),
	playerState:setAbsorbShield(AbsorbValue),
	?DEBUG_OUT("buff = ~p, AbsorbValue = ~p", [Cfg#buffCfg.buffId, AbsorbValue]),
	ok;

%%变身效果
addEffect(#recBuff{effect = ?SHAPESHIFTE}, #buffCfg{}) ->
	ok;
%%	playerState:addStatus(?CreatureSpeStautsShapeShifte);

%%变身获得技能效果
addEffect(#recBuff{effect = ?SHAPESKILL}, #buffCfg{}) ->
	ok;

%%修改能量值效果
addEffect(#recBuff{effect = ?MODIFYENERGY}, #buffCfg{buffParam1 = B1, buffParam2 = B2}) ->
	Carrer = playerState:getCareer(),
	case Carrer =:= B1 of
		true ->
			PowerEnergy = playerBase:getSpecBattlePropPower(),
			MaxEnergy = playerBase:getMaxSpecBattlePropPower(),
			CurEnergy = misc:clamp(B2 + PowerEnergy, 0, MaxEnergy),
			playerBase:setSpecBattlePropPower(CurEnergy),
			playerBase:sendPropSp(trunc(CurEnergy), trunc(PowerEnergy));
		_ ->
			skip
	end,
	ok;
%%免疫效果
addEffect(#recBuff{effect = ?IMMUNE}, #buffCfg{} = _Cfg) ->
	%%B1 = Cfg#buffCfg.buffParam1,
	%%B2 = Cfg#buffCfg.buffParam2,
	%%B3 = Cfg#buffCfg.buffParam3,
	%%B4 = Cfg#buffCfg.buffParam4,
	%%[delBuffByState(State) || State <- [B1, B2, B3, B4]],
	playerState:addStatus(?CreatureSpecStautsImmune),
	ok;

%%免疫抓取,击退效果
addEffect(#recBuff{effect = ?IMMUNEEFFECT}, #buffCfg{}) ->
	playerState:addStatus(?CreatureSpecStautsImmuneShift);

%%不受控制效果
addEffect(#recBuff{effect = ?NOCONTROL}, #buffCfg{}) ->
	playerState:addStatus(?CreatureSpeStautsNoControl);

%%获取调用技能
addEffect(#recBuff{effect = ?CALLSKILL, level = Level}, #buffCfg{buffParam1 = B1}) ->
	playerSkill:addBuffCallSkill(B1, Level);

%%定身
addEffect(#recBuff{effect = ?FIXEDBODY}, #buffCfg{}) ->
	playerState:addStatus(?CreatureSpeStautsFixed);

%%嘲讽
addEffect(#recBuff{effect = ?RIDICULE}, #buffCfg{}) ->
	playerState:addStatus(?CreatureSpecStautsRidicule);

%% 爆炸
addEffect(#recBuff{effect = ?EXPLODE}, #buffCfg{buffParam1 = BuffIDSelf, buffParam2 = BuffIDOther, buffParam3 = TarNum}) ->
%%	?DEBUG_OUT("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx EXPLODE -1 "),
	case playerState:getMapPlayerEts() of
		undefined ->
			skip;
		PlayerEts ->
			%% 给RP玩家同步
			MapPid = playerState:getMapPid(),
			GroupID = playerState:getGroupID(),
			GuildID = playerState:getGuildID(),
			CasterCode = playerState:getPlayerCode(),
			CasterName = playerState:getName(),
			PlayerLevel = playerState:getLevel(),
			{X, Y} = playerState:getPos(),
			?DEBUG_OUT("EXPLODE getter:~ts, code=~p, playerid=~p, mapID=~p,guildid=~p",
				[CasterName, CasterCode, playerState:getRoleID(), playerState:getMapID(), GuildID]),

			case mapView:getNearViewObject(MapPid, PlayerEts, ?ObjTypePlayer, {X, Y}, GroupID) of
				List when List =/= [] ->
					TarList = lists:filter(
						fun(#recMapObject{guild = Gid, code = ObjectCode}) ->
							if
								ObjectCode =:= CasterCode ->
									false;
								Gid =:= 0 ->
									true;
								true ->
									GuildID /= Gid
							end
						end, List),
					TarLen = length(TarList),
					KillNum = misc:clamp(TarNum, 1, 5),
					NewTarList = case TarLen =< KillNum of
						             true ->
							             TarList;
						             _ ->
							             misc:randUniqueFromList(KillNum, TarList)
					             end,

					?DEBUG_OUT("EXPLODE excute, tarNum=~p, len=~p, tarList=~p", [TarNum, TarLen, NewTarList]),
					psMgr:sendMsg2PS(self(), addBuff, {PlayerLevel, BuffIDSelf}),
					MakeNameF =
						fun(#recMapObject{pid = PlayerPid, name = Name}, Acc) ->
							psMgr:sendMsg2PS(PlayerPid, addBuffWithCode, {PlayerLevel, BuffIDOther, {CasterCode, self(), CasterName}}),
							[Name | Acc]
						end,
					NameList = lists:foldl(MakeNameF, [], NewTarList),

					case length(NameList) > 0 of
						true ->
							NewNameList = makeArg(KillNum - TarLen, [CasterName | NameList], ""),
							NoticeMsg = stringCfg:getString(guildGrabboomkilltips, NewNameList),
							core:sendBroadcastNotice(NoticeMsg);
						_ ->
							skip
					end,
					ok;
				_ ->
					skip
			end,
			ok
	end;


addEffect(_, _) ->
	ok.

%%
makeArg(N, TL, _Default) when N =< 0 ->
	TL;
makeArg(N, TL, Default) ->
	makeArg(N - 1, TL ++ [Default], Default).


%%移除buff效果，属性
-spec delEffect(Buff, BuffList) -> ok when
	Buff :: #recBuff{}, BuffList :: list().
delEffect(Buff, BuffList) ->
	Cfg = getCfg:getCfgPStack(cfg_buff, Buff#recBuff.buffID),
	delEffect(Buff, Cfg, BuffList).

%%移除无敌
delEffect(#recBuff{effect = ?INVINCIBLE}, #buffCfg{}, BuffList) ->
	case isRemoveEff(?INVINCIBLE, BuffList) of
		true ->
			playerState:clearStatus(?CreatureSpeStautsInvincible);
		_ ->
			skip
	end,
	ok;

%%移除睡眠
delEffect(#recBuff{effect = ?SLEEP}, #buffCfg{}, BuffList) ->
	case isRemoveEff(?SLEEP, BuffList) of
		true ->
			playerState:clearStatus(?CreatureSpeStatusComa);
		_ ->
			skip
	end,
	ok;

%%移除冰冻
delEffect(#recBuff{effect = ?FREEZE}, #buffCfg{}, BuffList) ->
	case isRemoveEff(?FREEZE, BuffList) of
		true ->
			playerState:clearStatus(?CreatureSpeStautsFreeze);
		_ ->
			skip
	end,
	ok;

%%移除形变
delEffect(#recBuff{effect = ?RESHAPE}, #buffCfg{}, BuffList) ->
	case isRemoveEff(?RESHAPE, BuffList) of
		true ->
			playerState:clearStatus(?CreatureSpeStautsDeformation);
		_ ->
			skip
	end,
	ok;

%%移除沉默
delEffect(#recBuff{effect = ?SLIENCE}, #buffCfg{}, BuffList) ->
	case isRemoveEff(?SLIENCE, BuffList) of
		true ->
			playerState:clearStatus(?CreatureSpeStautsSilence);
		_ ->
			skip
	end,
	ok;

%%移除缴械
delEffect(#recBuff{effect = ?DISARM}, #buffCfg{}, BuffList) ->
	case isRemoveEff(?DISARM, BuffList) of
		true ->
			playerState:clearStatus(?CreatureSpeStautsDisarm);
		_ ->
			skip
	end,
	ok;

%%移除虚无
delEffect(#recBuff{effect = ?BLUR}, #buffCfg{}, BuffList) ->
	case isRemoveEff(?BLUR, BuffList) of
		true ->
			playerState:clearStatus(?CreatureSpeStautsBlur);
		_ ->
			skip
	end,
	ok;
%%移除减速
delEffect(#recBuff{effect = ?SLOWDOWN}, #buffCfg{}, _BuffList) ->
	ok;

%%移除PK保护
delEffect(#recBuff{effect = ?PKPROTECT}, #buffCfg{}, BuffList) ->
	case isRemoveEff(?PKPROTECT, BuffList) of
		true ->
			playerState:clearStatus(?CreatureSpeStautsPkProtect);
		_ ->
			skip
	end,
	ok;

%%移除红名buff
delEffect(#recBuff{effect = ?RedName}, #buffCfg{}, BuffList) ->
	case isRemoveEff(?RedName, BuffList) of
		true ->
			playerState:clearStatus(?CreatureSpecStautsRedName);
		_ ->
			skip
	end,
	ok;

%%移除变身
delEffect(#recBuff{effect = ?SHAPESHIFTE}, #buffCfg{}, BuffList) ->
	case isRemoveEff(?SHAPESHIFTE, BuffList) of
		true ->
			playerState:clearStatus(?CreatureSpeStautsShapeShifte);
		_ ->
			skip
	end,
	ok;

%%移除免疫
delEffect(#recBuff{effect = ?IMMUNE}, #buffCfg{}, BuffList) ->
	case isRemoveEff(?IMMUNE, BuffList) of
		true ->
			playerState:clearStatus(?CreatureSpecStautsImmune);
		_ ->
			skip
	end,
	ok;

%%移除抓取等免疫
delEffect(#recBuff{effect = ?IMMUNEEFFECT}, #buffCfg{}, BuffList) ->
	case isRemoveEff(?IMMUNEEFFECT, BuffList) of
		true ->
			playerState:clearStatus(?CreatureSpecStautsImmuneShift);
		_ ->
			skip
	end,
	ok;

%%移除不受控制
delEffect(#recBuff{effect = ?NOCONTROL}, #buffCfg{}, BuffList) ->
	case isRemoveEff(?NOCONTROL, BuffList) of
		true ->
			playerState:clearStatus(?CreatureSpeStautsNoControl);
		_ ->
			skip
	end,
	ok;

%%移除定身
delEffect(#recBuff{effect = ?FIXEDBODY}, #buffCfg{}, BuffList) ->
	case isRemoveEff(?FIXEDBODY, BuffList) of
		true ->
			playerState:clearStatus(?CreatureSpeStautsFixed);
		_ ->
			skip
	end,
	ok;

%%移除嘲讽
delEffect(#recBuff{effect = ?RIDICULE}, #buffCfg{}, BuffList) ->
	case isRemoveEff(?RIDICULE, BuffList) of
		true ->
			playerState:clearStatus(?CreatureSpecStautsRidicule);
		_ ->
			skip
	end,
	ok;

%%移除buff获取的触发技能
delEffect(#recBuff{effect = ?GETTRISKILL}, #buffCfg{} = Cfg, _BuffList) ->
	B1 = Cfg#buffCfg.buffParam1,
	B2 = Cfg#buffCfg.buffParam2,
	B3 = Cfg#buffCfg.buffParam3,
	B4 = Cfg#buffCfg.buffParam4,
	[playerSkill:delTriggerSkill(SkillID) || SkillID <- [B1, B2, B3, B4]],
	ok;

%%移除buff转换属性
delEffect(#recBuff{counter = BuffUID, buffID = BuffID, effect = ?PROPCONVERT}, #buffCfg{}, _BuffList) ->
	delOldConvert(BuffUID, BuffID);

%%移除buff调用技能
delEffect(#recBuff{effect = ?CALLSKILL}, #buffCfg{buffParam1 = B1}, _BuffList) ->
	playerSkill:delBuffCallSkill(B1);

%%移除伤害吸收效果
delEffect(#recBuff{effect = ?HURTABSORB}, #buffCfg{} = Cfg, _BuffList) ->
	?DEBUG_OUT("buff = ~p, delAbsor", [Cfg#buffCfg.buffId]),
	delOldAbsor();

delEffect(_, _, _) ->
	ok.


%%是否移除当前效果
-spec isRemoveEff(Eff, BuffList) -> boolean() when
	Eff :: uint(),
	BuffList :: list().
isRemoveEff(Eff, BuffList) ->
	BuffNum = getBuffNum(Eff, BuffList),
	case BuffNum > 1 of
		true ->
			false;
		_ ->
			true
	end.

%%根据状态获取buff数量
-spec getBuffNum(Effect, BuffList) -> uint() when
	Effect :: uint(),
	BuffList :: list().
getBuffNum(Effect, BuffList) ->
	Fun = fun(#recBuff{effect = Eff}, Num) ->
		case Eff =:= Effect of
			true ->
				Num + 1;
			_ ->
				Num
		end
	      end,
	lists:foldl(Fun, 0, BuffList).


%%删除转换前效果改变的属性
-spec delOldConvert(BuffUID :: uint(), BuffID :: uint()) -> ok.
delOldConvert(BuffUID, BuffID) ->
	case get({oldConvert, BuffUID}) of
		undefined ->
			skip;
		{Prop, MultiOrPlus, OldValue} ->
			put({oldConvert, BuffUID}, undefined),
			{AddProps, MultiProps} =
				case MultiOrPlus =:= 0 of
					true ->
						playerCalcProp:saveBuffProp(BuffID, [{Prop, -OldValue}], [], del),
						{[{Prop, OldValue}], []};
					_ ->
						playerCalcProp:saveBuffProp(BuffID, [], [{Prop, OldValue}], del),
						{[], [{Prop, OldValue}]}
				end,
			playerCalcProp:changeProp_AddMulti(AddProps, MultiProps, ?EquipOff, true)
	end,
	ok.

%%删除上次吸收盾属性值
-spec delOldAbsor() -> ok.
delOldAbsor() ->
	playerState:setAbsorbShield(0),
%%	BattleProp = playerCalcProp:getBattleProp(),
%%	case get(oldAbsor) of
%%		undefined ->
%%			skip;
%%		OldValue ->
%%			put(oldAbsor, undefined),
%%			NewBattleProp = battleProp:addBattlePropAddValue(BattleProp, [{?Prop_absorbshield, -OldValue}]),
%%			playerCalcProp:calcBattleProp(NewBattleProp, false, true),
%%
%%			CurAbsor = playerState:getAbsorbShield(),
%%			MaxAbsor = playerState:getBattlePropTotal(?Prop_absorbshield),
%%			case CurAbsor >= MaxAbsor of
%%				true ->
%%					playerState:setAbsorbShield(MaxAbsor);
%%				_ ->
%%					skip
%%			end
%%	end,
	ok.


%% 死亡触发
triggerBuffOnDead() ->
	BuffList = playerState:getBuffList(),
	Fun =
		fun(#recBuff{buffID = BuffID} = Buff) ->
%%			?DEBUG_OUT("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx deadTriggerBuff buff - 1:~p:effect:~p ", [BuffID, Buff#recBuff.effect]),
			Cfg = getCfg:getCfgPStack(cfg_buff, BuffID),
			deadTriggerBuff(Buff, Cfg)
		end,
	lists:foreach(Fun, BuffList),
	ok.

deadTriggerBuff(#recBuff{buffID = BuffID, effect = ?EXPLODE} = Buff, Cfg) ->
%%	?DEBUG_OUT("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx deadTriggerBuff buff - 2:~p ", [Buff]),
	delBuff(BuffID),
	addEffect(Buff, Cfg);
deadTriggerBuff(_Buff, _Cfg) ->
	skip.
