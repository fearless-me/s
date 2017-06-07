%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, 好玩一二三科技
%%% @doc
%%%
%%% @end
%%% Created : 09. 七月 2014 14:39
%%%-------------------------------------------------------------------
-module(libDB).
-author("ZhongYuanWei").

-include("dbPrivate.hrl").

%% API
-export([
	initPrepare/0,
	sendLoadOverMsgToPlayer/2,
	logExecResult/3,
	logExecResultEx/4,
	logResult/4,
	showMysqlInnoDBStatus/0
]).

%%初始化存储过程的Prepare
-spec initPrepare() -> ok.
initPrepare() ->
	dbGSLoad:initGSLoadPrepare(),
	dbGSSave:initGSSavePrepare(),
	dbCSLoad:initCSLoadPrepare(),
	dbCSSave:initCSSavePrepare(),
	dbLSLoad:initLSLoadPrepare(),
	dbLSSave:initLSSavePrepare(),
    dbGSDataLoad:initGSLoadPrepare(),
    dbGSDataSave:initGSSavePrepare(),
	ok.

%%发送读取结束标记
-spec sendLoadOverMsgToPlayer(RoleID,PidFrom) -> ok when
	RoleID::uint(),PidFrom::pid().
sendLoadOverMsgToPlayer(RoleID,PidFrom) ->
	psMgr:sendMsg2PS(PidFrom,loadRoleAck,[{over,RoleID}]),
	?LOG_OUT("sendLoadOverMsgToPlayer:~p",[RoleID]),
	ok.

%%大家没事不要用这个函数了
%%记录执行SQL语句的结果，如果结果成功返回true，否则返回false
-spec logExecResult(StatementAtom,RoleID,Ret) -> boolean() when
	StatementAtom::atom(),RoleID::uint(),Ret::term().
logExecResult(StatementAtom,RoleID,#ok_packet{affected_rows = 0}) ->
	?DEBUG_OUT("Role[~p] exec[~p] affected_rows[0]",[RoleID,StatementAtom]),
	true;
logExecResult(_StatementAtom,_RoleID,#ok_packet{}) ->
%%	?LOG_OUT("Role[~p] exec[~p] ok[~p]",[RoleID,StatementAtom,AffectedRowNum]),
	true;
logExecResult(StatementAtom,RoleID,[_H|T]) ->
	logExecResult(StatementAtom,RoleID,T);
logExecResult(StatementAtom,RoleID,Ret) ->
	?ERROR_OUT("Role[~p] exec[~p] failed, Result[~p]",[RoleID,StatementAtom,Ret]),
	false.

-spec logResult(StatementAtom,Ret,ArgDesc,Arg) -> boolean() when
	StatementAtom::atom(),ArgDesc::string(),Arg::term(),Ret::term().
logResult(StatementAtom,#ok_packet{affected_rows = 0},ArgDesc,Arg) ->
	?DEBUG_OUT("exec[~p] affected_rows[0],~ts[~p]",[StatementAtom,ArgDesc,Arg]),
	true;
logResult(_StatementAtom,#ok_packet{},_ArgDesc,_Arg) ->
%%	?LOG_OUT("exec[~p] ok[~p],~ts[~p]",[StatementAtom,AffectedRowNum,ArgDesc,Arg]),
	true;
logResult(_StatementAtom,[],_ArgDesc,_Arg) ->
	true;
logResult(StatementAtom,[_H|T],ArgDesc,Arg) ->
	logResult(StatementAtom,T,ArgDesc,Arg);
logResult(StatementAtom,Ret,ArgDesc,Arg) ->
	?ERROR_OUT("exec[~p] failed, Result[~p],~ts[~p]",[StatementAtom,Ret,ArgDesc,Arg]),
	false.

%%显示InnoDB的状态，以检查死锁情况
showMysqlInnoDBStatus() ->
	R = emysql:execute(?GAMEDB_CONNECT_POOL,"SHOW INNODB STATUS"),
	case R of
		#result_packet{rows = [[_Type,_Name,Status]]} ->
			Strings = string:tokens(erlang:binary_to_list(Status), "\n"),
			?ERROR_OUT("SHOW INNODB STATUS:~n~p",[Strings]);
		_ ->
			skip
	end,
	ok.


%% 检查SQL语句的结果，如果结果成功返回true，否则返回false并打印错误日志
%% 与logExecResult相比，去除了成功时的日志，并支持自定义日志传参
-spec logExecResultEx(StatementAtom,Ret,F,A) -> boolean() when
	StatementAtom::atom(),Ret::term(),F::string(),A::list().
logExecResultEx(_StatementAtom,#ok_packet{},_F,_A) ->
	true;
logExecResultEx(StatementAtom,[_H|T],F,A) ->
	logExecResultEx(StatementAtom,T,F,A);
logExecResultEx(StatementAtom,Ret,F,A) ->
	ErrorInforExec = io_lib:format(" exec[~p] faild, result[~p]", [StatementAtom, Ret]),
	ErrorInforDIY = io_lib:format(F, A),
	?ERROR_OUT(ErrorInforDIY ++ ErrorInforExec),
	false.
