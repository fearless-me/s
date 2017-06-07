%%
%% @author luowei
%% @doc @todo 玩家回合制战斗


-module(playerTurnBattle).
-author(luowei).

-include("playerPrivate.hrl").



%% ====================================================================
%% API functions
%% ====================================================================
-export([
		 	initPetPos/2,
			initMonsterPos/1,
		 	initBattle/5,
			initBattleOrder/1,
			startBattle/6,
			
			sendBattleResList/1,
			sendRequestBattleEnd/1,
			sendInitBattleListToClient/1
		]).

%%初始化回合制战斗数据(我方,对方)
-spec initBattle(BattleType::uint(),Camp::uint(),Lv::uint(),EquipList::list(),InitData::list()) -> [#rec_turn_battle{}, ...].
initBattle(?RoleBattle, Camp, _Lv, _EquipList, RoleList) ->
	initRoleBattle(Camp, RoleList);
initBattle(?PetBattle, Camp, Lv, EquipList, PetList) -> 
	initPetBattle(Camp, Lv, EquipList, PetList);
initBattle(?MonsterBattle, Camp, _Lv, _EquipList, MonsterList) ->
	initMonsterBattle(Camp, MonsterList).



%%初始化宠物位置
-spec initPetPos(PosList::list(), PetList::list()) -> list().
initPetPos(PosList, PetList) ->
	initPetPos(PosList, [], PetList, 0).

initPetPos([], L, _PetList, _Num) ->
	L;
initPetPos([0 | Pl], L, PetList, Num) ->
	initPetPos(Pl, L, PetList, Num + 1);
initPetPos([PetID | Pl], L, PetList, Num) ->
	Pi = lists:keyfind(PetID, #recPetInfo.pet_id, PetList),
	initPetPos(Pl, [{Pi, Num} | L], PetList, Num + 1).

%%初始化怪物位置
-spec initMonsterPos(PosList::list()) -> list().
initMonsterPos(PosList) ->
	initMonsterPos(PosList, [], 0).
initMonsterPos([], L, _Num) ->
	L;
initMonsterPos([0 | Ml], L, Num) ->
	initMonsterPos(Ml, L, Num + 1);
initMonsterPos([ID | Ml], L, Num) ->
	initMonsterPos(Ml, [{ID, Num} | L], Num + 1).
 
%%初始化出手顺序
-spec initBattleOrder([#rec_turn_battle{}, ...]) -> [#rec_turn_battle{}, ...].
initBattleOrder([]) ->
	?ERROR_OUT("init battle order failed, no find battle object"),
	[];
initBattleOrder(L) ->
	initBattleOrder(L, []).
initBattleOrder([], L) ->
	L;
initBattleOrder([#rec_turn_battle{} = Battle | L], Acc) ->
	initBattleOrder(Battle, L, {[], [Battle], []}, Acc).
initBattleOrder(_, [], {L, E, G}, Acc) ->
	initBattleOrder(L, E ++ initBattleOrder(G, Acc));
initBattleOrder(#rec_turn_battle{speed = S1} = X, [#rec_turn_battle{speed = S2} = H| T], {L, E, G}, Acc) when S2 < S1 ->
	initBattleOrder(X, T, {[H | L], E, G}, Acc);
initBattleOrder(#rec_turn_battle{speed = S1} = X, [#rec_turn_battle{speed = S2} = H| T], {L, E, G}, Acc) when S2 > S1 ->
	initBattleOrder(X, T, {L, E, [H | G]}, Acc);
initBattleOrder(#rec_turn_battle{speed = S1} = X, [#rec_turn_battle{speed = S2, type = ?MonsterBattle} = H| T], {L, E, G}, Acc) when S2 =:= S1 ->
	initBattleOrder(X, T, {L, E ++ [H], G}, Acc);
initBattleOrder(#rec_turn_battle{speed = S1} = X, [#rec_turn_battle{speed = S2} = H| T], {L, E, G}, Acc) when S2 =:= S1 ->
	initBattleOrder(X, T, {L, [H | E], G}, Acc).

%%开始回合制战斗
-spec startBattle(BattleType::?BattlePve | ?BattlePvp, MaxHp::uint(), Aers::[#rec_turn_battle{}, ...], Ders::[#rec_turn_battle{}, ...], TrunOrder::[#rec_turn_battle{}, ...], TrunNum::uint()) -> 
		  {uint(), [#rec_turn_battle{}, ...], [#rec_turn_battle{}, ...]}.
startBattle(BattleType, MaxHp, Aers, Ders, TurnOrder, TurnNum) ->
	startTurnBattle(BattleType, MaxHp, Aers, Ders, lists:reverse(TurnOrder), lists:reverse(TurnOrder), TurnNum - 1, []).

%%结束回合制战斗
-spec endBattle(Res::uint(), Aers::[#rec_turn_battle{}, ...], Ders::[#rec_turn_battle{}, ...], Al::[#pk_TrunBattleResult{}, ...], TurnNum::uint(), BT ::?BattlePvp | ?BattlePve, HP::uint()) -> 
		  {uint(), [#rec_turn_battle{}, ...], [#rec_turn_battle{}, ...], uint(), int()}.
endBattle(Res, Aers, _Ders, Al, TurnNum, BT, HP) ->
	?DEBUG_OUT("player turn battle result: [~p], in [~p] turn end battle, battle type [~p], cur all hp [~p]", [Res, TurnNum, BT, HP]),
	{Res, Aers, Al, BT, HP}.
%% ====================================================================
%% Internal functions
%% ====================================================================

%%初始化人物
-spec initRoleBattle(Camp::uint(), RoleList::list()) -> list().
initRoleBattle(_Camp, _RoleList) ->
	[].

%%初始化宠物
-spec initPetBattle(Camp::uint(), Level::uint(), EquipList::[#recPetEquip{}, ...], PetList::[{#recPetInfo{}, Pos::uint()}, ...]) -> [#rec_turn_battle{}, ...].
initPetBattle(Camp, Level, EquipList, PetList) ->
	initPetBattle(PetList, Camp, Level, EquipList, []).
initPetBattle([], _Camp, _Level, _EquipList, Pl) ->
	Pl;
initPetBattle([{#recPetInfo{pet_id = ID, pet_star = Star, pet_raw = Raw}, Pos} | L], Camp, Level, EquipList, Pl) ->
	#petCfg{talentSkill2 = TalentSkill2} = getCfg:getCfgPStack(cfg_pet, ID),
	Tb = #rec_turn_battle{
		type = ?PetBattle,
		camp = Camp,
		id = ID,
		pos = Pos,
		skills = TalentSkill2
	},
	{Add, Multi} = playerPet:makePetEquipProp(EquipList, [], []),
	Bpl0 = battleProp:initBattleProp(false),
%%	Bpl1 = battleProp:initRmbPetBaseProp(ID, Level, Star, Raw),
	Bpl1 =playerPet:makePetBaseProp(ID, Level, Star, Raw),
	Bpl2 = battleProp:setBattlePropBaseValue(Bpl0, Bpl1),
	Bpl3 = battleProp:addBattlePropAddValue(Bpl2, initPetEquipProp(Add)),
	Bpl4 = battleProp:addBattlePropRateValue(Bpl3, initPetEquipProp(Multi)),
	Bpl5 = battleProp:calcCharBattleProp(Bpl4),
	Tb1 = initBattleProp(Bpl5, Tb),
	initPetBattle(L, Camp, Level, EquipList, [Tb1 | Pl]).

initPetEquipProp([]) ->
	[];
initPetEquipProp(Acc) ->
	initPetEquipProp(Acc, []).
initPetEquipProp([], Acc) ->
	Acc;
initPetEquipProp([{Key, Value} | L], Acc) ->
	initPetEquipProp(L, [{Key, Value * globalCfg:getPetWarEquipAddArg()} | Acc]).

-spec initMonsterBattle(Camp::uint(), MonsterList::[{uint(), uint()},...]) -> [#rec_turn_battle{}, ...].
initMonsterBattle(Camp, MonsterList) ->
	initMonsterBattle(MonsterList, Camp, []).
initMonsterBattle([], _Camp, Ml) ->
	Ml;
initMonsterBattle([{ID, Pos} | L], Camp, Ml) ->
	#monsterCfg{
		pveSpeed = PvSpeed,
		monsterSkill = Skills
	} = getCfg:getCfgPStack(cfg_monster, ID),
	Tb = #rec_turn_battle{
		type = ?MonsterBattle,
		camp = Camp,
		id = ID,
		pos = Pos,
		skills = Skills,
		speed = PvSpeed
	},
	Bpl0 = battleProp:initBattleProp(false),
	Bpl1 = battleProp:initMonsterBaseProp(ID),
	Bpl2 = battleProp:setBattlePropBaseValue(Bpl0, Bpl1),
	Bpl3 = battleProp:calcCharBattleProp(Bpl2),
	Tb1 = initBattleProp(Bpl3, Tb),
	initMonsterBattle(L, Camp, [Tb1 | Ml]).


-spec initBattleProp(Bpl::[#battleProp{},...], TrunBattle::#rec_turn_battle{}) -> #rec_turn_battle{}.
initBattleProp(Bpl, #rec_turn_battle{type = Type} = TrunBattle) ->
	%%速度
	Speed = battleProp:getBattlePropTotalValue(Bpl, ?Prop_MoveSpeed),
	%%血量
	Hp = battleProp:getBattlePropTotalValue(Bpl, ?Prop_MaxHP),
	%%暴击
	Crit = battleProp:getBattlePropTotalValue(Bpl, ?Prop_CriticalLevel),
	%%攻击
	Atta0 = battleProp:getBattlePropTotalValue(Bpl, ?Prop_MagicAttack),
	Atta3 = battleProp:getBattlePropTotalValue(Bpl, ?Prop_PhysicalAttack),
	Atta = Atta0 + Atta3,
	%%防御
	Def0 = battleProp:getBattlePropTotalValue(Bpl, ?Prop_MagicDefence),
	Def = Def0,
	%%抗性
	?DEBUG_OUT("init object [~p] battle data: atta = ~p, crit = ~p, def = ~p, res = ~p, hp = ~p", [Type, Atta, Crit, Def, 0, Hp]),
	TrunBattle#rec_turn_battle{
		speed = Speed,
		atta = Atta,
		crit = Crit,
		def = Def,
		res = 0,
		hp = trunc(Hp)
	}.

%%一个回合战斗逻辑
-spec startTurnBattle(BattleType::?BattlePve | ?BattlePvp, MaxHp::uint(), Aers::[#rec_turn_battle{}, ...], Ders::[#rec_turn_battle{}, ...], Ol::list(), Ol::list(), TurnNum::uint(), Al::[#pk_TrunBattleResult{}, ...]) -> ok.
startTurnBattle(BT, HP, [], Ders, _Ol, _Ol1, TurnNum, Al) ->
	endBattle(?BattleFailed, [], Ders, Al, TurnNum, BT, HP); %%敌方胜利
startTurnBattle(BT, HP, Aers, [], _Ol, _Ol1, TurnNum, Al) ->
	endBattle(?BattleWin, Aers, [], Al, TurnNum, BT, HP); %%友方胜利
startTurnBattle(BT, HP, Aers, Ders, [],  _Ol1, 0, Al) ->
	endBattle(?BattleDraw, Aers, Ders, Al, 0, BT, HP); 	%%回合最大数,结束战斗
startTurnBattle(_BT, _HP, Aers, Ders, [], Ol, TurnNum, Al) ->
	startTurnBattle(_BT, _HP, Aers, Ders, Ol, Ol, TurnNum - 1, Al); %%一回合结束,未分出胜负继续战斗
startTurnBattle(BT, HP, Aers, Ders, [Order | Ol], Ol1, TurnNum, Al) ->
	case selAttackRole(Order, Aers, Ders) of
		{?AerRole, #rec_turn_battle{} = Role} when BT =:= ?BattlePvp ->
			{NewAers, NewDers, As} = selAttackRoleBattle(?AerRole, Role, Aers, Ders, TurnNum),
			case As of
				#pk_TrunBattleResult{bl = [#pk_BeAttack{hp = DamageHp}]} ->
					case HP + DamageHp > 0 of
						true ->
							startTurnBattle(BT, HP + DamageHp, NewAers, NewDers, Ol, Ol1, TurnNum, [As | Al]);	
						_ ->
							endBattle(?BattleWin, Aers, [], [As | Al], TurnNum, BT, 0)
					end;
				_ ->
					startTurnBattle(BT, HP, NewAers, NewDers, Ol, Ol1, TurnNum, [As | Al])
			end;
		{Camp, #rec_turn_battle{} = Role} ->
			{NewAers, NewDers, As} = selAttackRoleBattle(Camp, Role, Aers, Ders, TurnNum),
			startTurnBattle(BT, HP, NewAers, NewDers, Ol, Ol1, TurnNum, [As | Al]);					
		{_, false} ->
			startTurnBattle(BT, HP, Aers, Ders, Ol, Ol1, TurnNum, Al)
	end.
	
%%选择攻击角色
-spec selAttackRole(Order::#rec_turn_battle{}, Aers::[#rec_turn_battle{}, ...], Ders::[#rec_turn_battle{}, ...]) -> false | #rec_turn_battle{}.
selAttackRole(#rec_turn_battle{camp = ?AerRole, pos = Pos}, Aers, _Ders) ->	%%友方成员
	{?AerRole, lists:keyfind(Pos, #rec_turn_battle.pos, Aers)};
selAttackRole(#rec_turn_battle{camp = ?DerRole, pos = Pos}, _Aers, Ders) ->	%%敌方成员
	{?DerRole, lists:keyfind(Pos, #rec_turn_battle.pos, Ders)}.

%%选择被攻击角色(目前按顺序选择,以后可以扩展,按照条件选择)
-spec selBeAttackRole(Mems::[#rec_turn_battle{}, ...]) -> #rec_turn_battle{}.
selBeAttackRole(Mems) ->
	selBeAttackRole(Mems, {}).
selBeAttackRole([], Mem) ->
	Mem;
selBeAttackRole([#rec_turn_battle{pos = Pos}| Mems], #rec_turn_battle{pos = OldPos} = OldMem) when Pos >= OldPos ->
	selBeAttackRole(Mems, OldMem);
selBeAttackRole([#rec_turn_battle{} = Mem | Mems], _) ->
	selBeAttackRole(Mems, Mem).

%%选择攻击角色技能
-spec selAttackRoleSkill(IDList::list()) -> ok.
selAttackRoleSkill(IDList) ->
	lists:nth(1, IDList).

%% 选择攻击角色进行攻击
selAttackRoleBattle(Camp, AttackRole, Aers, Ders, TurnNum) ->
	SkillID = selAttackRoleSkill(AttackRole#rec_turn_battle.skills),
	selAttackRoleBattle(Camp, ?SingleAttack, SkillID, AttackRole, Aers, Ders, TurnNum).

selAttackRoleBattle(?AerRole, ?SingleAttack, SkillID, AttackRole, Aers, Ders, TurnNum) ->
	BeAttackRole = selBeAttackRole(Ders),
	{NewDers, PkBeAttak} = calcDamage(SkillID, AttackRole, BeAttackRole, Ders),
	AttackResult = #pk_TrunBattleResult{
		camp =  AttackRole#rec_turn_battle.camp,
		pos = AttackRole#rec_turn_battle.pos,
		id = SkillID,
		turn = TurnNum,
		bl = [PkBeAttak]
	},
	{Aers, NewDers, AttackResult};
selAttackRoleBattle(?AerRole, ?AoeAttack, _SkillID, _AttackRole, Aers, Ders, _TurnNum) ->
%% 	Fun = fun(Der, Ders) ->
%% 		calcDamage(AttackRole, Der, Ders)
%% 	end,
%% 	NewDers = lists:foldl(Fun, Ders, Ders),
%% 	{Aers, NewDers};
	{Aers, Ders, {}};
selAttackRoleBattle(?AerRole, ?SingleNoAttack, _SkillID, _AttackRole, Aers, Ders, _TurnNum) ->
	{Aers, Ders, {}};
selAttackRoleBattle(?AerRole, ?AoeNoAttack, _SkillID, _AttackRole, Aers, Ders, _TurnNum) ->
	{Aers, Ders, {}};
selAttackRoleBattle(?DerRole, ?SingleAttack, SkillID, AttackRole, Aers, Ders, TurnNum) ->
	BeAttackRole = selBeAttackRole(Aers),
	{NewAers, PkBeAttack} = calcDamage(SkillID, AttackRole, BeAttackRole, Aers),
	AttackResult = #pk_TrunBattleResult{
		camp =  AttackRole#rec_turn_battle.camp,
		pos = AttackRole#rec_turn_battle.pos,
		id = SkillID,
		turn = TurnNum,
		bl = [PkBeAttack]
	},
	{NewAers, Ders, AttackResult};
selAttackRoleBattle(?DerRole, ?AoeAttack, _SkillID, _AttackRole, Aers, Ders, _TurnNum) ->
%% 	Fun = fun(Aer, Aers) ->
%% 		calcDamage(AttackRole, Aer, Aers)
%% 	end,
%% 	NewAers = lists:foldl(Fun, Aers, Aers),
%% 	{NewAers, Ders};
	{Aers, Ders, {}};
selAttackRoleBattle(?DerRole, ?SingleNoAttack, _SkillID, _AttackRole, Aers, Ders, _TurnNum) ->
	{Aers, Ders, {}};
selAttackRoleBattle(?DerRole, ?AoeNoAttack, _SkillID, _AttackRole, Aers, Ders, _TurnNum) ->
	{Aers, Ders, {}}.


%%计算伤害(未考虑反弹)
-spec calcDamage(SkillID, AttackRole, BeAttackRole, Mems) -> {#rec_turn_battle{}, #pk_BeAttack{}} when
		SkillID::uint(), AttackRole::#rec_turn_battle{},BeAttackRole::#rec_turn_battle{},Mems::[#rec_turn_battle{}, ...].
calcDamage(SkillID, #rec_turn_battle{id = Aid, atta = Atta}, #rec_turn_battle{camp = Camp, id = Baid, pos = Pos, hp = Hp, res = Res, def = Def} = BeAttackRole, Mems) -> 
	#skillCfg{
		pveskillMult = Mult
	} = getCfg:getCfgPStack(cfg_skill, SkillID),
	Damage = trunc(Atta * (1 - Res) * Mult / (1 + Def/globalCfg:getPetWarDefArg()) * globalCfg:getPetWarPveArg()),
	DamageRes = #pk_BeAttack{
		camp = Camp,
		pos = Pos,
		hp = -Damage
	},
	case Hp - Damage =< 0 of
		false ->
			?DEBUG_OUT("aid [~p] attack baid [~p], cur hp [~p], damage [~p]", [Aid, Baid, Hp - Damage, Damage]),
			{lists:keyreplace(Pos, #rec_turn_battle.pos, Mems, BeAttackRole#rec_turn_battle{hp = Hp - Damage}), DamageRes};
		_ ->
			?DEBUG_OUT("aid [~p] attack baid [~p], cur will dead", [Aid, Baid]),
			%%挂了,移除
			{lists:keydelete(Pos, #rec_turn_battle.pos, Mems), DamageRes}
	end.
			
%%计算治疗
%% -spec calcTreat(AttackRole::#rec_turn_battle{}, BeAttackRole::#rec_turn_battle{}) -> ok.
%% calcTreat(AttackRole, BeAttackRole) ->
%% 	ok.

%%发送初始化战斗数据
-spec sendInitBattleListToClient(L::[#rec_turn_battle{}, ...]) -> ok.
sendInitBattleListToClient(L) ->
	sendInitBattleListToClient(L, []).
sendInitBattleListToClient([], Sl) ->
	Il = #pk_GS2U_TrunBattleInitList{
		il = Sl
	},
	playerMsg:sendNetMsg(Il);
sendInitBattleListToClient([#rec_turn_battle{} = Tb | L], SL) ->
	I = #pk_TurnBattleInit{
		id = Tb#rec_turn_battle.id,
		type = Tb#rec_turn_battle.type,
		camp = Tb#rec_turn_battle.camp,
		pos = Tb#rec_turn_battle.pos,
		hp = Tb#rec_turn_battle.hp
	},
	sendInitBattleListToClient(L, [I | SL]).

%%发送战斗结束包(客服端需求)
-spec sendBattleEndAck() -> ok.
sendBattleEndAck() ->
	Ack = #pk_GS2U_ResponseBattleAck{},
	playerMsg:sendNetMsg(Ack).

%%发送战斗结束
-spec sendRequestBattleEnd(Type::uint()) -> ok.
sendRequestBattleEnd(?BattlePve) ->
	case playerState:getTurnBattleAck() of
		undefined ->
			playerState:setTurnBattleData([]),
			?ERROR_OUT("no find pve battle ack data");
		#rec_battle_ack{
			type = ?BattlePve,
			oldAers = OldAers,
			curAers = CurAers,
			dunID = DunID,
			res = Res
			} ->
			playerPetPvE:petPveEndBattle(Res, DunID, length(CurAers), length(OldAers)),
			playerState:setTurnBattleData([]),
			playerState:setTurnBattleAck(undefined);
		#rec_battle_ack{
			type = Type
			} ->
			playerState:setTurnBattleData([]),
			playerState:setTurnBattleAck(undefined),
			?ERROR_OUT("cur request pve battle, error battle type ~p", [Type])
	end;
sendRequestBattleEnd(?BattlePvp) ->
	case playerState:getTurnBattleAck() of
		undefined ->
			?ERROR_OUT("no find pvp battle ack data");
		#rec_battle_ack{
			cityInfo = CityInfo,
			oldOccID = OldOccID,
			type = ?BattlePvp,
			res = Res
			} ->
			playerPetPvP:petPvpEndBattle(Res, OldOccID, CityInfo, playerState:getLevel()),
			playerState:setTurnBattleData([]),
			playerState:setTurnBattleAck(undefined);
		#rec_battle_ack{
			type = Type
		} ->
			playerState:setTurnBattleData([]),
			playerState:setTurnBattleAck(undefined),
			?ERROR_OUT("cur request pvp battle, error battle type ~p", [Type])
	end.

%%发送战斗列表
-spec sendBattleResList(Num::uint()) -> ok.
sendBattleResList(Num) ->
	L = playerState:getTurnBattleData(),
	sendBattleResList(L, Num).
sendBattleResList([], _) ->
	skip;
sendBattleResList(L, Num) ->
	case length(L) > Num of
		true ->
			{L1, L2} = lists:split(Num, L),
			Rl = #pk_GS2U_TrunBattleResultList{
				rl = L1
			},
			playerState:setTurnBattleData(L2),
			playerMsg:sendNetMsg(Rl);
		_ ->
			Rl = #pk_GS2U_TrunBattleResultList{
				rl = L
			},
			playerState:setTurnBattleData([]),
			playerMsg:sendNetMsg(Rl),
			sendBattleEndAck()
	end.
	

