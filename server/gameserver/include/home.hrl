%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%%	家园相关定义
%%% @end
%%% Created : 17. 八月 2017 20:01
%%%-------------------------------------------------------------------
-author(tiancheng).
-ifndef(HHH_Home_hrl_______).
-define(HHH_Home_hrl_______, 1).

-include("cfg_home_plants.hrl").
-include("playerLog.hrl").

%% 家园ID，按位存储，10位DBID，10位地区ID，12位段ID，16位号ID
-define(HomeID_NONE, 16).	%% 这是空位
-define(HomeID_DBID, 10).
-define(HomeID_AREA, 10).
-define(HomeID_ID1, 12).
-define(HomeID_ID2, 16).

%%%%%%%%%%%%%%%%%%%%%%%%%
%%	地址格式 A区 B路 C段 D号
%%	A=游戏中的地图，为玩家可选，区ID对应
%%	B=服务器名（如果是S27这种，则显示数字）
%%	C=服务器按序分配，区间为1~99
%%	D=服务器按序分配，区间为1~9999
-define(HomeID1Max, 99).
-define(HomeID2Max, 9999).

-define(Home_AreaID_Min, 1).
-define(Home_House, 1).			%% 房子
-define(Home_Courtyard, 2).		%% 庭院
-define(Home_BreedArea , 3).	%% 饲养区
-define(Home_Plantation_A, 4).	%% 种植区A
-define(Home_HotSpring, 5).		%% 温泉
-define(Home_Bonfire, 6).		%% 篝火区
-define(Home_WishingWell, 7).	%% 许愿池
-define(Home_Plantation_B, 8).	%% 种植区B
-define(Home_Plantation_C, 9).	%% 种植区C
-define(Home_AreaID_Max, 9).

%% 家园主ETS
-define(HomeEts, rec_home).
%% 家园区域ETS
-define(HomeAreaEts, rec_home_area).
%% 家园地图ETS
-define(HomeMapEts, rec_home_map).
%% 家园拜访记录ETS
-define(HomeVisitEts, rec_home_visit).

%% 家园地图表
-record(rec_home_map, {
	homeID = 0,	%% {HomeID, Flag}
	flag = 0,	%% 房屋还是庭院
	mapID = 0,
	mapPID = undefined,
	createTime = 0	%% 创建时间
}).

%% 家园拜访记录
-record(rec_home_visit, {
	homeID = 0,
	opType = 0,
	opParam1 = 0,
	opParam2 = 0,
	opParam3 = 0,
	visitID = 0,	%% 访客ID
	areaID = 0,		%% 区域ID
	timestamp = 0	%% 时间戳
}).

%% 角色身份
-define(HomeRole_BEGIN,		1).
-define(HomeRole_Master,	1).	%% 家园主人
-define(HomeRole_Partner,	2).	%% 同居者
-define(HomeRole_Guest,		3).	%% 未明身份者
-define(HomeRole_END,		3).

-define(HomeRelationType_Self, 0).			%% 拜访身份，自己
-define(HomeRelationType_Friend, 1).		%% 拜访身份，好友
-define(HomeRelationType_PartnerMan, 2).	%% 拜访身份，伴侣男
-define(HomeRelationType_PartnerWoman, 3).	%% 拜访身份，伴侣女
-define(HomeRelationType_Stranger, 4).		%% 拜访身份，陌生人

-define(HomeOpType_Visit, 1).	%% 操作记录：拜访
-define(HomeOpType_Harvest, 2).	%% 操作记录：收菜

%%%-------------------------------------------------------------------
% 种植区

%% 针对作物的操作
-define(HomePlant_BEGIN,		1).
-define(HomePlant_Plant,		1).	%% 种植
-define(HomePlant_Grubbing,		2).	%% 清除
-define(HomePlant_Harvest,		3).	%% 收获
-define(HomePlant_Watering,		4).	%% 浇水
-define(HomePlant_Compost,		5).	%% 施肥
-define(HomePlant_ClearPestis,	6).	%% 除虫
-define(HomePlant_END,			6).

%% 作物数据内存管理
-define(HomePlantPosMax,		8).	%% 每个种植区最大有8个种植点
-record(recHomePlant, {
	key			= {0, 0, 0} 	:: {uint64(), uint8(), uint8()},	%% {家园ID, 区域ID, 种植点[1, ?PlantPosMax]}
	id			= 0				:: uint16(),						%% 作物ID，对应plant.id
	time		= 0				:: uint32(),						%% 种植时间，time:getSyncTimeFromDBS/0
	health		= 0				:: uint8(),							%% 健康值【访问数据时需要刷新】
	watering	= []			:: [uint32(), ...],					%% 浇水时间点记录
	compost		= []			:: [uint32(), ...],					%% 施肥时间点记录
	pestis		= {false, 0, 0}	:: {boolean(), uint8(), uint32()}	%% {当前是否是虫害状态, 虫害次数, 虫害时间点}【访问数据时需要刷新】
	% 【虫害时间点】解释：
	% 1.如果不在虫害状态，虫害时间点为下次发生虫害的时间点
	% 2.如果在虫害状态，虫害时间点为刷新虫害的时间
	%    每次刷新时，从虫害时间点向当前时间，按小时为刻度进行推进，不足1小时的则不推进
	%    例如2017-08-24 10:07:00发生虫害，现在时间2017-08-24 12:00:00，距离虫害时间点仅有不到2个小时
	%    那么取1小时刷新虫害导致的健康值变化，虫害时间点更新至2017-08-24 11:07:00
}).
-define(EtsHomePlant, recHomePlant).

%%%-------------------------------------------------------------------
% 饲养区

%%饲养区数据
-record(recHomeFarming, {
	key         ={0,0}          ::{uint64(), uint16()},      %%  {家园ID,petid}
	time		=0				:: uint32()						%% 放入养殖区时间，time:getSyncTimeFromDBS/0
}).


-endif.