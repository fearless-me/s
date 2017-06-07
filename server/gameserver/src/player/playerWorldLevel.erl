%% @author wangjie
%% @doc @todo 世界等级


-module(playerWorldLevel).

-include("playerPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([sendWorldLevel/0,
         worldLevelUpExp/1,
		 changeWorldExp/2,
		 getgsRankLevel/1
		]).


%% 发送世界等级信息给客户端
-spec sendWorldLevel() -> ok.
sendWorldLevel() ->
	WorldLvl = core:getWorldLevel(),
	changeWorldExp(playerState:getLevel(), WorldLvl),
	playerState:setWorldLevel(WorldLvl),
	Msg = #pk_GS2U_WorldLevel{worldLevel = WorldLvl},
	playerMsg:sendNetMsg(Msg),
	ok.

%% 获取世界等级经验加成
-spec worldLevelUpExp(BaseExp :: uint()) -> float().
worldLevelUpExp(BaseExp) ->
    case erlang:is_integer(BaseExp) andalso BaseExp > 0 of
        true ->
            UpExp = playerState:getWorldLevelExp(),
            trunc(BaseExp * UpExp);
        _ ->
            0
    end.

-spec changeWorldExp(Level ::uint(), WorldLevel ::uint()) -> ok.
changeWorldExp(Level, WorldLevel) ->
	#globalsetupCfg{setpara = [ExpLevel]} = getCfg:getCfgByArgs(cfg_globalsetup, worldlevel_exp),
	DiffLevel =
			case Level >= ExpLevel of
				true ->
		            case WorldLevel - Level of
		                Value when Value >= 0 ->
		                    Value;
		                _ ->
		                    0
		            end;
				_ ->
					0
			end,
			case getCfg:getCfgByArgs(cfg_worldlevel_exp, DiffLevel) of
				#worldlevel_expCfg{id = DiffLevel, exp = Exp}  ->
		        	playerState:setWorldLevelExp(Exp);
				_ ->
					playerState:setWorldLevelExp(0)
			end,
	ok.


getgsRankLevel(Postion) when Postion > 0->
	LevelRank = myEts:lookUpEts(?TABLE_RankInfo, ?PlayerRankType_LevelExp),
	%SortLevelRank = lists:keysort(#recPlayerRank.value1, LevelRank),
	SortLevelRank = lists:keysort(#recPlayerRank.value1, LevelRank),
	%%把升序改为降序
	SortLevelRankDesc = lists:reverse(SortLevelRank),

	case catch lists:nth(Postion,SortLevelRankDesc) of
		{'EXIT',_}-> 0;
		T when is_record(T,recPlayerRank)-> T#recPlayerRank.value1;
		_ -> 0
	end;
getgsRankLevel(_Postion) ->
	0.