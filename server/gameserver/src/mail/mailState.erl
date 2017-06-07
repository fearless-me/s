%% @author zhongyunawei
%% @doc @todo Add description to mailState.


-module(mailState).
-author(zhongyuanwei).

-include("mailPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-compile(export_all).


getNoticeMailTick(RoleID) ->
    get({'NoticeMailTick', RoleID}).

addNoticeMailTick(RoleID, {PID, TimeRef, Mail}) ->
    case getNoticeMailTick(RoleID) of
        {_, _, List} -> setNoticeMailTick(RoleID, {PID, TimeRef, [Mail|List]});
        _ -> setNoticeMailTick(RoleID, {PID, TimeRef, [Mail]})
    end,
    ok.

setNoticeMailTick(RoleID, Data) ->
    put({'NoticeMailTick', RoleID}, Data).

%% ====================================================================
%% Internal functions
%% ====================================================================


