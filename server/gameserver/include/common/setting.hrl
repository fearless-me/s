%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% After U use the script, REMEMBER to COMMIT the LATEST files to SVN!!!, 3Q


-ifndef(Setting_hrl).
-define(Setting_hrl, 1).


-define(SwitchSettingClose,	false).
-define(SwitchSettingOpen, 	true).

-define(SettingGetError,	-1).

%% 数值类设置
-record(valueSet, {
				   index = 0,
				   value = 0
				  }).


%% 开关类设置的位数（32位）
-define(Setting_Switch_BitSize, 32).

%% 全局数值类变量，占5000个32位整数
-define(Setting_GlobalVar_Start, 1).
%% 好友互赠幸运币抽奖几率($0)
%% GlobalVar_LuckyDrawOdd = 2,
%% 内测送出pad兑换道具的个数计数
-define(Setting_GlobalVar_TestActivityGivePadItemNumber, 3).
%% 活动开关控制组1(每组控制32个活动的开启与关闭)
-define(Setting_GlobalVar_Activity_Switch_1, 4).
-define(Setting_GlobalVar_End, 5000).

%% 世界数值类变量，占5000个32位整数
-define(Setting_WorldVar_Start, 5001).
-define(Setting_WorldVar_End, 10000).

%% 客户端只读全局数值类变量，占5000个32位整数
%% (@)客户端只读全局数值变量开始
-define(Setting_GlobalVarReadOnly_Start, 10001).
%% (@)客户端只读全局数值变量结束
-define(Setting_GlobalVarReadOnly_End, 15000).

%% 客户端只读世界数值类变量，占5000个32位整数
%% (@)客户端只读世界数值类变量开始
-define(Setting_WorldVarReadOnly_Start, 15001).
%% (@)客户端只读世界数值类变量结束
-define(Setting_WorldVarReadOnly_End, 20000).

%% 玩家数值类变量，占5000个32位整数
%% (@)玩家数值类变量开始
-define(Setting_PlayerVar_Start, 20001).
%% 玩家领取排行榜奖励的时间($0)
-define(Setting_PlayerVar_GetRankPrizeTime, 20002).
%% (@)玩家数值类变量结束
-define(Setting_PlayerVar_End, 25000).

%% 玩家只读数值类变量，占5000个32位整数
%% (@)玩家只读数值变量开始
-define(Setting_PlayerVarReadOnly_Start, 25001).
%% (@)玩家累计登录天数（七日签到相关，有等级限制） ($0)
-define(Setting_PlayerVarReadOnly_AccLoginDay, 25002).
%% (@)玩家在世界BOSS战中对BOSS产生的伤害 ($0)
-define(Setting_PlayerVarReadOnly_WorldBossDamage, 25003).
%% (@)玩家世界BOSS战对BOSS产生伤害的截止日期时间 ($0)
-define(Setting_PlayerVarReadOnly_WorldBossDamage_ExpireDateTime, 25004).
%% (@)玩家累计充值的数量 ($0)
-define(Setting_PlayerVarReadOnly_AccCharge, 25008).
%% (@)玩家根据累计充值数量，已经领取的充值奖励等级，其中高16位为7日累计充值等级，低16位为总累计充值等级（特别注意不能跳领） ($0)
-define(Setting_PlayerVarReadOnly_GetAccChargePrizeLevel, 25009).
%% (@)月卡或者年卡，玩家的充值等级和根据充值等级领取奖励的累计天数，其中高16位为充值等级，低16位为根据充值等级领取奖励的累计天数 ($0)
-define(Setting_PlayerVarReadOnly_ChargeCardLevelAndGetPrizeDay, 25010).
%% (@)玩家充值的月卡或者年卡的开始时间($0)
-define(Setting_PlayerVarReadOnly_ChargeCardBeginTime, 25011).
%% (@)玩家充值的月卡或者年卡的过期时间($0)
-define(Setting_PlayerVarReadOnly_ChargeCardEndTime, 25012).
%% (@)玩家位flag(低1位：日本评分)
-define(Setting_PlayerVarReadOnly_BitFlag, 25013).
%% (@)韩国成长礼包的领取(根据玩家等级来领，低16位来表示，高16表示是否开启)
-define(Setting_PlayerVarReadOnly_KoreaGift, 25014).
%% (@)玩家被拉黑次数($0)
-define(Setting_PlayerVarReadOnly_BeBlackCount, 25015).
%% (@)玩家收到的赞($0)===========已废弃，点赞由身份证功能模块管理，参考playerIdentity
-define(Setting_PlayerVarReadOnly_BeLike, 25016).
%% (@)玩家上次记录的弧度制经度十万倍取整[-PI * 100000, +PI * 100000]($0)
-define(Setting_PlayerVarReadOnly_RatLongitudeHT, 25017).
%% (@)玩家上次记录的弧度制纬度十万倍取整[-PI / 2 * 100000, +PI / 2 * 100000]($0)
-define(Setting_PlayerVarReadOnly_RatLatitudeHT, 25018).
%% (@)玩家当次已领取的雪人礼盒，按位标记领取了哪个雪人($0)
-define(Setting_PlayerVarReadOnly_SnowmanGift, 25019).
%% (@)记录最后一次领取雪人礼盒的时间，用于辅助PlayerVarReadOnly_SnowmanGift变量的重置($0)
-define(Setting_PlayerVarReadOnly_SnowmanGiftLastTime, 25020).
%% (@)玩家累计登录天数（通用，无等级限制） ($0)
-define(Setting_PlayerVarReadOnly_AccLoginDayAll, 25021).
%% (@)玩家只读数值变量结束
-define(Setting_PlayerVarReadOnly_End, 30000).

%% 代客户端保存的数值类变量，占15000个32位整数
%% (@)客户端自己需要服务器代存的数值变量开始
-define(Setting_ClientVar_Start, 35001).
%% (*)玩家自动使用药品ID($0)
-define(Setting_ClientVar_AutoHeal_ItemID, 35002).
%% (*)玩家自动喝血百分比($60)
-define(Setting_ClientVar_AutoHeal_HP_PerSystemMsg, 35003).
%% (*)主界面状态($1)
-define(Setting_ClientVar__MainStyle, 35004).
%% (*)客户端检验日常登陆($0)
-define(Setting_ClientVar_DailyInfo, 35005).
%% (*)客户端存储上次地图传送时间($0)
-define(Setting_ClientVar_MapTeleportData, 35006).
%% (*)一次进入副本114引导标记($0)
-define(Setting_ClientVar_FirestEnterInstance114, 35007).
%% (*)一次进入副本101引导标记($0)
-define(Setting_ClientVar_FirestEnterInstance101, 35008).
%% (*)客户端检验王者膜拜日常($0)
-define(Setting_ClientVar_DailyInfo_ArenaKingWorship, 35009).
%% (*)客户端显示的同屏玩家数量($5)
-define(Setting_ClientVar_ScreenPlayerNumber, 35010).
%% (*)地图是否第一次进入信息开始字段
-define(Setting_ClientVar_FirstEnterMap_Start, 40000).
%% (@)客户端自己需要服务器代存的数值变量结束
-define(Setting_ClientVar_End, 50000).

%% 全局开关类变量,占1000个32位整数,范围(50100 ~ 51100),50100*32=1603200,51100*32=1635200
-define(Setting_GlobalBitVar_StartBit, 1603200).
%% 世界BOSS战开启状态($0)
%% GlobalBitVar_WorldBossWar_Running = 1603201,
%% 等级开关($0)
%% GlobalBitVar_Level_Running = 1603202,
%% 日志3dgamedatalog库开关($1)
-define(Setting_GlobalBitVar_WriteLog, 1603203).
%% 日志文件开关
%% GlobalBitVar_WriteLog_File = 1603204,
%% 特殊事件位开关
-define(Setting_GlobalBitVar_Special, 1603205).
-define(Setting_GlobalBitVar_EndBit, 1635200).

%% 世界开关类变量,占1000个32位整数,范围(51200 ~ 52200),51200*32=1638400,52200*32=1670400
-define(Setting_WorldBitVar_StartBit, 1638400).
-define(Setting_WorldBitVar_EndBit, 1670400).

%% 请注意，默认打开的开关，需要在开关初始化中自行初始化
%% 客户端只读全局开关类变量,占1000个32位整数,范围(52300 ~ 53300),52300*32=1673600,53300*32=1705600
%% (@)客户端只读全局开关类变量开始
-define(Setting_GlobalBitVarReadOnly_StartBit, 1673600).
%% (@)废弃或者不确定是否使用-请联合客户端查询__QQ群号($0)
-define(Setting_GlobalBitVarReadOnly_Hide_QQ, 1673601).
%% (@)激活码($1)
-define(Setting_GlobalBitVarReadOnly_Hide_ActiveCode, 1673602).
%% (@)废弃或者不确定是否使用-请联合客户端查询__手机号绑定($0)
-define(Setting_GlobalBitVarReadOnly_Hide_MobileBind, 1673603).
%% (@)废弃或者不确定是否使用-请联合客户端查询__手动更新按钮($0)
-define(Setting_GlobalBitVarReadOnly_Hide_ManualUpdate, 1673604).
%% (@)排行榜功能($1)
-define(Setting_GlobalBitVarReadOnly_Hide_Rank, 1673605).
%% (@)BUG提交按钮($1)
-define(Setting_GlobalBitVarReadOnly_Hide_BugReport, 1673606).
%% (@)废弃或者不确定是否使用-请联合客户端查询__幸运抽奖功能($0)
-define(Setting_GlobalBitVarReadOnly_Hide_LuckyDraw, 1673607).
%% (@)充值按钮($0)
-define(Setting_GlobalBitVarReadOnly_Hide_ChargeButton, 1673608).
%% (@)每日累充奖励($0)
-define(Setting_GlobalBitVarReadOnly_Hide_Daily_AccCharge, 1673609).
%% (@)废弃或者不确定是否使用-请联合客户端查询__更新和更新提示($0)
-define(Setting_GlobalBitVarReadOnly_Hide_GameResourceUpdate, 1673610).
%% (@)传送按钮($1)
-define(Setting_GlobalBitVarReadOnly_Hide_TransButton, 1673611).
%% (@)月卡福利($1)
-define(Setting_GlobalBitVarReadOnly_Hide_MonWelfare, 1673612).
%% (@)占卜抽奖($0)
-define(Setting_GlobalBitVarReadOnly_Lottery, 1673613).
%% (@)充值活动($1)
-define(Setting_GlobalBitVarReadOnly_RechargeActivity, 1673614).
%% (@)深红溶渊($1)
-define(Setting_GlobalBitVarReadOnly_Darkness, 1673615).
%% (@)新骑宠领地($1)
-define(Setting_GlobalBitVarReadOnly_PetBattle, 1673616).
%% (@)福利按钮($1)
-define(Setting_GlobalBitVarReadOnly_WelfareBtn, 1673617).
%% (@)商城按钮($1)
-define(Setting_GlobalBitVarReadOnly_ShopBtn, 1673618).
%% (@)神秘商店按钮($1)
-define(Setting_GlobalBitVarReadOnly_SecretShopBtn, 1673619).
%% (@)废弃或者不确定是否使用-请联合客户端查询__时空裂痕按钮($0)
-define(Setting_GlobalBitVarReadOnly_RiftBtn, 1673620).
%% (@)废弃或者不确定是否使用-请联合客户端查询__哥布林盗宝贼踪迹按钮($0)
-define(Setting_GlobalBitVarReadOnly_StealBtn, 1673621).
%% (@)惊天喵盗团($1)
-define(Setting_GlobalBitVarReadOnly_CoinBtn, 1673622).
%% (@)废弃或者不确定是否使用-请联合客户端查询__藏宝海湾按钮($0)
-define(Setting_GlobalBitVarReadOnly_BuriedBtn, 1673623).
%% (@)世界BOSS按钮($0)
-define(Setting_GlobalBitVarReadOnly_LeaderBtn, 1673624).
%% (@)废弃或者不确定是否使用-请联合客户端查询__幸运选择题按钮($0)
-define(Setting_GlobalBitVarReadOnly_LuckAnswerBtn, 1673625).
%% (@)废弃或者不确定是否使用-请联合客户端查询__守护碧空城按钮($0)
-define(Setting_GlobalBitVarReadOnly_GuardCityBtn, 1673626).
%% (@)废弃或者不确定是否使用-请联合客户端查询__客户端更新后是否自动关闭客户端($0)
-define(Setting_GlobalBitVarReadOnly_CloseAfterUpdate, 1673627).
%% (@)废弃或者不确定是否使用-请联合客户端查询__混沌战场按钮($0)
-define(Setting_GlobalBitVarReadOnly_HDBattle, 1673628).
%% (@)废弃或者不确定是否使用-请联合客户端查询__春节活动开关($0)
-define(Setting_GlobalBitVarReadOnly_NewYearAct, 1673629).
%% (@)废弃或者不确定是否使用-请联合客户端查询__成长礼包按钮($0)
-define(Setting_GlobalBitVarReadOnly_GrowUp, 1673630).
%% (@)废弃或者不确定是否使用-请联合客户端查询__优惠推送按钮($0)
-define(Setting_GlobalBitVarReadOnly_RebatePush, 1673631).
%% (@)跨服战场($0)
-define(Setting_GlobalBitVarReadOnly_CrossServerBattle, 1673632).
%% (@)跨服竞技场($0)
-define(Setting_GlobalBitVarReadOnly_CrossServerArena, 1673633).
%% (@)facebook($0)
-define(Setting_GlobalBitVarReadOnly_FaceBook, 1673634).
%% (@)五星好评($0)
-define(Setting_GlobalBitVarReadOnly_FiveStar, 1673635).
%% (@)沙盘PVP($0)
-define(Setting_GlobalBitVarReadOnly_GuildExpedition, 1673636).
%% (@)玩家个性展示($1)
-define(Setting_GlobalBitVarReadOnly_PersonalityInfo, 1673637).
%% (@)世界守护活动($0)
-define(Setting_GlobalBitVarReadOnly_KingBattleAll, 1673638).
%% (@)马车劫掠($0)
-define(Setting_GlobalBitVarReadOnly_EscortGoods, 1673639).
%% (@)装备冲星($1)
-define(Setting_GlobalBitVarReadOnly_equipStar, 1673640).
%% (@)翅膀($1)
-define(Setting_GlobalBitVarReadOnly_playerWing, 1673641).
%% (@)符文($0)
-define(Setting_GlobalBitVarReadOnly_PlayerRune, 1673642).
%% (@)婚姻($0)
-define(Setting_GlobalBitVarReadOnly_WeddingSite, 1673643).
%% (@)交易行是否扣税($1)
-define(Setting_GlobalBitVarReadOnly_PlayerTradeTax, 1673644).
%% (@)扭蛋($0)
-define(Setting_GGlobalBitVarReadOnly_Hide_LOTTERY_SYS, 1673645).
%% (@)打开充值more按钮($0)
-define(Setting_GGlobalBitVarReadOnly_RechargeMore, 1673646).
%% (@)打开第三方充值页签按钮 2016.7.7($0)
-define(Setting_GGlobalBitVarReadOnly_RechargeThirdPartyTab, 1673647).
%% (@)家族堆雪人活动($1)
-define(Setting_GlobalBitVarReadOnly_Snowman, 1673648).
%% (@)交易行($1)
-define(Setting_GlobalBitVarReadOnly_Trade, 1673649).
%% (@)查看远程玩家($0)
-define(Setting_GlobalBitVarReadOnly_RPView, 1673650).
%% (@)同屏策略($0)
-define(Setting_GlobalBitVarReadOnly_Screen, 1673651).
%% (@)家族战($1)
-define(Setting_GlobalBitVarReadOnly_GuildBattle, 1673652).

%% (@)客户端只读全局开关类变量结束
-define(Setting_GlobalBitVarReadOnly_EndBit, 1705600).

%% 客户端只读世界开关类变量,占1000个32位整数,范围(53500 ~ 54500),53500*32=1712000,54500*32=1744000
%% (@)客户端只读世界开关类变量开始
-define(Setting_WorldBitVarReadOnly_StartBit, 1712000).
%% (@)客户端只读世界开关类变量结束
-define(Setting_WorldBitVarReadOnly_EndBit, 1744000).

%% 玩家开关类变量,占5000个32位整数,范围(55300 ~ 60300),55300*32=1769600,60300*32=1929600
%% (@)玩家开关类变量开始
-define(Setting_PlayerBitVar_StartBit, 1769600).
%% (@)玩家是否只接收好友的邮件($0)
-define(Setting_PlayerBitVar_OnlyReceiveFriendMail, 1769601).
%% (@)拒绝所有队伍邀请($0)
-define(Setting_PlayerBitVar_RejectTeamRequest, 1769602).
%% (@)接收世界消息($1)
-define(Setting_PlayerBitVar_WorldChatMsg, 1769603).
%% (@)接收私聊消息($1)
-define(Setting_PlayerBitVar_PrivateChatMsg, 1769604).
%% (@)接收队伍消息($1)
-define(Setting_PlayerBitVar_TeamChatMsg, 1769605).
%% (@)接收公会消息($1)
-define(Setting_PlayerBitVar_GuildChatMsg, 1769606).
%% (@)接收系统消息($1)
-define(Setting_PlayerBitVar_SystemMsg, 1769607).
%% (@)接受喇叭消息($1)
-define(Setting_PlayerBitVar_Horn, 1769608).
%% (@)机器人自动答题($1)
-define(Setting_PlayerBitVar_RobitAnswer, 1769609).
%% (@)玩家开关类变量结束
-define(Setting_PlayerBitVar_EndBit, 1929600).

%% 玩家只读开关类变量,占5000个32位整数,范围(60500 ~ 65500),60500*32=1936000,60300*32=2096000
%% (@)玩家只读开关类变量开始，索引60500
-define(Setting_PlayerBitVarReadOnly_StartBit, 1936000).
%% (@)玩家进游戏第一次签到奖励，索引60500 ($0)
-define(Setting_PlayerBitVarReadOnly_SignPrize1, 1936001).
%% (@)玩家进游戏第二次签到奖励，索引60500 ($0)
-define(Setting_PlayerBitVarReadOnly_SignPrize2, 1936002).
%% (@)玩家进游戏第三次签到奖励，索引60500 ($0)
-define(Setting_PlayerBitVarReadOnly_SignPrize3, 1936003).
%% (@)玩家进游戏第四次签到奖励，索引60500 ($0)
-define(Setting_PlayerBitVarReadOnly_SignPrize4, 1936004).
%% (@)玩家进游戏第五次签到奖励，索引60500 ($0)
-define(Setting_PlayerBitVarReadOnly_SignPrize5, 1936005).
%% (@)玩家进游戏第六次签到奖励，索引60500 ($0)
-define(Setting_PlayerBitVarReadOnly_SignPrize6, 1936006).
%% (@)玩家进游戏第七次签到奖励，索引60500 ($0)
-define(Setting_PlayerBitVarReadOnly_SignPrize7, 1936007).
%% (@)玩家绑定手机号后给的奖励，索引60500 ($0)
-define(Setting_PlayerBitVarReadOnly_BindPhonePrize, 1936008).

%% (@)玩家领取爵位（VIP）奖励，预留32*4 = 128个爵位等级，目前只使用到16个，索引60503 ($0)
-define(Setting_PlayerBitVarReadOnly_GetVipRewardByLV1, 1936096).
%% (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
-define(Setting_PlayerBitVarReadOnly_GetVipRewardByLV2, 1936097).
%% (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
-define(Setting_PlayerBitVarReadOnly_GetVipRewardByLV3, 1936098).
%% (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
-define(Setting_PlayerBitVarReadOnly_GetVipRewardByLV4, 1936099).
%% (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
-define(Setting_PlayerBitVarReadOnly_GetVipRewardByLV5, 1936100).
%% (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
-define(Setting_PlayerBitVarReadOnly_GetVipRewardByLV6, 1936101).
%% (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
-define(Setting_PlayerBitVarReadOnly_GetVipRewardByLV7, 1936102).
%% (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
-define(Setting_PlayerBitVarReadOnly_GetVipRewardByLV8, 1936103).
%% (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
-define(Setting_PlayerBitVarReadOnly_GetVipRewardByLV9, 1936104).
%% (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
-define(Setting_PlayerBitVarReadOnly_GetVipRewardByLV10, 1936105).
%% (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
-define(Setting_PlayerBitVarReadOnly_GetVipRewardByLV11, 1936106).
%% (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
-define(Setting_PlayerBitVarReadOnly_GetVipRewardByLV12, 1936107).
%% (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
-define(Setting_PlayerBitVarReadOnly_GetVipRewardByLV13, 1936108).
%% (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
-define(Setting_PlayerBitVarReadOnly_GetVipRewardByLV14, 1936109).
%% (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
-define(Setting_PlayerBitVarReadOnly_GetVipRewardByLV15, 1936110).
%% (@)玩家领取爵位（VIP）奖励 ($0)，索引60503
-define(Setting_PlayerBitVarReadOnly_GetVipRewardByLV16, 1936111).

%% (@)玩家只读开关类变量结束
-define(Setting_PlayerBitVarReadOnly_EndBit, 2096000).

%% 变量最大索引值
-define(Setting_VarMaxIndex, 65535).

%%% ==============================================================
%%% @doc 玩家能够恢复的设置项的默认值
%%% ==============================================================
-define(Setting_Default_Values,
        [
		 {25002, 0},
		 {25003, 0},
		 {25004, 0},
		 {25008, 0},
		 {25009, 0},
		 {25010, 0},
		 {25011, 0},
		 {25012, 0},
		 {25015, 0},
		 {25016, 0},
		 {25017, 0},
		 {25018, 0},
		 {25019, 0},
		 {25020, 0},
		 {25021, 0},
		 {35002, 0},
		 {35003, 60},
		 {35004, 1},
		 {35005, 0},
		 {35006, 0},
		 {35007, 0},
		 {35008, 0},
		 {35009, 0},
		 {35010, 5},
		 {1673601, 0},
		 {1673602, 1},
		 {1673603, 0},
		 {1673604, 0},
		 {1673605, 1},
		 {1673606, 1},
		 {1673607, 0},
		 {1673608, 0},
		 {1673609, 0},
		 {1673610, 0},
		 {1673611, 1},
		 {1673612, 1},
		 {1673613, 0},
		 {1673614, 1},
		 {1673615, 1},
		 {1673616, 1},
		 {1673617, 1},
		 {1673618, 1},
		 {1673619, 1},
		 {1673620, 0},
		 {1673621, 0},
		 {1673622, 1},
		 {1673623, 0},
		 {1673624, 0},
		 {1673625, 0},
		 {1673626, 0},
		 {1673627, 0},
		 {1673628, 0},
		 {1673629, 0},
		 {1673630, 0},
		 {1673631, 0},
		 {1673632, 0},
		 {1673633, 0},
		 {1673634, 0},
		 {1673635, 0},
		 {1673636, 0},
		 {1673637, 1},
		 {1673638, 0},
		 {1673639, 0},
		 {1673640, 1},
		 {1673641, 1},
		 {1673642, 0},
		 {1673643, 0},
		 {1673644, 1},
		 {1673645, 0},
		 {1673646, 0},
		 {1673647, 0},
		 {1673648, 1},
		 {1673649, 1},
		 {1673650, 0},
		 {1673651, 0},
		 {1673652, 1},
		 {1769601, 0},
		 {1769602, 0},
		 {1769603, 1},
		 {1769604, 1},
		 {1769605, 1},
		 {1769606, 1},
		 {1769607, 1},
		 {1769608, 1},
		 {1769609, 1},
		 {1936001, 0},
		 {1936002, 0},
		 {1936003, 0},
		 {1936004, 0},
		 {1936005, 0},
		 {1936006, 0},
		 {1936007, 0},
		 {1936008, 0},
		 {1936096, 0},
		 {1936097, 0},
		 {1936098, 0},
		 {1936099, 0},
		 {1936100, 0},
		 {1936101, 0},
		 {1936102, 0},
		 {1936103, 0},
		 {1936104, 0},
		 {1936105, 0},
		 {1936106, 0},
		 {1936107, 0},
		 {1936108, 0},
		 {1936109, 0},
		 {1936110, 0},
		 {1936111, 0}
        ]).


%%% ==============================================================
%%% @doc 服务器需要检测的协议Key
%%% ==============================================================
-define(Setting_Server_Needs,
        [
		 10001,
		 15000,
		 15001,
		 20000,
		 20001,
		 25000,
		 25001,
		 25002,
		 25003,
		 25004,
		 25008,
		 25009,
		 25010,
		 25011,
		 25012,
		 25013,
		 25014,
		 25015,
		 25016,
		 25017,
		 25018,
		 25019,
		 25020,
		 25021,
		 30000,
		 35001,
		 50000,
		 1673600,
		 1673601,
		 1673602,
		 1673603,
		 1673604,
		 1673605,
		 1673606,
		 1673607,
		 1673608,
		 1673609,
		 1673610,
		 1673611,
		 1673612,
		 1673613,
		 1673614,
		 1673615,
		 1673616,
		 1673617,
		 1673618,
		 1673619,
		 1673620,
		 1673621,
		 1673622,
		 1673623,
		 1673624,
		 1673625,
		 1673626,
		 1673627,
		 1673628,
		 1673629,
		 1673630,
		 1673631,
		 1673632,
		 1673633,
		 1673634,
		 1673635,
		 1673636,
		 1673637,
		 1673638,
		 1673639,
		 1673640,
		 1673641,
		 1673642,
		 1673643,
		 1673644,
		 1673645,
		 1673646,
		 1673647,
		 1673648,
		 1673649,
		 1673650,
		 1673651,
		 1673652,
		 1705600,
		 1712000,
		 1744000,
		 1769600,
		 1769601,
		 1769602,
		 1769603,
		 1769604,
		 1769605,
		 1769606,
		 1769607,
		 1769608,
		 1769609,
		 1929600,
		 1936000,
		 1936001,
		 1936002,
		 1936003,
		 1936004,
		 1936005,
		 1936006,
		 1936007,
		 1936008,
		 1936096,
		 1936097,
		 1936098,
		 1936099,
		 1936100,
		 1936101,
		 1936102,
		 1936103,
		 1936104,
		 1936105,
		 1936106,
		 1936107,
		 1936108,
		 1936109,
		 1936110,
		 1936111,
		 2096000
        ]).


-endif.

% EOF

