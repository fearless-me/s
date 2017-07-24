%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20161111
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(Hrl_identityPrivate__hrl___).
-define(Hrl_identityPrivate__hrl___, 1).

-include("gsInc.hrl").

%% 血型定义
-define(BLOOD_UNKNOWN, 0).
-define(BLOOD_A, 1).
-define(BLOOD_B, 2).
-define(BLOOD_AB, 3).
-define(BLOOD_O, 4).
-type type_blood() :: ?BLOOD_UNKNOWN .. ?BLOOD_O.

%% 照片的上传下载操作任务，每个玩家进程同时只能进行一个，并且有超时判断
-define(PicLimitSize, 3*1024*1024).                            %% 照片尺寸硬性限制，如果需要配置限制，也不能超过该限制
-define(UpOrDownLoadTaskOutTime,  120000).                            %% 上传或下载任务超时时间（毫秒）
-define(UpOrDownLoadTaskMsgID,    identity_UpOrDwonLoadTaskOutTime).  %% 上传或下载任务超时消息ID
-define(DownLoadDataCell,         20480).                             %% 上传任务由客户端决定数据段长度，下载任务数据段长度就是这个
-define(ActiveTimeOfDown,         12*3600).                           %% 最后一次下载操作经历的该时间内，认为数据处于活跃状态，需要放在主表（秒）
-define(ActiveTimeOfUp,           4*3600).                            %% 最后一次上传操作经历的该时间内，认为数据处于活跃状态，需要放在主表（秒）
-record(upOrDownLoadTask, {   %% 上传或下载任务信息
	timeR = undefined,          %% 计时器引用
	isOpen = false,             %% 是否开放传输（等待校验完成）
	timeBegin = 0,              %% 开始时间
	md5 = [],                   %% MD5键值
	sizeMax = 0,                %% 照片完整尺寸
	index = 0,                  %% 数据分段索引
	upOrDown = true,            %% 上传还是下载
	size = 0,                   %% 已经传输完成的照片尺寸
	data = [],                  %% 缓存数据
	pos = 0                     %% 目标相册位置
}).

%% 照片上传下载日志的操作类型
-define(UpOrDownLoadTask_UpS,     0). %% 上传成功
-define(UpOrDownLoadTask_DownS,   1). %% 下载成功
-define(UpOrDownLoadTask_UpF,     2). %% 上传失败
-define(UpOrDownLoadTask_DownF,   3). %% 下载失败

%% 照片数量
-define(CountPics,  3).

%% 赠礼记录表（?EtsGiftHistory）记录最大数量
-define(GIFT_HISTORY_COUNT_MAX, 10000).

-endif. %% Hrl_identityPrivate__hrl___