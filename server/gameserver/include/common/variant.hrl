%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%%
%%% @end
%%% Created : 30. 十月 2014 16:19
%%%-------------------------------------------------------------------

-ifndef(VARIANT_HRL).
-define(VARIANT_HRL,1).

-author("ZhongYuanWei").

-include("setting.hrl").

%%全局变量的ID
%%世界变量的ID为线路的ID，线路的范围为为(0,255]
-define(GlobalVariantID,1000).

%%全局开关变量的起止索引
-define(Setting_GlobalBitVar_Start,(?Setting_GlobalBitVar_StartBit div 32)).
-define(Setting_GlobalBitVar_End,(?Setting_GlobalBitVar_EndBit div 32)).

%%世界开关变量的起止索引
-define(Setting_WorldBitVar_Start,(?Setting_WorldBitVar_StartBit div 32)).
-define(Setting_WorldBitVar_End,(?Setting_WorldBitVar_EndBit div 32)).

%%客户端只读全局开关变量的起止索引
-define(Setting_GlobalBitVarReadOnly_Start,(?Setting_GlobalBitVarReadOnly_StartBit div 32)).
-define(Setting_GlobalBitVarReadOnly_End,(?Setting_GlobalBitVarReadOnly_EndBit div 32)).

%%客户端只读世界开关变量的起止索引
-define(Setting_WorldBitVarReadOnly_Start,(?Setting_WorldBitVarReadOnly_StartBit div 32)).
-define(Setting_WorldBitVarReadOnly_End,(?Setting_WorldBitVarReadOnly_EndBit div 32)).

%%玩家开关变量的起止索引
-define(Setting_PlayerBitVar_Start,(?Setting_PlayerBitVar_StartBit div 32)).
-define(Setting_PlayerBitVar_End,(?Setting_PlayerBitVar_EndBit div 32)).

%%玩家只读开关变量的起止索引
-define(Setting_PlayerBitVarReadOnly_Start,(?Setting_PlayerBitVarReadOnly_StartBit div 32)).
-define(Setting_PlayerBitVarReadOnly_End,(?Setting_PlayerBitVarReadOnly_EndBit div 32)).

%% 客户端只读全局开关类变量，默认开启的如下，仅开关首次使用时生效
-define(GlobalBitVarReadOnly_DefaultOpenList, [
	%% 全局开关类变量，默认开启的如下，仅开头首次使用时生效
	?Setting_GlobalBitVar_WriteLog,

	%% 全局只读类开关类变量
	?Setting_GlobalBitVarReadOnly_Hide_QQ,
	?Setting_GlobalBitVarReadOnly_Hide_ActiveCode,
	?Setting_GlobalBitVarReadOnly_Hide_MobileBind,
	?Setting_GlobalBitVarReadOnly_Hide_ManualUpdate,
	?Setting_GlobalBitVarReadOnly_Hide_Rank,
	?Setting_GlobalBitVarReadOnly_Hide_BugReport,
	?Setting_GlobalBitVarReadOnly_Hide_LuckyDraw,
	?Setting_GlobalBitVarReadOnly_Hide_ChargeButton,
	?Setting_GlobalBitVarReadOnly_Hide_Daily_AccCharge,
	?Setting_GlobalBitVarReadOnly_Hide_GameResourceUpdate,
	?Setting_GlobalBitVarReadOnly_Hide_TransButton,
	?Setting_GlobalBitVarReadOnly_Hide_MonWelfare,

	?Setting_GlobalBitVarReadOnly_Snowman,
	?Setting_GlobalBitVarReadOnly_Darkness,
	?Setting_GlobalBitVarReadOnly_PetBattle,
	?Setting_GlobalBitVarReadOnly_WelfareBtn,
	?Setting_GlobalBitVarReadOnly_ShopBtn,
	?Setting_GlobalBitVarReadOnly_SecretShopBtn,
	?Setting_GlobalBitVarReadOnly_CoinBtn,
	?Setting_GlobalBitVarReadOnly_LeaderBtn,
	?Setting_GlobalBitVarReadOnly_NewYearAct,
	?Setting_GlobalBitVarReadOnly_CrossServerBattle,
	?Setting_GlobalBitVarReadOnly_CrossServerArena,
	?Setting_GlobalBitVarReadOnly_FaceBook,
	?Setting_GlobalBitVarReadOnly_FiveStar,
	?Setting_GlobalBitVarReadOnly_GuildExpedition,
	?Setting_GlobalBitVarReadOnly_PlayerTradeTax,
	?Setting_GlobalBitVarReadOnly_RPView
]).

-endif.