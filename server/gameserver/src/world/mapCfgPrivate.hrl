%%%地图相关进程的私有定义
-ifndef(mapCfgPrivate_hrl).
-define(mapCfgPrivate_hrl,1).

-include("../../include/gameMap.hrl").

%游戏地图文件二进制结构
-define(GameMapBinFile,<<
						Tag:4/bytes,							%"PATH"
						Version:?S32,							%地图版本信息(uint)
						HeaderSize:?S32,						%文件头大小
						FileSize:?S32,							%文件大小
						LevelName:64/bytes,					    %地图名（关卡名）
						TotalColCellNum:?S32,					%地图总列数(int)
						TotalRowCellNum:?S32,					%地图总行数(int)
						CellSize:?F32,							%地图Cell大小(float)
						X:?F32,									%X坐标
						Y:?F32,									%Y坐标
						Z:?F32,									%Z坐标
						HeightRangeLimitLow:?F32,				%高度范围，最低值
						HeightRangeLimitHigh:?F32,				%高度范围，最高值
						BlockInfoOffset:?S32,					%阻挡信息在文件中的偏移(uint)
						HeightInfoOffset:?S32,					%高度信息在文件中的偏移(uint)
						BakedDataOffset:?S32,					%%
						UserDataOffset:?S32,					%%
						WeightMergeDataOffset:?S32,             %%
						BlockInfoLen:?S32,						%阻挡信息长度，单位：字节(int)
						HeightInfoLen:?S32,						%高度信息长度，单位：字节(int)
						BakedDataLen:?S32,						%
						UserDataLen:?S32,						%
						MergeWeightDataLength:?S32,

						RemainData/bytes
>>
).

%游戏地图信息文件二进制结构
-define(GameMapInfoBinFile,<<
						Tag:4/bytes,							%"SCEN"
						Version:?U32,							%地图版本信息(uint)
						HeaderSize:?U32,						%文件头大小
						FileSize:?U32,							%文件大小

						TriggerNum:?U32,						%触发器数量
						TriggerOffset:?U32,						%触发器在文件中的偏移
						TriggerDataLen:?U32,                    %单个触发器数据长度

						NpcNum:?U32,							%NPC数量
						NpcOffset:?U32,							%NPC在文件中的偏移
						NpcDataLen:?U32,                        %单个NPC数据长度

						MonsterNum:?U32,						%怪物数量
						MonsterOffset:?U32,						%怪物在文件中的偏移
						MonsterDataLen:?U32,                    %单个怪物数据长度

						RelivePtNum:?U32,						%复活点数量
						RelivePtOffset:?U32,					%复活点在文件中的偏移
						RelivePtDataLen:?U32,                   %单个复活点数据长度

						WayPtNum:?U32,                          %路点数量
						WayPtOffset:?U32,                       %路点在文件中的偏移
						WayPtDataLen:?U32,                      %单个路点数据长度

						CollectNum:?U32,						%采集对象数量
						CollectDataOffset:?U32,					%采集对象在文件中的偏移
						CollectDataLength:?U32,					%单个采集对象数据长度

						UseItemNum:?U32,						%使用物品数量
						UseItemDataOffset:?U32,					%使用物品在文件中的偏移
						UseItemDataLength:?U32,					%单个使用物品数据长度

						_Reserved:60/bytes,						%保留

						RemainData/bytes
>>
).

-define(MapTriggerBaseData,<<
						MapX:?F32,						%地图坐标X
						_MapY:?F32,					%地图坐标Y
						MapZ:?F32,   					%地图坐标

						_RotX:?F32,					%旋转坐标X
						_RotY:?F32,					%旋转坐标Y
						_RotZ:?F32,					%旋转坐标Z
						_RotW:?F32,					%旋转坐标W

						Name:32/bytes,					%该触发数据的名字
						ID:?U32,						%该触发数据的ID
						VolumeType:?S32,				%触发器区域形状，可能是box或者是sphere
						InTriggerName:32/bytes, 		%走入触发区域调用的触发器名称
						InTriggerArgFormat:32/bytes,	%走入触发区域调用触发器的参数格式
						OutTriggerName:32/bytes, 		%走出触发区域调用的触发器名称
						OutTriggerArgFormat:32/bytes,	%走出触发区域调用触发器的参数格式
						InDelayTime:?F32,				%走入触发区域调用触发器的延迟时间
						OutDelayTime:?F32,				%走出触发区域调用触发器的延迟时间
						TotalTriggerCount:?S32,		%总共可触发多少次
						Left/bytes
>>).

-define(MapTriggerVolumeBox,<<
						CenterX:?F32,             %中心坐标X
						_CenterY:?F32,            %中心坐标Y
						CenterZ:?F32,             %中心坐标Z
						SizeX:?F32,               %大小X
						_SizeY:?F32,              %大小Y
						SizeZ:?F32,               %大小Z
						Remain/bytes
>>).

-define(MapTriggerVolumeSphere,<<
						CenterX:?F32,          %中心坐标X
						_CenterY:?F32,         %中心坐标Y
						CenterZ:?F32,          %中心坐标Z
						R:?F32,                %半径
						Remain/bytes
>>).

-define(MapStubData,<<
					MapX:?F32,						%地图坐标X
					_MapY:?F32,						%地图坐标Y
					MapZ:?F32,						%地图坐标Z

					_RotX:?U32,						%旋转坐标X
					_RotY:?U32,						%旋转坐标Y
					_RotZ:?U32,						%旋转坐标Z
					RotW:?F32,						%旋转坐标W
					Name:32/bytes,					%该触发数据的名字
					ID:?U32,							%该触发数据的ID，全局唯一
					Left/bytes
>>).

-define(MapWayPtData,<<
					MapX:?F32,						%地图坐标X
					MapY:?F32,						%地图坐标Y
					MapZ:?F32,						%地图坐标Z

					RotX:?F32,						%旋转坐标X
					RotY:?F32,						%旋转坐标Y
					RotZ:?F32,						%旋转坐标Z
					RotW:?F32,						%旋转坐标W
					Name:32/bytes,					%名字
					ID:?U32,							%该触发数据的ID，全局唯一
					NeighborCount:?U32,				%相邻点的数量
					Remain/bytes
>>).

-endif.
