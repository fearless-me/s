%% @author zzc
%% @doc @todo Add description to playerGameNotice.


-module(playerGameNotice).
-include("playerPrivate.hrl").
-include("setupLang.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([
	createNoticeStruct/2,
	sendMarquee/2,
	sendMarquee/3,
	sendSystemChat/1,
	sendGameNotice/4,
	sendSysAllChat/1,
	sendSysAllCharByECode/1,
	sendSysAllCharByECode/2,
	sendSystemChatByECode/1,
	sendSystemChatByECode/2
]).


%% duration+afterSecondStart=结束时间点
%% 如
%% 13：00开始，持续3600S（duration=3600）
%% 当前13：31
%% 既13:00-13:31=(-1860)S也就是afterSecondStart=-1860
%% 
%% duration+afterSecondStart=3600+（-1860）=1740
%% 即1740秒后结束

%% 每5秒播一次，即interval=5
%% Mod = abs(afterSecondStart mod interval)
%% Mod=0马上开始；interval-Mod=多少秒后开始

createNoticeStruct(Md5,NoticeList) ->
	put(onGameNoticeAck,[]),
	Now = time:getUTCNowSec(),
	Pk_NoticeInfoFun = fun(One,AccIn) ->
							   NoticeInfo = #pk_NoticeInfo{
														   id = One#gameNotice.id, 
														   type = One#gameNotice.type, 
														   pos = One#gameNotice.position, 
														   content = binary_to_list(One#gameNotice.content), 
														   color = One#gameNotice.rgb, 
														   afterSecondStart = One#gameNotice.beginTime - Now, 
														   duration = One#gameNotice.duration, 
														   interval = One#gameNotice.interval 
														  },
							   put(onGameNoticeAck,
								   [erlang:integer_to_list(One#gameNotice.id) | get(onGameNoticeAck)] ),
							   [NoticeInfo|AccIn]
					   end,
	NoticeInfoList = lists:foldl(Pk_NoticeInfoFun, [], NoticeList),
	
	Md5Txt = get(onGameNoticeAck),
	?DEBUG_OUT("notice my md5:~p",[Md5Txt]),
	erlang:erase(onGameNoticeAck),
	
	MyMd5 = md5:encrypt(Md5Txt),
	
	SendStruct = 
		if
			MyMd5 =/= Md5 ->
				
				?DEBUG_OUT("md5 ~p ~p",[Md5Txt,Md5]),
				
				#pk_GS2U_NoticeResponse{
										result=1,
										noticeList=NoticeInfoList
									   };
			true ->
				?DEBUG_OUT("not change md5 ~p ~p",[Md5Txt,MyMd5]),
				#pk_GS2U_NoticeResponse{
										result=0,
										noticeList=[ ]
									   }
		end,
	SendStruct.

%%给指定玩家进程(可以是自己)发送走马灯
-spec sendMarquee(PlayerPid,Content) ->ok when
	PlayerPid::pid(),Content::string().
sendMarquee(PlayerPid,Content) ->
	sendMarquee(PlayerPid,Content,16#FFFFFF).

%%给指定玩家进程(可以是自己)发送走马灯
-spec sendMarquee(PlayerPid,Content,Rgb) ->ok when
		  PlayerPid::pid(),Content::string(),Rgb::uint32().
sendMarquee(PlayerPid,Content,Rgb) ->
	NoticeInfo = #pk_NoticeInfo{
								id = 9999999999, 
								type =0, 
								pos = 0, %%走马灯
								content=  Content, 
								color=Rgb, 
								afterSecondStart=0, 
								duration=120, 
								interval=30 
							   },
	ToGsMsg = [NoticeInfo] ,
	
	case PlayerPid of
		PlayerPid2 when PlayerPid2 =:= self() ->
			Msg = #pk_GS2U_NoticeAdd{notice =ToGsMsg},
			playerMsg:sendNetMsg(Msg);
		_ ->
			psMgr:sendMsg2PS(PlayerPid, web2lsAddNotice, {ToGsMsg})
	end,
	
	ok.

%% 在系统频道发送消息
-spec sendSystemChat(Content::string()) -> ok.
sendSystemChat(Content) ->
	ChatInfo = playerChat:getSystemChatInfo(Content),
	playerMsg:sendNetMsg(ChatInfo),
	ok.

%% 在系统频道发送消息通过Errorcode
-spec sendSystemChatByECode(Errorcode::uint32()) -> ok.
sendSystemChatByECode(Errorcode) ->
	sendSystemChatByECode(Errorcode, []),
	ok.
-spec sendSystemChatByECode(Errorcode::uint32(), Params::list()) -> ok.
sendSystemChatByECode(Errorcode, Params) ->
	playerMsg:sendErrorCodeMsg(Errorcode, Params),
	ok.
-spec sendGameNotice(Type :: uint(), Argc :: uint() ,EquipQuality :: uint(), Uid :: uint()) -> ok.
sendGameNotice(Type, Argc, EquipQuality, Uid) ->
	Notice =
		if 
			Type =:= ?SuitRefineLevel_Notice ->
				if
                    Argc =:= 30 ->
						stringCfg:getString(getSuitRefineLevel_Notice, [playerState:getName(), Argc]);
                    Argc =:= 40 ->
						stringCfg:getString(getSuitRefineLevel_Notice, [playerState:getName(), Argc]);
                    Argc =:= 50 ->
						stringCfg:getString(getSuitRefineLevel_Notice, [playerState:getName(), Argc]);
                    Argc =:= 60 ->
						stringCfg:getString(getSuitRefineLevel_Notice, [playerState:getName(), Argc]);
					 Argc =:= 70 ->
						stringCfg:getString(getSuitRefineLevel_Notice, [playerState:getName(), Argc]);
	                true ->
	                    ""
	            end;
		   Type =:= ?GemComposition_Notice ->
				if
					Argc =:= 9 ->
	                    stringCfg:getString(getGemComposition_Notice, [playerState:getName(), Argc]);
                    Argc =:= 10 ->
						stringCfg:getString(getGemComposition_Notice, [playerState:getName(), Argc]);
	                true ->
	                    ""
	            end;
		   Type =:= ?EquipDrop_Notice ->
               Notice_System = stringCfg:getString(getEquipDrop_System_Notice, [playerState:getName(),EquipQuality, Uid, Argc]),
			   Notice_horse = stringCfg:getString(getEquipDrop_Notice, [playerState:getName(),Argc]),
			   {Notice_System, Notice_horse};
		   true ->
			   ""
		end,

		if 
			is_tuple(Notice) ->
				{Content_System, Content_horse} = Notice,
				case string:len(Content_System) > 0 andalso string:len(Content_horse) > 0 of
					true ->
						sendSysChat(Content_System),
						case ?Cur_Lang of
							?Lang_KOR -> skip;
							_ ->
								sendPmdChat(Content_horse)
						end,
						ok;
					_ ->
						ok
				end;
			true ->
				case string:len(Notice) > 0 of
					true ->
						sendSysChat(Notice),
						case ?Cur_Lang of
							?Lang_KOR -> skip;
							_ ->
								sendPmdChat(Notice)
						end,
						ok;
					_ ->
						ok
				end
		end.

%% ====================================================================
%% Internal functions
%% ====================================================================
%%给在线玩家发送系统消息
sendSysAllChat(Content) ->
	ChatInfo = playerChat:getSystemChatInfo(Content),
	playerMgrOtp:sendMsgToAllPlayer([ChatInfo]),
	ok.
-spec sendSysAllCharByECode(ErrorCode::uint32()) -> ok.
sendSysAllCharByECode(ErrorCode) ->
	sendSysAllCharByECode(ErrorCode, []),
	ok.
-spec sendSysAllCharByECode(ErrorCode::uint32(), Params::list()) -> ok.
sendSysAllCharByECode(ErrorCode, Params) ->
	psMgr:sendMsg2PS(?PsNamePlayerMgr, pidMsg2AllOLPlayer, {sendSystemChatMsgByECode, {ErrorCode, Params}}),
	ok.

%%发送系统消息和跑马灯消息
sendSysChat(Content) ->
	ChatInfo = playerChat:getSystemChatInfo(Content),
	playerMgrOtp:sendMsgToAllPlayer([ChatInfo]),
	ok.

sendPmdChat(Content) ->
	core:sendBroadcastNotice({?NBroadCastColor, Content}).
