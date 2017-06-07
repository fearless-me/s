%%%myArray模块与kvArray模块的私有定义
-ifndef(myArray_hrl).
-define(myArray_hrl,1).

-record(myArray,{
				 arrayBase :: array(), 			% 基本数组，存放实际的数据
				 emptyIndex	= [] :: list(),		% 空索引，存放基本数组中为空的索引
				 usedIndex = [] :: list()		% 已经使用的索引
				 }).

-record(kvArray,{
				 myAr = #myArray{},
				 tid							%Ets表的ID
				 }).

-endif.
