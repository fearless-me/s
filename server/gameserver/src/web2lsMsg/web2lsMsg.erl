%% @author zzc
%% @doc @todo Add description to web2lsMsg.


-module(web2lsMsg).
-include("lsInc.hrl").
-include("web2lsMsgPrivate.hrl").

-record(state,{
			   socket
			  }).
%% ====================================================================
%% API functions
%% ====================================================================
-compile(export_all).

%% gm踢人下线
domsg( ?Web2lsGMKickout,CmdSerial,Data,State) ->
	Ret = web2lsMsgKickout:doMsg(CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% 禁言
domsg( ?Web2lsDenyChat,CmdSerial,Data,_State) ->
	web2lsMsgDenyChat:doMsg(CmdSerial, Data), %% 同步返回结果
	ok;

%% 发邮件
domsg( ?Web2lsGMSendMail,CmdSerial,Data,State) ->
	Ret = web2lsMsgSendMail:doMsg(CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% 添加公告
domsg( ?Web2lsGMAddNotice,CmdSerial,Data,State) ->
	Ret = web2lsMsgAddNotice:doMsg(CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% 删除公告
domsg( ?Web2lsGMDelNotice,CmdSerial,Data,State) ->
	Ret = web2lsMsgDelNotice:doMsg(CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% 取消添加登录有礼活动（活动id）
domsg( ?Web2lsGMDelLoginAward,CmdSerial,Data,State) ->
	Ret = web2lsMsgDelLoginAward:doMsg(CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% 回收玩家的钻石、物品
domsg( ?Web2lsMsgClearRevokeRolePay,CmdSerial,Data,State) ->
	Ret = web2lsMsgRevokeRolePay:doMsg(CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% 添加登录有礼活动
domsg( ?Web2lsGMAddLoginAward,CmdSerial,Data,State) ->
	Ret = web2lsMsgAddLoginAward:doMsg(CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% 添加XML公告
domsg( ?Web2lsGMAddXMLNotice,CmdSerial,Data,State) ->
	Ret = web2lsMsgAddXmlNotice:doMsg(CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% 设置帐号gm级别
domsg( ?Web2lsGMSetGMLevel,CmdSerial,Data,State) ->
	Ret = web2lsMsgSetGMLevel:doMsg(CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% 设置帐号是否为黑名单
domsg( ?Web2lsGMSetDenyAccountID,CmdSerial,Data,State) ->
	Ret = web2lsMsgSetDenyAccountID:doMsg(CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% 设置帐号是否为 白名单
domsg( ?Web2lsGMSetWhiteAccountID,CmdSerial,Data,State) ->
	Ret = web2lsMsgSetWhiteAccountID:doMsg(CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% gm设置角色是否为 删除
domsg( ?Web2lsGMSetRoleDelFlag,CmdSerial,Data,State) ->
	Ret = web2lsMsgSetRoleDelFlag:doMsg(CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% gm设置线路状态为 维护
domsg( ?Web2lsGMSetGSLineMaintain,CmdSerial,Data,State) ->
	Ret = web2lsMsgSetGSLineMaintain:doMsg(CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% gm设置GS世界变量（功能开关)
domsg( ?Web2lsGMSetGSWorldVariantFlag,CmdSerial,Data,State) ->
	Ret = web2lsMsgFunctionFlag:doMsg(CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% gm取出GS世界变量（功能开关)
domsg( ?Web2lsGMGetGSWorldBitVariantFlag,CmdSerial,Data,State) ->
	Ret = web2lsMsgGetFunctionFlag:doMsg(CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% gm取出GS活动变量
domsg( ?Web2lsGMGetGSActivityVariant,CmdSerial,Data,State) ->
	Ret = web2lsMsgGetActivityStatus:doMsg(CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% gm设置GS活动变量
domsg( ?Web2lsGMSetGSActivityVariant,CmdSerial,Data,State) ->
	Ret = web2lsMsgSetActivityStatus:doMsg(CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% gm角色转移
domsg( ?Web2lsGMChangeRoleOwner,CmdSerial,Data,State) ->
	Ret = web2lsMsgChangeRoleAccount:doMsg(CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% gm设备禁止登录设置
domsg( ?Web2lsGMDenyDevice,CmdSerial,Data,State) ->
	Ret = web2lsMsgDenyDeviceSet:doMsg(CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% gm设置商城添加新道具
domsg( ?Web2lsGMSetCSMallNewGoods,CmdSerial,Data,State) ->
	Ret = web2lsMsgMallGoodsSet:doMsg(?Web2lsGMSetCSMallNewGoods, CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% gm删除商城道具
domsg( ?Web2lsGMSetCSMallDelete,CmdSerial,Data,State) ->
	Ret = web2lsMsgMallGoodsSet:doMsg(?Web2lsGMSetCSMallDelete, CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% gm取出gs线路列表
domsg( ?Web2lsMsgGetList4GSMange,CmdSerial,Data,State) ->
	Ret = web2lsMsgGetList4GSMange:doMsg( CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% gm新建或修改gs线路
domsg( ?Web2lsMsgSet4GSMange,CmdSerial,Data,State) ->
	Ret = web2lsMsgSet4GSMange:doMsg( CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% gm充值返利绑定砖石
domsg( ?Web2lsMsgRechargeRebateBindDiamond,CmdSerial,Data,State) ->
	Ret = web2lsMsgRechargeRebate:doMsg( CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% 金宝塔活动
domsg( ?Web2lsMsgLotteryForTower,CmdSerial,Data,State) ->
	Ret = web2lsMsgLotteryForTower:doMsg( CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;
%% gm充值返利物品
domsg( ?Web2lsMsgRechargeRebateItem,CmdSerial,Data,State) ->
	Ret = web2lsMsgRechargeRebateItem:doMsg( CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% gm恢复道具(只能恢复不能叠加道具,其他只能通过补偿)
domsg( ?Web2lsGMKReturnItem,CmdSerial,Data,State) ->
	Ret = web2lsMsgReturnItem:doMsg( CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% gm恢复人物角色
domsg( ?Web2lsGMReturnRole,CmdSerial,Data,State) ->
	Ret = web2lsMsgReturnRole:doMsg( CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% gm设置要清除缓存的玩家
domsg( ?Web2lsGMFlagCleanCacheRoleID,CmdSerial,Data,State) ->
	Ret = flagCleanCacheRoleID:doMsg( CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% gm充值返利标记清除
domsg( ?Web2lsMsgRechargeRebateFlagClean,CmdSerial,Data,State) ->
	Ret = web2lsMsgRechargeRebateFlagClean:doMsg( CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% gm平台掉落
domsg( ?Web2lsMsgAc,CmdSerial,Data,State) ->
	Ret = web2lsMsgAc:doMsg( CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% gm平台增加兑换
domsg( ?Web2lsMsgAddExchange,CmdSerial,Data,State) ->
	Ret = web2lsMsgActAddExchange:doMsg( CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% gm平台删除兑换
domsg( ?Web2lsMsgDelExchange,CmdSerial,Data,State) ->
	Ret = web2lsMsgActDelExchange:doMsg( CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% gm平台清除玩家缓存
domsg( ?Web2lsMsgClearRoleCache,CmdSerial,Data,State) ->
	Ret = web2lsMsgCleanRoleCache:doMsg( CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% gm平台清除玩家缓存
domsg( ?Web2lsMsgClearBan,CmdSerial,Data,State) ->
	Ret = web2lsMsgClearBan:doMsg( CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;

%% gm平台清除玩家缓存
domsg( ?Web2lsMsgSendString,CmdSerial,Data,State) ->
	Ret = web2lsMsgSendString:doMsg( CmdSerial, Data), %% 同步返回结果
	returnArgBad(CmdSerial,Ret,State),
	ok;
%%domsg( ?Web2lsGMAddLimitSals,CmdSerial,Data,State) ->
%%	Ret = web2lsMsgLimitPushSales:doMsg(CmdSerial, Data), %% 同步返回结果
%%	returnArgBad(CmdSerial,Ret,State),
%%	ok;
%% 无匹配
domsg(Cmd,CmdSerial,Data,State) ->
	?ERROR_OUT("socketPid[~p] web2lsMsg can't match this args:~p",[self(),[ Cmd, CmdSerial, Data, State]] ),
	ok.


%% ====================================================================

%% 明文2web
returnWeb(JsonStr,#state{} = State) ->
	sendPackage(State#state.socket,netmsgWrite:packNetMsg(#pk_LS2Web_NormalAck{bodyJsonStr=JsonStr})),
	ok.
%% 密文2web  仅作规化
returnWebEncrypt(JsonStr,#state{} = State) ->
	sendPackage(State#state.socket,netmsgWrite:packNetMsg(#pk_LS2Web_NormalAck{bodyJsonStr=JsonStr})),
	ok.


%% 与web的长度和游戏中的不一样，所以在此重复了一个
sendPackage(_Socket,List)->
	socketHandler:sendNetMsg(List).

-spec returnArgBad(CmdSerial,Ret,State) ->term() when
		  CmdSerial::integer(),Ret::boolean(),State::#state{}.
returnArgBad(CmdSerial,Ret,State) ->
	case Ret of
		false ->
			SendData = {obj,[
							 {"serial",CmdSerial},
							 {"code",?Web2lsAckArgErr}
							]},
			JsonStr = rfc4627:encode(SendData),
			returnWeb(JsonStr,#state{} = State),
			ok;
		_ ->
			skip
	end.