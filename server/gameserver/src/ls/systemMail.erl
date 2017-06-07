%% @author zhengzhichun
%% @doc @todo Add description to systemMail.


-module(systemMail).
-include("playerLog.hrl").
-include("gsInc.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	sendMail/6,
	createMailItem/4,
	createMailEquip/5
]).

%% 有无附件
%%Attachment={obj,[{"item_id",13},{"item_num",5},{"item_bind",false}]}
-spec sendMail(AttachmentList,ToRoleIDList, ReasonCode,MailTitle, MailContent, MailSubjoinMsg) -> FailList when
	AttachmentList::[Attachment::tuple()],ToRoleIDList::list(),ReasonCode::integer(),MailTitle::string(),MailContent::string(),
	MailSubjoinMsg::string(),FailList::[].
sendMail([],ToRoleIDList,_ReasonCode, MailTitle, MailContent, MailSubjoinMsg) ->
	RoleListFun = fun(BinToRoleID,List) ->
		IntToRoleID = case erlang:is_binary(BinToRoleID) of
							true ->
								erlang:binary_to_integer(BinToRoleID);
							_ ->
								case erlang:is_integer(BinToRoleID) of
									true ->
										BinToRoleID;
									_ ->
										?ERROR_OUT("Unknown BinToRoleID[~p] type",[BinToRoleID]),
										0
								end
						end,
		case IntToRoleID > 0 andalso mail:sendSystemMail(IntToRoleID, MailTitle, MailContent, [], MailSubjoinMsg) > 0 of
			true ->
				List;
			false ->
				% 失败的叠加
				[IntToRoleID | List]
		end
	end,
	FailList = lists:foldl(RoleListFun, [], ToRoleIDList),
	FailList;
sendMail(AttachmentList,ToRoleIDList,ReasonCode, MailTitle, MailContent, MailSubjoinMsg) ->
	RoleListFun = fun(BinToRoleID,List) ->
		IntToRoleID =
			case erlang:is_binary(BinToRoleID) of
				true ->erlang:binary_to_integer(BinToRoleID);
				false -> BinToRoleID
			end,

		DePackAttachmentList =
			fun(ItemOne,ItemAccList) ->
				{ok,ItemID} = rfc4627:get_field(ItemOne, "item_id"),
				{ok,ItemNum} = rfc4627:get_field(ItemOne, "item_num"),
				{ok,ItemBind} = rfc4627:get_field(ItemOne, "item_bind"),

				case createMailItem(ItemID,ItemNum,ItemBind,ReasonCode) of
					MailItemList when erlang:is_list(MailItemList) ->
						SendItemUIDListFun =
							fun(MailItemOne,ItemUIDAcc) ->
								case mail:sendSystemMail(IntToRoleID, MailTitle, MailContent, [MailItemOne], MailSubjoinMsg) > 0 of
									true ->
										ItemUIDAcc;
									false ->
										% 失败的叠加
										[ItemID | ItemUIDAcc]
								end
							end,
						SendItemListResult =
							lists:foldl(SendItemUIDListFun, [], MailItemList),
						ItemAccList++ SendItemListResult;
					_ ->% 失败的叠加
						%%?ERROR_OUT("web2lsMail DePackAttachmentList:~w",[ItemOne]),
						[ItemID | ItemAccList]
				end

			end,

		case lists:foldl(DePackAttachmentList, [], AttachmentList) of
			[] ->
				List;
			FailItemListOfRole ->% 失败的叠加
				[{obj,[{BinToRoleID,FailItemListOfRole}]} | List]
		end

	end,
	FailList = lists:foldl(RoleListFun, [], ToRoleIDList),
	FailList.

%% 生成邮件道具物品
-spec createMailItem(ItemID,NumOrQuality,IsBind,Reason) -> false |[#recMailItem{},...] when
	ItemID::integer(),NumOrQuality::integer(),IsBind::boolean(),Reason::uint().
createMailItem(ItemID,NumOrQuality,IsBind,Reason) ->
	?DEBUG_OUT("createMailItem：~p",[{ItemID,NumOrQuality,IsBind}]),
	{Quality,RealNum} =
		case ItemID < ?Item_Differentiate of
			true ->
				{0,NumOrQuality};
			_ ->
				%%一件某个质量的装备
				{NumOrQuality,1}
		end,
	TS = #recPLogTSItem{
		old = 0,
		new = 0,
		change = RealNum,
		target = ?PLogTS_Mail,
		source = 0,
		changReason = Reason,
		reasonParam = ?Mail_Role_ID,
		gold = 0,
		goldtype = 0
	},
	case playerPackage:makeGoodsInstance(ItemID, RealNum, IsBind, Quality, ?Mail_Role_ID, TS) of
		[H|_] = UIDList when erlang:is_integer(H) ->
			?DEBUG_OUT("createMailItem--UIDlist:~p",[UIDList]),
			[#recMailItem{
				itemUID = X,
				itemID  = ItemID
			} || X<-UIDList];
		_Other ->
			?ERROR_OUT("createMailItem/3 Err ItemID:~p,Return:~p",[ItemID,_Other]),
			false
	end.

%% 生成邮件装备物品
-spec createMailEquip(EquipID,Num,Quality,IsBind,Reason) -> false |[#recMailItem{},...] when
	EquipID::integer(),Num::integer(),Quality::uint(),IsBind::boolean(),Reason::uint().
createMailEquip(EquipID,Num,Quality,IsBind,Reason) ->
	?DEBUG_OUT("createMailEquip：~p",[{EquipID,Num,Quality,IsBind}]),
	TS = #recPLogTSItem{
		old = 0,
		new = 0,
		change = 0,
		target = 0,
		source = 0,
		changReason = Reason,
		reasonParam = ?Mail_Role_ID,
		gold = 0,
		goldtype = 0
	},
	case playerPackage:makeGoodsInstance(EquipID, Num, IsBind, Quality, ?Mail_Role_ID, TS) of
		[H|_] = UIDList when erlang:is_integer(H) ->
			?DEBUG_OUT("createMailEquip--UIDlist:~p",[UIDList]),
			[#recMailItem{
				itemUID = X,
				itemID   = EquipID
			} || X<-UIDList];
		_Other ->
			?ERROR_OUT("createMailEquip/3 Err   EquipID:~p,Return:~p",[EquipID,_Other]),
			false
	end.

%% ====================================================================
%% Internal functions
%% ====================================================================