%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 机器人战斗模块
%%% @end
%%% Created : 25. 四月 2017 16:11
%%%-------------------------------------------------------------------
-module(playerRobBattle).
-author(tiancheng).

-include("playerPrivate.hrl").
-include("rob.hrl").

-define(RobRoleNormalSkillCDTime, 1000). %% ms
-define(RobUseItemCDTime, 5).   % 机器人回复血量CD时间

%% API
-export([
	rob_battle_init/0,
	rob_dead/1,
	rob_battle_tick/0
]).

rob_battle_tick() ->
	case playerState:getCurHp() > 0 of
		true ->
			rob_battle_tick(playerRob:getRobType());
		_ ->
			skip
	end.

rob_dead({?Ladder1v1MapID, MapPID, AttackRoleID, DeadRoleID, RobRoleID}) ->
	psMgr:sendMsg2PS(?PsNameLadder1v1, killedTarget, {MapPID, AttackRoleID, DeadRoleID, RobRoleID}),
	ok;
rob_dead(_Data) ->
	ok.

rob_battle_tick(?RobType_Ladder1v1) ->
	TargetCode = playerPropSync:getProp(?SerProp_RobRoleTargetCode),
	case getTargetCodeObject(TargetCode) of
		#recMapObject{} = Target ->
			%% 机器人战斗
			rob_battle(Target),

			%% 宠物战斗
			robPet_battle(Target),
			ok;
		_ ->
			skip
	end,
	ok;
rob_battle_tick(?RobType_NormalMap) ->
	ok;
rob_battle_tick(?RobType_NormalMapFollow) ->
	TargetCode = playerPropSync:getProp(?SerProp_RobRoleTargetCode),
	case getTargetCodeObject(TargetCode) of
		#recMapObject{x = TX, y = TY} ->
			{UseSkillTime, _SkillCD} = playerPropSync:getProp(?SerProp_RobSkillCD),
			Time = time2:getTimestampMS(),
			Diff = Time - UseSkillTime,

			{SX, SY} = playerState:getPos(),
			SelfCode = playerState:getPlayerCode(),
			case moveToTarget(5, SX, SY, TX, TY, SelfCode, Diff) of
				true ->
					playerPropSync:setAny(?SerProp_RobSkillCD, {Time, 0});
				_ ->
					skip
			end,
			ok;
		_ ->
			skip
	end,
	ok;
rob_battle_tick(?RobType_CopyMap) ->
	TargetCode = playerPropSync:getProp(?SerProp_RobRoleTargetCode),
	case getTargetCodeObject(TargetCode) of
		#recMapObject{} = Target ->
			%% 机器人战斗
			rob_battle(Target),

			%% 宠物战斗
			robPet_battle(Target),
			ok;
		_ ->
			%% 筛选怪物目标
			NewCode = getMonsterTargetCode(),
			playerPropSync:setInt64(?SerProp_RobRoleTargetCode, NewCode),
			skip
	end,
	ok;
rob_battle_tick(_Type) ->
	ok.

rob_battle_init() ->
	?DEBUG_OUT("rob_battle_init:~p", [playerState:getPlayerCode()]),
	SkillIDs = getSkill(),
	Min = getMinRanger(SkillIDs, 7.5),
	playerPropSync:setAny(?SerProp_RobSkillListAndMinAttackLen, {SkillIDs, float(Min)}),
	playerPropSync:setAny(?SerProp_RobRoleTargetXY, []),
	playerPropSync:setInt64(?SerProp_RobRoleUseItemTime, 0),

	CallList = playerState:getCallPet(),
	F =
		fun(#recCallPet{pet_id = ID, pet_type = Type}, {AccSkills, AccMin}) ->
			PetSkillIDs = getPetSkillIDList(ID, Type),
			MinLen = getMinRanger(PetSkillIDs, 7.5),
			{PetSkillIDs ++ AccSkills, erlang:min(MinLen, AccMin)}
		end,
	PetSkillListAndMinAttackLen = lists:foldl(F, {[], 10}, CallList),
	playerPropSync:setAny(?SerProp_RobPetSkillListAndMinAttackLen, PetSkillListAndMinAttackLen),
	ok.

getMonsterTargetCode() ->
	Ets = playerState:getMapMonsterEts(),
	F =
		fun(#recMapObject{code = Code, camp = TargetCamp, guild = TargetGuildID}, Acc) ->
			case codeMgr:getObjectTypeByCode(Code) of
				?ObjTypeMonster ->
					SelfCamp = playerState:getCamp(),
					SelfGuildID = playerState:getGuildID(),
					case camp:getPveCampRelation(SelfCamp, TargetCamp,
						SelfGuildID > 0 andalso TargetGuildID =:= SelfGuildID) of
						2 ->
							[Code | Acc];
						_ ->
							Acc
					end;
				_ ->
					Acc
			end
		end,
	case ets:foldl(F, [], Ets) of
		[] -> 0;
		List ->
			lists:nth(misc:rand(1, erlang:length(List)), List)
	end.

%% 镜像机器人战斗
-spec rob_battle(#recMapObject{}) -> ok.
rob_battle(#recMapObject{id = _ID, x = TX, y = TY} = Target) ->
	{UseSkillTime, SkillCD} = playerPropSync:getProp(?SerProp_RobSkillCD),
	Time = time2:getTimestampMS(),
	Diff = Time - UseSkillTime,

	case Diff >= SkillCD of
		true ->
			{_, Min} = getAndFreshSkills(?SerProp_RobSkillListAndMinAttackLen, false),
			{SX, SY} = playerState:getPos(),
			SelfCode = playerState:getPlayerCode(),
			case moveToTarget(Min, SX, SY, TX, TY, SelfCode, Diff) of
				true ->
					Ets = playerState:getMapPlayerEts(),
					[#recMapObject{} = Self] = myEts:lookUpEts(Ets, SelfCode),

					%% 再使用技能
					{SkillIDs, _} = getAndFreshSkills(?SerProp_RobSkillListAndMinAttackLen, true),
					CD =
						case useSkill(SkillIDs, false, {Target, Self}) of
							false ->
								0;
							SkillID ->
								case getCfg:getCfgByKey(cfg_skill, SkillID) of
									#skillCfg{skill_GlobeCoolDown = C, effects = Effects} when C > 0 ->
										skillEffect(SkillID, Effects, SX, SY, TX, TY),
										C;
									_ ->
										?RobRoleNormalSkillCDTime
								end
						end,
					playerPropSync:setAny(?SerProp_RobSkillCD, {Time, CD}),
					ok;
				_ ->
					skip
			end;
		_ ->
			skip
	end,

	%% 回复气血
%%	revertHp(),
	ok.

skillEffect(_SkillID, Effects, SX, SY, TX, TY) when erlang:is_list(Effects) ->
	F =
		fun(Effect, {_, _ET} = Acc) ->
			case getCfg:getCfgByKey(cfg_skill_effect, Effect) of
				#skill_effectCfg{effectType = ?TELEPORTSPRINT} = Cfg ->
					{true, Cfg};
				_ ->
					Acc
			end
		end,
	case misc:foldlEx(F, {false, false}, Effects) of
		{true, #skill_effectCfg{param1 = P1}} ->
			DX = TX - SX,
			DY = TY - SY,
			Dist = math:sqrt(DX * DX + DY * DY),
			Dist2 = Dist - P1,

			MX = SX + DX / Dist * Dist2,
			MY = SY + DY / Dist * Dist2,

%%			?WARN_OUT("AA:~p,~p,~p,~p,~p", [Dist, Dist2, {SX,SY}, {TX, TY}, {MX, MY}]),

			playerState:setPos(MX, MY),
			playerMove:stopMove(false),
			ok;
		_ ->
			skip
	end,
	ok;
skillEffect(_SkillID, Effects, SX, SY, TX, TY) ->
	ok.

%% 机器人的宠物也要战斗
-spec robPet_battle(Target :: #recMapObject{}) -> ok.
robPet_battle(Target) ->
	List = playerState:getCallPet(),
	[robPet_battle(R, Target) || #recCallPet{} = R <- List],
	ok.

robPet_battle(#recCallPet{pet_code = Code}, #recMapObject{x = TX, y = TY} = Target) ->
	PetEts = playerState:getMapPetEts(),
	case myEts:lookUpEts(PetEts, Code) of
		[#recMapObject{x = SX, y = SY} = Self] ->
			{_, MinLen} = getAndFreshSkills(?SerProp_RobPetSkillListAndMinAttackLen, false),
			case moveToTarget(MinLen, SX, SY, TX, TY, Code, 0) of
				true ->
					%% 宠物使用技能
					{SkillIDs, _} = getAndFreshSkills(?SerProp_RobPetSkillListAndMinAttackLen, true),
					useSkill(SkillIDs, false, {Target, Self}),
					ok;
				false ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

getAndFreshSkills(PropType, false) ->
	playerPropSync:getProp(PropType);
getAndFreshSkills(PropType, true) ->
	Ret = playerPropSync:getProp(PropType),
	case Ret of
		{[], _} = V -> V;
		{[SkillID | SkillIDs], Min} ->
			playerPropSync:setAny(PropType, {SkillIDs ++ [SkillID], Min})
	end,
	Ret.

getTargetCodeObject(0) -> false;
getTargetCodeObject(undefined) -> false;
getTargetCodeObject(TargetCode) ->
	Ets =
		case codeMgr:getObjectTypeByCode(TargetCode) of
			?ObjTypePlayer ->
				playerState:getMapPlayerEts();
			?ObjTypeMonster ->
				playerState:getMapMonsterEts()
		end,
	case ets:lookup(Ets, TargetCode) of
		[#recMapObject{hp = Hp} = Target] when Hp > 0 ->
			Target;
		_ ->
			false
	end.

%% 获取宠物的主动技能列表
getPetSkillIDList(PetID, PetType) ->
	SkillIDList =
		case getCfg:getCfgPStack(cfg_pet, PetID) of
			#petCfg{baseSkill = B, addSkill = A, talentSkill = T1, talentSkill2 = T2} ->
				L = getValueList(B) ++ getValueList(A) ++ getValueList(T1) ++ getValueList(T2),
				case PetType of
					?CallPetTypeRMB ->
						L1 = playerState:getPetSkills(PetID),
						L2 = [SID || #recPetSkill{skill_id = SID} <- L1],
						L ++ L2;
					?CallPetTypeSkill ->
						L
				end;
			_ -> []
		end,
	case SkillIDList of
		[] -> [];
		_ ->
			%% 去掉被动技能
			FunFold =
				fun(SkillID, AccList) ->
					case lists:member(SkillID, AccList) of
						false ->
							case getCfg:getCfgPStack(cfg_skill, SkillID) of
								#skillCfg{skillType = Type} ->
									case lists:member(Type, ?ActiveSkillList) of
										true -> [SkillID | AccList];
										_ -> AccList
									end;
								_ -> AccList
							end;
						_ -> AccList
					end
				end,
			lists:foldl(FunFold, [], SkillIDList)
	end.

getValueList(Value) when erlang:is_list(Value) ->
	Value;
getValueList(Value) when erlang:is_integer(Value) andalso Value > 0 ->
	[Value];
getValueList(_Value) ->
	[].

revertHp() ->
	SelfCode = playerState:getPlayerCode(),
	Ets = playerState:getMapPlayerEts(),
	case myEts:lookUpEts(Ets, SelfCode) of
		[#recMapObject{hp = HP, maxHp = MaxHP}] ->
			LastTime = playerPropSync:getProp(?SerProp_RobRoleUseItemTime),
			NowTime = time:getUTCNowSec1970(),
			case NowTime - LastTime >= ?RobUseItemCDTime andalso HP < MaxHP of
				true ->
					Lvl = playerState:getLevel(),
					#globalsetupCfg{setpara = L} = getCfg:getCfgPStack(cfg_globalsetup, jjc_item),
					Fun =
						fun({S, E, _Item}) ->
							Lvl >= S andalso Lvl =< E
						end,
					ItemID = case lists:filter(Fun, L) of
								 [{_, _, I1}] -> I1;
								 _ ->
									 {_, _, I2} = lists:last(L),
									 I2
							 end,

					playerItemEvent:triggerUseItemEvent(#rec_item{itemID = ItemID}, 1),

					%% 记录本次使用时间
					playerPropSync:setInt64(?SerProp_RobRoleUseItemTime, NowTime),
					ok;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

getSkill() ->
	%% 女神技能

	%% 插槽技能
	List = playerState:getSlotSkill(),
	FunMap =
		fun(#recSlotSkill{type = Type, skillID = SkillID}, AccList) ->
			case lists:member(Type, ?ActiveSkillList) of
				true -> [SkillID | AccList];
				_ -> AccList
			end
		end,
	ZDList = lists:foldl(FunMap, [], List),

	%% 获取普攻
	Career = playerState:getCareer(),
	BaseSkill =
		case getCfg:getCfgPStack(cfg_player_desc, Career) of
			#player_descCfg{comboSkillID = Key} ->
				case getCfg:getCfgPStack(cfg_comboSkill, Key) of
					#comboSkillCfg{skills = Skills} ->
						Skills;
					_ -> []
				end;
			_ -> []
		end,
	ZDList ++ BaseSkill.

useSkill([], Ret, _Data) ->
	Ret;
useSkill([SkillID | SkillIDList], false, Data) ->
	case useSkill(SkillID, false, Data) of
		true ->
			SkillID;
		_ ->
			useSkill(SkillIDList, false, Data)
	end;
useSkill([_SkillID | _SkillIDList], SkillID, _Data) ->
	SkillID;
useSkill(SkillID, true, {#recMapObject{}, #recMapObject{}}) when erlang:is_integer(SkillID) ->
	true;
useSkill(SkillID, false, {#recMapObject{} = Target, #recMapObject{code = SelfCode, x = SX, y = SY} = Self}) when erlang:is_integer(SkillID) ->
	Now = time:getUTCNowMS(),
	case codeMgr:isCodeType(?CodeTypePlayer, SelfCode) of
		true ->
			case playerState:getCurUseSlowSkill() of
				#recCurUseSkill{skillID = LastSkillID, serial = Serial, triggerTime = TT} when Now >= TT + 200 ->
					case getTargetCodeList(LastSkillID, Target, Self) of
						[] -> false;
						TargetCodeList ->
							case playerSkill:onUseSkill(LastSkillID, TargetCodeList, Serial, SX, SY) of
								true -> true;
								_ -> false
							end
					end;
				_ ->
					case playerSkill:canUseSkill(SkillID) of
						true ->
							case getTargetCodeList(SkillID, Target, Self) of
								[] -> false;
								TargetCodeList ->
									SN = playerPropSync:getProp(?SerProp_RobRoleSkillSN) + 1,
									playerPropSync:setInt(?SerProp_RobRoleSkillSN, SN),
									case playerSkill:onUseSkill(SkillID, TargetCodeList, SN, SX, SY) of
										true -> true;
										_ -> false
									end
							end;
						_ ->
							false
					end
			end;
		_ ->
			case monsterState:getCurUseSkill(SelfCode) of
				#recCurUseSkill{skillID = LastSkillID, serial = Serial, triggerTime = TT} when Now >= TT + 200 ->
					case getTargetCodeList(LastSkillID, Target, Self) of
						[] -> false;
						TargetCodeList ->
							case monsterSkill:onUsePetSkill(SelfCode, LastSkillID, TargetCodeList, Serial, SX, SY) of
								true -> true;
								_ -> false
							end
					end;
				_ ->
					case monsterSkill:canUseSkill(SelfCode, SkillID) of
						true ->
							case getTargetCodeList(SkillID, Target, Self) of
								[] -> false;
								TargetCodeList ->
									SN = playerPropSync:getProp(?SerProp_RobRoleSkillSN) + 1,
									playerPropSync:setInt(?SerProp_RobRoleSkillSN, SN),
									case monsterSkill:onUsePetSkill(SelfCode, SkillID, TargetCodeList, SN, SX, SY) of
										true -> true;
										_ -> false
									end
							end;
						_ ->
							false
					end
			end
	end.

getTargetCodeList(SkillID, #recMapObject{} = Target, #recMapObject{code = SelfCode, x = SX, y = SY} = Self) ->
	PlayerEts = playerState:getMapPlayerEts(),
	MonsterEts = playerState:getMapMonsterEts(),
	PetEts = playerState:getMapPetEts(),
	Pos = {SX, SY},
	MyTeam = undefined,
	KillList = [],
	#skillCfg{aoe = Aoe, targetSearch = Search} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case getTarget(Search, Self, Target) of
		false ->
%% 			?ERROR_OUT("Skill:skillID=~p, aoe=~p, search=~p, selfname=~ts", [SkillID, Aoe, Search, SelfName]),
			[];
		{#recMapObject{} = RealTarget, FaceDir} ->
			TargetList =
				case Aoe of
					0 ->
						Ret1 = camp:filterTarget(SkillID, MyTeam, KillList, Self, [RealTarget]),
%% 						?DEBUG_OUT("Skill:skillID=~p, search=~p, selfname=~ts, targetname=~ts, target=~p",
%% 							[SkillID, Search, SelfName, RealTargetName, Ret1]),
						Ret1;
					_ ->
						try
							Ret2 = skill:getAOETarget(SelfCode, Pos, FaceDir, PlayerEts, MonsterEts, PetEts, SkillID, RealTarget, MyTeam, KillList),
%% 							?DEBUG_OUT("AOE Skill:skillID=~p, search=~p, selfname=~ts, targetname=~ts, target=~p",
%% 								[SkillID, Search, SelfName, RealTargetName, Ret2]),
							Ret2
						catch
							_:_Why ->
								?ERROR_OUT("getTargetCodeList:Code[~p] Pos [~p] FaceDir [~p] Use Skill [~p] Target is [~p], Why is [~p]",
									[SelfCode, {SX, SY}, FaceDir, SkillID, Target, _Why]),
								[]
						end
				end,
			[Code || #recMapObject{code = Code} <- TargetList]
	end.

getTarget(TargetSearch, #recMapObject{x = Sx, y = Sy, code = SelfCode, ownCode = OwnCode} = Self, #recMapObject{x = Tx, y = Ty} = Target) ->
	if
		TargetSearch =:= ?SingleSkillEnemy -> {Target, {0.01, 0.01}};
		TargetSearch =:= ?SingleSkillMy -> {Self, {0.01, 0.01}};
		TargetSearch =:= ?SingleSkillMyMaster ->
			%% 这个是宠物技能，对自己主人施放
			case erlang:is_integer(OwnCode) andalso OwnCode > 0
				andalso codeMgr:isCodeType(?CodeTypePlayer, OwnCode)
				andalso codeMgr:isCodeType(?CodeTypePet, SelfCode) of
				true ->
					PlayerEts = playerState:getMapPlayerEts(),
					case myEts:lookUpEts(PlayerEts, OwnCode) of
						[#recMapObject{} = Player] -> {Player, {0.01, 0.01}};
						_ -> false
					end;
				_ -> false
			end;
		TargetSearch =:= ?SingleSkillMyPet ->
			%% 这个是玩家技能，对自己宠物施放
			case codeMgr:isCodeType(?CodeTypePlayer, SelfCode) of
				true ->
					case playerState:getCallPetCodeList() of
						[] -> false;
						PetCodeList ->
							Rand = misc:rand(1, erlang:length(PetCodeList)),
							PetCode = lists:nth(Rand, PetCodeList),
							PetEts = playerState:getMapPetEts(),
							case myEts:lookUpEts(PetEts, PetCode) of
								[#recMapObject{} = Pet] -> {Pet, {0.01, 0.01}};
								_ -> false
							end
					end;
				_ -> false
			end;
		TargetSearch =:= ?MutiSkillCirMyEnemy -> {Self, {0.01, 0.01}};
		TargetSearch =:= ?MutiSkillCirMyTeam -> {Self, {0.01, 0.01}};
		TargetSearch =:= ?MutiSkillSecEnemy -> {Self, {0.01, 0.01}};
		TargetSearch =:= ?MutiSkillAngEnemy -> {Self, {0.01, 0.01}};
		TargetSearch =:= ?MutiSkillSecMyEnemy -> {Self, {isZero(Tx - Sx), isZero(Ty - Sy)}};
		TargetSearch =:= ?MutiSkillAngMyEnemy -> {Self, {isZero(Tx - Sx), isZero(Ty - Sy)}};
		TargetSearch =:= ?MutiSkillCirEnemy -> {Target, {0.01, 0.01}};
		TargetSearch =:= ?MutiTranSkillCirMyEnermy -> {Target, {0.01, 0.01}};
		TargetSearch =:= ?MutiTranSkillSecMyEnermy -> {Target, {0.01, 0.01}};
		true -> false
	end.

isZero(Value) when Value == 0 ->
	0.01;
isZero(Value) ->
	Value.

stopMove(false, _) ->
	ok;
stopMove(true, DiffMS) ->
	playerMove:tickMove(DiffMS),
	ok.

moveToTarget(Min, X, Y, TX, TY, Code, DiffMS) ->
	%% 先停止移动
	IsPlayer = codeMgr:isCodeType(?CodeTypePlayer, Code),
	stopMove(IsPlayer, DiffMS),

	RealMin = erlang:max(Min - 0.100001, 0),
	L = playerPropSync:getProp(?SerProp_RobRoleTargetXY),

	DX = X - TX,
	DY = Y - TY,
	Dist = math:sqrt(DX * DX + DY * DY),

	%% 是否已经有目标
	Ret =
		case lists:keyfind(Code, 1, L) of
			{_, _TTX, _TTY} ->
				%% 判断能否放技能
				case trunc(Dist) =< trunc(RealMin) of
					true ->
						%% 到达目标点，停止移动，清空目标
						case IsPlayer of
							true -> playerMove:stopMove(false);
							_ -> monsterInterface:stopMove(Code, X, Y)
						end,

						NL = lists:keydelete(Code, 1, L),
						playerPropSync:setAny(?SerProp_RobRoleTargetXY, NL),
						true;
					_ ->
						false
				end;
			_ ->
				false
		end,

%%	?DEBUG_OUT("YYYYY:~p,~p {~p,~p} -> {~p,~p} ~p,~p,~p", [Code, Ret, X, Y, TX, TY, Dist, Min, RealMin]),

	case Ret of
		true ->
			true;
		_ ->
			%% 需要移动
			case Dist > RealMin of
				true ->
					%% 得到修正的可包围目标点
					{MX, MY} = {TX + DX / Dist * RealMin, TY + DY / Dist * RealMin},

					SQ = math:sqrt(misc:calcDistSquare(X, Y, MX, MY)),
					NQ = ?AllowErrorPosRange - 1,
					{MoveX, MoveY} =
						case SQ > NQ of
							true ->
								%% 超出移动最大范围
								{X + (MX - X) / SQ * NQ, Y + (MY - Y) / SQ * NQ};
							_ ->
								{MX, MY}
						end,

					%%不判断是否是障碍点，添加目标点
					NL2 = lists:keystore(Code, 1, L, {Code, MoveX, MoveY}),
					playerPropSync:setAny(?SerProp_RobRoleTargetXY, NL2),

%%					?DEBUG_OUT("moveToTarget:dist=~p,~p,~p, min=~p, ~p", [Dist, SQ, NQ, RealMin, NL2]),

					%% 移动到目标
					case IsPlayer of
						true ->
							%% 目标协议
							MoveTo = [#pk_PosInfo{x = X, y = Y}, #pk_PosInfo{x = MoveX, y = MoveY}],
							Msg = #pk_U2GS_MoveTo{code = Code, posX = MoveX, posY = MoveY, posInfos = MoveTo},
							playerMove:onPlayerMoveTo(Msg),
							ok;
						_ ->
							monsterInterface:moveTo(Code, MoveX, MoveY)
					end,
					false;
				_ ->
					true
			end
	end.

getMinRanger([], Min) ->
	Min;
getMinRanger([SkillID | List], Min) ->
	NewMin = getMinRanger(SkillID, Min),
	getMinRanger(List, NewMin);
getMinRanger(SkillID, Min) when erlang:is_integer(SkillID) ->
	case getCfg:getCfgPStack(cfg_skill, SkillID) of
		#skillCfg{ranger = Value} when Value < Min andalso Value > 0 -> Value;
		_ -> Min
	end.