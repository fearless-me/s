%%%
%%%玩家的游戏逻辑基础功能

-module(playerBase).
-author(zhongyuanwei).

-include("playerPrivate.hrl").

%%定时保存玩家信息的时间间隔，暂定10分钟
-define(PlayerSaveAllTimeInternal, 10 * 60000).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	init/5,
	firstEnterWorld/0,
	tickPlayer/0,
	sendPropHpPC/1,
	sendPropPhys/1,
	sendPropCour/1,
	onPlayerQuit/1,
	addRole2CacheRoleList/2,
	deleteRoleFromCacheRoleList/1,
	addExp/3,
	decExp/3,
	sendExpInDanInfo/0,
	setLevel/2,
	getMaxSpecBattlePropPower/0,
	getSpecBattlePropRestorePower/0,
	getSpecBattlePropPower/0,
	setSpecBattlePropPower/1,
	sendPropSp/2,
	getAddExp/3,
	getMainMenuAct/1,
	sendGoblinOpenState/0,
	checkWingRegenerationCD/2,
	checkLoginBroadcastCD/2,
	getrecLogPlayerOffline/1,
	onPlayerOffline/1,
	printPropList/0,
	setHpDirect/1,
	clearSkillCDAndRestoreHp/0
]).

printPropList() ->
	L = playerCalcProp:getBattleProp(),
	lists:foreach(
		fun(#battleProp{propIndex = Index, baseValue = BV, totalValue = TV}) ->
			case Index >= ?Prop_New of
				true ->
					?WARN_OUT("\t\t~p,~p,~p", [Index, BV, TV]);
				_ ->
					skip
			end
		end, L),
	ok.

%%初始化角色
-spec init(RoleID, Career, Race, Sex, Head) -> ok when
	RoleID :: uint(), Career :: uint(), Race :: uint(), Sex :: uint(), Head :: uint().
init(RoleID, Career, Race, Sex, Head) ->

	playerState:setRoleID(RoleID),
	playerPackage:initPackage(),
	playerLogin:printTestLog(RoleID, "playerbase initpackage:~p", [RoleID]),

	Now = time:getUTCNowMS(),
	initBattlePropByCareer(Career),
	playerLogin:printTestLog(RoleID, "playerbase initbattleprop:~p", [RoleID]),
	playerState:setPets([]),
	playerState:setActionStatus(?CreatureActionStatusChangeMap),
	playerState:setPkStatus(?PlayerPeaceStatus),
	playerState:resetStatus(),
	playerState:setEquips([]),
	playerState:setVip(0),
	playerState:setBuffList([]),
	playerState:setLastTickTime(Now),
	playerState:setLastSecTick(Now),
	playerState:setLastSaveTime(Now),
	playerState:setLastKvTick(Now),
	%%playerState:setLastPetManorBattleTime(Now),
	playerState:setLastMinTick(Now),
	playerState:setLastPetBattleTime(Now),
	playerState:setCareer(Career),
	playerState:setRace(Race),
	playerState:setSex(Sex),
	playerState:setHead(Head),
	playerState:setCurMp(10000),        %% 调试 pvp 时，避免技能不能释放
	playerState:setCurExp(0),
	playerState:setDashCD(0),
	Seq = lists:seq(1, ?CoinTypeMax),
	[playerState:setCoin(CoinType, 0) || CoinType <- Seq],  %% 目前各货币默认初始化值为测试用
	playerState:setFaceDir(1.0, 0.0),
	playerState:setHitRestoreHp({0, 0}),
	playerState:setHateList([]),
	playerState:setMoveDir(0),
	playerState:setMoveRealDir(0),
	playerState:setMoveOverDist(0),
	playerState:setMoveTargetList([]),
	playerState:setSubmittedTask([]),
	playerState:setAcceptedTask([]),
	%%没有武器时的默认攻击间隔时间为1000毫秒
	playerState:setAttackIntervalTime(?DefaultAttackInternalTime),
	playerState:setCurUseSkillEffect([]),
	playerState:setComboSkill([]),
	playerState:setCallPet([]),
%%	playerState:setDailyCounterList([]),
	playerState:setOldMapPos(1, 38.3, 104.3),   % 初始化上次进入地图的坐标
	playerState:setGroupIDOnly(0),  % 玩家上线，分组ID设为大世界
	playerState:setBindPhoneNum(0),
	playerLogin:printTestLog(RoleID, "playerbase playerState end:~p", [RoleID]),
	playerSkillLearn:initSkill(),
	playerLogin:printTestLog(RoleID, "playerbase playerSkillLearn:~p", [RoleID]),
	%% 初始化个人交易行
	playerTrade:init(),
	playerLogin:printTestLog(RoleID, "playerbase playerTrade:~p", [RoleID]),
	%% 初始化个人邮件
	playerMail:init(),
	playerLogin:printTestLog(RoleID, "playerbase playerMail:~p", [RoleID]),
	%% 副本初始化
	playerCopyMap:init(),
	playerLogin:printTestLog(RoleID, "playerbase playerCopyMap:~p", [RoleID]),
	%% 属性初始化
	playerPropSync:init(),
	playerLogin:printTestLog(RoleID, "playerbase playerPropSync:~p", [RoleID]),
	%% 爵位初始化
	playerVip:init(),
	playerLogin:printTestLog(RoleID, "playerbase playerVip:~p", [RoleID]),
	%% 签到模块初始化
	playerSignIn:init(),
	playerLogin:printTestLog(RoleID, "playerbase playerSignIn:~p", [RoleID]),
	% 好友系统修改后没有幸运币的概念，屏蔽幸运币相关代码
	%%% 幸运币模块初始化
	%playerLuckyCoin:init(),
	%playerLogin:printTestLog(RoleID, "playerbase playerLuckyCoin:~p", [RoleID]),
	%% 勇士试炼系统初始化
	playerWarriorTrial:initWarriorTrial(),
	playerLogin:printTestLog(RoleID, "playerbase playerWarriorTrial:~p", [RoleID]),
	%% 玩家资源找回模块
	playerFindRes:init(),
	ok.

firstEnterWorld()->
	Flag = playerPropSync:getProp(?SerProp_PlayerFlag),
	firstEnterWorld(Flag).

firstEnterWorld(0)->
	playerPropSync:setInt64(?SerProp_PlayerFlag, 1),
	playerSkillLearn:addSkillPointLevelUp(1),
	playerEquip:equipRecastInit(),
	playerTask:acceptTask(?FirstTaskID, 0),
	try
		playerGoddess:initRoleWake()
	catch
	    _: _  -> skip
	end,
	%%初始化玩家默认变量
	playerVariant:initDefaultVariant(),
	ok;
firstEnterWorld(_)->
%%	playerVariant:sendVariant2Client(),
	ok.


-spec tickPlayer() -> ok.
tickPlayer() ->
	case playerState:isFirstEnterMap() andalso playerState:getActionStatus() =/= ?CreatureActionStatusChangeMap of
		false ->
			Now = time:getUTCNowMS(),
			LastTickTime = playerState:getLastTickTime(),
			DiffTime = Now - LastTickTime,
			playerSkill:tickSkill(Now),
			playerSkill:tickDashSkill(Now),
			playerMove:tickMove(DiffTime),
			playerState:setLastTickTime(Now),
			playerBuff:tickBuff(Now),
			monsterInterface:tick(Now),
			%%每秒做的事情
			DiffSec = erlang:trunc((Now - playerState:getLastSecTick()) / 1000),
			case DiffSec > 0 of
				true ->
					tickBySecond(DiffSec),        %% 调试 pvp 时，避免回血过快,
					playerState:setLastSecTick(Now),
					ok;
				_ ->
					skip
			end,

			%% 混沌战场每五秒增加荣誉
			addHDBattleHonor(Now),

			%% 每五秒同步伤害
			playerCrosTeam:sysHurtToCrosArena(Now),

			%% 换线时关闭自己保存mysql,断线重联要重置为normal
			OffLineType = playerState:getOffLineFlag(),
			SkipSave = (OffLineType =:= ?OffLineTypeChangeLine),

			%%定时保存玩家数据
			LastSaveTime = playerState:getLastSaveTime(),
			case Now - LastSaveTime >= ?PlayerSaveAllTimeInternal andalso not SkipSave of
				true ->
					playerSave:savePlayer(Now);
				_ ->
					skip
			end,

			%%定时更新杀戮值
			LastKvTime = playerState:getLastKvTick(),
			[UpdateTime, _] = globalCfg:getTickKv(),
			case Now - LastKvTime >= UpdateTime * 1000 of
				true ->
					playerRedName:tickKv(),
					playerState:setLastKvTick(Now);
				_ ->
					skip
			end,
			LastMinTime = playerState:getLastMinTick(),
			case Now - LastMinTime >= 60000 of
				true ->
					playerOnlineReward:tick(),
					playerPet:tickExpressPet(),
					playerFashion:checkFashionTimeOut(true),

					try
						%检查玩家是否有限时称号过期,一分钟检查一次
						playerTitle:checkTitleExpired(playerState:getPlayerTitleList())
					catch
						_:Why2 ->
							?ERROR_OUT("playerTitle:checkTitleExpired:~p", [Why2])
					end,
					playerState:setLastMinTick(Now);
				_ ->
					skip
			end,

			%%宠物远征劵自动回复
			LastPetBattleTime = playerState:getLastPetBattleTime(),
			case Now - LastPetBattleTime >= globalCfg:getPetWarTickTime() of
				true ->
					playerPetPvE:petPvetickPhys(),
					playerState:setLastPetBattleTime(Now);
				_ ->
					skip
			end,

			%%宠物争夺令自动回复
			LastPetManorBattleTime = playerState:getLastPetManorBattleTime(),
			case LastPetManorBattleTime of
				undefined ->
					skip;
				_ ->
					case Now - LastPetManorBattleTime >= globalCfg:getPetPvpReelRestoreCD() * 1000 of
						true ->
							playerPetPvP:petPvptick(),
							playerState:setLastPetManorBattleTime(Now);
						_ ->
							skip
					end
			end,
			playerExpMap:onExpMap(DiffTime),
			%%统一在此同步，其它地方不再单独同步，以控制同步频率
			try
				playerMap:syncPlayerToEts()
			catch
				_:Why ->
					?ERROR_OUT("roleID:~p syncPlayerToEts[~p] MapID:~p MapPid:~p Exception:~p", [playerState:getRoleID(), playerState:getMapPlayerEts(), playerState:getMapID(), playerState:getMapPid(), Why]),
					%%如果同步Ets出现异常则一般是地图进程已经销毁，但玩家还在此地图上并引用地图的Ets表，
					%%所以需要做一个处理：直接进入开始地图
					case playerState:getActionStatus() of
						?CreatureActionStatusChangeMap ->
							playerState:setActionStatus(?CreatureActionStatusStand);
						_ ->
							skip
					end,
					playerScene:onRequestEnterMap(globalCfg:getStartMap())
			end,

			%%playerPk:tickTranState(),
%%			playerWorldBossWar:worldBossWarTick(playerState:getMapID(), Now),

			playerRevive:checkPlayerIsRevive(),

			%% 刷新头顶表情符
			playerChat:freshHeadEmoticonIcon(),

			%% 属性同步
			playerPropSync:tickPlayer(),

			%% 累积冥想经验
			playerOfflineExp:accumulateMeditation(),

			playerMap:tickScreenSync9GridInfo(),

			playerRob:rob_tick(),
			ok;
		_ ->
			skip
	end,
	case playerState:getMapID() =:= ?NEED_FOR_SPEED_MAP_ID of
		true ->
			erlang:send_after(?NeedForSpeedPlayerTickInternal, self(), tickPlayer);
		_ ->
			erlang:send_after(?PlayerTickInternal, self(), tickPlayer)
	end,
	ok.

%%经验丹提升经验
-spec calcMultiExp(BaseExp) -> uint() when
	BaseExp :: uint().
calcMultiExp(BaseExp) ->
	case playerClock:getClock(?ClockType_ExpInDan) of
		[{_E, _R} | _] = List ->
			List2 = lists:keysort(1, List),
			[{ExpSubType, RemTime} | _] = lists:reverse(List2),
			case RemTime > 0 of
				true ->
					ExpSubType * BaseExp / 100;
				_ ->
					BaseExp
			end;
		_ ->
			BaseExp
	end.

%%翅膀回血CD
-spec checkWingRegenerationCD(SubType :: uint(), LengthCD :: uint()) -> boolean().
checkWingRegenerationCD(_, undefined) ->
	false;
checkWingRegenerationCD(SubType, LengthCD) ->
	case playerClock:getClock(?ClockType_WingRegenerationCD, SubType) of
		0 ->
			playerClock:startClock(?ClockType_WingRegenerationCD, SubType, ?ClockOffTime, LengthCD),
			true;
		_ ->
			false
	end.

%%登录广播CD
-spec checkLoginBroadcastCD(SubType :: uint(), LengthCD :: uint()) -> boolean().
checkLoginBroadcastCD(SubType, _LengthCD) ->
	case playerClock:getClock(?ClockType_LoginBroadcastCD, SubType) of
		0 ->
			true;
		_ ->
			false
	end.

%%发送经验丹信息给客户端
-spec sendExpInDanInfo() -> ok.
sendExpInDanInfo() ->
	case playerClock:getClock(?ClockType_ExpInDan) of
		List when erlang:is_list(List) andalso erlang:length(List) > 0 ->
			List2 = lists:keysort(1, List),
			[{ExpInDanType, RemainTime} | _] = lists:reverse(List2),
			?LOG_OUT("sendExpInDanInfo roleID:~p, Type:~p Time:~p List:~p", [playerState:getRoleID(), ExpInDanType, RemainTime, List2]),
			playerMsg:sendNetMsg(#pk_GS2U_UseItemExpInDanResult{expInDanType = ExpInDanType, remainTime = RemainTime});
		_ ->
			skip
	end,
	ok.

-spec modifyAddExpBySource(BaseExp, Source, MonsterID) -> uint() when
	BaseExp :: uint(), Source :: uint(), MonsterID :: uint().
modifyAddExpBySource(BaseExp, ?ExpSourceKillMonster, MonsterID) ->
	%% 计算多倍经验加成后的总经验
	NewExp = calcMultiExp(BaseExp),
	%% 获取爵位加成后的总经验
	TotalExp = playerVipInter:getKillMonsterExp(BaseExp),
	%% 世界等级加成后的经验
	WorldExp = playerWorldLevel:worldLevelUpExp(BaseExp),
	%% 获取组队和个人分配后经验
	TeamExp = teamAllotExp(BaseExp, MonsterID),
	%%% 获取姻缘等级附加的经验
	%MarriageExp = playerMarriage:getKillMonsterExp(BaseExp),
	%% 女神经验加成
	GoddessExp = playerState:getBattlePropTotal(?Prop_ExpFactor),
	%% 由于两次计算都包含基本经验，所以需要减一个基本经验，否则会重复计算
	?DEBUG_OUT("modifyAddExpBySource ~p - ~p + ~p - ~p + ~p + ~p + ~p", [
		TotalExp, BaseExp, NewExp, BaseExp, TeamExp, WorldExp, GoddessExp]),
	misc:ceil(TotalExp - BaseExp + NewExp - BaseExp + TeamExp + WorldExp + GoddessExp);
modifyAddExpBySource(BaseExp, _, _) ->
	BaseExp.

%% 获取组队和个人分配后经验
-spec teamAllotExp(BaseExp, MonsterID) -> uint() when
	BaseExp :: uint(), MonsterID :: uint().
teamAllotExp(BaseExp, _MonsterID) ->
	% 20170225 LUNA-800 屏蔽【t等级修正经验】
	%PlayerLevel = playerState:getLevel(),
	%#monsterCfg{level = MonsterLevel, worldlevel = WorldList} = getCfg:getCfgPStack(cfg_monster, MonsterID),
	%NewMonsterLevel =
	%case erlang:is_list(WorldList) andalso erlang:length(WorldList) =:= 2 of
	%	true ->
	%		playerState:getWorldLevel();
	%	_ ->
	%		MonsterLevel
	%end,
	#globalsetupCfg{setpara = [Coeff]} = getCfg:getCfgPStack(cfg_globalsetup, teamExpFactor),
%%	TemInfo = playerBattle:getSameMapTeamMemberPid(),
	%%LevAmendExp = 1 + (NewMonsterLevel -  PlayerLevel) * 0.05,
	%%LevAmendExp1 = misc:clamp(LevAmendExp, ?ExpAllotMinPar, ?ExpAllotMaxPar),
	TeamMemberCount = teamInterface:getTeamMemberCountWithRoleID(
		playerState:getRoleID(), false ),
	NewExp = case TeamMemberCount + 1 of
		         1 ->
			         %%erlang:round(BaseExp * LevAmendExp1);
			         BaseExp;
		         TemNum ->
			         MonsterExp = BaseExp * (1 + (TemNum - 1) * Coeff),
			         %%erlang:round(MonsterExp * LevAmendExp1 / TemNum)
			         MonsterExp / TemNum
	         end,
	case NewExp < 1 of
		true ->
			1;
		_ ->
			NewExp
	end.

%%添加经验
-spec addExp(AddExp, Reason, ReasonArg) -> boolean() when
	AddExp :: uint(), Reason :: uint(), ReasonArg :: uint().
addExp(AddExp, Reason, ReasonArg) when erlang:is_integer(AddExp), AddExp > 0 ->
	case playerState:getIsPlayer() of
		true ->
			%%计算修正经验
			NewExp = modifyAddExpBySource(AddExp, Reason, ReasonArg),
			Exp = playerState:getCurExp(),
			TotalExp = Exp + NewExp,
			OldLevel = playerState:getLevel(),
			MaxLevel = globalCfg:getPlayerMaxLevel(),
			UltimateExp = decExpSpill(TotalExp, MaxLevel),
			calcLevel(UltimateExp, MaxLevel),
			Level = playerState:getLevel(),
			RoleID = playerState:getRoleID(),
			CurExp = playerState:getCurExp(), %%这里需要重新获取当前经验
			case Level > OldLevel of
				true ->
					%% log
					dbLog:sendSaveLogPlayerLevel(RoleID, OldLevel, Level, playerState:getFuncellInfo()),
					%%升级后设置一下记录经验，但不实际记录，因为有记录升级日志
					playerState:setLastLogExp(playerState:getCurExp()),
					playerMsg:sendMsgToNearPlayer(#pk_GS2U_PlayerLevelUp{
						code = playerState:getPlayerCode(),
						curExp = CurExp,
						maxExp = playerState:getMaxExp(),
						addExp = NewExp,
						level = Level
					}, true),
					ok;
				_ ->
					playerMsg:sendNetMsg(#pk_GS2U_PlayerAddExp{curExp = CurExp, addExp = NewExp}),
					Career = playerState:getCareer(),
					#player_baseCfg{exp = MaxExp} = getCfg:getCfgPStack(cfg_player_base, OldLevel, Career),
					LastLogExp = playerState:getLastLogExp(),
					Diff = CurExp - LastLogExp,
					%%如果经验超过当前等级经验的3分之一且大于1200点
					%%或者大于10000点经验则保存一下，并记录一下日志
					%%1/3的经验达到1200点，总经验需要3600点，从目前的数据来看达到了16级
					%%也就是说16级以下一般只会保存2次，16级以上会保存3次
					%%当总经验达到30000（目前数据是30级）则会每10000点经验保存一次
					case (Diff >= 1200 andalso Diff >= (MaxExp / 3)) orelse Diff >= 10000 of
						true ->
							playerSave:saveRoleBase(),
							playerState:setLastLogExp(CurExp),
							dbLog:sendSaveLogChangeExp(RoleID, OldLevel, Level, Reason, AddExp, CurExp, ReasonArg);
						_ ->
							skip
					end
			end;
		_ ->
			skip
	end,
	true;
%%怪物杀死后，不加经验
addExp(0, _Reason, _ReasonArg) ->
	true;
addExp(AddExp, Reason, ReasonArg) ->
	?ERROR_OUT("Player[~ts] Error add Exp[~p],Reason:~p,ReasonArg:~p", [playerState:getName(), AddExp, Reason, ReasonArg]),
	false.
%%扣除经验
-spec decExp(DelExp, Reason, ReasonArg) -> boolean() when
	DelExp :: uint(), Reason :: uint(), ReasonArg :: uint().
decExp(DelExp, Reason, ReasonArg) when erlang:is_integer(DelExp), DelExp > 0 ->
	CurExp = playerState:getCurExp(),
	?DEBUG_OUT("DelExp = ~p, CurExp = ~p", [DelExp, CurExp]),
	case CurExp >= DelExp of
		true ->
			playerState:setCurExp(CurExp - DelExp),
			NewCurExp = playerState:getCurExp(),
			Level = playerState:getLevel(),
			RoleID = playerState:getRoleID(),
			playerMsg:sendNetMsg(#pk_GS2U_PlayerAddExp{curExp = NewCurExp, addExp = -DelExp}),
			playerState:setLastLogExp(NewCurExp),
			dbLog:sendSaveLogChangeExp(RoleID, Level, Level, Reason, DelExp, NewCurExp, ReasonArg),
			true;
		_ ->
			false
	end;
decExp(0, _Reason, _ReasonArg) ->
	true;
decExp(DelExp, Reason, ReasonArg) ->
	?ERROR_OUT("Player[~ts] Error del Exp[~p],Reason:~p,ReasonArg:~p", [playerState:getName(), DelExp, Reason, ReasonArg]),
	false.
-spec onPlayerQuit(Why) -> ok when
	Why :: term().
-ifdef(RELEASE).
onPlayerQuit(Why) ->
	try
		onPlayerQuit2(Why)
	catch
		_:Reason ->
			?ERROR_OUT("Error PlayerQuit(~p) By:~p, Exception:~p", [playerState:getRoleID(), Why, Reason])
	end,
	ok.
-else.
	onPlayerQuit(Why) -> onPlayerQuit2(Why).
-endif.

onPlayerQuit2(Why) ->
	%%检测网络是否存在，存在则退出之
	NetPid = playerState:getNetPid(),
	IsPid = erlang:is_pid(NetPid),
	if
		IsPid ->
			?LOG_OUT("killNetPid:~p when onPlayerQuit by:~p", [NetPid, Why]),
			erlang:exit(NetPid, normal);
		true ->
			skip
	end,

	MapPid = playerState:getMapPid(),
	case erlang:is_pid(MapPid) of
		true ->
			playerLadder1v1:playerOffline(),
			case playerState:getIsPlayer() of
				true -> onPlayerOffline(Why);
				_ -> skip
			end;
		_ ->
			skip
	end.

%%玩家下线需要通知周围的人，以及有关系的相应人。
-spec onPlayerOffline(Why) -> ok when Why :: any().
onPlayerOffline(Why) ->
	?LOG_OUT("RoleID[~p] will offline,Why[~p] getRunStep:~p", [playerState:getRoleID(), Why, playerState:getRunStep()]),
	%% 一个玩家进程，只处理一次	
	case playerState:getRunStep() of
		?PlayerStateSaveAndLogout ->
			skip;
		_ ->
			?LOG_OUT("onPlayerOffline not PlayerStateSaveAndLogout ~p", [self()]),
			%% 下线时，如果死亡，先复活
			case playerState:getCurHp() > 0 of
				true -> skip;
				false -> playerRevive:requestRevive_Unconditional()
			end,

			playerState:setRunStep(?PlayerStateSaveAndLogout),
			playerSave:offlineSavePlayerPre(),
			%%离开切磋
			playerBattleLearn:offLineBattleLearn(),

			case Why of
				logCrossAck ->
					skip;
				_ ->
					gameMapActivityLogic:playerOffline(playerState:getRoleID()),
					playerGuildExpedition:onOffline(),
					playerCrosTeam:offlineDelTeamMember()
			end,


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			%%玩家下线,清除能量值
			setSpecBattlePropPower(0.0),

			%如果在战斗状态中, 需要先通知对方脱离战斗
			PlayerCode = playerState:getPlayerCode(),
			playerBattle:leaveBattle(PlayerCode),

			%% 通知分组，我退出分组了
			case playerState:getGroupID() of
				GroupID when GroupID > 0 ->
					psMgr:sendMsg2PS(?PsNameGroup, playerLeaveGroup, {GroupID, PlayerCode});
				_ ->
					skip
			end,

			%%保存宠物信息
			case playerPet:getPetBattle() of
				#recPetInfo{pet_id = ID, pet_status = Status} = Pet when Status =:= ?PetState_Battle_Show ->
					case playerState:getPetMounts() of
						{_, ?PetOnMount} ->
							playerSave:savePet(Pet#recPetInfo{pet_status = ?PetState_Battle_Mount});
						_ ->
							skip
					end,
					playerPet:savePetSkillCDToDB(ID, playerPet:getPetBattleCode());
				_ ->
					skip
			end,

			playerPetDouble:doubleMountOff(),

			%%保存宠物远征信息
			playerPetPvE:petPveOffline(),
			%%保存宠物争夺战信息
			playerPetPvP:petPvpOff(),


			%通知周围的人
			MapPid = playerState:getMapPid(),
			case erlang:is_pid(MapPid) of
				true when Why /= logCrossAck ->
					case playerState:getActionStatus() =:= ?CreatureActionStatusChangeMap andalso playerState:isWaitClientAckEnteredMap() =:= false of
						false ->
							%%玩家下线,清除技能召唤宠物，注意只有在可以通知地图进程下线的情况下，才能清除宠物，否则会有导致宠物清除不掉
							%%或者在切地图中下线后，待切地图后通知新的地图进程下线是无法获取宠物列表，导致不能正确清除宠物
							PetCodeList = playerState:getCallPetCodeList(),
							try
								case is_pid(MapPid) andalso misc:is_process_alive(MapPid) of
									true ->
										playerPet:clearAllPets();
									_ ->
										skip
								end
							catch
								_:Why ->
									?ERROR_OUT("onPlayerOffline clearAllPet,error(~p)", [Why])
							end,

							psMgr:sendMsg2PS(MapPid, playerOffline, {PlayerCode, PetCodeList});
						_ ->
							%%如果是在切换地图中，则不能再向原地图进程发消息，否则会导致两次离开同一地图
							skip
					end,
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
					?LOG_OUT("RoleID[~p] offline,Why[~p]", [playerState:getRoleID(), Why]),
					%%mwh-new-team
					playerTeam:offline(),
%%					case playerState:getTeamID(?PlayerTeamTypeNormal) > 0 of
%%						true ->
%%							%% 通知队友
%%							playerTeam2:offLine(?PlayerTeamTypeNormal);
%%						_ ->
%%							skip
%%					end,
					ok;
				true ->
					skip;
				false ->
					skip
			end,
			case playerState:getActionStatus() of
				?CreatureActionStatusDead ->
					case getCfg:getCfgPStack(cfg_globalsetup, relive_hp) of
						#globalsetupCfg{setpara = [Percent]} ->
							ok;
						_ ->
							Percent = 1.0
					end,
					MaxHp = playerState:getMaxHp(),
					CurHp = erlang:round(MaxHp * Percent),
					playerState:setRebornHp(CurHp);
				_ ->
					skip
			end,

			%%保存所有信息
			OffLineFlag = playerState:getOffLineFlag(),
			case OffLineFlag of
				?OffLineTypeChangeLine ->
					?WARN_OUT("player:~ts ID:~p changeline", [playerState:getName(), playerState:getRoleID()]),
					skip;
				_ ->
					?LOG_OUT("onPlayerOffline:~p Name:~ts", [playerState:getRoleID(), playerState:getName()]),
					playerSave:offlineSavePlayer()
			end,

			%%log
			case playerState:getLevel() > 0 of
				false ->
					skip;%%没有加载过玩家数据的，不记玩家下线
				_ ->
					dbLog:sendSaveLogPlayerOffline(
						getrecLogPlayerOffline(0),
						playerState:getName(),
						playerState:getCareer(),
						playerState:getCamp(),
						playerState:getOnlineTime(),
						playerState:getFuncellInfo()
					)
			end,

			%% 通知LBS相关计算队列终止或排除计算
			psMgr:sendMsg2PS(?PsNameFriend2LBS, friend2_offline, playerState:getRoleID()),

			%% 发给db保存下线时间
			gsSendMsg:sendMsg2DBServer(playerOffline, playerState:getAccountID(), playerState:getRoleID())
	end,
	ok.

%添加一个角色信息到角色列表
-spec addRole2CacheRoleList(RoleID, #pk_U2GS_RequestCreatePlayer{}) -> ok when
	RoleID :: uint().
addRole2CacheRoleList(RoleID, #pk_U2GS_RequestCreatePlayer{} = Pk) ->
	RoleList = playerState:getRoleList(),
	RoleInfo = #recRoleListInfo{
		roleID = RoleID,
		roleName = Pk#pk_U2GS_RequestCreatePlayer.name,
		camp = Pk#pk_U2GS_RequestCreatePlayer.camp,
		race = Pk#pk_U2GS_RequestCreatePlayer.race,
		career = Pk#pk_U2GS_RequestCreatePlayer.career,
		sex = Pk#pk_U2GS_RequestCreatePlayer.sex,
		head = Pk#pk_U2GS_RequestCreatePlayer.head,
		level = 1,
		lastLogoutTime = undefined
	},
	List = case RoleList of
		       [] ->
			       [RoleInfo];
		       _ ->
			       [RoleInfo | RoleList]
	       end,
	playerState:setRoleList(List),
	ok.

%从一个角色列表中删除指定角色信息
-spec deleteRoleFromCacheRoleList(RoleID) -> ok when
	RoleID :: non_neg_integer().
deleteRoleFromCacheRoleList(RoleID) ->
	RoleList = playerState:getRoleList(),
	NewRoleList = lists:keydelete(RoleID, #recRoleListInfo.roleID, RoleList),
	playerState:setRoleList(NewRoleList),
	ok.

%%设置玩家等级
-spec setLevel(Level, IsUpdate) -> uint() when
	Level :: uint(),
	IsUpdate :: boolean().
setLevel(Level, IsUpdate) when Level > 0 andalso erlang:is_boolean(IsUpdate) ->
	MaxLevel = globalCfg:getPlayerMaxLevel(),
	case Level =< MaxLevel of
		true ->
			OldLevel = playerState:getLevel(),
			Career = playerState:getCareer(),
			playerCalcProp:initBaseProp(Level, Career),
			playerState:setLevel(Level),
			%%升级后计算属性
			playerCalcProp:calcBattleProp(),
			%%更新队伍信息中的等级信息
%%			playerTeam2:syncInfoToTeam(?PlayerTeamTypeNormal, #recTeamMemberInfo.level, Level),
			%%更新宠物属性

			%% 升级后需要添加做的事情
			if
			%%由于OldLevel是一个uint类型，所以只需要判定是否大于0，则可知道是否是刚上线
				OldLevel > 0 ->
					playerLevelUp:onFirstLoginEachLevel(lists:seq(OldLevel + 1, Level));

				true ->
					skip
			end,
			if
				IsUpdate =:= true->
					playerLevelUp:onLevelUp(OldLevel, Level);
				true ->
					skip
			end,
			%%升级后设置当前血量
			MaxHp = playerState:getMaxHp(),
			playerState:setCurHp(MaxHp),
			notifyTeamMemberLevel(Level),
			playerChat:playerChangeChatCD(Level),
			playerWorldLevel:changeWorldExp(Level, playerState:getWorldLevel()),
			ets:update_element(ets_rec_base_role, playerState:getRoleID(), [{#rec_base_role.level, Level}]),
			%%升级后计算战力
			playerForce:calcPlayerForce(?PlayerLvForce, true), %% 参数2改为true，解决玩家上线后战力属性未同步的问题
			Level;
		_ ->
			%%如果超过最高等级，则设置为最高等级
			setLevel(MaxLevel, IsUpdate) %% 参数2改为true，解决玩家上线后战力属性未同步的问题
	end.

%%获取玩家升级真加总经验
getAddExp(OldLevel, OldCurExp, Level) ->
	Fun = fun(Lev, Acc) ->
		case getCfg:getCfgPStack(cfg_player_base, Lev, playerState:getCareer()) of
			#player_baseCfg{exp = Exp} ->
				Acc + Exp;
			_ ->
				Acc + 0
		end
	      end,
	List = lists:seq(OldLevel + 1, Level),
	NowExp = lists:foldl(Fun, 0, List),
	#player_baseCfg{exp = OldExp} = getCfg:getCfgPStack(cfg_player_base, OldLevel, playerState:getCareer()),
	ShortExp = OldExp - OldCurExp,
	NowExp + ShortExp.

%%获取玩家的职业相关的特殊战斗属性
-spec getSpecBattlePropPower() -> number().
getSpecBattlePropPower() -> 0.
%%	getSpecBattlePropPower(playerState:getCareer(), playerState:getPlayerSpecBattleProp()).
%%getSpecBattlePropPower(?Career_10_Warrior, #recPlayerSpecBattleProp{holypower = Holypower}) ->
%%	Holypower;
%%getSpecBattlePropPower(?CareerTrainee, #recPlayerSpecBattleProp{ragepower = Ragepower}) ->
%%	Ragepower;
%%getSpecBattlePropPower(?Career_30_Bravo, #recPlayerSpecBattleProp{shadowpower = Shadowpower}) ->
%%	Shadowpower;
%%getSpecBattlePropPower(?Career_20_Magician, #recPlayerSpecBattleProp{magicpower = Magicpower}) ->
%%	Magicpower;
%%getSpecBattlePropPower(?CareerMechanic, #recPlayerSpecBattleProp{mechanicpower = Mechanicpower}) ->
%%	Mechanicpower.

%%设置玩家职业相关的特殊战斗属性
-spec setSpecBattlePropPower(Power :: number()) -> ok.
setSpecBattlePropPower(_Power) -> skip.
%%	MaxSBPP = getMaxSpecBattlePropPower(),
%%	NewPower = misc:clamp(Power, 0, MaxSBPP),
%%	setSpecBattlePropPower(playerState:getCareer(), playerState:getPlayerSpecBattleProp(), NewPower).
%%setSpecBattlePropPower(?Career_10_Warrior, #recPlayerSpecBattleProp{} = BattleProp, NewPower) ->
%%	playerState:setPlayerSpecBattleProp(BattleProp#recPlayerSpecBattleProp{holypower = NewPower});
%%setSpecBattlePropPower(?CareerTrainee, #recPlayerSpecBattleProp{} = BattleProp, NewPower) ->
%%	playerState:setPlayerSpecBattleProp(BattleProp#recPlayerSpecBattleProp{ragepower = NewPower});
%%setSpecBattlePropPower(?Career_30_Bravo, #recPlayerSpecBattleProp{} = BattleProp, NewPower) ->
%%	playerState:setPlayerSpecBattleProp(BattleProp#recPlayerSpecBattleProp{shadowpower = NewPower});
%%setSpecBattlePropPower(?Career_20_Magician, #recPlayerSpecBattleProp{} = BattleProp, NewPower) ->
%%	playerState:setPlayerSpecBattleProp(BattleProp#recPlayerSpecBattleProp{magicpower = NewPower});
%%setSpecBattlePropPower(?CareerMechanic, #recPlayerSpecBattleProp{} = BattleProp, NewPower) ->
%%	playerState:setPlayerSpecBattleProp(BattleProp#recPlayerSpecBattleProp{mechanicpower = NewPower}).

%%获取玩家的职业相关的特殊战斗属性
-spec getMaxSpecBattlePropPower() -> number().
getMaxSpecBattlePropPower() ->
	#player_descCfg{
		prime_energy = MaxEnergy
	} = getCfg:getCfgPStack(
		cfg_player_desc,
		playerState:getCareer()
	),
	playerState:getBattlePropTotal(MaxEnergy).

%%获取玩家的职业相关的特殊回血战斗属性
-spec getSpecBattlePropRestorePower() -> number().
getSpecBattlePropRestorePower() ->
	getSpecBattlePropRestorePower(playerState:getCareer()).

%%getSpecBattlePropRestorePower(?Career_10_Warrior) ->
%%	playerState:getBattlePropTotal(?Prop_holyrestore);
%%getSpecBattlePropRestorePower(?CareerTrainee) ->
%%	playerState:getBattlePropTotal(?Prop_maxragerestore);
getSpecBattlePropRestorePower(_) ->
	0.
%% ====================================================================
%% Internal functions
%% ====================================================================

-spec initBattlePropByCareer(Career :: career()) -> ok.
initBattlePropByCareer(Career) ->
	BattlePropList = battleProp:initBattleProp(false),
	playerState:setPlayerSpecBattleProp(#recPlayerSpecBattleProp{}),
	#player_descCfg{ moveSpeed = MoveSpeed } = getCfg:getCfgPStack(cfg_player_desc, Career),
	BasePropList = [{?Prop_MoveSpeed, MoveSpeed}],
%%	SBP = playerState:getPlayerSpecBattleProp(),
%%	case Career of
%%		?Career_10_Warrior ->
%%			BPList = [{Prop, float(Energy)} | BasePropList],
%%			SBP = SBP0#recPlayerSpecBattleProp{holypower = 0.0};
%%		?CareerTrainee ->
%%			BPList = [{Prop, float(Energy)} | BasePropList],
%%			SBP = SBP0#recPlayerSpecBattleProp{ragepower = 0.0};
%%		?Career_30_Bravo ->
%%			BPList = [{Prop, float(Energy)} | BasePropList],
%%			SBP = SBP0#recPlayerSpecBattleProp{shadowpower = 0.0};
%%		?Career_20_Magician ->
%%			BPList = [{Prop, float(Energy)} | BasePropList],
%%			SBP = SBP0#recPlayerSpecBattleProp{magicpower = 0.0};
%%		?CareerMechanic ->
%%			BPList = [{Prop, float(Energy)} | BasePropList],
%%			SBP = SBP0#recPlayerSpecBattleProp{mechanicpower = 0.0}
%%	end,
%%	playerState:setPlayerSpecBattleProp(SBP),
	BattlePropList1 = battleProp:setBattlePropBaseValue(BattlePropList, BasePropList),
	BattlePropList2 = battleProp:calcRoleBattleProp(BattlePropList1, 1),
	playerCalcProp:setBattleProp(BattlePropList2).

%%判断最大等级经验是否溢出
-spec decExpSpill(CurExp, MaxLevel) -> uint() when
	CurExp :: uint(), MaxLevel :: uint().
decExpSpill(CurExp, MaxLevel) ->
	Level = playerState:getLevel(),
	Career = playerState:getCareer(),
	case Level =:= MaxLevel of
		true ->
			#player_baseCfg{exp = MaxExp} = getCfg:getCfgPStack(cfg_player_base, Level, Career),
			case CurExp > MaxExp of
				true ->
					MaxExp;
				_ ->
					CurExp
			end;
		_ ->
			CurExp
	end.

%%根据经验计算等级
-spec calcLevel(CurExp, MaxLevel) -> ok when
	CurExp :: uint(), MaxLevel :: uint().
calcLevel(CurExp1, MaxLevel) when erlang:is_number(CurExp1), CurExp1 > 0 ->
	CurExp = trunc(CurExp1),
	Level = playerState:getLevel(),
	Career = playerState:getCareer(),
	#player_baseCfg{exp = MaxExp} = getCfg:getCfgPStack(cfg_player_base, Level, Career),
	case CurExp > MaxExp andalso Level < MaxLevel of
		true ->
			NextLevel = Level + 1,
			setLevel(NextLevel, true),
			calcLevel(CurExp - MaxExp, MaxLevel);
		_ ->
			playerState:setCurExp(CurExp)
	end,
	ok.

%%每秒执行一次的事件
-spec tickBySecond(Second) -> ok when
	Second :: uint().
tickBySecond(Second) ->
	restoreHp(Second),
	restoreSpecProp(Second),
	restorePhysical(Second),
	restoreMountSta(Second),
	playerRedName:tickKp(),
	playerPk:tickHateList(),
%%	playerTeam2:tickTeammateLocation(),
	%%mwh-new-team
	playerTeam:syncInfo2Team(false),
	playerWarriorTrial:tickMaxTime(),
	%%道具时效性检测
	playerPackage:tickPackage(),
	playerRune:tickRune(),
	playerWorldBossWar:tickSecond(),
	ok.

%%秒回血
-spec restoreHp(Second) -> ok when
	Second :: uint().
restoreHp(Second) ->
	%%最大生命值
	MaxHp = playerState:getMaxHp(),
	CurHp = playerState:getCurHp(),
	OldPC = skill:getPercent(CurHp, MaxHp),
	LastPC = playerState:getLastHpPC(),
	%%死亡了不会触发Hp秒回
	%%满血状态也不会触发Hp秒回
	case canRestoreHp(CurHp, MaxHp, LastPC) of
		true ->
			%%生命秒回
			HpSec = playerState:getBattlePropTotal(?Prop_HPRecover),
			%%计算每秒加多少生命值
			Hp = CurHp + HpSec * Second,
			NewHp = misc:clamp(Hp, 0, MaxHp),

			playerState:setCurHp(NewHp),
			NowHp = playerState:getCurHp(),
			PC = skill:getPercent(NowHp, MaxHp),

			%%血量变化超过百分之一时才发送给客户端
			if
				PC =:= OldPC andalso LastPC =:= PC ->
					skip;
				OldPC =/= LastPC orelse OldPC =< 100 ->

					sendPropHpPC(PC),
					notifyTeamMemberHpPC(PC),
					playerState:setLastHpPC(PC),
					ok;
				true ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

canRestoreHp(CurHP, MaxHp, LastPC)->
	Status = playerState:getActionStatus(),
	IsInCombat = playerState:isPlayerBattleStatus(),
	if
		IsInCombat ->
			false;
		CurHP =< 0->
			false;
		Status =:= ?CreatureActionStatusDead->
			false;
		CurHP >= MaxHp andalso LastPC >= 100 ->
			false;
		true ->
			true
	end.

%% 直接设置血量
setHpDirect(HP) ->
	CurHp = playerState:getCurHp(),
	case HP /= CurHp of
		true ->
			LastPC = playerState:getLastHpPC(),
			MaxHp = playerState:getMaxHp(),
			OldPC = skill:getPercent(CurHp, MaxHp),

			playerState:setCurHp(HP),
			NowHp = playerState:getCurHp(),
			PC = skill:getPercent(NowHp, MaxHp),

			?DEBUG_OUT("setHpDirect[~p] [~p,~p,~p] [~p,~p,~p]",
				[playerState:getRoleID(), CurHp, NowHp, MaxHp, LastPC, OldPC, PC]),

			%%血量变化超过百分之一时才发送给客户端
			if
				PC =:= OldPC andalso LastPC =:= PC ->
					skip;
				OldPC =/= LastPC orelse OldPC =< 100 ->
					sendPropHpPC(PC),
					notifyTeamMemberHpPC(PC),
					playerState:setLastHpPC(PC),
					ok;
				true ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%% 清空技能CD和回血
-spec clearSkillCDAndRestoreHp() -> ok.
clearSkillCDAndRestoreHp() ->
	%% 清空技能CD
	playerState:setSkillCD([]),
	playerState:setSkillGroupCD([]),
	playerState:setGlobalCD(0),

	%% 回满血
	HP = playerState:getMaxHp(),
	playerBase:setHpDirect(HP),

	?LOG_OUT("clearSkillCDAndRestoreHp roleID:~p", [playerState:getRoleID()]),
	ok.

%%秒回职业能量值
-spec restoreSpecProp(Second) -> ok when
	Second :: uint().
restoreSpecProp(_Second) ->
%%	MaxSBPP = getMaxSpecBattlePropPower(),
%%	CurSBPP = getSpecBattlePropPower(),
%%	Career = playerState:getCareer(),
%%	CurHp = playerState:getCurHp(),
%%	SecValue =
%%		case Career of
%%			?Career_10_Warrior ->
%%				playerState:getBattlePropTotal(?Prop_holypowersec);
%%			?CareerTrainee ->
%%				playerState:getBattlePropTotal(?Prop_ragepowersec);
%%			?Career_30_Bravo ->
%%				playerState:getBattlePropTotal(?Prop_shadowpowersec);
%%			?Career_20_Magician ->
%%				playerState:getBattlePropTotal(?Prop_magicpowersec);
%%			?CareerMechanic ->
%%				playerState:getBattlePropTotal(?Prop_mechanicpowersec);
%%			_ ->
%%				0
%%		end,
%%	case CurHp > 0 of
%%		true ->
%%			if
%%				(CurSBPP =/= MaxSBPP andalso SecValue > 0) orelse
%%					(CurSBPP > 0 andalso SecValue =< 0) ->
%%					%%职业特殊属性
%%					tickCareerSpecProp(Second),
%%					SpecValue = getSpecBattlePropPower(),
%%					sendPropSp(trunc(SpecValue), trunc(CurSBPP));
%%				true ->
%%					skip
%%			end;
%%		_ ->
%%			skip
%%	end,
	ok.

%% 秒回坐骑耐久值(非战斗状态，秒回10%)
-spec restoreMountSta(Second) -> ok when
	Second :: uint().
restoreMountSta(Second) ->
	case playerState:isPlayerBattleStatus() of
		false ->
			CurMountSta = playerState:getPetMountSta(),
			MaxMountSta = playerPet:getPetMaxMountSta(),
			if
				CurMountSta =:= MaxMountSta ->
					skip;
				true ->
					AddMountSta = MaxMountSta * 0.1 * Second,
					NewMountSta = CurMountSta + AddMountSta,
					playerPet:updatePetMountSta(NewMountSta, MaxMountSta)
			end;
		_ ->
			skip
	end,
	ok.

%% 秒回体力值(非滑屏状态)
-spec restorePhysical(Second) -> ok when
	Second :: uint().
restorePhysical(Second) ->
	case playerState:isPlayerDashStatus() of
		false ->
			CurHp = playerState:getCurHp(),
			CurPhys = playerState:getCurPhys(),
			MaxPhys = 0,%% playerState:getBattlePropTotal(?Prop_physical),
			SpecPhys = 0,%% playerState:getBattlePropTotal(?Prop_physicalspec),
			case CurPhys =/= trunc(MaxPhys) andalso CurHp > 0 of
				true ->
					NewPhys = misc:clamp(trunc(CurPhys + SpecPhys * Second), 0, MaxPhys),
					playerState:setCurPhys(NewPhys),
					sendPropPhys(NewPhys);
				_ ->
					skip
			end;
		_ ->
			skip
	end.

%%发送给客户端血量信息
-spec sendPropHpPC(PC) -> ok when
	PC :: uint8().
sendPropHpPC(PC) ->
	Code = playerState:getPlayerCode(),
	CurHp = playerState:getCurHp(),
	MaxHp = playerState:getMaxHp(),
	SyncHp = misc:clamp(CurHp, 0, MaxHp),
	%%发送给自己真实的血量值
	Msg = #pk_GS2U_PlayerHp{
		code = Code,
		hp = SyncHp
	},
	playerMsg:sendNetMsg(Msg),
	%%广播给周围其它人自己血量的百分比，不包括自己
	Update = #pk_GS2U_BroadcastPlayerHpPC{
		code = Code,
		hpPC = PC
	},
	playerMsg:sendMsgToNearPlayer(Update, false),
	ok.

%%根据与策划沟通结果，能量值只有自己才能看到，其他玩家是看不到别人的能量值的
%%所以只发送给自己
-spec sendPropSp(Value :: uint(), OldValue :: uint()) -> ok.
%%sendPropSp(Value, OldValue) when Value =/= OldValue ->
%%	Update = #pk_GS2U_PlayerSp{
%%		sp = Value
%%	},
%%	playerMsg:sendNetMsg(Update);
sendPropSp(_, _) ->
	ok.

-spec sendPropPhys(Value) -> ok when
	Value :: number().
sendPropPhys(Value) ->
	Update = #pk_GS2U_PlayerPhys{
		phys = erlang:trunc(Value)
	},
	playerMsg:sendNetMsg(Update),
	ok.

-spec sendPropCour(Value) -> ok when
	Value :: number().
sendPropCour(Value) ->
	Update = #pk_GS2U_PlayerCour{
		cour = erlang:trunc(Value)
	},
	playerMsg:sendNetMsg(Update),
	ok.
%%通知队伍成员自己的血量百分比
-spec notifyTeamMemberHpPC(HpPC) -> ok when
	HpPC :: uint8().
notifyTeamMemberHpPC(HpPC) ->
%%	case playerTeam2:getTeamAllMemberPidList(?PlayerTeamTypeNormal) of
%%		[] ->
%%			skip;
%%		TeamList ->
%%			Msg = #pk_GS2U_TeamMemberExtInfo{
%%				roleID = playerState:getRoleID(),
%%				level = playerState:getLevel(),
%%				hpPC = HpPC,
%%				mapID = playerState:getMapID()
%%			},
%%			PlayerEts = playerState:getMapPlayerEts(),
%%			{X, Y} = playerState:getPos(),
%%			NearPidList = mapView:getNearPlayerPid(X, Y, playerState:getMapPid(), playerState:getGroupID(), PlayerEts),
%%			%NearPidList = mapView:getNearPlayerPid(X,Y,playerState:getMapPid(),PlayerEts),
%%			case erlang:is_list(TeamList) of
%%				true ->
%%					Fun = fun({_RoleID, Pid}) ->
%%						case lists:member(Pid, NearPidList) of
%%							true when is_pid(Pid) ->
%%								psMgr:sendMsg2PS(Pid, broadcast, Msg);
%%							_ ->
%%								skip
%%						end
%%					      end,
%%					lists:foreach(Fun, TeamList)
%%			end
%%	end,
	ok.
%%通知队伍成员自己等级
-spec notifyTeamMemberLevel(Level) -> ok when
	Level :: uint8().
notifyTeamMemberLevel(Level) ->
%%	case playerTeam2:getTeamAllMemberPidList(?PlayerTeamTypeNormal) of
%%		[] ->
%%			skip;
%%		TeamList ->
%%			Msg = #pk_GS2U_TeamMemberExtInfo{
%%				roleID = playerState:getRoleID(),
%%				level = Level,
%%				hpPC = 100,
%%				mapID = playerState:getMapID()
%%			},
%%			case erlang:is_list(TeamList) of
%%				true ->
%%					[psMgr:sendMsg2PS(Pid, broadcast, Msg) || {_RoleID, Pid} <- TeamList, is_pid(Pid)];
%%				_ ->
%%					skip
%%			end
%%	end,
	ok.
%%%%职业属性秒回，返回增加的值
%%-spec tickCareerSpecProp(Second) -> number() when
%%		  Second::uint().
%%tickCareerSpecProp(Second) ->
%%	Career = playerState:getCareer(),
%%	PlayerBattleProp = playerState:getPlayerSpecBattleProp(),
%%	{PBProp,Value} = tickSpecPropByCareer(Career,Second,PlayerBattleProp),
%%	playerState:setPlayerSpecBattleProp(PBProp),
%%	Value.
%%
%%%%骑士
%%-spec tickSpecPropByCareer(Career,Second,#recPlayerSpecBattleProp{}) -> {#recPlayerSpecBattleProp{},Value} when
%%	Career::career(),Second::uint(),Value::number().
%%tickSpecPropByCareer(?Career_10_Warrior,Second,#recPlayerSpecBattleProp{holypower = Old} = PlayerBattleProp) ->
%%	MaxValue = playerState:getBattlePropTotal(?Prop_maxholypower),
%%	SecAdd = playerState:getBattlePropTotal(?Prop_holypowersec),
%%	New = SecAdd + Old,
%%	Value = misc:clamp(New, 0, MaxValue),
%%	{PlayerBattleProp#recPlayerSpecBattleProp{
%%											 holypower = Value * Second
%%											},Value};
%%%%灵魂收割者(Soul Reaper)
%%tickSpecPropByCareer(?CareerTrainee,Second,#recPlayerSpecBattleProp{ragepower = Old} = PlayerBattleProp) ->
%%	MaxValue = playerState:getBattlePropTotal(?Prop_maxragepower),
%%	SecAdd = playerState:getBattlePropTotal(?Prop_ragepowersec),
%%	New = SecAdd + Old,
%%	Value = misc:clamp(New, 0, MaxValue),
%%	{PlayerBattleProp#recPlayerSpecBattleProp{
%%											 ragepower = Value * Second
%%											},Value};
%%%%刺客(Bravo)
%%tickSpecPropByCareer(?Career_30_Bravo,Second,#recPlayerSpecBattleProp{shadowpower = Old} = PlayerBattleProp) ->
%%	MaxValue = playerState:getBattlePropTotal(?Prop_maxshadowpower),
%%	SecAdd = playerState:getBattlePropTotal(?Prop_shadowpowersec),
%%	New = SecAdd + Old,
%%	Value = misc:clamp(New, 0, MaxValue),
%%	{PlayerBattleProp#recPlayerSpecBattleProp{
%%											 shadowpower = Value * Second
%%											},Value};
%%%%魔法师(Magician)
%%tickSpecPropByCareer(?Career_20_Magician,Second,#recPlayerSpecBattleProp{magicpower = Old} = PlayerBattleProp) ->
%%	MaxValue = playerState:getBattlePropTotal(?Prop_maxmagicpower),
%%	SecAdd = playerState:getBattlePropTotal(?Prop_magicpowersec),
%%	New = SecAdd + Old,
%%	Value = misc:clamp(New, 0, MaxValue),
%%	{PlayerBattleProp#recPlayerSpecBattleProp{
%%											 magicpower = Value * Second
%%											},Value};
%%
%%tickSpecPropByCareer(?CareerMechanic,Second,#recPlayerSpecBattleProp{mechanicpower = Old} = PlayerBattleProp) ->
%%	MaxValue = playerState:getBattlePropTotal(?Prop_maxmechanicpower),
%%	SecAdd = playerState:getBattlePropTotal(?Prop_mechanicpowersec),
%%	New = SecAdd + Old,
%%	Value = misc:clamp(New, 0, MaxValue),
%%	{PlayerBattleProp#recPlayerSpecBattleProp{
%%											 mechanicpower = Value * Second
%%											},Value};
%tickSpecPropByCareer(Career, _, _) ->
%	?ERROR_OUT("Can not define career~p", [Career]),
%	{0, 0}.

%%获取玩家主菜单功能是否激活
-spec getMainMenuAct(Key) -> boolean() when
	Key :: uint().
getMainMenuAct(Key) ->
	#mainMenuCfg{
		type = Type,
		parameters = Param
	} = getCfg:getCfgPStack(cfg_mainMenu, Key),
	if
		Type =:= 1 ->
			Lev = playerState:getLevel(),
			case Lev >= Param of
				true ->
					true;
				_ ->
					false
			end;
		Type =:= 2 ->
			case playerTask:isAcceptedTaskByID(Param) of
				false ->
					case playerTask:isSubmittedTaskByID(Param) of
						false ->
							false;
						_ ->
							true
					end;
				_ ->
					true
			end;
		Type =:= 3 ->
			case playerTask:isSubmittedTaskByID(Param) of
				false ->
					false;
				_ ->
					true
			end;
		true ->
			true
	end.
%%*********************哥布林玩法相关*********************%%
%%生成[{时间，[地图1，地图2]}]的列表保存,同时返回该列表。
-spec createNoticeInfo() -> List when
	List :: list().
createNoticeInfo() ->
	TimeList = getBeginTimeList(),
	%%?DEBUG_OUT("TimeList = ~p", [TimeList]),
	Fun1 = fun(Time, AccList1) ->
		MapList = getCfg:get1KeyList(cfg_goblin),
		%%?DEBUG_OUT("MapList = ~p", [MapList]),
		%%找该时间点要刷怪的地图
		Fun2 = fun(MapID, Acclist2) ->
			case getCfg:getCfgPStack(cfg_goblin, MapID) of
				#goblinCfg{refreshtime = TimeList1} ->
					Fun3 = fun(E) ->
						E =:= Time
					       end,
					case lists:any(Fun3, TimeList1) of
						false ->
							Acclist2;
						_ ->
							[MapID | Acclist2]
					end
			end
		       end,
		ResMapList = lists:foldl(Fun2, [], MapList),
		%%?DEBUG_OUT("ResMapList = ~p", [ResMapList]),
		[{Time, ResMapList} | AccList1]
	       end,
	ResList = lists:foldl(Fun1, [], TimeList),
	%%?DEBUG_OUT("ResList = ~p", [ResList]),
	ResList.
%%检测当前时间点，哥布林玩法的开启状态，并发给客户端
sendGoblinOpenState() ->
	NoticeInfo = createNoticeInfo(),
	?DEBUG_OUT("NoticeInfo = ~p", [NoticeInfo]),
	Time = time:getSyncTime1970FromDBS(),
	{{Y, M, D}, {H, _Min, _S}} = time:convertSec2DateTime(Time),
	case lists:keyfind(H, 1, NoticeInfo) of
		{_H, MapList} ->
			EndTime = time:convertDateTime1970ToSec({{Y, M, D}, {H, 0, 0}}) + ?GoblinTotalTime,
			case Time < EndTime of
				true ->
					[MapID | _] = MapList,
					playerMsg:sendNetMsg(#pk_GS2U_Goblin_Open_State{isOpen = true, mapID = MapID});
				_ ->
					playerMsg:sendNetMsg(#pk_GS2U_Goblin_Open_State{isOpen = false, mapID = 0})
			end;
		_ ->
			playerMsg:sendNetMsg(#pk_GS2U_Goblin_Open_State{isOpen = false, mapID = 0})
	end,
	ok.
%%从配置获得哥布林活动时间
-spec getBeginTimeList() -> List when
	List :: list().
getBeginTimeList() ->
	MapList = getCfg:get1KeyList(cfg_goblin),
	Fun = fun(MapID, AccList) ->
		case getCfg:getCfgPStack(cfg_goblin, MapID) of
			#goblinCfg{refreshtime = TimeList} ->
				AccList1 = lists:umerge(TimeList, AccList),
				AccList1;
			_ ->
				AccList
		end
	      end,
	lists:usort(lists:foldl(Fun, [], MapList)).

getrecLogPlayerOffline(OnlineOrOffineLine) ->
	#recLogPlayerOffline{
		playerID = playerState:getRoleID(),                %%角色ID
		level = playerState:getLevel(),                        %%等级
		exp = playerState:getCurExp(),                            %%经验值
		gold = playerState:getCoin(?CoinTypeGold),                        %%金币
		bindgold = 0, %%绑定金币
		diamond = playerState:getCoin(?CoinTypeDiamond),                    %%钻石
		prestige = playerState:getCoin(?CoinTypePrestige),                %%声望
		honor = playerState:getCoin(?CoinTypeHonor),                        %%荣誉值
		ticket = playerState:getCoin(?CoinTypeBindDiamond),                    %%点券
		purpleEssence = playerState:getCoin(?CoinTypePurpleEssence),        %%紫色精华
		goldenEssence = playerState:getCoin(?CoinTypeGoldenEssence),        %%金色精华
		onlineOrOffline = OnlineOrOffineLine,    %%上线还是下线，（=0表示上线，=1表示下线）
		time = time:getLogTimeSec()            %%时间
	}.

-spec addHDBattleHonor(Now :: integer()) -> ok.
addHDBattleHonor(Now) ->
	case playerState:getMapID() =:= ?HDBattleMapID of
		true ->
			DiffSec2 = erlang:trunc((Now - playerPropSync:getProp(?SerProp_HDBattleGetRYTime)) / 1000),
			JGTime = case getCfg:getCfgPStack(cfg_globalsetup, battle_add_time) of
				         #globalsetupCfg{setpara = [V]} ->
					         V;
				         _ ->
					         10
			         end,
			case DiffSec2 >= JGTime of
				true ->
					core:sendMsgToActivity(?ActivityType_HDBattle, updateHDInfo,
						{playerState:getRoleID(), self(), playerState:getNetPid()}),
					playerPropSync:setInt64(?SerProp_HDBattleGetRYTime, Now);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.