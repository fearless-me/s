-ifndef(Web2lsMsgPrivate).
-define(Web2lsMsgPrivate,1).

-include("cfg_mapsetting.hrl").
-include("cfg_object.hrl").
-include("cfg_item.hrl").

%% json中的cmd消息指令编号（来、回）
-define(Web2lsTest,1).
-define(Web2lsTestAck,256).

%% 禁言
-define(Web2lsDenyChat,2003).
-define(Web2lsDenyChatAck,102003).

%% gm踢人
-define(Web2lsGMKickout,2004).
-define(Web2lsGMKickoutAck,102004).

%% gm恢复角色
-define(Web2lsGMReturnRole,2013).
-define(Web2lsGMReturnRoleAck,102013).

%% gm恢复道具
-define(Web2lsGMKReturnItem,2012).
-define(Web2lsGMKReturnItemAck,102012).

%% gm设置要清除缓存的玩家
-define(Web2lsGMFlagCleanCacheRoleID,2014).
-define(Web2lsGMFlagCleanCacheRoleIDAck,102014).

%% gm发送邮件
-define(Web2lsGMSendMail,6010).
-define(Web2lsGMSendMailAck,106010).

%% gm添加公告
-define(Web2lsGMAddNotice,7010).
-define(Web2lsGMAddNoticeAck,107010).

%% gm删除公告
-define(Web2lsGMDelNotice,7011).
-define(Web2lsGMDelNoticeAck,107011).

%% gm添加XML内容公告
-define(Web2lsGMAddXMLNotice,7012).
-define(Web2lsGMAddXMLNoticeAck,107012).

%% gm登录有礼活动
-define(Web2lsGMAddLoginAward,3080).
-define(Web2lsGMLoginAwardAck,103080).

%% gm取消登录有礼活动
-define(Web2lsGMDelLoginAward,3081).
-define(Web2lsGMDelLoginAwardAck,103081).

%% gm设置帐号gm级别
-define(Web2lsGMSetGMLevel,2009).
-define(Web2lsGMSetGMLevelAck,102009).

%% gm设置帐号是否为黑名单
-define(Web2lsGMSetDenyAccountID,2001).
-define(Web2lsGMSetDenyAccountIDAck,102001).

%% gm设置帐号是否为 白名单
-define(Web2lsGMSetWhiteAccountID,2011).
-define(Web2lsGMSetWhiteAccountIDAck,102011).

%% gm设置角色是否为 删除
-define(Web2lsGMSetRoleDelFlag,2006).
-define(Web2lsGMSetRoleDelFlagAck,102006).
  
%% gm设置角色是否为 删除
-define(Web2lsGMSetGSLineMaintain,8001).
-define(Web2lsGMSetGSLineMaintainAck,108001).

%% gm设置GS世界变量（功能开关)
-define(Web2lsGMSetGSWorldVariantFlag,8002).
-define(Web2lsGMSetGSWorldVariantFlagAck,108002).

%% gm取出GS世界变量（bit功能开关)
-define(Web2lsGMGetGSWorldBitVariantFlag,80023).
-define(Web2lsGMGetGSWorldBitVariantFlagAck,108003).

%% gm设置GS活动变量
-define(Web2lsGMSetGSActivityVariant,9003).
-define(Web2lsGMSetGSActivityVariantAck,109003).

%% gm取出GS活动变量
-define(Web2lsGMGetGSActivityVariant,9004).
-define(Web2lsGMGetGSActivityVariantAck,109004).

%% gm角色转移
-define(Web2lsGMChangeRoleOwner,2005).
-define(Web2lsGMChangeRoleOwnerAck,102005).

%% gm设备禁止登录设置
-define(Web2lsGMDenyDevice,2010).
-define(Web2lsGMDenyDeviceAck,102010).

%% gm设置商城道具信息
-define(Web2lsGMSetCSMallNewGoods,8021).
-define(Web2lsGMSetCSMallNewGoodsAck,108021).

%% gm设置删除商城道具
-define(Web2lsGMSetCSMallDelete,8022).
-define(Web2lsGMSetCSMallDeleteAck,108022).

%% gm取出gs线路列表
-define(Web2lsMsgGetList4GSMange,9002).
-define(Web2lsMsgGetList4GSMangeAck,109002).

%% gm新建或修改gs线路
-define(Web2lsMsgSet4GSMange,9001).
-define(Web2lsMsgSet4GSMangeAck,109001).

%% gm充值返利绑定砖石
-define(Web2lsMsgRechargeRebateBindDiamond,9005).
-define(Web2lsMsgRechargeRebateBindDiamondAck,109005).

%% gm充值返利物品
-define(Web2lsMsgRechargeRebateItem,9006).
-define(Web2lsMsgRechargeRebateItemAck,109006).

%% gm充值返利物品
-define(Web2lsMsgRechargeRebateFlagClean,9007).
-define(Web2lsMsgRechargeRebateFlagCleanAck,109007).
%% gm平台活动
-define(Web2lsMsgAc, 9008).
-define(Web2lsMsgAcAck,109008).
%% 金宝塔活动
-define(Web2lsMsgLotteryForTower,9009).
-define(Web2lsMsgLotteryForTowerAck,109009).

%% 增加gm平台活动兑换
-define(Web2lsMsgAddExchange, 3110).
-define(Web2lsMsgAddExchangeAck,103110).

%% 删除gm平台活动兑换
-define(Web2lsMsgDelExchange, 3111).
-define(Web2lsMsgDelExchangeAck,103111).

%%清除聊天禁言次数
-define(Web2lsMsgClearBan, 3112).
-define(Web2lsMsgClearBanAck, 103113).

%%清除角色缓存
-define(Web2lsMsgClearRoleCache, 3113).
-define(Web2lsMsgClearRoleCacheAck, 103113).

%%回收钻石
-define(Web2lsMsgClearRevokeRolePay, 3114).
-define(Web2lsMsgClearRevokeRolePayAck, 103114).

%%字符串
-define(Web2lsMsgSendString, 3115).
-define(Web2lsMsgSendStringAck, 103115).

%%修改订单状态
-define(Web2lsMsgChangeRechargeState, 3116).
-define(Web2lsMsgChangeRechargeStateAck, 103116).


%% 统一的返回码
-define(Web2lsAckSucc,						0).
-define(Web2lsAckFail,						-1).
-define(Web2lsAckCmdErr,					-2).
-define(Web2lsAckArgErr,					-3).
-define(Web2lsAckAccountNotExist,			-4).
-define(Web2lsAckRoleNotExist,				-5).
-define(Web2lsAckAccoutIDNotLogin,			-6).
-define(Web2lsAckTimeout,					-7).
-define(Web2lsAckDecryptFail,				-8).

-endif.