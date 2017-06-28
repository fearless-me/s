%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20161111
%%%-------------------------------------------------------------------
-module(identityLogic).
-author("tiancheng").

-include("identityPrivate.hrl").

%% Tool
-export([
	getDefaultValue/1,
	getNewIdentity/3,
	pos2idit/1,
	idit2pos/1
]).

%% API
-export([
	editIdentity/2,
	editIdentity_pic/2,
	identity_picUp/2,
	identity_picDown/1,
	identity_picDownAck/1,
	identity_picWantDown/1,
	identity_picUnactive/0
]).

%%% ====================================================================
%%% Tool functions
%%% ====================================================================

%% 获得信息类型对应的默认值
-spec getDefaultValue(IDIT::type_idit()) -> term().
getDefaultValue(?IDIT_AGE) -> ?DefaultValueOfAge;
getDefaultValue(?IDIT_BIRTH) -> {0, 0};
getDefaultValue(?IDIT_ZODIAC) -> 0;
getDefaultValue(?IDIT_BLOOD) -> 0;
getDefaultValue(?IDIT_HOMETOWN) -> {0, 0};
getDefaultValue(?IDIT_LOCATION) -> {0, 0};
getDefaultValue(?IDIT_TAGS) -> [];
getDefaultValue(?IDIT_PIC1) -> [];
getDefaultValue(?IDIT_PIC2) -> [];
getDefaultValue(?IDIT_PIC3) -> [];
getDefaultValue(?IDIT_FACE) -> [];
getDefaultValue(?IDIT_SIGN) -> [];
getDefaultValue(InvalidArument) ->
	?ERROR_OUT("getDefaultValue InvalidArument(~p)~n~p", [InvalidArument, misc:getStackTrace()]).

%% 获得因个别字段字段改变而产生的新值
-spec getNewIdentity(IDIT::type_idit(), Data::term(), IdentityOld::#rec_player_identity{}) -> #rec_player_identity{}.
getNewIdentity(?IDIT_AGE, Age, IdentityOld) ->
	%?DEBUG_OUT("[DebugForIdentity] getNewIdentity", []),
	IdentityOld#rec_player_identity{age = Age};
getNewIdentity(?IDIT_BIRTH, {Month, Day}, IdentityOld) ->
	IdentityOld#rec_player_identity{birthmonth = Month, birthday = Day};
getNewIdentity(?IDIT_ZODIAC, Zodiac, IdentityOld) ->
	IdentityOld#rec_player_identity{zodiac = Zodiac};
getNewIdentity(?IDIT_BLOOD, BloodType, IdentityOld) ->
	IdentityOld#rec_player_identity{bloodType = BloodType};
getNewIdentity(?IDIT_HOMETOWN, {Hometown1, Hometown2}, IdentityOld) ->
	IdentityOld#rec_player_identity{hometown1 = Hometown1, hometown2 = Hometown2};
getNewIdentity(?IDIT_LOCATION, {Location1, Location2}, IdentityOld) ->
	IdentityOld#rec_player_identity{location1 = Location1, location2 = Location2};
getNewIdentity(?IDIT_TAGS, Tags, IdentityOld) ->
	IdentityOld#rec_player_identity{tags = Tags};
getNewIdentity(?IDIT_PIC1, Pic, IdentityOld) ->
	IdentityOld#rec_player_identity{pic1 = Pic};
getNewIdentity(?IDIT_PIC2, Pic, IdentityOld) ->
	IdentityOld#rec_player_identity{pic2 = Pic};
getNewIdentity(?IDIT_PIC3, Pic, IdentityOld) ->
	IdentityOld#rec_player_identity{pic3 = Pic};
getNewIdentity(?IDIT_FACE, Face, IdentityOld) ->
	IdentityOld#rec_player_identity{face = Face};
getNewIdentity(?IDIT_SIGN, Sign, IdentityOld) ->
	IdentityOld#rec_player_identity{sign = Sign};
getNewIdentity(InvalidIDIT, Data, IdentityOld) ->
	?ERROR_OUT("getNewIdentity InvalidArument(~p)~n~p", [{InvalidIDIT, Data, IdentityOld}, misc:getStackTrace()]).

%% 相册位置对应的身份证属性字段ID互相转换
-spec pos2idit(Pos::uint8()) -> IDIT::type_idit().
pos2idit(0) -> ?IDIT_PIC1;
pos2idit(1) -> ?IDIT_PIC2;
pos2idit(2) -> ?IDIT_PIC3.
-spec idit2pos(IDIT::type_idit()) -> Pos::uint8().
idit2pos(?IDIT_PIC1) -> 0;
idit2pos(?IDIT_PIC2) -> 1;
idit2pos(?IDIT_PIC3) -> 2.

%%% ====================================================================
%%% API functions
%%% ====================================================================

%% 编辑身份证信息
%% 注1：包括标签，标签的特殊部分已由玩家进程处理
%% 注2：相册除外，使用其它方式进行管理
%% 注3：需要对编辑头像引起的照片数据引用计数变化而进行处理
-spec editIdentity(Pid::pid(), {IDIT::type_idit(), IdentityID::uint64(), Data::term()}) -> ok.
editIdentity(Pid, {IDIT, IdentityID, Data}) ->
	%?DEBUG_OUT("[DebugForIdentity] editIdentity IDIT(~p) IdentityID(~p) Data(~p)", [IDIT, IdentityID, Data]),
	{IsExists, IdentityOld} = identityState:queryIdentity(IdentityID),
	IdentityNew = getNewIdentity(IDIT, Data, IdentityOld),
	case IdentityNew of
		IdentityOld ->
			%% 多种情况下，编辑前后数据一致，这种情况应当被角色进程排除
			?ERROR_OUT("editIdentity invalid argument Data(~p), playerIdentity should except this situation!", [Data]);
		_ ->
			%% 如果编辑项是头像，需要更新引用计数
			case IDIT of
				?IDIT_FACE ->
					case IdentityOld#rec_player_identity.face of
						[] ->
							skip;
						FaceOld ->
							updateCountOfPicData(false, FaceOld)
					end,
					case Data of
						[] ->
							skip;
						_ ->
							updateCountOfPicData(true, Data)
					end;
				_ ->
					skip
			end,
			%% 继续编辑身份证信息
			case IsExists of
				true ->
					case getDefaultValue(IDIT) of
						Data ->
							%% 本次编辑的字段是默认值，可能导致记录无效
							%% 存在现成的数据
							case ?DefaultValueOfIdentity(IdentityID) of
								IdentityNew ->
									%% 新的数据所有值都是默认值，本次编辑将导致记录被删除
									identityState:deleteIdentity(IdentityID),
									gsSendMsg:sendMsg2DBServer(identity_Delete, 0, {IDIT, IdentityID});
								_ ->
									%% 覆盖新的数据
									updateIdentity(IDIT, Data, IdentityID),
									gsSendMsg:sendMsg2DBServer(identity_Update, 0, {IDIT, IdentityID, Data})
							end;
						_ ->
							%% 覆盖新的数据
							updateIdentity(IDIT, Data, IdentityID),
							gsSendMsg:sendMsg2DBServer(identity_Update, 0, {IDIT, IdentityID, Data})
					end;
				_ ->
					%% 原本不存在数据，本次编辑后产生新的记录
					identityState:insertIdentity(IdentityNew),
					gsSendMsg:sendMsg2DBServer(identity_Insert, 0, {IDIT, IdentityID, Data})
			end,
			%% 反馈处理结果
			psMgr:sendMsg2PS(Pid, identity_editAck, {IDIT, Data})
	end,
	ok.

%% 编辑身份证信息_照片
%% 注：该消息是作为对editIdentity/2不足的补充，仅处理相册的编辑请求
%% 已在玩家进程验证是否是相同的MD5
-spec editIdentity_pic(Pid::pid(), {IdentityID::uint64(), Pos::uint8(), MD5Old::list(), MD5New::list()}) -> ok.
editIdentity_pic(Pid, {IdentityID, Pos, MD5Old, MD5New}) ->
	?LOG_OUT("[DebugForIdentity] editIdentity RoleID(~p) Pos(~p)", [IdentityID, Pos]),
	IDIT = pos2idit(Pos),
	%% 删除可能需要删除的数据
	case MD5Old of
		[] ->
			skip;
		_ ->
			%% 仅更新计数，不在此处编辑身份证相关字段，而是由新增处调用editIdentity
			updateCountOfPicData(false, MD5Old)
	end,
	%% 新增
	case MD5New of
		[] ->
			editIdentity(Pid, {IDIT, IdentityID, MD5New});  %% 替换为空（删除）
		_ ->
			%% 替换为有效MD5
			InMain =
				case identityState:queryPicsMain(MD5New) of
					#rec_pic_data_main{} ->
						true;
					_ ->
						case identityState:queryPicsSub(MD5New) of
							#rec_pic_data_sub{} ->
								false;
							_ ->
								none
						end
				end,
			case InMain of
				none ->
					%% 照片不存在，需要上传
					?LOG_OUT("[DebugForIdentity] editIdentity RoleID(~p) Pos(~p) need up", [IdentityID, Pos]),
					psMgr:sendMsg2PS(Pid, identity_edit_picAck, {MD5New, false});
				_ ->
					%% 照片已存在，更新计数并编辑
					?LOG_OUT("[DebugForIdentity] editIdentity RoleID(~p) Pos(~p) edit", [IdentityID, Pos]),
					updateCountOfPicData(true, MD5New),
					editIdentity(Pid, {IDIT, IdentityID, MD5New}),
					psMgr:sendMsg2PS(Pid, identity_edit_picAck, {MD5New, true})
			end
	end,
	ok.

-spec identity_picUp(Pid::pid(), {IdentityID::uint64(), MD5::list(), Data::list(), Pos::uint8()}) -> ok.
identity_picUp(Pid, {IdentityID, MD5, Data, Pos}) ->
	%?DEBUG_OUT("[DebugForIdentity] identity_picUp IdentityID(~p) MD5(~p) Pos(~p)", [IdentityID, MD5, Pos]),
	InMain =
		case identityState:queryPicsMain(MD5) of
			#rec_pic_data_main{} ->
				true;
			_ ->
				case identityState:queryPicsSub(MD5) of
					#rec_pic_data_sub{} ->
						false;
					_ ->
						none
				end
		end,
	case InMain of
		none ->
			%% 照片不存在，插入数据
			Pic =
				#rec_pic_data_main{
					md5 = MD5,
					data = Data,
					timeLastDown = 0,
					timeLastUp = time:getSyncUTCTimeFromDBS(),
					state = 0,%?IDDER_IsPending,
					count = 1
				},
			identityState:insertPicMain(Pic),
			gsSendMsg:sendMsg2DBServer(identity_pic_InsertMain, 0, Pic);
		_ ->
			%% 照片已存在，更新计数
			updateCountOfPicData(true, MD5)
	end,
	editIdentity(Pid, {pos2idit(Pos), IdentityID, MD5}),
	ok.

-spec identity_picDown({IdentityID::uint64(), MD5::list()}) -> ok.
identity_picDown({IdentityID, MD5}) ->
	%?DEBUG_OUT("[DebugForIdentity] identity_picDown IdentityID(~p) MD5(~p)", [IdentityID, MD5]),
	case identityState:queryPicsSub(MD5) of
		#rec_pic_data_sub{} ->
			gsSendMsg:sendMsg2DBServer(identity_pic_Active, 0, {IdentityID, MD5});
		_ ->
			%% 副表中没有找到对应信息，可能是多进程的同步问题导致
			identity_picDownAck({IdentityID, MD5, {}})
	end,
	ok.

-spec identity_picDownAck({IdentityID::uint64(), MD5::list(), Pic::term()}) -> ok.
identity_picDownAck({IdentityID, MD5, Pic}) ->
	%?DEBUG_OUT("[DebugForIdentity] identity_picDownAck IdentityID(~p) MD5(~p) Pic(~p)", [IdentityID, MD5, Pic]),
	case Pic of
		#rec_pic_data_main{state = State, data = Data} ->
			identityState:deletePicSub(MD5),
			identityState:insertPicMain(Pic),
			case core:queryOnLineRoleByRoleID(IdentityID) of
				#rec_OnlinePlayer{pid = Pid1} ->
					psMgr:sendMsg2PS(Pid1, identity_picDownAck, {true, MD5, State, Data});
				_ ->
					skip
			end;
		_ ->
			case core:queryOnLineRoleByRoleID(IdentityID) of
				#rec_OnlinePlayer{pid = Pid2} ->
					psMgr:sendMsg2PS(Pid2, identity_picDownAck, {false, MD5, 0, []});
				_ ->
					skip
			end
	end,
	ok.

%% 更新最近下载时间（必然在主表）
-spec identity_picWantDown(MD5::list()) -> ok.
identity_picWantDown(MD5) ->
	%?DEBUG_OUT("[DebugForIdentity] identity_picWantDown MD5(~p)", [MD5]),
	case identityState:queryPicsMain(MD5) of
		#rec_pic_data_main{} ->
			identityState:updatePicMain(MD5, #rec_pic_data_main.timeLastDown, time:getSyncUTCTimeFromDBS()),
			gsSendMsg:sendMsg2DBServer(identity_picWantDown, 0, MD5);
		_ ->
			skip
	end,
	ok.

%% 检查主表中的非活跃数据转移到副表
-spec identity_picUnactive() -> ok.
identity_picUnactive() ->
	%?DEBUG_OUT("[DebugForIdentity] identity_picUnactive"),
	TimeNow = time:getSyncUTCTimeFromDBS(),
	FunGetData =
		fun(#rec_pic_data_main{timeLastDown = TimeLastDown, timeLastUp = TimeLastUp} = E, R) ->
			case TimeNow - TimeLastDown > ?ActiveTimeOfDown andalso TimeNow - TimeLastUp > ?ActiveTimeOfUp of
				true ->
					[E | R];
				_ ->
					R
			end
		end,
	ListMsg = ets:foldl(FunGetData, [], ?EtsPicDataMain),
	?LOG_OUT("identity_picUnactive count:~p", [erlang:length(ListMsg)]),
	case ListMsg of
		[] ->
			skip;
		_ ->
			gsSendMsg:sendMsg2DBServer(identity_pic_Unactive, 0, ListMsg),
			FunDelete =
				fun(#rec_pic_data_main{md5 = MD5}) ->
					identityState:deletePicMain(MD5)
				end,
			lists:foreach(FunDelete, ListMsg),
			FunInsert =
				fun(#rec_pic_data_main{
					md5 = MD5,
					%data = Data,
					%timeLastDown = TimeLastDown,
					%timeLastUp = TimeLastUpSub,
					state = StateSub,
					count = CountSub
				}) ->
					identityState:insertPicSub(
						#rec_pic_data_sub{
							md5 = MD5,
							data = [],                    %% 副表中不在内存中保存图片数据
							timeLastDown = 0,             %% 副表中不关心该值
							timeLastUp = 0,               %% 副表中不关心该值
							state = StateSub,
							count = CountSub
						}
					)
				end,
			lists:foreach(FunInsert, ListMsg)
	end,
	ok.

%%% ====================================================================
%%% Internal functions
%%% ====================================================================

%% 根据信息类型更新部分字段
-spec updateIdentity(IDIT::type_idit(), Data::term(), IdentityID::uint64()) -> ok.
updateIdentity(?IDIT_AGE, Age, IdentityID) ->
	identityState:updateIdentity(IdentityID, #rec_player_identity.age, Age);
updateIdentity(?IDIT_BIRTH, {Month, Day}, IdentityID) ->
	identityState:updateIdentity(IdentityID, #rec_player_identity.birthmonth, Month),
	identityState:updateIdentity(IdentityID, #rec_player_identity.birthday, Day);
updateIdentity(?IDIT_ZODIAC, Zodiac, IdentityID) ->
	identityState:updateIdentity(IdentityID, #rec_player_identity.zodiac, Zodiac);
updateIdentity(?IDIT_BLOOD, BloodType, IdentityID) ->
	identityState:updateIdentity(IdentityID, #rec_player_identity.bloodType, BloodType);
updateIdentity(?IDIT_HOMETOWN, {Hometown1, Hometown2}, IdentityID) ->
	identityState:updateIdentity(IdentityID, #rec_player_identity.hometown1, Hometown1),
	identityState:updateIdentity(IdentityID, #rec_player_identity.hometown2, Hometown2);
updateIdentity(?IDIT_LOCATION, {Location1, Location2}, IdentityID) ->
	identityState:updateIdentity(IdentityID, #rec_player_identity.location1, Location1),
	identityState:updateIdentity(IdentityID, #rec_player_identity.location2, Location2);
updateIdentity(?IDIT_TAGS, Tags, IdentityID) ->
	identityState:updateIdentity(IdentityID, #rec_player_identity.tags, Tags);
updateIdentity(?IDIT_PIC1, Pic, IdentityID) ->
	identityState:updateIdentity(IdentityID, #rec_player_identity.pic1, Pic);
updateIdentity(?IDIT_PIC2, Pic, IdentityID) ->
	identityState:updateIdentity(IdentityID, #rec_player_identity.pic2, Pic);
updateIdentity(?IDIT_PIC3, Pic, IdentityID) ->
	identityState:updateIdentity(IdentityID, #rec_player_identity.pic3, Pic);
updateIdentity(?IDIT_FACE, Face, IdentityID) ->
	identityState:updateIdentity(IdentityID, #rec_player_identity.face, Face);
updateIdentity(?IDIT_SIGN, Sign, IdentityID) ->
	identityState:updateIdentity(IdentityID, #rec_player_identity.sign, Sign);
updateIdentity(InvalidIDIT, Data, IdentityID) ->
	?ERROR_OUT("updateIdentity InvalidArument(~p)~n~p", [{InvalidIDIT, Data, IdentityID}, misc:getStackTrace()]).

%% 更新已有照片数据的引用计数
-spec updateCountOfPicData(IsAdd::boolean(), MD5::list()) -> ok | error | none.
updateCountOfPicData(IsAdd, MD5) ->
	%% 过滤可能的无效MD5
	MD5IsValid =
		case erlang:is_list(MD5) of
			true ->
				FunCheck =
					fun(Element, {Mark, Count}) ->
						case Mark andalso erlang:is_integer(Element) andalso Element >= 0 andalso Element =< 255 of
							true ->
								{Mark, Count + 1};
							_ ->
								{false, Count}
						end
					end,
				{Mark, Count} = lists:foldl(FunCheck, {true, 0}, MD5),
				Mark =:= true andalso Count =:= 16;
			_ ->
				false
		end,
	case MD5IsValid of
		false ->
			?ERROR_OUT("updateCountOfPicData invalid MD5(~p)~n~p", [MD5, misc:getStackTrace()]),
			error;
		_ ->
			%% 过滤不不受管理的MD5
			{CountOld, InMain} =
				case identityState:queryPicsMain(MD5) of
					#rec_pic_data_main{count = CountMain} ->
						{CountMain, true};
					_ ->
						case identityState:queryPicsSub(MD5) of
							#rec_pic_data_sub{count = CountSub} ->
								{CountSub, false};
							_ ->
								{0, none}
						end
				end,
			case InMain of
				none ->
					none;
				_ ->
					%% 修改引用计数
					CountNew =
						case IsAdd of
							true ->
								CountOld + 1;
							_ ->
								CountOld - 1
						end,
					case CountNew =< 0 of
						true ->
							case InMain of
								true ->
									identityState:deletePicMain(MD5);
								_ ->
									identityState:deletePicSub(MD5)
							end;
						_ ->
							case InMain of
								true ->
									identityState:updatePicMain(MD5, #rec_pic_data_main.count, CountNew);
								_ ->
									identityState:updatePicSub(MD5, #rec_pic_data_sub.count, CountNew)
							end
					end,
					gsSendMsg:sendMsg2DBServer(identity_pic_UpdateCount, 0, {MD5, InMain, CountNew}),
					ok
			end
	end,
	ok.
