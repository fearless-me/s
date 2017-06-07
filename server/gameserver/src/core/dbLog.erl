%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2015, <公司>
%%% @doc
%%%
%%% @end
%%% Created : 02. 七月 2015 14:15
%%%-------------------------------------------------------------------

-module(dbLog).
-author("ZhongYuanWei").

-include("gsInc.hrl").
-include("playerLog.hrl").
-include("setupLang.hrl").
-include("gamedataLog.hrl").

%% API
-export([
	sendSaveLogPlayerLogin/10,
	sendSaveLogChat/4,
	sendSaveLogCreateGoods/9,
	sendSaveLogCreateTitle/3,
	sendSaveLogCoinChange/2,
	sendSaveLogCreatePet/2,
	sendSaveLogCreatePlayer/8,
	sendSaveLogChangeExp/7,
	sendSaveLogGold/1,
	sendSaveLogChangeGoods/1,
	sendSaveLogChangeGoods/2,
	sendSaveLogMailChange/3,
	sendSaveLogMallBuy/5,
	sendSaveLogOnlinePlayer/1,
	sendSaveLogPet/5,
	sendSaveLogDelPlayer/10,
	sendSaveLogFriend/1,
	sendSaveLogMarriage/1,
	sendSaveLogPlayerOffline/6,
	sendSaveLogPlayerLevel/4,
	sendSaveLogSkill/3,
	sendSaveLogTask/4,
	sendSaveLogPresentRecharge/9,
	sendSaveLogRecharge/3,
	sendSaveLogRecharge/4,
	sendSaveLogTrade/1,
	sendSaveLogTradeOp/1,
	sendSaveLogGMCmd/2,
	sendSaveLogPlayerCoupleBack/1,
	sendSaveLogForbidden/4,
	sendSaveLogActivityHDHurt/1,
	sendSaveLogEventID/5,
	sendSaveLogActivityHDKill/1,
	sendSaveLogAchieveNum/5,
	sendSaveLogPetUpStar/4,
	sendSaveLogPetCast/6,
	sendSaveLogPetRaw/4,
	sendSaveLogPetEquipStr/5,
	sendSaveLogRoleExt/4,
	sendSaveLogGuildBattleInfo/1,
	sendSaveLogParticipatorInfo/1,
	sendSaveLogWeaponInfo/1,
	sendSaveLogRune/1,
	sendSaveLogRedEnvelope/1,
	sendSaveLogRank/1,
	sendSaveLogChangeRoleOwner/2,
	sendSaveLogCopyInfo/1
]).

sendSaveLogChangeRoleOwner(LogType, #rec_log_change_role_owner{} = Rec) ->
	sendMsg2LogDBServer(LogType, Rec#rec_log_change_role_owner{time = time:getLogTimeSec()}),
	ok.

%%帐号登陆日志
sendSaveLogPlayerLogin(AccountID, PlatformAccountID, PlatformID, VersionClientExe, VersionClientRes, Ip, Mac, IMEI, IDFA, GlobalClientSetupKey) ->
	sendMsg2LogDBServer(?LogType_AccountLogin,
		#recLogAccountLogin{
			accountID = AccountID,							%%帐号ID
			platformAccountID = PlatformAccountID,			%%平台帐号
			platformID = PlatformID,						%%平台ID
			versionClientExe = VersionClientExe,			%%客户端执行段版本号
			versionClientRes = VersionClientRes,			%%客户端资源版本号
			ip = Ip,										%%用户登录IP
			mac = Mac,										%%用户MAC地址
			imei = IMEI,									%%用户IMEI串号（Android才有）
			idfa = IDFA,									%%用户广告标识（IOS7才有）
			globalClientSetupKey = GlobalClientSetupKey,	%%客户端安装唯一标识
			time = time:getLogTimeSec()
		}).

%%聊天记录日志
sendSaveLogChat(SendPlayerID, Receiveplayerid, ChatString, ChatChannel) ->
	sendMsg2LogDBServer(?LogType_ChatInfo,
		#recLogChatInfo{
			sendPlayerID = SendPlayerID,               	%%发送者玩家ID，=0表示系统发送
			receiveplayerid = Receiveplayerid,			%%接收者玩家ID
			chatString = ChatString,					%%聊天内容
			chatChannel = ChatChannel,					%%聊天频道（1.世界，2.私聊，3.队伍，4.帮会，5.系统）
			time = time:getLogTimeSec()						%%发送时间
		}).

%%发送创建物品消息到日志服务
sendSaveLogCreateGoods(Playerid, GoodsUID, GoodsID, PileNum, IsBind, BagType, CurEnhLevel, Quality,
	#recPLogTSItem{changReason = CreateReson,reasonParam = CreateFromParam} = TS) ->
	sendMsg2LogDBServer(?LogType_CreateGoods,
		#recLogCreateGoods{
			ownerID = Playerid, 				%%拥有者ID
			goodsUID = GoodsUID, 				%%物品ID
			goodsID = GoodsID, 					%%物品所在背包
			pileNum = PileNum, 					%%物品数量
			isBinded = IsBind, 					%%是否绑定，（0=未绑定，1=绑定）
			bagType = BagType, 					%%物品所在背包
			curEnhLevel = CurEnhLevel, 			%%装备强化等级
			quality = Quality, 					%%装备品质
			createReson = CreateReson, 			%%创建物品原因码
			createFromParam = CreateFromParam, 	%%创建来源参数
			time = time:getLogTimeSec()				%%时间
		}),
	NRec = #recLogGoodsChange{
		itemUID = GoodsUID,
		itemID = GoodsID,
		old = 0,
		new = PileNum,
		change = PileNum,
		target = ?PLogTS_PlayerSelf,
		source = ?PLogTS_System,
		gold = 0,
		goldtype = 0,
		changReason = CreateReson,
		reasonParam = CreateFromParam
	},
	sendSaveLogChangeGoods(NRec,TS).

%%发送称号创建的日志
sendSaveLogCreateTitle(RoleID,TitleID,Source) ->
	sendMsg2LogDBServer(?LogType_Title,
		#recLogCreateTitle{
			playerID = RoleID,						%%角色ID
			titleID = TitleID,						%%称号ID
			source = Source,						%%来源
			time = time:getLogTimeSec()					%%时间
		}).

%%发送领取离线经验日志
sendSaveLogRoleExt(RoleID, TotalTime, RewardNum, RewaredType) ->
	case TotalTime > 0 of
		true ->
			sendMsg2LogDBServer(?LogType_RoleExt,
				#recLogRoleExt{
					roleID = RoleID,
					totalOfflineTime = TotalTime,
					rewardNum = RewardNum,
					rewardType = RewaredType,
					time = time:getLogTimeSec()
				});
		_ ->
			ok
	end.

%%货币变化日志
sendSaveLogCoinChange(_CoinType, #recLogCoin{} = Rec) ->
	sendMsg2LogDBServer(?LogType_Coin, Rec#recLogCoin{time = time:getLogTimeSec()}).

%%宠物创建
sendSaveLogCreatePet(Playerid, PetInfo ) ->
	sendMsg2LogDBServer(?LogType_CreatePet,
		#recLogCreatePet{
			playerID = Playerid,								%%角色ID
			petID = PetInfo#recPetInfo.pet_id,					%% 宠物ID
			time = time:getLogTimeSec()							%%时间
		}).

%%宠物升星
sendSaveLogPetUpStar(Playerid, PetId, OldStar, NewStar) ->
	sendMsg2LogDBServer(?LogType_PetUpStar,
		#recLogPetUpStar{
			playerID = Playerid,
			petID = PetId,
			newStar = NewStar,
			oldStar = OldStar,
			time = time:getLogTimeSec()
		}).

%%宠物升星
sendSaveLogPetRaw(Playerid, PetId, OldRaw, NewRaw) ->
	sendMsg2LogDBServer(?LogType_PetRaw,
		#recLogPetRaw{
			playerID = Playerid,
			petID = PetId,
			newRaw = NewRaw,
			oldRaw = OldRaw,
			time = time:getLogTimeSec()
		}).

%%宠物洗练
sendSaveLogPetCast(Playerid, PetId, OldSkillID, NewSkillID, OldSkillLevel, NewSkillLevel) ->
	sendMsg2LogDBServer(?LogType_PetSkillCast,
		#recLogPetCast{
			playerID = Playerid,
			petID = PetId,
			oldSkillID = OldSkillID,
			oldSkillLevel = OldSkillLevel,
			newSkillID = NewSkillID,
			newSkillLevel = NewSkillLevel,
			time = time:getLogTimeSec()
		}).


%%宠物装备强化
sendSaveLogPetEquipStr(Playerid, OldEquipID, NewEquipID, OldLevel, NewLevel) ->
	sendMsg2LogDBServer(?LogType_PetEquipStr,
		#recLogPetEquipStr{
			playerID = Playerid,
			oldEquipID = OldEquipID,
			newLevel = NewLevel,
			oldLevel = OldLevel,
			newEquipID = NewEquipID,
			time = time:getLogTimeSec()
		}).

%%角色创建日志
sendSaveLogCreatePlayer(Playerid, Name, AccountID, Sex, Camp, Race, Career,_FuncellInfo) ->
	sendMsg2LogDBServer(?LogType_CreatePlayer,
		#recLogCreatePlayer{
			playerID = Playerid,					%%角色ID
			name = Name,							%%角色名字
			accountID = AccountID,					%%角色帐号ID
			sex = Sex,								%%性别,0为女，1为男
			camp = Camp,							%%阵营
			race = Race,							%%种族
			career = Career,						%%职业
			time = time:getLogTimeSec()				%%时间
		}).

%%经验修改日志
sendSaveLogChangeExp(Playerid, OldLevel, NewLevel, ChangeType, ChangeValue, CurExp, ChnagePrama) ->
	sendMsg2LogDBServer(?LogType_ExpChange,
		#recLogExpChange{
			playerID = Playerid,					%%角色ID
			oldLevel = OldLevel,					%%加经验之前的等级
			newLevel = NewLevel,					%%加经验之后的等级
			changType = ChangeType,					%%经验改变类型
			changValue = ChangeValue,				%%经验改变值
			changePrama = ChnagePrama,				%%经验改变来源参数
			time = time:getLogTimeSec(),			%%时间
			curExp = CurExp
		}).

%%金币消费日志
sendSaveLogGold(#recLogGold{} = Rec) ->
	sendMsg2LogDBServer(?LogType_Gold, Rec#recLogGold{time = time:getLogTimeSec()}),
	ok.

%%物品修改日志
%%fixme 这里还有使用玩家的进程字典，所以此函数只能玩家进程调用，后面来优化
sendSaveLogChangeGoods(#recLogGoodsChange{} = Rec, #recPLogTSItem{old = Old,new = New,change = Change} = TS) ->
	CV = case Old > New of
			 true ->
				 -Change;
			 _ ->
				 Change
		 end,
	NRec = Rec#recLogGoodsChange{
		old = Old,
		new = New,
		change = CV,
		target = TS#recPLogTSItem.target,
		source = TS#recPLogTSItem.source,
		gold = TS#recPLogTSItem.gold,
		goldtype = TS#recPLogTSItem.goldtype,
		changReason = TS#recPLogTSItem.changReason,
		reasonParam = TS#recPLogTSItem.reasonParam
	},
	sendSaveLogChangeGoods(NRec).

%%fixme 这里还有使用玩家的进程字典，所以此函数只能玩家进程调用，后面来优化
sendSaveLogChangeGoods(#recLogGoodsChange{playerID = PlayerID, accountID = AccountID, itemID = ItemID} = Rec) ->
	%%如果是宝石以及装备则默认都需要记录日志，普通道具根据策划配置决定是否记录
	IsNeedLog = case goods:getGoodsCfg(ItemID) of
					#itemCfg{itemType = ?ItemTypeGem} ->
						true;
					#itemCfg{itemType = ?ItemTypeDiamondCard} ->
						true;
					#itemCfg{needSaveLog = NeedSaveLog} when NeedSaveLog =:= 1 ->
						true;
					#equipmentCfg{} ->
						true;
					#runeCfg{} ->
						true;
					_ ->
						false
				end,
	case IsNeedLog of
		true ->
			NRec1 = case PlayerID =:= undefined orelse PlayerID =:= 0 orelse AccountID =:= undefined of
						true ->
							%% 特殊处理一些奇怪的日志
							NewAccountID = case playerState:getAccountID() of
											   undefined -> 888;
											   V1 -> V1
										   end,
							NewPlayerID = case playerState:getRoleID() of
											  undefined -> 777;
											  V2 -> V2
										  end,
							Rec#recLogGoodsChange{playerID = NewPlayerID, accountID = NewAccountID};
						_ ->
							Rec
					end,
			{_Fgi,_FedID,PlatformName} = playerState:getFuncellInfo(),
			NRec2 = NRec1#recLogGoodsChange{platformName = PlatformName, dbID = gsMainLogic:getDBID4GS(), time = time:getLogTimeSec()},
			sendMsg2LogDBServer(?LogType_GoodsChange, NRec2);
		_ ->
			skip
	end,
	ok.

%%邮件修改日志
sendSaveLogMailChange(Playerid, MailUID, ChangeType) ->
	sendMsg2LogDBServer(?LogType_MailChange,
		#recLogMailChange{
			playerID = Playerid,					%%角色ID
			mailUID = MailUID,						%%邮件UID
			changeType = ChangeType,				%%变化原因
			time = time:getLogTimeSec()					%%时间
		}).

%%商城购买日志
sendSaveLogMallBuy(Playerid, ItemDataID, BuyCount, PayMoneyType, PayMoney) ->
	sendMsg2LogDBServer(?LogType_MallBuy,
		#recLogMallBuy{
			playerID = Playerid,						%%角色ID
			itemDataID = ItemDataID,					%%购买物品DataID
			buyCount = BuyCount,						%%购买物品数量
			payMoneyType = PayMoneyType,				%%购买金币类型
			payMoney = PayMoney,						%%购买金币数量
			time = time:getLogTimeSec()						%%时间
		}).

%%在线玩家
sendSaveLogOnlinePlayer(Count) ->
	sendMsg2LogDBServer(?LogType_OnlinePlayers,
		#recLogOnlinePlayers{
			count = Count,						%%在线人数
			time = time:getLogTimeSec()				%%时间
		}).

%%发、抢红包日志
-spec sendSaveLogRedEnvelope(Data::#rec_log_redenvelope{}) ->term().
sendSaveLogRedEnvelope(Data) ->
	sendMsg2LogDBServer(?LogType_RedEnvelope,Data).

%%宠物
sendSaveLogPet(Playerid, PetID, ChangeField, ChangeValue, NewValue) ->
	sendMsg2LogDBServer(?LogType_Pet,
		#recLogPet{
			playerID = Playerid,							%%角色ID
			petID = PetID,									%%宠物ID
			changeField = ChangeField,						%%宠物属性变化字段索引
			changeValue = ChangeValue,						%%宠物属性变化值
			newValue = NewValue,							%%变化后的新值
			time = time:getLogTimeSec()							%%时间
		}).

%%角色删除
sendSaveLogDelPlayer(Playerid, Level, Gold, BindGold, Diamond, Ticket, Prestige, Honor, PurpleEssence, GoldenEssence) ->
	sendMsg2LogDBServer(?LogType_PlayerDelete,
		#recLogPlayerDelete{
			playerID = Playerid,				%%角色ID
			level = Level,						%%等级
			gold = Gold,						%%金币
			bindGold = BindGold,				%%绑定金币
			diamond = Diamond,					%%钻石
			ticket = Ticket,					%%点券
			prestige = Prestige,				%%声望
			honor = Honor,						%%荣誉
			purpleEssence = PurpleEssence,		%%紫色精华
			goldenEssence = GoldenEssence,		%%金色精华
			time = time:getLogTimeSec()			%%时间
		}).

%%好友
sendSaveLogFriend(#rec_log_player_friend{} = Rec) ->
	sendMsg2LogDBServer(?LogType_Friend, Rec).
%%婚姻
sendSaveLogMarriage(#rec_log_player_marriage{} = Rec) ->
	sendMsg2LogDBServer(?LogType_Marriage, Rec).

%%玩家离线
sendSaveLogPlayerOffline(
	#recLogPlayerOffline{} = RecLog,
	_Name,
	_Career,
	_Camp,
	_PlayerOnlineTime,
	{_Fgi,_FedID,_PlatformName}
) ->
	case playerState:getIsPlayer() of
		true ->
			sendMsg2LogDBServer(?LogType_PlayerOffline, RecLog),
			ok;
		_ ->
			skip
	end.

%%玩家等级变化
sendSaveLogPlayerLevel(PlayerID, OldLevel, CurLevel,_FuncellInfo) ->
	sendMsg2LogDBServer(?LogType_PlayerLevel,
		{
			PlayerID,							%%角色ID
			OldLevel,							%%变化前的等级
			CurLevel,					    	%%变化后的等级
			time:getLogTimeSec()				%%时间
		}).

%%技能
sendSaveLogSkill(PlayerID, SkillID, Level) ->
	sendMsg2LogDBServer(?LogType_Skill,
		#recLogSkill{
			playerID = PlayerID,						%%角色ID
			skillID = SkillID,							%%技能ID
			level = Level,								%%角色等级
			time = time:getLogTimeSec()					%%时间
		}).

%%任务
sendSaveLogTask(PlayerID, TaskDataID, Level, Type) ->
	sendMsg2LogDBServer(?LogType_Task,
		#recLogTask{
			playerID = PlayerID,						%%角色ID
			taskDataID = TaskDataID,					%%任务DataID
			level = Level,								%%角色等级
			type = Type,								%%任务事件，（1.接取，2.归还）
			time = time:getLogTimeSec()					%%时间
		}).

%%充值奖励
sendSaveLogPresentRecharge(Orderid, PlatformAccount, PlatformID, AccountID, PlayerID, RechargeAmmount, GetedGold, PresentGold, Reason) ->
	sendMsg2LogDBServer(?LogType_PresentRecharge,
		#recLogPresentRecharge{
			orderid = Orderid,						%%订单号
			platformAccount = PlatformAccount,		%%平台帐号
			platformID = PlatformID,				%%平台ID
			accountID = AccountID,					%%帐号ID
			playerID = PlayerID,					%%角色ID
			rechargeAmmount = RechargeAmmount,		%%充值现实货币
			getedGold = GetedGold,					%%充值获得元宝值
			presentGold = PresentGold,				%%赠送元宝值
			reason = Reason,						%%赠送原因
			time = time:getLogTimeSec()			    %%时间
		}).

%%充值
sendSaveLogRecharge(#recRecharge{} = RechrageInfo,State,ErrorCode) ->
	sendSaveLogRecharge(RechrageInfo,State,ErrorCode,[<<"ignore">>]),
	ok.
sendSaveLogRecharge(#recRecharge{} = RechrageInfo,State,ErrorCode,UMSHttpInfo) ->
	case UMSHttpInfo of
		#rec_http_msg_recharge_info{}->
			UmsHttpInfoJson = ?ENCODE_JSON_BY_RECORD(rec_http_msg_recharge_info,UMSHttpInfo);
		_ ->
			UmsHttpInfoJson=?ENCODE_JSON_BY_KV_LIST(UMSHttpInfo)
	end,
	[#rec_base_role{accountID = AccountID}] = ets:lookup(ets_rec_base_role,RechrageInfo#recRecharge.roleID),
	R = #recLogRecharge{
		accountID = AccountID,
		playerID = RechrageInfo#recRecharge.roleID,
		orderid = RechrageInfo#recRecharge.feOrderID,
		payMoney = RechrageInfo#recRecharge.currencyMoneyAmount,
		gameCoin = RechrageInfo#recRecharge.gameMoneyAmount,
		game_recharge_state=State,
		recharge_item_relation_number=RechrageInfo#recRecharge.item_amount,
		recharge_item_relation_id = RechrageInfo#recRecharge.item_id,
		time = time:getLogTimeSec(),
		error_code = ErrorCode,
		ums_http_json_info =UmsHttpInfoJson
	},
	sendMsg2LogDBServer(?LogType_Recharge, R),
	ok.

%%交易行交易
sendSaveLogTrade(#rec_log_trade{} = Trade) ->
	sendMsg2LogDBServer(?LogType_Trade, Trade#rec_log_trade{time = time:getLogTimeSec()}).

%% 交易行操作
sendSaveLogTradeOp(#rec_log_trade_op{} = Trade) ->
	sendMsg2LogDBServer(?LogType_Trade_OP, Trade#rec_log_trade_op{time = time:getLogTimeSec()}).

%%记录封号
sendSaveLogForbidden(PlayerID,AccountID,Reason,ForbiddenTime) ->
	sendMsg2LogDBServer(?LogType_Forbidden,
		#recForbiddenLog{
			playerID = PlayerID,
			accountID = AccountID,
			reason = Reason,
			forbiddenTime = ForbiddenTime,
			time = time:getLogTimeSec()
		}
	).

%%成就点数日志
sendSaveLogAchieveNum(PlayerID, AchieveID, OldAchieveNum, ModAchieveNum, NewAchieveNum) ->
	sendMsg2LogDBServer(?LogType_AchieveNum,
		#recLogAchieveNum{
			playerID = PlayerID,					%%角色ID
			achieveID = AchieveID,					%%成就ID
			oldAchieveNum = OldAchieveNum,			%%成就点变化前的的值
			modAchieveNum = ModAchieveNum,			%%成就点变化值
			newAchieveNum = NewAchieveNum, 			%%成就点变化后的值
			time = time:getLogTimeSec()				%%时间
		}).

%%代client存日志（主要是充值相关）
sendSaveLogEventID(RoleID,AccountID,EventID, EventTime,EventArgs) ->
	sendMsg2LogDBServer(
		?LogType_EventLog,
		#recLogTypeEventLog{
			roleID = RoleID,
			accountID = AccountID,
			recTime = time:getUTCNowSec(),
			eventID = EventID,
			eventTime = EventTime,
			eventArgs = EventArgs
		}
	).

%%GM指令日志
sendSaveLogGMCmd(SendPlayerID, ChatString) ->
	sendMsg2LogDBServer(?LogType_GMCmd,
		#recLogGMCmd{
			sendPlayerID = SendPlayerID,               	%%发送者玩家ID，=0表示系统发送
			chatString = ChatString,					%%聊天内容
			time = time:getLogTimeSec()					%%发送时间
		}).

%%混沌战场活动给boss伤害日志
sendSaveLogActivityHDHurt(#recLogActivityHDHurt{} = Rec) ->
	sendMsg2LogDBServer(?LogType_HDBattleHurt, Rec).

%%混沌战场活动玩家击杀数量排行榜日志
sendSaveLogActivityHDKill(#recLogActivityHDKill{} = Rec) ->
	sendMsg2LogDBServer(?LogType_HDBattleKill, Rec).

%%玩家反馈日志
-spec sendSaveLogPlayerCoupleBack(#recLogPlayerCB{}) -> ok.
sendSaveLogPlayerCoupleBack(#recLogPlayerCB{} = CB) ->
	sendMsg2LogDBServer(?LogType_PlayerCB, CB),
	ok.

%%参与军团联赛的军团信息
-spec sendSaveLogGuildBattleInfo(Info::#recLogGuildBattleInfo{}) ->ok.
sendSaveLogGuildBattleInfo(Info) ->
	sendMsg2LogDBServer(?LogType_GuildBattleInfo, Info).

%%玩法参与者信息统计
-spec sendSaveLogParticipatorInfo(Info::#recLogParticipatorInfo{}) ->ok.
sendSaveLogParticipatorInfo(Info) ->
	sendMsg2LogDBServer(?LogType_ParticipatorInfo, Info).

-spec sendSaveLogWeaponInfo(Info::#rec_log_god_weapon{}) -> ok.
sendSaveLogWeaponInfo(Info) ->
	sendMsg2LogDBServer(?LogType_WeaponInfo, Info).

%% 副本记录
-spec sendSaveLogCopyInfo(Info::#rec_log_copy{}) -> ok.
sendSaveLogCopyInfo(Info) ->
	sendMsg2LogDBServer(?LogType_CopyInfo, Info).

sendSaveLogRune(#rec_log_rune{} = Info) ->
	sendMsg2LogDBServer(?LogType_Rune, Info#rec_log_rune{time = time:getLogTimeSec()}).

sendSaveLogRank(#recSaveRank{} = Rank) ->
	sendMsg2LogDBServer(?LogType_Rank, Rank).

sendMsg2LogDBServer(LogType, Info) ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVar_WriteLog) of
		true ->
			%% 记录日志
			sendMsg2LogDBServer2(LogType, Info);
		_ ->
			skip
	end.

-ifndef(Cur_Lang).
%% 没定义语言，直接全记录日志
sendMsg2LogDBServer2(LogType, Info) ->
	sendMsg2LogDBServer_Normal(LogType, Info).
-else.
%% 有语言设置，判断是否是中文，如果是，则全记录
sendMsg2LogDBServer2(LogType, Info) ->
	IsChina =
		case ?Cur_Lang of
			?Lang_CHS ->
				true;
			?Lang_ENU ->
				true;
			_ ->
				false
		end,
	case IsChina of
		true ->
			sendMsg2LogDBServer_Normal(LogType, Info);
		_ ->
			sendMsg2LogDBServer_Special(LogType, Info)
	end.
-endif.

%% 普通记录日志
sendMsg2LogDBServer_Normal(LogType, Info) ->
	gsSendMsg:sendMsg2LogDBServer(LogType, Info),
	ok.

%% 特殊记录日志
sendMsg2LogDBServer_Special(LogType, Info) ->
	gsSendMsg:sendMsg2LogDBServer(LogType, Info),
	ok.