%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%% 怪物追击玩家，八方向处理
%%% @end
%%% Created : 03. 九月 2014 16:44
%%%-------------------------------------------------------------------
-module(monsterAttackDir).
-author("tiancheng").

-include("mapPrivate.hrl").

%% 判断所处范围的方向
-define(GetDir(Left,Mid,Right,Condition,Dir1,Dir2),
	Mid >= Left andalso Mid =< Right ->
	case Condition of
		true ->
			Dir1;
		_ ->
			Dir2
	end).

%% API
-export([
	getMonsterAttackDir/4,
	delHate/2
]).

%% 获取怪物追击玩家的位置，形成包围圈
-spec getMonsterAttackDir(MonsterCode, MonsterX, MonsterY, PlayerCode) -> uint() when
	MonsterCode::uint(),MonsterX::float(),MonsterY::float(),PlayerCode::uint().
getMonsterAttackDir(MonsterCode, MonsterX, MonsterY, PlayerCode) ->
	Ets = mapState:getMapPlayerEts(),
	case mapView:getMapObjectExcludeChangingMap(Ets, PlayerCode) of
		[#recMapObject{moveDir = MoveDir} = Obj] when erlang:is_list(MoveDir) ->
			case getPos(Obj, MonsterCode, MonsterX, MonsterY) of
				Dir when Dir > 0 ->
					%% 需要设置怪物Code
					case addAttackDir(Ets, Obj, Dir, MonsterCode) of
						true ->
							%%?DEBUG_OUT("Monster:~p,[~p,~p], Player:~p,[~p,~p], Dir:~p", [MonsterCode,erlang:trunc(MonsterX),
							%%	erlang:trunc(MonsterY),PlayerCode,erlang:trunc(Obj#recMapObject.x),erlang:trunc(Obj#recMapObject.y),Dir]),
							Dir;
						_ ->
							0
					end;
				_ ->
					0
			end;
		[#recMapObject{} = Obj] ->
			%% 初始化追击列表
			case initAttackList(Ets, Obj) of
				true ->
					getMonsterAttackDir(MonsterCode, MonsterX, MonsterY, PlayerCode);
				_ ->
					0
			end;
		_ ->
			0
	end.

%% 初始化追击列表
-spec initAttackList(PlayerEts, Obj) -> boolean() when
	PlayerEts::etsTab(),Obj::#recMapObject{}.
initAttackList(PlayerEts, Obj) ->
	L = lists:seq(1, 8),
	Fun = fun(I) ->
		#recMonsterAttackDir{dir = I, monsterCode = 0}
	end,
	AttackList = lists:map(Fun, L),
	%% NewObj = Obj#recMapObject{moveDir = AttackList},
	myEts:updateEts(PlayerEts, Obj#recMapObject.code, {#recMapObject.moveDir, AttackList}).

%% 添加追击方向
-spec addAttackDir(PlayerEts, Obj, Dir, MonsterCode) -> boolean() when
	PlayerEts::etsTab(),Obj::#recMapObject{},Dir::uint(),MonsterCode::uint().
addAttackDir(PlayerEts, Obj, Dir, MonsterCode) ->
	AttackList = lists:keyreplace(Dir, #recMonsterAttackDir.dir, Obj#recMapObject.moveDir,
		#recMonsterAttackDir{dir = Dir, monsterCode = MonsterCode}),
	myEts:updateEts(PlayerEts, Obj#recMapObject.code, {#recMapObject.moveDir, AttackList}).

-spec delHate(PlayerCode, MonsterCode) -> ok when
	PlayerCode::uint(),MonsterCode::uint().
delHate(PlayerCode, MonsterCode) ->
	delAttackDir(PlayerCode, MonsterCode),
	ok.

%% 移除追击方向
-spec delAttackDir(PlayerCode, MonsterCode) -> ok when
	PlayerCode::uint(),MonsterCode::uint().
delAttackDir(PlayerCode, MonsterCode) ->
	Ets = mapState:getMapPlayerEts(),
	case ets:lookup(Ets, PlayerCode) of
		[#recMapObject{moveDir = MoveDir} = Obj] when erlang:is_list(MoveDir) ->
			case lists:keyfind(MonsterCode, #recMonsterAttackDir.monsterCode, MoveDir) of
				#recMonsterAttackDir{dir = Dir} ->
					NL = lists:keyreplace(MonsterCode, #recMonsterAttackDir.monsterCode, MoveDir,
						#recMonsterAttackDir{dir = Dir, monsterCode = 0}),
					%% NObj = Obj#recMapObject{moveDir = NL},
					myEts:updateEts(Ets, Obj#recMapObject.code, {#recMapObject.moveDir, NL}),
					ok;
				_ ->
					skip
			end,
			ok;
		_ ->
			skip
	end,
	ok.

-spec getPos(#recMapObject{}, MonsterCode, MonsterX, MonsterY) -> uint() when
	MonsterCode::uint(),MonsterX::float(),MonsterY::float().
getPos(#recMapObject{x = X, y = Y, moveDir = MoveDir}, MonsterCode, MonsterX, MonsterY) ->
	case lists:keyfind(MonsterCode, #recMonsterAttackDir.monsterCode, MoveDir) of
		#recMonsterAttackDir{dir = Dir} ->
			Dir;
		_ ->
			case lists:keyfind(0, #recMonsterAttackDir.monsterCode, MoveDir) of
				#recMonsterAttackDir{} ->
					%% 选择一个最优目标方向
					case getOptimalDir(MonsterX, MonsterY, X, Y) of
						0 ->
							0;
						D ->
							%% 检查是否被占用，如果是，则获取次优方向
							getSecondDir(MoveDir, D, 0, 0)
					end;
				_ ->
					0
			end
	end.

%% 获取次优方向，这里不再判断往哪边更靠近了
-spec getSecondDir(DirList, D, Diff, Times) -> uint() when
	DirList::list(),D::uint(),Diff::int(),Times::uint().
getSecondDir(DirList, D, Diff, Times) ->
	case Times > 4 of
		false ->
			Dir = D + Diff,
			NDir = if
				       Dir < 1 ->
					       Dir + 8;
				       Dir > 8 ->
					       Dir - 8;
				       true ->
					       Dir
			       end,

			case lists:keyfind(NDir, #recMonsterAttackDir.dir, DirList) of
				#recMonsterAttackDir{monsterCode = Code} when Code =< 0 ->
					NDir;
				_ ->
					case Diff >= 0 of
						true ->
							getSecondDir(DirList, D, (Times + 1) * -1, Times + 1);
						_ ->
							getSecondDir(DirList, D, Times, Times)
					end
			end;
		_ ->
			0
	end.

%% 获取最佳方向
-spec getOptimalDir(MX, MY, PX, PY) -> uint() when
	MX::float(),MY::float(),PX::float(),PY::float().
getOptimalDir(MX, MY, PX, PY) ->
	DX = MX - PX,
	DY = MY - PY,
	case DX == 0 of
		true ->
			case DY >= 0 of
				true ->
					3;      % 北
				_ ->
					7       % 南
			end;
		_ ->
			DC = DY / DX,
			TAN225 = 0.414213,  % tan(22.5)
			TAN675 = 2.414213,  % tan(67.5)
			if
				?GetDir(TAN225 * -1, DC, TAN225, DX > 0, 1, 5); % 东，西
				?GetDir(TAN225, DC, TAN675, DX > 0 orelse DY > 0, 2, 6);    % 东北，西南
				DC >= TAN675 orelse DC =< TAN675 * -1 ->
					case DY > 0 of
						true ->
							3;  % 北
						_ ->
							7   % 南
					end;
				?GetDir(TAN675 * -1, DC, TAN225 * -1, DX < 0 orelse DY > 0, 4, 8);  % 西北，东南
				true ->
					?ERROR_OUT("getOptimalDir:~p,~p,~p,~p,~p",[?LINE,MX,MY,PX,PY]),
					0
			end
	end.