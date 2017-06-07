%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 玩家常规护送
%%% @end
%%% Created : 09. 三月 2017 14:22
%%%-------------------------------------------------------------------
-module(playerConvoy).
-author(tiancheng).

-include("playerPrivate.hrl").
-include("bst.hrl").

%% FIXME 护送失败的回调方法，在此注册，1个参数{MonsterID::uint32(), MonsterCode::uint64(), ExtData::term()}
-define(ConvoyFailedCallBackFunList, [
]).

%% API
-export([
	init/2,
	convoyFailedCallBack/0,
	convoyFailedCallBack/1
]).

-export([
	giveUpConvoy/0,
	convoySuccess/0
]).

-export([
	playerEnterMapReal/0,
	filterConvoyObject/1
]).

%% 护送初始化
-spec init(MonsterID::uint(), ExtData::term()) -> boolean().
init(MonsterID, ExtData) ->
	case isConvoyIng() of
		false ->
			case getCfg:getCfgByKey(cfg_monster, MonsterID) of
				#monsterCfg{monsterAI = [?AI_TYPE_ConvoyFollowPlayer|_]} = Cfg ->
					convoy(Cfg, ExtData);
				#monsterCfg{monsterAI = [?AI_TYPE_ConvoyPlayerFollow|_]} = Cfg ->
					convoy(Cfg, ExtData);
				_ ->
					false
			end;
		_ ->
			false
	end.

%% 下线护送失败
-spec convoyFailedCallBack() -> ok.
convoyFailedCallBack() ->
	case isConvoyIng() of
		true ->
			convoyFailedCallBack(getConvoyInfo());
		_ ->
			skip
	end,
	ok.

%% 护送失败的回调
-spec convoyFailedCallBack(Data::{MonsterID::uint32(), MonsterCode::uint64(), ExtData::term()}) -> ok.
convoyFailedCallBack({MonsterID, MonsterCode, ExtData} = Param) ->
	case getConvoyInfo() of
		{MonsterID, MonsterCode, ExtData} ->
			setConvoyInfo(convoyInit()),

			?LOG_OUT("convoy failed roleID[~p] MonsterID[~p] MonsterCode[~p] ExtData[~p]",
				[playerState:getRoleID(), MonsterID, MonsterCode, ExtData]),

			%% 护送失败
			F =
				fun(Fun) ->
					try
					    Fun(Param)
					catch
					    _:Why ->
							?ERROR_OUT("convoyFailedCallBack failed:~p,~p", [Fun, Why])
					end
				end,
			lists:foreach(F, ?ConvoyFailedCallBackFunList);
		Error ->
			?ERROR_OUT("recv convoy failed roleID[~p] MonsterID[~p] MonsterCode[~p] ExtData[~p] Error[~p]",
			[playerState:getRoleID(), MonsterID, MonsterCode, ExtData, Error])
	end,
	ok;
convoyFailedCallBack({RoleID, false}) ->
	setConvoyInfo(convoyInit()),
	?ERROR_OUT("convoyFailedCallBack error:~p", [RoleID]),
	ok.

%% 放弃护送
-spec giveUpConvoy() -> boolean().
giveUpConvoy() ->
	case isConvoyIng() of
		true ->
			psMgr:sendMsg2PS(playerState:getMapPid(), convoyEnd, {self(), playerState:getRoleID()}),
			true;
		_ ->
			false
	end.

%% 护送成功
-spec convoySuccess() -> boolean().
convoySuccess() ->
	case isConvoyIng() of
		true ->
			psMgr:sendMsg2PS(playerState:getMapPid(), convoyEnd, {success, playerState:getRoleID()}),
			true;
		_ ->
			false
	end.

%% 是不是护送目标
-spec filterConvoyObject(CodeList::[uint64(),...]) -> CodeList2::[uint64(),...].
filterConvoyObject(CodeList) ->
	case isConvoyIng() of
		true ->
			{_MonsterID, MonsterCode, _ExtData} = getConvoyInfo(),
			lists:delete(MonsterCode, CodeList);
		_ ->
			CodeList
	end.

%% 护送过程中切换地图，恢复护送！
-spec playerEnterMapReal() -> boolean().
playerEnterMapReal() ->
	case isConvoyIng() of
		true ->
			{MonsterID, MonsterCode, ExtData} = getConvoyInfo(),
			MonsterCfg = #monsterCfg{} = getCfg:getCfgByKey(cfg_monster, MonsterID),
			?LOG_OUT("convoy change map roleID[~p] MonsterID[~p] MonsterCode[~p]",
				[playerState:getRoleID(), MonsterID, MonsterCode]),
			sendConvoyToMap(MonsterID, MonsterCode, ExtData, MonsterCfg),
			ok;
		_ ->
			skip
	end,
	ok.

%% 护送
convoy(#monsterCfg{iD = MonsterID} = MonsterCfg, ExtData) ->
	MonsterCode = codeMgr:makeCode(?CodeTypeMonster),
	setConvoyInfo({MonsterID, MonsterCode, ExtData}),
	?LOG_OUT("initMapConvoy:~p", [playerState:getRoleID()]),
	sendConvoyToMap(MonsterID, MonsterCode, ExtData, MonsterCfg),
	true.

sendConvoyToMap(MonsterID, MonsterCode, ExtData, MonsterCfg) ->
	R = #recConvoyInfo{
		roleID = playerState:getRoleID(),
		roleCode = playerState:getPlayerCode(),
		playerPid = self(),
		playerNetPid = playerState:getNetPid(),
		monsterID = MonsterID,
		monsterCode = MonsterCode,
		extData = ExtData
	},
	?LOG_OUT("sendConvoyToMap:~p", [R]),
	psMgr:sendMsg2PS(playerState:getMapPid(), initMapConvoy, {R, MonsterCfg, playerState:getPos()}),
	ok.


isConvoyIng() -> getConvoyInfo() /= convoyInit().
convoyInit() -> {0,0,undefined}.
setConvoyInfo(Info) -> playerPropSync:setAny(?SerProp_PlayerConvoyTarget, Info).
getConvoyInfo() -> playerPropSync:getProp(?SerProp_PlayerConvoyTarget).