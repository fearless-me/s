%%%
%%%-------------------------------------------------------------------
%%% @author 罗维
%%% @copyright (C) 2014, <haowan123>
%%% @doc
%%% 玩家阵营关系
%%% @end
%%% Created : 10. 九月 2014 16:27
%%%-------------------------------------------------------------------

-module(camp).
-author(luowei).

-include("gsInc.hrl").

-define(Neutral,   0).
-define(Friendly,  1).
-define(Hostile,   2).
%% ====================================================================
%% API functions
%% ====================================================================
-export([
	isFilter/6,
	isRedName/2,
	isSameGuild/3,
	filterTarget/5,

	getPveCampRelation/3,
	getBattleCampRelation/2,
	getBattleOtherCampRelation/2,
	getBattleRelation/2
]).

%%过滤目标
-spec filterTarget(SkillID, MyTeam, KillList, SelfObject, TargetList) -> list() when
		  SkillID :: uint(),
          MyTeam :: #rec_team{},
          KillList :: list(),
          SelfObject :: #recMapObject{},
          TargetList :: list().
filterTarget(SkillID, MyTeam, KillList, SelfObject, TargetList) ->
	Fun = fun(TargetObject) ->
				  case isFilter(SkillID, MyTeam, KillList, SelfObject, TargetObject, true) of
					  false ->
						  true;
					  _Error ->
						  false
				  end
		  end,
	countLimitFilter(SkillID, lists:filter(Fun, repeatFilter(TargetList))).

isFilter(SkillID, MyTeam, KillList, #recMapObject{} = SelfObject, #recMapObject{other = Other} = TargetObject, IsCheckShip) ->
	case carrierFilter(Other) of
		true ->
			isFilter1(SkillID, MyTeam, KillList, SelfObject, TargetObject, IsCheckShip);
		_ ->
			?ErrorCode_UseSkillErrorTarget
	end;
isFilter(_SkillID, _MyTeam, _KillList, _SelfObject, _, _) ->
	?ErrorCode_UseSkillErrorTarget.

isFilter1(SkillID, MyTeam, KillList, #recMapObject{groupID = SelfGroupID} = SelfObject,  #recMapObject{groupID = TargetGroupID} = TargetObject, IsCheckShip) ->
	case groupFilter(SelfGroupID, TargetGroupID) of
		true ->
			isFilter2(SkillID, MyTeam, KillList, SelfObject, TargetObject, IsCheckShip);
		_ ->
			?ErrorCode_UseSkillErrorTarget
	end;
isFilter1(_SkillID, _MyTeam, _KillList, _SelfObject, _, _) ->
	?ErrorCode_UseSkillErrorTarget.

isFilter2(SkillID, MyTeam, KillList, SelfObject, TargetObject, IsCheckShip) ->
	case castDistFilter(SkillID, SelfObject, TargetObject) of
		true ->
			isFilter3(SkillID, MyTeam, KillList, SelfObject, TargetObject, IsCheckShip);
		_ ->
			?ErrorCode_UseSkillErrorTargetDist
	end.

isFilter3(SkillID, MyTeam, KillList, SelfObject, TargetObject, IsCheckShip) ->
	case actionStatusFilter(TargetObject#recMapObject.actionStatus, TargetObject#recMapObject.hp) of
		true ->
			isFilter4(SkillID, MyTeam, KillList, SelfObject, TargetObject, IsCheckShip);
		_ ->
			?ErrorCode_UseSkillErrorTargetDead
	end.

isFilter4(SkillID, MyTeam, KillList, SelfObject, TargetObject, true) ->
	case statusFilter(MyTeam, SelfObject, TargetObject) of
		true ->
			isFilter5(SkillID, MyTeam, KillList, SelfObject, TargetObject);
		_ ->
			?ErrorCode_UseSkillErrorTargetStatus
	end;
isFilter4(_SkillID, MyTeam, _KillList, SelfObject, TargetObject, _) ->
	case statusFilter(MyTeam, SelfObject, TargetObject) of
		true ->
			false;
		_ ->
			?ErrorCode_UseSkillErrorTargetStatus
	end.

isFilter5(SkillID, MyTeam, KillList, SelfObject, TargetObject) ->
	#skillCfg{targetSearch = SearchType} = getCfg:getCfgPStack(cfg_skill, SkillID),
	case checkRelationShip(SearchType, MyTeam, KillList, SelfObject, TargetObject) of
		true ->
			false;
		_ ->
			?ErrorCode_UseSkillErrorTargetCamp
	end.

%%buff状态过滤
-spec statusFilter(MyTeam, SelfObject, TargetObject) -> boolean() when
		  MyTeam :: #rec_team{},
          SelfObject :: #recMapObject{},
          TargetObject :: #recMapObject{}.
statusFilter(MyTeam, SelfObject, TargetObject) ->
	#recMapObject{code = MyCode,
				  other = Other} = SelfObject,
	#recMapObject{type = TargetType,
				  status = TargetStaus,
				  code = TargetCode,
				  other = TargetOther} = TargetObject,
	MyCasterCode = getCasterCode(MyCode, Other),
	TargetCasterCode = getCasterCode(TargetCode, TargetOther),
	IsMyCasterOrSelf = isMyCasterOrSelf(MyCode, TargetCode, MyCasterCode, TargetCasterCode),	
	IsMyTeamer = isMyTeamer(TargetType, TargetCasterCode, MyCasterCode, MyTeam),
	case IsMyCasterOrSelf of
		true ->
			true;
		_ ->
			case IsMyTeamer of
				true ->
					case misc:testBit(TargetStaus, ?CreatureSpeStautsBlur) of
						true ->
							false;
						_ ->
							true
					end;
				_ ->
					case misc:testBit(TargetStaus,?CreatureSpeStautsBlur) orelse 
							 misc:testBit(TargetStaus, ?CreatureSpeStautsPkProtect) of
						true ->
							false;
						_ ->
							true
					end
			end
	end.
	
%%行为状态过滤
-spec actionStatusFilter(ActStatus, Hp) -> boolean() when
		  ActStatus :: uint(),
          Hp :: uint().
actionStatusFilter(?CreatureActionStatusChangeMap, _) ->
	false;
actionStatusFilter(?CreatrueActionStatusStealth, _) ->
	false;
actionStatusFilter(ActStatus, Hp) ->
	case ActStatus =:= ?CreatureActionStatusDead orelse Hp == 0 of
		true ->
			false;
		_ ->
			true
	end.

%%施法距离过滤
-spec castDistFilter(SkillID, SelfObject, TargetObject) -> boolean() when
		  SkillID :: uint(),
          SelfObject :: #recMapObject{},
          TargetObject :: #recMapObject{}.
castDistFilter(SkillID, SelfObject, TargetObject) ->
	#skillCfg{ranger = Ranger} = getCfg:getCfgPStack(cfg_skill, SkillID),
	if
		Ranger =:= 0 ->
			true;
		true ->
			case mapView:getObjectDist(TargetObject, SelfObject) of
				{ok,Dist,_,_} ->
					case Dist =< Ranger of
						true ->
							true;
						_ ->
%% 							SQR = misc:calcDistSquare(SelfObject#recMapObject.x, SelfObject#recMapObject.y, TargetObject#recMapObject.x, TargetObject#recMapObject.y),
%% 							Dist1 = math:sqrt(SQR),
%% 							?ERROR_OUT("Player[~p] at Pos[~p,~p] Attack TargetCode[~p]Pos[~p,~p]Dist[~p], Ranger [~p], SkillID [~p]",
%% 									   [SelfObject#recMapObject.code,
%% 										SelfObject#recMapObject.x,
%% 										SelfObject#recMapObject.y,
%% 										TargetObject#recMapObject.code,
%% 										TargetObject#recMapObject.x,
%% 										TargetObject#recMapObject.y,
%% 										Dist1, Ranger, SkillID]),
							false
					end;
				_ ->
					false
			end
	end.

%%过滤不是同一分组的目标
-spec groupFilter(SelfGroudID, TargetGroudID) -> boolean() when
		  SelfGroudID :: uint(),
          TargetGroudID :: uint().
groupFilter(SelfGroudID, TargetGroudID) ->
	if
		SelfGroudID =:= TargetGroudID ->
			true;
		true ->
			false
	end.

%%过滤载体目标
-spec carrierFilter(Other) -> boolean() when
		Other :: list().
carrierFilter(Other) when is_list(Other) ->
	case lists:keyfind(subType, 1, Other) of
		{subType,1} ->
			false;
		_ ->
			true
	end.

%%重复目标过滤
-spec repeatFilter(ObjectList) -> list() when
		  ObjectList :: list().
repeatFilter(ObjectList) ->
	repeatFilter(ObjectList, []).
repeatFilter([], FilterList) ->
	FilterList;
repeatFilter([#recMapObject{code = Code} = Object| List], FilterList) ->
	case lists:keyfind(Code, #recMapObject.code, FilterList) of
		false ->
			repeatFilter(List, [Object | FilterList]);
		_ ->
			repeatFilter(List, FilterList)
	end;
repeatFilter([_ | List], FilterList) ->
	repeatFilter(List, FilterList).

%%数量限制过滤
-spec countLimitFilter(SkillID, ObjectList) -> list() when
		 SkillID :: uint(),
         ObjectList :: list().
countLimitFilter(SkillID, ObjectList) ->
	#skillCfg{aoe = Aoe, maxEffectCount = MaxCount} = getCfg:getCfgPStack(cfg_skill, SkillID),
	NewCount = getSkillCount(Aoe, MaxCount),
	case length(ObjectList) =< NewCount of
		true ->
			ObjectList;
		_ ->
			lists:sublist(ObjectList, NewCount)
	end.

%%获取技能最大数量
-spec getSkillCount(Aoe, MaxCount) -> uint() when
          Aoe :: uint(),
          MaxCount :: uint().
getSkillCount(Aoe, MaxCount) ->
	case Aoe of
		1 ->
			MaxCount;
		_ ->
			1
	end.

%%获取PvE阵营关系
-spec getPveCampRelation(MyCamp, TargetCamp, IsSameGuild) -> ?Neutral | ?Friendly | ?Hostile when
	MyCamp :: uint(),
	TargetCamp :: uint(),
	IsSameGuild :: boolean().
getPveCampRelation(MyCamp, TargetCamp, IsSameGuild) ->
	case IsSameGuild of
		true ->
			?Friendly;
		false ->
			CfgCamp = getCfg:getCfgByArgs(cfg_factionList, MyCamp),
			if
				TargetCamp =:= ?CampPlayer ->
					CfgCamp#factionListCfg.player;
				TargetCamp =:= ?CampMonsterFriendly ->
					CfgCamp#factionListCfg.alliedMonster;
				TargetCamp =:= ?CampMonsterEnemies ->
					CfgCamp#factionListCfg.hostileMonster;
				true ->
					?Hostile
			end
	end.

%%获取PvP阵营关系
-spec getPvpCampRelation(PkMode, IsMyTreamer, IsSameGuild, IsRedName, IsCanKill) -> ?Neutral | ?Friendly | ?Hostile when
		  PkMode :: uint(),
          IsMyTreamer :: boolean(),
          IsSameGuild :: boolean(),
          IsRedName :: boolean(),
          IsCanKill :: boolean().
getPvpCampRelation(PkMode, IsMyTeamer, IsSameGuild, IsRedName, IsCanKill) ->
	MyCamp = tranCamp(PkMode),
	CfgCamp = getCfg:getCfgByArgs(cfg_factionList, MyCamp),
	if
		MyCamp =:= ?CampPeace orelse MyCamp =:= ?CampGeneralKill->
			case IsMyTeamer of
				true ->
					CfgCamp#factionListCfg.teamMate;
				_ ->
					case IsRedName of
						true ->
							?Hostile;
						_ ->
							case IsCanKill of
								true ->
									?Hostile;
								_ ->
									CfgCamp#factionListCfg.nonTeamMate
							end
					end
			end;
		MyCamp =:= ?CampGuildKill ->
			case IsMyTeamer of
				true ->
					CfgCamp#factionListCfg.teamMate;
				_ ->
					case IsSameGuild of
						true ->
							CfgCamp#factionListCfg.memberShip;
						_ ->
							CfgCamp#factionListCfg.nonMemberShip
					end
			end;
		true ->
			?Hostile
	end.

%%获取国战阵营关系
-spec getBattleCampRelation(MyCamp, TargetCamp) -> ?Neutral | ?Friendly | ?Hostile when
		  MyCamp :: uint(),
          TargetCamp :: uint().
getBattleCampRelation(MyCamp, TargetCamp) ->
	CfgCamp = getCfg:getCfgPStack(cfg_factionList, MyCamp),
	if
		TargetCamp =:= ?CampRedBattle ->
			CfgCamp#factionListCfg.battleRed;
		TargetCamp =:= ?CampBlueBattle ->
			CfgCamp#factionListCfg.battleBlue;
		true ->
			?Neutral
	end.

-spec getBattleOtherCampRelation(MyCamp::uint(), TargetCamp::uint()) -> ?Neutral | ?Friendly | ?Hostile.
getBattleOtherCampRelation(MyCamp, TargetCamp) ->
	CfgCamp = getCfg:getCfgPStack(cfg_factionList, MyCamp),
	if
		TargetCamp =:= ?CampMonsterEnemies ->
			CfgCamp#factionListCfg.hostileMonster;
		TargetCamp =:= ?CampRedBattle ->
			CfgCamp#factionListCfg.battleRed;
		TargetCamp =:= ?CampBlueBattle ->
			CfgCamp#factionListCfg.battleBlue;
		true ->
			?Neutral
	end.

%%获取战斗关系
-spec getBattleRelation(AttackerCamp, BeAttackerCamp) -> pvp | pve | national | other when
		  AttackerCamp :: uint(),
          BeAttackerCamp :: uint().
getBattleRelation(AttackerCamp, BeAttackerCamp) -> 
	if
		(AttackerCamp =:= ?CampRedBattle orelse AttackerCamp =:= ?CampBlueBattle) andalso 
         (BeAttackerCamp =:= ?CampRedBattle orelse BeAttackerCamp =:= ?CampBlueBattle) ->
			national;
		AttackerCamp =:= ?CampPlayer andalso BeAttackerCamp =:= ?CampPlayer ->
			pvp;
		(AttackerCamp =:= ?CampRedBattle orelse AttackerCamp =:= ?CampBlueBattle) orelse 
			(BeAttackerCamp =:= ?CampRedBattle orelse BeAttackerCamp =:= ?CampBlueBattle) ->
			other;
		true ->
			pve
	end.

%%是否是队友
-spec isMyTeamer(TargetType, TargetCode, MyCode, MyTeam) -> boolean() when
	   TargetType :: uint(),
       TargetCode :: uint(),
       MyCode :: uint(),
       MyTeam :: #rec_team{}.
isMyTeamer(_, _, _, undefined) ->
	false;
isMyTeamer(TargetType, TargetCode, MyCode, MyTeam) ->
	case TargetType =:= ?ObjTypePlayer orelse TargetType =:= ?ObjTypePet of
		true ->
			case MyTeam of
				#recTeamInfo{memberList = Members} ->
					isMyTeamer(Members, MyCode, TargetCode);
				_ ->
					TargetCode =:= MyCode
			end;
		_ ->
			false
	end.

isMyTeamer([], MyCode, TargetCode) ->
	TargetCode =:= MyCode;
isMyTeamer([#recTeamMemberInfo{code = Code} | Members], MyCode, TargetCode) ->
	case Code =:= TargetCode of
		true ->
			true;
		_ ->
			isMyTeamer(Members, MyCode, TargetCode)
	end.

%%是否是同公会
-spec isSameGuild(TargetType, TargetGuildID, MyGuildID) -> boolean() when
         TargetType :: uint(),
         TargetGuildID :: uint(),
         MyGuildID :: uint().
isSameGuild(_, 0, _MyGuildID) ->
	false;
isSameGuild(TargetType, TargetGuildID, MyGuildID) ->
	case TargetType =:= ?ObjTypePlayer orelse TargetType =:= ?ObjTypePet orelse TargetType =:= ?ObjTypeMonster of
		true ->
			MyGuildID =:= TargetGuildID;
		_ ->
			false
	end.

%%是否是红名玩家
-spec isRedName(TargetType, Status) -> boolean() when
		  TargetType :: uint(),
          Status :: uint().
isRedName(TargetType, Status) ->
	case TargetType =:= ?ObjTypePlayer orelse TargetType =:= ?ObjTypePet of
		true ->
			case misc:testBit(Status, ?CreatureSpecStautsRedName) of
				true ->
					true;
				_ ->
					false
			end;
		_ ->
			false
	end.

%%是否是敌人
-spec isEnemy(BattleShip, MyCamp, TargetCamp, PkMode, IsMyTeamer, IsSameGuild, IsMyCasterOrSelf, IsRedName, IsCanKill) -> boolean() when
		  BattleShip :: pve | pvp | national,
          MyCamp :: uint(),
          TargetCamp :: uint(),
          PkMode :: uint(),
          IsMyTeamer :: boolean(),
          IsSameGuild :: boolean(),
          IsMyCasterOrSelf :: boolean(),
          IsRedName :: boolean(),
          IsCanKill :: boolean().
isEnemy(_, _, _, _, _, _, true, _, _) ->
	false;
isEnemy(pve, MyCamp, TargetCamp, _PkMode, _IsMyTeamer, IsSameGuild, _IsMyCasterOrSelf, _IsRedName, _IsCanKill) ->
	case getPveCampRelation(MyCamp, TargetCamp, IsSameGuild) of
		?Hostile ->
			true;
		_ ->
			false
	end;
isEnemy(pvp, _MyCamp, _TargetCamp, PkMode, IsMyTeamer, IsSameGuild, _IsMyCasterOrSelf, IsRedName, IsCanKill) ->
	case getPvpCampRelation(PkMode, IsMyTeamer, IsSameGuild, IsRedName, IsCanKill) of
		?Hostile ->
			true;
		_ ->
			false
	end;
isEnemy(national, MyCamp, TargetCamp, _PkMode, _IsMyTeamer, _IsSameGuild, _IsMyCasterOrSelf, _IsRedName, _IsCanKill) ->
	case getBattleCampRelation(MyCamp, TargetCamp) of
		?Hostile ->
			true;
		_ ->
			false
	end;
isEnemy(other, MyCamp, TargetCamp, _PkMode, _IsMyTeamer, _IsSameGuild, _IsMyCasterOrSelf, _IsRedName, _IsCanKill) ->
	case getBattleOtherCampRelation(MyCamp, TargetCamp) of
		?Hostile ->
			true;
		_ ->
			false
	end.

%%是否是队友
-spec isAllied(BattleShip, MyCamp, TargetCamp, PkMode, IsMyTeamer, IsSameGuild, IsMyCasterOrSelf, IsRedName, IsCanKill) -> boolean() when
		  BattleShip :: pve | pvp | national,
          MyCamp :: uint(),
          TargetCamp :: uint(),
          PkMode :: uint(),
          IsMyTeamer :: boolean(),
          IsSameGuild :: boolean(),
          IsMyCasterOrSelf :: boolean(),
          IsRedName :: boolean(),
          IsCanKill :: boolean().
isAllied(_, _, _, _, _, _, true, _, _) ->
	true;
isAllied(pve, MyCamp, TargetCamp, _PkMode, _IsMyTeamer, IsSameGuild, _IsMyCasterOrSelf, _IsRedName, _IsCanKill) ->
	case getPveCampRelation(MyCamp, TargetCamp, IsSameGuild) of
		?Friendly ->
			true;
		_ ->
			false
	end;
isAllied(pvp, _MyCamp, _TargetCamp, PkMode, IsMyTeamer, IsSameGuild, _IsMyCasterOrSelf, IsRedName, IsCanKill) ->
	case getPvpCampRelation(PkMode, IsMyTeamer, IsSameGuild, IsRedName, IsCanKill) of
		?Friendly ->
			true;
		_ ->
			false
	end;
isAllied(national, MyCamp, TargetCamp, _PkMode, _IsMyTeamer, _IsSameGuild, _IsMyCasterOrSelf, _IsRedName, _IsCanKill) ->
	case getBattleCampRelation(MyCamp, TargetCamp) of
		?Friendly ->
			true;
		_ ->
			false
	end;
isAllied(other, _MyCamp, _TargetCamp, _PkMode, _IsMyTeamer, _IsSameGuild, _IsMyCasterOrSelf, _IsRedName, _IsCanKill) ->
	false.

%%是否是自己
-spec isMySelf(MyCode, TargetCode) -> boolean() when
		  MyCode :: uint(),
          TargetCode :: uint().
isMySelf(MyCode, TargetCode) ->
	MyCode =:= TargetCode.

%%是否是自己或者是自己主人
-spec isMyCasterOrSelf(MyCode, TargetCode, CasterCode, TargetCasterCode) -> boolean() when
		  MyCode :: uint(),
          TargetCode :: uint(),
          CasterCode :: uint(),
		  TargetCasterCode :: uint().
isMyCasterOrSelf(MyCode, TargetCode, CasterCode, TargetCasterCode) ->
	case isMySelf(MyCode, TargetCode) of
		false ->
			CasterCode =:= TargetCode orelse TargetCasterCode =:= MyCode 
				orelse TargetCasterCode =:= CasterCode;
		_ ->
			true
	end.

%%杀戮模式转换阵营
-spec tranCamp(PkMode) -> uint() when
		  PkMode :: uint().
tranCamp(?PlayerPeaceStatus) ->
	?CampPeace;
tranCamp(?PlayerSingleKillStatus) ->
	?CampGeneralKill;
tranCamp(?PlayerMutiKillStatus) ->
	?CampGuildKill.

%%根据搜索目标判断和自己关系   
-spec checkRelationShip(SearchType, MyTeam, KillList, Object, TargetObject) -> boolean() when
		  SearchType :: uint(),
          MyTeam :: #rec_team{},
          KillList :: list(),
          Object :: #recMapObject{},
          TargetObject :: #recMapObject{}.
checkRelationShip(?SingleSkillMy, _,  _, #recMapObject{code = MyCode}, #recMapObject{code = TargetCode}) ->
	isMySelf(MyCode, TargetCode);

checkRelationShip(?MutiSkillCirMyTeam, MyTeam, KillList, Object, TargetObject) ->
	relationShip(true, MyTeam, KillList, Object, TargetObject);

checkRelationShip(_, MyTeam, KillList, Object, TargetObject) ->
	relationShip(false, MyTeam, KillList, Object, TargetObject).


%%队友和关系判断
-spec relationShip(Relation, MyTeam, KillList, Object, TargetObject) -> boolean() when
		  Relation :: boolean(),
		  MyTeam :: #rec_team{},
          KillList :: list(),
          Object :: #recMapObject{},
          TargetObject :: #recMapObject{}.
relationShip(Relation, MyTeam, KillList, Object, TargetObject) ->
	#recMapObject{code = MyCode,
				  guild = MyGuildID,
				  pkMode = MyPkMode,
				  camp = MyCamp,
				  other = Other} = Object,
	#recMapObject{type = TargetType,
				  status = TargetStaus,
				  code = TargetCode,
				  guild = TargetGuildID,
				  camp = TargetCamp,
				  other = TargetOther} = TargetObject,
	MyCasterCode = getCasterCode(MyCode, Other),
	TargetCasterCode = getCasterCode(TargetCode, TargetOther),
	IsRedName = isRedName(TargetType, TargetStaus),
	BattleSkip = getBattleRelation(MyCamp, TargetCamp),
	IsMyCasterOrSelf = isMyCasterOrSelf(MyCode, TargetCode, MyCasterCode, TargetCasterCode),
	IsMyTeamer = isMyTeamer(TargetType, TargetCasterCode, MyCasterCode, MyTeam),
	IsSameGuild = isSameGuild(TargetType, TargetGuildID, MyGuildID),
	IsCanKill = isCanKill(KillList, TargetCasterCode),
	case Relation of
		true ->
			isAllied(BattleSkip, MyCamp, TargetCamp, MyPkMode, IsMyTeamer, IsSameGuild, IsMyCasterOrSelf, IsRedName, IsCanKill);
		false ->
			isEnemy(BattleSkip, MyCamp, TargetCamp, MyPkMode, IsMyTeamer, IsSameGuild, IsMyCasterOrSelf, IsRedName, IsCanKill)
	end.

%%判断目标是否在杀戮列表中
-spec isCanKill(KillList, TargetCode) -> boolean() when
		  KillList :: list(),
          TargetCode :: uint().
isCanKill(KillList, TargetCode) ->
	case lists:keyfind(TargetCode, 1, KillList) of
		false ->
			false;
	 _ ->
		 true
	end.

%%获取宿主Code
-spec getCasterCode(MyCode, List) -> uint() when
         MyCode :: uint(),
         List :: list().
getCasterCode(MyCode, []) -> 
	MyCode;
getCasterCode(_, [CasterCode]) ->
	CasterCode;
getCasterCode(_, [{moveStatus,_},{subType,1},{casterCode,CasterCode}]) ->
	CasterCode;
getCasterCode(MyCode, _) ->
	MyCode.
  