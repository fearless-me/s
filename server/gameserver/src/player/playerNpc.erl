%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2015, <公司>
%%% @doc 玩家点击NPC的一些处理
%%%
%%% @end
%%% Created : 13. 一月 2015 20:31
%%%-------------------------------------------------------------------
-module(playerNpc).
-author("ZhongYuanWei").

-include("gsInc.hrl").

%%NPC商店
-define(NpcTypeShop,1).
%%NPC仓库
-define(NpcTypeStorage,2).
%%NPC活动
-define(NpcTypeActive,4).


%% API
-export([
		 enterActiveMap/2
		]).

%%通过NPC进入玩法地图
-spec enterActiveMap(ActiveID,NpcCode) -> ok when ActiveID::uint(), NpcCode::uint().
enterActiveMap(ActiveID,NpcCode) ->
	case ets:lookup(playerState:getMapNpcEts(),NpcCode) of
		[#recMapObject{id = NpcID}] ->
			case getCfg:getCfgPStack(cfg_npc, NpcID) of
				#npcCfg{button_type = ?NpcTypeActive,button_para1 = ActiveID} ->
					case getCfg:getCfgPStack(cfg_dailyInterface, ActiveID) of
						#dailyInterfaceCfg{mapid = MapIDList} ->
							[FirstID|_] = MapIDList,
							LevelRange = (playerState:getLevel() div 10) * 10,
							CopyMapID =
								case lists:keyfind(LevelRange, 1, MapIDList) of
								{_,CopyMapID1}->
									CopyMapID1;
								_ ->
									{_,CopyMapID2} = FirstID,
									CopyMapID2
							end,
							case playerCopyMap:canEnterCopyMap_NotJudgeTimes(CopyMapID) of
								true->
									playerCopyMap:enterCopyMap(CopyMapID),
%%									playerTask2:updateActiveTask(ActiveID),
									playerTask:updateTask(?TaskSubType_Active, ActiveID),
									playerliveness:livenessFinished(2,ActiveID,1);
								ErrorCode->
									playerMsg:sendErrorCodeMsg(ErrorCode)
							end,
							ok;
						_ ->
							?ERROR_OUT("~p unfoundCfgByActiveID:~p", [?MODULE, ActiveID])
					end;
				_ ->
					?ERROR_OUT("~p unfoundCfg_npcByNpcID:~p", [?MODULE, NpcID])
			end,
			ok;
		_ ->
			?DEBUG_OUT("~p unfoundMapObjectByNpcCode:~p", [?MODULE,NpcCode])
	end,

	ok.

