%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <雨墨>
%%% @doc
%%% 数据库加载器
%%% @end
%%% Created : 22. 九月 2016 14:53
%%%-------------------------------------------------------------------
-module(publicDataMgrLoad).
-author("tiancheng").

-include("gsInc.hrl").

%% API
-export([
    loadData/0,
	loadOtherData/1,
	loadModuleDataAck/2
]).

-export([
    loadRoleKeyInfoAck/1,
    loadPlayerRankInfoAck/1,
    loadLadder1v1InfoAck/1
]).

%% 需要等待加载完的数据列表
-define(NeedWaitLoadList,
    [
        loadRoleKeyInfoAck,
        loadLadder1v1InfoAck
    ]).

loadData() ->
    ?LOG_OUT("开始加载数据..."),
    gsSendMsg:sendMsg2DBServer(loadRoleKeyInfo, 3, 0),
    ok.

%% 加载其它数据
-spec loadOtherData(Pid::pid()) -> ok.
loadOtherData(Pid) ->
	?WARN_OUT("start loadOtherData..."),

	%% 模块加载数据
	loadModuleData(?PsNameRedEnvelope, false, true),
	loadModuleData(?PsNameDaily2, true, false),
	loadModuleData(?PsNameMarriage, true, false),
	loadModuleData(?PsNameActivity, true, true),
	loadModuleData(?PsNamePreRecharge, true, true),
	loadModuleData(?PsNameRecharge, true, true),
	loadModuleData(?PsNameRank, true, true),
	loadModuleData(?PsNameMall, true, true),
	loadModuleData(?PsNameGuild, true, true),
	loadModuleData(?PsNameFriend2, true, false),
	loadModuleData(?PsRubbishCleaner, true, false),
	loadModuleData(?PsNamePlayerMgr, true, false),

	case publicDataMgrState:getLoadOtherDataPidList() of
		[] ->
			%% 允许登陆
			?WARN_OUT("no wait module load data!"),
			psMgr:sendMsg2PS(Pid, loadOtherDataAck, 0);
		L ->
			?LOG_OUT("1need wait module load data:~p", [L])
	end,
	ok.

%% 加载模块数据返回
-spec loadModuleDataAck(Pid::pid(), Data::term()) -> ok.
loadModuleDataAck(Pid, _Data) ->
	?LOG_OUT("loadModuleDataAck:~p", [Pid]),
	case publicDataMgrState:delLoadOtherDataPidList(Pid) of
		[] ->
			%% 允许登陆
			?WARN_OUT("all module data load success!"),
			psMgr:sendMsg2PS(?PsNameDBS, loadOtherDataAck, 0);
		L ->
			?LOG_OUT("2need wait module load data:~p", [L])
	end,
	ok.

%% 发送给模块加载数据
-spec loadModuleData(Module::atom(), IsCrossLoad::boolean(), WaitAck::boolean()) -> ok.
loadModuleData(Module, IsCrossLoad, WaitAck) ->
	IsLoad =
		case IsCrossLoad of
			true ->
				%% 不论跨服与否，都要加载数据
				true;
			_ ->
				%% 跨服不加载，普通服加载数据
				core:isCross() =:= false
		end,
	?LOG_OUT("loadModuleData Module:~p, IsCrossLoad:~p, WaitAck:~p, IsLoad:~p", [Module, IsCrossLoad, WaitAck, IsLoad]),
	case IsLoad of
		true ->
			Pid = whereis(Module),
			case erlang:is_pid(Pid) of
				true ->
					?LOG_OUT("Module:~p, Pid:~p", [Module, Pid]),
					case WaitAck of
						true -> publicDataMgrState:addLoadOtherDataPidList(Pid);
						_ -> skip
					end,
					psMgr:sendMsg2PS(Pid, alreadyConnectDBServer, WaitAck);
				_ ->
					?ERROR_OUT("not found module:~p", [Module])
			end;
		_ ->
			skip
	end,
	ok.

loadRoleKeyInfoAck({IsEnd, Data}) ->
    ?DEBUG_OUT("IsEnd====~w~n",[IsEnd]),
    publicDataMgrRKILogic:dealRoleKeyInfoData(Data),
    case IsEnd of
        true ->
            loadDataProcess(loadRoleKeyInfoAck),

			?LOG_OUT("deal rolekeyinfo end!"),
			ets:delete_all_objects(publicDataMgrState:getRoleKeyInfoTempEts()),

			POL = publicDataMgrState:getPlayerObjectList(),
			loadPlayerRankInfoAck(POL),
			POL2 = publicDataMgrState:getPlayerObjectList(),
			?LOG_OUT("deal sy playerobject len:~p,[[~p]]", [erlang:length(POL),erlang:length(POL2)]),

            loadDataRelyRoleKeyInfo(),
			ok;
        _ ->
            skip
    end,
    ok;
loadRoleKeyInfoAck(Data) ->
    publicDataMgrRKILogic:dealRoleKeyInfoData(Data),
    ok.

loadDataRelyRoleKeyInfo() ->
    ?LOG_OUT("开始加载依赖rolekeyinfo的数据..."),
    gsSendMsg:sendMsg2DBServer(loadLadder1v1Info, 4, 0),
    ok.

loadLadder1v1InfoAck(0) ->
    %% 加载列表为空，需要重新初始化
    publicDataMgrLadder1v1:ladder1v1DataIsNull(),
    loadDataProcess(loadLadder1v1InfoAck),
    ok;
loadLadder1v1InfoAck(-1) ->
    %% 加载结束
    loadDataProcess(loadLadder1v1InfoAck),
    ok;
loadLadder1v1InfoAck(List) ->
    %% 正在加载列表
    publicDataMgrLadder1v1:loadLadder1v1InfoAck(List),
    ok.

loadPlayerRankInfoAck([]) ->
	ok;
loadPlayerRankInfoAck(DataList) ->
    Fun =
        fun({RoleID, WingLevel, TitleRec, EquipInfoList, EquipLvList, FashionIDList} = Info, Acc) ->
            case core:queryRoleKeyInfoByRoleID(RoleID) of
                #?RoleKeyRec{} = R ->
                    Code = case core:queryOnLineRoleByRoleID(RoleID) of
                               #rec_OnlinePlayer{code = C} -> C;
                               _ -> 0
                           end,

                    %% 添加
                    Rec = #recPlayerRankInfo{
                        roleID = RoleID,
                        career = R#?RoleKeyRec.career,
                        race = R#?RoleKeyRec.race,
                        sex = R#?RoleKeyRec.sex,
                        head = R#?RoleKeyRec.head,
                        code = Code,
                        wingLevel = WingLevel,
                        name = R#?RoleKeyRec.roleName,
                        title = TitleRec,
						fashionIDs = FashionIDList,
                        visibleEquips = EquipInfoList,
                        visibleEquipLevels = EquipLvList
                    },

                    ets:insert(ets_recPlayerRankInfo, Rec),
					Acc;
                _ ->
					%% 没有找到Role，添加到等待完善的列表
                    [Info | Acc]
            end
        end,
    POL = lists:foldl(Fun, [], DataList),
	publicDataMgrState:setPlayerObjectList(POL),
    ok.

loadDataProcess(Flag) ->
    case lists:member(Flag, ?NeedWaitLoadList) of
        true ->
            Process = publicDataMgrState:addLoadPublicDataProcess(Flag),
            ?LOG_OUT("loadDataProcess:~p,~p", [Flag, Process]),
            case erlang:length(Process) =:= erlang:length(?NeedWaitLoadList) of
                true ->
                    psMgr:sendMsg2PS(?PsNameDBS, publicDataLoadSuccess, 0);
                _ ->
                    ?WARN_OUT("wait load public data..."),
                    skip
            end;
        _ ->
            ?ERROR_OUT("not register in waitlist:~p", [Flag]),
            skip
    end,
    ok.