-ifndef(platformDefine_hrl).

-record(platformTable, {platformID, isSupport, ip, port} ).


%% 与皮皮平台消息命令定义
-define( CMD_PLATFORM_PP_VERIFY,16#AA000022 ).
-define( CMD_PLATFORM_PP_VERIFY_RET,16#AA00F022 ).

%% 与皮皮平台验证消息请求
%% commmand = 0xAA000022
-record(pk_LS2PlatformPP_Verify, {
        len,
        commmand,
        token_key
        }).

%%与皮皮平台验证结果返回消息
%% commmand = 0xAA00F022 status = 0 成功，失败为其他值
-record(pk_LS2PlatformPP_Verify_Ret, {
        len,
        commmand,
        status,
        username
        }).

%%----------------------------------------------------------------------
%%-------以下是553平台--------------------------------------------------
%%----------------------------------------------------------------------

%%各个平台定义标识符
-define( PLATFORM_TEST,	100 ).
-define( PLATFORM_553, 	101 ).
-define( PLATFORM_PP, 	102 ).
-define( PLATFORM_APPS,	103 ).
-define( PLATFORM_360, 	111 ).
-define( PLATFORM_553_android, 	108 ).
-define( PLATFORM_UC_android, 	110 ).
-define( PLATFORM_UC_ios, 	105 ).
-define( PLATFORM_91_IOS, 	104 ).
-define( PLATFORM_91_android, 	109 ).
-define( PLATFORM_DL_android, 113).
-define( PLATFORM_XM_android, 116).
-define( PLATFORM_BAIDU_android,119).
-define( PLATFORM_3G_android,124).
-define( PLATFORM_PPS_android,120).
-define( PLATFORM_PPS_ios,0).
-define( PLATFORM_OPPO_android,121).
-define( PLATFORM_Lenovo_android, 122 ).
-define( PLATFORM_WDJ_android, 	125 ).
-define( PLATFORM_YingYongHui_android, 129 ).
-define( PLATFORM_SanXingBOYA_android, 136 ).
-define( PLATFORM_TAIWAN337_android,114).
-define( PLATFORM_AnZhi_android,127).
-define( PLATFORM_YouMi_android,137).
-define( PLATFORM_HuaWei_android,133).
-define( PLATFORM_JiFeng_android,141).
-define( PLATFORM_BaoRuan_android,134).
-define( PLATFORM_37Wan_android,140).
-define( PLATFORM_Korea_android_GStore,107).
-define( PLATFORM_Korea_android_TStore,117).
-define( PLATFORM_LianTong_android,130).
-define( PLATFORM_JingDong_android,142).
-define( PLATFORM_TAIWAN337_yaohu_android,118).
-define( PLATFORM_TAIWAN337_yaohu_ios,138).
-define( PLATFORM_Korea_ios,106).
-define( PLATFORM_YouXin_android,139).
-define( PLATFORM_BaiNa,149).
-define( PLATFORM_ZhiDian_android,152).
-define( PLATFORM_HTC_android,143).

%% XiaoMi 平台
-define(APP_ID_XM, "14745").
-define(APP_KEY_XM, "2637e0d3-a4da-6cba-9fa2-51b1939dbe6b").

%% DL add here.
-define(APP_ID_DL, "479").
-define(APP_KEY_DL, "wjiOV9mV").

%% 553平台
-define( KEY_PLATFORM_553_VERIFY, "shfihdqhwkhuskdgnlkjioajiwbjdnasce" ).
-define( KEY_PLATFORM_553_ANDROID_VERIFY, "weuhfwalkwjejahdauhdoqhdohqwoh" ).
-define( KEY_PLATFORM_553_RECHARGE,"as;djfw75d4fsdkfsd6^&w8a7a;4e52" ).
-define( KEY_PLATFORM_553_COMMAND, "daslkw75d4p;^fsadh6^&w8a7a;4d82" ).
-define( KEY_PLATFORM_APPS_VERIFY, "shfihdqhwkhuskdgnlkjioajiwbjdnasce" ).
%% 360 平台
-define( APP_ID_360, "200455331" ).
-define( APP_KEY_360, "ad5f4dd4a99318fa02d805878e3aa802" ).
-define( APP_PRIVATE_KEY_360, "925bea7aee1030525642e6af934b551e" ).
-define( APP_SECRET_360, "69b1fe3610f6e316fcfad2341a3f1b2d" ).

%%UC
-define( UC_Test_apiKey, "54520eb3c61318c120052da361684207" ).
-define( UC_Test_CPID, 1 ).
-define( UC_Test_GameID, 382 ).
-define( UC_Test_ServerID, 1366 ).
-define( UC_Test_ChannelID, "2" ).

-define( UC_Officially_apiKey, "7c3b2b17bba0bc56cef3ef0444ef7562" ).
-define( UC_Officially_CPID, 23184 ).
-define( UC_Officially_GameID, 506322 ).
-define( UC_Officially_ServerID, 1859 ).
-define( UC_Officially_ChannelID, "2" ).

%% 91平台
-define( APP_ID_91, "109132" ).
-define( APP_KEY_91, "f938a4baa3027903b077f418d112c83321f786a0d500d557" ).
-define( APP_ID_91_android, "109132" ).
-define( APP_KEY_91_android, "f938a4baa3027903b077f418d112c83321f786a0d500d557" ).

% BAIDU add here
-define(APP_KEY_BAIDU,"33e34ebd1289a6b2a8aed7d692ec142b").
-define(APP_ID_BAIDU,"321").
-define(APP_SECRET_BAIDU,"2dd077a6062f8aa8b9441f73377a686a").

% 3G add here
-define(APP_KEY_3G,"2324fanxian").
-define(APP_GameID_3G,"2335").
-define(APP_CPID_3G,"2334").

%PPS add here
-define(APP_KEY_PPS,"").

% OPPO add here
-define(APP_KEY_OPPO,"c3kZMAbVgk08sco8o44oGO444").
-define(APP_ID_OPPO,"1017").
-define(APP_SECRET_OPPO,"60404Ec0d47f1cf3159C64a48843e299").

%% Lenovo add here.
-define(APP_Realm_Lenovo, "fx.fanxian.com").
-define(APP_ID_Lenovo, "20009300000002200093").
-define(APP_KEY_Lenovo, "RDY4RjNGNzhBRTRFQjcyRDcxMzdEMkY2NjZEQ0Q1NEMxMzE0NUE5QU1USTNOelUxTnpnNU1qWXpOamMyTlRneU1ERXJN
						VFkwTlRnNE9USTJOVEU1TXpnMU1qZ3pOVFl6TkRnMU1URXlOak01TVRFeE9UYzNNVGN4").

%% WDJ add here.
-define(APP_ID_WDJ, "100000060").
-define(APP_KEY_WDJ, "921b47569ef3596a9769b7757df743c6").

%% YingYongHui add here.
-define(APP_ID_YingYongHui, "10004").
-define(APP_KEY_YingYongHui, "PC2ptMWzE0BzAb97").

%% SaxXingBOYA add here.
-define(APP_ID_SanXingBOYA, "1033").
-define(APP_KEY_SanXingBOYA, "2d47cfe8a62ddaedbf8432528fc4a657f909690e").

% AnZhi add here
-define(APP_KEY_AnZhi,"p7MRKP1y9l2Wvw1i6MnB1mt7").
-define(APP_SECRET_AnZhi,"iaWBLLCHeW8wRcEcrXOz0T9W").

% YouMi add here
-define(APP_ID_YouMi,"2fec64b82f82d648").
-define(APP_SECRET_YouMi,"fbf06962e809bc43").
-define(APP_SERVERSECRET_YouMi,"73f65161f4f11464").

% BaoRuan add here
-define(APP_ID_BaoRuan,"168686728945075186").
-define(APP_Uniquekey_BaoRuan,"fd3c0c64eadd12a10431e17127379362").

% 37Wan add here
-define(APP_GameID_37Wan,"1000012").
-define(APP_Partner_37Wan,"1").
-define(APP_LoginKey_37Wan,"qy1I3xhw2KMCWQ:zGH0?7ceAk?b$5,lm").

% Korea add here
-define(APP_KEY_Korea,"C6767606DAEF700E0814F3808A7048BA").

%%YouXin add here 
-define(APP_ID_YouXin,"10004").
-define(APP_KEY_YouXin,"CC5CBB18D1B1D6E6097C8F4B5E70DE6C").

%%BaiNa add here 
-define(APP_ID_BaiNa,"cdhw002").
-define(APP_KEY_BaiNa,"ZPgQp4NAVlJSAQGwsHcKKigvd3RYHGt3eN1AXo76ubLcW01PI91RoNCa1a28pTH0").

%%ZhiDian add here 
-define(APP_ID_ZhiDian,"131022112833").
-define(APP_KEY_ZhiDian,"POL58Y3VMXHYQHV7XGMRRVEVZNFGKCOR").

%%HTC add here 
-define(APP_ID_HTC,"1378868700786").
-define(APP_KEY_HTC,"nl8osSambydXMXLSIFRvc1htLMBj9eGm").

%% 与553平台消息长度定义
-define( CMD_PLATFORM_553_HEADER_SIZE,8 ).
-define( CMD_PLATFORM_553_MAX_SIZE,1024 ).
%% 公告消息的最大长度，200个汉字以内
-define( CMD_PLATFORM_553_ANNOUNCE_MAX_SIZE,212 ).

%% 与553平台消息命令定义
-define( CMD_PLATFORM_553_RECHARGE,16#0000AA01 ).
-define( CMD_PLATFORM_553_RECHARGE_RET,16#0000FF01 ).
-define( CMD_PLATFORM_553_ACTIVE_CODE,16#0000AA10 ).
-define( CMD_PLATFORM_553_ACTIVE_CODE_RET,16#0000FF10 ).
-define( CMD_PLATFORM_553_ANNOUNCE,16#0000AA20 ).
-define( CMD_PLATFORM_553_COMMAND,16#0000AA30 ).
-define( CMD_PLATFORM_553_COMMAND_RET,16#0000FF30 ).
-define( CMD_PLATFORM_553_ADD_GSCONFIG,16#0000AA40 ).
-define( CMD_PLATFORM_553_ADD_GSCONFIG_RET,16#0000FF40 ).
-define( CMD_PLATFORM_553_SUB_GSCONFIG,16#0000AA50 ).
-define( CMD_PLATFORM_553_SUB_GSCONFIG_RET,16#0000FF50 ).
-define( CMD_PLATFORM_553_ADD_GSCONFIG_NEW,16#0000FF51 ).

-define( PLATFORM_RCODE_ACTIVE_CODE_OK,0 ).
-define( PLATFORM_RCODE_ACTIVE_CODE_NOGS,-1 ).
-define( PLATFORM_RCODE_ACTIVE_CODE_NOPLAYER,-2 ).
-define( PLATFORM_RCODE_ACTIVE_CODE_MAIL_FAILED,-3 ).

-define( PLATFORM_RCODE_COMMAND_OK,0 ).
-define( PLATFORM_RCODE_COMMAND_NOGS,-1 ).
-define( PLATFORM_RCODE_COMMAND_NOPLAYER,-2 ).
-define( PLATFORM_RCODE_COMMAND_FAILED,-3 ).
-define( PLATFORM_RCODE_COMMAND_ERROR_PARAMS,-4 ).
-define( PLATFORM_RCODE_COMMAND_ERROR_FAILED,-5). %%退回元宝大于用户实际元宝数量或者回退元宝为0,请重新操作
-define( PLATFORM_RCODE_COMMAND_ERROR_AMMOUNT,-6). %%退元宝失败，请重新操作
-define( PLATFORM_RCODE_COMMAND_ERROR_GOLD, -7 ). %%元宝不足
-define( PLATFORM_RCODE_COMMAND_PLAYER_NOONLINE, -8 ). %%角色不在线
-define( PLATFORM_RCODE_COMMAND_ITEM_NOEXIT, -9 ). %%物品不存在
-define( PLATFORM_RCODE_COMMAND_ITEM_CNT_ERROR, -10 ). %%物品填写数量太多
-define( PLATFORM_RCODE_COMMAND_UID_ERROR, -11). %%UID错误

-define( PLATFORM_RCODE_RECHARGE_OK,0 ).
-define( PLATFORM_RCODE_RECHARGE_NOGS,-1 ).
-define( PLATFORM_RCODE_RECHARGE_NOPLAYER,-2 ).
-define( PLATFORM_RCODE_RECHARGE_FAILED,-3 ).	%% 操作失败
-define( PLATFORM_RCODE_RECHARGE_DUMPLICATE,-4 ).	%% 订单重复

-define( PLATFORM_SENDITEM_COUNT,2 ).	%% 最多支持给玩家发放物品的数量

%% 指令定义
-define( PLATFORM_COMMAND_SENDITEM,1 ).		%% 给玩家发送物品
-define( PLATFORM_COMMAND_BAZZAR,2 ).		%% 通知商城重新加载数据
-define( PLATFORM_COMMAND_SENDITEM_EX,3 ).	%% 给玩家发放物品扩展
-define( PLATFORM_COMMAND_ADD_GM_USER, 4).  %% 设置某角色为gm用户
-define( PLATFORM_COMMAND_ADD_WHITE_USER, 5).  %% 设置白名单
-define( PLATFORM_COMMAND_ADD_FORBIDDEN_USER_LOGIN, 6).  %% 禁止帐户登陆
-define( PLATFORM_COMMAND_KILLOUT_USER, 7).  %% 踢角色下线
-define( PLATFORM_COMMAND_FORBIDDEN_USER_CHAT, 8).  %% 禁止角色聊天
-define( PLATFORM_COMMAND_FORBIDDEN_ACCOUNT, 9).  %% 限定帐号
-define( PLATFORM_COMMAND_SWITCH_USERID, 11).  %% 将某帐号下某角色的userid转换到某帐号下
-define( PLATFORM_COMMAND_BINDED_PHONE_SUCC, 12). %%成功绑定手机
-define( PLATFORM_COMMAND_RECOVER_PLAYERNAME_SUCC, 13). %%恢复角色名
-define( PLATFORM_COMMAND_553UpdateRealServerID,14).%%修改realserverId liaolong
-define( PLATFORM_COMMAND_ADD_DROP_ITEM, 15). %%增加物品掉落概率
-define( PLATFORM_COMMAND_SET_WORLD_VALUE, 16).%%设置某个世界变量的值
-define( PLATFORM_COMMAND_SET_WORLD_VAR_FLAG, 17).%%设置世界变量某一位的值
-define( PLATFORM_COMMAND_SET_UPDATA_NAME, 18).%%设置改名权限
-define( PLATFORM_COMMAND_DELETE_DROP_ITEM, 19). %%删除某一物品掉落概率
-define( PLATFORM_COMMAND_INSERT_NATIONALDAY_AWARD, 20). %%插入奖励
-define( PLATFORM_COMMAND_DELETE_NATIONALDAY_AWARD, 21). %%删除奖励
-define( PLATFORM_COMMAND_BACK_RECHAGE_AMMOUNT,22).%%退元宝
-define( PLATFORM_COMMAND_LOTTERY_COST_GOLD, 23 ). %%抽奖扣元宝
-define( PLATFORM_COMMAND_LOTTERY_GIVE_ITEM, 24 ). %%抽奖送物品

%%与553平台通知游戏处理充值消息
%% commmand = 0x0000AA01 
-record(pk_LS2Platform553_Recharge, {
        len,
        commmand,
	orderid,
	platform,
	lsid,
	gsid,
	account,
	userid,
	playerid,
	ammount,
	time,
	sign
	}).

%%与553平台通知游戏处理充值返回消息
%% commmand = 0x0000FF01 retcode = 0 成功，失败为其他值
-record(pk_LS2Platform553_Recharge_Ret, {
        len,
        commmand,
	orderid,
	platform,
	retcode
	}).

%%与553平台通知游戏处理激活码消息
%% commmand = 0x0000AA10 
-record(pk_LS2Platform553_Active_Code, {
        len,
        commmand,
	activecode,
	gsid,
	player,
	type
	}).

%%与553平台通知游戏处理激活码返回消息
%% commmand = 0x0000FF10 retcode = 0 成功，失败为其他值
-record(pk_LS2Platform553_Active_Code_Ret, {
        len,
        commmand,
	activecode,
	retcode
	}).

%%与553平台通知游戏处理公告消息
%% commmand = 0x0000AA20 
-record(pk_LS2Platform553_Announce, {
        len,
        commmand,
	gsid,
	announceinfo
	}).

%%与553平台通知游戏处理GM命令消息
%% commmand = 0x0000AA30 
-record(pk_LS2Platform553_Command, {
        len,
        commmand,
	gsid,
	num,
	cmd,
	params,
	time,
	sign
	}).

%%与553平台通知游戏处理GM命令返回消息
%% commmand = 0x0000FF30 retcode = 0 成功，失败为其他值
-record(pk_LS2Platform553_Command_Ret, {
        len,
        commmand,
	num,
	cmd,
	retcode
	}).

-endif. % -ifdef(platformDefine_hrl).

-record(pk_LS2Platform553_Add_GsConfig, {
        len,
        commmand,
	serverid,
	name,
	isnew,
	begintime,
	recommend,
	hot
	}).

-record(pk_LS2Platform553_Add_GsConfig_New, {
        len,
        commmand,
	serverid,
	name,
	isnew,
	begintime,
	recommend,
	hot,
	realserverid
	}).

-record(pk_LS2Platform553_Add_GsConfig_Ret, {
        len,
        commmand,
	serverid,
	ret	
	}).

-record(pk_LS2Platform553_Sub_GsConfig, {
        len,
        commmand,
	serverid	
	}).
-record(pk_LS2Platform553_Sub_GsConfig_Ret, {
        len,
        commmand,
	serverid,
	ret	
	}).

-record(pk_PLATFORM_553UpdateRealServerID, {
	serverID,
	realServerID
	}).