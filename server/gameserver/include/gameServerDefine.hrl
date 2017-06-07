-ifndef(GameServerDefine_hrl).
-define(GameServerDefine_hrl,1).

%%服务器列表中游戏服务器状态
-define( GameServer_State_UnCheckPass,	    0 ).%%正常
-define( GameServer_State_CheckPass,	    1 ).%%火爆
-define( GameServer_State_Running,	        2 ).%%爆满
-define( GameServer_State_ForbidLogin,	    3 ).%%维护
-define( GameServer_State_Closed,	        4 ).%%维护
-define( GameServer_State_SpecCanVisable,	5 ).%%测试人员可见

%%服务器在线人数状态显示
-define( GameServer_Online_State_Normal_Min,  0	).%%正常最小值
-define( GameServer_Online_State_Normal_Max,  10	).%%正常最大值

-define( GameServer_Online_State_Hot_Min,  11	).%%火爆最小值
-define( GameServer_Online_State_Hot_Max,  20	).%%火爆最大值

-define( GameServer_Online_State_Full_Min,  21	).%%爆满最小值
-define( GameServer_Online_State_Full_Max,  2000	).%%爆满最大值

-record(gameServerUsers, {userID = 0}).

-record(lineServerState, {
						  lineServerID = 0,
						  lineServerIp = "",
						  lineServerSocket = 0,
						  dictServerUser
						  }
	   ).
-endif. % -ifdef(gameServerDefine_hrl).
