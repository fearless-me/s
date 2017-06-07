%%
%% @doc @todo 查看远程玩家属性.

-module(playerRPView).
-include("playerPrivate.hrl").
%%-define(RPBattlePropIDS, [
%%	?Prop_PhysicalAttack,?Prop_MagicAttack,
%%	?Prop_PhysicalDefence,?Prop_MagicDefence,
%%	?Prop_CriticalLevel, ?Prop_CriticalResistLevel,
%%	?Prop_CriticalDamageLevel,?Prop_TenaciousLevel,
%%	?Prop_HitLevel,?Prop_DodgeLevel, ?Prop_ArmorPenetrationLevel,
%%	?Prop_HPRecover,?Prop_MPRecover,?Prop_MaxHP
%%]).           %%要查看的远程玩家战斗属性ID

%%-define(RPBattlePowersecPropIDS, [?Prop_holypowersec,?Prop_magicpowersec,?Prop_shadowpowersec,?Prop_ragepowersec, ?Prop_mechanicpowersec]).       %%根据职业取
%%-define(RPBattlePowerPropIDS, [?Prop_maxholypower,?Prop_maxmagicpower,?Prop_maxshadowpower,?Prop_maxragepower, ?Prop_maxmechanicpower]).          %%根据职业取
%%-define(RPBattlePropIDS1, [?Prop_master,?Prop_survivemas,?Prop_regainmast]).


-export([
	queryRPInfo/1,
	getBattlePropList/0
]).

-export([
	queryRangeServerRPKeyInfo/1,
	gm_QueryObjByRoleID/1
]).

%%查看远程玩家的属性
-spec queryRPInfo(RoleID) -> ok when RoleID::uint().
queryRPInfo(RoleID) ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_RPView) of
		true ->
			case playerState:getRoleID() of
				RoleID -> skip;
				_ ->
					try
						case playerMgrOtp:getOnlinePlayerInfoByID(RoleID) of
							#rec_OnlinePlayer{} = PlayerInfo ->
								queryLocalServerRPInfo(PlayerInfo);
							_ ->
								queryRangeServerRPInfo(RoleID)
						end
					catch
						_:Why  ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_ChatErrorReceiverOffLine),
							?LOG_OUT("~p queryRpInfo exption Why:~p", [?MODULE, Why])
					end
			end;
		_ ->
			?ERROR_OUT("queryRPInfo:~p,~p", [playerState:getRoleID(), RoleID]),
			skip
	end,
	ok.

%% 查看本线玩家的属性
-spec queryLocalServerRPInfo(#rec_OnlinePlayer{}) -> ok.
queryLocalServerRPInfo(#rec_OnlinePlayer{pid = PlayerPid,roleID = RoleID}) ->
	case misc:is_process_alive(PlayerPid) of
		true ->
			querytRPPropMsg(PlayerPid, RoleID);
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_ChatErrorReceiverOffLine)
	end,
	ok.

%% 查看跨线玩家的属性
-spec queryRangeServerRPInfo(RoleID) -> ok when
	RoleID::uint().
queryRangeServerRPInfo(RoleID) ->
	%% 先获取该玩家的在线情况
	Ret = case core:queryPlayerPidByRoleID(RoleID) of
              offline ->
			      false;
              PlayerPid ->
                  querytRPPropMsg(PlayerPid, RoleID),
                  true
	      end,
	case Ret of
		true -> skip;
		_ -> playerMsg:sendErrorCodeMsg(?ErrorCode_ChatErrorReceiverOffLine)
	end,
	ok.

%% 查看跨线玩家的rolekeyrec
-spec queryRangeServerRPKeyInfo(RoleID::uint()) -> {} | #?RoleKeyRec{}.
queryRangeServerRPKeyInfo(RoleID) ->
	core:queryRoleKeyInfoByRoleID(RoleID).

gm_QueryObjByRoleID(RoleID) ->
	Str = case core:queryOnLineRoleByRoleID(RoleID) of
			  #rec_OnlinePlayer{accountID = AID, code = Code, roleID = ID} ->
                  io_lib:format("queryobj success:accountID=~p, playerCode=~p, playerName=~ts, playerId=~p",
                      [AID, Code, playerNameUID:getPlayerNameByUID(ID), ID]);
			  _ ->
				  io_lib:format("queryobj failed:~p", [RoleID])
		  end,
	playerChat:onSystemChatMsg(Str),
	ok.

%% 获取玩家的战斗属性
-spec getBattlePropList() -> list().
getBattlePropList() ->
	L = lists:seq(?Prop_Min, ?PropMax),
	Fun = fun(PropID, RPProps) ->
				  RPProps ++ [playerState:getBattlePropTotal(PropID)]
		  end,
	lists:foldl(Fun, [], L).
%%	PowersecProp = playerState:getBattlePropTotal(lists:nth(Career, ?RPBattlePowersecPropIDS)),
%%	PowerProp = playerState:getBattlePropTotal(lists:nth(Career, ?RPBattlePowerPropIDS)),
%%	TotalDamage = calcDamageProp(),
%%	TotalDefence = calcSurvival(),
%%	TotalRecovery = calcRecovery(),
%%	lists:foldl(Fun, [], ?RPBattlePropIDS) ++ [PowersecProp, PowerProp, TotalDamage, TotalDefence, TotalRecovery] ++
%%	lists:foldl(Fun, [], ?RPBattlePropIDS1).

%%%% 计算伤害属性
%%-spec calcDamageProp() -> number().
%%calcDamageProp() ->
%%	HolyDamage = playerState:getBattlePropTotal(?Prop_holydamage),
%%	PhysicalDamage = playerState:getBattlePropTotal(?Prop_physicaldamage),
%%	ShadowDamage = playerState:getBattlePropTotal(?Prop_shadowdamage),
%%	ElementDamage = playerState:getBattlePropTotal(?Prop_elementdamage),
%%	Total = HolyDamage + PhysicalDamage + ShadowDamage + ElementDamage,
%%
%%
%%	Master = playerState:getBattlePropTotal(?Prop_master),
%%	Critical = playerState:getBattlePropTotal(?Prop_critical),
%%	CoolSpeed = playerState:getBattlePropTotal(?Prop_coolspeed),
%%	SaveEnergy = playerState:getBattlePropTotal(?Prop_saveenergy),
%%	AttackSpeed = playerState:getBattlePropTotal(?Prop_attackspeed),
%%	CriticalArg = playerState:getBattlePropTotal(?Prop_criticalfactor),
%%	Total * (1 + AttackSpeed) * (1 + Critical * CriticalArg) * (1 + Master) * (1 + CoolSpeed) * (1 + SaveEnergy).

%%%%计算生存属性
%%-spec calcSurvival() -> number().
%%calcSurvival() ->
%%	Holyresist = playerState:getBattlePropTotal(?Prop_holyresist),
%%	Physicalresist = playerState:getBattlePropTotal(?Prop_physicalresist),
%%	Shadowresist = playerState:getBattlePropTotal(?Prop_shadowresist),
%%	Elementresist = playerState:getBattlePropTotal(?Prop_elementresist),
%%
%%	%%HolyDef = playerState:getBattlePropTotal(?Prop_holydefence),
%%	PhysicalDef = playerState:getBattlePropTotal(?Prop_physicaldefence),
%%	%%ShadowDef = playerState:getBattlePropTotal(?Prop_shadowdefence),
%%	ElementDef = playerState:getBattlePropTotal(?Prop_elementdefence),
%%
%%
%%	Holyresist1 = 1 - (1 - Holyresist) / (1 + ElementDef / 1280),
%%	Physicalresist1 = 1 - (1 - Physicalresist) / (1 + PhysicalDef / 1280),
%%	Shadowresist1 = 1 - (1 - Shadowresist) / (1 + ElementDef / 1280),
%%	Elementresist1 = 1 - (1 - Elementresist) / (1 + ElementDef / 1280),
%%	AvgResist = (Holyresist1 + Physicalresist1 + Shadowresist1 + Elementresist1) / 4,
%%	Dodge = playerState:getBattlePropTotal(?Prop_dodge),
%%	Parry = playerState:getBattlePropTotal(?Prop_parry),
%%	Block = playerState:getBattlePropTotal(?Prop_block),
%%	Blockfactor	=  playerState:getBattlePropTotal(?Prop_blockfactor),
%%	MaxHp = playerState:getBattlePropTotal(?Prop_MaxHP),
%%	MaxHp / (1 - AvgResist) / (1 - Dodge * 0.5) /  (1 - Parry * 0.5) / (1 - Block * Blockfactor * 0.5).

%%计算生命恢复
-spec calcRecovery() -> number().
calcRecovery() ->
	playerState:getBattlePropTotal(?Prop_HPRecover).
	

%% 发送请求查询rp玩家对象属性
-spec querytRPPropMsg(TargetPid::pid(), RoleID::uint()) -> ok.
querytRPPropMsg(TargetPid, RoleID) ->
	psMgr:sendMsg2PS(TargetPid, querytRPPropMsg, {RoleID, playerState:getNetPid()}),
	ok.