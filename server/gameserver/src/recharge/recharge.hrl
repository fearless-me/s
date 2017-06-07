-ifndef(Recharge_hrl).
-define(Recharge_hrl,1).

-include("gsInc.hrl").
-include("cfg_recharge_item_relation.hrl").
%%服务器重启过了。忽略掉支付进程pid
-define(IGNORE_PID_SERVER_RESTART,<<"ignore_pid_server_restart">>).
%%GM强制修改订单状态。忽略掉支付进程pid
-define(IGNORE_PID_GM_CHANGE_RECHARGE_STATE,<<"ignore_pid_gm_change_recharge_state">>).

-define(EtsRecharge,rechargeEts).%%缓存

-define(EtsRechargeRebate,recSaveRechargeRebate).%%充值返利缓存
%%进程字典内的用户订单信息
%%order_state=订单状态，只有待支付订单和异常订单。不包含已支付订单已支付订单应该从近处字典内移除掉
%% rechargeing_pid：正在进行支付的进程id
%%http_msg_recharge_info 收到的http支付消息。在正常支付中该消息时完整的。在补单和异常订单时该消息仅仅包含了部分关键字段有数据
-record(role_recharge_dic_info,{role_id,order_id,order_state, rechargeing_pid,http_msg_recharge_info}).
-record(state,{
			   }).
-endif.
%%GM修改订单状态：成功
-define(GM_CHANGE_RECHARGE_STATE_SUCCESS,0).
%%GM修改订单状态：因db错误失败
-define(GM_CHANGE_RECHARGE_STATE_FAIL_DB_ERROR,1).
%%GM修改订单状态：订单不在ets内说明订单已经超过了7日上(从服务器启动时间开始往前数7日直到现在)线。不再受理订单修复请求
-define(GM_CHANGE_RECHARGE_STATE_ERROR_TO_OLD,2).