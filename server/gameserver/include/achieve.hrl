%%成就系统
%% 20170620最后整理
%% 详见http://192.168.2.32:8080/browse/LUNA-2702
-author(luowei).

-ifndef(Achieve_hrl).
-define(Achieve_hrl,1).

-define(AcTaskID, 		40005).		%%七夕节任务===============[该任务ID无效]=============
-define(AcUseItemID,	776).		%%道具ID===============[该道具ID无效]=============
-define(AcUseItemID1,	2831).		%%中秋道具===============[该道具ID无效]=============
-define(AcUseItemID2,	783).		%%许愿道具===============[该道具ID无效]=============
-define(AcUseItemID4,	790).		%%爱吃冰皮月饼道具===============[该道具ID无效]=============
-define(AcUseItemID5,	791).		%%爱吃五仁月饼道具===============[该道具ID无效]=============
-define(AcUseItemID6,	792).		%%爱吃鲜花月饼道具===============[该道具ID无效]=============
-define(AcUseItemID7,	793).		%%爱吃肉松月饼道具===============[该道具ID无效]=============
-define(AcUseItemID8,	794).		%%爱吃豆沙月饼道具===============[该道具ID无效]=============
-define(AcUseItemID9,	815).		%%国庆捡宝箱===============[该采集物ID无效]=============
-define(AcUseItemID10,	32181).		%%国庆橙戒===============[该道具ID无效]=============
-define(AcUseItemID11,	[32182,34000,34001,34002,34003]).		%%国庆红戒===============[这些道具ID都无效]=============
-define(AcUseItemID12,	2832).		%%国庆大礼包===============[该道具ID无效]=============


%%成就系统时间

%%勇者之路
-define(Achieve_Level,			101).%%等级达人		====等级达到10/20/30/40/50级====初始化为1，角色升级时刷新成就进度====可用
-define(Achieve_Equip,			102).%%装备达人		====N/A====N/A====不可用
-define(Achieve_Mainline,		103).%%主线达人		====N/A====N/A====不可用
-define(Achieve_Task,			104).%%任务达人		====完成任务总数量50/100/200/300/400====提交任务时（包括环任务一次提交多个任务时）刷新成就进度====可用
-define(Achieve_Bag,			105).%%背包达人		====累计开背包格5/10/20/30/40/50/60个====开启背包格时刷新成就进度====可用
-define(Achieve_Store,			106).%%仓库达人		====累计开仓库格5/10/20/30/40/50/60个====开启仓库格时刷新成就进度====可用
-define(Achieve_Update,			107).%%初次更新		====首次更新游戏资源（配置已关闭）====N/A====不可用
-define(Achieve_SignIn,			108).%%每次签到		====累积签到1/5/10/15/20/30次数====每日签到模块免费或钻石签到时刷新成就进度，注意不是七日签到模块（固定1）====可用
-define(Achieve_DevilHell,		109).%%初探魔神地狱	====参加守护女神====进入守护女神对应地图时刷新成就进度（mapsetting:type=1,subtype=1）（固定1）====可用
-define(Achieve_LeaderInvasion,	110).%%初探首领入侵	====初探首领入侵====N/A====不可用
-define(Achieve_Rift,			111).%%初探时空裂痕	====N/A====进入时空裂痕对应地图时刷新成就进度（mapsetting:type=2,subtype=2）（固定1）====不可用
-define(Achieve_MintFurnace,	112).%%初探铸币熔炉	====N/A====N/A====不可用
-define(Achieve_BootCamp,		113).%%初探新兵营地	====N/A====N/A====不可用
-define(Achieve_StarTreasureHouse,114).%%初探星空宝库	====N/A====N/A====不可用
-define(Achieve_BootyBay,		115).%%初探藏宝海湾	====N/A====N/A====不可用
-define(Achieve_SoulPartner,	116).%%初探灵魂伙伴	====N/A====N/A====不可用
-define(Achieve_ChaosBattlefield,117).%%初探混沌战场	====N/A====N/A====不可用
-define(Achieve_BlueSkyCity,	118).%%初探守卫碧空城	====N/A====在碧空城完成一次采集时刷新成就进度（固定1）====不可用
-define(Achieve_Daobao,			119).%%初探盗宝贼踪迹	====N/A====使用藏宝图挖宝成功时刷新成就进度（固定1）====不可用
-define(Achieve_DarkPlace1,		120).%%初探黑暗之地一	====初探深红熔渊一层（可使用杀怪逻辑指定的地图ID，但未指定）====进入深红熔渊时尝试刷新对应地图ID的成就进度（固定1）====不可用
-define(Achieve_DarkPlace2,		121).%%初探黑暗之地二	====初探深红熔渊二层（可使用杀怪逻辑指定的地图ID，但未指定）====进入深红熔渊时尝试刷新对应地图ID的成就进度（固定1）====不可用
-define(Achieve_DarkPlace3,		122).%%初探黑暗之地三	====初探深红熔渊三层（可使用杀怪逻辑指定的地图ID，但未指定）====进入深红熔渊时尝试刷新对应地图ID的成就进度（固定1）====不可用
-define(Achieve_DarkPlace4,		123).%%初探黑暗之地四	====初探深红熔渊四层（可使用杀怪逻辑指定的地图ID，但未指定）====进入深红熔渊时尝试刷新对应地图ID的成就进度（固定1）====不可用
-define(Achieve_DarkPlace5,		124).%%初探黑暗之地五	====初探深红熔渊五层（可使用杀怪逻辑指定的地图ID，但未指定）====进入深红熔渊时尝试刷新对应地图ID的成就进度（固定1）====不可用


%%无尽财富
-define(Achieve_GoldTrade,		201).%%金币交易		====N/A====在交易行使用金币购买物品时刷新成就进度（固定1）====不可用
-define(Achieve_DiamondTrade,	202).%%钻石交易		====N/A====在交易行使用钻石购买物品时刷新成就进度（固定1）====不可用
-define(Achieve_MoneyWayward1,	203).%%有钱任性一		====金币累积100W/500W/5000W/10000W====获得金币时刷新成就进度（新增货币数目）====可用
-define(Achieve_MoneyWayward2,	204).%%有钱任性二		====绑定金币累积100W/500W/5000W/10000W（配置已关闭）====N/A====不可用
-define(Achieve_Integral,		205).%%积分达人		====N/A====获得积分时刷新成就进度（新增货币数目）====不可用
-define(Achieve_CollecteMounts,	206).%%坐骑收集		====收集骑宠1/5/10/15/20只====获得骑宠时刷新成就进度（由于骑宠是一个个创建的，所以这里是固定1而不是新增骑宠数目）====可用
-define(Achieve_Exchange,		207).%%兑换达人		====累积资源兑换5/100/200/500/1K件====进行资源兑换时刷新成就进度（兑换的资源数目，参考cfg_sourceshop）====可用
-define(Achieve_BreakDown,		208).%%分解达人		====分解装备20/200/500/1K/2K件====分解装备时刷新成就进度（分解的装备数目）====可用
-define(Achieve_Fashion,		209).%%时装达人		====收集时装3/6/9个====激活或过期后重新激活时装时刷新成就进度（固定1）====可用
-define(Achieve_PetUpstar,		210).%%宠物升星		====骑宠升级为2/3/4/5星====骑宠升星时刷新成就进度（固定1）====可用



%%登峰造极
-define(Achieve_StrongestKing,	301).%%最强王者		====全身装备整体精练2/4/6/8/10====精炼刷新套装效果时刷新成就进度（固定1）====可用
-define(Achieve_StrMan,			302).%%强化狂人		====精练装备30/40/50/60/70/80次====精炼时刷新成就进度（精炼部位数量）====可用
-define(Achieve_GemEmbed,		303).%%宝石镶嵌		====镶嵌纹章2/3/4/5/6/7/8/9/10级====镶嵌纹章时刷新对应级别纹章的成就进度（固定1）====可用
-define(Achieve_WarriorAwaken,	304).%%勇士觉醒		====N/A====N/A====不可用
-define(Achieve_ConciseMaster,	305).%%凝练大师		====装备重铸10/50/80/100次（配置已关闭）====重铸装备时刷新成就进度（固定1）====不可用
-define(Achieve_AttachedSpec,	306).%%宝石合成		====纹章合成1/10/50/100次====合成纹章时刷新成就进度（固定1）====可用
-define(Achieve_AnnihilatorLeader,307).%%首领歼灭者	====累积消灭世界首领1/10/20/30/50/100只====消灭配置指定怪物时刷新成就进度（固定1）====可用
-define(Achieve_TestKillMonster,308).%%测试杀怪		====N/A====消灭配置指定怪物时刷新成就进度（固定1）====不可用
-define(Achieve_MonsterSlayer,	309).%%怪物屠戮者		====累积消灭怪1K/1W/10W/30W/50W/100W/500W只====消灭怪物时刷新成就进度（任务归属导致的杀怪可能有多人同时消灭1只怪）（固定1）====可用
-define(Achieve_CopyLiquidator,	310).%%副本清理者		====副本通关3/50/100/300/500/1K/2K次====副本通关时刷新成就进度（包括走副本流程的活动，材料副本、金币副本、原初灵界）（固定1）====可用
-define(Achieve_Achieve1,		311).%%成就达人1		====累积获得总成就点100/200/300====添加成就点（往往是完成成就时）刷新成就进度（配置奖励的成就点）====可用
-define(Achieve_Achieve2,		312).%%成就达人2		====N/A====N/A====不可用
-define(Achieve_RiftRestorers,	313).%%裂痕修复者		====N/A====完成时空裂痕时刷新成就进度（固定1）====不可用
-define(Achieve_HonorEquipment,	314).%%海神之枪		====N/A====N/A====不可用
-define(Achieve_StrongestKing1,	315).%%最强王者		====N/A====N/A====不可用
-define(Achieve_StrMan1,		316).%%精炼装备		====N/A====N/A====不可用
-define(Achieve_DarkPrime,		317).%%黑暗至尊		====累积消灭深红熔渊boss1/5/10/20/30/50/100次====消灭配置指定怪物时刷新成就进度（固定1）====可用


%%徽章
-define(Achieve_Badge1,			401).%%街道徽章		====废弃
-define(Achieve_Badge2,			402).%%雷神徽章		====废弃
-define(Achieve_Badge3,			403).%%霜峰岭徽章		====废弃
-define(Achieve_Badge4,			404).%%护序者徽章		====废弃
-define(Achieve_Badge5,			405).%%碧空城徽章		====废弃
-define(Achieve_Badge6,			406).%%永生徽章		====废弃
-define(Achieve_Badge7,			407).%%亚厦徽章		====废弃
-define(Achieve_Badge8,			408).%%世界徽章		====废弃
-define(Achieve_Badge9,			409).%%城堡徽章		====废弃
-define(Achieve_Badge10,		410).%%梅尔徽章		====废弃
-define(Achieve_Badge11,		411).%%暖风徽章		====废弃
-define(Achieve_Badge12,		412).%%上古徽章		====废弃
-define(Achieve_Badge13,		413).%%草原徽章		====废弃
-define(Achieve_Badge14,		414).%%可汗徽章		====废弃
-define(Achieve_Badge15,		415).%%雄狮徽章		====废弃
-define(Achieve_Badge16,		416).%%走私者徽章		====废弃
-define(Achieve_Badge17,		417).%%广场区徽章		====废弃
-define(Achieve_Badge18,		418).%%废城区徽章		====废弃
-define(Achieve_Badge19,		419).%%平原徽章		====废弃
-define(Achieve_Badge20,		420).%%预留徽章		====废弃
-define(Achieve_Badge21,		421).%%预留徽章		====废弃
-define(Achieve_Badge22,		422).%%预留徽章		====废弃
-define(Achieve_Badge23,		423).%%预留徽章		====废弃
-define(Achieve_Badge24,		424).%%预留徽章		====废弃
-define(Achieve_Badge25,		425).%%预留徽章		====废弃
-define(Achieve_Badge26,		426).%%预留徽章		====废弃
-define(Achieve_Badge27,		427).%%预留徽章		====废弃
-define(Achieve_Badge28,		428).%%预留徽章		====废弃
-define(Achieve_Badge29,		429).%%预留徽章		====废弃
-define(Achieve_Badge30,		430).%%近卫徽章		====废弃
-define(Achieve_Badge31,		431).%%寒冬徽章		====废弃
-define(Achieve_Badge32,		432).%%罗兰德徽章		====废弃
-define(Achieve_Badge33,		433).%%花园徽章		====废弃
-define(Achieve_Badge34,		434).%%黑暗徽章		====废弃

-define(Achieve_Badge35,		435).%%诸神徽章		====废弃
-define(Achieve_Badge36,		436).%%灰影徽章		====废弃
-define(Achieve_Badge37,		437).%%暖风徽章		====废弃
-define(Achieve_Badge38,		438).%%剑风徽章		====废弃
-define(Achieve_Badge39,		439).%%古代徽章		====废弃

-define(Achieve_Badge40,		440).%%黑塔徽章		====废弃
-define(Achieve_Badge41,		441).%%死寂徽章		====废弃
-define(Achieve_Badge42,		442).%%神殿徽章		====废弃
-define(Achieve_Badge43,		443).%%圣堂徽章		====废弃
-define(Achieve_Badge44,		444).%%议会庭徽章		====废弃

-define(Achieve_Badge45,		445).%%王冠徽章		====废弃
-define(Achieve_Badge46,		446).%%教堂徽章		====废弃
-define(Achieve_Badge47,		447).%%毁灭徽章		====废弃
-define(Achieve_Badge48,		448).%%上古徽章		====废弃
-define(Achieve_Badge49,		449).%%时间徽章		====废弃

-define(Achieve_Badge50,		450).%%深渊徽章		====废弃
-define(Achieve_Badge51,		451).%%初探徽章		====废弃
-define(Achieve_Badge52,		452).%%封印徽章		====废弃
-define(Achieve_Badge53,		453).%%遗忘徽章		====废弃
-define(Achieve_Badge54,		454).%%曙光徽章		====废弃
-define(Achieve_Badge55,		455).%%光明徽章		====废弃
-define(Achieve_Badge56,		456).%%永夜徽章		====废弃
-define(Achieve_Badge57,		457).%%幽暗徽章		====废弃


-define(Achieve_Social_Event1,	501).%%我行我秀		====上传一张照片====上传照片成功时刷新成就进度（固定1）====可用
-define(Achieve_Social_Event2,	502).%%聊天很生动		====使用一次聊天气泡或动作====使用聊天气泡或动作时刷新成就进度（固定1）====可用
-define(Achieve_Social_Event3,	503).%%我是复制党		====N/A====使用赋值世界消息功能时刷新成就进度（固定1）====不可用
-define(Achieve_Social_Event4,	504).%%喇叭喊话		====使用一次喇叭频道（已关闭）====使用道具小喇叭时刷新成就进度（固定1）====不可用
-define(Achieve_Social_Event5,	505).%%拥有军团		====加入任何军团====创建、加入家族时刷新成就进度（固定1）====可用
-define(Achieve_Social_Event6,	506).%%拥有灵魂伙伴	====N/A====N/A====不可用
-define(Achieve_Social_Event7,	507).%%好友印象		====N/A====N/A====不可用
-define(Achieve_Social_Event8,	508).%%好友成群		====拥有5/10/20位好友====添加好友时刷新成就进度（现有好友与原有好友的有效差值）====可用
-define(Achieve_Social_Event9,	509).%%送人玫瑰		====N/A====N/A====不可用
-define(Achieve_Social_Event10,	510).%%点个赞			====N/A====N/A====不可用
-define(Achieve_Social_Event11,	511).%%求个赞			====N/A====N/A====不可用

%%节日活动
-define(Achieve_Act_Event1,		601).%%七夕节日任务	====N/A====N/A====不可用
-define(Achieve_Act_Event2,		602).%%倾城之恋		====N/A====使用道具776时刷新成就进度（固定1）====不可用
-define(Achieve_Act_Event3,		603).%%有人爱我		====N/A====被使用道具776时刷新成就进度（固定1）====不可用
-define(Achieve_Act_Event4,		604).%%击败魔物		====N/A====消灭配置指定怪物时刷新成就进度（固定1）====不可用
-define(Achieve_Act_Event5,		605).%%击败魔王		====N/A====消灭配置指定怪物时刷新成就进度（固定1）====不可用

-define(Achieve_Act_Event6,		606).%%中秋节			====N/A====使用道具2831时刷新成就进度（道具数目）====不可用
-define(Achieve_Act_Event7,		607).%%我要许愿		====N/A====使用道具783时刷新成就进度（道具数目）====不可用
-define(Achieve_Act_Event8,		608).%%谁为我许愿		====N/A====被使用道具783时刷新成就进度（固定1）====不可用
-define(Achieve_Act_Event9,		609).%%爱吃冰皮月饼	====N/A====使用道具790时刷新成就进度（道具数目）====不可用
-define(Achieve_Act_Event10,	610).%%爱吃五仁月饼	====N/A====使用道具791时刷新成就进度（道具数目）====不可用
-define(Achieve_Act_Event11,	611).%%爱吃鲜花月饼	====N/A====使用道具792时刷新成就进度（道具数目）====不可用
-define(Achieve_Act_Event12,	612).%%爱吃肉松月饼	====N/A====使用道具793时刷新成就进度（道具数目）====不可用
-define(Achieve_Act_Event13,	613).%%爱吃豆沙月饼	====N/A====使用道具794时刷新成就进度（道具数目）====不可用

-define(Achieve_Act_Event14,	614).%%国庆节			====N/A====消灭配置指定怪物时刷新成就进度（固定1）====不可用
-define(Achieve_Act_Event15,	615).%%国庆节捡宝箱	====N/A====获得采集物815时刷新成就进度（固定1）====不可用
-define(Achieve_Act_Event16,	616).%%国庆橙戒		====N/A====获得道具32181时刷新成就进度（道具数目）====不可用
-define(Achieve_Act_Event17,	617).%%国庆红戒		====N/A====获得道具32182,34000,34001,34002,34003时刷新成就进度（道具数目）====不可用
-define(Achieve_Act_Event18,	618).%%国庆大礼包		====N/A====使用道具2832时刷新成就进度（道具数目）====不可用



-define(Achieve_activate_goddess_1,	700).%%激活女神1	====激活第1/2/3/4位女神====激活女神时刷新成就进度（固定1）====可用
-define(Achieve_activate_goddess_2,	701).%%激活女神2	====N/A====N/A====不可用
-define(Achieve_activate_goddess_3,	702).%%激活女神3	====N/A====N/A====不可用
-define(Achieve_activate_goddess_4,	703).%%激活女神4	====N/A====N/A====不可用
-define(Achieve_goddess_level,		704).%%所有女神等级提升到XX	====提升4/20/40/80/100次女神等级====升级女神时刷新成就进度（固定1）====可用

-define(Achieve_activate_Artifact_1,	705).%%激活火器灵	====激活第1位器灵====逻辑错误====不可用
-define(Achieve_activate_Artifact_2,	706).%%激活冰器灵	====激活第2位器灵====N/A====不可用
-define(Achieve_activate_Artifact_3,	707).%%激活雷器灵	====激活第2位器灵====N/A====不可用
-define(Achieve_activate_Artifact_4,	708).%%激活风器灵	====激活第2位器灵====N/A====不可用
-define(Achieve_activate_Artifact_5,	709).%%激活光器灵	====激活第2位器灵====N/A====不可用
-define(Achieve_activate_Artifact_6,	710).%%激活暗器灵	====激活第2位器灵====N/A====不可用
-define(Achieve_Artifact_level,			711).%%所有灵器等级提升到XX	====提升12/30/60/120/240次器灵等级====升级器灵时刷新成就进度（固定1）====可用

-define(Achieve_Wings_up ,				712).%%翅膀升阶XX	====翅膀升到2/3/4/5阶====翅膀升阶时刷新从成就进度（固定1）====可用
-define(Achieve_pet_rebon ,				713).%%骑宠转生	====转生骑宠1/2/4/6/8次====骑宠转生时刷新成就进度（固定1）====可用
-define(Achieve_pet_weapon ,			714).%%骑宠装备	====提升8/20/40/80/120次骑宠装备====强化骑宠装备时刷新成就进度（提升级别）====可用
-define(Achieve_weapon_quality_2 ,		715).%%装备品质2级====装备一件蓝色品质的装备====装备品质2的装备时刷新成就进度（固定1）====可用
-define(Achieve_brave_tried ,			716).%%勇者试炼	====通关女神禁闭室第1/3/5/10/15/20/25/30层====勇者试炼第N层通关时刷新对应成就进度（固定1）====可用
-define(Achieve_Gold_Copy ,				717).%%金币副本	====完成惊天喵盗团1/5/10/20/50/100次====通关金币副本时刷新成就进度（固定1）====可用
-define(Achieve_material_Copy ,			718).%%材料副本	====完成元素保卫战1/5/10/20/50/100次====通关材料副本时刷新成就进度（固定1）====可用
-define(Achieve_First_arena ,			719).%%初入竞技场	====获得一次竞技场胜利====进入竞技场时刷新成就进度（固定1）====可用
-define(Achieve_arena_win ,				720).%%竞技场胜利	====竞技场胜利10/50/100/1000/10000次====竞技场获胜时刷新成就进度（固定1）====可用
-define(Achieve_armygroup_build ,		721).%%军团建立	====建立一个军团====创建家族时刷新成就进度（固定1）====可用
-define(Achieve_Sending_redenvelope ,	722).%%发送红包	====发出1/5/10/100/5000个红包====发送红包时刷新成就进度（固定1）====可用
-define(Achieve_First_dead ,			723).%%初次死亡	====死亡1次====死亡时刷新成就进度（固定1）====可用

-define(Achieve_weapon_quality_3,		724).%%装备品质3	====装备一件红色品质的装备====装备品质3的装备时刷新成就进度（固定1）====可用
-define(Achieve_weapon_quality_4 ,		725).%%装备品质4	====装备一件紫色品质的装备====装备品质4的装备时刷新成就进度（固定1）====可用



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
