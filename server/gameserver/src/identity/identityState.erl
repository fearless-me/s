%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20161111
%%%-------------------------------------------------------------------
-module(identityState).
-author("tiancheng").

-include("identityPrivate.hrl").

%% API
-compile(export_all).

%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
%% 任意进程可用的读取数据接口 begin

%% 查询身份证信息
%% 没有查到的时候创建一个默认的结构
-spec queryIdentity(IdentityID::uint64()) ->
{true, ExistsData::#rec_player_identity{}} |
{false, NewData::#rec_player_identity{}}.
queryIdentity(IdentityID) ->
	case ets:lookup(?EtsIdentityData, IdentityID) of
		[#rec_player_identity{} = Rec] ->
			{true, Rec};
		_ ->
			{false, ?DefaultValueOfIdentity(IdentityID)}
	end.

%% 查询照片主表数据
-spec queryPicsMain(MD5::list()) ->
Data::#rec_pic_data_main{} |
{}.
queryPicsMain(MD5) ->
	case ets:lookup(?EtsPicDataMain, MD5) of
		[#rec_pic_data_main{} = Rec] ->
			Rec;
		_ ->
			{}
	end.

%% 查询照片副表数据
-spec queryPicsSub(MD5::list()) ->
	Data::#rec_pic_data_sub{} |
	{}.
queryPicsSub(MD5) ->
	case ets:lookup(?EtsPicDataSub, MD5) of
		[#rec_pic_data_sub{} = Rec] ->
			Rec;
		_ ->
			{}
	end.

%% 任意进程可用的读取数据接口 end
%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------

%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
%% 限定本进程操作的写入数据接口 begin

%% 插入身份证信息
-spec insertIdentity(Identity::#rec_player_identity{}) -> ok.
insertIdentity(Identity) ->
	ets:insert(?EtsIdentityData, Identity),
	ok.

%% 删除身份证信息
-spec deleteIdentity(IdentityID::uint64()) -> ok.
deleteIdentity(IdentityID) ->
	ets:delete(?EtsIdentityData, IdentityID),
	ok.

%% 更新身份证信息
-spec updateIdentity(IdentityID::uint64(), Pos::pos_integer(), Value::term()) -> ok.
updateIdentity(IdentityID, Pos, Value) ->
	ets:update_element(?EtsIdentityData, IdentityID, {Pos, Value}),
	ok.

%% 插入主照片信息
-spec insertPicMain(Pic::#rec_pic_data_main{}) -> ok.
insertPicMain(Pic) ->
	ets:insert(?EtsPicDataMain, Pic),
	ok.

%% 删除主照片信息
-spec deletePicMain(MD5::list()) -> ok.
deletePicMain(MD5) ->
	ets:delete(?EtsPicDataMain, MD5),
	ok.

%% 更新主照片信息
-spec updatePicMain(MD5::list(), Pos::pos_integer(), Value::term()) -> ok.
updatePicMain(MD5, Pos, Value) ->
	ets:update_element(?EtsPicDataMain, MD5, {Pos, Value}),
	ok.

%% 插入副照片信息
-spec insertPicSub(Pic::#rec_pic_data_sub{}) -> ok.
insertPicSub(Pic) ->
	ets:insert(?EtsPicDataSub, Pic),
	ok.

%% 删除副照片信息
-spec deletePicSub(MD5::list()) -> ok.
deletePicSub(MD5) ->
	ets:delete(?EtsPicDataSub, MD5),
	ok.

%% 更新副照片信息
-spec updatePicSub(MD5::list(), Pos::pos_integer(), Value::term()) -> ok.
updatePicSub(MD5, Pos, Value) ->
	ets:update_element(?EtsPicDataSub, MD5, {Pos, Value}),
	ok.

%% 限定本进程操作的写入数据接口 end
%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------

