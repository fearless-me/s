%%
%%%-------------------------------------------------------------------
%%% @author chengxs
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 野外boss
%%% @end
%%% Created : 13. 六月 2015 16:46
%%%-------------------------------------------------------------------



-module(mapWildBoss).
-include("mapPrivate.hrl").
-include("gsInc.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([
	initWildBoss/0,
	getWildBossTarget/1,
	updateWildBossCode/1,
	tick/0,
	wildBossBeKilled/2,
	mapRestoryWildBossKilled/0,
	updateWildBossTargetCode/2,

	recordDamageValue/7
]).

-export([
	getRealAttacker/3
]).

initWildBoss_([],_NowTime)->
	ok;
initWildBoss_([BossID|BT],NowTime)->
	MapID = mapState:getMapId(),
	case myEts:lookUpEts(?TABLE_WildBoss, BossID) of
		[#recWildBossInfo{nextRefreshTime = NRTime, isFresh = false, isNotice = _IsNotice,mapID = BossMapID}] when NowTime >= NRTime andalso  BossMapID=:=MapID->
			%% 到刷新时间了，BOSS还没刷新，那么刷新吧
			#wildbossCfg{pos = Pos} = getCfg:getCfgByKey(cfg_wildboss, BossID),
			case spawnWildBoss(BossID, Pos) of
				{true, BossCode} ->
					myEts:updateEts(?TABLE_WildBoss, BossID,
						[
							{#recWildBossInfo.mapID, MapID},
							{#recWildBossInfo.bossPid, self()},
							{#recWildBossInfo.bossCode, BossCode},
							{#recWildBossInfo.targetCode, 0},
							{#recWildBossInfo.isFresh, true}
						]),
					ok;
				_ ->
					?ERROR_OUT("spawnWildBoss failed MapID[~p,~p]", [self(), BossID])
			end;
		_ ->
			skip
	end,
	initWildBoss_(BT,NowTime).

%%初始化野外boss
initWildBoss() ->
	BossIDList = getCfg:get1KeyList(cfg_wildboss),
	NowTime = time:getSyncTime1970FromDBS(),
	initWildBoss_(BossIDList,NowTime),
	ok.

%%这个是初始化野外BOSS方法里面提取出来的，本来就是注释掉了的
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LUN-844 20161222 begin
%% 问题：地图没人后会被销毁，销毁后无法正常刷新wildboss，而系统公告是刷新的时候再广播的
%% 解决：将mapWildboss.erl中关于公告的广播转移到activityOtp的心跳消息中处理
%case IsNotice of
%	false ->
%		%% 给在线玩家发系统信息
%		#mapsettingCfg{desc = MapName} = getCfg:getCfgPStack(cfg_mapsetting, MapID),
%		#monsterCfg{showName = BossName} = getCfg:getCfgPStack(cfg_monster, BossID),
%		Text = stringCfg:getString(cnTextWildBossRefresh, [BossName, MapName]),
%		?LOG_OUT("initWildBoss:~p,~ts,~p,~ts,~ts", [MapID,MapName,BossID,BossName,Text]),
%		core:sendBroadcastNoticeLS(?NBroadCastColor, Text),
%		psMgr:sendMsg2PS(?PsNamePlayerMgr, wildBossRefresh, Text),
%
%		%% 设置已经公告
%		myEts:updateEts(?TABLE_WildBoss, MapID,
%			[
%				{#recWildBossInfo.isNotice, true}
%			]),
%		ok;
%	_ ->
%		skip
%end,
%% LUN-844 20161222 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 野外BOSS刷新心跳
-spec tick() -> ok.
tick() ->
	%% 判断地图是否在等待强制销毁
	case mapState:getWaitForceDestory() of
		true ->
			%% 在等待强制销毁的流程了，就不再刷野外BOSS了
			skip;
		_ ->
			%% 与初始化判断逻辑一样，大于刷新时间，且没有刷新，才刷新野外BOSS
			initWildBoss(),
			ok
	end,
	ok.

-spec spawnWildBoss(BossID :: uint(), Pos :: list()) -> {boolean(), Code::uint32()}.
spawnWildBoss(BossID, Pos) ->
	MapID = mapState:getMapId(),
	MonsterEts = mapState:getMapMonsterEts(),
	PlayerEts = mapState:getMapPlayerEts(),
	PetEts = mapState:getMapPetEts(),
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%% begin 【野外BOSS优化改动】 20160913
	mapState:delWildBossDamageFromPlayer(BossID),
	%% end 【野外BOSS优化改动】
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%%预防重复刷出boss，先删除掉
	gameMapLogic:destroyAllMonsterByID(BossID),
	case getCfg:getCfgPStack(cfg_monster, BossID) of
		#monsterCfg{level = Level} ->
			[PosX, PosY|_] =  Pos,
			Arg = #recSpawnMonster{
				id = BossID,
				mapID = MapID,
				mapPid = self(),
				x = PosX,
				y = PosY,
				level = Level,
				camp = 0,
				guildID = 0,
				playerEts = PlayerEts,
				monsterEts = MonsterEts,
				petEts = PetEts,
				groupID = 0
			},
			Code = monsterInterface:spawnMonster(Arg),
			?LOG_OUT("wildboss spawn code[~p],BossID[~p],Boss mapPid[~p], MapID[~p]",[Code, BossID, self(), MapID]),
			case Code > 0 of
				true ->
					{true, Code};
				_ ->
					{false, 0}
			end;
		_ ->
			{false, 0}
	end.

-spec mapRestoryWildBossKilled() -> ok.
mapRestoryWildBossKilled() ->
	MapID = mapState:getMapId(),
	BossIDList = getCfg:get1KeyList(cfg_wildboss),
	Fun = fun(BossID) ->
		case myEts:lookUpEts(?TABLE_WildBoss, BossID) of
			[#recWildBossInfo{bossCode = BossCode}] when BossCode /= 0  ->
				%% 野外BOSS还没死亡，设置为下次还可刷新状态
				myEts:updateEts(?TABLE_WildBoss, BossID,
					[
						{#recWildBossInfo.bossPid, undefined},
						{#recWildBossInfo.bossCode, 0},
						{#recWildBossInfo.targetCode, 0},
						{#recWildBossInfo.isFresh, false}
					]),
				?LOG_OUT("mapRestoryWildBossKilled mapId[~p,~p], BossCode[~p]", [self(), MapID, BossCode]),
				ok;
			_ ->
				skip
		end
		  end,
	lists:map(Fun,BossIDList),
	ok.

-spec wildBossBeKilled(BossID :: uint(), BossCode :: uint()) -> ok.
wildBossBeKilled(BossID, BossCode) ->
	MapID = mapState:getMapId(),
	case getCfg:getCfgPStack(cfg_monster, BossID) of
		#monsterCfg{monsterSubType = ?MonsterSTypeWildBoss} ->
			%% 野外BOSS死亡
			?LOG_OUT("wildBossBeKilled id:~p, code:~p, mapID=[~p,~p]", [BossID, BossCode, MapID, self()]),
			case getCfg:getCfgPStack(cfg_wildboss, BossID) of
				#wildbossCfg{refreshTime = Time} ->
					%% 攻击者
					ETSData = myEts:lookUpEts(?TABLE_WildBoss, BossID),

					%% 打印目标信息
					?LOG_OUT("wildBossBeKilled target data:~p", [ETSData]),

					TargetCode =
						case monsterState:getAttackTarget(BossCode) of
							undefined ->
								case ETSData of
									[#recWildBossInfo{targetCode = TC}] ->
										?LOG_OUT("wildBossBeKilled targetcode1:~p", [TC]),
										TC;
									_ ->
										?ERROR_OUT("wildBossBeKilled targetcode2:~p", [ETSData]),
										0
								end;
							V ->
								?LOG_OUT("wildBossBeKilled getAttackTarget3:~p,~p", [V, ETSData]),
								V
						end,

					%% 设置BOSS死亡，以及下一次刷新时间
					NowTime = time:getSyncTime1970FromDBS(),
					myEts:updateEts(?TABLE_WildBoss, BossID,
						[
							{#recWildBossInfo.mapID, mapState:getMapId()},
							{#recWildBossInfo.bossPid, undefined},
							{#recWildBossInfo.bossCode, 0},
							{#recWildBossInfo.targetCode, 0},
							{#recWildBossInfo.isNotice, false},
							{#recWildBossInfo.isFresh, false},
							{#recWildBossInfo.nextRefreshTime, NowTime + Time}
						]),

					%% 下面这个只是保护性日志
					HateList= monsterState:getHateList(BossCode),

					%% 直接打印仇恨列表
					?LOG_OUT("wildBossBeKilled TargetCode=~p, hatelist=~p", [TargetCode, HateList]),

					%% 取真正的攻击者
					RTargetCode = getRealAttacker(BossCode, TargetCode),

					%% 检查，如果目标为0
					TargetCode2 =
						case RTargetCode =:= 0 of
							true ->
								case mapState:getWildBossLastTarget(BossID) of
									0 ->
										mapState:getWildBossLastAttacker(BossID);
									CodeLastTarget ->
										CodeLastTarget
								end;
							_ ->
								RTargetCode
						end,

					{TarRoleID, TarTeamID} = getRealAttackerRoleIDAndTeamID(BossCode,TargetCode2),
					?LOG_OUT("wildBoss dead mapid[~p, ~p, ~p] killer[~p], realkillercode[~p],tarRoleID[~p],tarTeamID[~p]",
						[MapID,BossID, self(), TargetCode2, RTargetCode, TarRoleID, TarTeamID]),
					ListRoleID = mapState:getWildBossDamageFromPlayer_validRoleID(BossID),
					psMgr:sendMsg2PS(?PsNamePlayerMgr, wildBossDead, {MapID, BossID, TargetCode2, TarRoleID, TarTeamID, ListRoleID}),

					%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
					%% begin 【野外BOSS优化改动】 20160913
%%					sendRewardNormal(BossID),                                                         %% 发送保底奖励(这个奖励到玩家进程去发了)
					RoleNameLucky = sendRewardLucky(BossID),                                          %% 发送幸运奖励
					RoleNameKillerTeamLeader = getKillerTeamLeaderName(TarRoleID, TarTeamID),   %% 获取击杀者所在队伍队长名
					sendBroadcastNotice_BossIsDead(RoleNameKillerTeamLeader, RoleNameLucky, BossID),    %% 发送BOSS死亡公告
					%% end 【野外BOSS优化改动】
					%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

					ok;
				Error ->
					?ERROR_OUT("wildBossBeKilled not find bossconf:~p", [Error]),
					skip
			end;
		_ ->
			skip
	end,
	ok.

-spec getWildBossTarget(BossID::uint()) -> uint().
getWildBossTarget(BossID) ->
	case myEts:lookUpEts(?TABLE_WildBoss, BossID) of
		[#recWildBossInfo{targetCode = TargetCode, bossCode = BossCode, isFresh = true}|_] when BossCode > 0 ->
			%% BOSS要自己有Code，已经刷新出来
			TargetCode;
		_ -> 0
	end.

%% 清除野外BOSS目标
-spec updateWildBossCode(Code::uint()) -> uint().
updateWildBossCode(Code) ->
	BossID = monsterState:getId(Code),
	case myEts:lookUpEts(?TABLE_WildBoss, BossID) of
		[#recWildBossInfo{bossCode = Code, targetCode = _TargetCode} = Data] ->
			?LOG_OUT("updateWildBossCode delete target:map:[~p,~p], code=~p, Data:~p", [BossID, self(), Code, Data]),
			myEts:updateEts(?TABLE_WildBoss, BossID, {#recWildBossInfo.targetCode, 0});
		_ ->
			skip
	end.

%% 保存野外BOSS最后一个目标(玩家)
-spec updateWildBossTargetCode(Code::uint(), TargetCode::uint()) -> ok.
updateWildBossTargetCode(Code, TargetCode) ->
	BossID = monsterState:getId(Code),
	myEts:updateEts(?TABLE_WildBoss, BossID, {#recWildBossInfo.targetCode, TargetCode}),

	%% 保存野外BOSS最后一个目标
	case TargetCode of
		0 -> skip;
		_ ->
			RTargetCode = getRealAttacker(Code, TargetCode),
			mapState:setWildBossLastTarget(RTargetCode,BossID),
			ok
	end,
	ok.

getRealAttacker(MonsterCode, TargetCode) ->
	case codeMgr:getObjectTypeByCode(TargetCode) of
		?ObjTypePlayer ->
			TargetCode;
		?ObjTypePet ->
			PetEts = monsterState:getMapPetEts(MonsterCode),
			case myEts:lookUpEts(PetEts, TargetCode) of
				[#recMapObject{ownCode = OwnCode}|_] -> OwnCode;
				_ -> 0
			end;
		?ObjTypeCarrier ->
			MonsterEts = monsterState:getMapMonsterEts(MonsterCode),
			case myEts:lookUpEts(MonsterEts, TargetCode) of
				[#recMapObject{ownCode = OwnCode}|_] -> OwnCode;
				_ -> 0
			end;
		?ObjTypeMonster ->
			MonsterEts = monsterState:getMapMonsterEts(MonsterCode),
			case myEts:lookUpEts(MonsterEts, TargetCode) of
				[#recMapObject{ownCode = OwnCode}|_] -> OwnCode;
				_ -> 0
			end;
		_ -> 0
	end.

%%方法调用者用不到返回TargetPid的地方，可以默认传0进来
getRealAttacker(MonsterCode, TargetCode, TargetPid) ->
	case codeMgr:getObjectTypeByCode(TargetCode) of
		?ObjTypePlayer ->
			{TargetCode,TargetPid};
		?ObjTypePet ->
			PetEts = monsterState:getMapPetEts(MonsterCode),
			case myEts:lookUpEts(PetEts, TargetCode) of
				[#recMapObject{ownCode = OwnCode,ownPid = OwnPid}|_] -> {OwnCode,OwnPid};
				_ -> {0,0}
			end;
		?ObjTypeCarrier ->
			MonsterEts = monsterState:getMapMonsterEts(MonsterCode),
			case myEts:lookUpEts(MonsterEts, TargetCode) of
				[#recMapObject{ownCode = OwnCode,ownPid = OwnPid}|_] -> {OwnCode,OwnPid};
				_ -> {0,0}
			end;
		?ObjTypeMonster ->
			MonsterEts = monsterState:getMapMonsterEts(MonsterCode),
			case myEts:lookUpEts(MonsterEts, TargetCode) of
				[#recMapObject{ownCode = OwnCode,ownPid = OwnPid}|_] -> {OwnCode,OwnPid};
				_ -> {0,0}
			end;
		_ -> {0,0}
	end.

getRealAttackerRoleIDAndTeamID(MonsterCode, TargetCode)->
	case codeMgr:getObjectTypeByCode(TargetCode) of
		?ObjTypePlayer ->
			PlayerEts = monsterState:getMapPlayerEts(MonsterCode),
			case myEts:lookUpEts(PlayerEts, TargetCode) of
				[#recMapObject{id = ID, teamID = TeamID}|_] ->
					{ID,TeamID};
				_ ->
					{0,0}
			end;
		_ ->
			{0,0}
	end.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% begin 【野外BOSS优化改动】 20160913
%% wildboss（野外BOSS）参照worldboss（首领入侵）记录造成伤害值的玩家
%% 当boss死亡时，给予造成伤害值的玩家保底奖励（globalsetup.wildboss_reward_normal），随机抽取1名玩家获得幸运奖励（globalsetup.wildboss_reward_lucky）
%% 与首领入侵不同，玩家下线并不会失去获得奖励的资格，也没有伤害的排名
%% 此次功能调整为增强参与奖部分，原BOSS掉落还是归属于击杀BOSS的玩家（及其队伍）

%% 记录伤害值
-spec recordDamageValue(
	Flag::boolean(),            %% 是否记录
	AttackerCode::integer(),    %% 攻击者Code
	AttackerID::integer(),      %% 攻击者ID
	AttackerPid::pid(),         %% 攻击者进程ID
	AttackerName::string(),     %% 攻击者名称
	InjuredCode::integer(),     %% 被攻击者Code
	DamageVale::number()        %% 伤害值（传参为血量变化值，故有效值为负）
) ->ok | skip.
recordDamageValue(true, AttackerCode, AttackerID, AttackerPid, AttackerName, InjuredCode, DamageVale) when
	InjuredCode =/= AttackerCode andalso erlang:is_number(DamageVale) andalso DamageVale < 0 ->
	%% 根据攻击者Code定位玩家
	FunFindPlayer =
		fun(Ets, Line) ->
			case myEts:lookUpEts(Ets, AttackerCode) of
				[#recMapObject{ownId = OwnId, ownCode = OwnCode} | _] ->
					PlayerEts = mapState:getMapPlayerEts(),
					case myEts:lookUpEts(PlayerEts, OwnCode) of
						[#recMapObject{pid = OwnPid, name = OwnName }] ->
							{OwnId, OwnPid, OwnName, OwnCode};
						_ ->
%%							?WARN_OUT("can not find owner info from ets ownid:~p owncode:~p fromline:~p", [OwnId, OwnCode, Line]),
							{OwnId, skip, undefined, 0}
					end;
				_  ->
					?ERROR_OUT("can not find attacker info from ets attackerid:~p attackercode:~p fromline:~p", [AttackerID, AttackerCode, Line]),
					{skip, skip, skip, 0}
			end
		end,
	{RealAttackerID, _RealAttackerPid, _RealAttackerName, RealAttackerCode} =
		case codeMgr:getObjectTypeByCode(AttackerCode) of
			%% 攻击者为玩家时直接返回玩家信息
			?ObjTypePlayer ->
				{AttackerID, AttackerPid, AttackerName, AttackerCode};
			%% 攻击者为宠物时返回创建者信息
			?ObjTypePet ->
				PetEts = mapState:getMapPetEts(),
				FunFindPlayer(PetEts, ?LINE);
			%% 其它情况将攻击者视为怪物尝试返回创建者信息
			_ ->
				MonsterEts = mapState:getMapMonsterEts(),
				FunFindPlayer(MonsterEts, ?LINE)
		end,
	%% 记录伤害值
	case RealAttackerID of
		skip ->
			skip;
		_ ->
			case myEts:lookUpEts(mapState:getMapMonsterEts(), InjuredCode) of
				[#recMapObject{id = BossID} | _] ->
					mapState:setWildBossLastAttacker(RealAttackerCode,BossID),
					mapState:addWildBossDamageFromPlayer(RealAttackerID,BossID, DamageVale);
				_  ->
					?ERROR_OUT("can not find attacker info from ets attackercode:~p fromline:~p", [InjuredCode, ?LINE]),
					{skip, skip, skip, 0}
			end
	end;
recordDamageValue(_,_,_,_,_,_,_) ->
	skip.
%%
%%%% 给参与BOSS战的玩家保底奖励
%%-spec sendRewardNormal(BossID::integer()) -> ok.
%%sendRewardNormal(BossID) ->
%%	ListRoleID = mapState:getWildBossDamageFromPlayer_validRoleID(BossID),
%%	case getCfg:getCfgByKey(cfg_globalsetup, wildboss_reward_normal) of
%%		#globalsetupCfg{setpara = [ItemID]} ->
%%			case getCfg:getCfgByKey(cfg_item, ItemID) of
%%				#itemCfg{name = ItemName} ->
%%					Title = stringCfg:getString(wildboss_reward_normal_title),
%%					Content = stringCfg:getString(wildboss_reward_normal_content, [ItemName]),
%%					FunSendMail =
%%						fun(RoleID) ->
%%							Attachment = playerMail:createMailGoods(ItemID, 1, true, 0, RoleID, ?ItemSourceWildBoss),  %% 虽然是playerMail，但是可以被其它GS进程调用
%%							mail:sendSystemMail(RoleID, Title, Content, Attachment, [])
%%						end,
%%					lists:foreach(FunSendMail, ListRoleID);
%%				_ ->
%%					?ERROR_OUT("can not find itemid:~p from cfg_item~n~p", [ItemID, ListRoleID])
%%			end;
%%		_ ->
%%			?ERROR_OUT("can not find wildboss_reward_normal from cfg_globalsetup~n~p", [ListRoleID])
%%	end,
%%	ok.

%% 随机选取一名玩家给予幸运奖励，并返回其姓名用于系统公告
-spec sendRewardLucky(BossID::integer()) -> string().
sendRewardLucky(_BossID) ->
	%% 屏蔽野外首领幸运奖励
	%% http://192.168.2.32:8080/browse/LUNA-3093
	[];
sendRewardLucky(BossID) ->
	ListRoleID = mapState:getWildBossDamageFromPlayer_validRoleID(BossID),
	case getCfg:getCfgByKey(cfg_wildboss, BossID) of
		#wildbossCfg{lucky  = ItemID} ->
			case getCfg:getCfgByKey(cfg_item, ItemID) of
				#itemCfg{name = ItemName} ->
					Title = stringCfg:getString(wildboss_reward_lucky_title),
					Content = stringCfg:getString(wildboss_reward_lucky_content, [ItemName]),
					LuckRoleIDList = mapState:getWildBossRoleIDListLucky(),
					#globalsetupCfg{setpara = [MaxNum]} = getCfg:getCfgPStack(cfg_globalsetup, wildboss_times_lucky),
					sendLucky(ListRoleID,ItemID,Title,Content,LuckRoleIDList,MaxNum);
				_ ->
					?ERROR_OUT("can not find itemid:~p from cfg_item~n~p", [ItemID, ListRoleID]),
					[]
			end;
		_ ->
			?ERROR_OUT("can not find wildboss_reward_lucky from cfg_globalsetup~n~p", [ListRoleID]),
			[]
	end.

%%发送玩家幸运奖励
sendLucky([],_ItemID,_Title,_Content,_LuckRoleIDList,_MaxNum)->
	[];
sendLucky([RoleID|T],ItemID,Title,Content,LuckRoleIDList,MaxNum)->
	case checkGetLuckNum(RoleID,LuckRoleIDList,MaxNum) of
		false->
			sendLucky(T,ItemID,Title,Content,LuckRoleIDList,MaxNum);
		_->
			case core:queryRoleKeyInfoByRoleID(RoleID) of
				#?RoleKeyRec{roleName = RoleName} ->
					mapState:addWildBossRoleIDLucky(RoleID),
					Attachment = playerMail:createMailGoods(ItemID, 1, true, 0, RoleID, ?ItemSourceWildBoss),  %% 虽然是playerMail，但是可以被其它GS进程调用
					mail:sendSystemMail(RoleID, Title, Content, Attachment, []),
					RoleName;
				_ ->
					sendLucky(T,ItemID,Title,Content,LuckRoleIDList,MaxNum)
			end
	end.

checkGetLuckNum(RoleID,LuckRoleIDList,MaxNum)->
	case lists:keyfind(RoleID,1,LuckRoleIDList) of
		false ->
			true;
		{RoleID,Num}->
			Num<MaxNum
	end.

%% 获取击杀者所在队伍的队长名（如果若不存在队伍则使用击杀者代替）
-spec getKillerTeamLeaderName(KillerID::uint(), TeamID::uint()) -> string().
getKillerTeamLeaderName(KillerID, TeamID) ->
	KillerTeamLeaderID =
		case TeamID of
			0 ->
				KillerID;
			_ ->
				case teamInterface:getLeaderIDWithTeamID(TeamID) of
					LeaderID when LeaderID > 0 ->
						LeaderID;
					_ ->
						?WARN_OUT("can not find teamid:~p", [TeamID]),
						KillerID
				end
		end,
	case core:queryRoleKeyInfoByRoleID(KillerTeamLeaderID) of
		#?RoleKeyRec{roleName = KillerTeamLeaderName} ->
			KillerTeamLeaderName;
		_ ->
			?ERROR_OUT("can not find roieid:~p from rolekeyinfo", [KillerTeamLeaderID]),
			[]
	end.

%% 发送BOSS死亡公告
-spec sendBroadcastNotice_BossIsDead(RoleNameKillerTeamLeader::string(), RoleNameLucky::string(), BossID::uint()) -> ok.
sendBroadcastNotice_BossIsDead(RoleNameKillerTeamLeader, RoleNameLucky, BossID) ->
	case getCfg:getCfgByKey(cfg_monster, BossID) of
		#monsterCfg{name = BossName} ->
			Param =
				case RoleNameLucky of
					[]->
						[
							RoleNameKillerTeamLeader,
							BossName
						];
					_ ->
						[
							RoleNameKillerTeamLeader,
							BossName,
							RoleNameLucky
						]
				end,
			BroadcastNotice =
				case RoleNameLucky of
					[] ->
						stringCfg:getString(wildboss_is_dead1, Param);
					_->
						stringCfg:getString(wildboss_is_dead, Param)
				end,
			core:sendBroadcastNotice(BroadcastNotice);
		_ ->
			?ERROR_OUT("can not find monsterid:~p from cfg_monster", [BossID])
	end,
	ok.

%% end 【野外BOSS优化改动】
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
