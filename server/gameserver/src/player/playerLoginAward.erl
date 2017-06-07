%% @author zhengzhichun
%% @doc @todo Add description to playLoginAward.


-module(playerLoginAward).

-include("playerPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
		 checkAndGiveLoginAward/3
		]).


%%验证当前满足的活动,并发放相应物品.只能在玩家管理进程来调用，以作ets同步保护
-spec checkAndGiveLoginAward(RoleID,TakenAwardKeyList,CurLevel) -> OkKeyList when
		  RoleID::integer(),TakenAwardKeyList::list(),CurLevel::integer(),OkKeyList::list().
checkAndGiveLoginAward(RoleID,TakenAwardKeyList,CurLevel) when erlang:is_list(TakenAwardKeyList)->
	CheckAwardFun = 
		fun(#loginAwardConf{
							award_id=Key,
							time_begin=Begin, 
							time_end=End, 
							level_min=Min, 
							level_max=Max, 
							mail_title=Title, 
							mail_content=Content, 
							items=Item
						   }
			,OkKeyAcc) ->
				Now = time:getUTCNowSec(),

				if
					( Now >= Begin andalso Now =< End ) 
						andalso ( CurLevel >= Min andalso CurLevel =< Max ) ->
						IsTaken = lists:member(Key, TakenAwardKeyList),
						if
							not IsTaken ->
								giveAward( RoleID, Key, Title, Content, Item ),
								[Key | OkKeyAcc];
							true ->
								skip,
								OkKeyAcc
						end;
					true ->
						skip,
						OkKeyAcc
				end
		end,
	ConfList = ets:tab2list(?TABLE_PlayerLoginAwardConf),
	OkKeyList = lists:foldl(CheckAwardFun, [], ConfList),
%% 	OkKeyList = ets:foldl( CheckAwardFun, [], ?TABLE_PlayerLoginAwardConf ),
	OkKeyList.


%% ====================================================================
%% Internal functions
%% ====================================================================

%%给玩家发送系统邮件物品
-spec giveAward(RoleID, AwardID, Title, Content, ItemJsonStr) -> ok when
		  RoleID::integer(), Title::string(), Content::string(), ItemJsonStr::string(),AwardID::integer().
giveAward(RoleID, AwardID, Title, Content, ItemJsonStr) ->
	{ok,AttachmentList,[]} = rfc4627:decode( ItemJsonStr ),
	{ok,ItemIDList} = rfc4627:get_field(AttachmentList, "Items"),

	psMgr:sendMsg2PS(?PSNameAwardTaken, isTaken,{RoleID,AwardID,ItemIDList,Title,Content}),
%%	gsSendMsg:sendMsg2CSServer(isTaken, {RoleID,AwardID,ItemIDList,Title,Content} ),%用异步，不用call
%% 	CsAward = {?PSNameAwardTaken,gsMainLogic:getCSNodeName()},
%% 	try
%% 		case Ret = psMgr:call(CsAward, isTaken, {RoleID,AwardID}, 1000) of
%% 			{true,TakenList} ->
%% 				systemMail:sendMail(ItemIDList, [RoleID], Title, Content, ""),
%% 				playerState:setAwardTakens(TakenList);
%% 			{false,TakenList} ->
%% 				playerState:setAwardTakens(TakenList)
%% 		end,
%% 		?DEBUG_OUT("cs call ret:~p",[Ret])
%% 		
%% 	catch
%% 		_:_ ->
%% 			?ERROR_OUT("giveAward call csOtp err")
%% 	end,
	ok.
