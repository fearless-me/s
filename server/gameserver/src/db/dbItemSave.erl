%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%% 道具保存
%%% @end
%%% Created : 06. 四月 2016 18:24
%%%-------------------------------------------------------------------
-module(dbItemSave).
-author("tiancheng").

-include("dbPrivate.hrl").

%% API
-export([
	save_item_data/2
]).

%% 保存道具数据
save_item_data(Op, #rec_item{
	itemUID = UID,					%%道具UID bigint(20) unsigned
	roleID = RoleID,				%%角色ID bigint(20) unsigned
	itemID = ItemID,				%%道具ID smallint(6)
	pos = Pos,						%%背包类型 smallint(6)
	pileNum = Num,					%%堆叠数量 smallint(6)
	recastCount = Count,			%%重铸次数 smallint(6)
	isBind = IsBind,				%%是否绑定 tinyint(1) unsigned
	isLocked = IsLocked,			%%玩家是否自己锁定 tinyint(1) unsigned
	quality = Quality,				%%品质 tinyint(4) unsigned
	deleteTime = DeleteTime,		%%删除时间 datetime
	createTime = CreateTime,        %%创建时间
	expiredTime = ExpiredTime,       %%过期时间
	equipBase = EquipBase,
	equipEnhance = EquipEnhnce,
	equipExt = EquipExt
} = RecItem) ->
	SQL =
		case Op of
			insert ->
				io_lib:format("insert item(itemUID,roleID,itemID,pos,pileNum,recastCount,isBind,isLocked,quality,deleteTime,createTime,expiredTime,equipBase,equipEnhance,equipExt)
			values (~p,~p,~p,~p,~p,~p,~p,~p,~p,'~ts',~p,~p,'~ts','~ts','~ts')",
					[UID,RoleID,ItemID,Pos,Num,Count,IsBind,IsLocked,Quality,dbMemCache:convert2MysqlDateTimeStr(DeleteTime),
						CreateTime,ExpiredTime,
						itemUtils:equipMemoryRecord2Db(EquipBase),itemUtils:equipMemoryRecord2Db(EquipEnhnce), itemUtils:equipMemoryRecord2Db(EquipExt)]);
			update ->
				io_lib:format("update item set roleID=~p,pos=~p,pileNum=~p,recastCount=~p,isBind=~p,isLocked=~p,
				quality=~p,deleteTime='~ts',expiredTime=~p,equipBase='~ts',equipEnhance='~ts',equipExt='~ts' where itemUID=~p",
					[RoleID,Pos,Num,Count,IsBind,IsLocked,Quality,dbMemCache:convert2MysqlDateTimeStr(DeleteTime),
						ExpiredTime, itemUtils:equipMemoryRecord2Db(EquipBase),itemUtils:equipMemoryRecord2Db(EquipEnhnce), itemUtils:equipMemoryRecord2Db(EquipExt), UID]);
			delete ->
				formatBakItem(RecItem)
		end,
	Ret = emysql:execute(?GAMEDB_CONNECT_POOL, SQL),
	dbMemCache:logResult(atom_to_list(Op) ++ " item", Ret, SQL),
	ok.

formatBakItem(#rec_item{
	itemUID = UID,					%%道具UID bigint(20) unsigned
	roleID = RoleID,				%%角色ID bigint(20) unsigned
	itemID = ItemID,				%%道具ID smallint(6)
	pos = Pos,						%%背包类型 smallint(6)
	pileNum = Num,					%%堆叠数量 smallint(6)
	recastCount = Count,			%%重铸次数 smallint(6)
	isBind = IsBind,				%%是否绑定 tinyint(1) unsigned
	isLocked = IsLocked,			%%玩家是否自己锁定 tinyint(1) unsigned
	quality = Quality,				%%品质 tinyint(4) unsigned
	deleteTime = DeleteTime,		%%删除时间 datetime
	createTime = CreateTime,        %%创建时间
	expiredTime = ExpiredTime,       %%过期时间
	equipBase = EquipBase,
	equipEnhance = EquipEnhnce,
	equipExt = EquipExt
}) ->
	io_lib:format("delete from item where itemUID=~p;  insert item_bak(itemUID,roleID,itemID,pos,pileNum,recastCount,isBind,isLocked,quality,deleteTime,createTime,expiredTime,equipBase,equipEnhance,equipExt)
			values (~p,~p,~p,~p,~p,~p,~p,~p,~p,'~ts',~p,~p,'~ts','~ts','~ts')",
		[UID, UID,RoleID,ItemID,Pos,Num,Count,IsBind,IsLocked,Quality,dbMemCache:convert2MysqlDateTimeStr(DeleteTime),
			CreateTime,ExpiredTime,
			itemUtils:equipMemoryRecord2Db(EquipBase),itemUtils:equipMemoryRecord2Db(EquipEnhnce), itemUtils:equipMemoryRecord2Db(EquipExt)]).
%%
%%save_item_data(Op, #rec_equip_base_info{
%%	equipUID = UID,					%%装备UID bigint(20) unsigned
%%	propKey1 = K1,					%%属性标识主键1 tinyint(4) unsigned
%%	propValue1 = V1,				%%装备附加属性值1 double
%%	propKey2 = K2,					%% tinyint(4) unsigned
%%	propValue2 = V2,				%% double
%%	propKey3 = K3,					%% tinyint(4) unsigned
%%	propValue3 = V3,				%% double
%%	propKey4 = K4,					%% tinyint(4) unsigned
%%	propValue4 = V4,				%% double
%%	propKey5 = K5,					%% tinyint(4) unsigned
%%	propValue5 = V5,				%% double
%%	skillLevel1 = SL1,				%%技能1等级 tinyint(4) unsigned
%%	skillLevel2 = SL2				%%技能2等级 tinyint(4) unsigned
%%}) ->
%%	SQL =
%%		case Op of
%%			insert ->
%%				io_lib:format("insert equip_base_info(equipUID,propKey1,propValue1,propKey2,propValue2,propKey3,propValue3,"
%%				"propKey4,propValue4,propKey5,propValue5,skillLevel1,skillLevel2) values (~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p)",
%%					[UID,K1,V1,K2,V2,K3,V3,K4,V4,K5,V5,SL1,SL2]);
%%			update ->
%%				io_lib:format("update equip_base_info set propKey1=~p,propValue1=~p,propKey2=~p,propValue2=~p,propKey3=~p,propValue3=~p,"
%%				"propKey4=~p,propValue4=~p,propKey5=~p,propValue5=~p,skillLevel1=~p,skillLevel2=~p where equipUID=~p",
%%					[K1,V1,K2,V2,K3,V3,K4,V4,K5,V5,SL1,SL2,UID])
%%		end,
%%	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
%%	dbMemCache:logResult(atom_to_list(Op) ++ " equip_base_info",Ret,SQL),
%%	ok;
%%
%%save_item_data(Op, #rec_equip_enhance_info{
%%	equipUID = UID,					%%装备UID bigint(20) unsigned
%%	propKey1 = K1,					%%属性标识主键1 tinyint(4) unsigned
%%	propValue1 = V1,				%%装备附加属性值1 double
%%	propKey2 = K2,					%% tinyint(4) unsigned
%%	propValue2 = V2,				%% double
%%	propKey3 = K3,					%% tinyint(4) unsigned
%%	propValue3 = V3,				%% double
%%	propKey4 = K4,					%% tinyint(4) unsigned
%%	propValue4 = V4,				%% double
%%	propKey5 = K5,					%% tinyint(4) unsigned
%%	propValue5 = V5					%% double
%%}) ->
%%	SQL =
%%		case Op of
%%			insert ->
%%				io_lib:format("insert equip_enhance_info(equipUID,propKey1,propValue1,propKey2,propValue2,propKey3,propValue3,"
%%				"propKey4,propValue4,propKey5,propValue5) values (~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p)",
%%					[UID,K1,V1,K2,V2,K3,V3,K4,V4,K5,V5]);
%%			update ->
%%				io_lib:format("update equip_enhance_info set propKey1=~p,propValue1=~p,propKey2=~p,propValue2=~p,propKey3=~p,propValue3=~p,"
%%				"propKey4=~p,propValue4=~p,propKey5=~p,propValue5=~p where equipUID=~p",
%%					[K1,V1,K2,V2,K3,V3,K4,V4,K5,V5,UID])
%%		end,
%%	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
%%	dbMemCache:logResult(atom_to_list(Op) ++ " equip_enhance_info",Ret,SQL),
%%	ok;
%%
%%save_item_data(Op, #rec_equip_ext_info{
%%	equipUID = UID,					%%装备UID bigint(20) unsigned
%%	propKey1 = K1,					%%属性标识主键1 tinyint(4) unsigned
%%	propValue1 = V1,				%%装备附加属性值1 double
%%	propRecast1 = R1,				%% tinyint(4) unsigned
%%	propAffixe1 = A1,				%% smallint(5) unsigned
%%	calcType1 = T1,					%%属性计算方式 0：加法 1：乘法 tinyint(4) unsigned
%%	propKey2 = K2,					%% tinyint(4) unsigned
%%	propValue2 = V2,				%% double
%%	propRecast2 = R2,				%% tinyint(4) unsigned
%%	propAffixe2 = A2,				%% smallint(5) unsigned
%%	calcType2 = T2,					%% tinyint(4) unsigned
%%	propKey3 = K3,					%% tinyint(4) unsigned
%%	propValue3 = V3,				%% double
%%	propRecast3 = R3,				%% tinyint(4) unsigned
%%	propAffixe3 = A3,				%% smallint(5) unsigned
%%	calcType3 = T3,					%% tinyint(4) unsigned
%%	propKey4 = K4,					%% tinyint(4) unsigned
%%	propValue4 = V4,				%% double
%%	propRecast4 = R4,				%% tinyint(4) unsigned
%%	propAffixe4 = A4,				%% smallint(5) unsigned
%%	calcType4 = T4,					%% tinyint(4) unsigned
%%	propKey5 = K5,					%% tinyint(4) unsigned
%%	propValue5 = V5,				%% double
%%	propRecast5 = R5,				%% tinyint(4) unsigned
%%	propAffixe5 = A5,				%% smallint(5) unsigned
%%	calcType5 = T5,					%% tinyint(4) unsigned
%%	propKey6 = K6,					%% tinyint(4) unsigned
%%	propValue6 = V6,				%% double
%%	propRecast6 = R6,				%% tinyint(4) unsigned
%%	propAffixe6 = A6,				%% smallint(5) unsigned
%%	calcType6 = T6					%% tinyint(4) unsigned
%%}) ->
%%	SQL =
%%		case Op of
%%			insert ->
%%				io_lib:format("insert equip_ext_info(equipUID,"
%%				"propKey1,propValue1,propRecast1,propAffixe1,calcType1,"
%%				"propKey2,propValue2,propRecast2,propAffixe2,calcType2,"
%%				"propKey3,propValue3,propRecast3,propAffixe3,calcType3,"
%%				"propKey4,propValue4,propRecast4,propAffixe4,calcType4,"
%%				"propKey5,propValue5,propRecast5,propAffixe5,calcType5,"
%%				"propKey6,propValue6,propRecast6,propAffixe6,calcType6)"
%%				" values (~p,"
%%				"~p,~p,~p,~p,~p,"
%%				"~p,~p,~p,~p,~p,"
%%				"~p,~p,~p,~p,~p,"
%%				"~p,~p,~p,~p,~p,"
%%				"~p,~p,~p,~p,~p,"
%%				"~p,~p,~p,~p,~p)",
%%					[UID,
%%						K1,V1,R1,A1,T1,
%%						K2,V2,R2,A2,T2,
%%						K3,V3,R3,A3,T3,
%%						K4,V4,R4,A4,T4,
%%						K5,V5,R5,A5,T5,
%%						K6,V6,R6,A6,T6]);
%%			update ->
%%				io_lib:format("update equip_ext_info set propKey1=~p,propValue1=~p,propRecast1=~p,propAffixe1=~p,calcType1=~p,"
%%				"propKey2=~p,propValue2=~p,propRecast2=~p,propAffixe2=~p,calcType2=~p,"
%%				"propKey3=~p,propValue3=~p,propRecast3=~p,propAffixe3=~p,calcType3=~p,"
%%				"propKey4=~p,propValue4=~p,propRecast4=~p,propAffixe4=~p,calcType4=~p,"
%%				"propKey5=~p,propValue5=~p,propRecast5=~p,propAffixe5=~p,calcType5=~p,"
%%				"propKey6=~p,propValue6=~p,propRecast6=~p,propAffixe6=~p,calcType6=~p "
%%				" where equipUID=~p",
%%					[K1,V1,R1,A1,T1,
%%						K2,V2,R2,A2,T2,
%%						K3,V3,R3,A3,T3,
%%						K4,V4,R4,A4,T4,
%%						K5,V5,R5,A5,T5,
%%						K6,V6,R6,A6,T6,
%%						UID])
%%		end,
%%	Ret = emysql:execute(?GAMEDB_CONNECT_POOL,SQL),
%%	dbMemCache:logResult(atom_to_list(Op) ++ " equip_ext_info",Ret,SQL),
%%	ok.