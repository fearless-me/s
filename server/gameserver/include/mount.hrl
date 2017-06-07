%%%坐骑相关定义
-author(luowei).
-ifndef(Mount_hrl).
-define(Mount_hrl,1).


%%坐骑操作
-define(OnMount,     1).  %%上坐骑
-define(OffMount,    2).  %%下坐骑


-define(OnMountState,	1).	%% 上马
-define(OffMountState,	0).	%% 下马
%%坐骑信息记录
-record(mountInfo,{
				    id 	    = 0,    %%坐骑ID
					speed  	= 0,    %%坐骑移动速度
				    state  	= 0,    %%坐骑状态0:下坐骑1:上坐骑
				    shape  	= 0,    %%坐骑外观
					level  	= 1,    %%坐骑等级
					exp    	= 0     %%坐骑经验
%% 					hp		= 0,	%%坐骑血量（为0时下马）
%% 					skills	= []	%%坐骑附加技能
				  }).

-record(onMountInfo, {
					  isModified = false,   %% 是否修改
					  level = 0,	        %% 坐骑等级
					  state	= 0,	        %% 坐骑状态
					  speed = [],	        %% 坐骑移动速度
					  shape = 0,	        %% 坐骑外观
					  exp 	= 0,	        %% 坐骑经验
%% 					  maxHP = 0,	        %% 上马血量最大值增加
					  skills = []	        %% 坐骑附加技能
					 }).


-endif.