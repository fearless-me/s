{application, gameserver,
	[{description, "luna game server"},
		{vsn, "0.1.0"},
		{modules, [
			gameserver_app
		]},
		{registered, []},
		{applications, [kernel,stdlib]},
		{mod, {gameserver_app,[]}},
		{env,[
			{isRemoteConfig,true},	%%是否取远程（运维数据库）配置
			{isShowInStdio,true},     %%是否显示在标准输出设备中
			{logLevel,debug},         %%本地日志的级别
			{isVerifyArg,0}         %%是否审核需要隐藏内容(0:隐藏，1:不隐藏)
		]}
	]}.
