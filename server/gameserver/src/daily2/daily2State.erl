%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%% 双角色相关的每日计数
%%% 字典模块
%%% @end
%%% Created : 20161205
%%%-------------------------------------------------------------------
-module(daily2State).
-author("meitianyang").

-include("daily2Private.hrl").

-export([
	init/1,
	queryDaily2/3,
	resetDaily2/0,
	saveDaily2/4
]).

%%% ====================================================================
%%% Tools functions
%%% ====================================================================

%%% ====================================================================
%%% API functions
%%% ====================================================================

%% 初始化数据（仅playerDataMgrOtp在启服时调用）
-spec init(List::[#rec_player_daily2{}]) -> ok.
init(List) ->
	%?DEBUG_OUT("[DebugForDaily2] init len:~p", [erlang:length(List)]),
	FunInsert =
		fun(#rec_player_daily2{roleID_A = RoleID_A} = DataCell) ->
			case ets:lookup(?EtsDaily2Data, RoleID_A) of
				[#recDaily2Data{value = DataList} = Rec] ->
					ets:insert(?EtsDaily2Data, Rec#recDaily2Data{value = [DataCell | DataList]});
				_ ->
					ets:insert(?EtsDaily2Data, #recDaily2Data{key = RoleID_A, value = [DataCell]})
			end
		end,
	lists:foreach(FunInsert, List),
	ok.

%% 查数据（任意进程可调用）
-spec queryDaily2(RoleID::uint64(), TargetRoleID::uint64(), Daily2Type::daily2TypeS()|daily2TypeC()) -> Count::uint64().
queryDaily2(RoleID, TargetRoleID, Daily2Type) ->
	%?DEBUG_OUT("[DebugForDaily2] queryDaily2 RoleID(~p) TargetRoleID(~p) Daily2Type(~p)", [RoleID, TargetRoleID, Daily2Type]),
	{RoleID_A, RoleID_B} = getKeyAB(RoleID, TargetRoleID, Daily2Type),
	#rec_player_daily2{counter = Count} =
		case ets:lookup(?EtsDaily2Data, RoleID_A) of
			[#recDaily2Data{value = DataList}] ->
				findValue(RoleID_A, RoleID_B, Daily2Type, DataList);
			_ ->
				?DefaultValueOfDaily2(RoleID_A, RoleID_B, Daily2Type)
		end,
	Count.

%% 重置每日计数（仅本进程可调用）
-spec resetDaily2() -> ok.
resetDaily2() ->
	%?DEBUG_OUT("[DebugForDaily2] resetDaily2"),
	ets:delete_all_objects(?EtsDaily2Data),
	ok.

%% 写数据（注意同一计数不要有多个进程写入，注意使用daily2Logic中的saveDaily2，避免没有写数据库的问题）
-spec saveDaily2(RoleID::uint64(), TargetRoleID::uint64(), Daily2Type::daily2TypeS()|daily2TypeC(), Count::uint64()) ->
	{DBOTP::type_dbopt(), DataCell::#rec_player_daily2{}}.
saveDaily2(RoleID, TargetRoleID, Daily2Type, Count) ->
	%?DEBUG_OUT("[DebugForDaily2] saveDaily2 RoleID(~p) TargetRoleID(~p) Daily2Type(~p) Count(~p)", [RoleID, TargetRoleID, Daily2Type, Count]),
	{RoleID_A, RoleID_B} = getKeyAB(RoleID, TargetRoleID, Daily2Type),
	%% 生成新数据备用
	DataCellNew =
		#rec_player_daily2{
			roleID_A = RoleID_A,
			roleID_B = RoleID_B,
			daily2Type = Daily2Type,
			lastUpdateTime = time:getSyncUTCTimeFromDBS(),
			counter = Count
		},
	%% 获取旧有计数，同时获取旧有数据列表、是否存在父级节点的标志用于后续备用
	{
		#rec_player_daily2{counter = CountOld},
		DataListOld,
		ParentNodeIsExists
	} =
		case ets:lookup(?EtsDaily2Data, RoleID_A) of
			[#recDaily2Data{value = DataList}] ->
				{findValue(RoleID_A, RoleID_B, Daily2Type, DataList), DataList, true};
			_ ->
				{?DefaultValueOfDaily2(RoleID_A, RoleID_B, Daily2Type), [], false}
		end,
	%% 根据新旧计数匹配决定数据的修改方式
	case Count of
		CountOld ->
			%% 计数未变化，不处理
			{?DBOPT_ERROR, {}};
		0 ->
			%% 计数重置为0，删除记录
			FunDelete =
				fun(#rec_player_daily2{
					roleID_B = RoleID_B_,
					daily2Type = Daily2Type_
				} = Rec, Result) ->
					case RoleID_B_ =:= RoleID_B andalso Daily2Type_ =:= Daily2Type of
						true ->
							Result;
						_ ->
							[Rec | Result]
					end
				end,
			DataListNewAfterDelete = lists:foldl(FunDelete, [], DataListOld),
			%% 如果得到的结果为空且存在父级节点，则直接删除父级节点，否则更新
			case DataListNewAfterDelete =:= [] andalso ParentNodeIsExists =:= true of
				true ->
					ets:delete(?EtsDaily2Data, RoleID_A);
				_ ->
					ets:update_element(?EtsDaily2Data, RoleID_A, {#recDaily2Data.value, DataListNewAfterDelete})
			end,
			{?DBOPT_DELETE, DataCellNew};
		_ ->
			case CountOld of
				0 ->
					%% 计数从0到非零，插入记录
					%% 如果不存在父级节点则插入数据，否则更新
					case ParentNodeIsExists of
						false ->
							ets:insert(?EtsDaily2Data, #recDaily2Data{key = RoleID_A, value = [DataCellNew]});
						_ ->
							ets:update_element(?EtsDaily2Data, RoleID_A, {#recDaily2Data.value, [DataCellNew | DataListOld]})
					end,
					{?DBOPT_INSERT, DataCellNew};
				_ ->
					%% 计数从非0到非零，更新记录
					FunUpdate =
						fun(#rec_player_daily2{
							roleID_B = RoleID_B_,
							daily2Type = Daily2Type_
						} = Rec, Result) ->
							case RoleID_B_ =:= RoleID_B andalso Daily2Type_ =:= Daily2Type of
								true ->
									[DataCellNew | Result];
								_ ->
									[Rec | Result]
							end
						end,
					DataListNewAfterUpdate = lists:foldl(FunUpdate, [], DataListOld),
					ets:update_element(?EtsDaily2Data, RoleID_A, {#recDaily2Data.value, DataListNewAfterUpdate}),
					{?DBOPT_UPDATE, DataCellNew}
			end
	end.

%%% ====================================================================
%%% Internal functions
%%% ====================================================================

%% 判断是否为共有计数类型
-spec isDaily2TypeC(Daily2Type::daily2TypeS()|daily2TypeC()) -> boolean().
isDaily2TypeC(Daily2Type) ->
	Daily2Type >= ?Daily2Type_C_Min.

%% 获取正确的第一、第二键值
-spec getKeyAB(RoleID::uint64(), TargetRoleID::uint64(), Daily2Type::daily2TypeS()|daily2TypeC()) ->
	{RoleID_A::uint64(), RoleID_B::uint64()}.
getKeyAB(RoleID, TargetRoleID, Daily2Type) ->
	case isDaily2TypeC(Daily2Type) of
		true ->
			case RoleID < TargetRoleID of
				true ->
					{RoleID, TargetRoleID};
				_ ->
					{TargetRoleID, RoleID}
			end;
		_ ->
			{RoleID, TargetRoleID}
	end.

%% 在匹配第一键值的数据列表中查找匹配第二、第三键值的数据
-spec findValue(
		RoleID_A::uint64(),
		RoleID_B::uint64(),
		Daily2Type::daily2TypeS()|daily2TypeC(),
		DataList::[#rec_player_daily2{}, ...]
) -> #rec_player_daily2{}.
findValue(RoleID_A, RoleID_B, Daily2Type, DataList) ->
	FunFind =
		fun(#rec_player_daily2{
			roleID_B = RoleID_B_,
			daily2Type = Daily2Type_
		} = Rec, {_, {RoleID_BIn, Daily2TypeIn, ResultIn}}
		) ->
			case RoleID_B_ =:= RoleID_BIn andalso Daily2Type_ =:= Daily2TypeIn of
				true ->
					{true, {RoleID_BIn, Daily2TypeIn, Rec}};
				_ ->
					{false, {RoleID_BIn, Daily2TypeIn, ResultIn}}
			end
		end,
	case misc:foldlEx(FunFind, {false, {RoleID_B, Daily2Type, ?DefaultValueOfDaily2(RoleID_A, RoleID_B, Daily2Type)}}, DataList) of
		{true, {_, _, Rec}} ->
			Rec;
		_ ->
			?DefaultValueOfDaily2(RoleID_A, RoleID_B, Daily2Type)
	end.
