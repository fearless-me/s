%% @author caijunjun
%% @doc @todo NPC相关定义.

-ifndef(Collect_hrl).
-define(Collect_hrl,1).

-record(recSpawnCollect,{
	id = 0,							%%采集对象的ID
	x = 0.0,							%%采集对象的位置X
	y = 0.0,							%%采集对象的位置Y
	rotW = 0.0,                        %%采集对象的旋转值
	groupID = 0         %% 采集对象的分组id
}).

-endif.
