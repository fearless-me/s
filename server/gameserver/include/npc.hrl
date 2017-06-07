%% @author caijunjun
%% @doc @todo NPC相关定义.

-ifndef(Npc_hrl).
-define(Npc_hrl,1).

-define(NpcType_Normal, 0).     %% 普通NPC
-define(NpcType_Block, 1).      %% 阻挡NPC

-define(BlockNpc_Close, 0).     %% 阻挡NPC，默认关闭
-define(BlockNpc_Open, 1).      %% 阻挡NPC，开启

-record(recSpawnNpc,{
	id = 0,							%%Npc的ID
	x = 0.0,							%%Npc的位置X
	y = 0.0,							%%Npc的位置Y
	rotW = 0.0,							%%Npc的旋转坐标W
	name = "",							%%Npc名字如：称号</t>名字
	groupID = 0                         %%Npc的分组ID
}).

-define(NpcNotExit, -100). %%npc不存在
-define(NpcDistanceTooFar, -101). %%npc距离太远
-define(NpcDistSQOk, 1). %%距离ok

-endif.
