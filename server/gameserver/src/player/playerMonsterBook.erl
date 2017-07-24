%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2017, raink
%%% @doc
%%% 怪物图鉴
%%% @end
%%% Created : 20170829
%%%-------------------------------------------------------------------
-module(playerMonsterBook).
-author(meitianyang).

-include("playerPrivate.hrl").
-include("cfg_monster_file.hrl").

-export([
	msg/1	% 客户端请求
]).

-export([
	init/0,			% 上线初始化
	killMonster/1	% 击杀怪物回调
]).

-export([
	gmQuery/2,		% 查询地图或怪物状态
	gmSetMonster/3	% 设置怪物状态
]).

%%%-------------------------------------------------------------------
% 解锁奖励与扩展奖励
-define(RewardType_Unlock,	1).	%% 解锁奖励，经验值和货币
-define(RewardType_Extra,	2).	%% 扩展奖励，永久属性
%-define(RewardType_Map,		3).	%% 地图奖励，多项永久属性（不能直接领取，通过扩展奖励间接激活）

%%%-------------------------------------------------------------------
% 判断是否能领取解锁奖励与扩展奖励的返回值
-define(RewardRet_Cannot,	0).	%% 条件没达到
-define(RewardRet_Can,		1).	%% 能
-define(RewardRet_Already,	2).	%% 已经领过了

%%%-------------------------------------------------------------------
% 假的客户端请求，用于开关过滤
-spec msg(term()) -> no_return().
msg(Msg) ->
	case playerMainMenu:isOpen(?ModeType_Handbook) of
		true ->
			msg_real(Msg);
		_ ->
			?ERROR_CODE(?ErrorCode_YourLevelIsTooLower)
	end.

%%%-------------------------------------------------------------------
% 真的客户端请求，用于分流逻辑
-spec msg_real(term()) -> no_return().
msg_real(#pk_U2GS_MonsterBook_Request{}) ->
	msg_all();
msg_real(#pk_U2GS_MonsterBookSnap_Request{id = MonsterID}) ->
	msg_snap(MonsterID);
msg_real(#pk_U2GS_MonsterBookUnlock_Request{id = MonsterID}) ->
	msg_unlock(MonsterID);
msg_real(#pk_U2GS_MonsterBookReward_Request{id = MonsterID}) ->
	msg_reward(MonsterID);
msg_real(Unknown) ->
	?ERROR_OUT("invalid msg:~w RoleID:~w", [Unknown, playerState:getRoleID()]).

%%%-------------------------------------------------------------------
% 反馈全列表
-spec msg_all() -> no_return().
msg_all() ->
	ListMonsterBook = playerState2:getPlayerDataElement(#rec_playerdata.rec_player_monster_book),
	Msg = #pk_GS2U_MonsterBook_Ack{
		listMapID = playerPropSync:getProp(?SerProp_AlreadyEnterNormalMap),
		listMonster = db2msg(ListMonsterBook)
	},
	playerMsg:sendNetMsg(Msg).

%%%-------------------------------------------------------------------
% 照相请求
-spec msg_snap(MonsterID::uint16()) -> no_return().
msg_snap(MonsterID) ->
	case getCfg:getCfgByKey(cfg_monster_file, MonsterID) of
		#monster_fileCfg{} ->
			ListMonsterBook = playerState2:getPlayerDataElement(#rec_playerdata.rec_player_monster_book),
			Ret =
				case lists:keyfind(MonsterID, #rec_player_monster_book.monsterID, ListMonsterBook) of
					false ->
						%% 没有数据
						MonsterBook = #rec_player_monster_book{roleID = playerState:getRoleID(), monsterID = MonsterID},
						MonsterBookNew = MonsterBook#rec_player_monster_book{isSnap = 1},
						ListMonsterBookNew = [MonsterBookNew | ListMonsterBook],
						{MonsterBook, MonsterBookNew, ListMonsterBookNew};
					#rec_player_monster_book{isSnap = 0} = MonsterBook ->
						%% 有数据，没有拍照
						MonsterBookNew = MonsterBook#rec_player_monster_book{isSnap = 1},
						ListMonsterBookNew = lists:keyreplace(
							MonsterID,
							#rec_player_monster_book.monsterID,
							ListMonsterBook,
							MonsterBookNew
						),
						{MonsterBook, MonsterBookNew, ListMonsterBookNew};
					_ ->
						%% 重复拍照
						?ERROR_CODE(?ErrorCode_MonsterBook_AlreadySnap)
				end,
			case Ret of
				{Old, New, ListNew} ->
					%% 刷新数据
					playerState2:setPlayerDataElement(#rec_playerdata.rec_player_monster_book, ListNew),
					%% 通知客户端
					playerMsg:sendNetMsg(#pk_GS2U_MonsterBookSnap_Ack{id = MonsterID}),
					%% 检查是否要通知解锁或领奖
					case checkRewardSingle(Old, New) of
						{[], []} ->
							skip;
						{ListUnlockID, ListRewardID} ->
							playerMsg:sendNetMsg(#pk_GS2U_MonsterBookNeed_Sync{
								listUnlockID = ListUnlockID,
								listRewardID = ListRewardID
							})
					end;
				_ ->
					skip
			end;
		_ ->
			?WARN_OUT("msg_snap can not find id:~w from cfg_monster_file RoleID:~w", [MonsterID, playerState:getRoleID()]),
			skip	%% 不在配置中，忽略请求
	end.

%%%-------------------------------------------------------------------
% 解锁请求
-spec msg_unlock(MonsterID::uint16()) -> no_return().
msg_unlock(MonsterID) ->
	case getCfg:getCfgByKey(cfg_monster_file, MonsterID) of
		#monster_fileCfg{} = Cfg ->
			ListMonsterBook = playerState2:getPlayerDataElement(#rec_playerdata.rec_player_monster_book),
			case lists:keyfind(MonsterID, #rec_player_monster_book.monsterID, ListMonsterBook) of
				false ->
					?ERROR_CODE(?ErrorCode_MonsterBook_Locked);	%% 没有达到解锁条件
				MonsterBook ->
					case checkReward(?RewardType_Unlock, MonsterBook) of
						?RewardRet_Cannot ->
							?ERROR_CODE(?ErrorCode_MonsterBook_Locked);	%% 没有达到解锁条件
						?RewardRet_Already ->
							?ERROR_CODE(?ErrorCode_MonsterBook_UnLocked);	%% 已经解锁过了
						?RewardRet_Can ->
							%% 标记为已解锁
							MonsterBookNew = MonsterBook#rec_player_monster_book{isUnlock = 1},
							ListMonsterBookNew = lists:keyreplace(
								MonsterID,
								#rec_player_monster_book.monsterID,
								ListMonsterBook,
								MonsterBookNew
							),
							playerState2:setPlayerDataElement(#rec_playerdata.rec_player_monster_book, ListMonsterBookNew),
							%% 解锁奖励
							rewardForUnlock(Cfg),
							%% 通知客户端
							playerMsg:sendNetMsg(#pk_GS2U_MonsterBookUnlock_Ack{id = MonsterID})
					end
			end;
		_ ->
			?WARN_OUT("msg_unlock can not find id:~w from cfg_monster_file RoleID:~w", [MonsterID, playerState:getRoleID()]),
			skip	%% 不在配置中，忽略请求
	end.

%%%-------------------------------------------------------------------
% 领奖请求
-spec msg_reward(MonsterID::uint16()) -> no_return().
msg_reward(MonsterID) ->
	case getCfg:getCfgByKey(cfg_monster_file, MonsterID) of
		#monster_fileCfg{} ->
			ListMonsterBook = playerState2:getPlayerDataElement(#rec_playerdata.rec_player_monster_book),
			case lists:keyfind(MonsterID, #rec_player_monster_book.monsterID, ListMonsterBook) of
				false ->
					?ERROR_CODE(?ErrorCode_MonsterBook_NoReward);	%% 没有达到领奖条件
				MonsterBook ->
					case checkReward(?RewardType_Extra, MonsterBook) of
						?RewardRet_Cannot ->
							?ERROR_CODE(?ErrorCode_MonsterBook_NoReward);	%% 没有达到领奖条件
						?RewardRet_Already ->
							?ERROR_CODE(?ErrorCode_MonsterBook_Rewarded);	%% 已经领过了
						?RewardRet_Can ->
							%% 标记为已领奖
							MonsterBookNew = MonsterBook#rec_player_monster_book{isReward = 1},
							ListMonsterBookNew = lists:keyreplace(
								MonsterID,
								#rec_player_monster_book.monsterID,
								ListMonsterBook,
								MonsterBookNew
							),
							playerState2:setPlayerDataElement(#rec_playerdata.rec_player_monster_book, ListMonsterBookNew),
							%% 刷新属性
							refreshProp(),
							%% 通知客户端
							playerMsg:sendNetMsg(#pk_GS2U_MonsterBookReward_Ack{id = MonsterID})
					end
			end;
		_ ->
			?WARN_OUT("msg_reward can not find id:~w from cfg_monster_file RoleID:~w", [MonsterID, playerState:getRoleID()]),
			skip	%% 不在配置中，忽略请求
	end.

%%%-------------------------------------------------------------------
% 上线初始化
-spec init() -> no_return().
init() ->
	case playerMainMenu:isOpen(?ModeType_Handbook) of
		true ->
			L = playerState2:getPlayerDataElement(#rec_playerdata.rec_player_monster_book),
			LFix = init_fix(L, []),
			playerState2:setPlayerDataElement(#rec_playerdata.rec_player_monster_book, LFix),
			case checkRewardOnline(LFix, [], []) of
				{[], []} ->
					skip;	%% 没有数据
				{ListUnlockID, ListRewardID} ->
					playerMsg:sendNetMsg(#pk_GS2U_MonsterBookNeed_Sync{
						listUnlockID = ListUnlockID,
						listRewardID = ListRewardID
					})
			end;
		_ ->
			skip	%% 功能开放前没有数据
	end,
	refreshProp().

%%%-------------------------------------------------------------------
% 修复错误的数据
init_fix([], Acc) ->
	lists:reverse(Acc);
init_fix([#rec_player_monster_book{monsterID = MonsterID} = H | T], Acc) ->
	case getCfg:getCfgByKey(cfg_monster_file, MonsterID) of
		#monster_fileCfg{} ->
			init_fix(T, [H | Acc]);
		_ ->
			?ERROR_OUT("init_fix invalid monster:~w RoleID:~w", [H, playerState:getRoleID()]),
			init_fix(T, Acc)
	end.

%%%-------------------------------------------------------------------
% 击杀怪物回调
-spec killMonster(MonsterID::uint16()) -> no_return().
killMonster(MonsterID) ->
	case playerMainMenu:isOpen(?ModeType_Handbook) of
		true ->
			case getCfg:getCfgByKey(cfg_monster_file, MonsterID) of
				#monster_fileCfg{} ->
					ListMonsterBook = playerState2:getPlayerDataElement(#rec_playerdata.rec_player_monster_book),
					{Old, New, ListNew} =
						case lists:keyfind(MonsterID, #rec_player_monster_book.monsterID, ListMonsterBook) of
							false ->
								%% 新增
								MonsterBook = #rec_player_monster_book{roleID = playerState:getRoleID(), monsterID = MonsterID},
								MonsterBookNew = MonsterBook#rec_player_monster_book{countKill = 1},
								ListMonsterBookNew = [MonsterBookNew | ListMonsterBook],
								{MonsterBook, MonsterBookNew, ListMonsterBookNew};
							#rec_player_monster_book{countKill = Count} = MonsterBook ->
								%% 累计
								MonsterBookNew = MonsterBook#rec_player_monster_book{countKill = Count + 1},
								ListMonsterBookNew = lists:keyreplace(
									MonsterID,
									#rec_player_monster_book.monsterID,
									ListMonsterBook,
									MonsterBookNew
								),
								{MonsterBook, MonsterBookNew, ListMonsterBookNew}
						end,
					%% 刷新数据
					playerState2:setPlayerDataElement(#rec_playerdata.rec_player_monster_book, ListNew),
					%% 检查是否要通知解锁或领奖
					case checkRewardSingle(Old, New) of
						{[], []} ->
							skip;
						{ListUnlockID, ListRewardID} ->
							playerMsg:sendNetMsg(#pk_GS2U_MonsterBookNeed_Sync{
								listUnlockID = ListUnlockID,
								listRewardID = ListRewardID
							})
					end;
				_ ->
					skip	%% 该怪物不是图鉴中的怪物
			end;
		_ ->
			skip	%% 功能开放前不计数
	end.

%%%-------------------------------------------------------------------
% db2msg
-spec db2msg(#rec_player_monster_book{} | [#rec_player_monster_book{}, ...]) -> #pk_MonsterBook{} | [#pk_MonsterBook{}, ...].
db2msg(#rec_player_monster_book{
	monsterID = ID,
	countKill = Kill,
	isSnap = IsSnap,
	isUnlock = IsUnlock,
	isReward = IsReward
}) ->
	#pk_MonsterBook{
		id = ID,
		kill = Kill,
		isSnap = misc:convertBoolFromInt(IsSnap),
		isUnlock = misc:convertBoolFromInt(IsUnlock),
		isReward = misc:convertBoolFromInt(IsReward)
	};
db2msg([]) ->
	[];
db2msg(ListDB) ->
	db2msg(ListDB, []).
db2msg([], Acc) ->
	Acc;
db2msg([H | T], Acc) ->
	Msg = db2msg(H),
	db2msg(T, [Msg | Acc]).

%%%-------------------------------------------------------------------
% 判断是否可以领奖（解锁奖励和扩展奖励）
-spec checkReward(uint(), #rec_player_monster_book{}, #rec_player_monster_book{}) -> {uint(), uint()}.
checkReward(RewardType, MonsterBookOld, MonsterBookNew) ->
	{checkReward(RewardType, MonsterBookOld), checkReward(RewardType, MonsterBookNew)}.

-spec checkReward(uint(), #rec_player_monster_book{}) -> uint().
% 已经解锁了
checkReward(?RewardType_Unlock, #rec_player_monster_book{isUnlock = 1}) ->
	?RewardRet_Already;
% 解锁奖励
checkReward(?RewardType_Unlock, #rec_player_monster_book{monsterID = MonsterID, countKill = CountKill, isSnap = IsSnap}) ->
	case getCfg:getCfgByKey(cfg_monster_file, MonsterID) of
		#monster_fileCfg{unlock_way = [1, _]} ->	%% 照相解锁奖励
			case IsSnap of
				0 ->
					?RewardRet_Cannot;
				_ ->
					?RewardRet_Can
			end;
		#monster_fileCfg{unlock_way = [2, CountKillAim]} ->
			case CountKill >= CountKillAim of
				false ->
					?RewardRet_Cannot;
				_ ->
					?RewardRet_Can
			end;
		#monster_fileCfg{unlock_way = Invalid} ->
			?ERROR_OUT("?RewardType_Unlock checkReward invalid unlock_way:~w id:~w RoleID:~w", [Invalid, MonsterID, playerState:getRoleID()]),
			?RewardRet_Cannot;	%% 配置格式错误
		_ ->
			?ERROR_OUT("?RewardType_Unlock checkReward can not find id:~w from cfg_monster_file RoleID:~w", [MonsterID, playerState:getRoleID()]),
			?RewardRet_Cannot	%% 不在配置中
	end;
% 已经领奖了
checkReward(?RewardType_Extra, #rec_player_monster_book{isReward = 1}) ->
	?RewardRet_Already;
% 扩展奖励
checkReward(?RewardType_Extra, #rec_player_monster_book{monsterID = MonsterID, countKill = CountKill}) ->
	case getCfg:getCfgByKey(cfg_monster_file, MonsterID) of
		#monster_fileCfg{extra_target = CountKillAim} ->
			case CountKill >= CountKillAim of
				false ->
					?RewardRet_Cannot;
				_ ->
					?RewardRet_Can
			end;
		_ ->
			?ERROR_OUT("?RewardType_Extra checkReward can not find id:~w from cfg_monster_file RoleID:~w", [MonsterID, playerState:getRoleID()]),
			?RewardRet_Cannot	%% 不在配置中，不能领奖
	end;
% 无法处理的情况
checkReward(RewardType, Cfg) ->
	?ERROR_OUT("checkReward invalid args RewardType:~w RoleID:~w Cfg:~w~n~p", [RewardType, playerState:getRoleID(), Cfg, misc:getStackTrace()]),
	?RewardRet_Cannot.

%%%-------------------------------------------------------------------
% 基于checkReward/2和checkReward/3封装一些常用的场景

% 单个图鉴数据变化时检查是否需要各种领奖
-spec checkRewardSingle(#rec_player_monster_book{}, #rec_player_monster_book{}) -> {[MonsterIDUnlock::uint16()], [MonsterIDReward::uint16()]}.
checkRewardSingle(#rec_player_monster_book{monsterID = MonsterID} = MonsterBookOld, MonsterBookNew) ->
	ListUnlock =
		case checkReward(?RewardType_Unlock, MonsterBookOld, MonsterBookNew) of
			{?RewardRet_Cannot, ?RewardRet_Can} ->
				[MonsterID];
			_ ->
				[]
		end,
	ListReward =
		case checkReward(?RewardType_Extra, MonsterBookOld, MonsterBookNew) of
			{?RewardRet_Cannot, ?RewardRet_Can} ->
				[MonsterID];
			_ ->
				[]
		end,
	{ListUnlock, ListReward}.

% 上线时检查是否需要各种领奖
-spec checkRewardOnline([#rec_player_monster_book{}, ...], [uint16(), ...], [uint16(), ...]) -> {[uint16(), ...], [uint16(), ...]}.
checkRewardOnline([], AccUnlock, AccReward) ->
	{AccUnlock, AccReward};
checkRewardOnline([#rec_player_monster_book{monsterID = MonsterID} = H | T], AccUnlock, AccReward) ->
	AccUnlockNew =
		case checkReward(?RewardType_Unlock, H) of
			?RewardRet_Can ->
				[MonsterID | AccUnlock];
			_ ->
				AccUnlock
		end,
	AccRewardNew =
		case checkReward(?RewardType_Extra, H) of
			?RewardRet_Can ->
				[MonsterID | AccReward];
			_ ->
				AccReward
		end,
	checkRewardOnline(T, AccUnlockNew, AccRewardNew).

%%%-------------------------------------------------------------------
% 解锁奖励
-spec rewardForUnlock(#monster_fileCfg{}) -> no_return().
% 经验奖励
rewardForUnlock(#monster_fileCfg{monster_id = ID, unlock_reward = [1, Exp, _]})
	when erlang:is_integer(Exp), Exp > 0 ->
	playerBase:addExp(Exp, ?ExpSourceMonsterBook, ID);
rewardForUnlock(#monster_fileCfg{monster_id = ID, unlock_reward = [1, Exp]})
	when erlang:is_integer(Exp), Exp > 0 ->
	playerBase:addExp(Exp, ?ExpSourceMonsterBook, ID);
% 货币奖励
rewardForUnlock(#monster_fileCfg{monster_id = ID, unlock_reward = [2, CoinType, CoinCount]})
	when erlang:is_integer(CoinType), CoinType >= ?CoinTypeMin, CoinType =< ?CoinTypeMax,
	erlang:is_integer(CoinCount), CoinCount > 0 ->
	PLog = #recPLogTSMoney{
		target = ?PLogTS_PlayerSelf,
		source = ?PLogTS_MonsterBook,
		reason = ?CoinSourceMonsterBook,
		param = ID
	},
	playerMoney:addCoin(CoinType, CoinCount, PLog);
% 错误的格式
rewardForUnlock(#monster_fileCfg{monster_id = ID, unlock_reward = Invalid}) ->
	?ERROR_OUT("rewardForUnlock invalid unlock_reward:~w id:~w RoleID:~w", [Invalid, ID, playerState:getRoleID()]).

%%%-------------------------------------------------------------------
% 刷新属性
-spec refreshProp() -> no_return().
refreshProp() ->
	ListPropOld = playerPropSync:getProp(?SerProp_MonsterBookProp),
	{MapIDCount, ListPropMonster} = refreshProp_1_filterMonster(),
	ListPropAll = refreshProp_2_map(MapIDCount, ListPropMonster),
	case refreshProp_3_combine(ListPropAll, []) of
		ListPropOld ->
			skip;	%% 属性无变化，忽略
		ListPropNew ->
			playerPropSync:setAny(?SerProp_MonsterBookProp, ListPropNew),
			ListPropDel = lists:foldl(fun({Type, Value}, Acc) -> [{Type, -Value} | Acc] end, [], ListPropOld),
			playerCalcProp:changeProp_AddMulti(ListPropDel, [], ListPropNew, [], true)
	end.

% 计算新属性1_筛选出已达到扩展奖励条件的怪物数据
-spec refreshProp_1_filterMonster() -> {MapIDCount::[{uint16(), uint()}, ...], Prop::[{uint(), float()}, ...]}.
refreshProp_1_filterMonster() ->
	ListMonsterBook = playerState2:getPlayerDataElement(#rec_playerdata.rec_player_monster_book),
	refreshProp_1_filterMonster(ListMonsterBook, {[], []}).

refreshProp_1_filterMonster([], Acc) ->
	Acc;
refreshProp_1_filterMonster([#rec_player_monster_book{monsterID = ID, isReward = 1} | T], {MapIDCount, Prop} = Acc) ->
	case getCfg:getCfgByKey(cfg_monster_file, ID) of
		#monster_fileCfg{area = MapID, extra_bonus = [PropType, PropValue]} ->
			% 地图ID计数，用于后续计算地图相关的属性奖励
			MapIDCountNew =
				case lists:keyfind(MapID, 1, MapIDCount) of
					false ->
						[{MapID, 1} | MapIDCount];
					{_, Count} ->
						lists:keyreplace(MapID, 1, MapIDCount, {MapID, Count + 1})
				end,
			% 累计怪物给的属性奖励
			PropNew = [{PropType, erlang:float(PropValue)} | Prop],
			refreshProp_1_filterMonster(T, {MapIDCountNew, PropNew});
		#monster_fileCfg{} ->
			refreshProp_1_filterMonster(T, Acc);	%% 不符合奖励要求，忽略
		_ ->
			?ERROR_OUT(
				"refreshProp_1_filterMonster can not find cfg_monster_file.id:~w RoleID:~w",
				[ID, playerState:getRoleID()]
			),
			refreshProp_1_filterMonster(T, Acc)		%% 配置错误，无法找到配置
	end;
refreshProp_1_filterMonster([_ | T], Acc) ->
	refreshProp_1_filterMonster(T, Acc).	%% 未领奖，忽略

% 计算新属性2_根据地图ID计数获取地图相关的属性奖励
-spec refreshProp_2_map(MapIDCount::[{uint16(), uint()}, ...], Acc::[{uint(), float()}, ...]) -> Result::[{uint(), float()}, ...].
refreshProp_2_map([], Acc) ->
	Acc;
refreshProp_2_map([{MapID, Count} | T], Acc) ->
	case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeNormal, monster_collect = undefined} ->
			refreshProp_2_map(T, Acc);	%% 没有配置地图奖励
		#mapsettingCfg{type = ?MapTypeNormal, monster_collect = ListAim} ->
			refreshProp_2_map_(ListAim, Count, Acc);
		#mapsettingCfg{} ->
			?ERROR_OUT(
				"refreshProp_2_map not normal map:~w RoleID:~w",
				[MapID, playerState:getRoleID()]
			),
			refreshProp_2_map(T, Acc);	%% 配置错误，不是普通地图
		_ ->
			?ERROR_OUT(
				"refreshProp_2_map can not find map:~w RoleID:~w",
				[MapID, playerState:getRoleID()]
			),
			refreshProp_2_map(T, Acc)	%% 配置错误，无法找到配置
	end.
refreshProp_2_map_([], _Count, Acc) ->
	Acc;
refreshProp_2_map_([{CountAim, PropType, PropValue} | T], Count, Acc) when
	Count >= CountAim ->
	refreshProp_2_map_(T, Count, [{PropType, erlang:float(PropValue)} | Acc]);
refreshProp_2_map_([_ | T], Count, Acc) ->
	refreshProp_2_map_(T, Count, Acc).

% 计算新属性3_合并重复属性
-spec refreshProp_3_combine(Prop::[{uint(), float()}, ...], Acc::[{uint(), float()}, ...]) -> Result::[{uint(), float()}, ...].
refreshProp_3_combine([], Acc) ->
	Acc;
refreshProp_3_combine([{PropType, PropValue} | T], Acc) ->
	AccNew =
		case lists:keyfind(PropType, 1, Acc) of
			{_, PropValueAcc} ->
				lists:keyreplace(PropType, 1, Acc, {PropType, PropValue + PropValueAcc});
			false ->
				[{PropType, PropValue} | Acc]
		end,
	refreshProp_3_combine(T, AccNew).

%%%-------------------------------------------------------------------
% 查询地图或怪物状态
% type[1查询怪物配置 2查询怪物状态 1查询地图配置 2查询地图状态] id[怪物ID或者地图ID]
-spec gmQuery(uint(), uint16()) -> string() | skip.
gmQuery(1, MonsterID) ->
	case getCfg:getCfgByKey(cfg_monster_file, MonsterID) of
		#monster_fileCfg{unlock_way = UnlockWay, unlock_reward = UnlockReward,
			extra_target = ExTarget, extra_bonus = ExBonus} ->
			io_lib:format(
				"MonsterID:~w UnlockWay:~w UnlockReward:~w ExTarget:~w ExBonus:~w",
				[MonsterID, UnlockWay, UnlockReward, ExTarget, ExBonus]
			);
		_ ->
			io_lib:format("can not find:~w from cfg_monster_file", [MonsterID])
	end;
gmQuery(2, MonsterID) ->
	case getCfg:getCfgByKey(cfg_monster_file, MonsterID) of
		#monster_fileCfg{} ->
			ListMonsterBook = playerState2:getPlayerDataElement(#rec_playerdata.rec_player_monster_book),
			#rec_player_monster_book{
				isSnap = IsSnap,
				isUnlock = IsUnlock,
				isReward = IsReward,
				countKill = CountKill
			} = MonsterBook =
				case lists:keyfind(MonsterID, #rec_player_monster_book.monsterID, ListMonsterBook) of
					false ->
						#rec_player_monster_book{
							roleID = playerState:getRoleID(),
							monsterID = MonsterID
						};
					Rec ->
						Rec
				end,
			CanUnlock = checkReward(?RewardType_Unlock, MonsterBook),
			CanReward = checkReward(?RewardType_Extra, MonsterBook),
			io_lib:format(
				"MonsterID:~w IsSnap:~w IsUnlock:~w IsReward:~w CountKill:~w CanUnlock:~w CanReward:~w",
				[MonsterID, IsSnap, IsUnlock, IsReward, CountKill, CanUnlock, CanReward]
			);
		_ ->
			io_lib:format("can not find:~w from cfg_monster_file", [MonsterID])
	end;
gmQuery(3, MapID) ->
	case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeNormal, monster_collect = ListAim} ->
			io_lib:format(
				"MapID:~w monster_collect:~w",
				[MapID, ListAim]
			);
		#mapsettingCfg{} ->
			io_lib:format("is not normal map:~w from cfg_mapsetting", [MapID]);
		_ ->
			io_lib:format("can not find:~w from cfg_mapsetting", [MapID])
	end;
gmQuery(4, MapID) ->
	case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeNormal} ->
			FunSum =
				fun(#rec_player_monster_book{monsterID = ID, isReward = IsReward}, Acc) ->
					case getCfg:getCfgPStack(cfg_monster_file, ID) of
						#monster_fileCfg{area = MapID} when IsReward =:= 1 ->
							Acc + 1;
						_ ->
							Acc
					end
				end,
			ListMonsterBook = playerState2:getPlayerDataElement(#rec_playerdata.rec_player_monster_book),
			Count = lists:foldl(FunSum, 0, ListMonsterBook),
			io_lib:format(
				"MapID:~w Count:~w",
				[MapID, Count]
			);
		#mapsettingCfg{} ->
			io_lib:format("is not normal map:~w from cfg_mapsetting", [MapID]);
		_ ->
			io_lib:format("can not find:~w from cfg_mapsetting", [MapID])
	end;
gmQuery(_, _) ->
	skip.

%%%-------------------------------------------------------------------
% 设置怪物状态
% type[1是否拍照 2是否解锁 3是否领奖 4击杀数量] value 1表示是，0表示否，数量任意
-spec gmSetMonster(uint16(), uint(), uint()) -> ok | skip.
gmSetMonster(MonsterID, Type, Value) ->
	case getCfg:getCfgByKey(cfg_monster_file, MonsterID) of
		#monster_fileCfg{} ->
			ListMonsterBook = playerState2:getPlayerDataElement(#rec_playerdata.rec_player_monster_book),
			MonsterBook =
			case lists:keyfind(MonsterID, #rec_player_monster_book.monsterID, ListMonsterBook) of
				false ->
					#rec_player_monster_book{roleID = playerState:getRoleID(), monsterID = MonsterID};
				Rec ->
					Rec
			end,
			case gmSetMonster_(Type, Value, MonsterBook) of
				MonsterBook ->
					skip;
				skip ->
					skip;
				MonsterBookNew ->
					ListMonsterBookNew = lists:keystore(MonsterID, #rec_player_monster_book.monsterID, ListMonsterBook, MonsterBookNew),
					playerState2:setPlayerDataElement(#rec_playerdata.rec_player_monster_book, ListMonsterBookNew),
					ok
			end;
		_ ->
			skip
	end.
gmSetMonster_(1, 0, #rec_player_monster_book{isSnap = 0}) ->
	skip;
gmSetMonster_(1, 0, #rec_player_monster_book{} = Rec) ->
	Rec#rec_player_monster_book{isSnap = 0};
gmSetMonster_(1, _, #rec_player_monster_book{isSnap = 1}) ->
	skip;
gmSetMonster_(1, _, #rec_player_monster_book{} = Rec) ->
	Rec#rec_player_monster_book{isSnap = 1};
gmSetMonster_(2, 0, #rec_player_monster_book{isUnlock = 0}) ->
	skip;
gmSetMonster_(2, 0, #rec_player_monster_book{} = Rec) ->
	Rec#rec_player_monster_book{isUnlock = 0};
gmSetMonster_(2, _, #rec_player_monster_book{isUnlock = 1}) ->
	skip;
gmSetMonster_(2, _, #rec_player_monster_book{} = Rec) ->
	Rec#rec_player_monster_book{isUnlock = 1};
gmSetMonster_(3, 0, #rec_player_monster_book{isReward = 0}) ->
	skip;
gmSetMonster_(3, 0, #rec_player_monster_book{} = Rec) ->
	Rec#rec_player_monster_book{isReward = 0};
gmSetMonster_(3, _, #rec_player_monster_book{isReward = 1}) ->
	skip;
gmSetMonster_(3, _, #rec_player_monster_book{} = Rec) ->
	Rec#rec_player_monster_book{isReward = 1};
gmSetMonster_(4, Value, #rec_player_monster_book{} = Rec) when
	erlang:is_integer(Value), Value >= 0 ->
	Rec#rec_player_monster_book{countKill = Value};
gmSetMonster_(_, _, #rec_player_monster_book{}) ->
	skip.
