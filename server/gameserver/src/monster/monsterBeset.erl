%%
%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 处理怪物包围玩家攻击的逻辑
%%% @end
%%% Created : 28. 六月 2014 14:48
%%%-------------------------------------------------------------------
-module(monsterBeset).
-author("tiancheng").

-include("monsterPrivate.hrl").

%% 方向定义{sin(Angle), cos(Angle)}
-define(GetAngleByDir(Dir), case Dir of
								1 ->
									{0, 1};      % 东0
								2 ->
									{0.707106, 0.707106};     % 东北45
								3 ->
									{1, 0};     % 北90
								4 ->
									{0.707106, -0.707106};    % 西北135
								5 ->
									{0, -1};    % 西180
								6 ->
									{-0.707106, -0.707106};    % 西南225
								7 ->
									{-1, 0};    % 南270
								8 ->
									{-0.707106, 0.707106}     % 东南315
                            end).


%% 远程施法技能保护
-define(LongRangeProtect, 3).

-define(OverTime, 5000).

%% API
-export([
    getBesetPos/7
]).


%% 获取构成包围玩家的坐标，暂时只处理玩家被包围的情况
-spec getBesetPos(Code, AttackRange, MX, MY, TargetCode, TargetX, TargetY) -> {NX, NY} when
    Code::uint(),AttackRange::uint(),MX::number(),MY::number(),
    TargetCode::uint(), TargetX::number(), TargetY::number(),
    NX::number(), NY::number().
getBesetPos(Code, AttackRange, MX, MY, TargetCode, TargetX, TargetY) ->
    Type1 = codeMgr:getObjectTypeByCode(Code),
    Type2 = codeMgr:getObjectTypeByCode(TargetCode),

	{TX, TY} = if
		           AttackRange >= ?LongRangeProtect orelse AttackRange =< 0 ->
			           %% 远程或者攻击距离为0的怪不需要调整位置
			           {TargetX, TargetY};
		           Type1 =:= ?ObjTypeMonster andalso Type2 =:= ?ObjTypePlayer ->
			           getBesetPosPrivate(Code, AttackRange, MX, MY, TargetCode, TargetX, TargetY);
		           true ->
			           {TargetX, TargetY}
	           end,

	%% 根据要攻击的目标点计算怪物本身实际应该移动到的点
	%getMovePos(MX, MY, AttackRange, TX, TY).
	{TX, TY}.

%% 根据要攻击的目标点计算怪物本身实际应该移动到的点
%% getMovePos(MX, MY, AttackRange, AX, AY) ->
%% 	%% 计算怪物中心到目标的距离
%% 	DX = MX - AX,
%% 	DY = MY - AY,
%% 	Dist = math:sqrt(DX * DX + DY * DY),
%% 	case Dist /= 0 of
%% 		true ->
%% 			ADY = DY * AttackRange / Dist,
%% 			ADX = DX * AttackRange / Dist,
%% 			{AX + ADX, AY + ADY};
%% 		_ ->
%% 			{AX, AY}
%% 	end.

getBesetPosPrivate(Code, AttackRange, MX, MY, TargetCode, TargetX, TargetY)
	when erlang:is_integer(TargetCode) ->
    %% 按八方向处理，第一个怪优先选择离玩家最近的追击点
	PlayerEts = monsterState:getMapPlayerEts(Code),
	case mapView:getMapObjectExcludeChangingMap(PlayerEts, TargetCode) of
		[#recMapObject{moveDir = MoveDir}] ->
			getPos(MoveDir, Code, AttackRange, MX, MY, TargetCode, TargetX, TargetY);
		_ ->
			{TargetX, TargetY}
	end.

getPos([#recMonsterAttackDir{}|_] = MoveDir, MonsterCode, AttackRange, MX, MY, PlayerCode, TargetX, TargetY)
	when erlang:is_list(MoveDir) ->
	%% 优先查找该怪物是否在列表
	case lists:keyfind(MonsterCode, #recMonsterAttackDir.monsterCode, MoveDir) of
		#recMonsterAttackDir{dir = Dir} ->
			%?DEBUG_OUT("======>:~p", [MonsterCode]),
			getTargetPos(Dir, AttackRange, TargetX, TargetY);
		_ ->
			%% 判断是否还有空位
			case lists:keyfind(0, #recMonsterAttackDir.monsterCode, MoveDir) of
				#recMonsterAttackDir{} ->
					getPos(0, MonsterCode, AttackRange, MX, MY, PlayerCode, TargetX, TargetY);
				_ ->
					{TargetX, TargetY}
			end
	end;
getPos(_MoveDir, MonsterCode, AttackRange, MX, MY, PlayerCode, TargetX, TargetY) ->
	%% 直接去map进程设置追击点
	case getDirFromMapPlayer(MonsterCode, MX, MY, PlayerCode) of
		false ->
			{TargetX, TargetY};
		Dir ->
			getTargetPos(Dir, AttackRange, TargetX, TargetY)
	end.

%% 根据方向计算实际目标点
getTargetPos(Dir, AttackRange, TargetX, TargetY) ->
	getNewPos(Dir, AttackRange, TargetX, TargetY).

%% 获取追击方向
getDirFromMapPlayer(MonsterCode, MX, MY, PlayerCode) ->
	DirRet = monsterAttackDir:getMonsterAttackDir(MonsterCode, MX, MY, PlayerCode),
	case DirRet >= 1 andalso DirRet =< 8 of
		true ->
			DirRet;
		_ ->
			?DEBUG_OUT("~p ~p [~p, ~p] getDirFromMapPlayer falied", [?MODULE, self(), MonsterCode, PlayerCode]),
			false
	end.

%% 取新坐标
getNewPos(Dir, AttackRange, TX, TY) ->
	{Sin, Cos} = ?GetAngleByDir(Dir),
    X_Amend = AttackRange * Cos,
    Y_Amend = AttackRange * Sin,

    {TX + X_Amend, TY + Y_Amend}.
