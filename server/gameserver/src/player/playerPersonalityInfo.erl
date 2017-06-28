%%%
%%%-------------------------------------------------------------------
%%% @author chengxuesong
%%% @copyright (C) 2014, <haowan123>
%%% @doc
%%% 玩家个性信息
%%% @end
%%% Created : 25. 二月 2015 17:30
%%%-------------------------------------------------------------------

%% fixme 该模块已废弃，需要找个时间进行清理

-module(playerPersonalityInfo).
-author(chengxs).

-include("playerPrivate.hrl").

-define(MaxTagLen, 18).
-define(MaxImpressLen, 36).
-define(MaxTagNum, 12).
-define(MaxImpressionNum, 50).
-define(MaxBirthdayLen, 30).
-define(MaxStarSignLen, 24).
-define(MaxLocationLen, 57).
-define(MaxSignLen, 144).
%%举报条数上限，到达上限通知客户端并清空
-define(MaxReportNum, 20).
-define(MaxNetDataLen, 10000).
-define(MaxPhotoLen, 400000).
%%同步到内存数据库时间MS
-define(SavePersonlityInfoTime, 30001).
%% ====================================================================
%% API functions
%% ====================================================================
-export([
	getPersonalityInfo/0,
	initPersonalityFromDB/1,
	sendInitInfo/0,
	addTag/1,
	delTag/1,
	delImpression/1,
	addImpression/2,
	gainImpression/2,
	addImpressionAck/2,
	addExtenInfo/2,
	addPraise/1,
	gainPraise/1,
	gainPraiseApi/0,
	addPraiseAck/1,
	reportPlayer/1,
	gainReport/1,
	reportPlayerAck/3,
	uploadingPhoto/3,
	getPhotoData/1,
	sendPhotoDataAPI/3,
	addPraiseAPI/1,
	savePersonalityInfo/0
]).
%%从数据库初始化数据
-spec initPersonalityFromDB(#rec_personality_info{}) -> ok.
initPersonalityFromDB(#rec_personality_info{
	impressions = Impressions
} = PersonalityInfo) ->

	NewImpression = case erlang:length(Impressions) > 0 of
						true ->
							%% 给加上uid
							Fun = fun(#pk_ImpressionInfo{friendID = FriendID, time = Time, impression = Impression}, {AccList, UID}) ->
								{[#pk_ImpressionInfo{uid = UID, friendID = FriendID, time = Time, impression = Impression} | AccList], UID + 1}
							end,
							{RetImpression, MaxUID} = lists:foldr(Fun, {[], 1}, Impressions),
							%% 保存下当前最大uid
							playerState:setPlayerImpressionUID(MaxUID),
							RetImpression;
						_ ->
							%% 初始化最大uid
							playerState:setPlayerImpressionUID(0),
							[]
					end,
	NewPersonalityInfo = PersonalityInfo#rec_personality_info{
		impressions = NewImpression},
	playerState:setPersonalityInfo(NewPersonalityInfo),
	?DEBUG_OUT("initPersonalityFromDB"),
	ok.
%%发送初始化消息给客户端
sendInitInfo() ->
	RoleID = playerState:getRoleID(),
	case playerState:getPersonalityInfo() of
		#rec_personality_info{
			photoData = Data,
			praiseNum = PraiseNum,
			birthday = Birthday,
			location = Location,
			starSign = StarSign,
			sign = Sign,
			tags = Tags,
			impressions = Impressions,
			forbiddenTime = ForbiddenTime
		} ->
			CurTime = time:getSyncTime1970FromDBS(),
			SendFT = case CurTime - ForbiddenTime < globalCfg:getGlobalCfg(banned) * ?One_Hour_Second of
						 true ->
							 ForbiddenTime;
						 _ ->
							 0
					 end,
			playerMsg:sendNetMsg(#pk_GS2U_SendPlayerPersonalityInfo{
				type = ?PersonalInfoSelf,
				praiseNum = PraiseNum,
				birthday = Birthday,
				location = Location,
				starSign = StarSign,
				sign = Sign,
				tags = Tags,
				impressions = Impressions,
				forbiddenTime = SendFT}),
			RoleID = playerState:getRoleID(),
			sendPhotoDataAPI(RoleID, Data, ?PersonalInfoSelf);
		_Undefine ->
			playerState:setPersonalityInfo(#rec_personality_info{
				roleID = RoleID,
				photoData = [],
				praiseNum = 0,
				birthday = "",
				location = "",
				starSign = "",
				sign = "",
				tags = [],
				impressions = [],
				forbiddenTime = 0
			}),
			playerMsg:sendNetMsg(#pk_GS2U_SendPlayerPersonalityInfo{
				type = ?PersonalInfoSelf,
				praiseNum = 0,
				birthday = "",
				location = "",
				starSign = "",
				sign = "",
				tags = [],
				impressions = [],
				forbiddenTime = 0})
	end.
getPersonalityInfo() ->
	case playerState:getPersonalityInfo() of
		#rec_personality_info{
			praiseNum = PraiseNum,
			birthday = Birthday,
			location = Location,
			starSign = StarSign,
			sign = Sign,
			tags = Tags,
			impressions = Impressions
		} ->
			#pk_PlayerPersonalityInfo{
				praiseNum = PraiseNum,
				birthday = Birthday,
				location = Location,
				starSign = StarSign,
				sign = Sign,
				tags = Tags,
				impressions = Impressions};
		_NonePersonalityInfo ->
			#pk_PlayerPersonalityInfo{
				praiseNum = 0,
				birthday = "",
				location = "",
				starSign = "",
				sign = "",
				tags = [],
				impressions = [#pk_ImpressionInfo{friendID = 0, uid = 0, time = 0, impression = ""}]}
	end.
-spec sendPhotoDataAPI(RoleID::uint64(), Data::list(), Type::uint()) -> ok.
sendPhotoDataAPI(RoleID, Data, Type) ->
	SectionNum = misc:ceil(erlang:length(Data)/?MaxNetDataLen),
	sendPhotoData(RoleID, SectionNum, 0, Data, Type),
	ok.
%%把照片数据分段发出去
sendPhotoData(RoleID, SectionNum, SectionIndex, Data, Type) ->
	case erlang:length(Data) > ?MaxNetDataLen of
		true ->
			%%截取一段
			{List, Left} = lists:split(?MaxNetDataLen, Data),
			playerMsg:sendNetMsg(#pk_UpLoadingPhoto{type = Type, roleID = RoleID, sectionNum = SectionNum, sectionIndex = SectionIndex, data = List}),
			?DEBUG_OUT("sendPhotoData SectionNum = ~p, SectionIndex = ~p, DataLen = ~p, LeftLen = ~p",[SectionNum, SectionIndex, erlang:length(List), erlang:length(Left)]),
			sendPhotoData(RoleID, SectionNum, SectionIndex + 1, Left, Type);
		_ ->
			?DEBUG_OUT("sendPhotoData SectionNum = ~p, SectionIndex = ~p, DataLen = ~p",[SectionNum, SectionIndex, erlang:length(Data)]),
			playerMsg:sendNetMsg(#pk_UpLoadingPhoto{type = Type, roleID = RoleID, sectionNum = SectionNum, sectionIndex = SectionIndex, data = Data})
	end.
%%远程玩家获取玩家照片
getPhotoData(PidFrom) ->
	case playerState:getPersonalityInfo() of
		#rec_personality_info{
			photoData = Data
		} ->
			sendPhotoDataToRp(PidFrom, misc:ceil(erlang:length(Data)/?MaxNetDataLen), 0, Data, ?PersonalInfoSelf);
		_ ->
			skip
	end.
%%把照片数据分段发给远程玩家OTP
sendPhotoDataToRp(PidFrom, SectionNum, SectionIndex, Data, Type) ->
	RoleID = playerState:getRoleID(),
	case erlang:length(Data) > ?MaxNetDataLen of
		true ->
			%%截取一段
			{List, Left} = lists:split(?MaxNetDataLen, Data),
			psMgr:sendMsg2PS(PidFrom, sendPhotoData, {RoleID, SectionNum, SectionIndex, List, Type}),
			?DEBUG_OUT("sendPhotoDataToRp SectionNum = ~p, SectionIndex = ~p, DataLen = ~p, LeftLen = ~p", [SectionNum, SectionIndex, erlang:length(List), erlang:length(Left)]),
			sendPhotoDataToRp(PidFrom, SectionNum, SectionIndex + 1, Left, Type);
		_ ->
			?DEBUG_OUT("sendPhotoDataToRp SectionNum = ~p, SectionIndex = ~p, DataLen = ~p", [SectionNum, SectionIndex, erlang:length(Data)]),
			psMgr:sendMsg2PS(PidFrom, sendPhotoData, {RoleID, SectionNum, SectionIndex, Data, Type})
	end.

%%玩家上传照片
uploadingPhoto(Num, Index, Data) ->
	PhotoBuff = playerState:getPlayerPhotoBuff(),
	NewPhotoBuff = [{Index, Data} | PhotoBuff],
	?DEBUG_OUT("Index = ~p, uploadData = ~p", [Index, erlang:length(Data)]),
	case erlang:length(NewPhotoBuff) < Num of
		true ->
			%%还没收全
			playerState:setPlayerPhotoBuff(NewPhotoBuff);
		_ ->
			NewList = lists:keysort(1, NewPhotoBuff),
			Fun = fun({_Index, Data1}, AccList) ->
				[lists:reverse(Data1)|AccList]
			end,
			PhotoData = lists:reverse(lists:flatten(lists:foldl(Fun, [], NewList))),
			?DEBUG_OUT("PhotoData = ~p", [erlang:length(PhotoData)]),
			case length(PhotoData) > ?MaxPhotoLen of
				true ->
					%% 图片最大不能超过400k
					playerMsg:sendErrorCodeMsg(?ErrorCode_Personality_MaxTags),
					%%清空缓存
					playerState:setPlayerPhotoBuff([]),
					playerMsg:sendNetMsg(#pk_GS2U_UpLoadingPhotoResult{result = false});
				_ ->
					%%上传照片成功增加成就
					%playerAchieve:achieveEvent(?Achieve_Social_Event1, [1]),
					RoleID =  playerState:getRoleID(),
					PersonalityInfo = case playerState:getPersonalityInfo() of
										  #rec_personality_info{} = PI ->
											  PI;
										  _ ->
											  #rec_personality_info{roleID = RoleID}
									  end,
					NewPersonalityInfo = PersonalityInfo#rec_personality_info{photoData = PhotoData},
					playerState:setPersonalityInfo(NewPersonalityInfo),
					%%清空缓存
					playerState:setPlayerPhotoBuff([]),
					playerMsg:sendNetMsg(#pk_GS2U_UpLoadingPhotoResult{result = true})
			end
	end.


%%给自己添加标签
-spec addTag(Tag) -> ok when Tag :: string().
addTag(Tag) ->
	%%?DEBUG_OUT("Tag = ~ts", [Tag]),
	case erlang:length(Tag) > 0 of
		true ->
			%%长度最多为6个汉字
			NewTag = string:substr(Tag, 1, ?MaxTagLen),
			%%?DEBUG_OUT("addTag ~ts", [NewTag]),
			PersonalityInfo = playerState:getPersonalityInfo(),
			#rec_personality_info{tags = Tags} = PersonalityInfo,
			%%最大条数限制
			case erlang:length(Tags) < ?MaxTagNum of
				true ->
					NewPersonalityInfo = PersonalityInfo#rec_personality_info{tags = [NewTag | Tags]},
					playerState:setPersonalityInfo(NewPersonalityInfo),
					playerMsg:sendNetMsg(#pk_GS2U_AddTagResult{result = true});
				_ ->
					%% 最多只能添加12个标签
					playerMsg:sendErrorCodeMsg(?ErrorCode_Personality_MaxTags)
			end;
		_ ->
			%% 标签不能为空
			playerMsg:sendErrorCodeMsg(?ErrorCode_Personality_Tag_Empty),
			playerMsg:sendNetMsg(#pk_GS2U_AddTagResult{result = false})
	end,
	ok.
%%删除自己标签
-spec delTag(Index) -> ok when Index::uint8().
delTag(Index) ->
	PersonalityInfo = playerState:getPersonalityInfo(),
	#rec_personality_info{tags = Tags} = PersonalityInfo,
	Tag = lists:nth(Index+1, Tags),
	Left = lists:delete(Tag, Tags),
	NewPersonalityInfo = PersonalityInfo#rec_personality_info{tags = Left},
	playerState:setPersonalityInfo(NewPersonalityInfo),
	%%通知客户端
	playerMsg:sendNetMsg(#pk_DelTag{index = Index}),
	ok.
%%给他人添加印象
addImpression(FriendID, Impression) ->
	case erlang:length(Impression) > 0 of
		true ->
			%%最多12个汉字
			NewImpression = string:substr(Impression, 1, ?MaxImpressLen),
			%%判断是不是好友
			case playerState2:isFriend(FriendID) of
				true ->
					<< _:14,FriendIDDC:50>> = <<FriendID:64>>,
					case playerDaily:getDailyCounter(?DailyType_AddImpresstion, FriendIDDC) > 0 of
						true ->
							%%今天已经给这个好友添加过印象了
							playerMsg:sendErrorCodeMsg(?ErrorCode_Personality_Today_Already_Add_Impress);
						_ ->
							%%看玩家在不在线
							case playerMgrOtp:getOnlinePlayerInfoByID(FriendID) of
								#rec_OnlinePlayer{pid = FriendPid} ->
									Time = time:getSyncTime1970FromDBS(),
									RoleID = playerState:getRoleID(),
									psMgr:sendMsg2PS(FriendPid, addImpression, #pk_ImpressionInfo{friendID = RoleID, time = erlang:trunc(Time / 60), impression = NewImpression});
								_ ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_LuckyCoin_Friend_OffLine)
							end
					end;
				_ ->
					%%你还没有加该玩家为好友哦！
					playerMsg:sendErrorCodeMsg(?ErrorCode_Personality_Not_Friend)
			end;
		_ ->
			%%印象不能为空
			playerMsg:sendErrorCodeMsg(?ErrorCode_Personality_Impression_Empty)
	end,
	ok.
%%给他人添加印象结果
-spec addImpressionAck(Result::atom(), FriendID::int64()) -> ok.
addImpressionAck(Result, FriendID) ->
	?DEBUG_OUT("Result = ~p, FriendID = ~p", [Result, FriendID]),
	case Result of
		full ->
			playerMsg:sendNetMsg(#pk_GS2U_AddImpressionResult{result = false}),
			%%好友的印象已满
			playerMsg:sendErrorCodeMsg(?ErrorCode_Personality_Impress_Full);
		younothisfriend ->
			playerMsg:sendNetMsg(#pk_GS2U_AddImpressionResult{result = false}),
			%%该玩家还没加你为好友
			playerMsg:sendErrorCodeMsg(?ErrorCode_Personality_You_Are_Not_His_Friend);
		_ ->
			%%添加印象成功
			playerMsg:sendErrorCodeMsg(?ErrorCode_Personality_AddImpress_Success),
			playerMsg:sendNetMsg(#pk_GS2U_AddImpressionResult{result = true}),
			<< _:14,FriendIDDC:50>> = <<FriendID:64>>,
			playerDaily:incDailyCounter(?DailyType_AddImpresstion, FriendIDDC)
	end.

%%删除他人对自己的印象
-spec delImpression(UID) -> ok when UID::uint16().
delImpression(UID) ->
	PersonalityInfo = playerState:getPersonalityInfo(),
	#rec_personality_info{impressions = Impressions} = PersonalityInfo,
	Impressions2 = lists:keydelete(UID, #pk_ImpressionInfo.uid, Impressions),
	NewPersonalityInfo = PersonalityInfo#rec_personality_info{impressions = Impressions2},
	playerState:setPersonalityInfo(NewPersonalityInfo),
	%%通知客户端
	playerMsg:sendNetMsg(#pk_DelImpression{uid = UID}),
	ok.
%%获得别人对自己的印象
-spec gainImpression(FriendPid, #pk_ImpressionInfo{}) -> ok when FriendPid::atom() | pid() | {atom(),atom()}.
gainImpression(FriendPid, ImpressionInfo) ->
	#pk_ImpressionInfo{friendID = FriendID} = ImpressionInfo,
	RoleID = playerState:getRoleID(),
	FriendName =
		case playerState2:isFriend(FriendID) of
			true ->
				case core:queryRoleKeyInfoByRoleID(FriendID) of
					#?RoleKeyRec{roleName = Name_} ->
						Name_;
					_ ->
						[]
				end;
			_ ->
				[]
		end,
	%%看玩家是不是你好友
	case FriendName of
		[] ->
			%%玩家还不是你好友
			psMgr:sendMsg2PS(FriendPid, addImpressionAck, {younothisfriend, RoleID});
		_ ->
			PersonalityInfo = playerState:getPersonalityInfo(),
			#rec_personality_info{impressions = Impressions} = PersonalityInfo,
			case erlang:length(Impressions) < ?MaxImpressionNum of
				true ->
					MaxUID = playerState:getPlayerImpressionUID(),
					NewImpressionInfo = ImpressionInfo#pk_ImpressionInfo{uid = MaxUID + 1},
					NewPersonalityInfo = PersonalityInfo#rec_personality_info{impressions = [NewImpressionInfo | Impressions]},
					playerState:setPersonalityInfo(NewPersonalityInfo),
					
					%% 新增好友印象增加成就
					%playerAchieve:achieveEvent(?Achieve_Social_Event7, [1]),
					
					%% xxx给你添加了新的印象，快去看看吧！
					playerMsg:sendErrorCodeMsg(?ErrorCode_Personality_Gain_New_Impression, [FriendName]),
					psMgr:sendMsg2PS(FriendPid, addImpressionAck, {success, RoleID}),
					%%通知客户端
					playerMsg:sendNetMsg(#pk_GS2U_GainImpression{impression = NewImpressionInfo});
				_ ->
					psMgr:sendMsg2PS(FriendPid, addImpressionAck, {full, RoleID})
			end
	end,
	ok.

%%给他人点赞，外部接口，可给离线玩家点赞(只操作缓存中已经有的)
-spec addPraiseAPI(RoleID::uint()) -> boolean().
addPraiseAPI(RoleID) ->
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{pid = PlayerPid} ->
			psMgr:sendMsg2PS(PlayerPid, addPraiseApI, {}),
			true;
		_ ->
			case edb:readRecord(rec_personality_info, RoleID) of
				[#rec_personality_info{praiseNum = Num} = PI| _] ->
					PI1 = PI#rec_personality_info{praiseNum = Num + 1},
					edb:writeRecord(PI1),
					edb:writeRecord(update_rec_personality_info, PI1),
					true;
				_ ->
					%%缓存中没有该玩家数据
					false
			end
	end.

%%给他人点赞
addPraise(FriendID) ->
	?DEBUG_OUT("addPraise ~p", [FriendID]),
	%%每天只能点赞同一玩家一次
	<< _:10,FriendID2:54 >> = << FriendID:64 >>,
	case playerDaily:getDailyCounter(?DailyType_AddPraise, FriendID2) > 0 of
		true ->
			%%今天已经对该玩家点过赞了
			playerMsg:sendErrorCodeMsg(?ErrorCode_Personality_Today_Already_Add_Praise);
		_ ->
			%%看玩家在不在线
			case playerMgrOtp:getOnlinePlayerInfoByID(FriendID) of
				#rec_OnlinePlayer{pid = FriendPid} ->
					psMgr:sendMsg2PS(FriendPid, addPraise, {});
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_LuckyCoin_Friend_OffLine)
			end
	end,
	ok.

%%通过王者获得点赞(以前没有增加成就和通知客服端，因此我这里也未同步给客服端，修复这个bug异常)
gainPraiseApi() ->
	Pi = playerState:getPersonalityInfo(),
	#rec_personality_info{praiseNum = Num} = Pi,
	NewPi = Pi#rec_personality_info{praiseNum = Num + 1},
	playerState:setPersonalityInfo(NewPi).

%%获得点赞
gainPraise(FriendPid) ->
	%%自己获得点赞增加成就
	%playerAchieve:achieveEvent(?Achieve_Social_Event11, [1]),
	PersonalityInfo = playerState:getPersonalityInfo(),
	#rec_personality_info{praiseNum = Num} = PersonalityInfo,
	NewPersonalityInfo = PersonalityInfo#rec_personality_info{praiseNum = Num + 1},
	playerState:setPersonalityInfo(NewPersonalityInfo),
	RoleID = playerState:getRoleID(),
	psMgr:sendMsg2PS(FriendPid, addPraiseAck, RoleID),
	%%通知客户端
	playerMsg:sendNetMsg(#pk_GS2U_GainPraise{}),
	ok.
%%给他人点赞结果
addPraiseAck(FriendID) ->
	%%给他人点赞成功增加成就
	%playerAchieve:achieveEvent(?Achieve_Social_Event10, [1]),
	<< _:10,FriendID2:54 >> = << FriendID:64 >>,
	playerDaily:incDailyCounter(?DailyType_AddPraise, FriendID2),
	%%点赞成功
	playerMsg:sendErrorCodeMsg(?ErrorCode_Personality_Praise_Success),
	playerMsg:sendNetMsg(#pk_GS2U_AddPraise{}).
%%添加扩展信息
-spec addExtenInfo(Type :: uint(), Info :: string()) -> ok.
addExtenInfo(Type, Info) ->
	?DEBUG_OUT("Type = ~p, Info = ~s", [Type, Info]),
	case Type >= ?TypeMin andalso Type =< ?TypeMax of
		true ->
			PersonalityInfo = playerState:getPersonalityInfo(),
			%%截取合法长度
			NewInfo = case Type of
					   ?TypeBirthday ->
						   string:substr(Info, 1, ?MaxBirthdayLen);
					   ?TypeLocation ->
						   string:substr(Info, 1, ?MaxLocationLen);
					   ?TypeStarSign ->
						   string:substr(Info, 1, ?MaxStarSignLen);
					   ?TypeSign ->
						   string:substr(Info, 1, ?MaxSignLen)
				   end,
			NewPersonalityInfo = case Type of
									 ?TypeBirthday ->
										 PersonalityInfo#rec_personality_info{birthday = NewInfo};
									 ?TypeLocation ->
										 PersonalityInfo#rec_personality_info{location = NewInfo};
									 ?TypeStarSign ->
										 PersonalityInfo#rec_personality_info{starSign = NewInfo};
									 ?TypeSign ->
										 PersonalityInfo#rec_personality_info{sign = NewInfo}
								 end,
			playerState:setPersonalityInfo(NewPersonalityInfo),
			%%添加扩展信息成功
			playerMsg:sendErrorCodeMsg(?ErrorCode_Personality_AddExtenInfo_Success),
			playerMsg:sendNetMsg(#pk_GS2U_PlayerExtenInfo{type = Type});
		_ ->
			?ERROR_OUT("addExtenInfo Type Not Define")
	end,
	ok.
%%玩家举报其他玩家
-spec reportPlayer(FriendID) -> ok when FriendID :: uint64().
reportPlayer(FriendID) ->
	case playerDaily:getDailyCounter(?DailyType_ReportPhoto, FriendID) > 0 of
		true ->
			%%一天只能举报同一玩家一次
			playerMsg:sendErrorCodeMsg(?ErrorCode_Personality_Today_Already_Reported);
		_ ->
			%%看玩家在不在线
			case playerMgrOtp:getOnlinePlayerInfoByID(FriendID) of
				#rec_OnlinePlayer{pid = FriendPid} ->
					psMgr:sendMsg2PS(FriendPid, reportPlayer, {});
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_LuckyCoin_Friend_OffLine)
			end
	end,
	ok.
-spec gainReport(FriendPid) -> ok when FriendPid :: pid().
gainReport(FriendPid) ->
	RoleID = playerState:getRoleID(),
	PersonalityInfo = case playerState:getPersonalityInfo() of
						  #rec_personality_info{} = PI ->
							  PI;
						  _ ->
							  #rec_personality_info{roleID = RoleID}
					  end,
	#rec_personality_info{photoData = PhotoData} = PersonalityInfo,
	case PhotoData =:= undefined orelse PhotoData =:= [] of
		true ->
			%%没照片不能举报
			% {failed, ?ErrorCode_Personality_No_Photo};
			skip;
		_ ->
			Num = playerDaily:getDailyCounter(?DailyType_GainReport, RoleID),
			case Num + 1 >= globalCfg:getGlobalCfg(report) of
				true ->
					CurTime = time:getSyncTime1970FromDBS(),
					%%通知客户端已经被禁止传照片
					playerMsg:sendNetMsg(#pk_GS2U_Forbidden_Load_Photo{forbiddenTime = CurTime}),
					%%清空举报次数,清空照片数据,记录禁止时间
					playerDaily:reduceDailyCounter(?DailyType_GainReport, RoleID, Num),

					NewPersonalityInfo1 = PersonalityInfo#rec_personality_info{photoData = [], forbiddenTime = CurTime},
					playerState:setPersonalityInfo(NewPersonalityInfo1);
				_ ->
					playerDaily:incDailyCounter(?DailyType_GainReport, RoleID)
			end,
			psMgr:sendMsg2PS(FriendPid, reportPlayerAck, {success, RoleID, ?ErrorCode_Personality_Report_Success})
	end,
	ok.
%%举报成功
reportPlayerAck(success, RoleID, ErrorCode) ->
	playerDaily:incDailyCounter(?DailyType_ReportPhoto, RoleID),
	%%举报成功！
	playerMsg:sendErrorCodeMsg(ErrorCode);
%%举报成功
reportPlayerAck(failed, _RoleID, ErrorCode) ->
	%%举报失败！
	playerMsg:sendErrorCodeMsg(ErrorCode).
%% ====================================================================
%% Internal functions
%% ====================================================================
savePersonalityInfo() ->
	playerSave:savePersonalityInfo(playerState:getPersonalityInfo()),
	ok.