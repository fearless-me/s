%%
%% @author zhongyunawei
%% @doc 怪物移动.


-module(monsterMove).
-author(zhongyuanwei).

-include("monsterPrivate.hrl").


%% ====================================================================
%% API functions
%% ====================================================================
-export([
	tickMove/2,
	aiTickMove/1,
	stopMove/2,
	stopMove/3,
	randMove/1,
	towardMove/1,
	moveToTarget/1,
	moveToConvoy/1,
	moveTo/3,
	shiftTo/1,
	notifyMonsterSpeedToClient/1,
	notifyMonsterAttackSpeedToClient/1
]).

-spec tickMove(Code, Diff) -> ok when
	Code :: uint(),
	Diff :: uint().
tickMove(Code, Diff) ->
	case isCanMove(Code) of
		true ->
			MonsterID = monsterState:getId(Code),
			IsUpdateMove =
				case getCfg:getCfgByKey(cfg_monster, MonsterID) of
					#monsterCfg{monsterSubType = ?MonsterSTypeTower} ->
						false;
					#monsterCfg{} ->
						case mapState:getMapSubType() of
							?MapSubTypeMaterial ->
%%								TargetCode = monsterState:getAttackTarget(Code),
%%								case monsterState:isInAttackRange(Code) andalso TargetCode =/= undefined of
%%									true ->
%%										false;
%%									_ ->
										Now =  time:getUTCNowMS(),
										GlobalCD = monsterState:getGlobalCDEndTime(Code),
										LSTime = monsterState:getStartUseSkillTime(Code),
										ATime = monsterState:getFinalAttackIntervalTime(Code),
									(GlobalCD  < Now + 5000 andalso Now  >= LSTime + ATime + 1000) ;
%%								end;
							_ ->
								true
						end;
					_ ->
						true	%% 不是monster
				end,
			if
				IsUpdateMove ->
					updateMove(Code, Diff);
				true ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

aiTickMove(_Code) ->
%%	MonsterID = monsterState:getId(Code),
%%	AttackTargetCode = monsterState:getAttackTarget(Code),
%%	case canTickMove(Code, AttackTargetCode) of
%%		true ->
%%			monsterState:setAttackTarget(Code, undefined),
%%			case isCanMove(Code) of
%%				true ->
%%					if
%%						MonsterID =:= 8301 ->
%%							?ERROR_OUT("###############aiTickMove(~p),cur:~p,~p",
%%								[MonsterID, monsterState:getMonsterPos(Code),monsterState:getMoveTargetList(Code)]);
%%						true ->
%%							skip
%%					end,
%%					Now = time:getUTCNowMS(),
%%					Diff = Now - monsterState:getLastAIMoveTickTime(),
%%					updateMove(Code, Diff),
%%					monsterState:setLastAIMoveTickTime(Now);
%%				_ ->
%%					skip
%%			end;
%%		_ ->
%%			skip
%%	end,
	ok.

%canTickMove(Code, undefined) -> true;
%canTickMove(Code, Target) ->
%	#selSkill{skillID = SkillID} = monsterState:getSelSkill(Code),
%	case canUserSkill(Code, SkillID, getTargetInfo(Code, Target)) of
%		true ->
%			false;
%		_ ->
%			true
%	end.
%
%canUserSkill(Code, SkillID, {TargetCode, TX, TY, ?CreatureActionStatusDead}) ->
%	false;
%canUserSkill(Code, SkillID, {TargetCode, TX, TY, Status}) when erlang:is_integer(SkillID) andalso SkillID > 0 ->
%%% 得到技能范围
%	#skillCfg{ranger = AttackRange} = getCfg:getCfgPStack(cfg_skill, SkillID),
%
%	%% 获取怪物配置
%	MonID = monsterState:getId(Code),
%	#monsterCfg{followRadius = FR, moveSpeed = MS, radius = BodyR} = getCfg:getCfgPStack(cfg_monster, MonID),
%%%	MoveSpeed = float(MS),
%
%	%% 得到怪物当前位置
%	{X, Y} = monsterState:getMonsterPos(Code),
%	MapID = monsterState:getMapID(Code),
%	%% 计算怪物中心到目标的距离
%	DX = X - TX,
%	DY = Y - TY,
%	Dist = math:sqrt(DX * DX + DY * DY),
%
%	%% 怪物边缘与目标的距离（实际距离）
%	RealDist = Dist - BodyR,
%	RealDist > AttackRange;
%canUserSkill(Code, SkillID, {TargetCode, TX, TY, _}) -> false.

%%处理宠物瞬移
-spec shiftTo(Code) -> ok when
	Code :: uint().
shiftTo(Code) ->
	CodeType = monsterState:getCodeType(Code),
	case CodeType =:= ?SpawnCallPet orelse CodeType =:= ?SpawnPet of
		true ->
			PlayerEts = monsterState:getMapPlayerEts(Code),
			CasterInfo = monsterState:getCasterInfo(Code),
			{X, Y} = monsterState:getMonsterPos(Code),
%%			playerMap:syncPlayerToEts(),

			{Dist, CasterTX, CasterTY} =
				case mapView:getMapObjectFromEts(CasterInfo#recCasterInfo.casterCode, {PlayerEts, false, false}) of
					#recMapObject{x = TX, y = TY} ->
						{math:sqrt((TX - X) * (TX - X) + (TY - Y) * (TY - Y)), TX, TY};
					_ ->
						{0, 0, 0}
				end,

			if
				Dist > 30 -> %%直接瞬移过来
					monsterState:setMonsterPos(Code, CasterTX, CasterTY),
					monsterBattle:delBothHate(Code),
					petMoveGrid(Code, float(X), float(Y), float(CasterTX), float(CasterTY), true);
				true ->
					skip
			end;
		_ ->
			skip
	end.

%%随机移动
-spec randMove(Code) -> ok when
	Code :: uint().
randMove(Code) ->
	case monsterState:getAttackTarget(Code) of
		undefined ->
			randMove1(Code);
		0 ->
			randMove1(Code);
		_ ->
			%%战斗状态，不再随机移动了
			skip
	end,
	ok.

%%朝向目标方向移动
-spec towardMove(Code) -> ok when
	Code :: uint().
towardMove(Code) ->
	#recSpawnMonster{other = #recCallCarrier{targetCode = TargetCode}} = monsterState:getSpawnInfo(Code),
	PlayerEts = monsterState:getMapPlayerEts(Code),
	PetEts = monsterState:getMapPetEts(Code),
	MonsterEts = monsterState:getMapMonsterEts(Code),
	{X, Y} = monsterState:getMonsterPos(Code),
	%%随机角度朝向
	A = misc:rand(0, 360),
	RandCos = math:cos(A / 180 * math:pi()),
	RandSin = math:sin(A / 180 * math:pi()),
	%%获取攻击者对象
	case mapView:getMapObjectFromEts(TargetCode, {PlayerEts, MonsterEts, PetEts}) of
		#recMapObject{x = TX, y = TY} ->
			DX = X - TX,
			DY = Y - TY,
			case DX == 0 andalso DY == 0 of
				true ->
					NewX = 0.5,
					NewY = 0.5;
				_ ->
					NewX = DX,
					NewY = DY
			end,
			NewX1 = NewX * RandCos - NewY * RandSin,
			NewY1 = NewX * RandSin + NewY * RandCos,
			L = math:sqrt(NewX1 * NewX1 + NewY1 * NewY1),
			case L /= 0 of
				true ->
					NewX2 = X + NewX1 / L * 100,
					NewY2 = Y + NewY1 / L * 100;
				_ ->
					NewX2 = X + NewX1 / 100,
					NewY2 = Y + NewY1 / 100
			end,
			moveTo(Code, NewX2, NewY2);
		_ ->
			skip
	end.

%%移动到攻击目标
-spec moveToTarget(Code) -> ok when
	Code :: uint().
moveToTarget(Code) ->
%%	?DEBUG_OUT("monster(~w),skill(~w)",[monsterState:getId(Code), monsterState:getSelSkill(Code)]),
	#selSkill{skillID = SkillID} = monsterState:getSelSkill(Code),
	case monsterState:getCodeType(Code) of
		?SpawnCarrier ->
			%%获取载体参数
			#recSpawnMonster{other = #recCallCarrier{targetCode = TargetCode}} = monsterState:getSpawnInfo(Code);
		_ ->
			TargetCode = monsterState:getAttackTarget(Code)

	end,
	moveToTarget1(Code, SkillID, getTargetInfo(Code, TargetCode)),
	ok.

-spec moveToConvoy(Code :: uint64()) -> ok.
moveToConvoy(Code) ->
	case monsterState:getActionStatus(Code) =:= ?CreatureActionStatusMove of
		true ->
			skip;
		_ ->
			case monsterState:getIsConvoy(Code) of
				true ->
					#recSpawnMonster{other = #recCallConvoy{roleCode = TargetCode}} = monsterState:getSpawnInfo(Code),
					case getTargetInfo(Code, TargetCode) of
						{TargetCode, TX, TY, _Status} ->
							{CX, CY} = monsterState:getMonsterPos(Code),
							case trunc(CX) =:= trunc(TX) andalso trunc(CY) =:= trunc(TY) of
								true ->
									skip;
								_ ->
									MonID = monsterState:getId(Code),
									#monsterCfg{moveSpeed = PS} = getCfg:getCfgPStack(cfg_monster, MonID),
									PatrolSpeed = float(PS),
									monsterState:setMoveStatus(Code, ?MonsterMoveStatusWalk),
									monsterState:setMoveSpeed(Code, PatrolSpeed),

									moveTo(Code, TX, TY)
							end;
						_ ->
							skip
					end;
				_ ->
					skip
			end
	end,
	ok.

-spec pursue(Code, MoveX, MoveY, MoveSpeed) -> ok when
	Code :: uint(), MoveX :: float(), MoveY :: float(), MoveSpeed :: float().
pursue(Code, MoveX, MoveY, MoveSpeed) ->
	monsterState:setMoveStatus(Code, ?MonsterMoveStatusRun),
	monsterState:setMoveSpeed(Code, MoveSpeed),
	moveTo(Code, MoveX, MoveY),
	ok.

-spec returnToSpawnPos(Code, SX, SY) -> ok when
	Code :: uint(), SX :: float(), SY :: float().
returnToSpawnPos(Code, SX, SY) ->
	ReturnSpeed = 10.0,
	monsterState:setMoveStatus(Code, ?MonsterMoveStatusRun),
	monsterState:setMoveSpeed(Code, ReturnSpeed),
	%%通知仇恨列表中的攻击者，消除仇恨
	monsterBattle:delBothHate(Code),
	moveTo(Code, SX, SY),
	ok.

-spec notifyMonsterSpeedToClient(Code) -> ok when
	Code :: uint().
notifyMonsterSpeedToClient(Code) ->
	{X, Y} = monsterState:getMonsterPos(Code),
	Speed = monsterState:getMoveSpeed(Code),
	Status = monsterState:getMoveStatus(Code),
	PlayerEts = monsterState:getMapPlayerEts(Code),
	NStatus = case Status of
				  undefined ->
					  ?CreatureActionStatusStand;
				  _ ->
					  Status
			  end,
	mapView:sendMsg2NearPlayerByPos(
		monsterState:getMapPid(Code), PlayerEts, #pk_GS2U_MonsterSpeed
		{code = Code,
			speed = Speed,
			moveStatus = NStatus
		}, X, Y, monsterState:getGroupID(Code)),
	ok.

-spec notifyMonsterAttackSpeedToClient(Code) -> ok when
	Code :: uint().
notifyMonsterAttackSpeedToClient(Code) ->
	{X, Y} = monsterState:getMonsterPos(Code),
	MapPid = monsterState:getMapPid(Code),
	GroupID = monsterState:getGroupID(Code),
	PlayerEts = monsterState:getMapPlayerEts(Code),
	AttackSpeed = 0, %% monsterState:getBattlePropTotal(Code, ?Prop_attackspeed),
	mapView:sendMsg2NearPlayerByPos(MapPid, PlayerEts, #pk_GS2U_AttackSpeed
	{
		code = Code,
		speed = AttackSpeed
	}, X, Y, GroupID),
	ok.

-spec stopMove(Code, IsSendMsg) -> ok when
	Code :: uint(), IsSendMsg :: boolean().
stopMove(Code, IsSendMsg) ->
	ActStatus = monsterState:getActionStatus(Code),
	if
		ActStatus =:= ?CreatureActionStatusMove ->
			{FX, FY} = monsterState:getMonsterPos(Code),
			PlayerEts = monsterState:getMapPlayerEts(Code),
			monsterState:setActionStatus(Code, ?CreatureActionStatusStand),
			case IsSendMsg of
				true ->
					Msg = #pk_GS2U_StopMove{
						code = Code,
						posX = FX,
						posY = FY
					},
					mapView:sendMsg2NearPlayerByPos(monsterState:getMapPid(Code), PlayerEts, Msg, FX, FY, monsterState:getGroupID(Code));
				_ ->
					skip
			end,
			monsterState:setMoveTarget(Code, 0, 0),
			ok;
		true ->
			skip
	end,
	ok.

-spec stopMove(Code, X, Y) -> ok when
	Code :: uint(),
	X :: number(),
	Y :: number().
stopMove(Code, X, Y) ->
	PlayerEts = monsterState:getMapPlayerEts(Code),
	ActStatus = monsterState:getActionStatus(Code),
	if
		ActStatus =:= ?CreatureActionStatusMove ->
			monsterState:setActionStatus(Code, ?CreatureActionStatusStand);
		true ->
			skip
	end,
	Msg = #pk_GS2U_StopMove{
		code = Code,
		posX = X,
		posY = Y
	},
	?DEBUG_OUT("client mon StopMove[~p,~p,~p]", [Code, X, Y]),
	mapView:sendMsg2NearPlayerByPos(monsterState:getMapPid(Code), PlayerEts, Msg, X, Y, monsterState:getGroupID(Code)),
	monsterState:setMonsterPos(Code, X, Y),
	monsterState:setMoveTarget(Code, 0, 0),
	creatureMap:syncCreatureToEts(Code),
	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================

-spec randMove1(Code) -> ok when
	Code :: uint().
randMove1(Code) ->
	case monsterState:getActionStatus(Code) =:= ?CreatureActionStatusMove of
		true ->
			skip;
		_ ->
			MonID = monsterState:getId(Code),
			#monsterCfg{patrolSpeed = PS} = getCfg:getCfgPStack(cfg_monster, MonID),
			PatrolSpeed = float(PS),
			monsterState:setMoveStatus(Code, ?MonsterMoveStatusWalk),
			monsterState:setMoveSpeed(Code, PatrolSpeed),
			{TX, TY} = getRandMovePt(Code),
			moveTo(Code, TX, TY)
	end,
	ok.

-spec getTargetInfo(Code, TargetCode) -> {TargetCode, TX, TY} | failed when
	Code :: uint(), TargetCode :: uint(), TX :: float(), TY :: float().
getTargetInfo(Code, TargetCode) when erlang:is_integer(TargetCode) andalso TargetCode > 0 ->
	PlayerEts = monsterState:getMapPlayerEts(Code),
	MonsterEts = monsterState:getMapMonsterEts(Code),
	PetEts = monsterState:getMapPetEts(Code),
	case mapView:getMapObjectFromEts(TargetCode, {PlayerEts, MonsterEts, PetEts}) of
		#recMapObject{x = TX, y = TY, actionStatus = Status} ->
			{TargetCode, TX, TY, Status};
		_ ->
			failed
	end;
getTargetInfo(_Code, _TargetCode) ->
	failed.

-spec moveToTarget1(Code, SkillID, {TargetCode, TX, TY, _}) -> ok when
	Code :: uint(), SkillID :: skillId(), TargetCode :: uint(), TX :: float(), TY :: float().
moveToTarget1(Code, SkillID, {TargetCode, TX, TY, _}) when erlang:is_integer(SkillID) andalso SkillID > 0 ->
%% 得到技能范围
	#skillCfg{ranger = AttackRange} = getCfg:getCfgPStack(cfg_skill, SkillID),

	%% 获取怪物配置
	MonID = monsterState:getId(Code),
	#monsterCfg{followRadius = FR, moveSpeed = MS, radius = BodyR} = getCfg:getCfgPStack(cfg_monster, MonID),
	MoveSpeed = float(MS),

	%% 得到怪物当前位置
	{X, Y} = monsterState:getMonsterPos(Code),
	MapID = monsterState:getMapID(Code),
	%% 计算怪物中心到目标的距离
	DX = X - TX,
	DY = Y - TY,
	Dist = math:sqrt(DX * DX + DY * DY),

	%% 怪物边缘与目标的距离（实际距离）
	RealDist = Dist - BodyR,
	case RealDist > AttackRange of
		true ->
			%% 怪物到目标的实际距离大于攻击距离
			%% 怪物实际施法点距目标的距离
			%% RealAttackRange = AttackRange - BodyR + 0.2,

			%% 得到修正的可包围目标点
			{MX, MY} = monsterBeset:getBesetPos(Code, AttackRange, X, Y, TargetCode, TX, TY),

			%% {MX, MY} = {TX, TY},
			{MoveX, MoveY} = case {MX, MY} =:= {TX, TY} of
								 true ->
									 %% 计算八方向失败
									 {TX + DX / RealDist * AttackRange, TY + DY / RealDist * AttackRange};
								 _ ->
									 %% 有八方向追击了
									 {MX, MY}
							 end,

			%%判断是否是障碍点
			{MoveX1, MoveY1} = case mapView:isBlock(MapID, MoveX, MoveY) of
								   true ->
									   {TX, TY};
								   _ ->
									   {MoveX, MoveY}
							   end,
			%% 计算修正的点与上次的偏差，如果太小，则不需要移动了
			{LTX, LTY} = monsterState:getMoveTarget(Code),
			DiffSQR = misc:calcDistSquare(MoveX1, MoveY1, LTX, LTY),
			case DiffSQR < 0.5 of
				true ->
					skip;
				false ->
					%% 判断怪物是否要脱离了
					case monsterState:getMonsterSpawnPos(Code) of
						{SX, SY} ->
							Sqr = (MoveX1 - SX) * (MoveX1 - SX) + (MoveY1 - SY) * (MoveY1 - SY),
							case erlang:trunc(Sqr) > erlang:trunc(FR * FR) of
								true ->
									case MonID >= 8300 andalso MonID < 8302 of
										true ->
											?DEBUG_OUT("@@@@@@@@@@@@@@@@@@@@@@@@@@ too far leave (~w, ~w -> ~w)",
												[MonID, TargetCode, monsterState:getAttackTarget(Code)]);
										_ -> skip
									end,
									%% 超出追逐范围，则快速返回出生点
									case isCanMove(Code) of
										true ->
											returnToSpawnPos(Code, SX, SY);
										_ ->
											skip
									end;
								_ ->
									%% 没有超出追逐范围，则变更移动速度为追逐速度向目标追逐
									pursue(Code, MoveX1, MoveY1, MoveSpeed)
							end;
						_ ->
							?ERROR_OUT("can not find monster[~p] spawn pos when moveToTarget", [Code])
					end
			end,
			ok;
		_ ->
			skip
	end,
	ok;
moveToTarget1(_Code, _SkillID, _TargetInfo) ->
	ok.

%%随机生成一个目标点，并检测目标点是否在阻挡上，如果是则尝试3试随机，否则返回failed
-spec getRandMovePt(Code) -> {TX1, TY1} | failed when
	Code :: uint(), TX1 :: number(), TY1 :: number().
getRandMovePt(Code) ->
	ID = monsterState:getId(Code),
	Cfg = getCfg:getCfgPStack(cfg_monster, ID),
	RatrolRadius = erlang:float(Cfg#monsterCfg.patrolRadius),
	%%出生点坐标
	{OrgX, OrgY} = monsterState:getMonsterSpawnPos(Code),
	RX = misc:rand(-RatrolRadius, RatrolRadius),
	RY = misc:rand(-RatrolRadius, RatrolRadius),
	TX = OrgX + RX,
	TY = OrgY + RY,
	TX1 =
		case TX < 0 of
			true -> 0.0;
			_ -> TX
		end,
	TY1 =
		case TY < 0 of
			true ->
				0.0;
			_ ->
				TY
		end,
	%%检测目标点是否在阻挡上，如果是则尝试3试随机，否则返回到出生点
	MapID = monsterState:getMapID(Code),
	case mapView:isBlock(MapID, TX1, TY1) of
		true ->
			Num = get({getRandMovePtNum, Code}),
			if
				Num =:= undefined ->
					put({getRandMovePtNum, Code}, 1),
					getRandMovePt(Code);
				Num < 3 ->
					put({getRandMovePtNum, Code}, Num + 1),
					getRandMovePt(Code);
				true ->
					erase({getRandMovePtNum, Code}),
					{OrgX, OrgY}
			end;
		_ ->
			erase({getRandMovePtNum, Code}),
			{TX1, TY1}
	end.

%%根据状态判断是否可以移动
-spec isCanMove(Code) -> boolean() when
	Code :: uint().
isCanMove(Code) ->
	ActionStatus = monsterState:getActionStatus(Code),
	CurHp = monsterState:getCurHp(Code),
	%死亡不能移动
	case ActionStatus =:= ?CreatureActionStatusDead orelse CurHp =:= 0 orelse ActionStatus =:= ?CreatrueActionStatusStealth of
		true ->
			false;
		_ ->
			Status = monsterState:getStatus(Code),
			Flag = ?CreatureSpeStatusComa bor ?CreatureSpeStautsFixed bor ?CreatureSpeStautsFreeze bor ?CreatureSpeStautsNoControl,
			case misc:testBit(Status, Flag) of
				true ->
					false;
				_ ->
					true
			end
	end.

-spec moveTo(Code, TX, TY) -> ok when
	Code :: uint(), TX :: float(), TY :: float().
moveTo(Code, TX, TY) ->
	case isCanMove(Code) of
		true ->
			{X, Y} = monsterState:getMonsterPos(Code),
			{TargetX, TargetY} = monsterState:getMoveTarget(Code),
			case TX =:= TargetX andalso TY =:= TargetY of
				true ->
					stopMove(Code, false);
				_ ->
%%					?ERROR_OUT("Monster[~p,~p] MoveTo ~p -> ~p", [Code, monsterState:getId(Code), {X, Y}, {TX, TY}]),
					monsterState:setActionStatus(Code, ?CreatureActionStatusMove),
					%%广播移动消息
					Msg = #pk_GS2U_MoveInfo{
						code = Code,
						posX = TX,
						posY = TY,
						posInfos = [#pk_PosInfo{x = X, y = Y}, #pk_PosInfo{x = TX, y = TY}]
					},
					PlayerEts = monsterState:getMapPlayerEts(Code),
					try
						mapView:sendMsg2NearPlayerByPos(monsterState:getMapPid(Code), PlayerEts, Msg, X, Y, monsterState:getGroupID(Code)),
						monsterState:setMoveTarget(Code, TX, TY)
					catch
						_:_ ->
							?ERROR_OUT("Monster[~p] MoveTo exception:~p, ~p", [Code, TX, TY])
					end,
					ok
			end;
		_ ->
			skip
	end,
	ok.


monsterReadchedTargetPos(Code, TX,TY)->
	{SX, SY} = monsterState:getMonsterPos(Code),
	%%没走完，就让它继续走下一个目标点
	case SX =:= TX andalso SY =:= TY of
		true ->
			case monsterState:getMoveTargetList(Code) of
				[{TX, TY} | T] ->
					monsterState:setMoveTargetList(Code, T),
					case T of
						[{TX2,TY2} | _] ->
							moveTo(Code, TX2, TY2);
						_ ->
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.


-spec updateMove(Code, DiffTime) -> ok when
	Code :: uint(), DiffTime :: uint().
updateMove(Code, DiffTime) ->
	MonsterID = monsterState:getId(Code),
	MapPid = monsterState:getMapPid(Code),
	MapID = monsterState:getMapID(Code),
	{SX, SY} = monsterState:getMonsterPos(Code),
	{X, Y} = monsterState:getMoveTarget(Code),
	CurHp = monsterState:getCurHp(Code),
	Camp = monsterState:getCamp(Code),
	MaxHp = monsterState:getBattlePropTotal(Code, ?Prop_MaxHP),
	Hp_Per = skill:getPercent(CurHp, MaxHp),
	Speed = monsterState:getMoveSpeed(Code),
	
	if
		X > 0 andalso Y > 0 ->
			case SX /= X orelse SY /= Y of
				true ->
					OverDist = calcPlayerPos(Code,X,Y,DiffTime),
					case trunc(OverDist) > 0 of
						true ->
							monsterReadchedTargetPos(Code, X, Y),
							DiffTimeNew = OverDist * 1000 / Speed,
							{DTX, DTY} = monsterState:getMoveTarget(Code),
							calcPlayerPos(Code, DTX, DTY, DiffTimeNew);
						_ ->
							skip
					end;
				_ ->
					case monsterState:getMoveTargetList(Code) of
						[] ->
							%%路径走完了，等待逻辑回收
							stopMove(Code, true),

							case mapState:getMapSubType() of
								?MapSubTypeMaterial ->
%%									?DEBUG_OUT("========================================>"),
									core:sendMsgToActivity(?ActivityType_Material,
										monsterToEnd, {MonsterID, Code, MapID, MapPid, SX, SY});
								?MapSubTypeMoneyDungeon ->
									core:sendMsgToActivity(?ActivityType_MoneyDungeon,
										monsterToEnd, {MonsterID, Code, MapID, MapPid, SX, SY});
								_ ->
									skip
							end,

							%%马车到达终点发送消息
							[RedHourseID, BlueHourseID] = globalCfg:getBattleWarCarriage(),
							case MonsterID =:= RedHourseID orelse MonsterID =:= BlueHourseID of
								true ->
									psMgr:sendMsg2PS(?PsNameCrosHd, horseToTarget, {MapPid, SX, SY, Hp_Per, Camp});
								_ ->
									skip
							end;
						[{TX, TY} | _] ->
							%%没走完，就让它继续走下一个目标点
							case TX =:= SX andalso TY =:= SY of
								true ->
									monsterReadchedTargetPos(Code, TX, TY);
								_ ->
									moveTo(Code, TX, TY)
							end;
						_ ->
							%%表示是一个普通怪
							stopMove(Code, false)
					end
			end;
		true ->
			case monsterState:getMoveTargetList(Code) of
				[{TX, TY} | _] ->
					moveTo(Code, TX, TY);
				[] ->
					stopMove(Code, true),
					case mapState:getMapSubType() of
						?MapSubTypeMaterial ->
							core:sendMsgToActivity(?ActivityType_Material,
								monsterToEnd, {MonsterID, Code, MapID, MapPid, SX, SY});
						?MapSubTypeMoneyDungeon ->
							core:sendMsgToActivity(?ActivityType_MoneyDungeon,
								monsterToEnd, {MonsterID, Code, MapID, MapPid, SX, SY});
						_ ->
							skip
					end;
				_ ->
					skip
			end
	end,
	ok.

-spec calcPlayerPos(Code, DstX, DstY, DiffTime) -> ok when
	Code :: uint(), DstX :: float(), DstY :: float(), DiffTime :: uint().
calcPlayerPos(Code, DstX, DstY, DiffTime)
	when erlang:is_number(DstX) andalso erlang:is_number(DstY) ->
	{SX, SY} = monsterState:getMonsterPos(Code),
	%%目标方向向量
	DirX = DstX - SX,
	DirY = DstY - SY,
	%%目标距离
	L = math:sqrt(DirX * DirX + DirY * DirY),
	Speed = monsterState:getMoveSpeed(Code),
	%%LastOverDist = monsterState:getMoveOverDist(Code),
	%%本次时间片的移动距离（加了上次已经移动超过的距离）
	Dist = Speed * DiffTime / 1000,%% + LastOverDist,
	{DX, DY} =
		case misc:isZero(L) of
			false ->
				%%计算本次将要移动到的坐标点
				{SX + DirX / L * Dist, SY + DirY / L * Dist};
			true ->
				{SX, SY}
		end,
	%%将要移动的距离Dist与最终距离L的差值，大于0则表示走过了，小于0则表示还没到目标点
	OverDist = Dist - L,
	{_IsReached, NewPosX, NewPosY} =
		case misc:isZero(OverDist) of
			true ->
				%%到达目标位置
				%%monsterState:setMoveOverDist(Code, 0.0), 没有在用，忽略
				{true, DstX, DstY};
			false ->
				case OverDist > 0 of
					true ->
						%%到达目标位置，且已经超过目标位置
						%%monsterState:setMoveOverDist(Code, OverDist), 没有在用，忽略
						{true, DstX, DstY};
					_ ->
						%%还没有到达目标位置
						%%monsterState:setMoveOverDist(Code, 0.0), 没有在用，忽略
						{false, DX, DY}
				end
		end,
	monsterState:setMonsterPos(Code, NewPosX, NewPosY),
%%	?ERROR_OUT("Monster[~p,~p] MoveTo ~p -> ~p, newpos(~p),dist(~p), speed(~p)",
%%		[Code, monsterState:getId(Code), {SX, SY}, {DstX, DstY}, {NewPosX, NewPosY}, OverDist, Speed]),

	CodeType = monsterState:getCodeType(Code),
	case CodeType =:= ?SpawnCallPet orelse CodeType =:= ?SpawnPet of
		false ->
			checkCrossGrid(Code, float(SX), float(SY), float(NewPosX), float(NewPosY));
		_ ->
			petMoveGrid(Code, float(SX), float(SY), float(NewPosX), float(NewPosY), false)
	end,
	OverDist.

%% 宠物移动
petMoveGrid(Code, SX, SY, NewPosX, NewPosY, false)when erlang:is_number(SX), erlang:is_number(SY), erlang:is_number(NewPosX), erlang:is_number(NewPosY) ->
	%% 移动
	{OldGridX, OldGridY} = mapView:getGridXYByPos(SX, SY),
	{NewGridX, NewGridY} = mapView:getGridXYByPos(NewPosX, NewPosY),
	DGX = NewGridX - OldGridX,
	DGY = NewGridY - OldGridY,
	creatureMap:syncCreatureToEts(Code),
	MapPid = monsterState:getMapPid(Code),
	PlayerEts = monsterState:getMapPlayerEts(Code),
	if
		DGX > 2 orelse DGX < -2 orelse DGY > 2 orelse DGY < -2 ->
%%			NewView = mapView:getNearRectByPos(NewPosX, NewPosY),
%%			notifyNearPlayerSelfInfo(MapPid, PlayerEts, findList(Code), Code, NewView);
			mapView:sendMsg2NearPlayerByPos(MapPid, PlayerEts,
				findList(Code), NewPosX, NewPosY, monsterState:getGroupID(Code));
		OldGridX =/= NewGridX orelse OldGridY =/= NewGridY ->
			%%移动中，Grid发生变化，通知周围的玩家
%%			{NewViewList, _DisableViewList, NoChangeList} = mapView:getChangedView({SX, SY}, {NewPosX, NewPosY}),
%%			[notifyNearPlayerSelfInfo(MapPid, PlayerEts, findList(Code), Code, NewView) || NewView <- NewViewList],
%%
%%			case Flag of
%%				true ->
%%					monsterState:setMoveTarget(Code, 0, 0),
%%					Msg = #pk_GS2U_ShiftTo{code = Code, posX = NewPosX, posY = NewPosY},
%%					[notifyNearPlayerShiftTo(MapPid, PlayerEts, Msg, Code, NoChangeView) || NoChangeView <- NoChangeList];
%%				_ ->
%%					skip
%%			end,
%%			?DEBUG_OUT("AAAAAAAAAAA:~p,~p", [Code, {NewPosX, NewPosY}]),
			%% 这个协议是否可以换用moveTo?
			mapView:sendMsg2NearPlayerByPos(MapPid, PlayerEts,
				findList(Code), NewPosX, NewPosY, monsterState:getGroupID(Code));
		true ->
			skip
	end,
	ok;
petMoveGrid(Code, SX, SY, NewPosX, NewPosY, true) when erlang:is_number(SX), erlang:is_number(SY), erlang:is_number(NewPosX), erlang:is_number(NewPosY) ->
	%% 瞬移
%%	{OldGridX, OldGridY} = mapView:getGridXYByPos(SX, SY),
%%	{NewGridX, NewGridY} = mapView:getGridXYByPos(NewPosX, NewPosY),
%%	DGX = NewGridX - OldGridX,
%%	DGY = NewGridY - OldGridY,
%%
%%	?WARN_OUT("petMoveGrid:~p,{~p,~p},{~p,~p},{~p,~p}", [Code, DGX, DGY, SX, SY, NewPosX, NewPosY]),
	creatureMap:syncCreatureToEts(Code),

%%	?LOG_OUT("petMoveGrid shiftto:~p, ~p -> ~p", [Code, {SX, SY}, {NewPosX, NewPosY}]),

	PlayerEts = monsterState:getMapPlayerEts(Code),
	Msg = findList(Code),

	mapView:sendMsg2NearPlayerByPos(monsterState:getMapPid(Code), PlayerEts,
		Msg, NewPosX, NewPosY, monsterState:getGroupID(Code)),
	ok;
petMoveGrid(Code, SX, SY, NewPosX, NewPosY, Flag) ->
	?ERROR_OUT("petMoveGrid badarg:~p", [{Code, SX, SY, NewPosX, NewPosY, Flag}]),
	ok.

checkCrossGrid(Code, SX, SY, NewPosX, NewPosY) when erlang:is_number(SX), erlang:is_number(SY), erlang:is_number(NewPosX), erlang:is_number(NewPosY) ->
	{OldGridX, OldGridY} = mapView:getGridXYByPos(SX, SY),
	{NewGridX, NewGridY} = mapView:getGridXYByPos(NewPosX, NewPosY),
	DGX = NewGridX - OldGridX,
	DGY = NewGridY - OldGridY,
	creatureMap:syncCreatureToEts(Code),
	MapPid = monsterState:getMapPid(Code),
	PlayerEts = monsterState:getMapPlayerEts(Code),
	if
		DGX > 2 orelse DGX < -2 orelse DGY > 2 orelse DGY < -2 ->
			OldView = mapView:getNearRectByPos(SX, SY),
			notifyNearPlayerHideMe(MapPid, PlayerEts, Code, OldView),

			NewView = mapView:getNearRectByPos(NewPosX, NewPosY),
			notifyNearPlayerSelfInfo(MapPid, PlayerEts, findList(Code), Code, NewView);
		OldGridX =/= NewGridX orelse OldGridY =/= NewGridY ->
			%%移动中，Grid发生变化，通知周围的玩家
			{NewViewList, DisableViewList, _NoChangeList} = mapView:getChangedView({SX, SY}, {NewPosX, NewPosY}),
			[notifyNearPlayerHideMe(MapPid, PlayerEts, Code, View) || View <- DisableViewList],

			[notifyNearPlayerSelfInfo(MapPid, PlayerEts, findList(Code), Code, NewView) || NewView <- NewViewList],
			ok;
		true ->
			skip
	end,
	ok;
checkCrossGrid(Code, SX, SY, NewPosX, NewPosY) ->
	?ERROR_OUT("checkCrossGrid badarg:~p", [{Code, SX, SY, NewPosX, NewPosY}]),
	ok.

-spec findList(Code :: uint()) -> tuple().
findList(Code) ->
	case codeMgr:getObjectTypeByCode(Code) of
		?ObjTypePet ->
			findPetList(Code);
		?ObjTypeMonster ->
			findMonsterList(Code);
		?ObjTypeCarrier ->
			findCarrierList(Code)
	end.

findPetList(Code) ->
	{X, Y} = monsterState:getMonsterPos(Code),
	{TX, TY} = monsterState:getMoveTarget(Code),
	CasterInfo = monsterState:getCasterInfo(Code),
	PetInfo = #pk_LookInfoPet{
		playerCode = CasterInfo#recCasterInfo.casterCode,
		pkMode = CasterInfo#recCasterInfo.casterPkMode,
		status = monsterState:getActionStatus(Code),
		id = monsterState:getId(Code),
		targetX = TX,
		targetY = TY,
		code = Code,
		x = X,
		y = Y,
		hp_per = getHpPer(Code),
		name = monsterState:getName(Code),
		camp = monsterState:getCamp(Code),
		move_speed = monsterState:getMoveSpeed(Code),
		buffs = monsterBuff:getBuffInfoList(Code)
	},
	#pk_GS2U_PetList{pet_list = [PetInfo]}.

findMonsterList(Code) ->
	{X, Y} = monsterState:getMonsterPos(Code),
	{TX, TY} = monsterState:getMoveTarget(Code),
	CasterInfo = monsterState:getCasterInfo(Code),
	Level = monsterState:getLevel(Code),
	MonsterInfo = #pk_LookInfoMonster{
		usercode = CasterInfo#recCasterInfo.casterCode,
		id = monsterState:getId(Code),
		code = Code,
		x = X,
		y = Y,
		rotW = monsterState:getDirection(Code),
		targetX = TX,
		targetY = TY,
		type = 0,
		hp_per = getHpPer(Code),
		name = monsterState:getName(Code),
		level = Level,
		camp = monsterState:getCamp(Code),
		groupID = monsterState:getGroupID(Code),
		guildID = monsterState:getGuildID(Code),
		buffs = monsterBuff:getBuffInfoList(Code),
		move_speed = monsterState:getMoveSpeed(Code),
		moveStatus = monsterState:getMoveStatus(Code),
		attack_speed = 0 %% monsterState:getBattlePropTotal(Code, ?Prop_attackspeed)
	},
	#pk_GS2U_MonsterList{monster_list = [MonsterInfo]}.

findCarrierList(Code) ->
	{X, Y} = monsterState:getMonsterPos(Code),
	{TX, TY} = monsterState:getMoveTarget(Code),
	CasterInfo = monsterState:getCasterInfo(Code),
	MonsterInfo = #pk_LookInfoMonster{
		usercode = CasterInfo#recCasterInfo.casterCode,
		id = monsterState:getId(Code),
		code = Code,
		x = X,
		y = Y,
		rotW = monsterState:getDirection(Code),
		targetX = TX,
		targetY = TY,
		type = 1,
		hp_per = getHpPer(Code),
		name = monsterState:getName(Code),
		level = monsterState:getLevel(Code),
		camp = monsterState:getCamp(Code),
		groupID = monsterState:getGroupID(Code),
		guildID = monsterState:getGuildID(Code),
		buffs = monsterBuff:getBuffInfoList(Code),
		move_speed = monsterState:getMoveSpeed(Code),
		moveStatus = monsterState:getMoveStatus(Code),
		attack_speed = 0 %% monsterState:getBattlePropTotal(Code, ?Prop_attackspeed)
	},
	#pk_GS2U_MonsterList{monster_list = [MonsterInfo]}.

getHpPer(Code) ->
	case monsterState:getBattlePropTotal(Code, ?Prop_MaxHP) of
		0.0 ->
			0;
		MaxHp ->
			Hp = monsterState:getCurHp(Code),
			erlang:round(Hp / MaxHp * 100)
	end.

%%通知视图内的所有玩家，自己的信息
-spec notifyNearPlayerSelfInfo(MapPid, PlayerEts, SelfInfo, Code, NewView) -> ok when
	MapPid :: pid(), PlayerEts :: etsTab(), SelfInfo :: #pk_GS2U_MonsterList{} | #pk_LookInfoPet{}, Code :: uint(), NewView :: mapView:view().
notifyNearPlayerSelfInfo(MapPid, PlayerEts, SelfInfo, Code, NewView) ->
	GroupID = monsterState:getGroupID(Code),
	mapView:sendMsg2NearPlayerByView(MapPid, PlayerEts, SelfInfo, NewView, GroupID).

-spec notifyNearPlayerHideMe(MapPid, PlayerEts, Code, View) -> ok when
	MapPid :: pid(), PlayerEts :: etsTab(), Code :: uint(), View :: mapView:view().
notifyNearPlayerHideMe(MapPid, PlayerEts, Code, View) ->
	GroupID = monsterState:getGroupID(Code),
	Msg = #pk_GS2U_BroadcastDisapear{code = [Code]},
	mapView:sendMsg2NearPlayerByView(MapPid, PlayerEts, Msg, View, GroupID).

%-spec notifyNearPlayerShiftTo(MapPid, PlayerEts, Msg, Code, View) -> ok when
%	MapPid :: pid(), PlayerEts :: etsTab(), Msg :: #pk_GS2U_ShiftTo{}, Code :: uint(), View :: mapView:view().
%notifyNearPlayerShiftTo(MapPid, PlayerEts, Msg, Code, View) ->
%	GroupID = monsterState:getGroupID(Code),
%	PlayerList = mapView:getNearViewObject(MapPid, PlayerEts, ?ObjTypePlayer, View, GroupID),
%	F =
%		fun(#recMapObject{netPid = NetPid}) ->
%			gsSendMsg:sendNetMsg(NetPid, Msg)
%		end,
%	lists:foreach(F, PlayerList),
%%%	[psMgr:sendMsg2PS(Pid, broadcast, Msg) || #recMapObject{pid = Pid} <- PlayerList],
%	ok.
