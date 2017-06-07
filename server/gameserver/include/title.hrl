%%%-------------------------------------------------------------------
%%% @author liushixue
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 称号系统
%%% @end
%%% Created : 06. 二月 2015 18:07
%%%-------------------------------------------------------------------
-author("liushixue").

-ifndef(Title_hrl).
-define(Title_hrl,1).

-define(TitleType1_Word,1).		%%称号词组
-define(TitleType1_Effect,2).	%%称号特效
-define(Title_General,0).		%%一般称号，可随机获得
-define(Title_Special,1).		%%特殊称号，特殊途径获得

-define(NoneTitle,0).			%%该槽位没有装配称号

-define(TitleSlotMin,1).		%%称号槽位最小值
-define(TitleSlot1,1).			%%称号槽位1
-define(TitleSlot2,2).			%%称号槽位2
-define(TitleSlot3,3).			%%称号槽位3
-define(TitleColorSlot,4).		%%称号颜色槽位
-define(TitleFloorSlot,5).		%%称号底图槽位
-define(TitleSlotMax,5).		%%称号槽位最大值

-record(recTitle, {
	titleID = 0,                    %%称号ID
	timestamp = 0					%%称号获得时间戳
}).


-endif.
