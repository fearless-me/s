%%%客户端进程的私有定义
-ifndef(UserPrivate_hrl).
-define(UserPrivate_hrl,1).

-include("gsInc.hrl").

-record(rec_HeartBeat,
{
	rand = 0, %% 当前随机值
	timeRef = undefined,    %% 保护心跳
	version = 0,    %% 消息序列号
	sendTime = 0,   %% 发送给客户端的时间
	cheatCount = 0, %% 使用外挂次数
	noRecvTime = 0, %% 没有收到客户端心跳的时间
	noRecvNumber = 0, %% 没有接收到客户端心跳的次数
	lastRecvHeartBeatTime = 0   %% 最后一次收到客户端心跳时间（这才是真正的心跳，仅客户端发给服务器）
}).

-endif.
