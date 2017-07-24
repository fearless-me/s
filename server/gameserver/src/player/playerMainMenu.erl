%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 根据cfg_mainMenu查询功能是否开启
%%% @end
%%% Created : 30. 八月 2017 10:51
%%%-------------------------------------------------------------------
-module(playerMainMenu).
-author(tiancheng).

-include("gsInc.hrl").

%% API
-export([
	isOpen/1,
	onFuncIsOpenByMainMenu/3
]).

%% 根据cfg_mainMenu查询功能是否开启
-spec isOpen(MainMenuID::uint()) -> boolean().
isOpen(MainMenuID) when MainMenuID >= ?ModeType_Start andalso MainMenuID =< ?ModeType_End ->
	case getCfg:getCfgPStack(cfg_mainMenu, MainMenuID) of
		#mainMenuCfg{type = Type, parameters = Value} ->
			isOpenByMainMenu(Type, Value);
		_ ->
			false
	end;
isOpen(MainMenuID) ->
	?ERROR_OUT("isOpen ~p,~p", [playerState:getRoleID(), MainMenuID]),
	false.

%% 根据cfg_mainMenu.type，回调下列事件，可在此判断功能是否需要初始化
%% 1.角色升级
%% 2.角色接受任务
%% 3.角色完成任务
-spec onFuncIsOpenByMainMenu(Type::uint(), Value::term(), ValueOld::term()) -> no_return().
onFuncIsOpenByMainMenu(?MainMenuType_Level, _Level, _LevelOld) ->	%% LevelOld表示升级前等级，这个通常都是Level-1
	ok;
onFuncIsOpenByMainMenu(?MainMenuType_TaskIDA, _TaskID, true) ->	%% 领取该任务前已经完成过该任务
	ok;
onFuncIsOpenByMainMenu(?MainMenuType_TaskIDA, _TaskID, false) ->	%% 领取该任务前没有完成过该任务（第一次领取 fixme 此处注意配置的任务是不可放弃的，例如主线任务逻辑上领取后不可放弃，而每日任务则可能被放弃
	ok;
onFuncIsOpenByMainMenu(?MainMenuType_TaskIDS, _TaskID, true) ->	%% 完成该任务前没有完成过该任务
	ok;
onFuncIsOpenByMainMenu(?MainMenuType_TaskIDS, _TaskID, false) ->	%% 完成该任务前没有完成过该任务（第一次完成
	ok;
onFuncIsOpenByMainMenu(InvalidType, Value, ValueOld) ->
	?ERROR_OUT("funcIsOpenByMainMenu InvalidType:~w Value:~w ValueOld:~w~n~p", [InvalidType, Value, ValueOld, misc:getStackTrace()]),
	ok.


-spec isOpenByMainMenu(Type::uint(), Value::term()) -> boolean().
isOpenByMainMenu(?MainMenuType_Level, Level) ->
	playerState:getLevel() >= Level;
isOpenByMainMenu(?MainMenuType_TaskIDA, TaskID) ->
	playerTask:isAcceptedTaskByID(TaskID);
isOpenByMainMenu(?MainMenuType_TaskIDS, TaskID) ->
	playerTask:isSubmittedTaskByID(TaskID);
isOpenByMainMenu(InvalidType, Value) ->
	?ERROR_OUT("isOpenByMainMenu ~p InvalidType:~w Value:~w~n~p",
		[playerState:getRoleID(), InvalidType, Value, misc:getStackTrace()]),
	false.