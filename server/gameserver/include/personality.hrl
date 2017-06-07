%%%玩家个性信息定义
-author(chengxs).
-ifndef(Personality_hrl).
-define(Personality_hrl,1).
%%玩家照片信息
-record(playerPhotoInfo,{
	sectionNum = 0,				%%照片数据总段数
	sectionIndex = 0,			%%照片数据的编号
	sectionData = []			%%照片数据段
}).
-define(TypeMin, 1).
-define(TypeBirthday, 1).
-define(TypeLocation, 2).
-define(TypeStarSign, 3).
-define(TypeSign, 4).
-define(TypeMax, 4).
-endif.