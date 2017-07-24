%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. 二月 2017 14:42
%%%-------------------------------------------------------------------
-module(playerCareerChange).
-author("Administrator").
-include("playerPrivate.hrl").

%% API
-export([
	change/1
]).

%%%-------------------------------------------------------------------
change(NewCareer) ->
	case canChange(NewCareer) of
		{true, _} ->
			case consumeItems(NewCareer) of
				{true, _} ->
					try
						changeCareer(NewCareer)
					catch
						_ : Why ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_CareerChangeConfig),
							?ERROR_OUT("player[~p] change2[~p], now[~p], why=~p, stack=~p",
								[playerState:getRoleID(), NewCareer, playerState:getCareer(), Why, erlang:get_stacktrace()])
					end;
				{_, Code1} ->
					playerMsg:sendErrorCodeMsg(Code1)
			end;
		{_, Code} ->
			playerMsg:sendErrorCodeMsg(Code)
	end.


%%%-------------------------------------------------------------------
changeCareer(NewCareer) ->
	OldCareer = playerState:getCareer(),
	ok = changeCareerSkill(OldCareer, NewCareer),
	ok = changeCareerProperty(OldCareer, NewCareer),
	ok = changeCareerBase(OldCareer, NewCareer),
	ok = onChangeCareerSuccess(OldCareer, NewCareer),
	ok.

changeCareerBase(_OldCareer, NewCareer) ->
	playerState:setCareer(NewCareer).

changeCareerSkill(OldCareer, NewCareer) ->
	playerSkillLearn:initSkillChangeCareer(OldCareer, NewCareer),
	ok.
changeCareerProperty(_OldCareer, NewCareer) ->
	Level = playerState:getLevel(),
	playerCalcProp:initBaseProp(Level, NewCareer),
	playerCalcProp:calcBattleProp(),
	ok.

onChangeCareerSuccess(OldCareer, NewCareer) ->
	Now = time:getUTCNowMS(),
	playerSave:savePlayer(Now),

	Msg = #pk_GS2U_ChangeCarrer{result = true, newCareer = NewCareer},
	playerMsg:sendNetMsg(Msg),

	playerSkillLearn:openWakeSkill(),
	playerSkillLearn:sendSkillSlotInfo(),
	playerSkillLearn:sendSkillSlotSkillInfo2Client(),
	playerSkillLearn:sendSkillInfo2Client(),
	playerSkillLearn:autoUpSkill(playerState:getLevel()),

	giveNewCareerGift(NewCareer),
	returnSkillPoint(playerState:getLevel()),
	returnSkillCost(),

	playerTask:updateTask(?TaskSubType_CareerChang, ?Career2CareerStage(NewCareer)),
	?LOG_OUT("player[~p] changeCareer[~p -> ~p] ok",
		[playerState:getRoleID(), OldCareer, NewCareer]),
	ok.

giveNewCareerGift(NewCareer) ->
	case getCfg:getCfgByArgs(cfg_player_desc, NewCareer) of
		#player_descCfg{gift = ItemLists} ->
			lists:foreach(
				fun({ItemID, ItemNum}) ->
					PLog = #recPLogTSItem{
						old = 0,
						new = ItemNum,
						change = ItemNum,
						target = ?PLogTS_PlayerSelf,
						source = ?PLogTS_System,
						gold = 0,
						goldtype = 0,
						changReason = ?ItemSourceVipLevelAward,
						reasonParam = ItemID
					},
					playerPackage:addGoodsAndMail(ItemID, ItemNum, true, 0, PLog)
				end, ItemLists);
		_ ->
			skip
	end,
	ok.

returnSkillCost()->
	RoleID = playerState:getRoleID(),
	L = playerPropSync:getProp(?SerProp_UpSkill_CostList),
	playerPropSync:setAny(?SerProp_UpSkill_CostList, []),
	Title = stringCfg:getString(career_transfer_email_1),
	Content = stringCfg:getString(career_transfer_email_2),
	lists:foreach(
		fun({MoneyType, MoneyNumber}) ->
			mail:sendMoneySystemMail(
				RoleID
				, Title
				, Content
				, MoneyType
				, MoneyNumber
				, []
			)
		end, L),
	ok.

returnSkillPoint(Level) ->
	NewSkillPoint = calcTotalSkillPoint(0, 1, Level),
	playerPropSync:setInt64(?PriProp_SkillPoint, NewSkillPoint).

calcTotalSkillPoint(SkillPoint, CurLevel, MaxLevel) when CurLevel > MaxLevel ->
	SkillPoint;
calcTotalSkillPoint(SkillPoint, CurLevel, MaxLevel) ->
	New =
		case getCfg:getCfgByArgs(cfg_indexGrowth, CurLevel) of
			#indexGrowthCfg{index62 = V} ->
				V;
			_ ->
				1
		end,
	calcTotalSkillPoint(SkillPoint + New, CurLevel + 1, MaxLevel).


%%%-------------------------------------------------------------------
consumeItems(_) -> {true, 0}.

%%%-------------------------------------------------------------------
canChange(NewCareer) ->
	case checkCareer(NewCareer) of
		{true, _} ->
			checkConfig(NewCareer);
		V ->
			V
	end.

checkConfig(NewCareer) ->
	case getCfg:getCfgByArgs(cfg_player_desc, NewCareer) of
		#player_descCfg{
			zhanli_limit = PlayerForce,
			level_limit = LevelLimit,
			task_need = TaskID,
			item_cost = Items
		} ->
			case checkPlayerForce(PlayerForce) of
				{true, _} ->
					case checkPlayerLevel(LevelLimit) of
						{true, _} ->
							case checkTask(TaskID) of
								{true, _} ->
									checkItem(Items);
								V2 ->
									V2
							end;
						V1 ->
							V1
					end;
				V ->
					V
			end;
		_ ->
			{false, ?ErrorCode_CareerChangeConfig}
	end.

%%%-------------------------------------------------------------------
checkCareer(NewCareer) ->
	Career = playerState:getCareer(),
	MainCareer = ?Career2CareerMain(Career) =:= ?Career2CareerMain(NewCareer),
	SubCareer = ?Career2CareerStage(Career) + 1 =:= ?Career2CareerStage(NewCareer),
	{MainCareer andalso SubCareer, ?ErrorCode_CareerChangeTargetError}.

%%%-------------------------------------------------------------------
checkPlayerForce(Force) ->
	{playerPropSync:getProp(?PriProp_PlayerForce) >= Force, ?ErrorCode_CareerChangeForce}.
checkPlayerLevel(Limit) ->
	{playerState:getLevel() >= Limit, ?ErrorCode_CareerChangeLevel}.

checkTask(0) -> {true, 0};
checkTask(TaskID) -> {playerTask:isAcceptedTaskByID(TaskID), ?ErrorCode_CareerChangeTask}.

checkItem(undefined) -> {true, 0};
checkItem([]) -> {true, 0};
checkItem(_) -> {false, ?ErrorCode_CareerChangeItems}.

