%% @author zhengzhichun
%% @doc @todo Add description to configCheck.


-module(configCheck).

-include("logger.hrl").
-include("config.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([
		 startCheckFun/0
		 ]).

-spec startCheckFun() ->ok.
startCheckFun() ->
	%%配置的检查函数都注册到这里(不能终止程序，只能打error_log)
%%	checkFashionClothesConf(),
	ok.
%% ====================================================================
%% Internal functions
%% ====================================================================


%%%%时装功能配置检查
%%-spec checkFashionClothesConf() ->ok.
%%checkFashionClothesConf() ->
%%	Fun =
%%		fun(FashionID) ->
%%				case getCfg:getCfgByKey(cfg_fashion, FashionID) of
%%					#fashionCfg{itemList = IconList} when erlang:is_list(IconList)->
%%						lists:foreach(
%%						  fun(ItemID) ->
%%								  case getCfg:getCfgByKey(cfg_item, ItemID) of
%%									  #itemCfg{useType=17,useParam1=FashionID} ->
%%										  %%item项必需是时装类型，且时装id相等
%%										  ok;
%%									  _O2 ->
%%										  ?ERROR_OUT("config err:fashion item err[~w],fashionID[~w] ",[ItemID,FashionID])
%%								  end
%%						  end, IconList);
%%					_O ->
%%						?ERROR_OUT("config err:fashion Row id[~w]icon[~w]",[FashionID,_O])
%%				end
%%		end,
%%
%%	case getCfg:get1KeyList(cfg_fashion) of
%%		FashionList when erlang:is_list(FashionList)->
%%
%%			lists:foreach(Fun, FashionList),
%%			ok
%%	end,
%%	ok.
