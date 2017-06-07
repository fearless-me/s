%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 一月 2016 上午 11:24
%%%-------------------------------------------------------------------
-module(playerHolidayTask).
-author("Administrator").
-include("playerPrivate.hrl").
-include("../config/cfg_task_new.hrl").
%% API
-export([acceptHolidayTask/0,
    initHolidayTask/1,
    submitHolidayTask/1,
    resetPlayerHolidayTask/0,
    onFirstLoginEachLevel/1,
    isHolidayTask/1]).

%Setting_GlobalBitVarReadOnly_NewYearAct
-define(NewYearHolidayID,1).
-define(MinHolidayPlayerLevel,20).
%Setting_GlobalBitVarReadOnly_NewYearAct
initHolidayTask(Task) when is_record(Task,rec_holiday_task)->
    ?DEBUG_OUT("initHoliday Task opend ~p",[isHolidayOpened()]),
    %检查节日任务是否有效
    case isHolidayTime() of
        true-> %getLocalNowSec1970
            NowTime = time:getSyncTime1970FromDBS(), % ?SECS_FROM_0_TO_1970
            case core:timeIsOnDay(Task#rec_holiday_task.acceptedTime , NowTime) of
                true->
                    ?WARN_OUT("initHolidayTask not reset,[~p,~p]",[Task#rec_holiday_task.acceptedTime,NowTime]),
                    setHolidayTask(Task),
                    checkAccpetTask(Task#rec_holiday_task.acceptedTaskId),
                    ok;
                _ ->
                    ?WARN_OUT("initHolidayTask reset"),
                    playerDaily:zeroDailyCount(?DailyType_HolidayTask,?NewYearHolidayID),
                    setHolidayTask(Task#rec_holiday_task{acceptedTime = NowTime }),
                    checkAccpetTask(Task#rec_holiday_task.acceptedTaskId)
            end;
        _ ->
            ?WARN_OUT("now is not holiday time."),
            case playerDaily:getDailyCounter(?DailyType_HolidayTask,?NewYearHolidayID) > 0 of
                true->skip;
                _ -> playerDaily:incDailyCounter(?DailyType_HolidayTask,?NewYearHolidayID)
            end,
            skip
    end;
initHolidayTask(_Task)->
    ?DEBUG_OUT("initHoliday Task opend ~p",[isHolidayOpened()]),
    setHolidayTask(#rec_holiday_task{
            playerID = playerState:getRoleID(),
            acceptedTaskId = 0,
            acceptedTime = 0,
            completedTask = []}),
    playerDaily:incDailyCounter(?DailyType_HolidayTask,?NewYearHolidayID),
    case isHolidayTime() of
        true->playerDaily:zeroDailyCount(?DailyType_HolidayTask,?NewYearHolidayID);
        _ -> skip
    end,
    ok.

resetPlayerHolidayTask()->
    case isHolidayTime() of
        true->
            Task = playerState:getPlayerHolidayTask(),
            playerDaily:zeroDailyCount(?DailyType_HolidayTask,?NewYearHolidayID),
            ?DEBUG_OUT("resetPlayerHolidayTask,accept taskid [~p]",[Task#rec_holiday_task.acceptedTaskId]),
            setHolidayTask(Task#rec_holiday_task{acceptedTime = time:getSyncTime1970FromDBS() });
        _ -> skip
    end,
    ok.

acceptHolidayTask()->
    PlayerLevel = playerState:getLevel(),
    case canAcceptTask(PlayerLevel) of
        true ->
            %%随机生成TaskID后接取任务
            case getCfg:getCfgByKey(cfg_globalsetup,newyeargameID) of
                #globalsetupCfg{ setpara = TaskList} ->
                    HolidayTask = playerState:getPlayerHolidayTask(),
                    N = random:uniform(length(TaskList)),
                    AcceptID = lists:nth(N, TaskList),
                    case playerTask:acceptTask(AcceptID, 0) of
                        true->
                            setHolidayTask(HolidayTask#rec_holiday_task{ acceptedTaskId = AcceptID,
                                acceptedTime = time:getSyncTime1970FromDBS() }),
                            playerMsg:sendNetMsg(#pk_GS2U_AcceptHolidayTaskSucc{ result = 0 } ),
                            ?WARN_OUT("holidaytask new task [~p]",[AcceptID]),
                            ok;
                        false->
                            skip
                    end,
                    ok;
                _ -> skip
            end;
        false-> skip;
        ErrorCode ->
            playerMsg:sendErrorCodeMsg(ErrorCode)
    end,
    ok.

submitHolidayTask(TaskID)->
    case getCfg:getCfgByKey(cfg_task_new,TaskID) of
        #task_newCfg{ tasktype = TaskType }->
            case TaskType =:= 2 of
                true->
                    Tasks = playerState:getPlayerHolidayTask(),
                    setHolidayTask(Tasks#rec_holiday_task{ acceptedTaskId = 0,
                        completedTask = [TaskID | Tasks#rec_holiday_task.completedTask]}),

                    acceptAfterTask(TaskID);
                _ ->skip
            end;
        _ -> skip
    end,
    ok.


onFirstLoginEachLevel(Level)->
    case Level =:= ?MinHolidayPlayerLevel of
        true->
            playerDaily:incDailyCounter(?DailyType_HolidayTask,?NewYearHolidayID),
            setHolidayTask(#rec_holiday_task{
                playerID = playerState:getRoleID(),
                acceptedTaskId = 0,
                acceptedTime = 0,
                completedTask = []}),
            ?DEBUG_OUT("player level up."),
            resetPlayerHolidayTask();
        _ -> skip
    end,
    ok.

isHolidayOpened()->
    case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_NewYearAct) of
        true->true;
        _ ->false
    end.

isHolidayTask(TaskID)->
    case getCfg:getCfgByKey(cfg_task_new,TaskID) of
        #task_newCfg{ tasktype = TaskType }->
            case TaskType =:= 2 of
                true->true;
                false ->false
            end;
        _ ->false
    end.

%%----------------------------------------------------------------------

checkAccpetTask(TaskID)->
    HolidayTask = playerState:getPlayerHolidayTask(),
    case isHolidayTask(TaskID) of
        true->
            AcceptedTask = playerState:getAcceptedTask(),
            case lists:keyfind(TaskID,#rec_task.taskID, AcceptedTask) of
                #rec_task{}->
                    skip;
                false ->
                    setHolidayTask(HolidayTask#rec_holiday_task{ acceptedTaskId = 0 })
            end;
        _ ->
            setHolidayTask(HolidayTask#rec_holiday_task{ acceptedTaskId = 0 })
    end.

isHolidayTime()->
    case getCfg:getCfgByKey(cfg_globalsetup,newyeargametime) of
        #globalsetupCfg{ setpara = [StartTime,EndTime]}->
            Start = time:convertDateTime1970ToSec(StartTime),
            End = time:convertDateTime1970ToSec(EndTime),
            NowTime = time:getSyncTime1970FromDBS(),% time:getUTCNowSec() + ?SECS_FROM_0_TO_1970,
            ?DEBUG_OUT("isHolidayTime s,n,E ~p,~p,~p",[Start,NowTime,End]),
            Start =< NowTime andalso NowTime =< End;
        _ -> false
    end.


canAcceptTask(PlayerLevel)->

    case PlayerLevel >= 20 of
        true->
            case isHolidayTime() of
                true->
                    Holiday = playerState:getPlayerHolidayTask(),
                    case isHolidayTask(Holiday#rec_holiday_task.acceptedTaskId) of
                        true-> ?ErrorCode_TaskFailed_IsExit;
                        false -> true
                    end;
                false->?ErrorCode_CnHolidayActiveNotBeenTime
            end;
        _ -> ?ErrorCode_TaskFailed_Level
    end.

acceptAfterTask(TaskID)->
    HolidayTask = playerState:getPlayerHolidayTask(),
    case getCfg:getCfgByKey(cfg_task_new,TaskID) of
        #task_newCfg{ task_after = AfterTaskID }->
            case AfterTaskID of
                0 ->
                    playerDaily:incDailyCounter(?DailyType_HolidayTask,?NewYearHolidayID ),
                    setHolidayTask(HolidayTask#rec_holiday_task{ acceptedTaskId = 0}),
                    ?LOG_OUT("Player [~p],completed Holiday task[~p]",[playerState:getRoleID(),TaskID]),
                    ok;
                _ ->
                    playerTask:acceptTask(AfterTaskID, 0),
                    ?WARN_OUT("holidaytask new task [~p]",[AfterTaskID]),
                    Task = HolidayTask#rec_holiday_task{ acceptedTaskId = AfterTaskID,
                        acceptedTime = time:getSyncTime1970FromDBS() },
                    setHolidayTask(Task)
            end;
        _ -> skip
    end,
    ok.

-spec updateToMemCache(TableName,Key,Record,NewTableName,UpdateTableName) -> boolean() | ok | error when
    TableName::atom(),Key::term(),Record::tuple(),NewTableName::atom(),UpdateTableName::atom().
updateToMemCache(TableName,Key,Record,NewTableName,UpdateTableName) ->
    F = fun() ->
        case mnesia:read(TableName,Key,write) of
            [] ->
                %%需要新插入
                mnesia:write(NewTableName,Record,write),
                %%最后写入缓存数据库
                mnesia:write(Record),
                true;
            _ ->
                case mnesia:read(NewTableName,Key,write) of
                    [_H|_T] ->
                        %%还没有插入到数据库，可以直接更新此数据
                        mnesia:write(NewTableName,Record,write);
                    [] ->
                        %%需要更新
                        mnesia:write(UpdateTableName,Record,write)
                end,
                %%最后写入缓存数据库
                mnesia:write(Record),
                %%由于缓存中已经存在，所以这里返回false表示是更新
                false
        end
        end,
    case mnesia:transaction(F) of
        {atomic, Val} ->
            Val;
        Error ->
            ?ERROR_OUT("Param:Record= [~p].Error:~p,stack=~p",[Record,Error,misc:getStackTrace()]),
            error
    end,
    ok.

-spec setHolidayTask(Task::#rec_holiday_task{})->ok.
setHolidayTask(Task)->
    playerState:setPlayerHolidayTask(Task),
    updateToMemCache(rec_holiday_task,playerState:getRoleID(),Task,
        new_rec_holiday_task,update_rec_holiday_task),
    ?DEBUG_OUT("setHolidayTask [~p]",[Task]),
    ok.