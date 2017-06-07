%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%% 活动模块特殊玩法
%%%     之 夺秒消除
%%% 约会地下城（活动）
%%% @end
%%% Created : 20161202
%%%-------------------------------------------------------------------
-module(acDateActivity_Link).
-author("meitianyang").

-include("acDatePrivate.hrl").

-export_type([
  type_as/0,
  type_dtwlb/0,
  type_sr/0,
  type_btwlg/0
]).

%% 玩法内定义
%%%-------------------------------------------------------------------

%% 玩法状态定义
-define(ActiveState_Begin,              0).
-define(ActiveState_UnInit,             0).   %% 未收玩法逻辑影响的刚创建的状态
-define(ActiveState_BeforeFirstEnter,   1).   %% 等待玩家首次进入，等久了就走异常结算把自己结果了
-define(ActiveState_AfterFirstEnter,    2).   %% 玩家首次进入后的等待，主要是有个友好的倒计时准备时间
-define(ActiveState_Link,               3).   %% 主玩法消除时间
-define(ActiveState_Settle,             4).   %% 主玩法结束后的结算时间，仅用于结算框的展示
-define(ActiveState_End,                4).
-type type_as() :: ?ActiveState_Begin .. ?ActiveState_End.



%% 玩法数据存储
-define(DefaultListMatrixCode, [
  0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0
]).
-define(ListMatrixPos, [
  1,  2,  3,  4,  5,  6,
  7,  8,  9,  10, 11, 12,
  13, 14, 15, 16, 17, 18,
  19, 20, 21, 22, 23, 24,
  25, 26, 27, 28, 29, 30,
  31, 32, 33, 34, 35, 36
]).
-record(recActive, {
  state             = 0                       :: type_as(),       %% 玩法状态
  timeBegin         = 0                       :: uint32(),        %% 当前玩法状态开始的时间
  timeEnd           = 0                       :: uint32(),        %% 当前玩法状态计划结束的时间
  score             = 0                       :: uint32(),        %% 当前得分
  listNpcIDOfColor  = []                      :: [uint(), ...],   %% 不同颜色的宝石NPC，分值按升序排列23456
  listMatrixValue   = []                      :: [uint(), ...],   %% 宝石矩阵（值为分值，虽然0时可以表示不存在，但逻辑计算时没必要清除）
  listMatrixCode    = ?DefaultListMatrixCode  :: [uint64(), ...], %% 宝石矩阵（值为Code，0时不存在）
  selectPosA        = 0                       :: uint8(),         %% 玩家A选中的位置
  selectPosB        = 0                       :: uint8(),         %% 玩家B选中的位置
  combo             = 0                       :: uint8(),         %% 当前连击计数
  allcomboNum       = 0                       :: uint8(),         %% 当前连击总计数
  comboMax          = 0                       :: uint8(),         %% 最大连击计数
  lastTimeCombo     = 0                       :: uint32(),        %% 上次连击时间
  timeMorePower     = 0                       :: uint32(),        %% 多倍BUFF结束时间
  power             = 1                       :: uint8(),         %% 多倍BUFF期间获得积分的倍率（不在BUFF时间内该值无效）
  lastTimeReshuffle = 0                       :: uint32(),        %% 上次手动重置宝石矩阵的时间
  reshuffleCount    = 0                       :: uint8(),         %% 剩余手动重置宝石矩阵的次数
  timeLink          = 0                       :: uint16()         %% 实际游戏时长
}).

%% 用于处理创建对象成功的反馈消息
-define(ObjectType_Gem,     0).   %% 对象类型：宝石
-define(ObjectType_Monster, 1).   %% 对象类型：怪物
-define(ObjectType_Box,     100).   %% 对象类型：箱子

%% 增益类型
-define(BuffTypeWhenLinkGood_Begin,     0).
-define(BuffTypeWhenLinkGood_None,      0). %% 没有增益
-define(BuffTypeWhenLinkGood_Score,     1). %% 立即增加积分
-define(BuffTypeWhenLinkGood_Power,     2). %% 获得积分时加倍
-define(BuffTypeWhenLinkGood_SpeedUp,   3). %% 加速
-define(BuffTypeWhenLinkGood_AddTime,   4). %% 增加游戏时间
-define(BuffTypeWhenLinkGood_End,       4).
-type type_btwlg() :: ?BuffTypeWhenLinkGood_Begin .. ?BuffTypeWhenLinkGood_End.

%% 负面类型
-define(DebuffTypeWhenLinkBad_Begin,     0).
-define(DebuffTypeWhenLinkBad_Slowdown,  0). %% 减速
-define(DebuffTypeWhenLinkBad_Dizzy,     1). %% 眩晕
-define(DebuffTypeWhenLinkBad_End,       1).
-type type_dtwlb() :: ?DebuffTypeWhenLinkBad_Begin .. ?DebuffTypeWhenLinkBad_End.

%% 结算原因定义
-define(SettleReason_ScoreMax,  0). %% 达到最大积分
-define(SettleReason_Timeout,   1). %% 时间结束
-define(SettleReason_Giveup,    2). %% 玩家放弃
-type type_sr() :: ?SettleReason_ScoreMax .. ?SettleReason_Giveup.

%% 方法实现
%%%-------------------------------------------------------------------

%% 当前活动多玩法通用接口
-export([
  initAfterCreate/1,
  initAfterFirstEnter/1,
  spawnObjectAck/3,
  onTimerMain/2,
  onTimerTick/1,
  playerEnterCheck/2,
  playerEnter/2,
  playerLeave/2,
  playerBreak/2,
  playerDelete/2
]).

%% 玩法特殊接口
-export([
  createMatrix/2,
  link/2,
  giveup/2,
  buffForGM/2
]).

%%% ====================================================================
%%% API functions 通用接口
%%% ====================================================================

%% 创建地图后的初始化
-spec initAfterCreate(MapInfoOld::#recMapInfo{}) -> MapInfoNew::#recMapInfo{}.
initAfterCreate(#recMapInfo{mapPID = MapPid, timerRefMain = TimerRefMain} = MapInfoOld) ->
  %?DEBUG_OUT("[DebugForDate] initAfterCreate"),
  %% 取消可能存在的旧有主计时器
  case erlang:is_reference(TimerRefMain) of
    true ->
      erlang:cancel_timer(TimerRefMain);
    _ ->
      skip
  end,
  %% 更新地图信息
  TimeNow = time:getSyncUTCTimeFromDBS(),
  TimeThisState = configTime_BeforeFirstEnter(),
  MapInfoNew = MapInfoOld#recMapInfo{
    %% 设置已初始化状态
    isInitAfterC = true,
    %% 设置当前玩法状态的主计时器
    timerRefMain = acDateLogic:setTimerMain(
      TimeThisState * 1000,
      MapPid,
      #recAckData{
        activeID  = ?DateActiveID_Link,
        paramEx   = ?ActiveState_BeforeFirstEnter
      }
    ),
    paramEx = #recActive{
      state             = ?ActiveState_BeforeFirstEnter,  %% 初始化玩法状态
      timeBegin         = TimeNow,                        %% 更新玩法开始时间
      timeEnd           = TimeNow + TimeThisState,
      listNpcIDOfColor  = configGemNpcID(),               %% 初始化宝石Npc列表
      reshuffleCount    = configCountReshuffle()          %% 重置剩余手动重置宝石矩阵的次数
    }
  },
  acDateState:replaceMapInfo(MapInfoNew),
  MapInfoNew.

%% 用户首次进入后的初始化
-spec initAfterFirstEnter(MapInfoOld::#recMapInfo{}) -> MapInfoNew::#recMapInfo{}.
initAfterFirstEnter(#recMapInfo{mapPID = MapPid, timerRefMain = TimerRefMain, paramEx = RecActive} = MapInfoOld) ->
  %?DEBUG_OUT("[DebugForDate] initAfterFirstEnter"),
  %% 取消可能存在的旧有主计时器
  case erlang:is_reference(TimerRefMain) of
    true ->
      erlang:cancel_timer(TimerRefMain);
    _ ->
      skip
  end,
  %% 更新地图信息
  TimeNow = time:getSyncUTCTimeFromDBS(),
  TimeThisState = configTime_AfterFirstEnter(),
  MapInfoNew = MapInfoOld#recMapInfo{
    %% 设置已首次进入状态
    isInitAfterFE = true,
    %% 设置当前玩法状态的主计时器
    timerRefMain = acDateLogic:setTimerMain(
      TimeThisState * 1000,
      MapPid,
      #recAckData{
        activeID  = ?DateActiveID_Link,
        paramEx   = ?ActiveState_AfterFirstEnter
      }
    ),
    paramEx = RecActive#recActive{
      state             = ?ActiveState_AfterFirstEnter,   %% 更新玩法状态
      timeBegin         = TimeNow,                        %% 更新玩法开始时间
      timeEnd           = TimeNow + TimeThisState
    }
  },
  acDateState:replaceMapInfo(MapInfoNew),
  MapInfoNew.

%% 创建对象成功的回执消息
-spec spawnObjectAck(MapInfoOld::#recMapInfo{}, Code::uint64(), ParamEx::term()) -> MapInfoNew::#recMapInfo{}.
%% 创建宝石NPC
spawnObjectAck(#recMapInfo{paramEx = RecActive} = MapInfoOld, Code, {?ObjectType_Gem, Index}) ->
  FunSet =
    fun(E, {C, L}) ->
      case C =:= Index of
        true ->
          {C + 1, [Code | L]};
        _ ->
          {C + 1, [E | L]}
      end
    end,
  {_, ListMatrixNewR} = lists:foldl(FunSet, {1, []}, RecActive#recActive.listMatrixCode),
  MapInfoNew =
    MapInfoOld#recMapInfo{
      paramEx = RecActive#recActive{
        listMatrixCode = lists:reverse(ListMatrixNewR)
      }
    },
  acDateState:replaceMapInfo(MapInfoNew),
  MapInfoNew;
%% 创建箱子NPC
spawnObjectAck(#recMapInfo{paramEx = RecActive} = MapInfoOld, Code, {?ObjectType_Box, Index}) ->
  FunSet =
    fun(E, {C, L}) ->
      case C =:= Index of
        true ->
          {C + 1, [Code | L]};
        _ ->
          {C + 1, [E | L]}
      end
    end,
  {_, ListMatrixNewR} = lists:foldl(FunSet, {1, []}, RecActive#recActive.listMatrixCode),
  MapInfoNew =
    MapInfoOld#recMapInfo{
      paramEx = RecActive#recActive{
        listMatrixCode = lists:reverse(ListMatrixNewR)
      }
    },
  acDateState:replaceMapInfo(MapInfoNew),
  MapInfoNew.

%% 响应主计时器消息
-spec onTimerMain(MapInfoOld::#recMapInfo{}, ParamEx::term()) -> MapInfoNew::#recMapInfo{} | undefined.
%% 首次进入前超时异常结算
onTimerMain(#recMapInfo{roleID_A = RoleID_A, roleID_B = RoleID_B, createMapTime = Time} = MapInfoOld, ?ActiveState_BeforeFirstEnter) ->
  ?WARN_OUT("onTimerMain ?ActiveState_BeforeFirstEnter RoleID_A(~p) RoleID_B(~p) Time(~p)", [RoleID_A, RoleID_B, Time]),
  settle(MapInfoOld, ?SettleReason_Timeout, 0),
  MapInfoOld;
%% 首次进入后满足时间，正式开启游戏
onTimerMain(#recMapInfo{timerRefMain = TimerRefMain, mapPID = MapPid, paramEx = RecActive} = MapInfoOld, ?ActiveState_AfterFirstEnter) ->
  %?DEBUG_OUT("[DebugForDate] onTimerMain ?ActiveState_AfterFirstEnter"),
  %% 取消可能存在的旧有主计时器
  case erlang:is_reference(TimerRefMain) of
    true ->
      erlang:cancel_timer(TimerRefMain);
    _ ->
      skip
  end,
  %% 更新地图信息
  TimeNow = time:getSyncUTCTimeFromDBS(),
  TimeThisState = configTime_MainGame(),
  MapInfoNew = MapInfoOld#recMapInfo{
    %% 设置当前玩法状态的主计时器
    timerRefMain = acDateLogic:setTimerMain(
      TimeThisState * 1000,
      MapPid,
      #recAckData{
        activeID  = ?DateActiveID_Link,
        paramEx   = ?ActiveState_Link
      }
    ),
    paramEx = RecActive#recActive{
      state             = ?ActiveState_Link,    %% 更新玩法状态
      timeBegin         = TimeNow,              %% 更新玩法开始时间
      timeEnd           = TimeNow + TimeThisState
    }
  },
  %%% DEBUG 打印宝石矩阵坐标
  %{SizeX, SizeY} = configGemSizeXY(),
  %FunDebug =
  %  fun(N) ->
  %    {X, Y} = getGemPosLTByPos(N),
  %    ?DEBUG_OUT("[DebugForDate N(~p) LT(~p) RB(~p)]", [N, {X, Y}, {X + SizeX, Y + SizeY}])
  %  end,
  %lists:foreach(FunDebug, ?ListMatrixPos),
  %% 创建宝石矩阵
  createMatrix(MapInfoNew, 0);
%% 游戏时间结束，进入结算流程
onTimerMain(MapInfoOld, ?ActiveState_Link) ->
  %?DEBUG_OUT("[DebugForDate] onTimerMain ?ActiveState_Link"),
  settle(MapInfoOld, ?SettleReason_Timeout, 0); %% 超时导致游戏结束
%% 结算时间结束，销毁地图
onTimerMain(#recMapInfo{mapPID = MapPid, timerRefMain = TimerRefMain} = MapInfoOld, ?ActiveState_Settle) ->
  %?DEBUG_OUT("[DebugForDate] onTimerMain ?ActiveState_Settle"),
  %% 取消可能存在的旧有主计时器
  case erlang:is_reference(TimerRefMain) of
    true ->
      erlang:cancel_timer(TimerRefMain);
    _ ->
      skip
  end,
  %% 销毁地图
  acDateState:deleteMapInfo(MapInfoOld),
  psMgr:sendMsg2PS(MapPid, resetCopyMap, {}),
  undefined.

%% 响应秒级心跳
-spec onTimerTick(MapInfoOld::#recMapInfo{}) -> MapInfoNew::#recMapInfo{}.
onTimerTick(#recMapInfo{roleID_A = RoleID_A, roleID_B = RoleID_B, playerEts = PlayerEts, paramEx = RecActive} = MapInfoOld) ->
  case RecActive of
    #recActive{
      state = ?ActiveState_Link,
      timeEnd = TimeEnd
    } ->
      %% 只在正确初始化玩法后，在主玩法状态中响应，同步剩余时间
      TimeNow = time:getSyncUTCTimeFromDBS(),
      TimeRemainder = TimeEnd - TimeNow,

      case TimeRemainder >= 0 of
        true ->
          NetMsg =
            #pk_GS2U_DateLink_MainTime_Sync{
              timeRemainder = TimeRemainder
            },
          acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsg),
          acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsg);
        _ ->
          skip
      end;
    _ ->
      skip
  end,
  MapInfoOld.

%% 用户进入检测
-spec playerEnterCheck(MapInfoOld::#recMapInfo{}, RoleID::uint64()) -> {MapInfoNew::#recMapInfo{}, IsAllowed::boolean()}.
playerEnterCheck(#recMapInfo{paramEx = RecActive} = MapInfoOld, RoleID) ->
  %?DEBUG_OUT("[DebugForDate] playerEnterCheck RoleID(~p)", [RoleID]),
  %% 不允许在结算状态进入
  IsAllowed =
    case RecActive#recActive.state of
      ?ActiveState_Settle ->
        case core:queryOnLineRoleByRoleID(RoleID) of
          #rec_OnlinePlayer{pid = Pid} ->
            psMgr:sendMsg2PS(Pid, date_error, {?ErrorCode_Date_Link_WaitDestroy, []});
          _ ->
            skip
        end,
        false;
      _ ->
        true
    end,
  {MapInfoOld, IsAllowed}.

%% 用户进入事件响应
-spec playerEnter(MapInfoOld::#recMapInfo{}, RoleID::uint64()) -> MapInfoNew::#recMapInfo{}.
playerEnter(#recMapInfo{roleID_A = RoleID_A, playerEts = PlayerEts, paramEx = RecActive} = MapInfoOld, RoleID) ->
  %?DEBUG_OUT("[DebugForDate] playerEnter RoleID(~p)", [RoleID]),
  %% 向角色同步当前玩法状态
  #recActive{
    state             = State,
    timeBegin         = _TimeBegin,
    timeEnd           = TimeEnd,
    timeLink          = _TimeLink,
    timeMorePower     = TimeMorePower,
    listNpcIDOfColor  = ListNpcIDOfColor,
    listMatrixCode    = ListMatrixCode,
    score             = Score,
    selectPosA        = SelectPosA,
    selectPosB        = SelectPosB,
    power             = Power,
    reshuffleCount    = ReshuffleCount,
    lastTimeReshuffle = LastTimeReshuffle
  } = RecActive,
  %% 根据玩法状态生成时间标记
  TimeNow = time:getSyncUTCTimeFromDBS(),
  {TimeForBegin, TimeForEnd} =
    case State of
      ?ActiveState_UnInit ->
        ?ERROR_OUT("playerEnter ActiveState_UnInit"),
        {0, 0};
      ?ActiveState_BeforeFirstEnter ->
        ?ERROR_OUT("playerEnter ActiveState_BeforeFirstEnter"),
        {0, 0};
      ?ActiveState_AfterFirstEnter ->
        {TimeEnd - TimeNow, configTime_MainGame()};
      ?ActiveState_Link ->
        {0, TimeEnd - TimeNow};
      ?ActiveState_Settle ->
        {0, 0}
    end,
  %% 判断当前用户是否为用户A
  {SelectPosA_, SelectPosB_} =
    case RoleID of
      RoleID_A ->
        {SelectPosA, SelectPosB};
      _ ->
        {SelectPosB, SelectPosA}
    end,
  %% 发送消息
  FunGetListGem =
    fun(E, R) ->
      case E > 0 of
        true ->
          [1 | R];
        _ ->
          [0 | R]
      end
    end,
  ResetCD =
    case configTime_Reshuffle() - (TimeNow - LastTimeReshuffle) of
      CD when CD > 0 ->
        CD;
      _ ->
        0
    end,
  NetMsg =
    #pk_GS2U_DateLink_Welcome_Sync{
      timeForBegin  = TimeForBegin,
      timeForEnd    = TimeForEnd,
      timePower     = TimeMorePower - TimeNow,
      listGem       = ListNpcIDOfColor,
      score         = Score,
      indexA        = SelectPosA_,
      indexB        = SelectPosB_,
      power         = Power,
      resetCount    = ReshuffleCount,
      listGemMatrix = lists:reverse(lists:foldl(FunGetListGem, [], ListMatrixCode)),
      resetCD       = ResetCD
    },
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID, PlayerEts, NetMsg),
  %?DEBUG_OUT("[DebugForDate] NetMsg~n~p~n~p~n~p", [TimeBeginForNetMsg, TimeEndForNetMsg, NetMsg#pk_GS2U_DateLink_Welcome_Sync.listGemMatrix]),
  MapInfoOld. %% 未发生数据变化

%% 用户离开事件响应（地图销毁造成的玩家离开无法在此处理）
-spec playerLeave(MapInfoOld::#recMapInfo{}, RoleID::uint64()) -> MapInfoNew::#recMapInfo{}.
playerLeave(#recMapInfo{roleID_A = RoleID_A, roleID_B = RoleID_B, paramEx = RecActive, playerEts = PlayerEts} = MapInfoOld, RoleID) ->
  %?DEBUG_OUT("[DebugForDate] playerLeave RoleID(~p)", [RoleID]),
  %% 离开的玩家自动取消选择
  #recActive{
    selectPosA = PosA,
    selectPosB = PosB
  } = RecActive,
  {MapInfoNew, RoleID_Partner} =
    case RoleID of
      RoleID_A when PosA > 0 ->
        {link(MapInfoOld, {RoleID, {PosA, false, 0}}), RoleID_B};
      RoleID_B when PosB > 0 ->
        {link(MapInfoOld, {RoleID, {PosB, false, 0}}), RoleID_A};
      RoleID_A ->
        {MapInfoOld, RoleID_B};
      _ ->
        {MapInfoOld, RoleID_A}
    end,
  %% 两个人都离开地图时游戏结束
  FunCheck =
    fun(#recMapObject{id = ID}, IsGiveUp) ->
      case RoleID_Partner of
        ID ->
          false;
        _ ->
          IsGiveUp
      end
    end,
  case ets:foldl(FunCheck, true, PlayerEts) of
    true ->
      giveup(MapInfoNew, {RoleID, true});
    _ ->
      MapInfoNew
  end.

%% 用户解除关系事件响应
-spec playerBreak(MapInfoOld::#recMapInfo{}, RoleID::uint64()) -> MapInfoNew::#recMapInfo{}.
playerBreak(MapInfoOld, RoleID) ->
  %?DEBUG_OUT("[DebugForDate] playerBreak RoleID(~p)", [RoleID]),
  giveup(MapInfoOld, {RoleID, true}). %% 直接结算

%% 用户删除事件响应
-spec playerDelete(MapInfoOld::#recMapInfo{}, RoleID::uint64()) -> MapInfoNew::#recMapInfo{}.
playerDelete(MapInfoOld, RoleID) ->
  %?DEBUG_OUT("[DebugForDate] playerDelete RoleID(~p)", [RoleID]),
  giveup(MapInfoOld, {RoleID, true}). %% 直接结算

%%% ====================================================================
%%% API functions 玩法特殊接口
%%% ====================================================================

%% 创建宝石矩阵（重置）
-spec createMatrix(MapInfoOld::#recMapInfo{}, RoleID::uint64()) -> MapInfoNew::#recMapInfo{}.
createMatrix(#recMapInfo{mapPID = MapPid, roleID_A = RoleID_A, roleID_B = RoleID_B, playerEts = PlayerEts, paramEx = RecActive} = MapInfoOld, RoleID) ->
  %?DEBUG_OUT("[DebugForDate] createMatrix RoleID(~p) 0 is sys", [RoleID]),
  %% -2.如果不是主游戏阶段，则忽略该消息
  case RecActive#recActive.state of
    ?ActiveState_Link ->
      %?DEBUG_OUT("[DebugForDate] createMatrix RoleID(~p) 0 is sys", [RoleID]),
      %% -1.如果是用户操作需要重置宝石矩阵，需要验证剩余重置次数及间隔时间
      {NeedCreate, RecActiveNew_} = createMatrix_ReshuffCheck(RecActive, RoleID, PlayerEts),
      case NeedCreate of
        true ->
          %% 0.清理可能存在的宝石NPC
          createMatrix_Clear(MapPid, RecActiveNew_),
          %% 1.随机宝石顺序以对应分值
          ListNpcIDOfColor = misc:shuffle(RecActiveNew_#recActive.listNpcIDOfColor),
          %% 2.根据宝石顺序调整宝石组数量，生成最初的宝石列表
          ListMatrixTemp = createMatrix_Count(),
          %% 3.随机调整宝石位置，相同宝石不能相邻
          ListMatrixValue = ListMatrixTemp,%%misc:shuffle(ListMatrixTemp++ListMatrixTemp),  %%createMatrix_Shuffle(ListMatrixTemp),
          %?DEBUG_OUT("[DebugForDate] createMatrix ~p", [ListMatrixValue]),  %% 检查算法耗时
          %% 4.更新MapInfo

          MapInfoNew = MapInfoOld#recMapInfo{
            paramEx = RecActiveNew_#recActive{
              listNpcIDOfColor  = ListNpcIDOfColor,         %% 重置宝石分值
              listMatrixValue   = ListMatrixValue,          %% 重置宝石值矩阵
              listMatrixCode    = ?DefaultListMatrixCode,   %% 重置宝石Code矩阵
              selectPosA        = 0,                        %% 重置玩家A选择的位置
              selectPosB        = 0                         %% 重置玩家B选择的
            }
          },
          acDateState:replaceMapInfo(MapInfoNew),
          %% 5.创建NPC
          createMatrix_CreateNpc(MapPid, ListNpcIDOfColor, ListMatrixValue),
          %% 6.通知玩家
          TimeNow = time:getSyncUTCTimeFromDBS(),
          ResetCD =
            case configTime_Reshuffle() - (TimeNow - RecActiveNew_#recActive.lastTimeReshuffle) of
              CD when CD > 0 ->
                CD;
              _ ->
                0
            end,
          NetMsg =
            #pk_GS2U_DateLink_ResetGem_Sync{
              listGem     = ListNpcIDOfColor,
              resetCount  = RecActiveNew_#recActive.reshuffleCount,  %% 该值自从步骤-1结束就没变化，所以从RecActiveNew_取用
              resetCD     = ResetCD,
              listGemMatrix =  ListMatrixValue
            },
          acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsg),
          acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsg),
          %% 7.重置玩家坐标
          %%createMatrix_ResetPlayerPos(PlayerEts),
          MapInfoNew;
        _ ->
          %?DEBUG_OUT("[DebugForDate] createMatrix"),
          MapInfoOld
      end;
    _ ->
      MapInfoOld
  end.

%% 宝石区域的选中、取消选中操作，可能造成连接
-spec link(MapInfoOld::#recMapInfo{}, {RoleID::uint64(), term()}) -> MapInfoNew::#recMapInfo{}.
link(MapInfoOld, {RoleID, {IsSelect, GMMod}}) ->
  %?DEBUG_OUT("[DebugForDate] link/2 a"),
  Pos = link_getPlayerInPos(MapInfoOld, RoleID, IsSelect, GMMod),
  link(MapInfoOld, {RoleID, {Pos, {undefined, undefined}, IsSelect, GMMod}});
link(MapInfoOld, {RoleID, {Pos, IsSelect, GMMod}}) ->
  %?DEBUG_OUT("[DebugForDate] link/2 b"),
  link(MapInfoOld, {RoleID, {Pos, {undefined, undefined}, IsSelect, GMMod}});
link(#recMapInfo{roleID_A = RoleID_A, roleID_B = RoleID_B, playerEts = PlayerEts, paramEx = RecActive} = MapInfoOld, {RoleID, {Pos, PosXY, IsSelect, GMMod}} = _Msg) ->
  %?DEBUG_OUT("[DebugForDate] link ~p", [_Msg]),
  %% 0.如果不是主游戏阶段，则忽略该消息
  case RecActive#recActive.state of
    ?ActiveState_Link ->
      %% 1.操作者是否为玩家A？
      IsRoleA = link_isRoleA(RoleID, RoleID_A, RoleID_B, GMMod),
      case IsRoleA of
        error ->
          %?DEBUG_OUT("[DebugForDate] link skip because RoleID"),
          MapInfoOld;
        _ ->
          %% 2.检查玩家坐标是否在误差范围内，返回继续计算使用的坐标或者error
          case link_checkPosXY_A(RoleID, PlayerEts, PosXY) of
            error ->
              %?DEBUG_OUT("[DebugForDate] link skip because PosXY"),
              MapInfoOld;
            PosXY_Real ->
              %% 3.检查玩家坐标是否处于或不处于目标位置以执行要求的操作
              case link_checkPosXY_B(PosXY_Real, Pos, IsSelect, RecActive) of
                true ->
                  %% 4.检查通过，执行操作
                  link_afterCheck(MapInfoOld, {IsRoleA, Pos, IsSelect});
                _ ->
                  %?DEBUG_OUT("[DebugForDate] link skip because PosXY, Pos, IsSelect"),
                  MapInfoOld
              end
          end
      end;
    _ ->
      MapInfoOld
  end.

%% 放弃游戏
-spec giveup(MapInfoOld::#recMapInfo{}, {RoleID::uint64(), IsSettle::boolean()}) -> MapInfoNew::#recMapInfo{}.
giveup(#recMapInfo{mapPID = MapPid, timerRefMain = TimerRefMain, paramEx = RecActive} = MapInfoOld, {RoleID, IsSettle}) ->
  %?DEBUG_OUT("[DebugForDate] gmSayItsEnd RoleID(~p) IsSettle(~p)", [RoleID, IsSettle]),
  case IsSettle of
    true ->
      %% 如果不是主游戏阶段，则忽略该消息
      case RecActive#recActive.state of
        ?ActiveState_Link ->
          settle(MapInfoOld, ?SettleReason_Giveup, RoleID); %% 玩家放弃导致游戏结束
        _ ->
          MapInfoOld
      end;
    _ ->
      %% 取消可能存在的旧有主计时器
      case erlang:is_reference(TimerRefMain) of
        true ->
          erlang:cancel_timer(TimerRefMain);
        _ ->
          skip
      end,
      %% 销毁地图
      acDateState:deleteMapInfo(MapInfoOld),
      psMgr:sendMsg2PS(MapPid, resetCopyMap, {}),
      undefined
  end.

%% GM命令直接产生正面增益
-spec buffForGM(MapInfoOld::#recMapInfo{}, BuffType::type_btwlg()) -> MapInfoNew::#recMapInfo{}.
%% 直接加分
buffForGM(#recMapInfo{roleID_A = RoleID_A, roleID_B = RoleID_B, playerEts = PlayerEts, paramEx = RecActive} = MapInfoOld, ?BuffTypeWhenLinkGood_Score) ->
  %?DEBUG_OUT("[DebugForDate] buffForGM BuffTypeWhenLinkGood_Score"),
  #recActive{
    score = Score
  } = RecActive,
  ScoreMax = configScoreMax(),
  ListRandAddScore = configRandAddScore(),
  CountAdd = erlang:length(ListRandAddScore),
  AddScore = lists:nth(misc:rand(1, CountAdd), ListRandAddScore),
  ScoreNew = erlang:min(ScoreMax, Score + AddScore),
  NetMsgAddSocre =
    #pk_GS2U_DateLink_BuffAddScore_Sync{
      score     = AddScore,
      scoreAll  = ScoreNew
    },
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsgAddSocre),
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsgAddSocre),
  MapInfoNew =
    MapInfoOld#recMapInfo{
      paramEx = RecActive#recActive{
        score = ScoreNew
      }
    },
  acDateState:replaceMapInfo(MapInfoNew),
  %% 额外补充BUFF以支持特效展示
  BuffID_AddScore = configBuffID_AddScore(),
  addBuff(RoleID_A, PlayerEts, BuffID_AddScore),
  addBuff(RoleID_B, PlayerEts, BuffID_AddScore),
  NetMsgBuffAddScore =
    #pk_GS2U_DateLink_BuffBuff_Sync{
      buffID = BuffID_AddScore
    },
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsgBuffAddScore),
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsgBuffAddScore),
  MapInfoNew;
%% 增加（重置）多倍积分BUFF
buffForGM(#recMapInfo{roleID_A = RoleID_A, roleID_B = RoleID_B, playerEts = PlayerEts, paramEx = RecActive} = MapInfoOld, ?BuffTypeWhenLinkGood_Power) ->
  %?DEBUG_OUT("[DebugForDate] buffForGM BuffTypeWhenLinkGood_Power"),
  TimeNow = time:getSyncUTCTimeFromDBS(),
  ListRandPower = configRandPower(),
  CountPower = erlang:length(ListRandPower),
  Power = lists:nth(misc:rand(1, CountPower), ListRandPower),
  ListRandTime_Power = configRandTime_Power(),
  CountTime_Power = erlang:length(ListRandTime_Power),
  Time_Power = lists:nth(misc:rand(1, CountTime_Power), ListRandTime_Power),
  NetMsgPower =
    #pk_GS2U_DateLink_BuffPower_Sync{
      time  = Time_Power,
      power = Power
    },
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsgPower),
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsgPower),
  MapInfoNew =
    MapInfoOld#recMapInfo{
      paramEx = RecActive#recActive{
        timeMorePower = TimeNow + Time_Power,
        power         = Power
      }
    },
  acDateState:replaceMapInfo(MapInfoNew),
  %% 额外补充BUFF以支持特效展示
  BuffID_Power = configBuffID_Power(),
  addBuff(RoleID_A, PlayerEts, BuffID_Power),
  addBuff(RoleID_B, PlayerEts, BuffID_Power),
  NetMsgBuffPower =
    #pk_GS2U_DateLink_BuffBuff_Sync{
      buffID = BuffID_Power
    },
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsgBuffPower),
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsgBuffPower),
  MapInfoNew;
%% 加速
buffForGM(#recMapInfo{roleID_A = RoleID_A, roleID_B = RoleID_B, playerEts = PlayerEts} = MapInfoOld, ?BuffTypeWhenLinkGood_SpeedUp) ->
  %?DEBUG_OUT("[DebugForDate] buffForGM BuffTypeWhenLinkGood_SpeedUp"),
  BuffID_Speed = configBuffID_SpeedUp(),
  addBuff(RoleID_A, PlayerEts, BuffID_Speed),
  addBuff(RoleID_B, PlayerEts, BuffID_Speed),
  NetMsgBuffSpeed =
    #pk_GS2U_DateLink_BuffBuff_Sync{
      buffID = BuffID_Speed
    },
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsgBuffSpeed),
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsgBuffSpeed),
  MapInfoOld;
%% 增加游戏时间
buffForGM(#recMapInfo{mapPID = MapPid, roleID_A = RoleID_A, roleID_B = RoleID_B, timerRefMain = TimerRefMain, playerEts = PlayerEts, paramEx = RecActive} = MapInfoOld, ?BuffTypeWhenLinkGood_AddTime) ->
  %?DEBUG_OUT("[DebugForDate] buffForGM BuffTypeWhenLinkGood_AddTime"),
  #recActive{
    timeEnd = TimeEnd
  } = RecActive,
  TimeNow = time:getSyncUTCTimeFromDBS(),
  case erlang:is_reference(TimerRefMain) of
    true ->
      erlang:cancel_timer(TimerRefMain);
    _ ->
      skip
  end,
  LisrRandAddTime = configRandAddTime(),
  CountTime_Add = erlang:length(LisrRandAddTime),
  Time_Add = lists:nth(misc:rand(1, CountTime_Add), LisrRandAddTime),
  TimeEndNew = TimeEnd + Time_Add,
  TimerRefMainNew =
    acDateLogic:setTimerMain(
      (TimeEndNew - TimeNow) * 1000,
      MapPid,
      #recAckData{
        activeID  = ?DateActiveID_Link,
        paramEx   = ?ActiveState_Link
      }
    ),
  NetMsgAddTime =
    #pk_GS2U_DateLink_BuffAddTime_Sync{
      timeAdd       = TimeEndNew - TimeEnd,
      timeRemainder = TimeEndNew - TimeNow
    },
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsgAddTime),
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsgAddTime),
  MapInfoNew =
    MapInfoOld#recMapInfo{
      timerRefMain = TimerRefMainNew,
      paramEx = RecActive#recActive{
        timeEnd = TimeEndNew
      }
    },
  acDateState:replaceMapInfo(MapInfoNew),
  %% 额外补充BUFF以支持特效展示
  BuffID_AddTime = configBuffID_AddTime(),
  addBuff(RoleID_A, PlayerEts, BuffID_AddTime),
  addBuff(RoleID_B, PlayerEts, BuffID_AddTime),
  NetMsgBuffAddTime =
    #pk_GS2U_DateLink_BuffBuff_Sync{
      buffID = BuffID_AddTime
    },
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsgBuffAddTime),
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsgBuffAddTime),
  MapInfoNew.

%%% ====================================================================
%%% Internal functions
%%% ====================================================================

%% 检查可能的手动重置条件
-spec createMatrix_ReshuffCheck(RecActive::#recActive{}, RoleID::uint64(), PlayerEts::etsTab()) -> {NeedCreate::boolean(), RecActiveNew::#recActive{}}.
createMatrix_ReshuffCheck(RecActive, RoleID, PlayerEts) ->
  case RoleID of
    0 ->
      %% 系统要求重置宝石阵，直接通过
      {true, RecActive};
    _ ->
      %?DEBUG_OUT("[DebugForDate] createMatrix_ReshuffCheck"),
      %% 玩家手动重置宝石阵
      #recActive{
        reshuffleCount = ReshuffleCount,
        lastTimeReshuffle = LastTimeReshuffle
      } = RecActive,
      TimeNow = time:getSyncUTCTimeFromDBS(),
      %% 检查可操作的剩余次数
      case ReshuffleCount > 0 of
        true ->
          %% 检查操作时间间隔
          TimeWait = configTime_Reshuffle() - (TimeNow - LastTimeReshuffle),
          case TimeWait =< 0 of
            true ->
              %?DEBUG_OUT("[DebugForDate] createMatrix_ReshuffCheck"),
              {
                true,
                RecActive#recActive{
                  reshuffleCount = ReshuffleCount - 1,
                  lastTimeReshuffle = TimeNow
                }
              };
            _ ->
              %?DEBUG_OUT("[DebugForDate] createMatrix_ReshuffCheck"),
              case acDateLogic:getPlayerPidNetPidFromThisMap(RoleID, PlayerEts) of
                undefined ->
                  skip;
                {Pid, _} ->
                  psMgr:sendMsg2PS(Pid, date_error, {?ErrorCode_Date_Link_ReshuffleNotCoolDown, [TimeWait]})
              end,
              {false, RecActive} %% 功能未冷却
          end;
        _ ->
          %?DEBUG_OUT("[DebugForDate] createMatrix_ReshuffCheck"),
          {false, RecActive} %% 剩余次数不足，忽略该操作
      end
  end.

%% 清除所有宝石
-spec createMatrix_Clear(MapPid::pid(), RecActive::#recActive{}) -> ok.
createMatrix_Clear(MapPid, #recActive{listMatrixCode = ListMatrixCode}) ->
  FunClear =
    fun(E, L) ->
      case E > 0 of
        true ->
          [E | L];
        _ ->
          L
      end
    end,
  CodeList = lists:foldl(FunClear, [], ListMatrixCode),
  %% 原接口向客户端发送的消息是GS2U_BroadcastDisapear，客户端会将待处理物放置队列中慢慢删除，造成了LUN-1239的问题
  %% 此处应当在服务端删除对象后，向客户端发送新的消息GS2U_BroadcastDisapearFast，需要客户端支持直接删除对象
  %%acDateLogic:clearObject(MapPid, {?CodeTypeNPC, CodeList}),
  acDateLogic:clearObjectFast(MapPid, {?CodeTypeNPC, CodeList}),
  ok.

%% 调整宝石组数量，生成最初的宝石列表
%% （以下数值都是写死在代码）
-spec createMatrix_Count() -> ListMatrix1::[uint8(), ...].
createMatrix_Count() ->
  %% 总量为36，两两一组则总组数为18，单色最大不能超过9，最好控制在8以内
  %% 总基础值为6组，额外可增加2组
  %% 分值Score1的基础值为5个，可以最多再增加2个
  %% 分值Score2的基础值为4个，可以最多再增加2个
  %% 分值Score3的基础值为3个，可以最多再增加1个
  %% 分值Score4的基础值为2个，可以最多再增加1个
  %% 分值Score5的基础值为1个，可以最多再增加1个
  ListScore = configGemScore(),
  Score0 = 0,
  Score1 = lists:nth(3, ListScore),
  %%Score2 = lists:nth(4, ListScore),
  Score3 = lists:nth(2, ListScore),
  %% Score4 = lists:nth(2, ListScore),
  Score5 = lists:nth(1, ListScore),
  ListBase0 = [
    Score3,Score0,Score3,Score1,Score0,Score3,
    Score1, Score1, Score0,Score5,Score0,Score5,
    Score0, Score0,Score0,Score0,Score0,Score0,
    Score5,Score1,Score1,Score3,Score0,Score0,
    Score0,Score0,Score0,Score0,Score3,Score0,
    Score3,Score0,Score0,Score1,Score0,Score5],
  ListBase1 = [
    Score1,Score0,Score1,Score1,Score0,Score3,
    Score1, Score0, Score0,Score5,Score1,Score0,
    Score0, Score0,Score1,Score0,Score0,Score0,
    Score5,Score1,Score1,Score3,Score0,Score0,
    Score0,Score0,Score0,Score0,Score3,Score0,
    Score3,Score0,Score0,Score1,Score0,Score1],
  ListBase2 = [
    Score0,Score0,Score1,Score1,Score0,Score3,
    Score1, Score1, Score0,Score0,Score1,Score0,
    Score0, Score1,Score0,Score5,Score0,Score0,
    Score5,Score1,Score1,Score3,Score0,Score0,
    Score0,Score0,Score0,Score0,Score3,Score0,
    Score0,Score3,Score0,Score1,Score0,Score1],

  RandListIndex =   misc:rand(1, 3),
  ListBase=
    case RandListIndex of 1 ->
      ListBase0;
      2 ->
      ListBase1;
      3->
      ListBase2
    end,
%%ListAdd1 = [Score1, Score3, Score1, Score1,Score1,Score1,Score1],
%%ListAdd2 = misc:shuffle(ListAdd1),
%%{ListAdd3, _} = lists:split(3, ListAdd2),
ListBase.

%% 调整宝石位置
%% 相同宝石不能上下左右相邻
-spec createMatrix_Shuffle(ListMatrixIn::[uint8(), ...]) -> ListMatrixOut::[uint8(), ...].
createMatrix_Shuffle(ListMatrixIn) ->
  createMatrix_ShuffleR1(misc:shuffle(ListMatrixIn++ListMatrixIn)).  %% 这里列表翻倍是18组拆分为了36个

%% 第一重递归，在第二重递归返回值为{false, _}时可跳出
-spec createMatrix_ShuffleR1(ListMatrixIn::[uint8(), ...]) -> ListMatrixOut::[uint8(), ...].
createMatrix_ShuffleR1(ListMatrixIn) ->
  case createMatrix_ShuffleR2(1, ListMatrixIn, false) of
    {true, ListMatrixInNew} ->
      createMatrix_ShuffleR1(ListMatrixInNew);
    {false, ListMatrixOut} ->
      ListMatrixOut
  end.

%% 第二重递归检查并调整相邻的同色元素
-spec createMatrix_ShuffleR2(PosIn::uint8(), ListMatrixIn::[uint8(), ...], IsSideInThisLoop::boolean()) -> {IsSideInThisLoopOut::boolean(), ListMatrixOut::[uint8(), ...]}.
createMatrix_ShuffleR2(PosIn, ListMatrixIn, IsSideInThisLoop) ->
  case PosIn > 36 of
    true ->
      {IsSideInThisLoop, ListMatrixIn};
    _ ->
      case createMatrix_Shuffle_Check(PosIn, ListMatrixIn) of
        {true, _} ->
          ListMatrixNew = createMatrix_Shuffle_Swap(PosIn, ListMatrixIn),
          case erlang:is_list(ListMatrixNew) of
            true ->
              createMatrix_ShuffleR2(PosIn + 1, ListMatrixNew, true);
            _ ->
              createMatrix_ShuffleR2(1, misc:shuffle(ListMatrixIn), false)
          end;
        _ ->
          createMatrix_ShuffleR2(PosIn + 1, ListMatrixIn, IsSideInThisLoop)
      end
  end.

%% 检查是否相邻
-spec createMatrix_Shuffle_Check(PosIn::uint8(), ListMatrixIn::[uint8(), ...]) ->
  {IsSideOut::boolean(), {PosSideOut::uint8(), ValueOut::uint8()}}.
createMatrix_Shuffle_Check(PosIn, ListMatrixIn) ->
  %% 根据传入坐标计算相邻坐标（由于是从左上往右下检查的，所以不检查前面的坐标）
  ValueIn = lists:nth(PosIn, ListMatrixIn),
  FunIsSide =
    fun(PosSideMaybe, {IsSide, PosSide}) ->
      createMatrix_Shuffle_IsSide(PosSideMaybe, {IsSide, {PosSide, ValueIn, ListMatrixIn}})
    end,
  misc:foldlEx(FunIsSide, {false, 0}, [PosIn + 1, PosIn + 6]).

%% 如果元素相邻则遍历所有可以交换的位置，然后随机交换
-spec createMatrix_Shuffle_Swap(PosIn::uint8(), ListMatrixIn::[uint8(), ...]) ->
  ListMatrixOut::[uint8(), ...] | error.
createMatrix_Shuffle_Swap(PosIn, ListMatrixIn) ->
  %% 遍历相邻不是相同颜色的位置
  ValueIn = lists:nth(PosIn, ListMatrixIn),
  FunFind =
    fun(Pos, ListCanUse) ->
      %% 不能是自己
      case Pos of
        PosIn ->
          ListCanUse;
        _ ->
          %% 条件A：将目标放到遍历到的位置，不会引起冲突
          FunIsSide =
            fun(PA, PB) ->
              createMatrix_Shuffle_IsSide(PA, PB)
            end,
          case misc:foldlEx(FunIsSide, {false, {0, ValueIn, ListMatrixIn}}, [Pos - 1, Pos + 1, Pos - 6, Pos + 6]) of
            {false, _} ->
              %% 条件B：将遍历到的位置放到目标上，不会引起冲突
              ValuePos = lists:nth(Pos, ListMatrixIn),
              case misc:foldlEx(FunIsSide, {false, {0, ValuePos, ListMatrixIn}}, [PosIn - 1, PosIn + 1, PosIn - 6, PosIn + 6]) of
                {false, _} ->
                  [Pos | ListCanUse];
                _ ->
                  ListCanUse
              end;
            _ ->
              ListCanUse
          end
      end
    end,
  ListCanUse = lists:foldl(FunFind, [], lists:seq(1, 36)),
  %% 随机取一个可用的位置进行交换
  case ListCanUse of
    [] ->
      %?WARN_OUT("createMatrix_Shuffle_Swap 重越表示算法效率越低，暂时没有更好的办法"),
      error;
    _ ->
      [PosR|_] = misc:shuffle(ListCanUse),
      ValueR = lists:nth(PosR, ListMatrixIn),
      FunSwap =
        fun(Value, {Pos, ListMatrixOutR}) ->
          case Pos of
            PosIn ->
              {Pos + 1, [ValueR | ListMatrixOutR]};
            PosR ->
              {Pos + 1, [ValueIn | ListMatrixOutR]};
            _ ->
              {Pos + 1, [Value | ListMatrixOutR]}
          end
        end,
      {_, ListMatrixOutR} = lists:foldl(FunSwap, {1, []}, ListMatrixIn),
      lists:reverse(ListMatrixOutR)
  end.

%% 检查是否相邻（子算法）
-spec createMatrix_Shuffle_IsSide(PosSideMaybe::uint8(), {IsSide::boolean(), {PosSide::uint8(), ValueIn::uint8(), ListMatrixIn::[uint8(), ...]}}) ->
  {IsSideOut::boolean(), {PosSideOut::uint8(), ValueOut::uint8(), ListMatrixOut::[uint8(), ...]}}.
createMatrix_Shuffle_IsSide(PosSideMaybe, {IsSide, {PosSide, ValueIn, ListMatrixIn}}) ->
  case PosSideMaybe > 0 andalso PosSideMaybe =< 36 of
    true ->
      case lists:nth(PosSideMaybe, ListMatrixIn) of
        ValueIn ->
          {true, {PosSideMaybe, ValueIn, ListMatrixIn}};
        _ ->
          {IsSide, {PosSide, ValueIn, ListMatrixIn}}
      end;
    _ ->
      {IsSide, {PosSide, ValueIn, ListMatrixIn}}
  end.

%% 分值对应的宝石NPCID列表位置
-spec value2ListNpcIDPos(Value::uint8()) -> Pos::uint8().
value2ListNpcIDPos(Value) ->
  FunGetPos =
    fun(CfgValue, {_, Count}) ->
      {CfgValue =:= Value, Count + 1}
    end,
  case misc:foldlEx(FunGetPos, {false, 0}, configGemScore()) of
    {true, Pos} ->
      Pos;
    _ ->
      ?ERROR_OUT("~p", [misc:getStackTrace()])
  end.

%% 根据位置序号生成宝石区域左上角坐标
%% 注：返回值已经被马文洪修改为了中心坐标
-spec getGemPosLTByPos(Pos::uint8()) -> PosLT::{float(), float()}.
getGemPosLTByPos(Pos) when Pos > 0, Pos =< 36 ->
  X1 = ((Pos - 1) rem 6), %% 横数第几-1个
  Y1 = ((Pos - 1) div 6), %% 竖数第几-1个
  {SizeX, SizeY} = configGemSizeXY(),
  {DistX, DistY} = configGemDistXY(),


  X2 =  DistX * X1 + SizeX * X1,
  Y2 =  DistY * Y1 + SizeY * Y1,
%%  SizeBX = SizeX + DistX,
%%  SizeBY = SizeY + DistY,
%%  X2 = X1 * SizeBX,  %% 增加区域长度和间距的偏移值
%%  Y2 = Y1 * SizeBY,  %% 增加区域长度和间距的偏移值
  {PosX, PosY} = configGemPointXY(),
  %% 基准坐标是中心点的校正
  X3 = X2 + PosX - 2.5 * DistX - 2.5 * SizeX,
  Y3 = Y2 + PosY - 2.5 * DistY - 2.5 * SizeY,
  %% 基准坐标是左上角的校正
  %X3 = X2 + PosX,
  %Y3 = Y2 + PosY,
  %?DEBUG_OUT("[DebugForDate] ~p:~p,~p", [Pos, X3, Y3]),
  {float(X3), float(Y3)}.

%% 创建宝石阵时创建的NPC
-spec createMatrix_CreateNpc(MapPid::pid(), ListNpcIDOfColor::[uint(), ...], ListMatrixValue::[uint8(), ...]) -> ok.
createMatrix_CreateNpc(MapPid, ListNpcIDOfColor, ListMatrixValue) ->
  FunLoadCfg =
    fun(ID, ListCfg) ->
      [getCfg:getCfgByKey(cfg_npc, ID) | ListCfg]
    end,
  ListCfg = lists:reverse(lists:foldl(FunLoadCfg, [], ListNpcIDOfColor)),
  FunSpwanNPC =
    fun(Value, Index) ->

      case Value > 0 of
        true ->
          {X2, Y2} = getGemPosLTByPos(Index),
%%           {SizeX, SizeY} = configGemSizeXY(),
%%           X2 = X1 + SizeX / 2, %% 中心点校正
%%           Y2 = Y1 + SizeY / 2, %% 中心点校正
          #npcCfg{
            id = ID,
            name = Name,
            ndirection = RotW
          } =
            lists:nth(value2ListNpcIDPos(Value), ListCfg),
          Arg =
            #recSpawnNpc{
              id = ID,
              x = X2,
              y = Y2,
              rotW = RotW*1.0,
              name = Name,
              groupID = 0
            },
          acDateLogic:spawnObject(MapPid, Arg, #recAckData{activeID = ?DateActiveID_Link, paramEx = {?ObjectType_Gem, Index}});
        _ ->
          skip
      end,
      Index + 1
    end,
  lists:foldl(FunSpwanNPC, 1, ListMatrixValue),
  ok.

%% 刷箱子
-spec randBox(MapPid::pid(), Pos::uint8()) -> ok.
randBox(MapPid, Pos) ->
  %% 1.随机找个箱子
  ListBoxID = configRandBoxID(),
  FunLoadCfg =
    fun(ID, ListCfg) ->
      [getCfg:getCfgByKey(cfg_npc, ID) | ListCfg]
    end,
  ListCfg = lists:reverse(lists:foldl(FunLoadCfg, [], ListBoxID)),
  #npcCfg{
    id = ID,
    name = Name,
    ndirection = RotW
  } = lists:nth(1, ListCfg),
  %%Count = erlang:length(ListBoxID),
  case ID > 0 of
    true ->
      {X2, Y2} = getGemPosLTByPos(Pos),
%%      {SizeX, SizeY} = configGemSizeXY(),
%%      X2 = X1 + SizeX / 2, %% 中心点校正
%%      Y2 = Y1 + SizeY / 2, %% 中心点校正
      Arg =
        #recSpawnNpc{
          name    = Name,
          id      = ID,
          x       = X2,
          y       = Y2,
          rotW    = RotW*1.0,
          groupID = 0
        },
      acDateLogic:spawnObject(MapPid, Arg, #recAckData{activeID = ?DateActiveID_Link, paramEx = {?ObjectType_Box, Pos}});
    _ ->
      skip
  end,
  ok.

%% 重置玩家坐标
-spec createMatrix_ResetPlayerPos(PlayerEts::etsTab()) -> ok.
createMatrix_ResetPlayerPos(PlayerEts) ->
  %?DEBUG_OUT("[DebugForDate] createMatrix_ResetPlayerPos"),
  Pos = configGemPointXY(),
  FunFind =
    fun(#recMapObject{pid = Pid}, L) ->
      [Pid | L]
    end,
  List = ets:foldl(FunFind, [], PlayerEts),
  FunReset =
    fun(Pid) ->
      %?DEBUG_OUT("[DebugForDate] createMatrix_ResetPlayerPos ~p", [Pid]),
      psMgr:sendMsg2PS(Pid, date_link_resetPosSync, Pos)
    end,
  lists:foreach(FunReset, List),
  ok.

%% 获取玩家所在位置的宝石序号
-spec link_getPlayerInPos(MapInfo::#recMapInfo{}, RoleID::uint64(), IsSelect::boolean(), GMMod::0|1|2) -> Pos::uint8().
link_getPlayerInPos(#recMapInfo{roleID_A = RoleID_A, roleID_B = RoleID_B, playerEts = PlayerEts, paramEx = RecActive}, RoleID, IsSelect, GMMod) ->
  case IsSelect of
    %% 如果该玩家试图取消，则给出已选择的序号
    false ->
      case link_isRoleA(RoleID, RoleID_A, RoleID_B, GMMod) of
        error ->
          %?DEBUG_OUT("[DebugForDate] link_getPlayerInPos 0"),
          0;
        true ->
          %?DEBUG_OUT("[DebugForDate] link_getPlayerInPos ~p", [RecActive#recActive.selectPosA]),
          RecActive#recActive.selectPosA;
        _ ->
          %?DEBUG_OUT("[DebugForDate] link_getPlayerInPos ~p", [RecActive#recActive.selectPosB]),
          RecActive#recActive.selectPosB
      end;
    %% 如果该玩家试图选择，则根据当前坐标计算序号
    _ ->
      case core:queryOnLineRoleByRoleID(RoleID) of
        #rec_OnlinePlayer{code = Code} ->
          case ets:lookup(PlayerEts, Code) of
            [#recMapObject{x = X, y = Y}] ->
              %?DEBUG_OUT("[DebugForDate] link_getPlayerInPos ~p", [{X, Y}]),
              link_getPlayerInPos_R(X, Y);
            _ ->
              ?WARN_OUT("link_getPlayerInPos RoleID(~p) not in the map", [RoleID]),
              0 %% 当前玩家不在改地图
          end;
        _ ->
          ?WARN_OUT("link_getPlayerInPos RoleID(~p) not online", [RoleID]),
          0 %% 当前玩家不在线
      end
  end.

%% 递归得出玩家坐标得出所在区域的序号（不在任何区域则返回0
-spec link_getPlayerInPos_R(X::float(), Y::float()) -> Pos::uint8().
link_getPlayerInPos_R(X, Y) ->
  {CenterX, CenterY} = configGemPointXY(),
  {SizeX, SizeY} = configGemSizeXY(),
  {DistX, DistY} = configGemDistXY(),
  link_getPlayerInPos_R_({X, Y}, {CenterX, CenterY}, {SizeX, SizeY}, {SizeX + DistX, SizeY + DistY}, ?ListMatrixPos).
%% 返回值为intege()时已得出结果
link_getPlayerInPos_R_(_, _, _, _, Acc) when erlang:is_integer(Acc) ->
  %?DEBUG_OUT("[DebugForDate] Acc(~p)", [Acc]),
  Acc;
%% 返回值为列表且仅有一个元素时，判断玩家坐标是否在目标区域内
link_getPlayerInPos_R_({X, Y}, {CX, CY}, {SXS, SYS}, _PD, Acc) when erlang:is_list(Acc), erlang:length(Acc) =:= 1 ->
  %?DEBUG_OUT("[DebugForDate] AllArgument~n~p", [{{X, Y}, {CX, CY}, {SXS, SYS}, _PD, Acc}]),
  case (X >= CX - SXS / 2) andalso (X =< CX + SXS / 2) andalso
    (Y >= CY - SYS / 2) andalso (Y =< CY + SYS / 2) of
    true ->
      [Pos] = Acc,
      Pos;
    _ ->
      0
  end;
%% 返回值为列表且元素量为4的整数倍，需要以四分法继续筛选元素
link_getPlayerInPos_R_({X, Y}, {CX, CY}, PC, {SXB, SYB}, Acc) when erlang:is_list(Acc), erlang:length(Acc) rem 4 =:= 0 ->
  %?DEBUG_OUT("[DebugForDate] AllArgument~n~p", [{{X, Y}, {CX, CY}, PC, {SXB, SYB}, Acc}]),
  CountMax = erlang:length(Acc),
  QuadratMarkHalf = math:sqrt(CountMax) / 4,
  %% 判断玩家坐标在当前区域的象限，以得出新的中心点和元素列表
  {CXN, CYN, AccN} =
    if
      X >= CX andalso Y >= CY ->
        CXN1 = CX + SXB * QuadratMarkHalf,
        CYN1 = CY + SYB * QuadratMarkHalf,
        AccN1 = link_getPlayerInPos_R_Filter(1, Acc),
        {CXN1, CYN1, AccN1};
      X < CX andalso Y >= CY ->
        CXN2 = CX - SXB * QuadratMarkHalf,
        CYN2 = CY + SYB * QuadratMarkHalf,
        AccN2 = link_getPlayerInPos_R_Filter(2, Acc),
        {CXN2, CYN2, AccN2};
      X < CX andalso Y < CY ->
        CXN3 = CX - SXB * QuadratMarkHalf,
        CYN3 = CY - SYB * QuadratMarkHalf,
        AccN3 = link_getPlayerInPos_R_Filter(3, Acc),
        {CXN3, CYN3, AccN3};
      true ->
        CXN4 = CX + SXB * QuadratMarkHalf,
        CYN4 = CY - SYB * QuadratMarkHalf,
        AccN4 = link_getPlayerInPos_R_Filter(4, Acc),
        {CXN4, CYN4, AccN4}
    end,
  link_getPlayerInPos_R_({X, Y}, {CXN, CYN}, PC, {SXB, SYB}, AccN);
%% 返回值为列表且元素量为9，需要执行特殊的四分法筛选元素
link_getPlayerInPos_R_({X, Y}, {CX, CY}, {SXS, SYS}, {SXB, SYB}, Acc) when erlang:is_list(Acc), erlang:length(Acc) =:= 9 ->
  %?DEBUG_OUT("[DebugForDate] AllArgument~n~p", [{{X, Y}, {CX, CY}, {SXS, SYS}, {SXB, SYB}, Acc}]),
  %% 遍历元素，看玩家是否处于9个元素之一的位置
  ListArea = [
    {CX - SXB,  CY - SYB},
    {CX,        CY - SYB},
    {CX + SXB,  CY - SYB},
    {CX - SXB,  CY},
    {CX,        CY},
    {CX + SXB,  CY},
    {CX - SXB,  CY + SYB},
    {CX,        CY + SYB},
    {CX + SXB,  CY + SYB}
  ],
  %?DEBUG_OUT("[DebugForDate] ListArea~n~p", [ListArea]),
  FunCheck =
    fun({CX_, CY_}, {Mark, {Count, Result}}) ->
      case (X >= CX_ - SXS / 2) andalso (X =< CX_ + SXS / 2) andalso
        (Y >= CY_ - SYS / 2) andalso (Y =< CY_ + SYS / 2) of
        true ->
          {true, {Count + 1, Count}};
        _ ->
          {Mark, {Count + 1, Result}}
      end
    end,
  case misc:foldlEx(FunCheck, {false, {1, 0}}, ListArea) of
    {_, {_, 0}} ->
      0;
    {_, {_, Result}} ->
      lists:nth(Result, Acc)
  end;
%% 异常传参检测
link_getPlayerInPos_R_(PA, PB, PC, PD, Acc) ->
  ?ERROR_OUT("link_getPlayerInPos_R_ invalid argument ~p~n~p~n~p", [{PA, PB, PC, PD}, Acc, misc:getStackTrace()]),
  0.

%% 根据象限值筛选列表中的元素
-spec link_getPlayerInPos_R_Filter(
    Quadrat::1|2|3|4,               %% 象限值
    ListPosIn::[uint8(), ...]       %% 旧的递归层元素列表
) ->
  ListPosOut::[uint8(), ...].
link_getPlayerInPos_R_Filter(1, ListPosIn) ->
  CountMax = erlang:length(ListPosIn),
  QuadratMark = erlang:trunc(math:sqrt(CountMax)),
  QuadratMarkHalf = QuadratMark / 2,
  %?DEBUG_OUT("[DebugForDate] ~p", [{QuadratMark, QuadratMarkHalf}]),
  FunFilter1 =
    fun(Element, {Count, Result}) ->
      case (Count div QuadratMark) >= QuadratMarkHalf andalso
        (Count rem QuadratMark) >= QuadratMarkHalf of
        true ->
          {Count + 1, [Element | Result]};
        _ ->
          {Count + 1, Result}
      end
    end,
  {_, ListPosOut} = lists:foldl(FunFilter1, {0, []}, ListPosIn),
  lists:reverse(ListPosOut);
link_getPlayerInPos_R_Filter(2, ListPosIn) ->
  CountMax = erlang:length(ListPosIn),
  QuadratMark = erlang:trunc(math:sqrt(CountMax)),
  QuadratMarkHalf = QuadratMark / 2,
  %?DEBUG_OUT("[DebugForDate] ~p", [{QuadratMark, QuadratMarkHalf}]),
  FunFilter1 =
    fun(Element, {Count, Result}) ->
      case (Count div QuadratMark) >= QuadratMarkHalf andalso
        (Count rem QuadratMark) < QuadratMarkHalf of
        true ->
          {Count + 1, [Element | Result]};
        _ ->
          {Count + 1, Result}
      end
    end,
  {_, ListPosOut} = lists:foldl(FunFilter1, {0, []}, ListPosIn),
  lists:reverse(ListPosOut);
link_getPlayerInPos_R_Filter(3, ListPosIn) ->
  CountMax = erlang:length(ListPosIn),
  QuadratMark = erlang:trunc(math:sqrt(CountMax)),
  QuadratMarkHalf = QuadratMark / 2,
  %?DEBUG_OUT("[DebugForDate] ~p", [{QuadratMark, QuadratMarkHalf}]),
  FunFilter1 =
    fun(Element, {Count, Result}) ->
      case (Count div QuadratMark) < QuadratMarkHalf andalso
        (Count rem QuadratMark) < QuadratMarkHalf of
        true ->
          {Count + 1, [Element | Result]};
        _ ->
          {Count + 1, Result}
      end
    end,
  {_, ListPosOut} = lists:foldl(FunFilter1, {0, []}, ListPosIn),
  lists:reverse(ListPosOut);
link_getPlayerInPos_R_Filter(4, ListPosIn) ->
  CountMax = erlang:length(ListPosIn),
  QuadratMark = erlang:trunc(math:sqrt(CountMax)),
  QuadratMarkHalf = QuadratMark / 2,
  %?DEBUG_OUT("[DebugForDate] ~p", [{QuadratMark, QuadratMarkHalf}]),
  FunFilter1 =
    fun(Element, {Count, Result}) ->
      case (Count div QuadratMark) < QuadratMarkHalf andalso
        (Count rem QuadratMark) >= QuadratMarkHalf of
        true ->
          {Count + 1, [Element | Result]};
        _ ->
          {Count + 1, Result}
      end
    end,
  {_, ListPosOut} = lists:foldl(FunFilter1, {0, []}, ListPosIn),
  lists:reverse(ListPosOut).

%% 判断操作者是否为玩家A
-spec link_isRoleA(RoleID::uint64(), RoleID_A::uint64(), RoleID_B::uint64(), GMMod::0|1|2) -> boolean() | error.
link_isRoleA(RoleID, RoleID_A, _, 0) when RoleID_A =:= RoleID -> true;   %% 正常模式玩家A
link_isRoleA(RoleID, _, RoleID_B, 0) when RoleID_B =:= RoleID -> false;  %% 正常模式玩家B
link_isRoleA(RoleID, RoleID_A, RoleID_B, 0) -> %% 正常模式第三者
  ?ERROR_OUT("link_isRoleA RoleID(~p) is not in MapInfo! RoleID_A(~p) RoleID_B(~p)", [RoleID, RoleID_A, RoleID_B]),
  error;
link_isRoleA(_, _, _, 1) -> true;  %% GM模式强制代替玩家A
link_isRoleA(_, _, _, 2) -> false. %% GM模式强制代替玩家B

%% 检查玩家坐标是否存在误差，返回继续计算使用的坐标或者error
-spec link_checkPosXY_A(RoleID::uint64(), PlayerEts::etsTab(), {XIn::float(), YIn::float()}) -> {XOut::float(), YOut::float()} | error.
link_checkPosXY_A(RoleID, PlayerEts, {XIn, YIn}) ->
  %% 1.获取玩家真实坐标
  case core:queryOnLineRoleByRoleID(RoleID) of
    #rec_OnlinePlayer{code = Code} ->
      case ets:lookup(PlayerEts, Code) of
        [#recMapObject{x = XR, y = YR}] ->
          %% 2.验证传入坐标与真实坐标是否在允许的误差范围内
          case XIn of
            undefined ->
              %% 未使用传入坐标，直接使用真实坐标
              %?DEBUG_OUT("[DebugForDate] link_checkPosXY_A undefined"),
              {XR, YR};
            _ ->
              %% 移动模块允许误差为8
              Distance = misc:calcDistSquare(XIn, YIn, XR, YR),
              case Distance > 8 * 8 of
                true ->
                  %?DEBUG_OUT("[DebugForDate] link_checkPosXY_A src(~p) real(~p)", [{XIn, YIn}, {XR, YR}]),
                  error; %% 误差太大，忽略该操作
                _ ->
                  %%?DEBUG_OUT("[DebugForDate] link_checkPosXY_A src(~p)", [{XIn, YIn}]),
                  {XIn, YIn}  %% 误差在允许范围内，接受该操作
              end
          end;
        _ ->
          %?DEBUG_OUT("[DebugForDate] link_checkPosXY_A not in the map"),
          error %% 该地图上没有该玩家信息，无法获取坐标
      end;
    _ ->
      %?DEBUG_OUT("[DebugForDate] link_checkPosXY_A not online"),
      error %% 玩家不在线，无法获取Code
  end.

%% 检查玩家坐标是否处于或不处于目标位置以执行要求的操作
-spec link_checkPosXY_B(PosXY_Real::{float(), float()}, Pos::uint8(), IsSelect::boolean(), RecActive::#recActive{}) -> boolean().
link_checkPosXY_B({XIn, YIn}, Pos, IsSelect, #recActive{listMatrixCode = ListMatrixCode}) ->
  %?DEBUG_OUT("[DebugForDate] link_checkPosXY_B ~p", [Pos]),
  case Pos > 0 andalso Pos =< 36 of
    true ->
      Code = lists:nth(Pos, ListMatrixCode),
      case Code of
        0 ->
          %% 宝石已经被消除，忽略该操作
          %?DEBUG_OUT("[DebugForDate] link_checkPosXY_B empty ~p", [Pos]),
          false;
        _ ->
          {XL, YT} = getGemPosLTByPos(Pos),
          {SizeX, SizeY} = configGemSizeXY(),
          IsIn =
            XIn >= XL - SizeX/2 andalso XIn =< XL + SizeX/2 andalso
              YIn >= YT - SizeY/2 andalso YIn =< YT + SizeY/2,
          case IsSelect of
            true ->
              IsIn;
            _ ->
              true
          end
      end;
    _ ->
      %?DEBUG_OUT("[DebugForDate] link_checkPosXY_B ~p", [Pos]),
      false %% 宝石位置异常，恒为false
  end.

%% 执行可能的连接操作
-spec link_afterCheck(MapInfoOld::#recMapInfo{}, {IsRoleA::boolean(), Pos::uint8(), IsSelect::boolean()}) ->  MapInfoNew::#recMapInfo{}.
link_afterCheck(#recMapInfo{roleID_A = RoleID_A, roleID_B = RoleID_B, playerEts = PlayerEts, npcEts = NpcEts,paramEx = RecActive} = MapInfoOld, {IsRoleA, Pos, IsSelect}) ->
  %?DEBUG_OUT("[DebugForDate] link_afterCheck"),
  %% 1.获得新的选中状态
  RoleID =
    case IsRoleA of
      true ->
        RoleID_A;
      _ ->
        RoleID_B
    end,
  {XLT, YLT} = getGemPosLTByPos(Pos),
%%  {SizeX, SizeY} = configGemSizeXY(),
  case link_afterCheck_select(IsRoleA, Pos, IsSelect, RecActive) of
    {false, _, _} ->
      %% 2.1过滤掉无效操作
      %%  NetMsg1 =
      %%    #pk_GS2U_DateLink_Select_Ack{
      %%      roleID    = RoleID,
      %%      index     = Pos,
      %%      x         = XLT,
      %%      y         = YLT,
      %%      isSelect  = IsSelect,
      %%      listGemMatrix = RecActive#recActive.listMatrixValue
      %%    },
      %%  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsg1),
      %%  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsg1),
      MapInfoOld;
    {_, false, {PosA1, PosB1}} ->
      %% 2.2操作有效，但不需要执行连接，仅更新数据
      %?DEBUG_OUT("[DebugForDate] link_afterCheck just update ~p", [{PosA1, PosB1}]),
      case IsSelect of
        true->
          case lists:nth(Pos, RecActive#recActive.listMatrixValue) =:= 100 of
            true ->
              linkGoodBox(MapInfoOld,Pos,IsRoleA);
            _->

             %% FunGetCodeList =
             %%   fun(#recMapObject{code = Code,x = FX,y = FY},{Index ,L}) ->
             %%     ?ERROR_OUT("NpcEts Code  X  Y :~p,~p,~p,~p", [Code,FX,FY,Index]),
             %%     {Index+1 ,[Code | L]}
             %%   end,
             %% {_,CodeList} = ets:foldl(FunGetCodeList,{1, []},NpcEts),
              %% 操作有效但未形成连接的消息反馈
              NetMsg1 =
                #pk_GS2U_DateLink_Select_Ack{
                  roleID    = RoleID,
                  index     = Pos,
                  x         = XLT,
                  y         = YLT,
                  isSelect  = IsSelect,
                  listGemMatrix = RecActive#recActive.listMatrixValue
                },
              acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsg1),
              acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsg1),
              MapInfoNew1 =
                MapInfoOld#recMapInfo{
                  paramEx = RecActive#recActive{
                    selectPosA = PosA1,
                    selectPosB = PosB1
                  }
                },
              acDateState:replaceMapInfo(MapInfoNew1),
              MapInfoNew1
          end;
        _->
          %% 操作有效但未形成连接的消息反馈
          NetMsg1 =
            #pk_GS2U_DateLink_Select_Ack{
              roleID    = RoleID,
              index     = Pos,
              x         = XLT,
              y         = YLT,
              isSelect  = IsSelect,
              listGemMatrix = RecActive#recActive.listMatrixValue
            },
          acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsg1),
          acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsg1),

          MapInfoNew1 =
            MapInfoOld#recMapInfo{
              paramEx = RecActive#recActive{
                selectPosA = PosA1,
                selectPosB = PosB1
              }
            },
          acDateState:replaceMapInfo(MapInfoNew1),
          MapInfoNew1
      end;
    {_, _, {PosA2, PosB2}} ->
      %% 2.3操作有效，且需要执行连接操作
      %?DEBUG_OUT("[DebugForDate] link_afterCheck update and link ~p", [{PosA2, PosB2}]),
      %% 补发选中消息

      NetMsg2 =
        #pk_GS2U_DateLink_Select_Ack{
          roleID    = RoleID,
          index     = Pos,
          x         = XLT,
          y         = YLT,
          isSelect  = IsSelect,
          listGemMatrix = RecActive#recActive.listMatrixValue
        },
      acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsg2),
      acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsg2),
      MapInfoNew2 =
        MapInfoOld#recMapInfo{
          paramEx = RecActive#recActive{
            selectPosA = PosA2,
            selectPosB = PosB2
          }
        },

      acDateState:replaceMapInfo(MapInfoNew2),
      %% 3.检查连接是否是否正确
      ValueA = lists:nth(PosA2, RecActive#recActive.listMatrixValue),
      ValueB = lists:nth(PosB2, RecActive#recActive.listMatrixValue),


      if
        ValueA =:=100 ->
          linkGoodBox(MapInfoNew2,PosA2,IsRoleA);
        ValueB =:=100 ->
          linkGoodBox(MapInfoNew2,PosB2,IsRoleA);
        true ->
          case ValueA>0 andalso ValueB >0 of
            true ->
              case ValueA =:= ValueB of
                true ->
                  %% 4.1正确连接的操作：清除NPC对象、增加积分、连击计数、根据连击计数获得增益BUFF、概率在清除NPC对象其中一点刷怪

                  linkGood(MapInfoNew2, IsRoleA);
                _ ->
                  %% 4.2错误连接的操作：重置连击计数、获得负面BUFF
                  %%linkBad(MapInfoNew2, IsRoleA)

                  MapInfoNew2
              end;
            _ ->
              skip
          end
      end
  end.

%% 获得新的选中状态
-spec link_afterCheck_select(IsRoleA::boolean(), Pos::uint8(), IsSelect::boolean(), RecActive::#recActive{}) -> {WillUpdate::boolean(), WillLink::boolean(), {PosA::uint8(), PosB::uint8()}}.
link_afterCheck_select(true, Pos, true, #recActive{selectPosA = SelectPosA, selectPosB = SelectPosB}) when SelectPosA =:= 0 ->
  {true, SelectPosB > 0 andalso Pos =/= SelectPosB, {Pos, SelectPosB}};   %% 有效的选中操作A，从未选中到已选中
link_afterCheck_select(true, _, true, #recActive{selectPosA = SelectPosA, selectPosB = SelectPosB}) ->
  {false, false, {SelectPosA, SelectPosB}};                               %% 无效的选中操作A，不符合有效选择的情况
link_afterCheck_select(true, Pos, false, #recActive{selectPosA = SelectPosA, selectPosB = SelectPosB}) when Pos =:= SelectPosA, Pos =/= 0 ->
  {true, false, {0, SelectPosB}};                                         %% 有效的取消操作A，从选中到未选中，操作对象与已经选择的对象一致
link_afterCheck_select(true, _, false, #recActive{selectPosA = SelectPosA, selectPosB = SelectPosB}) ->
  {false, false, {SelectPosA, SelectPosB}};                               %% 无效的取消操作A，不符合有效取消的情况
link_afterCheck_select(false, Pos, true, #recActive{selectPosA = SelectPosA, selectPosB = SelectPosB}) when SelectPosB =:= 0 ->
  {true, SelectPosA > 0 andalso Pos =/= SelectPosA, {SelectPosA, Pos}};   %% 有效的选中操作B
link_afterCheck_select(false, _, true, #recActive{selectPosA = SelectPosA, selectPosB = SelectPosB}) ->
  {false, false, {SelectPosA, SelectPosB}};                               %% 无效的选中操作B
link_afterCheck_select(false, Pos, false, #recActive{selectPosA = SelectPosA, selectPosB = SelectPosB}) when Pos =:= SelectPosB, Pos =/= 0 ->
  {true, false, {SelectPosA, 0}};                                         %% 有效的取消操作B
link_afterCheck_select(false, _, false, #recActive{selectPosA = SelectPosA, selectPosB = SelectPosB}) ->
  {false, false, {SelectPosA, SelectPosB}}.                               %% 无效的取消操作B


%%撞到箱子
-spec linkGoodBox(MapInfo::#recMapInfo{}, Pos::uint8(),  IsRoleA::boolean()) -> MapInfoNew::#recMapInfo{}.
linkGoodBox(#recMapInfo{
  mapPID        = MapPid,
  mapID         = MapID,
  timerRefMain  = TimerRefMain,
  roleID_A      = RoleID_A,
  roleID_B      = RoleID_B,
  playerEts     = PlayerEts,
  monsterEts    = MonsterEts,
  paramEx       = RecActive
} = MapInfo, Pos,IsRoleA)->
  #recActive{
    score             = Score,
    timeEnd           = TimeEnd,
    listMatrixValue   = ListMatrixValue,
    listMatrixCode    = ListMatrixCode
  } = RecActive,


  RoleID =
    case IsRoleA of
      true ->
        RoleID_A;
      _ ->
        RoleID_B
    end,
  %% 1.清除指定NPC
  ListMatrixCodeNew = linkGood_ClearNpc(Pos, 0, ListMatrixCode, MapPid),
  %% 1.清除指定NPC的索引位置为0
  ListMatrixValueNew = linkGood_ClearMatrixValue(Pos, 0, ListMatrixValue),

  TimeNow = time:getSyncUTCTimeFromDBS(),

  RecActiveNew1 =
    case IsRoleA of
      true ->
        RecActive#recActive{

          listMatrixCode  = ListMatrixCodeNew,
          listMatrixValue = ListMatrixValueNew,
          selectPosA = 0
        };
      _ ->
        RecActive#recActive{

          listMatrixCode  = ListMatrixCodeNew,
          listMatrixValue = ListMatrixValueNew,
          selectPosB = 0
        }
    end,


  %% 中途合并一下数据便于后续操作
  ScoreMax = configScoreMax(),
  ScoreList =  configGemScore(),
  Bufflist =  configRandBuffCfg(),
  GetScore =  lists:nth( misc:rand(1, erlang:length(ScoreList)),ScoreList),
  ScoreNew1 = erlang:min(ScoreMax, Score + GetScore),
  AddRandBuff  =  lists:nth(misc:rand(1,  erlang:length(Bufflist)),Bufflist),

  %% 补发取消消息
  {XLT_A, YLT_A} = getGemPosLTByPos(Pos),
%%  {SizeX, SizeY} = configGemSizeXY(),
  NetMsg1 =
    #pk_GS2U_DateLink_Select_Ack{
      roleID    = RoleID,
      index     = Pos,
      x         = XLT_A,
      y         = YLT_A,
      isSelect  = false,
      listGemMatrix = ListMatrixValueNew
    },
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsg1),
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsg1),

  MapInfoNew3=
    case AddRandBuff =:=1 of
      true ->
        %% 4.随机增益
        case linkGood_Buff(0, RoleID_A, RoleID_B, TimeNow, PlayerEts, MonsterEts, TimeEnd, TimerRefMain, MapPid) of
          {?BuffTypeWhenLinkGood_None, _} ->
            %?DEBUG_OUT("[DebugForDate] linkGood BuffTypeWhenLinkGood_None"),
            MapInfo#recMapInfo{
              paramEx = RecActiveNew1
            };
          {?BuffTypeWhenLinkGood_Score, AddScore} ->
            %?DEBUG_OUT("[DebugForDate] linkGood BuffTypeWhenLinkGood_Score ~p", [AddScore]),
            ScoreNew2 = erlang:min(ScoreMax, ScoreNew1 + AddScore),
            NetMsgAddSocre =
              #pk_GS2U_DateLink_BuffAddScore_Sync{
                score     = AddScore,
                scoreAll  = ScoreNew2
              },
            acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsgAddSocre),
            acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsgAddSocre),
            MapInfo#recMapInfo{
              paramEx = RecActiveNew1#recActive{
                score = ScoreNew2
              }
            };
          {?BuffTypeWhenLinkGood_Power, {PowerNew, TimeMorePowerNew}} ->
            %?DEBUG_OUT("[DebugForDate] linkGood BuffTypeWhenLinkGood_Pwoer ~p", [PowerNew]),
            NetMsgPower =
              #pk_GS2U_DateLink_BuffPower_Sync{
                time  = TimeMorePowerNew - TimeNow,
                power = PowerNew
              },
            acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsgPower),
            acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsgPower),
            MapInfo#recMapInfo{
              paramEx = RecActiveNew1#recActive{
                timeMorePower = TimeMorePowerNew,
                power         = PowerNew
              }
            };
          {?BuffTypeWhenLinkGood_SpeedUp, _} ->
            %?DEBUG_OUT("[DebugForDate] linkGood BuffTypeWhenLinkGood_SpeedUp", []),
            MapInfo#recMapInfo{
              paramEx = RecActiveNew1
            };
          {?BuffTypeWhenLinkGood_AddTime, {TimeEndNew, TimerRefMainNew}} ->
            %?DEBUG_OUT("[DebugForDate] linkGood BuffTypeWhenLinkGood_AddTime ~p", [TimeEndNew - TimeEnd]),
            NetMsgAddTime =
              #pk_GS2U_DateLink_BuffAddTime_Sync{
                timeAdd       = TimeEndNew - TimeEnd,
                timeRemainder = TimeEndNew - TimeNow
              },
            acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsgAddTime),
            acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsgAddTime),
            MapInfo#recMapInfo{
              timerRefMain = TimerRefMainNew,
              paramEx = RecActiveNew1#recActive{
                timeEnd = TimeEndNew
              }
            }
        end;
      _->
        MapInfoNew_0 =  linkBad(MapInfo, IsRoleA),
        MapInfoNew_0#recMapInfo{
          paramEx = RecActiveNew1
        }
    end,
  acDateState:replaceMapInfo(MapInfoNew3),
  MapInfoNew3.

%% 正确连接
-spec linkGood(MapInfo::#recMapInfo{}, IsRoleA::boolean()) -> MapInfoNew::#recMapInfo{}.
linkGood(#recMapInfo{
  mapPID        = MapPid,
  mapID         = MapID,
  timerRefMain  = TimerRefMain,
  roleID_A      = RoleID_A,
  roleID_B      = RoleID_B,
  playerEts     = PlayerEts,
  monsterEts    = MonsterEts,
  paramEx       = RecActive
} = MapInfo, IsRoleA) ->
  %?DEBUG_OUT("[DebugForDate] linkGood ~p", [IsRoleA]),
  #recActive{
    score             = Score,
    timeEnd           = TimeEnd,
    listMatrixValue   = ListMatrixValue,
    listMatrixCode    = ListMatrixCode,
    timeMorePower     = TimeMorePower,
    power             = Power,
    combo             = Combo,
    allcomboNum       =  AllcomboNum,
    comboMax          = ComboMax,
    lastTimeCombo     = LastTimeCombo,
    selectPosA        = PosA,
    selectPosB        = PosB
  } = RecActive,
  TimeNow = time:getSyncUTCTimeFromDBS(),
  %% 1.清除指定NPC
  ListMatrixCodeNew = linkGood_ClearNpc(PosA, PosB, ListMatrixCode, MapPid),
  %% 1.清除指定NPC的索引位置为0
  ListMatrixValueNew = linkGood_ClearMatrixValue(PosA, PosB, ListMatrixValue),
  %% 2.增加积分
  GetScore = linkGood_GetScore(PosA, ListMatrixValue, TimeMorePower, Power, TimeNow),
  %?DEBUG_OUT("[DebugForDate] linkGood GetScore ~p", [GetScore]),
  %% 3.计算连击
  {ComboNew, ComboMaxNew, LastTimeComboNew} = linkGood_Combo(Combo, ComboMax, LastTimeCombo, TimeNow),
  %% 3.连击总次数
  AllcomboNumNew = AllcomboNum+1,
  ListBox = configComboNum(),

  %% 3.刷箱子

  ReffushNum =  case lists:keyfind(AllcomboNumNew, 1, ListBox) of
                  {_, Num} ->
                    Num;
                  _ ->
                    0
                end,
  ListMatrixValueNew_ =
    case ReffushNum > 0 of
      true->
        F= fun(E,{Index,L})->
          case E =:=0 of
            true->
              {Index+1,[Index|L]};
            _->
              {Index+1,L}
          end
           end,
        {_,ListCanReffushValue} = lists:foldl(F, {1,[]}, ListMatrixValueNew),
        RandomBoxIndex =  misc:randUniqueFromList(ReffushNum,ListCanReffushValue),
        linkGood_AddBoxValue(ListMatrixValueNew,MapPid,RandomBoxIndex);
      _ ->
        ListMatrixValueNew
    end,
  %% 3.刷箱子
  %?DEBUG_OUT("[DebugForDate] linkGood ComboNew ~p", [ComboNew]),
  %% 中途合并一下数据便于后续操作
  ScoreMax = configScoreMax(),
  ScoreNew1 = erlang:min(ScoreMax, Score + GetScore),
  %?DEBUG_OUT("[DebugForDate] linkGood ScoreNew1 ~p", [ScoreNew1]),
  RecActiveNew1 =
    RecActive#recActive{
      score           = ScoreNew1,
      listMatrixCode  = ListMatrixCodeNew,
      listMatrixValue = ListMatrixValueNew_,
      combo           = ComboNew,
      allcomboNum     = AllcomboNumNew,
      comboMax        = ComboMaxNew,
      lastTimeCombo   = LastTimeComboNew,
      selectPosA      = 0,
      selectPosB      = 0
    },
  %% 发送连接成功的消息
  {PosA_, PosB_} =
    case IsRoleA of
      true ->
        {PosA, PosB};
      _ ->
        {PosB, PosA}
    end,
  {XLTA, YLTA} = getGemPosLTByPos(PosA_),
  {XLTB, YLTB} = getGemPosLTByPos(PosB_),
%%  {SizeX, SizeY} = configGemSizeXY(),
  NetMsgLinkG =
    #pk_GS2U_DateLink_Link_Sync{
      indexA    = PosA_,
      xA        = XLTA ,
      yA        = YLTA,
      indexB    = PosB_,
      xB        = XLTB,
      yB        = YLTB,
      combo     = ComboNew,
      comboMax  = ComboMaxNew,
      score     = GetScore,
      scoreAll  = ScoreNew1,
      listGemMatrix = ListMatrixValueNew_
    },
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsgLinkG),
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsgLinkG),
  %% 补发取消消息
  {XLT_A, YLT_A} = getGemPosLTByPos(PosA_),
  {XLT_B, YLT_B} = getGemPosLTByPos(PosB_),
%%  {SizeX, SizeY} = configGemSizeXY(),
  NetMsg1 =
    #pk_GS2U_DateLink_Select_Ack{
      roleID    = RoleID_A,
      index     = PosA_,
      x         = XLT_A,
      y         = YLT_A,
      isSelect  = false,
      listGemMatrix = ListMatrixValueNew_
    },
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsg1),
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsg1),
  NetMsg2 =
    #pk_GS2U_DateLink_Select_Ack{
      roleID    = RoleID_B,
      index     = PosB_,
      x         = XLT_B,
      y         = YLT_B,
      isSelect  = false,
      listGemMatrix = ListMatrixValueNew_
    },
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsg2),
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsg2),
  %% 4.随机增益

  MapInfoNew2 =  MapInfo#recMapInfo{
    paramEx = RecActiveNew1
  },
%% MapInfoNew2 =
%%   case linkGood_Buff(ComboNew, RoleID_A, RoleID_B, TimeNow, PlayerEts, MonsterEts, TimeEnd, TimerRefMain, MapPid) of
%%     {?BuffTypeWhenLinkGood_None, _} ->
%%       %?DEBUG_OUT("[DebugForDate] linkGood BuffTypeWhenLinkGood_None"),
%%       MapInfo#recMapInfo{
%%         paramEx = RecActiveNew1
%%       };
%%     {?BuffTypeWhenLinkGood_Score, AddScore} ->
%%       %?DEBUG_OUT("[DebugForDate] linkGood BuffTypeWhenLinkGood_Score ~p", [AddScore]),
%%       ScoreNew2 = erlang:min(ScoreMax, ScoreNew1 + AddScore),
%%       NetMsgAddSocre =
%%         #pk_GS2U_DateLink_BuffAddScore_Sync{
%%           score     = AddScore,
%%           scoreAll  = ScoreNew2
%%         },
%%       acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsgAddSocre),
%%       acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsgAddSocre),
%%       MapInfo#recMapInfo{
%%         paramEx = RecActiveNew1#recActive{
%%           score = ScoreNew2
%%         }
%%       };
%%     {?BuffTypeWhenLinkGood_Power, {PowerNew, TimeMorePowerNew}} ->
%%       %?DEBUG_OUT("[DebugForDate] linkGood BuffTypeWhenLinkGood_Pwoer ~p", [PowerNew]),
%%       NetMsgPower =
%%         #pk_GS2U_DateLink_BuffPower_Sync{
%%           time  = TimeMorePowerNew - TimeNow,
%%           power = PowerNew
%%         },
%%       acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsgPower),
%%       acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsgPower),
%%       MapInfo#recMapInfo{
%%         paramEx = RecActiveNew1#recActive{
%%           timeMorePower = TimeMorePowerNew,
%%           power         = PowerNew
%%         }
%%       };
%%     {?BuffTypeWhenLinkGood_SpeedUp, _} ->
%%       %?DEBUG_OUT("[DebugForDate] linkGood BuffTypeWhenLinkGood_SpeedUp", []),
%%       MapInfo#recMapInfo{
%%         paramEx = RecActiveNew1
%%       };
%%     {?BuffTypeWhenLinkGood_AddTime, {TimeEndNew, TimerRefMainNew}} ->
%%       %?DEBUG_OUT("[DebugForDate] linkGood BuffTypeWhenLinkGood_AddTime ~p", [TimeEndNew - TimeEnd]),
%%       NetMsgAddTime =
%%         #pk_GS2U_DateLink_BuffAddTime_Sync{
%%           timeAdd       = TimeEndNew - TimeEnd,
%%           timeRemainder = TimeEndNew - TimeNow
%%         },
%%       acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsgAddTime),
%%       acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsgAddTime),
%%       MapInfo#recMapInfo{
%%         timerRefMain = TimerRefMainNew,
%%         paramEx = RecActiveNew1#recActive{
%%           timeEnd = TimeEndNew
%%         }
%%       }
%%   end,
  %?DEBUG_OUT("[DebugForDate] linkGood AllScore ~p", [MapInfoNew2#recMapInfo.paramEx#recActive.score]),
  acDateState:replaceMapInfo(MapInfoNew2),

  %% 5.概率刷怪
  randMonster(MapPid, MapID, PosA, PosB),
  %% 6.如果达到最大积分则进入结算
  #recMapInfo{paramEx = #recActive{score = ScoreNow}} = MapInfoNew2,
  case ScoreNow >= ScoreMax of
    true ->
      %?DEBUG_OUT("[DebugForDate] linkGood ScoreNow ~p ScoreMax ~p", [ScoreNow, ScoreMax]),
      settle(MapInfoNew2, ?SettleReason_ScoreMax, 0);
    _ ->
      %% 7.如果所有宝石都被消除则由系统刷新新的宝石
      FunCheck =
        fun(Code, {_, 0}) ->
          {Code > 0, 0}
        end,
      {IsContinue, _} = misc:foldlEx(FunCheck, {false, 0}, ListMatrixCodeNew),
      case IsContinue of
        false ->
          createMatrix(MapInfoNew2, 0);
        _ ->
          MapInfoNew2
      end
  end.

%% 清除指定NPC
-spec linkGood_ClearNpc(PosA::uint8(), PosB::uint8(), ListMatrixCode::[uint64(), ...], MapPid::pid()) -> ListMatrixCodeNew::[uint64(), ...].
linkGood_ClearNpc(PosA, PosB, ListMatrixCode, MapPid) ->
  %?DEBUG_OUT("[DebugForDate] linkGood_ClearNpc ~p", [{PosA, PosB, ListMatrixCode}]),
  FunClear =
    fun(E, {C, L1, L2}) ->
      case C of
        PosA ->
          {C + 1, [0 | L1], [E | L2]};
        PosB ->
          {C + 1, [0 | L1], [E | L2]};
        _ ->
          {C + 1, [E | L1], L2}
      end
    end,
  {_, ListMatrixCodeNewR, CodeList} = lists:foldl(FunClear, {1, [], []}, ListMatrixCode),
  %?DEBUG_OUT("[DebugForDate] link_afterCheck_ClearNpc ~p", [{PosA, PosB, ListMatrixCodeNewR}]),
  acDateLogic:clearObject(MapPid, {?CodeTypeNPC, CodeList}),
  lists:reverse(ListMatrixCodeNewR).


%% 清除指定位置索引
-spec linkGood_ClearMatrixValue(PosA::uint8(), PosB::uint8(), ListMatrixValue::[uint64(),...])-> ListMatrixValueNewR::[uint64(), ...].
linkGood_ClearMatrixValue(PosA, PosB, ListMatrixValue) ->
  %?DEBUG_OUT("[DebugForDate] linkGood_ClearNpc ~p", [{PosA, PosB, ListMatrixCode}]),
  FunClear =
    fun(E, {C, L1}) ->
      case C of
        PosA ->
          {C + 1, [0 | L1]};
        PosB ->
          {C + 1, [0 | L1]};
        _ ->
          {C + 1, [E | L1]}
      end
    end,
  {_, ListMatrixValueNewR} = lists:foldl(FunClear, {1, []}, ListMatrixValue),
  %?DEBUG_OUT("[DebugForDate] link_afterCheck_ClearNpc ~p", [{PosA, PosB, ListMatrixCodeNewR}]),
  %%acDateLogic:clearObject(MapPid, {?CodeTypeNPC, CodeList}),
  lists:reverse(ListMatrixValueNewR).

%% 添加宝箱index到LIST
-spec linkGood_AddBoxValue(ListMatrixValue::[uint64(),...],MapPid::pid(),ListBoxIndex::[uint64(),...])-> ListMatrixValueNewR::[uint64(), ...].
linkGood_AddBoxValue( ListMatrixValue,MapPid,ListBoxIndex) ->
  %?DEBUG_OUT("[DebugForDate] linkGood_ClearNpc ~p", [{PosA, PosB, ListMatrixCode}]),
  FunAdd =
    fun(E, {C, L1}) ->
      case lists:member(C,ListBoxIndex) of
        true ->
          randBox(MapPid,C),
          {C + 1, [100 | L1]};
        _ ->
          {C + 1, [E | L1]}
      end
    end,
  {_, ListMatrixValueNewR} = lists:foldl(FunAdd, {1, []}, ListMatrixValue),
  %?DEBUG_OUT("[DebugForDate] link_afterCheck_ClearNpc ~p", [{PosA, PosB, ListMatrixCodeNewR}]),
  %%acDateLogic:clearObject(MapPid, {?CodeTypeNPC, CodeList}),
  lists:reverse(ListMatrixValueNewR).

%% 增加积分
-spec linkGood_GetScore(Pos::uint8(), ListMatrixValue::[uint8(), ...], TimeMorePower::uint32(), Power::uint8(), TimeNow::uint32()) -> GetScore::uint8().
linkGood_GetScore(Pos, ListMatrixValue, TimeMorePower, Power, TimeNow) ->
  %% 1.获取基本积分
  Value = lists:nth(Pos, ListMatrixValue),
  %% 2.根据BUFF计算本次操作最终得分
  case TimeMorePower >= TimeNow of
    true ->
      %% 多倍积分
      erlang:trunc(Value * Power);
    _ ->
      %% 单倍积分
      Value
  end.

%% 连击计数
-spec linkGood_Combo(Combo::uint8(), ComboMax::uint8(), LastTimeCombo::uint32(), TimeNow::uint32()) -> {ComboNew::uint8(), ComboMaxNew::uint8(), LastTimeComboNew::uint32()}.
linkGood_Combo(Combo, ComboMax, LastTimeCombo, TimeNow) ->
  ComboNew =
    case LastTimeCombo + configTime_Combo() >= TimeNow of
      true ->
        Combo + 1;
      _ ->
        1
    end,
  {ComboNew, erlang:max(ComboNew, ComboMax), TimeNow}.

%% 随机增益
-spec linkGood_Buff(Combo::uint8(), RoleID_A::uint8(), RoleID_B::uint8(), TimeNow::uint32(), PlayerEts::etsTab(), MonsterEts::etsTab(), TimeEnd::uint32(), TimerRefMain::term(), MapPid::pid()) -> {BuffType::type_btwlg(), ExData::term()}.
linkGood_Buff(Combo, RoleID_A, RoleID_B, TimeNow, PlayerEts, MonsterEts, TimeEnd, TimerRefMain, MapPid) ->
  %% 连击数为配置的整数倍时触发增益
  %% ComboBuff = configComboBuff(),
  %%case Combo / ComboBuff =:= erlang:float(erlang:trunc(Combo / ComboBuff)) of
  %% true ->
  %% 女神使用技能
  %%     monsterUseSkill(
  %%       configMonsterID_God(),
  %%       configMonsterSkillID_God(),
  %%       MonsterEts,
  %%       MapPid
  %%     ),
  %% 随机产生增益效果
  ListRandBuffType = configRandBuffType(),
  Count = erlang:length(ListRandBuffType),
  BuffType = lists:nth(misc:rand(1, Count), ListRandBuffType),
  case BuffType of
    ?BuffTypeWhenLinkGood_Score ->
      %% 直接加分
      ListRandAddScore = configRandAddScore(),
      CountAdd = erlang:length(ListRandAddScore),
      AddScore = lists:nth(misc:rand(1, CountAdd), ListRandAddScore),
      %% 额外补充BUFF以支持特效展示
      BuffID_AddScore = configBuffID_AddScore(),
      addBuff(RoleID_A, PlayerEts, BuffID_AddScore),
      addBuff(RoleID_B, PlayerEts, BuffID_AddScore),
      NetMsgBuffAddScore =
        #pk_GS2U_DateLink_BuffBuff_Sync{
          buffID = BuffID_AddScore
        },
      acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsgBuffAddScore),
      acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsgBuffAddScore),
      {BuffType, AddScore};
    ?BuffTypeWhenLinkGood_Power ->
      %% 增加（重置）多倍积分BUFF
      ListRandPower = configRandPower(),
      CountPower = erlang:length(ListRandPower),
      Power = lists:nth(misc:rand(1, CountPower), ListRandPower),
      ListRandTime_Power = configRandTime_Power(),
      CountTime_Power = erlang:length(ListRandTime_Power),
      Time_Power = lists:nth(misc:rand(1, CountTime_Power), ListRandTime_Power),
      %% 额外补充BUFF以支持特效展示
      BuffID_Power = configBuffID_Power(),
      addBuff(RoleID_A, PlayerEts, BuffID_Power),
      addBuff(RoleID_B, PlayerEts, BuffID_Power),
      NetMsgBuffPower =
        #pk_GS2U_DateLink_BuffBuff_Sync{
          buffID = BuffID_Power
        },
      acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsgBuffPower),
      acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsgBuffPower),
      {BuffType, {Power, TimeNow + Time_Power}};
    ?BuffTypeWhenLinkGood_SpeedUp ->
      %% 加速
      BuffID_Speed = configBuffID_SpeedUp(),
      addBuff(RoleID_A, PlayerEts, BuffID_Speed),
      addBuff(RoleID_B, PlayerEts, BuffID_Speed),
      NetMsgBuffSpeed =
        #pk_GS2U_DateLink_BuffBuff_Sync{
          buffID = BuffID_Speed
        },
      acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsgBuffSpeed),
      acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsgBuffSpeed),
      {BuffType, BuffID_Speed};
    ?BuffTypeWhenLinkGood_AddTime ->
      %% 增加游戏时间
      case erlang:is_reference(TimerRefMain) of
        true ->
          erlang:cancel_timer(TimerRefMain);
        _ ->
          skip
      end,
      LisrRandAddTime = configRandAddTime(),
      CountTime_Add = erlang:length(LisrRandAddTime),
      Time_Add = lists:nth(misc:rand(1, CountTime_Add), LisrRandAddTime),
      TimeEndNew = TimeEnd + Time_Add,
      TimerRefMainNew =
        acDateLogic:setTimerMain(
          (TimeEndNew - TimeNow) * 1000,
          MapPid,
          #recAckData{
            activeID  = ?DateActiveID_Link,
            paramEx   = ?ActiveState_Link
          }
        ),
      %% 额外补充BUFF以支持特效展示
      BuffID_AddTime = configBuffID_AddTime(),
      addBuff(RoleID_A, PlayerEts, BuffID_AddTime),
      addBuff(RoleID_B, PlayerEts, BuffID_AddTime),
      NetMsgBuffAddTime =
        #pk_GS2U_DateLink_BuffBuff_Sync{
          buffID = BuffID_AddTime
        },
      acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsgBuffAddTime),
      acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsgBuffAddTime),
      {BuffType, {TimeEndNew, TimerRefMainNew}};
    _->
      {?BuffTypeWhenLinkGood_None, 0}
  end.
%%  _ ->
%%   {?BuffTypeWhenLinkGood_None, 0}
%% end.

%% 向指定用户增加指定BUFF
-spec addBuff(RoleID::uint64(), PlayerEts::etsTab(), BuffID::uint()) -> ok.
addBuff(RoleID, PlayerEts, BuffID) ->
  case acDateLogic:getPlayerPidNetPidFromThisMap(RoleID, PlayerEts) of
    undefined ->
      skip;
    {Pid, _} ->
      psMgr:sendMsg2PS(Pid, date_link_addBuffSync, BuffID)
  end,
  ok.



%% 概率刷怪
-spec randMonster(MapPid::pid(), MapID::uint(), PosA::uint8(), PosB::uint8()) -> ok.
randMonster(MapPid, MapID, PosA, PosB) ->
  %% 1.随机找个怪
  ListRandMonsterID = configRandMonsterID(),
  Count = erlang:length(ListRandMonsterID),
  MonsterID = lists:nth(misc:rand(1, Count), ListRandMonsterID),
  case MonsterID > 0 of
    true ->
      %% 2.随机找个坐标
      Pos =
        case misc:rand(0, 1) of
          0 -> PosA;
          _ -> PosB
        end,
      {X2, Y2} = getGemPosLTByPos(Pos),
%%      {SizeX, SizeY} = configGemSizeXY(),
%%      X2 = X1 + SizeX / 2, %% 中心点校正
%%      Y2 = Y1 + SizeY / 2, %% 中心点校正
      Arg =
        #recSpawnMonster{
          id      = MonsterID,
          mapID   = MapID,
          mapPid  = MapPid,
          x       = X2,
          y       = Y2,
          groupID = 0
        },
      acDateLogic:spawnObject(MapPid, Arg);
    _ ->
      skip
  end,
  ok.

%% 错误连接
-spec linkBad(MapInfo::#recMapInfo{}, IsRoleA::boolean()) -> MapInfoNew::#recMapInfo{}.
linkBad(#recMapInfo{roleID_A = RoleID_A, roleID_B = RoleID_B, playerEts = PlayerEts, monsterEts = MonsterEts, paramEx = RecActive, mapPID = MapPid} = MapInfoOld, IsRoleA) ->
  %?DEBUG_OUT("[DebugForDate] linkBad ~p", [IsRoleA]),
  %% 重置连击计数
  #recActive{
    selectPosA  = PosA,
    selectPosB  = PosB,
    comboMax    = ComboMax,
    score       = Score
  } = RecActive,
  MapInfoNew =
    MapInfoOld#recMapInfo{
      paramEx = RecActive#recActive{
        combo         = 0,
        lastTimeCombo = 0
      }
    },
  acDateState:replaceMapInfo(MapInfoNew),
%%  %% 发送连接失败的消息
%%  {PosA_, PosB_} =
%%    case IsRoleA of
%%      true ->
%%        {PosA, PosB};
%%      _ ->
%%        {PosB, PosA}
%%    end,
%%  {XLTA, YLTA} = getGemPosLTByPos(PosA_),
%%  {XLTB, YLTB} = getGemPosLTByPos(PosB_),
%%%%  {SizeX, SizeY} = configGemSizeXY(),
%%  NetMsgLinkB =
%%    #pk_GS2U_DateLink_Link_Sync{
%%      indexA    = PosA_,
%%      xA        = XLTA,
%%      yA        = YLTA,
%%      indexB    = PosB_,
%%      xB        = XLTB,
%%      yB        = YLTB,
%%      combo     = 0,
%%      comboMax  = ComboMax,
%%      score     = 0,
%%      scoreAll  = Score
%%    },
%%  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsgLinkB),
%%  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsgLinkB),
  %% 随机Debuff
  ListRandDebuffType = configRandDebuffType(),
  Count = erlang:length(ListRandDebuffType),
  DebuffType = lists:nth(misc:rand(1, Count), ListRandDebuffType),
  case DebuffType of
    ?DebuffTypeWhenLinkBad_Dizzy ->
      %?DEBUG_OUT("[DebugForDate] linkBad DebuffTypeWhenLinkBad_Dizzy"),
      BuffID_Dizzy = configDebuffID_Dizzy(),
      addBuff(RoleID_A, PlayerEts, BuffID_Dizzy),
      addBuff(RoleID_B, PlayerEts, BuffID_Dizzy),
      NetMsgDebuffDizzy =
        #pk_GS2U_DateLink_DeduffBuff_Sync{
          buffID = BuffID_Dizzy
        },
      acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsgDebuffDizzy),
      acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsgDebuffDizzy);
    ?DebuffTypeWhenLinkBad_Slowdown ->
      %?DEBUG_OUT("[DebugForDate] linkBad DebuffTypeWhenLinkBad_Slowdown"),
      BuffID_Slowdown = configDebuffID_SlowDown(),
      addBuff(RoleID_A, PlayerEts, BuffID_Slowdown),
      addBuff(RoleID_B, PlayerEts, BuffID_Slowdown),
      NetMsgDebuffSlowdown =
        #pk_GS2U_DateLink_DeduffBuff_Sync{
          buffID = BuffID_Slowdown
        },
      acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsgDebuffSlowdown),
      acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsgDebuffSlowdown)
  end,
  %% 恶魔使用技能
%%  monsterUseSkill(
%%    configMonsterID_Devil(),
%%    configMonsterSkillID_Devil(),
%%    MonsterEts,
%%    MapPid
%%  ),
  MapInfoNew.

%% 进入结算流程
-spec settle(MapInfoOld::#recMapInfo{}, Reason::type_sr(), RoleID::uint64()) -> MapInfoNew::#recMapInfo{}.
settle(#recMapInfo{mapPID = MapPid,activeID = ActiveID, timerRefMain = TimerRefMain, roleID_A = RoleID_A, roleID_B = RoleID_B, playerEts = PlayerEts, paramEx = RecActive} = MapInfoOld, Reason, _RoleID) ->
  %?DEBUG_OUT("[DebugForDate] settle Reason(~p) RoleID(~p)", [Reason, RoleID]),
  %% 0.清除可能存在的怪物
  acDateLogic:clearAllObject(MapPid, ?CodeTypeMonster),
  %% 1.修改玩法状态
  %% 取消可能存在的旧有主计时器
  case erlang:is_reference(TimerRefMain) of
    true ->
      erlang:cancel_timer(TimerRefMain);
    _ ->
      skip
  end,
  %% 更新地图信息
  TimeNow = time:getSyncUTCTimeFromDBS(),
  TimeThisState = configTime_Settle(),
  MapInfoNew = MapInfoOld#recMapInfo{
    %% 设置当前玩法状态的主计时器
    timerRefMain = acDateLogic:setTimerMain(
      TimeThisState * 1000,
      MapPid,
      #recAckData{
        activeID  = ?DateActiveID_Link,
        paramEx   = ?ActiveState_Settle
      }
    ),
    paramEx = RecActive#recActive{
      state       = ?ActiveState_Settle,    %% 更新玩法状态
      timeBegin   = TimeNow,                %% 更新玩法开始时间
      timeEnd     = TimeNow + TimeThisState
    }
  },
  acDateState:replaceMapInfo(MapInfoNew),
  %% 2.根据得分发放玩家奖励
  #recActive{score = Score} = RecActive,
  settle_Reward(Score, Reason, RoleID_A, RoleID_B, false),
  settle_Reward(Score, Reason, RoleID_B, RoleID_A, true),
  %% 发送消息
  NetMsg =
    #pk_GS2U_DateLink_GameEnd_Sync{
      reason  = Reason,
      time    = TimeThisState,
      score   = Score,
      id      = ActiveID
    },
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsg),
  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsg),
  MapInfoNew.

%% 发放奖励
-spec settle_Reward(Score::uint(), Reason::type_sr(), RoleID::uint64(), PartnerRoleID::uint64(), IsAddSingle::boolean()) -> ok.
settle_Reward(Score, _Reason, RoleID, PartnerRoleID, IsAddSingle) ->
  %% 0.忽略ID为0的用户，便于调试
  case RoleID of
    0 ->
      skip;
    _ ->
      %% 1.查找当前用户等级
      %% 优先从base_role查找实时数据
      Level =
        case core:queryBaseRoleByRoleID(RoleID) of
          #rec_base_role{level = Level_br} ->
            Level_br;
          _ ->
            %% 其次从?RoleKeyRec查找具有一定延时的数据
            case core:queryRoleKeyInfoByRoleID(RoleID) of
              #?RoleKeyRec{level = Level_rk} ->
                Level_rk;
              _ ->
                %% 该用户不存在，可能是已经被删除，无法继续发放奖励
                ?ERROR_OUT("settle_Reward can not find RoleID(~p) from core:queryRoleKeyInfoByRoleID/1", [RoleID]),
                0
            end
        end,
      case Level > 0 of
        true ->
          %% 2.发放礼包奖励
          #appointment_rewardCfg{
            reward        = ListRewardAll,
            reward_friend = Friendness,
            reward_couple = Closeness
          } = configRewardCfg(Level),
          PartnerName = playerNameUID:getPlayerNameByUID(PartnerRoleID),
          case Score > 0 of
            false ->
              %% 基础奖励
              FunFindRewardA =
                fun({ScoreLimit, RewardID}) ->
                  case Score >= ScoreLimit of
                    true ->
                      case playerMail:createMailGoods(RewardID, 1, true, 0, RoleID, ?ItemSourceACDate) of
                        [#recMailItem{}|_] = MailItemList ->
                          Content = configMailContent(PartnerName, Score, Friendness, Closeness),
                          Title = configMailTitle(),
                          mail:sendSystemMail(RoleID, Title, Content, MailItemList, "");
                        _ ->
                          ?ERROR_OUT("settle_Reward RewardID(~p) Level(~p) Score(~p)", [RewardID, Level, Score])
                      end;
                    _ ->
                      skip
                  end
                end,
              lists:foreach(FunFindRewardA, ListRewardAll);
            _ ->
              %% 非基础奖励
              FunFindRewardB =
                fun({ScoreLimit, RewardID}) ->
                  case Score >= ScoreLimit andalso ScoreLimit > 0 of
                    true ->
                      case playerMail:createMailGoods(RewardID, 1, true, 0, RoleID, ?ItemSourceACDate) of
                        [#recMailItem{}|_] = MailItemList ->
                          Content = configMailContent(PartnerName, Score, Friendness, Closeness),
                          Title = configMailTitle(),
                          mail:sendSystemMail(RoleID, Title, Content, MailItemList, "");
                        _ ->
                          ?ERROR_OUT("settle_Reward RewardID(~p) Level(~p) Score(~p)", [RewardID, Level, Score])
                      end;
                    _ ->
                      skip
                  end
                end,
              lists:foreach(FunFindRewardB, ListRewardAll)
          end,
          %% 一组人只加一次关系值奖励
          case IsAddSingle of
            true ->
              %% 发放好友系统关系值奖励
              playerFriend2:closenessAdd(?ClosenessAddType_DateLink, RoleID, PartnerRoleID, Friendness),
              %% 发放姻缘系统关系值奖励
              playerMarriage:closenessAdd({RoleID, PartnerRoleID, Closeness, ?ClosenessSource_Date});
            _ ->
              skip
          end;
        _ ->
          skip
      end
  end,
  ok.

%% 女神或恶魔对自己使用技能
-spec monsterUseSkill(MonsterID::uint(), SkillID::uint(), MonsterEts::etsTab(), MapPid::pid()) -> ok.
monsterUseSkill(MonsterID, SkillID, MonsterEts, MapPid) ->
  FunFind =
    fun(#recMapObject{id = ID, code = Code}, Result) ->
      case ID of
        MonsterID ->
          Code;
        _ ->
          Result
      end
    end,
  case ets:foldl(FunFind, 0, MonsterEts) of
    0 ->
      %% 没有找到，此处应是逻辑或配置错误
      ?ERROR_OUT("monsterUseSkill MonsterID(~p) SkillID(~p)~n~p", [MonsterID, SkillID, misc:getStackTrace()]);
    Code ->
      psMgr:sendMsg2PS(MapPid, monsterUseSkill, {Code, SkillID, Code})
  end,
  ok.

%%% ====================================================================
%%% Internal functions Configs
%%% ====================================================================

configGemPointXY() ->
  #globalsetupCfg{setpara = [X, Y]} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_posXY),
  {X, Y}.
configGemSizeXY() ->
  #globalsetupCfg{setpara = [X, Y]} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_sizeXY),
  {X, Y}.
configGemDistXY() ->
  #globalsetupCfg{setpara = [X, Y]} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_distXY),
  {X, Y}.
configGemNpcID() ->
  #globalsetupCfg{setpara = List} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_gemNpcID),
  List.
configRandMonsterID() ->
  #globalsetupCfg{setpara = List} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_monsterID),
  List.
configRandBoxID() ->
  #globalsetupCfg{setpara = List} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_box),
  List.
configComboNum() ->
  #globalsetupCfg{setpara = List} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_boxrefresh),
  List.
configBuffID_SpeedUp() ->
  #globalsetupCfg{setpara = [ID]} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_buffID_speedUp),
  ID.
configBuffID_AddScore() ->
  #globalsetupCfg{setpara = [ID]} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_buffID_addscore),
  ID.
configBuffID_Power() ->
  #globalsetupCfg{setpara = [ID]} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_buffID_multscore),
  ID.
configBuffID_AddTime() ->
  #globalsetupCfg{setpara = [ID]} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_buffID_addtime),
  ID.
configDebuffID_SlowDown() ->
  #globalsetupCfg{setpara = [ID]} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_debuffID_slowDown),
  ID.
configDebuffID_Dizzy() ->
  #globalsetupCfg{setpara = [ID]} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_debuffID_dizzy),
  ID.
configTime_BeforeFirstEnter() ->
  #globalsetupCfg{setpara = [Time]} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_time_beforeFristEnter),
  Time.
configTime_AfterFirstEnter() ->
  #globalsetupCfg{setpara = [Time]} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_time_afterFristEnter),
  Time.
configTime_MainGame() ->
  #appointmentCfg{time = Time} =
    getCfg:getCfgPStack(cfg_appointment, ?DateActiveID_PushBox),
  Time.
configRandAddTime() ->
  #globalsetupCfg{setpara = List} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_time_linkAdd),
  List.
configRandTime_Power() ->
  #globalsetupCfg{setpara = List} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_time_linkPower),
  List.
configTime_Settle() ->
  #globalsetupCfg{setpara = [Time]} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_time_settle),
  Time.
configTime_Reshuffle() ->
  #globalsetupCfg{setpara = [Time]} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_time_reshuffle),
  Time.
configTime_Combo() ->
  #globalsetupCfg{setpara = [Time]} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_time_combo),
  Time.
configComboBuff() ->
  #globalsetupCfg{setpara = [Count]} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_combo_buff),
  Count.
configRandBuffType() ->
  #globalsetupCfg{setpara = List} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_randBuffType),
  List.
configRandDebuffType() ->
  #globalsetupCfg{setpara = List} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_randDebuffType),
  List.
configRandAddScore() ->
  #globalsetupCfg{setpara = List} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_addScore),
  List.
configRandPower() ->
  #globalsetupCfg{setpara = List} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_power),
  List.
configCountReshuffle() ->
  #globalsetupCfg{setpara = [Count]} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_count_reshuffle),
  Count.
configMailContent(PartnerName, Score, Friendness, Closeness) ->
  stringCfg:getString(date_link_mail, [PartnerName, Score, Friendness, Closeness]).
configMailTitle() ->
  stringCfg:getString(date_link_mailtittle).
configScoreMax() ->
  #globalsetupCfg{setpara = [Value]} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_scoreMax),
  Value.
configRewardCfg(Level) ->
  ListKey2 = getCfg:get2KeyList(cfg_appointment_reward, ?DateActiveID_Link),
  FunGetCfg =
    fun(Key2, {Mark, Result}) ->
      Cfg = getCfg:getCfgPStack(cfg_appointment_reward, ?DateActiveID_Link, Key2),
      case Level >= Cfg#appointment_rewardCfg.level of
        true ->
          {Mark, Cfg};
        _ ->
          {true, Result}
      end
    end,
  {_, Cfg} = misc:foldlEx(FunGetCfg, {false, 0}, ListKey2),
  Cfg.
configGemScore() ->
  #globalsetupCfg{setpara = List} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_scorelist),
  List.

configRandBuffCfg() ->
  #globalsetupCfg{setpara = List} =
    getCfg:getCfgPStack(cfg_globalsetup, date_link_randbuff),
  List.
configMonsterID_God() ->
  9400.
configMonsterID_Devil() ->
  9401.
configMonsterSkillID_God() ->
  11001.
configMonsterSkillID_Devil() ->
  11002.



%%% 调试函数：打印出宝石矩阵每一个有效区域的坐标，以便于客户端的打印对照，观察是否匹配
%-spec printRectLTRB(Pos::uint8()) -> {Left::float(), Top::float(), Right::float(), Bottom::float()}.
%printRectLTRB(Pos) ->
%  {X, Y} = getGemPosLTByPos(Pos),
%  {SizeX, SizeY} = configGemSizeXY(),
%  Rect =
%    {
%      X - SizeX / 2.0,
%      Y - SizeY / 2.0,
%      X + SizeX / 2.0,
%      Y + SizeY / 2.0
%    },
%  ?DEBUG_OUT("[DebugForDate] printRectLTRB Pos(~p) Rect(~p)", [Pos, Rect]),
%  Rect.
%-spec printRectLTRB() -> ok.
%printRectLTRB() ->
%  [printRectLTRB(Pos) || Pos <- ?ListMatrixPos],
%  ok.

