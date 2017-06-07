%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <雨墨>
%%% @doc
%%% playerState太大了，再写一个
%%% @end
%%% Created : 23. 九月 2016 10:34
%%%-------------------------------------------------------------------
-module(playerState2).
-author("tiancheng").

-include("playerPrivate.hrl").

%% API
-compile(export_all).

getPlayerDataElement(Index) ->
    case getPlayerData() of
        #rec_playerdata{} = Data ->
            erlang:element(Index, Data);
        undefined ->
            undefined
    end.

setPlayerDataElement(Index, Value) ->
    case getPlayerData() of
        #rec_playerdata{} = Data ->
            NewData = erlang:setelement(Index, Data, Value),
            setPlayerData(NewData);
        undefined ->
            ?ERROR_OUT("set element:~p,~p,~p", [playerState:getRoleID(), Index, Value]),
            undefined
    end.

%% 设置获取玩家数据库 ets:ets_rec_playerdata  rec:rec_playerdata
-spec setPlayerData(#rec_playerdata{}) -> undefined | #rec_playerdata{}.
setPlayerData(#rec_playerdata{} = Data) ->
    put(rec_playerdata, Data).

-spec getPlayerData() -> undefined | #rec_playerdata{}.
getPlayerData() ->
    get(rec_playerdata).

%% 能否增加同步人数
-spec canAddLookPlayer() -> boolean().
canAddLookPlayer() ->
	canAddLookPlayer(playerState:getPlayerCode()).
-spec canAddLookPlayer(Code::uint64()) -> boolean().
canAddLookPlayer(Code) ->
	Number = variant:getPlayerVariant(playerState:getRoleID(), ?Setting_ClientVar_ScreenPlayerNumber),	% 这个值为客户端自行设置
	LimitNumber = erlang:max(Number, 1),
	playerScreen:getLookPlayerNumber(Code) < LimitNumber.

canFreshScreen() ->
	NowTime = time2:getTimestampSec(),
	LastTime = getFreshScreenTime(),
	case NowTime - LastTime > 10 of
		true ->
			setFreshScreenTime(NowTime),
			true;
		_ -> false
	end.
setFreshScreenTime(Time) ->
	put('FreshScreenTime', Time).
getFreshScreenTime() ->
	case get('FreshScreenTime') of
		undefined -> 0;
		Time -> Time
	end.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 身份证系统 begin

%% 照片上传下载任务缓存
setIdentityUporDownLoadTaskInfo(TaskInfo) ->
    put(identity_UpOrDwonLoadTaskOutTime, TaskInfo).
getIdentityUporDownLoadTaskInfo() ->
    get(identity_UpOrDwonLoadTaskOutTime).

%% 身份证系统 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 新版好友系统 end

%% 添加好友间隔时间
setFriend2CD(Key) ->
    Dict =
        case get('Friend2AddCDDict') of
            undefined ->
                dict:new();
            DictOld ->
                DictOld
        end,
    DictNew = dict:store(Key, time:getSyncUTCTimeFromDBS(), Dict),
    put('Friend2AddCDDict', DictNew).
getFriend2CD(Key, CD) ->
    TimeNow = time:getSyncUTCTimeFromDBS(),
    {TimeLast, Dict} =
        case get('Friend2AddCDDict') of
            undefined ->
                {0, dict:new()};
            DictOld ->
                case dict:find(Key, DictOld) of
                    {ok, TimeLast_} ->
                        {TimeLast_, DictOld};
                    _ ->
                        {0, DictOld}
                end
        end,
    %?DEBUG_OUT("~p", [{TimeNow, TimeLast, CD}]),
    case TimeNow - TimeLast >= CD of
        true ->
            put('Friend2AddCDDict', dict:erase(Key, Dict)),
            true;
        _ ->
            false
    end.
getFriend2CDReturnMinute(Key, CD) ->
    TimeNow = time:getSyncUTCTimeFromDBS(),
    {TimeLast, Dict} =
        case get('Friend2AddCDDict') of
            undefined ->
                {0, dict:new()};
            DictOld ->
                case dict:find(Key, DictOld) of
                    {ok, TimeLast_} ->
                        {TimeLast_, DictOld};
                    _ ->
                        {0, DictOld}
                end
        end,
    case TimeNow - TimeLast >= CD of
        true ->
            put('Friend2AddCDDict', dict:erase(Key, Dict)),
            0;
        _ ->
            Sec = CD - (TimeNow - TimeLast),
            case (Sec + 1) rem 60 > 0 of
                true ->
                    (Sec + 1) div 60 + 1;
                _ ->
                    (Sec + 1) div 60
            end
    end.

%% 最后查询的页码记录
setFriend2PageApp(Page) ->
    put('Friend2PageApp', Page).
getFriend2PageApp() ->
    case get('Friend2PageApp') of
        undefined -> 0;
        Page -> Page
    end.
setFriend2PageTemp(Page) ->
    put('Friend2PageTemp', Page).
getFriend2PageTemp() ->
    case get('Friend2PageTemp') of
        undefined -> 0;
        Page -> Page
    end.
setFriend2PageFormal(Page) ->
    put('Friend2PageFormal', Page).
getFriend2PageFormal() ->
    case get('Friend2PageFormal') of
        undefined -> 0;
        Page -> Page
    end.
setFriend2PageBlack(Page) ->
    put('Friend2PageBlack', Page).
getFriend2PageBlack() ->
    case get('Friend2PageBlack') of
        undefined -> 0;
        Page -> Page
    end.

%% 语音传输任务缓存
setFriend2VoiceCache(ListCache) ->
    put('Friend2VoiceCache', ListCache).
getFriend2VoiceCache() ->
    case get('Friend2VoiceCache') of
        undefined ->
            [];
        ListCache ->
            ListCache
    end.

%% 黑名单满时拉黑好友，缓存好友ID，等待解除好友关系成功后再执行拉黑
setFriend2WantBanFormal(ListCache) ->
    put('Friend2WantBanFormal', ListCache).
getFriend2WantBanFormal() ->
    case get('Friend2WantBanFormal') of
        undefined ->
            [];
        ListCache ->
            ListCache
    end.

%% 缓存未使用的在线角色ID以支持推荐好友功能
setFriend2OnlineListRoleID(List) ->
    put('Friend2OnlineListRoleID', List).
getFriend2OnlineListRoleID() ->
    case get('Friend2OnlineListRoleID') of
        undefined ->
            [];
        L ->
            L
    end.

%% 缓存未使用的在线角色ID以支持推荐好友功能（仅限根据距离筛选时使用）
setFriend2OnlineListRoleIDNear(List) ->
    put('Friend2OnlineListRoleIDNear', List).
getFriend2OnlineListRoleIDNear() ->
    case get('Friend2OnlineListRoleIDNear') of
        undefined ->
            [];
        L ->
            L
    end.

%% 新版好友系统 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
