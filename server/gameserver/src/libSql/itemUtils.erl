%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. 九月 2016 14:35
%%%-------------------------------------------------------------------
-module(itemUtils).
-author("Administrator").

-include("common/common.hrl").

%% API
-compile(export_all).

%%
equipMemoryRecord2Db(#rec_equip_base_info{} = Base) ->
	misc:term_to_string(Base);
equipMemoryRecord2Db(#rec_equip_enhance_info{} = En) ->
	misc:term_to_string(En);
%%equipMemoryRecord2Db(#rec_equip_ext_info{} = Ex )->
%%	misc:term_to_string(Ex);
equipMemoryRecord2Db(_) ->
	"undefined".

%%
equipDb2MemoryRecord(Info) ->
	try
		Value = case erlang:is_binary(Info) of
			        true ->
				        erlang:binary_to_list(Info);
			        _ ->
				        Info
		        end,
		misc:string_to_term(Value)
	catch
		_ : _ ->
			undefined
	end.

makeItemRecFromDB(#rec_item{equipBase = EB, equipEnhance = EE, equipExt = Ex} = Rec) ->
	EbT = equipDb2MemoryRecord(EB),
	case EbT of
		#rec_equip_base_info{} ->
			EeT = case equipDb2MemoryRecord(EE) of
				      #rec_equip_enhance_info{} = EEL ->
					      EEL;
				      _ ->
					      #rec_equip_base_info{}
			      end,
			ExT =   #rec_equip_ext_info{},
%%				case equipDb2MemoryRecord(Ex) of
%%					#rec_equip_ext_info{} = ExtInfo ->
%%						ExtInfo;
%%					_ ->
%%						#rec_equip_ext_info{}
%%				end,
			Rec#rec_item{equipBase = EbT, equipEnhance = EeT, equipExt = ExT};
		_ ->
			Rec#rec_item{equipBase = undefined, equipEnhance = undefined, equipExt = undefined}
	end.



makeEquipRecFromItem(RoleID, #rec_item{
	itemUID = UID,                %%道具UID bigint(20) unsigned
	itemID = ItemID,            %%道具ID smallint(6)
	pos = Pos,                    %%背包类型 smallint(6)
	%pileNum = Num,				%%堆叠数量 smallint(6)
	recastCount = C,            %%重铸次数 smallint(6)
	isBind = IsBind,            %%是否绑定 tinyint(1) unsigned
	isLocked = IsLock,            %%玩家是否自己锁定 tinyint(1) unsigned
	quality = Q,                %%品质 tinyint(4) unsigned
	deleteTime = DT,            %%删除时间 datetime
	createTime = CT,
	expiredTime = ET, equipBase = EB, equipEnhance = EE, equipExt = EX}) ->
	case EB of
		#rec_equip_base_info{} ->
			#recSaveEquip{
				itemUID = UID,                %%道具UID bigint(20) unsigned
				roleID = RoleID,            %%角色ID bigint(20) unsigned
				itemID = ItemID,            %%道具ID smallint(6)
				pos = Pos,                    %%背包类型 smallint(6)
				recastCount = C,            %%重铸次数 smallint(6)
				isBind = IsBind,            %%是否绑定 tinyint(1) unsigned
				isLocked = IsLock,            %%玩家是否自己锁定 tinyint(1) unsigned
				quality = Q,                %%品质 tinyint(4) unsigned
				baseProp = EB,
				extProp = EX,
				enhanceProp = EE,
				createTime = CT,
				deleteTime = DT,
				expiredTime = ET
			};
		_ ->
			false
	end.

