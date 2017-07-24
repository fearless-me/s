%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 玩家家园系统
%%% @end
%%% Created : 21. 八月 2017 11:48
%%%-------------------------------------------------------------------
-module(playerHome).
-author(tiancheng).

-include("gsInc.hrl").
-include("playerPrivate.hrl").

%% 请求拜访记录的条数
-define(VisitRecordNumber, 20).

%% MSG
-export([
	msg/1
]).

%% API
-export([
	createHome/1,
	createHomeAck/1,
	enterHomeAck/1,
	addStylish/1,
	addStylish/2,
	addComfort/1,
	addComfort/2,
	addPopularity/1,
	addPopularity/2,
	enterHomeMap/1
]).

%% gm
-export([
	enterHome/1,
	gm_homeup/1
]).

msg(#pk_U2GS_CreateHome{adminAreaID = AreaID}) ->
	%% 进入房屋
	createHome(AreaID),
	ok;
msg(#pk_U2GS_EnterHome{roleID = RoleID, flag = ?Home_House}) ->
	%% 进入房屋
	enterHome(RoleID, ?Home_House),
	ok;
msg(#pk_U2GS_EnterHome{roleID = RoleID, flag = ?Home_Courtyard}) ->
	%% 进入庭院
	enterHome(RoleID, ?Home_Courtyard),
	ok;
msg(#pk_U2GS_RequestHomeInfo{roleID = RoleID}) ->
	%% 请求家园信息
	case homeInterface:queryHome(RoleID) of
		#rec_home{} = Home ->
			sendHomeInfo(Home);
		false ->
			playerMsg:sendNetMsg(makeHomeInfo()),
			playerMsg:sendErrorCodeMsg(?ErrorCode_TargetHavaNotHome),
			ok
	end,
	ok;
msg(#pk_U2GS_ChangeHomeName{homeID = HomeID, homeName = HomeName}) ->
	RoleID = playerState:getRoleID(),
	case canModifyHomeData(HomeID) of
		true ->
			case str:get_utf8_char_count(HomeName) < 32 of
				true ->
					case getCfg:getCfgByKey(cfg_globalsetup, home_namefix) of
						#globalsetupCfg{setpara = [MoneyType, Number]} ->
							case MoneyType >= ?CoinTypeMin andalso MoneyType =< ?CoinTypeMax andalso  playerState:getCoin(MoneyType) >= Number of
								true ->
									%% 扣钱
									PLog = #recPLogTSMoney{
										reason = ?CoinUseHome,
										param = Number,
										target = ?PLogTS_Home,
										source = ?PLogTS_PlayerSelf
									},
									playerMoney:decCoin(MoneyType, Number, PLog),

									psMgr:sendMsg2PS(?HomeOtp, changeHomeName, {HomeID, RoleID, HomeName, playerState:getNetPid()}),
									ok;
								_ ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_CorsAttachBattle_NotCoin)
							end;
						_ ->
							skip
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_HomeNameNotUse)
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_HomeNotExist)
	end,
	ok;
msg(#pk_U2GS_UpgradeHomeArea{homeID = HomeID, areaID = AreaID}) ->
	upgradeHomeArea(HomeID, AreaID),
	ok;
%% 请求家园可拜访列表
msg(#pk_U2GS_HomeVisit{paga = 0, number = _Number}) ->
	%% 邻居
	RetMsg =
		case homeInterface:queryHome(playerState:getRoleID()) of
			#rec_home{} = Home ->
				makeNeighborHomeVisit(Home);
			false ->
				makeNullHomeVisit()
		end,
	playerMsg:sendNetMsg(RetMsg),
	ok;
msg(#pk_U2GS_HomeVisit{paga = Page, number = Number}) ->
	%% 好友
	RetMsg = makeFriendHomeVisit(Page, Number),
	playerMsg:sendNetMsg(RetMsg),
	ok;
%% 请求拜访记录
msg(#pk_U2GS_RequestVisitRecord{}) ->
	sendVisitRecord(),
	ok;
msg(Msg) ->
	?ERROR_OUT("receive error msg:~p,~p", [playerState:getRoleID(), Msg]),
	playerMsg:sendErrorCodeMsg(?ErrorCode_SystemNotOpen),
	ok.

sendVisitRecord() ->
	MapID = playerState:getMapID(),
	case homeInterface:isHomeMap(MapID) of
		true ->
			%% 发送家园信息给客户端
			MapPID = playerState:getMapPid(),
			case homeInterface:queryHomeMap(MapID, MapPID) of
				#rec_home_map{homeID = {HomeID, _Flag}} ->
					List = ets:lookup(?HomeVisitEts, HomeID),
					List2 = lists:reverse(lists:keysort(#rec_home_visit.timestamp, List)),
					List3 = lists:sublist(List2, ?VisitRecordNumber),
					SelfID = playerState:getRoleID(),
					F =
						fun(#rec_home_visit{visitID = VisitID} = Visit, Acc) ->
							#pk_VisitRecord{
								%% UInt64
								roleID = VisitID,
								%% String
								roleName = playerNameUID:getPlayerNameByUID(VisitID),
								%% Byte 关系类型：1好友，2伴侣男，3伴侣女，4陌生人
								relationType = getRelationType(SelfID, VisitID),
								%% Byte 操作记录：1拜访，2收菜，3...
								opType = Visit#rec_home_visit.opType,
								%% UInt32
								opParam1 = Visit#rec_home_visit.opParam1,
								%% UInt32
								opParam2 = Visit#rec_home_visit.opParam2,
								%% UInt32
								opParam3 = Visit#rec_home_visit.opParam3,
								%% UInt64 时间戳
								timestamp = Visit#rec_home_visit.timestamp
							}
						end,
					List4 = lists:map(F, List3),
					playerMsg:sendNetMsg(#pk_GS2U_VisitRecord{lists = List4}),
					ok;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

getRelationType(SelfID, SelfID) -> ?HomeRelationType_Self;
getRelationType(SelfID, TargetID) ->
	case friend2State:isFriend(SelfID, TargetID) of
		true ->
			?HomeRelationType_Friend;
		_ ->
			case marriageState:queryMarriageRoleID(SelfID) of
				TargetID ->
					case core:queryRoleKeyInfoByRoleID(TargetID) of
						#?RoleKeyRec{sex = ?SexWoman} -> ?HomeRelationType_PartnerWoman;
						#?RoleKeyRec{sex = ?SexMan} -> ?HomeRelationType_PartnerMan;
						_ ->
							?HomeRelationType_Stranger
					end;
				_ ->
					?HomeRelationType_Stranger
			end
	end.

makeFriendHomeVisit(Page, Number) ->
	L = getListCheckCD(),
	RL = lists:sublist(L, erlang:max(1, (Page - 1) * Number), Number),
	#pk_GS2U_HomeVisitList{allnumber = erlang:length(L), paga = Page, visits = RL}.

getListCheckCD() ->
	NowSec = time2:getTimestampSec(),
	case get(cacheFriendHomeVisit) of
		undefined ->
			L = getHomeVisitList(),
			put(cacheFriendHomeVisit, {NowSec, L}),
			L;
		{V, List} ->
			case NowSec - V >= 60 of
				true ->
					L = getHomeVisitList(),
					put(cacheFriendHomeVisit, {NowSec, L}),
					L;
				_ ->
					List
			end
	end.

getHomeVisitList() ->
	RoleID = playerState:getRoleID(),
	Friend2Data = friend2State:queryFriend2Data(RoleID),
	Relations = friend2State:queryRelations(Friend2Data#recFriend2Data.relations, ?RELATION_FORMAL),
	L = lists:keysort(#rec_friend2_relation.closeness, Relations),
	L2 = lists:map(fun(#rec_friend2_relation{targetRoleID = TRoleID}) -> TRoleID end, L),
	makeHomeVisit(L2, []).

makeNeighborHomeVisit(#rec_home{homeID = HomeID}) ->
	%% 左邻
	RoleIDLeft = homeInterface:getNeighborLeftRoleID(HomeID),
	%% 右舍
	RoleIDRight = homeInterface:getNeighborRightRoleID(HomeID),
	L = makeHomeVisit([RoleIDLeft, RoleIDRight], []),
	#pk_GS2U_HomeVisitList{allnumber = erlang:length(L), paga = 0, visits = L}.

makeHomeVisit(0, RetList) -> RetList;
makeHomeVisit([], RetList) -> RetList;
makeHomeVisit([RoleID | List], RetList) ->
	case homeInterface:queryHome(RoleID) of
		#rec_home{homeID = HomeID} ->
			SelfID = playerState:getRoleID(),
			case core:queryRoleKeyInfoByRoleID(RoleID) of
				#?RoleKeyRec{roleName = Name, level = Level} ->
					R = #pk_HomeVisit{
						%% UInt64
						roleID = RoleID,
						%% String
						roleName = Name,
						%% UInt32 玩家等级
						level = Level,
						%% UInt64
						homeID = HomeID,
						%% Int32 亲密度，非好友为-1
						closeness = friend2State:queryFriendCloseness(SelfID, RoleID),
						%% Byte 自定义头像MD5(16byte)
						face = playerIdentity:queryFace(RoleID)
					},
					makeHomeVisit(List, [R | RetList]);
				_ ->
					makeHomeVisit(List, RetList)
			end;
		false ->
			makeHomeVisit(List, RetList)
	end.

makeNullHomeVisit() ->
	#pk_GS2U_HomeVisitList{allnumber = 0, paga = 0, visits = []}.

enterHomeMap(MapID) ->
	case homeInterface:isHomeMap(MapID) of
		true ->
			%% 发送家园信息给客户端
			MapPID =playerState:getMapPid(),
			case homeInterface:queryHomeMap(MapID, MapPID) of
				#rec_home_map{homeID = {HomeID, Flag}} ->
					sendHomeInfo(HomeID),
					playerHomePlant:sendHomePlantInfo(HomeID, Flag),
					playerHomeFarming:sendHomeFarmingInfo(HomeID, Flag),

					%% 拜访记录
					Visit = #rec_home_visit{
						homeID = HomeID,
						opType = ?HomeOpType_Visit,
						visitID = playerState:getRoleID(),	%% 访客ID
						areaID = Flag,		%% 区域ID
						timestamp = time2:getLocalDateTimeSec()	%% 时间戳
					},
					ets:insert(?HomeVisitEts, Visit),
					ok;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

upgradeHomeArea(HomeID, AreaID) when AreaID >= ?Home_AreaID_Min andalso AreaID =< ?Home_AreaID_Max ->
	RoleID = playerState:getRoleID(),
	?DEBUG_OUT("upgradeHomeArea:~p,~p,~p", [RoleID, HomeID, AreaID]),
	case canModifyHomeData(HomeID) of
		true ->
			%% 如果没有区域，则开垦，有则升级
			L = homeInterface:queryHomeArea(HomeID),
			AreaLvl =
				case lists:keyfind(AreaID, #rec_home_area.areaID, L) of
					#rec_home_area{areaLvl = Lvl} ->
						%% 升级
						Lvl;
					_ ->
						%% 开垦
						0
				end,
			[#rec_home{homeLvl = HLvl}] = ets:lookup(?HomeEts, HomeID),
			case getCfg:getCfgByKey(cfg_home_area, AreaID, AreaLvl) of
				#home_areaCfg{materials = Materials, coin_cost = Costs, homelevel = HomeLvl}
					when HLvl >= HomeLvl andalso Materials /= undefined andalso Costs /= undefined ->
					%% 检查材料与货币是否足够
					C = checkCost(Costs),
					M = checkMaterial(Materials),
					case C andalso M of
						true ->
							%% call，先消耗，再升级或者开垦
							%% 扣钱
							FDecCoin =
								fun({MoneyType, Number}) ->
									PLog = #recPLogTSMoney{
										reason = ?CoinUseHome,
										param = Number,
										target = ?PLogTS_Home,
										source = ?PLogTS_PlayerSelf
									},
									playerMoney:decCoin(MoneyType, Number, PLog)
								end,
							lists:foreach(FDecCoin, Costs),

							%% 扣除道具
							FDecItem =
								fun({ItemID, NeedNumber}) ->
									PayItemType = playerPackage:getItemType(ItemID),
									PacketType = playerPackage:getPackageType(PayItemType),
									PLogItem = #recPLogTSItem{
										old = NeedNumber,
										new = 0,
										change = -NeedNumber,
										target = ?PLogTS_Home,
										source = ?PLogTS_PlayerSelf,
										gold = 0,
										goldtype = ?CoinTypeGold,
										changReason = ?ItemDeleteReasonHome,
										reasonParam = HomeID
									},
									playerPackage:delGoodsByID(PacketType, ItemID, NeedNumber, PLogItem)
								end,
							lists:foreach(FDecItem, Materials),

							psMgr:sendMsg2PS(?HomeOtp, upgradeHomeArea, {HomeID, RoleID, playerState:getNetPid(), AreaID, AreaLvl}),
							ok;
						_ ->
							%% 货币或者材料不够
							if
								M =:= false ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_NotEnoughRuneMaterial);
								C =:= false ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_CorsAttachBattle_NotCoin);
								true -> skip
							end
					end;
				_ ->
					%% 不满足升级或者开垦条件
					case AreaLvl of
						0 ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_NotMatchOpenCondition);
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_NotMatchUpgradeCondition)
					end
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_HomeNotExist)
	end,
	ok;
upgradeHomeArea(_, _) ->
	ok.

checkMaterial([]) -> true;
checkMaterial({ItemID, NeedNumber}) ->
	playerPackage:getItemNumByID(ItemID) >= NeedNumber;
checkMaterial([Needs | List]) ->
	case checkMaterial(Needs) of
		true ->
			checkMaterial(List);
		_ ->
			false
	end.

checkCost([]) -> true;
checkCost({MoneyType, Number}) ->
	case MoneyType >= ?CoinTypeMin andalso MoneyType =< ?CoinTypeMax of
		true ->
			playerState:getCoin(MoneyType) >= Number;
		_ ->
			false
	end;
checkCost([Needs | List]) ->
	case checkCost(Needs) of
		true ->
			checkCost(List);
		_ ->
			false
	end.

gm_homeup(0) ->
	case homeInterface:queryHome(playerState:getRoleID()) of
		#rec_home{homeLvl = Lvl} ->
			gm_homeup(Lvl + 1);
		_ ->
			false
	end;
gm_homeup(Lvl) ->
	case homeInterface:queryHome(playerState:getRoleID()) of
		#rec_home{homeLvl = Lvl} ->
			true;
		#rec_home{homeID = HomeID, homeLvl = OldLvl} when OldLvl < Lvl ->
			Level = OldLvl + 1,
			case getCfg:getCfgByKey(cfg_home_level, Level) of
				#home_levelCfg{stylish = NeedSt, comfort = NeedCo} ->
					addStylish(HomeID, NeedSt),
					addComfort(HomeID, NeedCo);
				_ ->
					skip
			end,
			timer:sleep(500),
			gm_homeup(Lvl);
		_ ->
			false
	end.

enterHome(Flag) ->
	enterHome(playerState:getRoleID(), Flag).

enterHome(RoleID, Flag) ->
	CanEnter = case Flag of
				   ?Home_House -> true;
				   ?Home_Courtyard -> true;
				   _ ->
					   false
			   end,
	case CanEnter of
		true ->
			case homeInterface:queryHome(RoleID) of
				#rec_home{homeID = HomeID} ->
					?LOG_OUT("enterHome roleID:~p, homeID:~p,~p", [RoleID, HomeID, Flag]),
					%% 如果地图存在，则直接进入，否则，告诉公共进程
					case ets:lookup(?HomeMapEts, {HomeID, Flag}) of
						[#rec_home_map{mapID = MapID, mapPID = MapPID}] ->
							playerScene:onRequestEnterActivityMap(MapID, MapPID);
						_ ->
							psMgr:sendMsg2PS(?HomeOtp, enterHome, {HomeID, RoleID, Flag})
					end;
				false ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_TargetHavaNotHome)
			end;
		_ ->
			skip
	end,
	ok.

createHome(AreaID) ->
	RoleID = playerState:getRoleID(),
	case homeInterface:queryHome(RoleID) of
		#rec_home{} ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_CreateHomeFailed);
		false ->
			psMgr:sendMsg2PS(?HomeOtp, createHome, {RoleID, AreaID})
	end,
	ok.

%% 增加华丽度
addStylish(Value) ->
	RoleID = playerState:getRoleID(),
	case homeInterface:queryHome(RoleID) of
		#rec_home{homeID = HomeID} ->
			addStylish(HomeID, Value);
		_ ->
			skip
	end.
addStylish(HomeID, Value) ->
	psMgr:sendMsg2PS(?HomeOtp, addStylish, {HomeID, Value, playerState:getNetPid()}).

%% 增加舒适度
addComfort(Value) ->
	RoleID = playerState:getRoleID(),
	case homeInterface:queryHome(RoleID) of
		#rec_home{homeID = HomeID} ->
			addComfort(HomeID, Value);
		_ ->
			skip
	end.
addComfort(HomeID, Value) ->
	psMgr:sendMsg2PS(?HomeOtp, addComfort, {HomeID, Value, playerState:getNetPid()}).

%% 增加人气
addPopularity(Value) ->
	RoleID = playerState:getRoleID(),
	case homeInterface:queryHome(RoleID) of
		#rec_home{homeID = HomeID} ->
			addPopularity(HomeID, Value);
		_ ->
			skip
	end.
addPopularity(HomeID, Value) ->
	psMgr:sendMsg2PS(?HomeOtp, addPopularity, {HomeID, Value, playerState:getNetPid()}).

createHomeAck({false, 0}) ->
	%% 生成HomeID失败
	playerMsg:sendErrorCodeMsg(?ErrorCode_System_Error_Unknow),
	ok;
createHomeAck({false, #rec_home{} = Home}) ->
	%% 已经存在家园
	sendHomeInfo(Home),
	ok;
createHomeAck({true, #rec_home{} = Home}) ->
	%% 创建成功
	sendHomeInfo(Home),
	ok.

enterHomeAck({RoleID, MapID, MapPID} = Data) ->
	case playerState:getRoleID() of
		RoleID ->
			playerScene:onRequestEnterActivityMap(MapID, MapPID);
		E ->
			?ERROR_OUT("enterHomeAck:~p,~p", [E, Data]),
			skip
	end.

makeHomeInfo() ->
	RoleID = playerState:getRoleID(),

	%% 同居者
	MarriageID = marriageState:queryMarriageRoleID(RoleID),

	#pk_GS2U_HomeInfo{
		%% UInt64 家园ID，按位存储，10位DBID，10位地区ID，12位段ID，16位号ID
		homeID = 0,
		%% String 为空则表示默认名字，由客户端自行拼接
		homeName = "",
		%% String 服务器名字
		serverName = "",
		%% UInt64 家园拥有者ID
		ownerID = RoleID,
		%% String 名字
		ownerName = playerNameUID:getPlayerNameByUID(RoleID),
		%% UInt64 同居者，配偶ID
		mateID = MarriageID,
		%% String 配偶名字
		mateName = playerNameUID:getPlayerNameByUID(MarriageID),
		%% UInt32 华丽度
		stylish = 0,
		%% UInt32 舒适度
		comfort = 0,
		%% UInt32 家园等级
		homeLvl = 0,
		%% UInt32 人气值
		popularity = 0,
		%% UInt64 左邻ID
		leftID = 0,
		%% String 名字
		leftName = "",
		%% UInt64 右舍ID
		rightID = 0,
		%% String 名字
		rightName = "",
		%% HomeArea 开放的区域
		areas = []
	}.

sendHomeInfo(#rec_home{} = Home) ->
	Msg = homeInterface:makeHomeInfo(Home),
	playerMsg:sendNetMsg(Msg),
	ok;
sendHomeInfo(HomeID) when erlang:is_integer(HomeID) ->
	case ets:lookup(?HomeEts, HomeID) of
		[#rec_home{} = Home] ->
			sendHomeInfo(Home);
		_ ->
			?ERROR_OUT("not found home roleID:~p, homeID:~p", [playerState:getRoleID(), HomeID]),
			skip
	end.

canModifyHomeData(HomeID) ->
	RoleID = playerState:getRoleID(),
	case ets:lookup(?HomeEts, HomeID) of
		[#rec_home{roleID = RID}] ->
			MarriageID = marriageState:queryMarriageRoleID(RID),
			RoleID =:= RID orelse RoleID =:= MarriageID;
		false ->
			false
	end.
