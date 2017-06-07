-ifndef(MALL_HRL).
-define(MALL_HRL,1).

-define(UpdataALL, 0).	%%更新所有
-define(UpdataYouH, 1).	%%更新优惠

-define(Type_YouH, 1).	%%优惠类型
-define(Type_All, 2).	%%所有类型

-define(LimitType_1, 1).	%%每人限购
-define(LimitType_2, 2).	%%全服限购
-define(LimitType_3, 3).	%%每人每天限购
-define(Nolimit, 0).		%%无限购
-define(LimitForever, -2).	%%永远限购

-define(Mall_Hidle, 0).	%%隐藏
-define(Mall_Show, 1).	%%显示

-define(Mall_Change_Updata, 0). %%默认值为修改或者添加
-define(Mall_Change_Del,1).		%%删除操作


-define(DEFULT_VALUE_1, 0).%%初始默认值
-define(DEFULT_VALUE_2, 100).%%初始默认值 打折专用

-record(mallState,{mallItemEts,mallSeed = -1}).

%%商城数据Ets表
-define(MallItemTableEts,mallItemTable).
 
-record(mall,{
			  db_id,		%%商品唯一编号  itemid+
			  item_id,		
			  mainmenu,		%%主菜单 物品类型	优惠:1|成长:2|时装:3|积分:4
			  submenu,		%%二级菜单	
			  gold,			%%非绑定金币售价
			  bind_gold,	%%绑定金币	 	绑定金币:1|非绑定金币:2|积分:3
			  use_integral, %%积分购买
			  get_integral, %%送积分
			  lefttime,		%%购买结束倒计时	单位:s
			  leftcount,	%%限购剩余数
			  sortNumber,	%%排序号
			  rebate,		%%打折				default:100
			  showtype		%%优惠类型		普通：0|限购：1|打折：2
			}).
%%商城数据
-record(recSaveMall,{
					 dbID,					%%itemid_type
					 itemID=0,				%%道具ID
					 sort=1,				%%排序
					 type=0,				%%物品类型	优惠:1|成长:2|时装:3|积分:4
					 buyDefaultNum = 1,		%%后台配置的购买数量
					 type1=0,				%%二级菜单	
					 diamond=0,				%%非绑定钻石售价
					 bindDiamond=0,			%%绑定钻石售价	 	
					 useIntegral=0,			%%积分售价
					 getIntegral=0,			%%获得积分
					 limitBuy=0,			%%限购数				0表示不限购
					 limit_day=0,			%%玩家每日限购
					 limitType=0,			%%限购类型			default:0|个人:1|全服总数:2
					 limitBeginTime=0,		%%限购开始时间
					 limitEndTime=0,		%%限购结束时间
					 buyReset=0,			%%重置时间间隔
					 level=0,				%%达到等级数才能显示购买
					 recharge=0,			%%达到充值数才能显示购买
					 isHide=1,				%%是否隐藏
					 beginTime=0,			%%上架时间			0表示永久
					 endTime=0,				%%下架时间			0表示永久
					 rebate=100,			%%打折				default:100
					 rebateBeginTime=0,		%%打折开始时间		    0表示永久
					 rebateEndTime=0,		%%打折结束时间			
					 showType=0,			%%优惠类型
					 buySendItem=0,			%%购买赠送
					 buySendNum=0,			%%买一送的个数
					 buySendLimit=0,		%%赠送个数限制			0表示不限制 暂时没用
					 buySendBeginTime=0,	%%赠送开始时间
					 buySendEndTime=0		%%赠送结束时间
					}).

%%商城数据修改LOG
-record(recSaveMallChangeLog,{
					 dbID,					%%itemid_type
					 itemID,				%%道具ID
					 sort=1,				%%排序
					 type,					%%物品类型	优惠:1|成长:2|时装:3|积分:4
					 type1,					%%二级菜单	
					 diamond=0,			 	%%非绑定钻石售价
					 bindDiamond=0,			%%绑定钻石售价	 	
					 useIntegral=0,			%%积分售价
					 getIntegral=0,			%%获得积分
					 limitBuy=0,			%%限购数				0表示不限购
					 limitType=0,			%%限购类型			defult:0|个人:1|全服总数:2
					 limitBeginTime=0,		%%限购开始时间
					 limitEndTime=0,		%%限购结束时间
					 buyReset=0,			%%重置时间间隔
					 level=0,				%%达到等级数才能显示购买
					 recharge=0,			%%达到充值数才能显示购买
					 isHide=1,				%%是否隐藏
					 beginTime=0,			%%上架时间			0表示永久
					 endTime=0,				%%下架时间			0表示永久
					 rebate=100,			%%打折				default:100
					 rebateBeginTime=0,		%%打折开始时间		    0表示永久
					 rebateEndTime=0,		%%打折结束时间			
					 showType=0,			%%优惠类型
					 buySendItem=0,			%%购买赠送
					 buySendNum=0,			%%买一送的个数
					 buySendLimit=0,		%%赠送个数限制			0表示不限制 暂时没用
					 buySendBeginTime=0,	%%赠送开始时间
					 buySendEndTime=0,		%%赠送结束时间
					 state=0,				%%操作  0表示添加或者修改   1表示删除
					 changeTime=0		
					}).

%%商城购买时的call参数包装
-record(recCallBuyArgs,{
						roleID, 
						db_id, 
						itemNum,
						coinTypeDiamondNum,
						coinTypeBindDiamondNum,
						coinTypeScoreNum,
						useCoinType,
						db_idDayCouter
					   }).

%%限购配置数据
-record(sendbuy,{
			db_id, 
			sendItem, 
			sendNum, 
			%%sendLimit,  策划说不做限制 
			sendBeginTime, 
			sendAfterTime
			}).

%%-record(limitkey,{role_id, db_id}).
%%已购买的 限购道具记录
-record(recSaveLimitMall,{
						  dbID,					%%索引ID
						  itemID,				%%道具ID
						  roleID,
						  haveBuy,				%%已购买数量
						  time					%%购买时间
						  }).

%%商城购买记录
-record(recSaveMallBuyLog,{
						   roleID,		%%角色ID
						   dbID,		%%物品索引ID
						   itemID,		%%物品ID
						   buyNum,		%%购买数量
						   time			%%购买时间
						}).

-endif.
