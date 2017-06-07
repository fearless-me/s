%% @author zhengzhichun
%% @doc @todo Add description to gameNotice.


-module(gameNotice).
-include("lsInc.hrl").
-include_lib("stdlib/include/ms_transform.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([
		 mysqlRow2Ets/1,
		 getValidGameNotice/0,
		 clearGameNotice/0
		]).

-spec mysqlRow2Ets(MysqlNoticeList) ->ok when
		  MysqlNoticeList::[#gameNotice{},...] |[].
mysqlRow2Ets(MysqlNoticeList) ->
	
	ets:insert(?GameNoticeEts, MysqlNoticeList),
	ok.

-spec getValidGameNotice() -> [] | [#gameNotice{},...].
getValidGameNotice() ->
	Now = time:getUTCNowSec(),
	MatchSpec = ets:fun2ms(
				  fun(Row) when (Row#gameNotice.beginTime + Row#gameNotice.duration >= Now) ->
						  Row
				  end
						  ),
	ValidNoticeList= ets:select(?GameNoticeEts, MatchSpec),
	ValidNoticeList.

clearGameNotice() ->
	ets:delete_all_objects(?GameNoticeEts).

%% ====================================================================
%% Internal functions
%% ====================================================================


