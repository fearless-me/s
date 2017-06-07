%%成就系统
-author(luowei).

-ifndef(Achieve_hrl).
-define(Achieve_hrl,1).


-define(AcTaskID, 		40005).		%%七夕节任务
-define(AcUseItemID,	776).		%%道具ID
-define(AcUseItemID1,	2831).		%%中秋道具
-define(AcUseItemID2,	783).		%%许愿道具
-define(AcUseItemID4,	790).		%%爱吃冰皮月饼道具
-define(AcUseItemID5,	791).		%%爱吃五仁月饼道具
-define(AcUseItemID6,	792).		%%爱吃鲜花月饼道具
-define(AcUseItemID7,	793).		%%爱吃肉松月饼道具
-define(AcUseItemID8,	794).		%%爱吃豆沙月饼道具
-define(AcUseItemID9,	815).		%%国庆捡宝箱
-define(AcUseItemID10,	32181).		%%国庆橙戒
-define(AcUseItemID11,	[32182,34000,34001,34002,34003]).		%%国庆红戒
-define(AcUseItemID12,	2832).		%%国庆大礼包


%%成就系统时间

%%勇者之路
-define(Achieve_Level,			101).%%等级达人
-define(Achieve_Equip,			102).%%装备达人
-define(Achieve_Mainline,		103).%%主线达人
-define(Achieve_Task,			104).%%任务达人
-define(Achieve_Bag,			105).%%背包达人
-define(Achieve_Store,			106).%%仓库达人
-define(Achieve_Update,			107).%%初次更新
-define(Achieve_SignIn,			108).%%每次签到
-define(Achieve_DevilHell,		109).%%初探魔神地狱
-define(Achieve_LeaderInvasion,	110).%%初探首领入侵
-define(Achieve_Rift,			111).%%初探时空裂痕
-define(Achieve_MintFurnace,	112).%%初探铸币熔炉
-define(Achieve_BootCamp,		113).%%初探新兵营地
-define(Achieve_StarTreasureHouse,114).%%初探星空宝库
-define(Achieve_BootyBay,		115).%%初探藏宝海湾
-define(Achieve_SoulPartner,	116).%%初探灵魂伙伴
-define(Achieve_ChaosBattlefield,117).%%初探混沌战场
-define(Achieve_BlueSkyCity,	118).%%初探守卫碧空城
-define(Achieve_Daobao,			119).%%初探盗宝贼踪迹
-define(Achieve_DarkPlace1,		120).%%初探黑暗之地一
-define(Achieve_DarkPlace2,		121).%%初探黑暗之地二
-define(Achieve_DarkPlace3,		122).%%初探黑暗之地三
-define(Achieve_DarkPlace4,		123).%%初探黑暗之地四
-define(Achieve_DarkPlace5,		124).%%初探黑暗之地五


%%无尽财富
-define(Achieve_GoldTrade,		201).%%金币交易
-define(Achieve_DiamondTrade,	202).%%钻石交易
-define(Achieve_MoneyWayward1,	203).%%有钱任性一
-define(Achieve_MoneyWayward2,	204).%%有钱任性二
-define(Achieve_Integral,		205).%%积分达人
-define(Achieve_CollecteMounts,	206).%%坐骑收集
-define(Achieve_Exchange,		207).%%兑换达人
-define(Achieve_BreakDown,		208).%%分解达人
-define(Achieve_Fashion,		209).%%时装达人
-define(Achieve_PetUpstar,		210).%%宠物升星



%%登峰造极
-define(Achieve_StrongestKing,	301).%%最强王者
-define(Achieve_StrMan,			302).%%强化狂人
-define(Achieve_GemEmbed,		303).%%宝石镶嵌
-define(Achieve_WarriorAwaken,	304).%%勇士觉醒
-define(Achieve_ConciseMaster,	305).%%凝练大师
-define(Achieve_AttachedSpec,	306).%%宝石合成
-define(Achieve_AnnihilatorLeader,307).%%首领歼灭者
-define(Achieve_TestKillMonster,308).%%测试杀怪
-define(Achieve_MonsterSlayer,	309).%%怪物屠戮者
-define(Achieve_CopyLiquidator,	310).%%副本清理者
-define(Achieve_Achieve1,		311).%%成就达人1
-define(Achieve_Achieve2,		312).%%成就达人2
-define(Achieve_RiftRestorers,	313).%%裂痕修复者
-define(Achieve_HonorEquipment,	314).%%海神之枪
-define(Achieve_StrongestKing1,	315).%%最强王者
-define(Achieve_StrMan1,		316).%%精炼装备
-define(Achieve_DarkPrime,		317).%%黑暗至尊


%%徽章
-define(Achieve_Badge1,			401).%%街道徽章
-define(Achieve_Badge2,			402).%%雷神徽章
-define(Achieve_Badge3,			403).%%霜峰岭徽章
-define(Achieve_Badge4,			404).%%护序者徽章
-define(Achieve_Badge5,			405).%%碧空城徽章
-define(Achieve_Badge6,			406).%%永生徽章
-define(Achieve_Badge7,			407).%%亚厦徽章
-define(Achieve_Badge8,			408).%%世界徽章
-define(Achieve_Badge9,			409).%%城堡徽章
-define(Achieve_Badge10,		410).%%梅尔徽章
-define(Achieve_Badge11,		411).%%暖风徽章
-define(Achieve_Badge12,		412).%%上古徽章
-define(Achieve_Badge13,		413).%%草原徽章
-define(Achieve_Badge14,		414).%%可汗徽章
-define(Achieve_Badge15,		415).%%雄狮徽章
-define(Achieve_Badge16,		416).%%走私者徽章
-define(Achieve_Badge17,		417).%%广场区徽章
-define(Achieve_Badge18,		418).%%废城区徽章
-define(Achieve_Badge19,		419).%%平原徽章
-define(Achieve_Badge20,		420).%%预留徽章
-define(Achieve_Badge21,		421).%%预留徽章
-define(Achieve_Badge22,		422).%%预留徽章
-define(Achieve_Badge23,		423).%%预留徽章
-define(Achieve_Badge24,		424).%%预留徽章
-define(Achieve_Badge25,		425).%%预留徽章
-define(Achieve_Badge26,		426).%%预留徽章
-define(Achieve_Badge27,		427).%%预留徽章
-define(Achieve_Badge28,		428).%%预留徽章
-define(Achieve_Badge29,		429).%%预留徽章
-define(Achieve_Badge30,		430).%%近卫徽章
-define(Achieve_Badge31,		431).%%寒冬徽章
-define(Achieve_Badge32,		432).%%罗兰德徽章
-define(Achieve_Badge33,		433).%%花园徽章
-define(Achieve_Badge34,		434).%%黑暗徽章

-define(Achieve_Badge35,		435).%%诸神徽章
-define(Achieve_Badge36,		436).%%灰影徽章
-define(Achieve_Badge37,		437).%%暖风徽章
-define(Achieve_Badge38,		438).%%剑风徽章
-define(Achieve_Badge39,		439).%%古代徽章

-define(Achieve_Badge40,		440).%%黑塔徽章
-define(Achieve_Badge41,		441).%%死寂徽章
-define(Achieve_Badge42,		442).%%神殿徽章
-define(Achieve_Badge43,		443).%%圣堂徽章
-define(Achieve_Badge44,		444).%%议会庭徽章

-define(Achieve_Badge45,		445).%%王冠徽章
-define(Achieve_Badge46,		446).%%教堂徽章
-define(Achieve_Badge47,		447).%%毁灭徽章
-define(Achieve_Badge48,		448).%%上古徽章
-define(Achieve_Badge49,		449).%%时间徽章

-define(Achieve_Badge50,		450).%%深渊徽章
-define(Achieve_Badge51,		451).%%初探徽章
-define(Achieve_Badge52,		452).%%封印徽章
-define(Achieve_Badge53,		453).%%遗忘徽章
-define(Achieve_Badge54,		454).%%曙光徽章
-define(Achieve_Badge55,		455).%%光明徽章
-define(Achieve_Badge56,		456).%%永夜徽章
-define(Achieve_Badge57,		457).%%幽暗徽章


-define(Achieve_Social_Event1,	501).%%我行我秀
-define(Achieve_Social_Event2,	502).%%聊天很生动
-define(Achieve_Social_Event3,	503).%%我是复制党
-define(Achieve_Social_Event4,	504).%%喇叭喊话
-define(Achieve_Social_Event5,	505).%%拥有军团
-define(Achieve_Social_Event6,	506).%%拥有灵魂伙伴
-define(Achieve_Social_Event7,	507).%%好友印象
-define(Achieve_Social_Event8,	508).%%好友成群
-define(Achieve_Social_Event9,	509).%%送人玫瑰
-define(Achieve_Social_Event10,	510).%%点个赞
-define(Achieve_Social_Event11,	511).%%求个赞

%%节日活动
-define(Achieve_Act_Event1,		601).%%七夕节日任务
-define(Achieve_Act_Event2,		602).%%倾城之恋
-define(Achieve_Act_Event3,		603).%%有人爱我
-define(Achieve_Act_Event4,		604).%%击败魔物
-define(Achieve_Act_Event5,		605).%%击败魔王

-define(Achieve_Act_Event6,		606).%%中秋节
-define(Achieve_Act_Event7,		607).%%我要许愿
-define(Achieve_Act_Event8,		608).%%谁为我许愿
-define(Achieve_Act_Event9,		609).%%爱吃冰皮月饼
-define(Achieve_Act_Event10,	610).%%爱吃五仁月饼
-define(Achieve_Act_Event11,	611).%%爱吃鲜花月饼
-define(Achieve_Act_Event12,	612).%%爱吃肉松月饼
-define(Achieve_Act_Event13,	613).%%爱吃豆沙月饼

-define(Achieve_Act_Event14,	614).%%国庆节
-define(Achieve_Act_Event15,	615).%%国庆节捡宝箱
-define(Achieve_Act_Event16,	616).%%国庆橙戒
-define(Achieve_Act_Event17,	617).%%国庆红戒
-define(Achieve_Act_Event18,	618).%%国庆大礼包



-define(Achieve_activate_goddess_1,	700).%%激活女神1
-define(Achieve_activate_goddess_2,	701).%%激活女神2
-define(Achieve_activate_goddess_3,	702).%%激活女神3
-define(Achieve_activate_goddess_4,	703).%%激活女神4
-define(Achieve_goddess_level,	704).%%所有女神等级提升到XX

-define(Achieve_activate_Artifact_1,	705).%%激活火器灵
-define(Achieve_activate_Artifact_2,	706).%%激活冰器灵
-define(Achieve_activate_Artifact_3,	707).%%激活雷器灵
-define(Achieve_activate_Artifact_4,	708).%%激活风器灵
-define(Achieve_activate_Artifact_5,	709).%%激活光器灵
-define(Achieve_activate_Artifact_6,	710).%%激活暗器灵
-define(Achieve_Artifact_level,	711).%%所有灵器等级提升到XX

-define(Achieve_Wings_up ,	712).%%翅膀升阶XX
-define(Achieve_pet_rebon ,	713).%%骑宠转生
-define(Achieve_pet_weapon ,	714).%%骑宠装备
-define(Achieve_weapon_quality_2 ,	715).%%装备品质2级
-define(Achieve_brave_tried ,	716).%%勇者试炼
-define(Achieve_Gold_Copy ,	717).%%金币副本
-define(Achieve_material_Copy ,	718).%%材料副本
-define(Achieve_First_arena ,	719).%%初入竞技场
-define(Achieve_arena_win ,	720).%%竞技场胜利
-define(Achieve_armygroup_build ,	721).%%军团建立
-define(Achieve_Sending_redenvelope ,	722).%%发送红包
-define(Achieve_First_dead ,	723).%%初次死亡

-define(Achieve_weapon_quality_3,	724).%%装备品质3
-define(Achieve_weapon_quality_4 ,	725).%%装备品质4



-record(recAchieve,{
	aID = 0, 				%%成就ID
	aScheduleNum = 0,		%%成就进度
	aScheduleLevel = 0,		%%成就进度等级
	aScheduleGetLevel = 0	%%成都进度领取等级
}).

-record(recBadge,{
	mapID = 0,				%%MapID
	isComplete = false,		%%收集物品是否完成
	itemList = []			%%收集物品列表
}).

-endif.
