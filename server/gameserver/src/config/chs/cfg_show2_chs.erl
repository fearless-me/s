%% coding: latin-1
%%: 实现
-module(cfg_show2_chs).
-compile(export_all).
-include("cfg_show2.hrl").
-include("logger.hrl").

getRow(1)->
    #show2Cfg {
    id = 1,
    groupid = 1,
    taskname = "初到港口",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "⊙︿⊙……好痛！这里是什么地方？"
    };
getRow(2)->
    #show2Cfg {
    id = 2,
    groupid = 1,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "太好啦，光明勇士你终于醒了！"
    };
getRow(3)->
    #show2Cfg {
    id = 3,
    groupid = 1,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "光明勇士？！你又是谁，这里是哪儿？"
    };
getRow(4)->
    #show2Cfg {
    id = 4,
    groupid = 1,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "哎呀！你一口气向茜茜提出这么多问题，茜茜该怎么回答呢？"
    };
getRow(5)->
    #show2Cfg {
    id = 5,
    groupid = 1,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "当然是说实话，我最讨厌说谎的人！"
    };
getRow(6)->
    #show2Cfg {
    id = 6,
    groupid = 1,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "别这么凶嘛！茜茜是[fff000]露娜女神[-]的萌物，这里是[fff000]阿克勒港口[-]。之前你受了很重的伤，是好心的[fff000]约克大叔[-]把你带回了这里。"
    };
getRow(7)->
    #show2Cfg {
    id = 7,
    groupid = 1,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "原来如此……那么约克大叔他现在在哪？我想当面向他说声谢谢。"
    };
getRow(8)->
    #show2Cfg {
    id = 8,
    groupid = 1,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "嘻，他就在前面，茜茜带你去。（＞ｙ＜）"
    };
getRow(9)->
    #show2Cfg {
    id = 9,
    groupid = 2,
    taskname = "约克大叔",
    npcid = 3000,
    emotion = 1,
    name = "约克大叔",
    side = 1,
    content = "[fff000]{PlayerName}[-]，你感觉好些了么？"
    };
getRow(10)->
    #show2Cfg {
    id = 10,
    groupid = 2,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "我很好，约克先生，谢谢您救了我。我想知道当初自己昏迷的时候都发生了什么……"
    };
getRow(11)->
    #show2Cfg {
    id = 11,
    groupid = 2,
    npcid = 3000,
    emotion = 1,
    name = "约克大叔",
    side = 1,
    content = "那天我与大家在角落里发现了昏迷的你，看到你的徽章才确定你是联盟军成员，就把你带回了港口。"
    };
getRow(12)->
    #show2Cfg {
    id = 12,
    groupid = 2,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "那么约克大叔，你们可还有发现其他联盟军成员么？"
    };
getRow(13)->
    #show2Cfg {
    id = 13,
    groupid = 2,
    npcid = 3000,
    emotion = 1,
    name = "约克大叔",
    side = 1,
    content = "那场战斗太残酷了！除了你以外，联盟军成员无一生还……"
    };
getRow(14)->
    #show2Cfg {
    id = 14,
    groupid = 2,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "([2becf8]果然那场梦是真的……父亲，伙伴们！[-])（πーπ）"
    };
getRow(15)->
    #show2Cfg {
    id = 15,
    groupid = 2,
    npcid = 3000,
    emotion = 1,
    name = "约克大叔",
    side = 1,
    content = "请不要沉溺于悲伤，魔族虽然可怕但是我们绝不会屈服的！这是你的武器，现在我该把它还给你了！"
    };
getRow(16)->
    #show2Cfg {
    id = 16,
    groupid = 2,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "谢谢您……我一定会消灭魔族为他们报仇的！ಠ_ಠ！！！"
    };
getRow(17)->
    #show2Cfg {
    id = 17,
    groupid = 2,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "呀！糟糕，有魔族在偷听我们说话(゜ロ゜)！"
    };
getRow(18)->
    #show2Cfg {
    id = 18,
    groupid = 2,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1,
    content = "来得正好，接招吧！"
    };
getRow(19)->
    #show2Cfg {
    id = 19,
    groupid = 3,
    taskname = "小试身手",
    npcid = 1111,
    emotion = 1,
    name = "史莱姆大王",
    side = 1,
    content = "呀！被发现了，快逃(゜Д゜;)！"
    };
getRow(20)->
    #show2Cfg {
    id = 20,
    groupid = 3,
    npcid = 1112,
    emotion = 1,
    name = "香菇战士",
    side = 1,
    content = "喵呜，等等我(◯Δ◯∥)！"
    };
getRow(21)->
    #show2Cfg {
    id = 21,
    groupid = 3,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "哼，别想逃！"
    };
getRow(22)->
    #show2Cfg {
    id = 22,
    groupid = 4,
    npcid = 1111,
    emotion = 1,
    name = "史莱姆大王",
    side = 1,
    content = "好痛啊╥﹏╥！"
    };
getRow(23)->
    #show2Cfg {
    id = 23,
    groupid = 4,
    npcid = 1112,
    emotion = 1,
    name = "香菇战士",
    side = 1,
    content = "喵，救命啊༼ಢ_ಢ༽！"
    };
getRow(24)->
    #show2Cfg {
    id = 24,
    groupid = 4,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "哼，一群愚蠢的家伙！"
    };
getRow(25)->
    #show2Cfg {
    id = 25,
    groupid = 4,
    npcid = 3000,
    emotion = 1,
    name = "约克大叔",
    side = 1,
    content = "请你冷静一下，别让愤怒冲昏了头脑。"
    };
getRow(26)->
    #show2Cfg {
    id = 26,
    groupid = 4,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "约克大叔说的没错！{PlayerName}，露娜女神等你好久啦！你是她选中的光明勇士，快跟茜茜去见她吧。"
    };
getRow(27)->
    #show2Cfg {
    id = 27,
    groupid = 4,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "露娜女神……传说中的大陆女神么？她居然会在这里。"
    };
getRow(28)->
    #show2Cfg {
    id = 28,
    groupid = 4,
    npcid = 3000,
    emotion = 1,
    name = "约克大叔",
    side = 1,
    content = "不错，她一直在用自己的力量护佑这片大陆。你见到女神大人以后，她会告诉你更多关于魔族的信息，快去吧！"
    };
getRow(29)->
    #show2Cfg {
    id = 29,
    groupid = 5,
    taskname = "露娜女神",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "女神大人，茜茜把光明勇士带过来啦(◕ㅁ◕✿)。"
    };
getRow(30)->
    #show2Cfg {
    id = 30,
    groupid = 5,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "辛苦你了，茜茜。{PlayerName}，我终于见到你了！"
    };
getRow(31)->
    #show2Cfg {
    id = 31,
    groupid = 5,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "联盟军成员的阵亡令所有人遗憾，幸运的是你还活着。这便是我们净化魔族的希望……"
    };
getRow(32)->
    #show2Cfg {
    id = 32,
    groupid = 5,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "我……希望(゜Д゜;)？女神大人，我要为死去的父亲和同伴报仇！"
    };
getRow(33)->
    #show2Cfg {
    id = 33,
    groupid = 5,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "不要为仇恨而蒙蔽了自己的双眼和内心，你还有更重要的事情去做！找到[ff0000]漂浮之石[-]，拯救这片大陆……"
    };
getRow(34)->
    #show2Cfg {
    id = 34,
    groupid = 5,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "漂浮之石？那是什么（*￣□￣*；？！"
    };
getRow(35)->
    #show2Cfg {
    id = 35,
    groupid = 5,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "我的宿敌魔王[fff000]阿尔德娜[-]即将破除封印重返魔界，打败她的唯一办法就是使用漂浮之石的净化力量。"
    };
getRow(36)->
    #show2Cfg {
    id = 36,
    groupid = 5,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "女神大人，只要能消灭魔族，我愿意不惜一切代价去寻找漂浮之石！"
    };
getRow(37)->
    #show2Cfg {
    id = 37,
    groupid = 5,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "寻找漂浮之石一场艰难的旅程。现在我要恢复你一些力量来应对入侵这里的魔族。"
    };
getRow(38)->
    #show2Cfg {
    id = 38,
    groupid = 5,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "瘟疫过后，这里已经隐藏了许多魔族，在你和茜茜出发之前，先去消灭它们吧。"
    };
getRow(39)->
    #show2Cfg {
    id = 39,
    groupid = 6,
    taskname = "隐藏的魔族",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "{PlayerName}，茜茜拥有一点点女神之力。通过它，我可以准确的察觉到周围是否有魔族的气息出现~！"
    };
getRow(40)->
    #show2Cfg {
    id = 40,
    groupid = 6,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "哦？太棒了！那么茜茜，快点告诉我，现在这里有没有魔族？"
    };
getRow(41)->
    #show2Cfg {
    id = 41,
    groupid = 6,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "当然啦！它们已经向你举起了拳头呢！"
    };
getRow(42)->
    #show2Cfg {
    id = 42,
    groupid = 7,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "茜茜，带我到附近转转吧，或许还会找到其他的魔族……"
    };
getRow(43)->
    #show2Cfg {
    id = 43,
    groupid = 7,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "好啊，这里的居民们都好好哦！喷泉附近有一群喜欢跳舞的小伙伴。只是瘟疫过后，他们都生病了……"
    };
getRow(44)->
    #show2Cfg {
    id = 44,
    groupid = 7,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1,
    content = "我这里有一些药剂可以送给他们，茜茜，我们去看看他们。"
    };
getRow(45)->
    #show2Cfg {
    id = 45,
    groupid = 8,
    taskname = "港口居民",
    npcid = 1110,
    emotion = 1,
    name = "啦啦队长",
    side = 1,
    content = "嗨！小可爱，谢谢你们的好意。不过我和伙伴们都已经没事了，这宝贵的药剂还是送给其他人吧。"
    };
getRow(46)->
    #show2Cfg {
    id = 46,
    groupid = 8,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "(⊙o⊙)……之前你们不是病的很严重么？怎么恢复的这么快？"
    };
getRow(47)->
    #show2Cfg {
    id = 47,
    groupid = 8,
    npcid = 1110,
    emotion = 1,
    name = "啦啦队长",
    side = 1,
    content = "善良的[fff000]猫绅士[-]把约克叔叔从阿克勒城带来的药剂让给了我们……所以，我和小伙伴们都没事了。"
    };
getRow(48)->
    #show2Cfg {
    id = 48,
    groupid = 8,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "让给你们……听起来这位猫绅士也被感染了瘟疫吧，他现在情况如何？"
    };
getRow(49)->
    #show2Cfg {
    id = 49,
    groupid = 8,
    npcid = 1110,
    emotion = 1,
    name = "啦啦队长",
    side = 1,
    content = "他在等待新的药剂运到港口……不如你们把药剂送给他吧，他真的是一个合格的绅士。"
    };
getRow(50)->
    #show2Cfg {
    id = 50,
    groupid = 8,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "恩，茜茜，猫绅士的家你知道在哪儿么？"
    };
getRow(51)->
    #show2Cfg {
    id = 51,
    groupid = 8,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "当然！就在码头附近，在那周围可以看到好多好多货船呢！"
    };
getRow(52)->
    #show2Cfg {
    id = 52,
    groupid = 9,
    taskname = "帮助猫绅士",
    npcid = 3002,
    emotion = 1,
    name = "猫绅士",
    side = 1,
    content = "咳咳咳……喵，茜茜，谢谢你们送来的药剂，这位是你的新伙伴么？"
    };
getRow(53)->
    #show2Cfg {
    id = 53,
    groupid = 9,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "是哒~！这是被我们的露娜女神选中的光明勇士，茜茜要和他一起去寻找漂浮之石呢！"
    };
getRow(54)->
    #show2Cfg {
    id = 54,
    groupid = 9,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "猫绅士，你好。这药剂虽然不能完全治愈瘟疫，但至少可以缓解你的病痛……"
    };
getRow(55)->
    #show2Cfg {
    id = 55,
    groupid = 9,
    npcid = 3002,
    emotion = 1,
    name = "猫绅士",
    side = 1,
    content = "喵，谢谢你的好意。作为回报，我可以向你提供一些关于漂浮之石的信息。"
    };
getRow(56)->
    #show2Cfg {
    id = 56,
    groupid = 9,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "好耶，茜茜也想听听呢！"
    };
getRow(57)->
    #show2Cfg {
    id = 57,
    groupid = 9,
    npcid = 3002,
    emotion = 1,
    name = "猫绅士",
    side = 1,
    content = "喵，[ff0000]阿克勒城[-]出现了许多高级魔族，他们的目的也是在寻找漂浮之石。"
    };
getRow(58)->
    #show2Cfg {
    id = 58,
    groupid = 9,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "(・∀・)！看来我需得尽快前往阿克勒城……"
    };
getRow(59)->
    #show2Cfg {
    id = 59,
    groupid = 9,
    npcid = 3002,
    emotion = 1,
    name = "猫绅士",
    side = 1,
    content = "喵，没错！[fff000]夏洛克[-]是港口内最棒的船长，可以邀请他带你们出海。"
    };
getRow(60)->
    #show2Cfg {
    id = 60,
    groupid = 10,
    taskname = "船长夏洛特",
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "([00ff00]哼着小曲儿[-])你们是……？"
    };
getRow(61)->
    #show2Cfg {
    id = 61,
    groupid = 10,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "夏洛克船长你好，听说您是这里最棒的船长。我们想要前往阿克勒城，您可以带我们出海去那么？"
    };
getRow(62)->
    #show2Cfg {
    id = 62,
    groupid = 10,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "年轻人，谢谢你的赞美！但是很抱歉，这段时间内我不会考虑再出海……"
    };
getRow(63)->
    #show2Cfg {
    id = 63,
    groupid = 10,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "咦……为什么(T＿T)！？"
    };
getRow(64)->
    #show2Cfg {
    id = 64,
    groupid = 10,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "这次回来的途中，我的货船被[fff000]罗撒特[-]操纵的海怪袭击，已经被摧毁的不像样子……"
    };
getRow(65)->
    #show2Cfg {
    id = 65,
    groupid = 10,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "船长大人，可以让我先看看你的货船么，或许我可以帮你一起修复它。"
    };
getRow(66)->
    #show2Cfg {
    id = 66,
    groupid = 10,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "没问题，如果你们真的能帮我修复它，我一定带你们去阿克勒城。"
    };
getRow(67)->
    #show2Cfg {
    id = 67,
    groupid = 11,
    taskname = "被摧毁的货船",
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "怎么样？你们有什么好办法么？"
    };
getRow(68)->
    #show2Cfg {
    id = 68,
    groupid = 11,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "船长大人，您的船的确损坏的很厉害呢！{PlayerName}，你想到修补的办法么？。"
    };
getRow(69)->
    #show2Cfg {
    id = 69,
    groupid = 11,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "船长大人，袭击您的那只海怪到底是什么？还有，您刚才提到的罗撒特又是什么人？"
    };
getRow(70)->
    #show2Cfg {
    id = 70,
    groupid = 11,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "罗撒特是我多年的死对头，一心想取代我成为阿克勒港口唯一的船长。"
    };
getRow(71)->
    #show2Cfg {
    id = 71,
    groupid = 11,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "他不知从哪里获得了一些神秘的力量，居然可以操纵的巨型海象来袭击我的船。(┳◇┳)……"
    };
getRow(72)->
    #show2Cfg {
    id = 72,
    groupid = 11,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "原来如此，那么这几天他有没有再来找您的麻烦？"
    };
getRow(73)->
    #show2Cfg {
    id = 73,
    groupid = 11,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "他当然不会放过任何一个可以打败我的机会！喏，你们瞧，他的人来了！"
    };
getRow(74)->
    #show2Cfg {
    id = 74,
    groupid = 12,
    taskname = "港口海盗",
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "好厉害！你居然能独自打败罗撒特的人，不过事情还没有结束呢。"
    };
getRow(75)->
    #show2Cfg {
    id = 75,
    groupid = 12,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "哦？为什么？"
    };
getRow(76)->
    #show2Cfg {
    id = 76,
    groupid = 12,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "罗撒特非常贪婪狡猾，他的目标应该是我仓库里的货物！请你们去那里瞧瞧，拜托了！(⋟﹏⋞)"
    };
getRow(77)->
    #show2Cfg {
    id = 77,
    groupid = 12,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1,
    content = "可恶的海盗，茜茜我们现在就去仓库！"
    };
getRow(78)->
    #show2Cfg {
    id = 78,
    groupid = 13,
    taskname = "夏洛特的仓库",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "夏洛特船长猜的没错，罗撒特一伙人果然是冲着仓库来的！ಠ▃ಠ！"
    };
getRow(79)->
    #show2Cfg {
    id = 79,
    groupid = 13,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "对面的家伙，立刻把船长的货箱放下，否则别怪我不客气了！"
    };
getRow(80)->
    #show2Cfg {
    id = 80,
    groupid = 13,
    npcid = 1107,
    emotion = 1,
    name = "炸弹头头",
    side = 1,
    content = "啧！！被发现了，弟兄们，为了罗撒特首领，咱们跟他们拼啦！"
    };
getRow(81)->
    #show2Cfg {
    id = 81,
    groupid = 13,
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "嗯？你们居然被发现了，真是一群笨蛋！还不快点干掉他们！"
    };
getRow(82)->
    #show2Cfg {
    id = 82,
    groupid = 13,
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "罗撒特要是知道行动失败了，肯定要修理你们！"
    };
getRow(83)->
    #show2Cfg {
    id = 83,
    groupid = 13,
    npcid = 1107,
    emotion = 1,
    name = "炸弹头头",
    side = 1,
    content = "哇！原来是安娜啊。你愣着干什么？还不快点下来帮忙！"
    };
getRow(84)->
    #show2Cfg {
    id = 84,
    groupid = 13,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1,
    content = "哼，尽管来吧！"
    };
getRow(85)->
    #show2Cfg {
    id = 85,
    groupid = 14,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "夏洛特船长，您的仓库已经没事了，请您放心吧♡＾▽＾♡！"
    };
getRow(86)->
    #show2Cfg {
    id = 86,
    groupid = 14,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "太谢谢了，不过今天的事，罗撒特是不会善罢甘休的。"
    };
getRow(87)->
    #show2Cfg {
    id = 87,
    groupid = 14,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "船长大人，现在最要紧的事是马上修好您的货船。请您告诉我，都需要哪些材料来修复，我会为您找来最好的！"
    };
getRow(88)->
    #show2Cfg {
    id = 88,
    groupid = 14,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "我需要[ff0000]红木[-]，当时那只海象一击便弄坏了船上的横杆，这次我要换上更结实的！"
    };
getRow(89)->
    #show2Cfg {
    id = 89,
    groupid = 15,
    taskname = "收集红木",
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "有了这些红木，我的货船肯定会之前的更棒！"
    };
getRow(90)->
    #show2Cfg {
    id = 90,
    groupid = 15,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "这样吧！给我五天时间，你们再来到我这集合，我亲自开船带你们去阿克勒城！"
    };
getRow(91)->
    #show2Cfg {
    id = 91,
    groupid = 15,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "还要等五天啊(\'A`)……船长大人，能再快一点呢？"
    };
getRow(92)->
    #show2Cfg {
    id = 92,
    groupid = 15,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "嘘~别乱讲，船长大人答应我们已经很不容易了！万一他改变主意，我们该怎么办？？"
    };
getRow(93)->
    #show2Cfg {
    id = 93,
    groupid = 15,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "没问题，就这么说定了！夏洛克船长，五天以后我们再会~！"
    };
getRow(94)->
    #show2Cfg {
    id = 94,
    groupid = 15,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1,
    content = "唉╮(╯▽╰)╭……"
    };
getRow(95)->
    #show2Cfg {
    id = 95,
    groupid = 16,
    taskname = "神奇的魔导器",
    npcid = 3002,
    emotion = 1,
    name = "猫绅士",
    side = 1,
    content = "喵，五天以后出海……看来老伙计的船是遇到了大麻烦。"
    };
getRow(96)->
    #show2Cfg {
    id = 96,
    groupid = 16,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "是的，罗撒特不仅在海上袭击了他的货船，而且还令手下去他的仓库里偷东西。"
    };
getRow(97)->
    #show2Cfg {
    id = 97,
    groupid = 16,
    npcid = 3002,
    emotion = 1,
    name = "猫绅士",
    side = 1,
    content = "喵，{PlayerName}，你是被女神大人选中的勇士，由你来消灭罗撒特一伙人再合适不过了。"
    };
getRow(98)->
    #show2Cfg {
    id = 98,
    groupid = 16,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "当然可以！不过，我需要知道罗撒特现在在哪……"
    };
getRow(99)->
    #show2Cfg {
    id = 99,
    groupid = 16,
    npcid = 3002,
    emotion = 1,
    name = "猫绅士",
    side = 1,
    content = "喵，我的魔导器可以感知魔族的力量，通过它我可以帮你找到罗撒特的所在位置。"
    };
getRow(100)->
    #show2Cfg {
    id = 100,
    groupid = 16,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "这么神奇？！您的魔导器居然有感知魔族的能力，和茜茜一样呢♡＾▽＾♡~"
    };
getRow(101)->
    #show2Cfg {
    id = 101,
    groupid = 16,
    npcid = 3002,
    emotion = 1,
    name = "猫绅士",
    side = 1,
    content = "喵，不一样的，魔导器是充满魔法的水晶球，而你是个可爱的女孩。"
    };
getRow(102)->
    #show2Cfg {
    id = 102,
    groupid = 16,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "猫绅士，罗撒特现在在哪？"
    };
getRow(103)->
    #show2Cfg {
    id = 103,
    groupid = 16,
    npcid = 3002,
    emotion = 1,
    name = "猫绅士",
    side = 1,
    content = "喵……奇怪居然没有发现他的位置。不过，却发现了他的手下安娜，她正在广场对面的小木屋那做坏事，你们快去吧！"
    };
getRow(104)->
    #show2Cfg {
    id = 104,
    groupid = 17,
    taskname = "哭泣的苏珊",
    npcid = 3005,
    emotion = 1,
    name = "苏珊",
    side = 1,
    content = "哇啊啊！哇啊啊！你这个怪物，离我远一点！"
    };
getRow(105)->
    #show2Cfg {
    id = 105,
    groupid = 17,
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "真可怜，你就只会哭鼻子么？"
    };
getRow(106)->
    #show2Cfg {
    id = 106,
    groupid = 17,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "真可恶，你就只会欺负小女孩么？"
    };
getRow(107)->
    #show2Cfg {
    id = 107,
    groupid = 17,
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "又是你们！哼，阴魂不散的家伙！"
    };
getRow(108)->
    #show2Cfg {
    id = 108,
    groupid = 18,
    taskname = "安慰苏珊",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "乖乖，别哭啦！那个坏女孩已经逃走啦！"
    };
getRow(109)->
    #show2Cfg {
    id = 109,
    groupid = 18,
    npcid = 3005,
    emotion = 1,
    name = "苏珊",
    side = 1,
    content = "呜~她和罗撒特那个大坏蛋一样！我，我再也不想见到她了。"
    };
getRow(110)->
    #show2Cfg {
    id = 110,
    groupid = 18,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "哦？小妹妹，你居然也知道罗撒特……告诉我，罗撒特都做了哪些坏事？"
    };
getRow(111)->
    #show2Cfg {
    id = 111,
    groupid = 18,
    npcid = 3005,
    emotion = 1,
    name = "苏珊",
    side = 1,
    content = "那个大坏蛋总是喜欢找夏洛克叔叔的麻烦，还想把戴安娜姐姐抢走做新娘！"
    };
getRow(112)->
    #show2Cfg {
    id = 112,
    groupid = 18,
    npcid = 3005,
    emotion = 1,
    name = "苏珊",
    side = 1,
    content = "还有那个安娜，自从她的父亲卢卡叔叔失踪了以后，她就开始一起和罗撒特做坏事。"
    };
getRow(113)->
    #show2Cfg {
    id = 113,
    groupid = 18,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "(￣■￣;)……（[2becf8]安娜的父亲卢卡……我得找个知情人问清楚，对了！约克大叔。[-]）"
    };
getRow(114)->
    #show2Cfg {
    id = 114,
    groupid = 18,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "{PlayerName}！茜茜感觉到有一股很可怕的魔族气息马上会出现在神庙地带，我们快点去保护女神大人！"
    };
getRow(115)->
    #show2Cfg {
    id = 115,
    groupid = 19,
    taskname = "魔王斯诺卡",
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "你们为什么要回到这里？魔王[fff000]斯诺卡[-]马上就要出现了，我来对付它，你们快走！"
    };
getRow(116)->
    #show2Cfg {
    id = 116,
    groupid = 19,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "[fff000]斯诺卡么[-]？！来的正好，当初就是他杀死了我的父亲，这一次我要为父亲报仇(ʘдʘ╬)！"
    };
getRow(117)->
    #show2Cfg {
    id = 117,
    groupid = 19,
    npcid = 1104,
    emotion = 1,
    name = "罗撒特",
    side = 1,
    content = "哈哈哈！自不量力的家伙，居然妄想打败斯诺卡首领，准备接受他的制裁吧ಠﭛಠ！"
    };
getRow(118)->
    #show2Cfg {
    id = 118,
    groupid = 19,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "不好，他们来了！"
    };
getRow(119)->
    #show2Cfg {
    id = 119,
    groupid = 20,
    taskname = "勇士的愤怒",
    npcid = 1104,
    emotion = 1,
    name = "罗撒特",
    side = 1,
    content = "这股力量？你难道是……不，这不可能！"
    };
getRow(120)->
    #show2Cfg {
    id = 120,
    groupid = 20,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "哼，接招吧！"
    };
getRow(121)->
    #show2Cfg {
    id = 121,
    groupid = 21,
    npcid = 1104,
    emotion = 1,
    name = "罗撒特",
    side = 1,
    content = "我的魔力……哼，小家伙，今天本大爷就陪你玩到这里，改天我们再一块算账！"
    };
getRow(122)->
    #show2Cfg {
    id = 122,
    groupid = 21,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "你别想跑(◣_◢)！"
    };
getRow(123)->
    #show2Cfg {
    id = 123,
    groupid = 21,
    npcid = 1104,
    emotion = 1,
    name = "罗撒特",
    side = 1,
    content = "哈哈哈！想抓住本大爷，做梦吧(◣∀◢)ψ！"
    };
getRow(124)->
    #show2Cfg {
    id = 124,
    groupid = 22,
    taskname = "圣光之力",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "女神大人，刚才我使用的那股力量是……？"
    };
getRow(125)->
    #show2Cfg {
    id = 125,
    groupid = 22,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "那是你自己潜在体内的光明之力，它能够与漂浮之石产生呼应，这是令魔族最畏惧的力量。"
    };
getRow(126)->
    #show2Cfg {
    id = 126,
    groupid = 22,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "（[2becf8]我竟然拥有光明之力？这也是我被选为光明勇士的原因吧……[-]）可是为什么现在我却感觉不到了呢？"
    };
getRow(127)->
    #show2Cfg {
    id = 127,
    groupid = 22,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "你目前的实力还不足以令自己完全驾驭这光明之力，伴随你不断的成长，终有一日你会完全掌握它的。"
    };
getRow(128)->
    #show2Cfg {
    id = 128,
    groupid = 22,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "女神大人，刚才与我战斗的罗撒特为什么会使用魔族的力量呢？他明明就是一个普通的人类啊。"
    };
getRow(129)->
    #show2Cfg {
    id = 129,
    groupid = 22,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "罗撒特以自己的灵魂为代价向魔族换取力量，但是这力量是人类无法长期使用的，终有一日他自己会承担可怕的后果。"
    };
getRow(130)->
    #show2Cfg {
    id = 130,
    groupid = 22,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1,
    content = "原来如此……（[2becf8]但是离开这里之前我必须打倒罗撒特……之前的事还是去问问约克大叔吧。[-]）"
    };
getRow(131)->
    #show2Cfg {
    id = 131,
    groupid = 23,
    taskname = "悲惨的过去",
    npcid = 3000,
    emotion = 1,
    name = "约克大叔",
    side = 1,
    content = "什么？！你想问我有关于安娜的事……"
    };
getRow(132)->
    #show2Cfg {
    id = 132,
    groupid = 23,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "没错……安娜既然是一个半人半魔的孩子。您当初为什么让允许她生活在这呢？还有她的父亲到底去了哪里？"
    };
getRow(133)->
    #show2Cfg {
    id = 133,
    groupid = 23,
    npcid = 3000,
    emotion = 1,
    name = "约克大叔",
    side = 1,
    content = "这个居然都被你发现了……唉，让我慢慢来告诉你们吧……"
    };
getRow(134)->
    #show2Cfg {
    id = 134,
    groupid = 23,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1,
    content = "好，请开启您的回忆录U^ｴ^U。"
    };
getRow(135)->
    #show2Cfg {
    id = 135,
    groupid = 24,
    taskname = "怀疑",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "原来是这样啊……可是她的父亲既然那么疼爱安娜，怎么会舍得丢下她一个人消失了呢？"
    };
getRow(136)->
    #show2Cfg {
    id = 136,
    groupid = 24,
    npcid = 3000,
    emotion = 1,
    name = "约克大叔",
    side = 1,
    content = "这正是让我想不通的地方啊，卢卡失踪了以后，安娜就好像变了一个人。"
    };
getRow(137)->
    #show2Cfg {
    id = 137,
    groupid = 24,
    npcid = 3000,
    emotion = 1,
    name = "约克大叔",
    side = 1,
    content = "再后来见到安娜的时候，她已经成为了罗撒特的一员了。"
    };
getRow(138)->
    #show2Cfg {
    id = 138,
    groupid = 24,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "我想，安娜父亲的失踪一定和罗撒特有关系。约克大叔，除了您以外还有谁知道安娜的事呢？"
    };
getRow(139)->
    #show2Cfg {
    id = 139,
    groupid = 24,
    npcid = 3000,
    emotion = 1,
    name = "约克大叔",
    side = 1,
    content = "还有……啊！我的家，起火了！"
    };
getRow(140)->
    #show2Cfg {
    id = 140,
    groupid = 25,
    taskname = "约克的木屋",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "安娜，你太过分了！竟然敢纵火毁了约克叔叔的木屋！"
    };
getRow(141)->
    #show2Cfg {
    id = 141,
    groupid = 25,
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "哼！那个老头不是喜欢到处乱讲别人的事么，这是我给他的一点点教训！"
    };
getRow(142)->
    #show2Cfg {
    id = 142,
    groupid = 25,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "你好过分哦！你到处给大家制造麻烦，难怪他们都讨厌你！"
    };
getRow(143)->
    #show2Cfg {
    id = 143,
    groupid = 25,
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "讨厌我？？呵呵，我才不在乎！现在每天看到这里的人倒霉的样子，你们不知道我有多开心！"
    };
getRow(144)->
    #show2Cfg {
    id = 144,
    groupid = 25,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1,
    content = "可恶！这一次你别想逃！"
    };
getRow(145)->
    #show2Cfg {
    id = 145,
    groupid = 26,
    taskname = "阻止安娜",
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "该死，每次都坏我的事！不过，你们别想抓到我！尝尝这个！"
    };
getRow(146)->
    #show2Cfg {
    id = 146,
    groupid = 26,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "咳咳咳！居然是烟雾弹，好讨厌啊⊙﹏⊙！"
    };
getRow(147)->
    #show2Cfg {
    id = 147,
    groupid = 26,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "啧，又让她跑了！"
    };
getRow(148)->
    #show2Cfg {
    id = 148,
    groupid = 26,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "前面有很多港口居民在那，我们沿途问问他们，如果他们能告诉我们安娜的住所，我们就可以一鼓作气捉住她了！"
    };
getRow(149)->
    #show2Cfg {
    id = 149,
    groupid = 26,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1,
    content = "好！茜茜，你真聪明♡＾▽＾♡！"
    };
getRow(150)->
    #show2Cfg {
    id = 150,
    groupid = 27,
    taskname = "追踪安娜",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "这位小姐，请问你知道安娜的家在哪么？"
    };
getRow(151)->
    #show2Cfg {
    id = 151,
    groupid = 27,
    npcid = 3006,
    emotion = 1,
    name = "戴安娜",
    side = 1,
    content = "……"
    };
getRow(152)->
    #show2Cfg {
    id = 152,
    groupid = 27,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "咦？为什么不说话？你看起来很不高兴。"
    };
getRow(153)->
    #show2Cfg {
    id = 153,
    groupid = 27,
    npcid = 3006,
    emotion = 1,
    name = "戴安娜",
    side = 1,
    content = "没错，我现在心情很不好！你们刚刚提到的安娜，是我最讨厌的人(◣_◢)！"
    };
getRow(154)->
    #show2Cfg {
    id = 154,
    groupid = 27,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1,
    content = "哦？她做了什么事让你发这么大的火？"
    };
getRow(155)->
    #show2Cfg {
    id = 155,
    groupid = 27,
    npcid = 3006,
    emotion = 1,
    name = "戴安娜",
    side = 1,
    content = "她把我最喜欢的宝石项链放在龙虾人附近的草丛里，那里全都是腥臭的鱼……"
    };
getRow(156)->
    #show2Cfg {
    id = 156,
    groupid = 27,
    npcid = 3006,
    emotion = 1,
    name = "戴安娜",
    side = 1,
    content = "如果你们愿意帮我把项链取回来，我不但告诉你们她的家在哪，还把阿狸借给你们使用。"
    };
getRow(157)->
    #show2Cfg {
    id = 157,
    groupid = 27,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1,
    content = "好啊，你等着，我马上回来！"
    };
getRow(158)->
    #show2Cfg {
    id = 158,
    groupid = 28,
    taskname = "丢失的项链",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "戴安娜小姐，你的项链我已经替你取回来了！这次你可要好好的收起来。"
    };
getRow(159)->
    #show2Cfg {
    id = 159,
    groupid = 28,
    npcid = 3006,
    emotion = 1,
    name = "戴安娜",
    side = 1,
    content = "谢谢！等等……这项链是假的，你们是不是看错了！"
    };
getRow(160)->
    #show2Cfg {
    id = 160,
    groupid = 28,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "怎么会(￣Д￣；；……"
    };
getRow(161)->
    #show2Cfg {
    id = 161,
    groupid = 28,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "呀！小心，它是颗炸弹，要爆炸啦（◎0◎）！"
    };
getRow(162)->
    #show2Cfg {
    id = 162,
    groupid = 28,
    npcid = 1105,
    emotion = 1,
    name = "贪吃的史莱姆",
    side = 1,
    content = "咦~！有人类！喂喂，快点醒醒……我们落入人类的手中啦，快逃啊！"
    };
getRow(163)->
    #show2Cfg {
    id = 163,
    groupid = 28,
    npcid = 1106,
    emotion = 1,
    name = "傲娇的史莱姆",
    side = 1,
    content = "嗝！！！鱼肉真美味，再来一条！"
    };
getRow(164)->
    #show2Cfg {
    id = 164,
    groupid = 29,
    taskname = "戴安娜的骑宠",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "戴安娜小姐，刚才那串项链其实是史莱姆变的，真正项链应该还在安娜的手中。"
    };
getRow(165)->
    #show2Cfg {
    id = 165,
    groupid = 29,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "请你告诉我们安娜的家在哪，茜茜和伙伴一起去帮你把项链抢回来。"
    };
getRow(166)->
    #show2Cfg {
    id = 166,
    groupid = 29,
    npcid = 3006,
    emotion = 1,
    name = "戴安娜",
    side = 1,
    content = "好，我就再相信你们一回，阿狸也借给你们使用，它会带你们找到安娜的家。"
    };
getRow(167)->
    #show2Cfg {
    id = 167,
    groupid = 29,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "太谢谢了！"
    };
getRow(168)->
    #show2Cfg {
    id = 168,
    groupid = 29,
    npcid = 3006,
    emotion = 1,
    name = "戴安娜",
    side = 1,
    content = "哦对了，阿狸会带你们经过[fff000]维克托叔叔[-]那，他是港口里最棒的铁匠，你们不是要教训安娜么，他一定会帮忙的！"
    };
getRow(169)->
    #show2Cfg {
    id = 169,
    groupid = 30,
    taskname = "港口铁匠",
    npcid = 3008,
    emotion = 1,
    name = "维克托",
    side = 1,
    content = "你们是谁？需要我帮你们打造武器么？保证百分百满意！"
    };
getRow(170)->
    #show2Cfg {
    id = 170,
    groupid = 30,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "维克托先生，我们是来寻找安娜的，前面应该就是她的家，你看到她回去了么？"
    };
getRow(171)->
    #show2Cfg {
    id = 171,
    groupid = 30,
    npcid = 3008,
    emotion = 1,
    name = "维克托",
    side = 1,
    content = "当然，她进去很久了。很好，终于有人肯站出来收拾那个坏丫头！"
    };
getRow(172)->
    #show2Cfg {
    id = 172,
    groupid = 30,
    npcid = 3008,
    emotion = 1,
    name = "维克托",
    side = 1,
    content = "仗着自己会使用魔法，给大伙制造了太多麻烦。等下你们和她打架可要当心啊！"
    };
getRow(173)->
    #show2Cfg {
    id = 173,
    groupid = 31,
    taskname = "安娜的家",
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "呵，你们居然找上门来了！怎么还想跟我打架么？难道忘了炸弹的厉害！？"
    };
getRow(174)->
    #show2Cfg {
    id = 174,
    groupid = 31,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "你欺负别人还理直气壮，哼，我今天一定要替大家教训你！"
    };
getRow(175)->
    #show2Cfg {
    id = 175,
    groupid = 31,
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "好啊，打输了可别像苏珊那样哭鼻子，难看死了！"
    };
getRow(176)->
    #show2Cfg {
    id = 176,
    groupid = 31,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1,
    content = "谁哭鼻子还不一定呢，来吧！"
    };
getRow(177)->
    #show2Cfg {
    id = 177,
    groupid = 32,
    taskname = "狠毒的罗撒特",
    npcid = 1104,
    emotion = 1,
    name = "罗撒特",
    side = 1,
    content = "额！可恶，你这个小杂碎居然能伤到本大爷，实在不敢相信……"
    };
getRow(178)->
    #show2Cfg {
    id = 178,
    groupid = 32,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "你这个混蛋，威胁原本善良的人去做坏事，现在又杀死她的亲人！罗撒特，下地狱去忏悔吧！"
    };
getRow(179)->
    #show2Cfg {
    id = 179,
    groupid = 32,
    npcid = 1104,
    emotion = 1,
    name = "罗撒特",
    side = 1,
    content = "别小看我！看我的魔灵之力！喝喝！"
    };
getRow(180)->
    #show2Cfg {
    id = 180,
    groupid = 32,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "呀（πーπ）！"
    };
getRow(181)->
    #show2Cfg {
    id = 181,
    groupid = 32,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "茜茜！"
    };
getRow(182)->
    #show2Cfg {
    id = 182,
    groupid = 32,
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "危险！啊……"
    };
getRow(183)->
    #show2Cfg {
    id = 183,
    groupid = 33,
    taskname = "安娜的忏悔",
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "谢谢你们救了我……若不是你们，恐怕我还会继续被罗撒特的摆布。"
    };
getRow(184)->
    #show2Cfg {
    id = 184,
    groupid = 33,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "安娜，罗撒特本性凶残，从他掳走你的父亲开始，恐怕就没想过让他活下去。"
    };
getRow(185)->
    #show2Cfg {
    id = 185,
    groupid = 33,
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "当时父亲在他的手上，我若不是听他的话，他就会加倍折磨父亲……"
    };
getRow(186)->
    #show2Cfg {
    id = 186,
    groupid = 33,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "好了，你不需要再解释那么多，现在我们知道了真相。回去以后我们会向大家解释清楚，你放心好啦。"
    };
getRow(187)->
    #show2Cfg {
    id = 187,
    groupid = 33,
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "好，我保证从今往后不再做任何坏事了。"
    };
getRow(188)->
    #show2Cfg {
    id = 188,
    groupid = 33,
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "对了，那边的箱子里装着维克托叔叔的矿石和戴安娜小姐的项链，请你替我还给他们吧。"
    };
getRow(189)->
    #show2Cfg {
    id = 189,
    groupid = 33,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1,
    content = "没问题。"
    };
getRow(190)->
    #show2Cfg {
    id = 190,
    groupid = 34,
    taskname = "居民的宝物(下)",
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "我还想起了一件事，罗撒特虽然受了伤，但是他之前早就准备好破坏码头的计划。"
    };
getRow(191)->
    #show2Cfg {
    id = 191,
    groupid = 34,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "哦？他又要做什么？"
    };
getRow(192)->
    #show2Cfg {
    id = 192,
    groupid = 34,
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "罗撒特非常憎恨夏洛克船长，一心想彻底毁了他。"
    };
getRow(193)->
    #show2Cfg {
    id = 193,
    groupid = 34,
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "你们尽快去港口看看吧，如果罗撒特真的去了那，正好是彻底打败他的机会！"
    };
getRow(194)->
    #show2Cfg {
    id = 194,
    groupid = 34,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1,
    content = "谢谢你告诉我这么重要的消息，安娜，再见！"
    };
getRow(195)->
    #show2Cfg {
    id = 195,
    groupid = 35,
    taskname = "交还矿石",
    npcid = 3008,
    emotion = 1,
    name = "维克托",
    side = 1,
    content = "原来是这样……该死的魔族，竟然利用孩子去做坏事！"
    };
getRow(196)->
    #show2Cfg {
    id = 196,
    groupid = 35,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "不仅如此，还当面杀死了安娜的父亲。维托克先生，请你们不要再责怪安娜了。"
    };
getRow(197)->
    #show2Cfg {
    id = 197,
    groupid = 35,
    npcid = 3008,
    emotion = 1,
    name = "维克托",
    side = 1,
    content = "什么！卢克他死了……哎，安娜这孩子太可怜了！那接下来你们打算去哪儿？"
    };
getRow(198)->
    #show2Cfg {
    id = 198,
    groupid = 35,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "我们把项链还给戴安娜小姐后，就打算去码头与船长会合。或许还会碰到罗撒特。"
    };
getRow(199)->
    #show2Cfg {
    id = 199,
    groupid = 35,
    npcid = 3008,
    emotion = 1,
    name = "维克托",
    side = 1,
    content = "好吧，谢谢你们为大家付出的一切，我们以后再会！"
    };
getRow(200)->
    #show2Cfg {
    id = 200,
    groupid = 36,
    taskname = "戴安娜的礼物",
    npcid = 3006,
    emotion = 1,
    name = "戴安娜",
    side = 1,
    content = "我的项链！终于找回来了！谢谢你们！"
    };
getRow(201)->
    #show2Cfg {
    id = 201,
    groupid = 36,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "不客气，你的阿狸帮了大忙呢！"
    };
getRow(202)->
    #show2Cfg {
    id = 202,
    groupid = 36,
    npcid = 3006,
    emotion = 1,
    name = "戴安娜",
    side = 1,
    content = "还有，安娜她会不会再来偷我的项链？"
    };
getRow(203)->
    #show2Cfg {
    id = 203,
    groupid = 36,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "戴安娜小姐，安娜其实并不是故意要做坏事，她只是被罗撒特利用了，请你们大家原谅她吧。"
    };
getRow(204)->
    #show2Cfg {
    id = 204,
    groupid = 36,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "没错，她亲口承诺不会再对你们做任何坏事了，希望你们能够重新接受她。"
    };
getRow(205)->
    #show2Cfg {
    id = 205,
    groupid = 36,
    npcid = 3006,
    emotion = 1,
    name = "戴安娜",
    side = 1,
    content = "额……我愿意相信你们，你们帮我拿回了心爱的项链，就让我也送你们一件礼物，就当做是酬劳吧！"
    };
getRow(206)->
    #show2Cfg {
    id = 206,
    groupid = 37,
    taskname = "告别约克",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "（[00ff00]讲述安娜事情的真相……[-]）一切就是这样，约克大叔，以后请你多关照安娜。"
    };
getRow(207)->
    #show2Cfg {
    id = 207,
    groupid = 37,
    npcid = 3000,
    emotion = 1,
    name = "约克大叔",
    side = 1,
    content = "当然，我会好好照顾她。看你们的样子是打算远行，你们要去哪？"
    };
getRow(208)->
    #show2Cfg {
    id = 208,
    groupid = 37,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "约克大叔，我们与船长大人约定的时间就要到了，他答应带我们出海前往阿克勒城。"
    };
getRow(209)->
    #show2Cfg {
    id = 209,
    groupid = 37,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "罗撒特一伙人野心不死，他们很有可能再次进攻码头。若他真的出现了，我一定会将他赶出这里！"
    };
getRow(210)->
    #show2Cfg {
    id = 210,
    groupid = 37,
    npcid = 3000,
    emotion = 1,
    name = "约克大叔",
    side = 1,
    content = "一切拜托你们了！记得以后回到这里看看大家！"
    };
getRow(211)->
    #show2Cfg {
    id = 211,
    groupid = 37,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1,
    content = "好，约克大叔，请您多多保重。"
    };
getRow(212)->
    #show2Cfg {
    id = 212,
    groupid = 38,
    taskname = "会和夏洛特",
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "嗨！很高兴你们如期赴约！我的货船已经修好了，现在是出海的最佳时刻。"
    };
getRow(213)->
    #show2Cfg {
    id = 213,
    groupid = 38,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "夏洛克船长，罗撒特那群坏蛋很可能会来进攻港口，我和茜茜一定会保护你们的。"
    };
getRow(214)->
    #show2Cfg {
    id = 214,
    groupid = 38,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "罗撒特一直想代替我成为唯一的船长，但却不知没有一颗善良的心，是永远无法被海神认可的。"
    };
getRow(215)->
    #show2Cfg {
    id = 215,
    groupid = 38,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "先不提他，我已经备好在路上所需要的食物和水，你们去仓库那里搬过来吧。"
    };
getRow(216)->
    #show2Cfg {
    id = 216,
    groupid = 39,
    taskname = "搬动食物",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "船长大人太贴心了，您居然准备了茜茜最喜欢的果酱！"
    };
getRow(217)->
    #show2Cfg {
    id = 217,
    groupid = 39,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "呵呵，你开心就好，身为船长照顾自己的伙伴是分内之事。"
    };
getRow(218)->
    #show2Cfg {
    id = 218,
    groupid = 39,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "船长大人我们可以出发了么？"
    };
getRow(219)->
    #show2Cfg {
    id = 219,
    groupid = 39,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "年轻人，我们这一趟可是远行，离开之前不妨去与同伴们告个别吧。"
    };
getRow(220)->
    #show2Cfg {
    id = 220,
    groupid = 39,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1,
    content = "好的，茜茜，跟我去猫绅士那。"
    };
getRow(221)->
    #show2Cfg {
    id = 221,
    groupid = 40,
    taskname = "告别伙伴",
    npcid = 3002,
    emotion = 1,
    name = "猫绅士",
    side = 1,
    content = "喵，你们要离开了？罗撒特和安娜事情解决的怎么样了？"
    };
getRow(222)->
    #show2Cfg {
    id = 222,
    groupid = 40,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "安娜是被罗撒特威胁才做了那么多坏事。至于罗撒特，我要在港口这里与他决出胜负。"
    };
getRow(223)->
    #show2Cfg {
    id = 223,
    groupid = 40,
    npcid = 3002,
    emotion = 1,
    name = "猫绅士",
    side = 1,
    content = "喵，很好，罗撒特的人很快就要出现了，请你勇敢的战斗吧！"
    };
getRow(224)->
    #show2Cfg {
    id = 224,
    groupid = 40,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1,
    content = "很好，这次我绝不会再给他机会跑掉了！"
    };
getRow(225)->
    #show2Cfg {
    id = 225,
    groupid = 41,
    taskname = "勇士出海",
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "伙伴们，一切准备就绪。我们上船出海！"
    };
getRow(226)->
    #show2Cfg {
    id = 226,
    groupid = 41,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "哇~！皮皮还是第一次坐船出海，好期待哦~！"
    };
getRow(227)->
    #show2Cfg {
    id = 227,
    groupid = 41,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "这一路上，麻烦船长大人多多关照！"
    };
getRow(228)->
    #show2Cfg {
    id = 228,
    groupid = 41,
    npcid = 1104,
    emotion = 1,
    name = "罗撒特",
    side = 1,
    content = "哈哈哈！今天本大爷就在这里，你们谁都别想离开！"
    };
getRow(229)->
    #show2Cfg {
    id = 229,
    groupid = 41,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "啊！是罗撒特！他果然来了！"
    };
getRow(230)->
    #show2Cfg {
    id = 230,
    groupid = 41,
    npcid = 1104,
    emotion = 1,
    name = "罗撒特",
    side = 1,
    content = "兄弟们一起上，拆了他们的船！"
    };
getRow(231)->
    #show2Cfg {
    id = 231,
    groupid = 42,
    taskname = "港口之战",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "罗撒特，有我在，你休想再向前一步！"
    };
getRow(232)->
    #show2Cfg {
    id = 232,
    groupid = 42,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "大坏蛋，你为了一点点魔力就成为魔族的爪牙，真是不知羞！"
    };
getRow(233)->
    #show2Cfg {
    id = 233,
    groupid = 42,
    npcid = 1104,
    emotion = 1,
    name = "罗撒特",
    side = 1,
    content = "你们竟然知道了本大爷的秘密，今天一定要把你们扔进海里喂鲨鱼！"
    };
getRow(234)->
    #show2Cfg {
    id = 234,
    groupid = 42,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "不要再浪费时间了！快点上船吧，只要离开港口，罗撒特他们追不上我们的！"
    };
getRow(235)->
    #show2Cfg {
    id = 235,
    groupid = 42,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "不行的，船长大人。我必须与他做个了断"
    };
getRow(236)->
    #show2Cfg {
    id = 236,
    groupid = 42,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "好吧……他的实力很强，你要小心些！"
    };
getRow(237)->
    #show2Cfg {
    id = 237,
    groupid = 42,
    npcid = 1104,
    emotion = 1,
    name = "罗撒特",
    side = 1,
    content = "哼哼，小家伙，你们输定了！"
    };
getRow(238)->
    #show2Cfg {
    id = 238,
    groupid = 43,
    taskname = "保护货船",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "夏洛克船长！你受伤了！"
    };
getRow(239)->
    #show2Cfg {
    id = 239,
    groupid = 43,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "你们别管我，快点结束这场战斗！"
    };
getRow(240)->
    #show2Cfg {
    id = 240,
    groupid = 43,
    npcid = 1104,
    emotion = 1,
    name = "罗撒特",
    side = 1,
    content = "哈哈哈……我才是真正的阿克勒港口的船长，看我的魔灵兽！喝！！！！"
    };
getRow(241)->
    #show2Cfg {
    id = 241,
    groupid = 43,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "啊！那个是！！"
    };
getRow(242)->
    #show2Cfg {
    id = 242,
    groupid = 43,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "啊，之前就是那个家伙毁了我的货船，拜托你们，无论如何一定要保护好货船！"
    };
getRow(243)->
    #show2Cfg {
    id = 243,
    groupid = 44,
    taskname = "夏洛特的委托",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "船长大人，您伤的很严重呢……呜！"
    };
getRow(244)->
    #show2Cfg {
    id = 244,
    groupid = 44,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "对不起，我不能与你们一起出海了，谢谢你们帮我守住了货船。但是我有个不情之请，希望你们能答应我。"
    };
getRow(245)->
    #show2Cfg {
    id = 245,
    groupid = 44,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "只要我能做到，就一定答应你！"
    };
getRow(246)->
    #show2Cfg {
    id = 246,
    groupid = 44,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "我的未婚妻露露在阿克勒城，我很担心她。你们到了那里以后请替我保护她。"
    };
getRow(247)->
    #show2Cfg {
    id = 247,
    groupid = 44,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "嗯嗯嗯，等我们到了阿克勒城找到她，一定会向她转达你的心意！"
    };
getRow(248)->
    #show2Cfg {
    id = 248,
    groupid = 44,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1,
    content = "没错，我们会保护你的未婚妻，请你放心吧。"
    };
getRow(249)->
    #show2Cfg {
    id = 249,
    groupid = 56,
    taskname = "东城郊码头",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "光明勇士，这里就是[fff000]阿克勒东成郊[-]，再往前面走不远，我们就能看到阿克勒城的入口。咦？前面有个公告栏，我们过去看看。"
    };
getRow(250)->
    #show2Cfg {
    id = 250,
    groupid = 57,
    taskname = "阿克勒瘟疫",
    npcid = 3032,
    emotion = 1,
    name = "安迪",
    side = 1,
    content = "你们好，远方来的客人，你们是想进入阿克勒城么？"
    };
getRow(251)->
    #show2Cfg {
    id = 251,
    groupid = 57,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "是的没错，这位先生，皮皮刚刚看了告示栏，城内发生了可怕的瘟疫，我们想进入阿克勒城寻找城主大人。"
    };
getRow(252)->
    #show2Cfg {
    id = 252,
    groupid = 57,
    npcid = 3032,
    emotion = 1,
    name = "安迪",
    side = 1,
    content = "现在城内很危险，瘟疫发生过后大家都很害怕，已经有很多人陆续离开了。"
    };
getRow(253)->
    #show2Cfg {
    id = 253,
    groupid = 57,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "皮皮和光明勇士不怕，我们来到这正是想帮助大家驱散瘟疫。"
    };
getRow(254)->
    #show2Cfg {
    id = 254,
    groupid = 57,
    npcid = 3032,
    emotion = 1,
    name = "安迪",
    side = 1,
    content = "那真是太好了，现在我们都盼望着解毒药水能早日研制出来，前面的入口就是阿克勒城门，你们快去吧。"
    };
getRow(255)->
    #show2Cfg {
    id = 255,
    groupid = 58,
    taskname = "生命石的线索",
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "啊哈哈，太好了，终于见到拿武器的年轻人了！你们可以帮我一个忙么，我愿意出付大价钱做酬金！"
    };
getRow(256)->
    #show2Cfg {
    id = 256,
    groupid = 58,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "酬金……嗯，这位先生，你先说说看，到底发生了什么事！"
    };
getRow(257)->
    #show2Cfg {
    id = 257,
    groupid = 58,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "我在阿克勒城花大价钱买来一颗石头，它可以治疗普通人的病痛，我本打算带着它回故乡的。"
    };
getRow(258)->
    #show2Cfg {
    id = 258,
    groupid = 58,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "结果刚刚出城没多久就被一群丑陋的怪物盯上，把我的箱子抢走了，求求你们替我把它拿回来吧！"
    };
getRow(259)->
    #show2Cfg {
    id = 259,
    groupid = 58,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "[2becf8]（治疗病痛，难道是生命石……）[-]光明勇士，我们帮帮他吧！"
    };
getRow(260)->
    #show2Cfg {
    id = 260,
    groupid = 59,
    taskname = "耍赖的商人",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "[2becf8]（讨厌！竟然只是一颗紫色的宝石，好失望……）[-]杰斯先生，你的箱子，这次要收好它。"
    };
getRow(261)->
    #show2Cfg {
    id = 261,
    groupid = 59,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "太谢谢了，我记住你们了。以后我还来阿克勒城做生意，到时候一并付给你们酬金。啊哈哈！"
    };
getRow(262)->
    #show2Cfg {
    id = 262,
    groupid = 59,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "哼，两句话就想打发皮皮和光明勇士！很好，我们也记住你了，以后再碰到被人抢走了宝贝，我们才不会理你呢！"
    };
getRow(263)->
    #show2Cfg {
    id = 263,
    groupid = 60,
    taskname = "琳达的委托",
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1,
    content = "嗨！我是灵兽师琳达。我的灵兽在这里秋秋跑丢了，你们可以帮我找到它么？"
    };
getRow(264)->
    #show2Cfg {
    id = 264,
    groupid = 60,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "好的啊！这位小姐姐，你要告诉皮皮，灵兽秋秋的样子啊！"
    };
getRow(265)->
    #show2Cfg {
    id = 265,
    groupid = 60,
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1,
    content = "它是一只小野猪，很淘气，喜欢吃这里的野果。"
    };
getRow(266)->
    #show2Cfg {
    id = 266,
    groupid = 60,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "让皮皮感觉一下它的气息……啊~在那里，皮皮听到声音了！"
    };
getRow(267)->
    #show2Cfg {
    id = 267,
    groupid = 61,
    taskname = "摇摆的草丛",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "哇，秋秋好可爱！你该回到主人身边啦，她很担心呢！"
    };
getRow(268)->
    #show2Cfg {
    id = 268,
    groupid = 61,
    npcid = 3053,
    emotion = 1,
    name = "秋秋",
    side = 1,
    content = "秋秋不想回到主人身边，秋秋想要去冒险！你们可以带上我一起么？"
    };
getRow(269)->
    #show2Cfg {
    id = 269,
    groupid = 61,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "咦？虽然皮皮很喜欢你，但是你想要和我们一起，皮皮必须要征求你主人的同意呢！"
    };
getRow(270)->
    #show2Cfg {
    id = 270,
    groupid = 61,
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1,
    content = "既然秋秋喜欢跟着你们，那我就只好同意了，不过你们一定要仔细的照顾它哦。"
    };
getRow(271)->
    #show2Cfg {
    id = 271,
    groupid = 61,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "好哒~谢谢小姐姐，皮皮会好好照顾秋秋的！"
    };
getRow(272)->
    #show2Cfg {
    id = 272,
    groupid = 62,
    taskname = "城郊巡逻官",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "长官大人，城主大人同意我们进入东成郊区域清理魔族，请您提供给我们具体的魔族所活动的区域好么？"
    };
getRow(273)->
    #show2Cfg {
    id = 273,
    groupid = 62,
    npcid = 3035,
    emotion = 1,
    name = "巡逻官鲍勃",
    side = 1,
    content = "没问题，不过在此之前，请你们先出示进入东成郊地带的通行证，这是守城军的规定。"
    };
getRow(274)->
    #show2Cfg {
    id = 274,
    groupid = 63,
    taskname = "出示通行证",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "皮皮已经出示了通行证，长官大人请告诉我们一些关于魔族的情况吧。"
    };
getRow(275)->
    #show2Cfg {
    id = 275,
    groupid = 63,
    npcid = 3035,
    emotion = 1,
    name = "巡逻官鲍勃",
    side = 1,
    content = "这里的魔族通常在树林中的深处生活，最近几日不知为何，魔族与魔族之间还发生了争斗。"
    };
getRow(276)->
    #show2Cfg {
    id = 276,
    groupid = 63,
    npcid = 3035,
    emotion = 1,
    name = "巡逻官鲍勃",
    side = 1,
    content = "我们这些守城军亲眼所见，但是因为惧怕魔族的瘟疫，都不敢上前去看看究竟。你们要进入东成郊深处驱赶魔族，一定要小心。万一遇到了危险就马上撤退，千万不要逞强。"
    };
getRow(277)->
    #show2Cfg {
    id = 277,
    groupid = 63,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "竟有这种事！皮皮和光明勇士一定会查清事情的真相，请你们静候佳音吧！"
    };
getRow(278)->
    #show2Cfg {
    id = 278,
    groupid = 64,
    taskname = "杰斯的嘲讽",
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "哈，我们又见面了，你们这么快就要离开阿克勒城了么？不如做我的保镖，跟我回故乡发财吧！"
    };
getRow(279)->
    #show2Cfg {
    id = 279,
    groupid = 64,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "咳咳，皮皮才不和你这样的人做朋友呢，我们是要去消灭这里的魔族解救大家，杰斯先生你还是早点离开这里吧！"
    };
getRow(280)->
    #show2Cfg {
    id = 280,
    groupid = 64,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "赶走魔族，就凭你们？连护城军都应付不了魔族，我劝你们还是不要去逞强了，万一失败了岂不是太丢人了！"
    };
getRow(281)->
    #show2Cfg {
    id = 281,
    groupid = 64,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "哼，别小看我们，光明勇士，我们出发！"
    };
getRow(282)->
    #show2Cfg {
    id = 282,
    groupid = 65,
    taskname = "神秘礼物",
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "你身上的这些绒毛是？让我看看……啊哈，是狐狸绒毛，你们从哪里弄到的，我愿意出大价钱收购！"
    };
getRow(283)->
    #show2Cfg {
    id = 283,
    groupid = 65,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "你之前已经骗过我们一次了，皮皮才不信你的话呢。"
    };
getRow(284)->
    #show2Cfg {
    id = 284,
    groupid = 65,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "哎哎，先别忙着走啊！就让我表现一些诚意吧，这里的魔族似乎也是因为瘟疫的事情发生了争斗，你们小心些……"
    };
getRow(285)->
    #show2Cfg {
    id = 285,
    groupid = 65,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "知道了，谢谢！"
    };
getRow(286)->
    #show2Cfg {
    id = 286,
    groupid = 66,
    taskname = "深入东成郊",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "这位先生，您一个人在这里很危险，赶快离开吧！"
    };
getRow(287)->
    #show2Cfg {
    id = 287,
    groupid = 66,
    npcid = 3036,
    emotion = 1,
    name = "卡卡",
    side = 1,
    content = "终于有人来救我了，我掉入了魔族设下的陷阱，现在无法走路了！"
    };
getRow(288)->
    #show2Cfg {
    id = 288,
    groupid = 66,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "您别害怕，我们来帮您。等等，光明勇士，这里有魔族的气味！"
    };
getRow(289)->
    #show2Cfg {
    id = 289,
    groupid = 67,
    taskname = "污秽大魔王",
    npcid = 3040,
    emotion = 1,
    name = "污秽的大恶魔",
    side = 1,
    content = "你们好过分，竟然恩将仇报！要不是我们把这个老头困在这里，他差一点就被吉娜的手下抓走了！"
    };
getRow(290)->
    #show2Cfg {
    id = 290,
    groupid = 67,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "胡说八道，你们这些散播瘟疫的魔族会救人类，光明勇士，别让他们跑掉！"
    };
getRow(291)->
    #show2Cfg {
    id = 291,
    groupid = 67,
    npcid = 3040,
    emotion = 1,
    name = "污秽的大恶魔",
    side = 1,
    content = "哼，你们别想找到我们！"
    };
getRow(292)->
    #show2Cfg {
    id = 292,
    groupid = 68,
    taskname = "乘胜追击",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "哼哼，看你们往哪里跑！"
    };
getRow(293)->
    #show2Cfg {
    id = 293,
    groupid = 68,
    npcid = 3040,
    emotion = 1,
    name = "污秽的大恶魔",
    side = 1,
    content = "兄弟们，有人擅自闯入我们的地盘，来吧，让我们用粘液赶走他们！"
    };
getRow(294)->
    #show2Cfg {
    id = 294,
    groupid = 68,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "啊！粘液，好恶心！"
    };
getRow(295)->
    #show2Cfg {
    id = 295,
    groupid = 69,
    taskname = "草药迷卡卡",
    npcid = 3036,
    emotion = 1,
    name = "卡卡",
    side = 1,
    content = "谢谢你们救了我，我是城里的药剂师卡卡，进入东成郊这里寻找清除瘟疫的草药，你们又为什么会来这里？"
    };
getRow(296)->
    #show2Cfg {
    id = 296,
    groupid = 69,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "皮皮和光明使者受城主大人的委托来这里清理魔族，您一个人来这里寻找清除瘟疫的草药实在太危险了！"
    };
getRow(297)->
    #show2Cfg {
    id = 297,
    groupid = 69,
    npcid = 3036,
    emotion = 1,
    name = "卡卡",
    side = 1,
    content = "一开始我身上带着一些避魔草药，普通的魔族不敢靠近我。但是没想到居然在这里遇上了高级魔族……"
    };
getRow(298)->
    #show2Cfg {
    id = 298,
    groupid = 69,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "现在已经没事了，卡卡教授，您还是尽快回去吧，城门口的鲍勃长官会帮助您的。"
    };
getRow(299)->
    #show2Cfg {
    id = 299,
    groupid = 70,
    taskname = "卡卡的请求",
    npcid = 3036,
    emotion = 1,
    name = "卡卡",
    side = 1,
    content = "不找到草药我绝不回去，你们愿意和我一起寻找草药么，事成之后，我愿意教你们掌握制作驱除瘟疫药剂的办法。"
    };
getRow(300)->
    #show2Cfg {
    id = 300,
    groupid = 70,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "当然愿意，您再找那些草药呢？"
    };
getRow(301)->
    #show2Cfg {
    id = 301,
    groupid = 70,
    npcid = 3036,
    emotion = 1,
    name = "卡卡",
    side = 1,
    content = "[ff0000]红梅果实，橄榄果实[-]各一颗，另外我要提醒你们，刚刚我被困在陷阱里的时候，无意中听到魔族谈起一个名叫[fff000]吉娜[-]的女人，她似乎是这场瘟疫的幕后黑手。"
    };
getRow(302)->
    #show2Cfg {
    id = 302,
    groupid = 70,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "吉娜？！光明勇士，我们似乎在港口的时候见过她……卡卡教授，谢谢您告诉我们这些，皮皮和光明勇士一定会把散播瘟疫的坏蛋全部消灭的。"
    };
getRow(303)->
    #show2Cfg {
    id = 303,
    groupid = 71,
    taskname = "魔族的报复",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "呀，可恶，是谁？！竟然敢咬皮皮？！"
    };
getRow(304)->
    #show2Cfg {
    id = 304,
    groupid = 71,
    npcid = 3041,
    emotion = 1,
    name = "污秽的小恶魔",
    side = 1,
    content = "哇啊！你们这群愚蠢的人类竟然擅自拿走我们种下的果实，当然要接受我们的惩罚！"
    };
getRow(305)->
    #show2Cfg {
    id = 305,
    groupid = 71,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "来得正好，光明勇士，我们消灭这些可恶的魔族！"
    };
getRow(306)->
    #show2Cfg {
    id = 306,
    groupid = 72,
    taskname = "制作药剂",
    npcid = 3036,
    emotion = 1,
    name = "卡卡",
    side = 1,
    content = "药剂已经制作成功，你们带上它可以去净化被魔族污染的丛林。"
    };
getRow(307)->
    #show2Cfg {
    id = 307,
    groupid = 72,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "好期待！卡卡真是一个了不起的药剂师。"
    };
getRow(308)->
    #show2Cfg {
    id = 308,
    groupid = 72,
    npcid = 3036,
    emotion = 1,
    name = "卡卡",
    side = 1,
    content = "可爱的姑娘，谢谢你的夸赞。这张纸上记录了制作药剂的步骤，收好它！"
    };
getRow(309)->
    #show2Cfg {
    id = 309,
    groupid = 72,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "谢谢您。光明勇士，我们赶快试试吧。"
    };
getRow(310)->
    #show2Cfg {
    id = 310,
    groupid = 73,
    taskname = "使用药剂",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "好香！这药剂的味道皮皮很喜欢。"
    };
getRow(311)->
    #show2Cfg {
    id = 311,
    groupid = 73,
    npcid = 3036,
    emotion = 1,
    name = "卡卡",
    side = 1,
    content = "谢谢，我在制作药剂时，加了一点蜂蜜。小姑娘似乎很喜欢甜食，等我们回到阿克勒城，让你尝尝我做的蜂蜜果酱。"
    };
getRow(312)->
    #show2Cfg {
    id = 312,
    groupid = 73,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "蜂蜜果酱……皮皮口水都要流出来了呢。不急，不急，消灭魔族才是最重要的事。"
    };
getRow(313)->
    #show2Cfg {
    id = 313,
    groupid = 74,
    taskname = "禁止通行",
    npcid = 3037,
    emotion = 1,
    name = "巡逻官路易丝",
    side = 1,
    content = "请留步！前面是魔族的重灾区，普通人一律不准入内，请你们立即离开！"
    };
getRow(314)->
    #show2Cfg {
    id = 314,
    groupid = 74,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "这些勇敢的姐姐，皮皮和光明勇士受城主的委托进入这里与你们一起消灭魔族，请你让我们过去吧！"
    };
getRow(315)->
    #show2Cfg {
    id = 315,
    groupid = 74,
    npcid = 3037,
    emotion = 1,
    name = "巡逻官路易丝",
    side = 1,
    content = "抱歉，我之前没有接到城主大人的通知，我的同伴丹尼尔就在前面，你们去看看他吧。"
    };
getRow(316)->
    #show2Cfg {
    id = 316,
    groupid = 75,
    taskname = "伊凡首领",
    npcid = 3039,
    emotion = 1,
    name = "荒野魔族伊凡",
    side = 1,
    content = "喂！你们这些无礼的人类，我们在东成郊生活从来没有主动打扰你们，如果你们在继续这样下去，我们会生气的！"
    };
getRow(317)->
    #show2Cfg {
    id = 317,
    groupid = 75,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "你们在这里散播大量的瘟疫，将阿克勒的城民都病倒了，皮皮和光明使者当然要赶走你们！"
    };
getRow(318)->
    #show2Cfg {
    id = 318,
    groupid = 75,
    npcid = 3039,
    emotion = 1,
    name = "荒野魔族伊凡",
    side = 1,
    content = "魔族也分好多种，你们遭受的瘟疫不是我们散播的，是斯诺卡的手下吉娜干的好事。她以制造痛苦为乐趣，她的毒药十分可怕，就连身为魔族的我们也感到恐惧呢！"
    };
getRow(319)->
    #show2Cfg {
    id = 319,
    groupid = 75,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "额……这么说，我们误会你们了么？总之，今天来到这里，皮皮和光明勇士一定要查清这场瘟疫的真相。"
    };
getRow(320)->
    #show2Cfg {
    id = 320,
    groupid = 75,
    npcid = 3039,
    emotion = 1,
    name = "荒野魔族伊凡",
    side = 1,
    content = "我们这些魔族虽然也不喜欢你们人类，但是从没想过要害你们，瘟疫的事就连我们也饱受其害，所以没必要对你们说谎。"
    };
getRow(321)->
    #show2Cfg {
    id = 321,
    groupid = 76,
    taskname = "怀疑",
    npcid = 3037,
    emotion = 1,
    name = "巡逻官路易丝",
    side = 1,
    content = "你们真的打败了那些魔族？了不起……他们打算什么时候离开东成郊？"
    };
getRow(322)->
    #show2Cfg {
    id = 322,
    groupid = 76,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "小事一桩，不过那些魔族告诉皮皮，散播瘟疫的不是他们，而是另一伙魔族。或许我们真的误会了他们。"
    };
getRow(323)->
    #show2Cfg {
    id = 323,
    groupid = 76,
    npcid = 3037,
    emotion = 1,
    name = "巡逻官路易丝",
    side = 1,
    content = "魔族的话你居然也敢相信?既然他们说自己不是散播瘟疫的罪魁祸首，那么到底谁做的！"
    };
getRow(324)->
    #show2Cfg {
    id = 324,
    groupid = 76,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "听皮皮慢慢说，似乎是一个名叫吉娜的魔族女人散播的，皮皮曾在阿克勒港口见到过她，她的确是斯诺卡的爪牙，所以我才会相信刚才那个魔族的话。"
    };
getRow(325)->
    #show2Cfg {
    id = 325,
    groupid = 76,
    npcid = 3037,
    emotion = 1,
    name = "巡逻官路易丝",
    side = 1,
    content = "这件事必须有确切的证据才行……对了，丹尼尔长时间守在东成郊平原入口那，他经常与魔族接触，掌握的情况比我更多，你们可以到他再了解一下情况。"
    };
getRow(326)->
    #show2Cfg {
    id = 326,
    groupid = 77,
    taskname = "真话假话",
    npcid = 3038,
    emotion = 1,
    name = "巡逻官丹尼尔",
    side = 1,
    content = "其实有些魔族说的话未必是假的……我长时间在这里的驻守，来到这里生活的魔族大多都很守规矩，很少主动攻击我们。否则我们也不可能平安无事到现在。"
    };
getRow(327)->
    #show2Cfg {
    id = 327,
    groupid = 77,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "哦？皮皮不懂，为什么会这样？"
    };
getRow(328)->
    #show2Cfg {
    id = 328,
    groupid = 77,
    npcid = 3038,
    emotion = 1,
    name = "巡逻官丹尼尔",
    side = 1,
    content = "曾经有几个幼小的魔族告诉我们，他们是跟随自己的父母逃离到这里，魔界似乎出了很严重的状况。"
    };
getRow(329)->
    #show2Cfg {
    id = 329,
    groupid = 77,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "这……皮皮很好奇到底发生了什么事。"
    };
getRow(330)->
    #show2Cfg {
    id = 330,
    groupid = 77,
    npcid = 3038,
    emotion = 1,
    name = "巡逻官丹尼尔",
    side = 1,
    content = "依我看，瘟疫这件事我们不妨先给他们机会解释清楚，然后再请城主大人做决定。不过，现在最要紧的是尽早恢复这里的土壤。"
    };
getRow(331)->
    #show2Cfg {
    id = 331,
    groupid = 78,
    taskname = "魔族的邀请",
    npcid = 2007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "好可怕的橘鬼花……这到底是怎么回事！？"
    };
getRow(332)->
    #show2Cfg {
    id = 332,
    groupid = 78,
    npcid = 3039,
    emotion = 1,
    name = "伊凡",
    side = 1,
    content = "这些橘鬼花就是吉娜之前留下的，幸好你们将它们彻底消灭。否则它们散发出的毒气，足够了毁了东成郊以及平原！"
    };
getRow(333)->
    #show2Cfg {
    id = 333,
    groupid = 78,
    npcid = 2007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "你们这些魔族为什么会离开自己的故乡来到这里，明明知道人类都讨厌你们！"
    };
getRow(334)->
    #show2Cfg {
    id = 334,
    groupid = 78,
    npcid = 3039,
    emotion = 1,
    name = "伊凡",
    side = 1,
    content = "哎哎呀！这可是我们魔族的秘密，既然你们能消灭橘鬼花，就有资格进入[fff000]阿克勒平原区[-]，我们的长老会告诉你们一切的。"
    };
getRow(335)->
    #show2Cfg {
    id = 335,
    groupid = 78,
    npcid = 2007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "哼，若是你们敢撒谎，光明使者发起怒来是很可怕的。"
    };
getRow(336)->
    #show2Cfg {
    id = 336,
    groupid = 79,
    taskname = "荒野魔族（上）",
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "你们好，我们是荒野魔族，阿克勒平原是我们宝贵的栖息之地，请不要驱逐我们……"
    };
getRow(337)->
    #show2Cfg {
    id = 337,
    groupid = 79,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "你们既然是魔族，不应该是在魔界的地域里生活么，为什么要来到人界的地盘生活呢？皮皮不懂，你快点说清楚。"
    };
getRow(338)->
    #show2Cfg {
    id = 338,
    groupid = 79,
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "这种事情只有我们的族长大人有权告诉他人，他就在前面的广场中央，你们去见他吧。"
    };
getRow(339)->
    #show2Cfg {
    id = 339,
    groupid = 79,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "魔族的族长……好吧，皮皮和光明勇士一起去看看。"
    };
getRow(340)->
    #show2Cfg {
    id = 340,
    groupid = 80,
    taskname = "族长的请求",
    npcid = 3057,
    emotion = 1,
    name = "萨博",
    side = 1,
    content = "当初我们这些魔族不满斯诺卡的统治，被斯诺卡放逐。我身为族长必须带领族人寻找一块生活的土地，所以便带着大家来到人界这里。"
    };
getRow(341)->
    #show2Cfg {
    id = 341,
    groupid = 80,
    npcid = 3057,
    emotion = 1,
    name = "萨博",
    side = 1,
    content = "瘟疫的事情我很遗憾，吉娜那个女人最擅长研制毒药和毒素，她散播出的瘟疫，连我们这些同类也受不了。所以请你们相信我的话，荒野魔族不会伤害任何人类和精灵族。"
    };
getRow(342)->
    #show2Cfg {
    id = 342,
    groupid = 80,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "皮皮愿意相信你们，族长大人，你们现在的处境很艰难，我们什么可以帮忙你们的么？"
    };
getRow(343)->
    #show2Cfg {
    id = 343,
    groupid = 80,
    npcid = 3057,
    emotion = 1,
    name = "萨博",
    side = 1,
    content = "吉娜散播出的瘟疫破坏力极强，我们魔族无法接受你们人类研制出的药剂，要是能在里面加上一些[ff0000]蓝血草[-]就可以了。"
    };
getRow(344)->
    #show2Cfg {
    id = 344,
    groupid = 80,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "蓝血草……好的，包在我们身上。"
    };
getRow(345)->
    #show2Cfg {
    id = 345,
    groupid = 82,
    taskname = "困苦的魔族",
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "谢谢你们愿意相信我们，不过我还是建议你们早些离开平原，毕竟大多数族人们还是有点不相信人类，你们在这里很容易引起其他魔族的注意。"
    };
getRow(346)->
    #show2Cfg {
    id = 346,
    groupid = 82,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "没关系，皮皮和光明勇士来到这里就是想彻底消除瘟疫，在这之前，我们不会离开的。对了，族长大人说你们曾反抗斯诺卡的统治，看来即便是同类，斯诺卡那个坏蛋还是惹人讨厌呢。"
    };
getRow(347)->
    #show2Cfg {
    id = 347,
    groupid = 82,
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "斯诺卡原本是阿尔赛德的忠实仆人，他一心想帮助阿尔赛德突破露娜女神的封印。但是我们很清楚要是阿尔萨德再次回到魔界，他肯定会号召大家再次发动战争，我们不想再打仗了。"
    };
getRow(348)->
    #show2Cfg {
    id = 348,
    groupid = 82,
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "当时族长号召了很多魔族们一起反抗斯诺卡和他的手下，却没想到他们是在太强了，我们打不过。所以到最后全都被斯诺卡放逐了……"
    };
getRow(349)->
    #show2Cfg {
    id = 349,
    groupid = 82,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "虽然你们失败了，但是你们好勇敢呢，皮皮相信你们，现在你们有什么需要帮忙的地方尽管开口。"
    };
getRow(350)->
    #show2Cfg {
    id = 350,
    groupid = 83,
    taskname = "魔族的危机",
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "斯诺卡散播的瘟疫严重破坏了阿克勒草原，这里的仅存的农田都已经被污染，再不净化农田的话，大家都要饿肚子了……"
    };
getRow(351)->
    #show2Cfg {
    id = 351,
    groupid = 83,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "该怎么做才能净化农田呢？"
    };
getRow(352)->
    #show2Cfg {
    id = 352,
    groupid = 83,
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "请你们找到一些[ff0000]薄荷草[-]，交给我的同伴艾希，她正在研制净化农田的药剂。"
    };
getRow(353)->
    #show2Cfg {
    id = 353,
    groupid = 84,
    taskname = "寻找艾希",
    npcid = 3058,
    emotion = 1,
    name = "艾希",
    side = 1,
    content = "这是薄荷草！？谢谢你们，这太让人我意外了，人类竟然愿意主动帮助我们魔族。"
    };
getRow(354)->
    #show2Cfg {
    id = 354,
    groupid = 84,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "皮皮和光明勇士已经从族长大人和努努那里知道了你们的事情，我们两人愿意帮助荒野魔族度过危机。"
    };
getRow(355)->
    #show2Cfg {
    id = 355,
    groupid = 84,
    npcid = 3058,
    emotion = 1,
    name = "艾希",
    side = 1,
    content = "是么，那真是太好了！麻烦你到我们的农田一带看看吧，斯诺卡的爪牙为了破坏大家的生活，经常去农田一带捣乱。"
    };
getRow(356)->
    #show2Cfg {
    id = 356,
    groupid = 85,
    taskname = "修复农田",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "真奇怪？薄荷草怎么没有效果呢？"
    };
getRow(357)->
    #show2Cfg {
    id = 357,
    groupid = 85,
    npcid = 3059,
    emotion = 1,
    name = "卡维尔",
    side = 1,
    content = "住手，不要靠近我们的农田。"
    };
getRow(358)->
    #show2Cfg {
    id = 358,
    groupid = 86,
    taskname = "愤怒的卡维尔",
    npcid = 3059,
    emotion = 1,
    name = "卡维尔",
    side = 1,
    content = "你们为什么要进入我们的家园，荒野魔族不欢迎人类，马上离开这里，否则我不客气了！"
    };
getRow(359)->
    #show2Cfg {
    id = 359,
    groupid = 86,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "你好凶哦！皮皮是来帮助你们消除瘟疫的，不会误会我们！"
    };
getRow(360)->
    #show2Cfg {
    id = 360,
    groupid = 86,
    npcid = 3059,
    emotion = 1,
    name = "卡维尔",
    side = 1,
    content = "人类居然会帮助我们魔族，哼，当我是小孩子么？！我再说一遍，马上离开这里！"
    };
getRow(361)->
    #show2Cfg {
    id = 361,
    groupid = 86,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "哼！皮皮才不要和你这样凶的人讲话！光明勇士，我们的药剂不管用，我们去找艾希姐姐问问到底怎么回事吧。"
    };
getRow(362)->
    #show2Cfg {
    id = 362,
    groupid = 87,
    taskname = "修复药剂",
    npcid = 3058,
    emotion = 1,
    name = "艾希",
    side = 1,
    content = "农田那里的事情我已经知道了，我替卡维尔向你们道歉，她曾经被人类伤害过，所以厌恶人类……"
    };
getRow(363)->
    #show2Cfg {
    id = 363,
    groupid = 87,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "哼，皮皮才不跟他一般见识呢！"
    };
getRow(364)->
    #show2Cfg {
    id = 364,
    groupid = 87,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "对了，艾希姐姐，刚刚我们净化农田，薄荷草似乎不起作用哦！"
    };
getRow(365)->
    #show2Cfg {
    id = 365,
    groupid = 87,
    npcid = 3058,
    emotion = 1,
    name = "艾希",
    side = 1,
    content = "那是因为它还没有融合我制作的药剂呢，这是我刚刚研制好的，这次你们再农田试试。"
    };
getRow(366)->
    #show2Cfg {
    id = 366,
    groupid = 88,
    taskname = "保护丹妮",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "别害怕，光明勇士了已经把斯诺卡的手下打败了，现在你已经安全啦。"
    };
getRow(367)->
    #show2Cfg {
    id = 367,
    groupid = 88,
    npcid = 3060,
    emotion = 1,
    name = "丹妮",
    side = 1,
    content = "呜呜，我的家人都被斯诺卡的树人抓走了！巴特鲁去救他们，但现在还没有回来……"
    };
getRow(368)->
    #show2Cfg {
    id = 368,
    groupid = 88,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "啊，别哭了，皮皮最受不了别人哭，你安心待着这里，我和光明勇士去救你的家人。"
    };
getRow(369)->
    #show2Cfg {
    id = 369,
    groupid = 89,
    taskname = "同伴的下落",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "光明勇士，这是魔族留下来的粘液……沿着前面走，或许就能找到他们。"
    };
getRow(370)->
    #show2Cfg {
    id = 370,
    groupid = 90,
    taskname = "寻找同伴(上)",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "喂，你们输了，你们快点放了丹妮的家人！"
    };
getRow(371)->
    #show2Cfg {
    id = 371,
    groupid = 90,
    npcid = 3067,
    emotion = 1,
    name = "独眼怪",
    side = 1,
    content = "哇，饶命啊，我们，我们只是负责抓人，刚刚抓到的那几个魔族都已经被树人老大带走了！"
    };
getRow(372)->
    #show2Cfg {
    id = 372,
    groupid = 90,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "可恶，你们这些帮凶，快说那个树人在哪里？"
    };
getRow(373)->
    #show2Cfg {
    id = 373,
    groupid = 90,
    npcid = 3067,
    emotion = 1,
    name = "独眼怪",
    side = 1,
    content = "哇，不知道，我们真的不知道，求求你们放过我们，我们保证以后再也不做坏事了！"
    };
getRow(374)->
    #show2Cfg {
    id = 374,
    groupid = 90,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "哼，好吧，看在你们诚恳认错的态度上，今天皮皮就放过你们，记住自己说过的话哦！"
    };
getRow(375)->
    #show2Cfg {
    id = 375,
    groupid = 91,
    taskname = "寻找同伴(下)",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "光明勇士，皮皮预感到后面的敌人的实力很强。我们先努力提升到18级再考虑战斗吧。"
    };
getRow(376)->
    #show2Cfg {
    id = 376,
    groupid = 92,
    taskname = "心急的丹妮",
    npcid = 3060,
    emotion = 1,
    name = "丹妮",
    side = 1,
    content = "怎么样？你们找到我的家人了么……"
    };
getRow(377)->
    #show2Cfg {
    id = 377,
    groupid = 92,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "很抱歉，丹妮。皮皮刚刚发现了魔族的粘液就被那些魔族围攻，它们实在太暴躁啦！"
    };
getRow(378)->
    #show2Cfg {
    id = 378,
    groupid = 92,
    npcid = 3060,
    emotion = 1,
    name = "丹妮",
    side = 1,
    content = "斯诺卡的手下都很凶，你们要小心。对了，我听到前面有些动静，可是我不敢一个人去看，或许又是那些魔族出现了呢……"
    };
getRow(379)->
    #show2Cfg {
    id = 379,
    groupid = 92,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "好，我和光明勇士去看看。"
    };
getRow(380)->
    #show2Cfg {
    id = 380,
    groupid = 93,
    taskname = "发现踪迹",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "这次肯定错不了！光明勇士，斯诺卡的手下就在前面不远处，我们快追！"
    };
getRow(381)->
    #show2Cfg {
    id = 381,
    groupid = 94,
    taskname = "偶遇巴特鲁",
    npcid = 3061,
    emotion = 1,
    name = "巴特鲁",
    side = 1,
    content = "奇怪，人类怎么会来到这？这里很危险，你们快走吧！"
    };
getRow(382)->
    #show2Cfg {
    id = 382,
    groupid = 94,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "请问你是不是巴特鲁？"
    };
getRow(383)->
    #show2Cfg {
    id = 383,
    groupid = 94,
    npcid = 3061,
    emotion = 1,
    name = "巴特鲁",
    side = 1,
    content = "不错，你们怎么会知道我的名字？难道是丹妮喊你过来的？"
    };
getRow(384)->
    #show2Cfg {
    id = 384,
    groupid = 94,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "是的，丹妮姐姐很担心她的家人和你的安全，所以皮皮就和同伴一起来救你们了。"
    };
getRow(385)->
    #show2Cfg {
    id = 385,
    groupid = 94,
    npcid = 3061,
    emotion = 1,
    name = "巴特鲁",
    side = 1,
    content = "太好了，魔族树人就在前面，它们的数量很多，我一人不敢擅自靠近它们去救人，只能先躲在暗处等待时机。"
    };
getRow(386)->
    #show2Cfg {
    id = 386,
    groupid = 94,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "你做得很对。接下来的事情交给我们吧，我们一定把丹妮的家人救出来！"
    };
getRow(387)->
    #show2Cfg {
    id = 387,
    groupid = 95,
    taskname = "巴特鲁致谢",
    npcid = 3061,
    emotion = 1,
    name = "巴特鲁",
    side = 1,
    content = "其实刚才我有些不敢相信，居然有人类会来帮助我们魔族。这一次是你们救了大家，谢谢你们！"
    };
getRow(388)->
    #show2Cfg {
    id = 388,
    groupid = 95,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "嘻！你也是个勇敢的人啊，丹妮说，你丝毫不惧怕斯诺卡的手下，一个人就去追他们呢。"
    };
getRow(389)->
    #show2Cfg {
    id = 389,
    groupid = 95,
    npcid = 3061,
    emotion = 1,
    name = "巴特鲁",
    side = 1,
    content = "那是丹妮的家人，如果他们受伤了，丹妮一定很难过，我不想看到她难过的样子……"
    };
getRow(390)->
    #show2Cfg {
    id = 390,
    groupid = 95,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "难道你对她？哦哦哦~~"
    };
getRow(391)->
    #show2Cfg {
    id = 391,
    groupid = 95,
    npcid = 3061,
    emotion = 1,
    name = "巴特鲁",
    side = 1,
    content = "咳咳……不要说出来。对了，我想起一事，那些魔化树人的铠甲有驱除瘟疫效果，不如你们取来一些带回阿克勒城，那里的人类应该需要它。"
    };
getRow(392)->
    #show2Cfg {
    id = 392,
    groupid = 95,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "你想的真周到，光明勇士我们马上行动起来。"
    };
getRow(393)->
    #show2Cfg {
    id = 393,
    groupid = 96,
    taskname = "隐瞒",
    npcid = 3060,
    emotion = 1,
    name = "丹妮",
    side = 1,
    content = "谢谢你们救回我的家人，其实之前我向你们隐瞒了一件事……"
    };
getRow(394)->
    #show2Cfg {
    id = 394,
    groupid = 96,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "啊？什么事？"
    };
getRow(395)->
    #show2Cfg {
    id = 395,
    groupid = 96,
    npcid = 3060,
    emotion = 1,
    name = "丹妮",
    side = 1,
    content = "我也是擅长研制灵药一类的魔族。在逃离魔界时，我从吉娜那偷走了一份毒药，本打算在这和艾希姐姐一起研制出解毒的办法。却不想被吉娜发现了，于是她强行抓走了我的家人。"
    };
getRow(396)->
    #show2Cfg {
    id = 396,
    groupid = 96,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "原来如此，那你们找到解毒的办法了么？吉娜没有达到目的不会放过你们的。"
    };
getRow(397)->
    #show2Cfg {
    id = 397,
    groupid = 96,
    npcid = 3060,
    emotion = 1,
    name = "丹妮",
    side = 1,
    content = "没有……我们在这里生活毕竟能力有限，所以我希望你们带走这份毒药，在阿克勒城肯定会有更优秀的药剂师，把东西交给他们，或许能研制出克制吉娜毒药的药剂。"
    };
getRow(398)->
    #show2Cfg {
    id = 398,
    groupid = 96,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "没问题，卡卡先生是一个了不起的药剂师，他一定会对这件事情感兴趣的。那块毒药应该放在艾希姐姐那里吧，皮皮和光明勇士马上去取来。"
    };
getRow(399)->
    #show2Cfg {
    id = 399,
    groupid = 97,
    taskname = "艾希的请求",
    npcid = 3058,
    emotion = 1,
    name = "艾希",
    side = 1,
    content = "一切就拜托你们了，希望你们早日研制出解毒药剂。对了，还有一事要拜托你们，回到阿克勒城以后请向城主解释这里的情况，我们荒野魔族只是想找到一块生活的地方，绝不会打扰人类的。"
    };
getRow(400)->
    #show2Cfg {
    id = 400,
    groupid = 97,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "艾希姐姐放心，皮皮会向城主大人解释清楚的。不过呢，平原以外的地方建议你们暂时不要进入，不然被其他不明真相的人类看到又会引起误会。"
    };
getRow(401)->
    #show2Cfg {
    id = 401,
    groupid = 97,
    npcid = 3058,
    emotion = 1,
    name = "艾希",
    side = 1,
    content = "好的，你的话我会转达其他族人的。再一次谢谢你们的帮助。"
    };
getRow(402)->
    #show2Cfg {
    id = 402,
    groupid = 98,
    taskname = "族长的馈赠",
    npcid = 3057,
    emotion = 1,
    name = "萨博",
    side = 1,
    content = "你们来的正好，我知道你们在寻找生命石，斯诺卡也在寻找它！我这里藏了一块就送给你们，你们带上它赶快离开平原！"
    };
getRow(403)->
    #show2Cfg {
    id = 403,
    groupid = 98,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "族长大人到底发生了什么事？"
    };
getRow(404)->
    #show2Cfg {
    id = 404,
    groupid = 98,
    npcid = 3057,
    emotion = 1,
    name = "萨博",
    side = 1,
    content = "再过不了多久，吉娜会带领魔族袭击这里，我要带着族人与他们战斗。所以，你们两个人快点走吧！"
    };
getRow(405)->
    #show2Cfg {
    id = 405,
    groupid = 98,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "族长大人，皮皮和光明勇士很感谢您愿意把生命石交给我们，但是皮皮和光明勇士要留下帮助你们打败那些欺负你们的魔族！"
    };
getRow(406)->
    #show2Cfg {
    id = 406,
    groupid = 100,
    taskname = "告别平原",
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "你们这就要离开了？不在多待一会吗？努努第一次遇到你们这样勇敢善良的人类，很高兴能认识你们！"
    };
getRow(407)->
    #show2Cfg {
    id = 407,
    groupid = 100,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "皮皮也一样，只是现在我们必须要走啦。等有一天我们彻底打败了魔族，再回到这来看你们！"
    };
getRow(408)->
    #show2Cfg {
    id = 408,
    groupid = 100,
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "一定要说话算数哦！"
    };
getRow(409)->
    #show2Cfg {
    id = 409,
    groupid = 100,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "那当然，我们来拉拉勾！~"
    };
getRow(410)->
    #show2Cfg {
    id = 410,
    groupid = 101,
    taskname = "苍空塔守卫",
    npcid = 3072,
    emotion = 1,
    name = "科林",
    side = 1,
    content = "城主有令，陌生人必须请出示身份证明，否则马上离开苍空之塔！"
    };
getRow(411)->
    #show2Cfg {
    id = 411,
    groupid = 101,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "哎！有话好好说，皮皮和光明勇士是受阿克勒城主大人的委托，前来这里调查生命之石的下落，我们是好人啦！"
    };
getRow(412)->
    #show2Cfg {
    id = 412,
    groupid = 101,
    npcid = 3072,
    emotion = 1,
    name = "科林",
    side = 1,
    content = "竟然是阿克勒城的人，看来是我误会你们了。我们的城主大人与阿克勒主人交好，既然你们是朋友，我就允许你们在城里活动，不过要注意不要影响到别人。"
    };
getRow(413)->
    #show2Cfg {
    id = 413,
    groupid = 101,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "好的，光明勇士，皮皮肚子饿了，我们去找点吃的吧。"
    };
getRow(414)->
    #show2Cfg {
    id = 414,
    groupid = 101,
    npcid = 3072,
    emotion = 1,
    name = "科林",
    side = 1,
    content = "前面有冻鱼，是苍空之塔特有的食物，你们可以去尝尝。"
    };
getRow(415)->
    #show2Cfg {
    id = 415,
    groupid = 102,
    taskname = "入侵苍空塔",
    npcid = 3072,
    emotion = 1,
    name = "科林",
    side = 1,
    content = "不久前大家知道阿克勒城那里混入了的魔族，现在那边的情况怎么样？"
    };
getRow(416)->
    #show2Cfg {
    id = 416,
    groupid = 102,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "还好啦，那些魔族都已经被我们抓住了呢！"
    };
getRow(417)->
    #show2Cfg {
    id = 417,
    groupid = 102,
    npcid = 3072,
    emotion = 1,
    name = "科林",
    side = 1,
    content = "你们竟然是除魔的勇士！请原谅我刚才的无礼，现在的苍空塔也混入了魔族，所以大家才会如此紧张。"
    };
getRow(418)->
    #show2Cfg {
    id = 418,
    groupid = 102,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "因为吃到美味的鱼肉，刚才的事皮皮已经不生气啦。城主大人在哪里，皮皮想见他。"
    };
getRow(419)->
    #show2Cfg {
    id = 419,
    groupid = 102,
    npcid = 3072,
    emotion = 1,
    name = "科林",
    side = 1,
    content = "经过前面的冰桥，你们会遇见雪莉尔长官，城主大人就在她附近。"
    };
getRow(420)->
    #show2Cfg {
    id = 420,
    groupid = 103,
    taskname = "守城长官",
    npcid = 3073,
    emotion = 1,
    name = "谢莉尔",
    side = 1,
    content = "士兵们听令，与我一起击退魔族！"
    };
getRow(421)->
    #show2Cfg {
    id = 421,
    groupid = 103,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "好帅气的女长官，光明勇士，我们和她一起去击退魔族吧。"
    };
getRow(422)->
    #show2Cfg {
    id = 422,
    groupid = 104,
    taskname = "引路",
    npcid = 3073,
    emotion = 1,
    name = "谢莉尔",
    side = 1,
    content = "谢谢你们出手帮忙，你们是从阿克勒城来到这里的么？我们的城主大人就前面里，他等你们很久了。"
    };
getRow(423)->
    #show2Cfg {
    id = 423,
    groupid = 104,
    npcid = 3073,
    emotion = 1,
    name = "谢莉尔",
    side = 1,
    content = "另外就如你们所见，苍空之塔已经混入了大量的魔族，若你们在其他地方发现了他们的踪迹，请及时通知我。"
    };
getRow(424)->
    #show2Cfg {
    id = 424,
    groupid = 105,
    taskname = "苍空塔城主",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "城主大人你好，皮皮和光明勇士受阿克勒城主之意来到苍空塔寻您，希望您透露一些关于生命之石的线索。"
    };
getRow(425)->
    #show2Cfg {
    id = 425,
    groupid = 105,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "勇士们，如果你们想得到我手中的生命之石需得帮我消灭掉苍空塔内的魔族。"
    };
getRow(426)->
    #show2Cfg {
    id = 426,
    groupid = 105,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "皮皮很乐意这样做，不过这里的魔族数量不少，我们可能要在这多待几天呢。"
    };
getRow(427)->
    #show2Cfg {
    id = 427,
    groupid = 105,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "这个没问题，只要你们能帮我驱赶魔族，我不仅奉上生命之石，还会送你们美味的鱼肉。"
    };
getRow(428)->
    #show2Cfg {
    id = 428,
    groupid = 106,
    taskname = "魔族的线索（上）",
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "那些魔族好可恶，进入苍空之塔后，抢走了我们不少鱼肉。"
    };
getRow(429)->
    #show2Cfg {
    id = 429,
    groupid = 106,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "咦？那些魔族竟然和皮皮一样也喜欢吃鱼呢！"
    };
getRow(430)->
    #show2Cfg {
    id = 430,
    groupid = 106,
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "他们尤其喜欢在晚上来偷大家准备的鱼肉，这位勇士，如果能帮大伙捉住他们，我们会支付你们酬金的。"
    };
getRow(431)->
    #show2Cfg {
    id = 431,
    groupid = 106,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "酬金！酬金！皮皮，哦不，光明勇士一定会帮助大家的。"
    };
getRow(432)->
    #show2Cfg {
    id = 432,
    groupid = 107,
    taskname = "魔族的线索（下）",
    npcid = 3073,
    emotion = 1,
    name = "谢莉尔",
    side = 1,
    content = "城主大人告诉我，你们愿意帮忙一起对付魔族？"
    };
getRow(433)->
    #show2Cfg {
    id = 433,
    groupid = 107,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "是的，皮皮要抓住那些偷鱼的家伙！"
    };
getRow(434)->
    #show2Cfg {
    id = 434,
    groupid = 107,
    npcid = 3073,
    emotion = 1,
    name = "谢莉尔",
    side = 1,
    content = "雷纳德应该已经告诉过你们，魔族喜欢在夜晚行动，几个小时以后我们再碰头。"
    };
getRow(435)->
    #show2Cfg {
    id = 435,
    groupid = 107,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "咦？那边的鱼肉怎么自己动了？哎哎，别跑啊！"
    };
getRow(436)->
    #show2Cfg {
    id = 436,
    groupid = 108,
    taskname = "偷鱼贼别跑",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "哼，偷鱼贼，快点放下鱼肉，否则皮皮生气了！"
    };
getRow(437)->
    #show2Cfg {
    id = 437,
    groupid = 108,
    npcid = 3081,
    emotion = 1,
    name = "喵老大",
    side = 1,
    content = "哼，来追我们啊！"
    };
getRow(438)->
    #show2Cfg {
    id = 438,
    groupid = 109,
    taskname = "追回鱼肉",
    npcid = 3081,
    emotion = 1,
    name = "喵老大",
    side = 1,
    content = "喵呜，抢走我们的鱼，我是不会善罢甘休的！"
    };
getRow(439)->
    #show2Cfg {
    id = 439,
    groupid = 109,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "这鱼肉的味道好香，可惜皮皮已经吃不下了。光明勇士我们把抢回来的鱼肉放回原地吧。"
    };
getRow(440)->
    #show2Cfg {
    id = 440,
    groupid = 110,
    taskname = "危险的信号",
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "谢谢你们帮我们抢回了鱼肉，不过那些贪婪的魔族是不会罢休的"
    };
getRow(441)->
    #show2Cfg {
    id = 441,
    groupid = 110,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "别担心，皮皮和光明勇士已经答应了城主大人，帮你们消灭这些讨厌的魔族。"
    };
getRow(442)->
    #show2Cfg {
    id = 442,
    groupid = 110,
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "除了生命之石，苍空之塔的宝物也是他们觊觎的对象，你们要当心。"
    };
getRow(443)->
    #show2Cfg {
    id = 443,
    groupid = 110,
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "光明勇士，魔族成员很可能藏身于城主大人的帐篷周围，若有发现请立即控制住他们。"
    };
getRow(444)->
    #show2Cfg {
    id = 444,
    groupid = 111,
    taskname = "衰弱的女神",
    npcid = 3076,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "很高兴在这里见到你们，这段时间辛苦你们了！"
    };
getRow(445)->
    #show2Cfg {
    id = 445,
    groupid = 111,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "女神大人，您为什么会出现在这里？"
    };
getRow(446)->
    #show2Cfg {
    id = 446,
    groupid = 111,
    npcid = 3076,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "阿尔赛德的封印越加不稳，我不知道自己还能坚持多久……生命之石的线索你们可有发现么？"
    };
getRow(447)->
    #show2Cfg {
    id = 447,
    groupid = 111,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "我们从荒野魔族那里得到一块生命之石，女神大人，你看它在这。"
    };
getRow(448)->
    #show2Cfg {
    id = 448,
    groupid = 112,
    taskname = "袭击女神",
    npcid = 3076,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "这里有魔族的气味，你们要当心！"
    };
getRow(449)->
    #show2Cfg {
    id = 449,
    groupid = 112,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "光明勇士我们来保护女神！"
    };
getRow(450)->
    #show2Cfg {
    id = 450,
    groupid = 113,
    taskname = "女神的预言",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "女神大人，你的力量……"
    };
getRow(451)->
    #show2Cfg {
    id = 451,
    groupid = 113,
    npcid = 3076,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "没错，越来越弱……随时可能被阿尔萨德的魔力反噬。苍空之塔内已经出现了大量的魔族，在不久这里的人恐怕就要被魔气侵染了。"
    };
getRow(452)->
    #show2Cfg {
    id = 452,
    groupid = 113,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "啊，那我们该怎么办，这里没有药剂师啊！"
    };
getRow(453)->
    #show2Cfg {
    id = 453,
    groupid = 113,
    npcid = 3076,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "这些冰晶已经被我注入灵力，你们将它放到水中，可以为大家暂时抵挡魔气。"
    };
getRow(454)->
    #show2Cfg {
    id = 454,
    groupid = 114,
    taskname = "解释",
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "刚刚你们往水里投放了什么？"
    };
getRow(455)->
    #show2Cfg {
    id = 455,
    groupid = 114,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "我们察觉到魔气即将污染这里的人，所以将注入灵力的晶体投入水中，帮助大家抵御一阵。"
    };
getRow(456)->
    #show2Cfg {
    id = 456,
    groupid = 114,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "原来如此，谢谢你们……"
    };
getRow(457)->
    #show2Cfg {
    id = 457,
    groupid = 114,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "海伦夫人家的周围出现了魔族的身影，请你过去看看吧。"
    };
getRow(458)->
    #show2Cfg {
    id = 458,
    groupid = 115,
    taskname = "独居的海伦",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "这位夫人你没事吧……"
    };
getRow(459)->
    #show2Cfg {
    id = 459,
    groupid = 115,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "我还好，谢谢你们……"
    };
getRow(460)->
    #show2Cfg {
    id = 460,
    groupid = 115,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "罗宾先生发现您家中附近出现了魔族，不过它们已经被我们赶走了，你不需要在害怕了哦。"
    };
getRow(461)->
    #show2Cfg {
    id = 461,
    groupid = 115,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "！……那，那实在太好了。"
    };
getRow(462)->
    #show2Cfg {
    id = 462,
    groupid = 116,
    taskname = "奇怪的药丸",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "咦，这是什么？"
    };
getRow(463)->
    #show2Cfg {
    id = 463,
    groupid = 116,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "咳咳咳！好苦啊，原来是药丸，讨厌！"
    };
getRow(464)->
    #show2Cfg {
    id = 464,
    groupid = 117,
    taskname = "海伦母子（上）",
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "海伦夫人自从儿子病了以后就很少与大家走动，她几乎把所有时间都花在了照料儿子身上。"
    };
getRow(465)->
    #show2Cfg {
    id = 465,
    groupid = 117,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "她的孩子得了什么病，居然这么严重，难道没有大夫能治好他么？"
    };
getRow(466)->
    #show2Cfg {
    id = 466,
    groupid = 117,
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "没有，那孩子现在只能靠着昂贵的药材支撑。哎，可怜的很啊。"
    };
getRow(467)->
    #show2Cfg {
    id = 467,
    groupid = 118,
    taskname = "海伦母子（下）",
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "当初海伦的孩子病了后，海伦曾哭着求我将自己的私人医生带去家中看病。"
    };
getRow(468)->
    #show2Cfg {
    id = 468,
    groupid = 118,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "结果我的私人医生对那孩子的病也束手无策，海伦夫人当时就收到了极大的刺激。"
    };
getRow(469)->
    #show2Cfg {
    id = 469,
    groupid = 118,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "好可怜……那后来的呢？"
    };
getRow(470)->
    #show2Cfg {
    id = 470,
    groupid = 118,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "再后来，海伦就拒绝了所有医生再去她家。从那时候开始海伦就独自一人照顾孩子直到现在。"
    };
getRow(471)->
    #show2Cfg {
    id = 471,
    groupid = 118,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "呜呜……城主大人，海伦夫人好可怜，如果她需要我们帮忙的话，皮皮一定会尽力而为。"
    };
getRow(472)->
    #show2Cfg {
    id = 472,
    groupid = 119,
    taskname = "女神战甲",
    npcid = 3076,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "光明勇士，我预感到这里过不久就会有高级魔族降临，这件战甲就赐予你，它可以助你一臂之力。"
    };
getRow(473)->
    #show2Cfg {
    id = 473,
    groupid = 119,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "哇！好漂亮的战甲，光明勇士你赶快穿上让皮皮看看吧。"
    };
getRow(474)->
    #show2Cfg {
    id = 474,
    groupid = 120,
    taskname = "魔族气息",
    npcid = 3076,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "魔族的气息又出现了，你们快去吧。"
    };
getRow(475)->
    #show2Cfg {
    id = 475,
    groupid = 120,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "恩……又是海伦夫人，光明勇士这次我们先藏起来，看看到底是什么情况。"
    };
getRow(476)->
    #show2Cfg {
    id = 476,
    groupid = 121,
    taskname = "疑点",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "这是！海伦夫人难道她……！"
    };
getRow(477)->
    #show2Cfg {
    id = 477,
    groupid = 122,
    taskname = "蛛丝马迹",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "光明勇士，我们得把自己发现的鳞片马上交给城主大人！海伦夫人很可能是潜入在仓库之塔内的魔族爪牙。"
    };
getRow(478)->
    #show2Cfg {
    id = 478,
    groupid = 123,
    taskname = "坦白",
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "你的意思是海伦夫人与魔族有往来，这怎么可能……小丫头你不会是看错了吧？"
    };
getRow(479)->
    #show2Cfg {
    id = 479,
    groupid = 123,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "皮皮没有认错，这是魔族特有的鳞片。"
    };
getRow(480)->
    #show2Cfg {
    id = 480,
    groupid = 123,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "好吧，我允许你们继续调查海伦的情况，只是不到万不得已不要伤害她和她的家人。"
    };
getRow(481)->
    #show2Cfg {
    id = 481,
    groupid = 124,
    taskname = "相信",
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "海伦夫人她……无论看到什么情形，请你们不要伤害她和她的孩子。"
    };
getRow(482)->
    #show2Cfg {
    id = 482,
    groupid = 124,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "先生你……皮皮知道了。"
    };
getRow(483)->
    #show2Cfg {
    id = 483,
    groupid = 125,
    taskname = "抵赖",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "夫人，这是我们在你家附近发现的魔族鳞片，请问这到底是怎么回事呢？"
    };
getRow(484)->
    #show2Cfg {
    id = 484,
    groupid = 125,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "！胡说，我的家怎么会有魔族鳞片，请你们赶快离开！"
    };
getRow(485)->
    #show2Cfg {
    id = 485,
    groupid = 125,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "做贼心虚，皮皮亲眼看到的，海伦夫人别再掩饰了！"
    };
getRow(486)->
    #show2Cfg {
    id = 486,
    groupid = 126,
    taskname = "出击",
    npcid = 3082,
    emotion = 1,
    name = "麦克",
    side = 1,
    content = "母亲，好痛啊……"
    };
getRow(487)->
    #show2Cfg {
    id = 487,
    groupid = 126,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "住手！不要伤害我的孩子！"
    };
getRow(488)->
    #show2Cfg {
    id = 488,
    groupid = 126,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "啊……他居然就是你的儿子？！"
    };
getRow(489)->
    #show2Cfg {
    id = 489,
    groupid = 127,
    taskname = "真相",
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "求求你们放过我的孩子，只要你们肯放了他，我愿意承担一切罪责！"
    };
getRow(490)->
    #show2Cfg {
    id = 490,
    groupid = 127,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "皮皮不懂？海伦夫人，你明明是人类为什么你的孩子会是魔族呢？"
    };
getRow(491)->
    #show2Cfg {
    id = 491,
    groupid = 127,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "呜，当初我的孩子已经无药可救，是魔族提供了药物才支撑到现在。"
    };
getRow(492)->
    #show2Cfg {
    id = 492,
    groupid = 127,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "可是在魔药的作用下，我的孩子渐渐变成魔族的样子，可无论怎样，他都是我的孩子啊……"
    };
getRow(493)->
    #show2Cfg {
    id = 493,
    groupid = 128,
    taskname = "劝告",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "海伦夫人，你的孩子如果继续服用魔药，总有一天会彻底变成怪物，到那时你一定会后悔的……"
    };
getRow(494)->
    #show2Cfg {
    id = 494,
    groupid = 128,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "那……那我该怎么办？"
    };
getRow(495)->
    #show2Cfg {
    id = 495,
    groupid = 128,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "皮皮有驱魔药的制作卷轴，只需要找到火龙果就可以开始制作了。"
    };
getRow(496)->
    #show2Cfg {
    id = 496,
    groupid = 129,
    taskname = "意外",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "怎么会这样……驱魔药居然不起作用！海伦夫人，我……"
    };
getRow(497)->
    #show2Cfg {
    id = 497,
    groupid = 129,
    npcid = 3077,
    emotion = 1,
    name = "海伦",
    side = 1,
    content = "现在该怎么办？我的孩子，我的孩子！"
    };
getRow(498)->
    #show2Cfg {
    id = 498,
    groupid = 130,
    taskname = "失控的孩子",
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "呜……孩子你快点清醒过来，我是你的母亲。"
    };
getRow(499)->
    #show2Cfg {
    id = 499,
    groupid = 130,
    npcid = 3082,
    emotion = 1,
    name = "麦克",
    side = 1,
    content = "母，母亲……呜哇哇！"
    };
getRow(500)->
    #show2Cfg {
    id = 500,
    groupid = 130,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "都是我不好……"
    };
getRow(501)->
    #show2Cfg {
    id = 501,
    groupid = 130,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "孩子不要怕，母亲就在这一直陪着你。"
    };
getRow(502)->
    #show2Cfg {
    id = 502,
    groupid = 131,
    taskname = "海伦的朋友",
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "海伦夫人的事情大家很遗憾，但是作为她的朋友，我还是感谢你们帮助她。"
    };
getRow(503)->
    #show2Cfg {
    id = 503,
    groupid = 131,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "很抱歉，皮皮还是没能挽救海伦夫人母子。"
    };
getRow(504)->
    #show2Cfg {
    id = 504,
    groupid = 132,
    taskname = "失窃",
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "差点忘了正事，城主大人告诉我，你们愿意协助大家对抗魔族是么？"
    };
getRow(505)->
    #show2Cfg {
    id = 505,
    groupid = 132,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "是的，现在还有什么需要帮忙？"
    };
getRow(506)->
    #show2Cfg {
    id = 506,
    groupid = 132,
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "马修传来消息，苍空之塔的宝石被盗走了，城主大人现在十分着急，下令我们竭尽全力找出盗宝者。"
    };
getRow(507)->
    #show2Cfg {
    id = 507,
    groupid = 132,
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "你们在干活前，能不能先给我寻来瓶伏特加，这该死的鬼天气太冷了。"
    };
getRow(508)->
    #show2Cfg {
    id = 508,
    groupid = 132,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "（原来西蒙先生是个酒鬼……）"
    };
getRow(509)->
    #show2Cfg {
    id = 509,
    groupid = 133,
    taskname = "西蒙的委托",
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "呵，伏特加，我的最爱！嗝~"
    };
getRow(510)->
    #show2Cfg {
    id = 510,
    groupid = 133,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "西蒙大叔，你先别顾着喝酒，快点告诉皮皮，那些盗宝的魔族去了哪？"
    };
getRow(511)->
    #show2Cfg {
    id = 511,
    groupid = 133,
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "盗宝事件发生后，城主下令全城戒严，一些低级魔族很难逃出这里。这些魔族就交给你们了！"
    };
getRow(512)->
    #show2Cfg {
    id = 512,
    groupid = 134,
    taskname = "寻找盗宝者（下）",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "抓住你们了，快说快说，宝物是不是被你们拿走了？"
    };
getRow(513)->
    #show2Cfg {
    id = 513,
    groupid = 134,
    npcid = 3083,
    emotion = 1,
    name = "吸血蝙蝠",
    side = 1,
    content = "……我们是斯诺卡大人忠实的信徒，任何事都不会告诉你们的！"
    };
getRow(514)->
    #show2Cfg {
    id = 514,
    groupid = 134,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "你们！"
    };
getRow(515)->
    #show2Cfg {
    id = 515,
    groupid = 135,
    taskname = "苍空塔禁区",
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "前面就是苍空塔禁区，只有马修守在那里，宝物失窃的事情只有他最清楚……"
    };
getRow(516)->
    #show2Cfg {
    id = 516,
    groupid = 135,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "马修是谁？"
    };
getRow(517)->
    #show2Cfg {
    id = 517,
    groupid = 135,
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "马修是城主大人的最信赖的伙伴，也是苍空塔的守门人。我要提醒你们，他的脾气很坏，你们当心些。"
    };
getRow(518)->
    #show2Cfg {
    id = 518,
    groupid = 135,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "又是凶巴巴的大叔，皮皮不喜欢……"
    };
getRow(519)->
    #show2Cfg {
    id = 519,
    groupid = 136,
    taskname = "投其所好",
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "哈哈，你们要学会投其所好。这个给你，马修见到了应该不会为难你们。"
    };
getRow(520)->
    #show2Cfg {
    id = 520,
    groupid = 137,
    taskname = "守塔人马修",
    npcid = 3079,
    emotion = 1,
    name = "马修",
    side = 1,
    content = "你们就是罗宾口中提起的光明勇士吧，来得正好。魔族已经围住了苍空塔，快来帮忙！"
    };
getRow(521)->
    #show2Cfg {
    id = 521,
    groupid = 137,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "马修大叔，西蒙很担心你。所以我们就立即赶过来了。"
    };
getRow(522)->
    #show2Cfg {
    id = 522,
    groupid = 138,
    taskname = "苍空塔魔气",
    npcid = 3079,
    emotion = 1,
    name = "马修",
    side = 1,
    content = "魔族觊觎罗宾的宝物，我要死守这里，不能让魔族得逞。"
    };
getRow(523)->
    #show2Cfg {
    id = 523,
    groupid = 138,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "马修大叔，你的灵力不足以对抗魔气。皮皮建议你还是早些离开这里，不然被魔气所侵蚀会很痛苦的。"
    };
getRow(524)->
    #show2Cfg {
    id = 524,
    groupid = 138,
    npcid = 3079,
    emotion = 1,
    name = "马修",
    side = 1,
    content = "不，我绝不离开这里。"
    };
getRow(525)->
    #show2Cfg {
    id = 525,
    groupid = 139,
    taskname = "塔顶之战",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "放下宝物，否则皮皮就不客气了！"
    };
getRow(526)->
    #show2Cfg {
    id = 526,
    groupid = 139,
    npcid = 3084,
    emotion = 1,
    name = "狂暴魔龙",
    side = 1,
    content = "小丫头不要多管闲事，否则本座就把你吃掉！"
    };
getRow(527)->
    #show2Cfg {
    id = 527,
    groupid = 140,
    taskname = "消失的宝物",
    npcid = 3079,
    emotion = 1,
    name = "马修",
    side = 1,
    content = "宝物怎么不见了？你们从魔龙那里没有发现么？"
    };
getRow(528)->
    #show2Cfg {
    id = 528,
    groupid = 140,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "咦！皮皮刚才什么也没看到啊！？"
    };
getRow(529)->
    #show2Cfg {
    id = 529,
    groupid = 140,
    npcid = 3079,
    emotion = 1,
    name = "马修",
    side = 1,
    content = "该不会是你们浑水摸鱼吧，我要把这件事告诉罗宾！"
    };
getRow(530)->
    #show2Cfg {
    id = 530,
    groupid = 140,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "你乱讲！皮皮和光明使者才没有拿走宝物呢。哼，你等着，我们一定把宝物找到！"
    };
getRow(531)->
    #show2Cfg {
    id = 531,
    groupid = 140,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "光明勇士你瞧，前面那个发光的箱子……"
    };
getRow(532)->
    #show2Cfg {
    id = 532,
    groupid = 141,
    taskname = "马修的道歉",
    npcid = 3079,
    emotion = 1,
    name = "马修",
    side = 1,
    content = "对不起，刚刚是我误会你们了……"
    };
getRow(533)->
    #show2Cfg {
    id = 533,
    groupid = 141,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "……"
    };
getRow(534)->
    #show2Cfg {
    id = 534,
    groupid = 141,
    npcid = 3079,
    emotion = 1,
    name = "马修",
    side = 1,
    content = "小姑娘不要生气了，真的是我错怪你们了。"
    };
getRow(535)->
    #show2Cfg {
    id = 535,
    groupid = 141,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "马修大叔，这一次皮皮就原谅你，希望你以后能克制你的坏脾气哦。"
    };
getRow(536)->
    #show2Cfg {
    id = 536,
    groupid = 142,
    taskname = "城主千金",
    npcid = 3080,
    emotion = 1,
    name = "伊娃",
    side = 1,
    content = "嗨，我在这里等你们久了，你们就是赶走魔族的光明勇士吧？"
    };
getRow(537)->
    #show2Cfg {
    id = 537,
    groupid = 142,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "你是？"
    };
getRow(538)->
    #show2Cfg {
    id = 538,
    groupid = 142,
    npcid = 3080,
    emotion = 1,
    name = "伊娃",
    side = 1,
    content = "哎呀，忘了自我介绍，我是伊娃，罗宾是我的父亲。"
    };
getRow(539)->
    #show2Cfg {
    id = 539,
    groupid = 142,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "原来是城主的千金，你找我们有什么事？"
    };
getRow(540)->
    #show2Cfg {
    id = 540,
    groupid = 143,
    taskname = "伊娃指路",
    npcid = 3080,
    emotion = 1,
    name = "伊娃",
    side = 1,
    content = "父亲已经把你们的事告诉我了，伊娃很感谢你们帮忙。"
    };
getRow(541)->
    #show2Cfg {
    id = 541,
    groupid = 143,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "小事一桩，伊娃姐姐，我们要继续出发了，请你告诉我们出口在哪？"
    };
getRow(542)->
    #show2Cfg {
    id = 542,
    groupid = 143,
    npcid = 3080,
    emotion = 1,
    name = "伊娃",
    side = 1,
    content = "一直往前走就是苍空之塔的出口了，接下来你们会到达海洋之心，那里居住着很多人鱼族，他们都很友好。"
    };
getRow(543)->
    #show2Cfg {
    id = 543,
    groupid = 143,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "谢谢你！对了，城主大人之前承诺过的生命石……"
    };
getRow(544)->
    #show2Cfg {
    id = 544,
    groupid = 143,
    npcid = 3080,
    emotion = 1,
    name = "伊娃",
    side = 1,
    content = "哈哈，我当然记得，这是父亲托我转交给你们的生命石，请务必收好它。"
    };
getRow(545)->
    #show2Cfg {
    id = 545,
    groupid = 144,
    taskname = "离开苍空塔",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "可恶，这些魔族居然敢偷袭我们，光明勇士前面就是出口，到了海洋之心以后继续调查生命石的下落吧。"
    };
getRow(546)->
    #show2Cfg {
    id = 546,
    groupid = 145,
    taskname = "海洋之城",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "哇！皮皮第一次见到这么美丽的地方。"
    };
getRow(547)->
    #show2Cfg {
    id = 547,
    groupid = 145,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "光明勇士，你看这里好多漂亮的海藻在摆动呢，跟皮皮一起进去吧。"
    };
getRow(548)->
    #show2Cfg {
    id = 548,
    groupid = 146,
    taskname = "发现",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "咦？光明勇士快看前面那个闪闪发光的东西……"
    };
getRow(549)->
    #show2Cfg {
    id = 549,
    groupid = 147,
    taskname = "进入海之城",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "你们是什么人？国王有令，外来人不得随意进入海之城。"
    };
getRow(550)->
    #show2Cfg {
    id = 550,
    groupid = 147,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "哇，你长得好可爱，皮皮很喜欢你的帽子呢！我和光明勇士受阿克勒城主的委托调查魔族入侵一事，经过苍空之塔来到这里。"
    };
getRow(551)->
    #show2Cfg {
    id = 551,
    groupid = 147,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "魔族……这么说你们很厉害喽?"
    };
getRow(552)->
    #show2Cfg {
    id = 552,
    groupid = 147,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "嗯？！"
    };
getRow(553)->
    #show2Cfg {
    id = 553,
    groupid = 147,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "动手吧，让我见识见识你们的本领！"
    };
getRow(554)->
    #show2Cfg {
    id = 554,
    groupid = 148,
    taskname = "怒火",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "喂喂喂，这到底是怎么回事啊，皮皮都夸你可爱了，你居然还这样对我们，哼！"
    };
getRow(555)->
    #show2Cfg {
    id = 555,
    groupid = 148,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "小可爱你先别生气，刚才你们的表现令我非常满意，我向请你们参加国王的悬赏，不知你们有兴趣么？"
    };
getRow(556)->
    #show2Cfg {
    id = 556,
    groupid = 148,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "国王的悬赏？那是什么情况？"
    };
getRow(557)->
    #show2Cfg {
    id = 557,
    groupid = 148,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "到我身旁的告示栏去看看，你们会明白。"
    };
getRow(558)->
    #show2Cfg {
    id = 558,
    groupid = 149,
    taskname = "国王的悬赏",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "国王陛下最宝贝的女儿突然失踪，现在他正在召集人手四处寻找公主。"
    };
getRow(559)->
    #show2Cfg {
    id = 559,
    groupid = 149,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "光明勇士，我们若能帮助他找到女儿，或许国王陛下会很乐意告诉我们关于魔族和生命石的线索呢！"
    };
getRow(560)->
    #show2Cfg {
    id = 560,
    groupid = 150,
    taskname = "接受悬赏",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "我就知道你们一定会接受我们国王的悬赏，海之国的宫殿就在前面，你们一直走就能找到。"
    };
getRow(561)->
    #show2Cfg {
    id = 561,
    groupid = 150,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "谢谢你，不过皮皮好奇你为什么要告诉我们这些呢？"
    };
getRow(562)->
    #show2Cfg {
    id = 562,
    groupid = 150,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "额……为国王分忧是我们身为城民的职责，况且贝尔公主那么善良，我们大家都希望她能早日平安回来。"
    };
getRow(563)->
    #show2Cfg {
    id = 563,
    groupid = 150,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "原来如此，等我们找到了贝尔公主，会把你的话转达给她。"
    };
getRow(564)->
    #show2Cfg {
    id = 564,
    groupid = 150,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "谢谢，不过我要提醒你们，在见到国王之前，你们会先见到国王的总管凡卡大人，想顺利见到国王陛下，你们一定要努力想办法让凡卡大人高兴。"
    };
getRow(565)->
    #show2Cfg {
    id = 565,
    groupid = 151,
    taskname = "准备礼物",
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "凡卡大人非常喜欢收集精美的宝石，不久前他却丢失了一块贵重的宝石，连续几天都闷闷不乐。"
    };
getRow(566)->
    #show2Cfg {
    id = 566,
    groupid = 151,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "丢失的精美宝石……呀，会不会是我们刚刚捡到的那颗？"
    };
getRow(567)->
    #show2Cfg {
    id = 567,
    groupid = 151,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "光明勇士，我们带着刚才捡到的那块宝石去找凡卡大人吧。"
    };
getRow(568)->
    #show2Cfg {
    id = 568,
    groupid = 152,
    taskname = "前往宫殿",
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "站住，你们是什么人，竟然敢闯入国王的宫殿！"
    };
getRow(569)->
    #show2Cfg {
    id = 569,
    groupid = 152,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "凡卡大人不要误会，皮皮刚才捡到了一颗宝石，请问它是你丢失的那颗吗？"
    };
getRow(570)->
    #show2Cfg {
    id = 570,
    groupid = 152,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "它在哪？快点交出来。"
    };
getRow(571)->
    #show2Cfg {
    id = 571,
    groupid = 153,
    taskname = "凡卡总管",
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "这块宝石你们是从哪里捡到的？"
    };
getRow(572)->
    #show2Cfg {
    id = 572,
    groupid = 153,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "嗯，就在入口附近"
    };
getRow(573)->
    #show2Cfg {
    id = 573,
    groupid = 153,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "哼，还有其他发现么？"
    };
getRow(574)->
    #show2Cfg {
    id = 574,
    groupid = 153,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "没有了，其他的皮皮什么也没看到……"
    };
getRow(575)->
    #show2Cfg {
    id = 575,
    groupid = 153,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "你们两个人行径可疑，哼，卫兵们给我拿下！"
    };
getRow(576)->
    #show2Cfg {
    id = 576,
    groupid = 154,
    taskname = "愤怒的皮皮",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "总管大人好不讲理，皮皮好心归还你丢失的宝石，你不领情也就算了，还唤来卫兵抓皮皮，皮皮生气了！"
    };
getRow(577)->
    #show2Cfg {
    id = 577,
    groupid = 154,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "啊！！这是……露娜之力。"
    };
getRow(578)->
    #show2Cfg {
    id = 578,
    groupid = 154,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "原来你们是露娜女神的手下，刚才是场误会……你们来应该是想见到我们的国王陛下吧，他就在大殿内。"
    };
getRow(579)->
    #show2Cfg {
    id = 579,
    groupid = 155,
    taskname = "海洋国国王",
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "光明勇士，欢迎你们来到海洋之心。"
    };
getRow(580)->
    #show2Cfg {
    id = 580,
    groupid = 155,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "咦？国王陛下，你居然认得光明勇士。"
    };
getRow(581)->
    #show2Cfg {
    id = 581,
    groupid = 155,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "呵呵呵，你们在到达入口地带时我就查觉到了露娜之力，所以我一直在等待你们到来。"
    };
getRow(582)->
    #show2Cfg {
    id = 582,
    groupid = 155,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "国王陛下，我们得知你的公主失踪了，我们愿意帮助您找回公主。"
    };
getRow(583)->
    #show2Cfg {
    id = 583,
    groupid = 155,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "找回公主的任务十分艰难，在你们行动前，不妨让我来考验你们一番。"
    };
getRow(584)->
    #show2Cfg {
    id = 584,
    groupid = 156,
    taskname = "真言",
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "光明勇士，其实贝尔的失踪是我故意安排的"
    };
getRow(585)->
    #show2Cfg {
    id = 585,
    groupid = 156,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "啊？为什么！"
    };
getRow(586)->
    #show2Cfg {
    id = 586,
    groupid = 156,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "海洋之城内混入魔族，他们以贝尔的安全来胁迫我交出生命石。我与贝尔自然不肯，所以让贝尔连夜离开皇宫，到外面安全的地方躲起来。"
    };
getRow(587)->
    #show2Cfg {
    id = 587,
    groupid = 156,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "可是贝尔公主到了外面要是被魔族找到了，岂不是更危险？"
    };
getRow(588)->
    #show2Cfg {
    id = 588,
    groupid = 156,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "我的女儿是个勇敢的公主，她有保护自己的能力，我让她离开一方面是不想被魔族威胁，另一方面也是希望她能在外面寻找对抗魔族的办法。"
    };
getRow(589)->
    #show2Cfg {
    id = 589,
    groupid = 157,
    taskname = "合作",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "国王陛下，我们能为您做什么呢？"
    };
getRow(590)->
    #show2Cfg {
    id = 590,
    groupid = 157,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "我赠送你们一颗珍珠，贝尔见到了便能相信你们是真正的伙伴，我请求你们一起帮助贝尔找到城中隐藏的魔族，保护海洋城民的安全！"
    };
getRow(591)->
    #show2Cfg {
    id = 591,
    groupid = 157,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "好，皮皮答应你！"
    };
getRow(592)->
    #show2Cfg {
    id = 592,
    groupid = 158,
    taskname = "暂别国王",
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "拜托了你们，勇敢的年轻人！"
    };
getRow(593)->
    #show2Cfg {
    id = 593,
    groupid = 158,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "我们一定会帮助你们的。"
    };
getRow(594)->
    #show2Cfg {
    id = 594,
    groupid = 158,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "城中的达达守卫和玛丽夫人都是值得信赖的伙伴，你们有什么困难可以去寻找他们帮忙。"
    };
getRow(595)->
    #show2Cfg {
    id = 595,
    groupid = 159,
    taskname = "威胁",
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "你们接受了国王的悬赏，去寻找我们的贝尔公主？"
    };
getRow(596)->
    #show2Cfg {
    id = 596,
    groupid = 159,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "是的，总管大人，您能为我们提供些关于公主的线索么？"
    };
getRow(597)->
    #show2Cfg {
    id = 597,
    groupid = 159,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "没有，不过我要提醒你们，若不能尽快找到贝尔公主，即便你们不是海洋之城的城民，我也会制裁你们的！"
    };
getRow(598)->
    #show2Cfg {
    id = 598,
    groupid = 159,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "哼，好大的口气，不过皮皮一定会找到公主的。"
    };
getRow(599)->
    #show2Cfg {
    id = 599,
    groupid = 160,
    taskname = "打探",
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "嗨，你们似乎是从王宫里出来的吧，国王的悬赏你们接受了么？"
    };
getRow(600)->
    #show2Cfg {
    id = 600,
    groupid = 160,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "嗯，瑞斯先生，皮皮想请你帮一个忙。"
    };
getRow(601)->
    #show2Cfg {
    id = 601,
    groupid = 160,
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "只要你们付出的价钱让我高兴，一切好说。"
    };
getRow(602)->
    #show2Cfg {
    id = 602,
    groupid = 160,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "您知道玛丽夫人在哪么？"
    };
getRow(603)->
    #show2Cfg {
    id = 603,
    groupid = 160,
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "当然，玛丽夫人可是海洋城有名的女士之一，不过她和凡卡很像，都喜欢收集精致的东西。"
    };
getRow(604)->
    #show2Cfg {
    id = 604,
    groupid = 161,
    taskname = "美人玛丽",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "你好，玛丽夫人。"
    };
getRow(605)->
    #show2Cfg {
    id = 605,
    groupid = 161,
    npcid = 3113,
    emotion = 1,
    name = "玛丽",
    side = 1,
    content = "小姑娘，请叫我美人玛丽……"
    };
getRow(606)->
    #show2Cfg {
    id = 606,
    groupid = 161,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "美人玛丽……国王陛下说你是他信赖的伙伴，因此我们来寻你，请夫人你为我们提供一些贝尔公主的线索。"
    };
getRow(607)->
    #show2Cfg {
    id = 607,
    groupid = 161,
    npcid = 3113,
    emotion = 1,
    name = "玛丽",
    side = 1,
    content = "小姑娘，求人帮忙是需要诚意的。"
    };
getRow(608)->
    #show2Cfg {
    id = 608,
    groupid = 162,
    taskname = "玛丽的请求",
    npcid = 3113,
    emotion = 1,
    name = "玛丽",
    side = 1,
    content = "上面是我饲养的灵宠，或许是因为魔气的缘故把，它们变得很暴躁。我不喜欢它们粗暴的样子，你能替我调教它们么？"
    };
getRow(609)->
    #show2Cfg {
    id = 609,
    groupid = 162,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "好啊，玛丽夫人……哦不，是美人玛丽。"
    };
getRow(610)->
    #show2Cfg {
    id = 610,
    groupid = 163,
    taskname = "暴躁的灵宠",
    npcid = 3118,
    emotion = 1,
    name = "灵宠",
    side = 1,
    content = "呼呼，受不了，玛丽总逼我们叫她美人，真的好讨厌啊！"
    };
getRow(611)->
    #show2Cfg {
    id = 611,
    groupid = 163,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "皮皮能理解你们的心情。"
    };
getRow(612)->
    #show2Cfg {
    id = 612,
    groupid = 163,
    npcid = 3118,
    emotion = 1,
    name = "灵宠",
    side = 1,
    content = "嘘嘘，她脾气怪的很，要是被她听到的话，我们又要受罪了。"
    };
getRow(613)->
    #show2Cfg {
    id = 613,
    groupid = 163,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "……小可怜们。"
    };
getRow(614)->
    #show2Cfg {
    id = 614,
    groupid = 164,
    taskname = "线索",
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "贝尔公主其实是个强大的魔法师，就算独自一人流落在外也不会有什么危险，唯一不足的就是没有我漂亮。"
    };
getRow(615)->
    #show2Cfg {
    id = 615,
    groupid = 164,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "咳咳，玛丽夫人，事关重大，皮皮需要知道关于贝尔公主的消息，请您在提供一些有用的线索吧。"
    };
getRow(616)->
    #show2Cfg {
    id = 616,
    groupid = 164,
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "是美人玛丽，五天前，贝尔公主曾乔装打扮来到我拿走一些药物。"
    };
getRow(617)->
    #show2Cfg {
    id = 617,
    groupid = 164,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "啊，她受伤了？！"
    };
getRow(618)->
    #show2Cfg {
    id = 618,
    groupid = 164,
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "不，她拿走是一些炼制魔药的原材料，应该是为了对抗魔族而用。"
    };
getRow(619)->
    #show2Cfg {
    id = 619,
    groupid = 164,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "魔药材料，有了，光明勇士，皮皮有个计划，我们现在行动起来吧。"
    };
getRow(620)->
    #show2Cfg {
    id = 620,
    groupid = 165,
    taskname = "达达的援助",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "别担心，我来帮你们"
    };
getRow(621)->
    #show2Cfg {
    id = 621,
    groupid = 165,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "达达，小心！"
    };
getRow(622)->
    #show2Cfg {
    id = 622,
    groupid = 166,
    taskname = "再遇达达",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "嘿，这里的魔族似乎对你们很感兴趣呢！"
    };
getRow(623)->
    #show2Cfg {
    id = 623,
    groupid = 166,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "好讨厌啊。这里的魔族盯上了我们。"
    };
getRow(624)->
    #show2Cfg {
    id = 624,
    groupid = 166,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "这也说明现在的海洋城并不安全啊，处处都有魔族的爪牙，你们要是能帮助国王陛下赶走魔族，就是海洋国的大恩人啊。到时候想要什么，国王陛下都会满足你们的。"
    };
getRow(625)->
    #show2Cfg {
    id = 625,
    groupid = 166,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "咦，对了。皮皮记得你也是深受国王陛下信赖的人，快点告诉皮皮，贝尔公主在哪里？不许隐瞒哦！"
    };
getRow(626)->
    #show2Cfg {
    id = 626,
    groupid = 167,
    taskname = "引路",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "我们的公主既聪明又勇敢，她不仅在收集对抗魔族的用具，还组建了一支军队。等到时机成熟，我们便于公主一起驱赶魔族！"
    };
getRow(627)->
    #show2Cfg {
    id = 627,
    groupid = 167,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "哎哎，说重点，贝尔公主在哪？"
    };
getRow(628)->
    #show2Cfg {
    id = 628,
    groupid = 167,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "公主用法术伪装了自己原来的样貌，你们往前走或许会遇到一个可爱的小女孩，她就是贝尔公主。"
    };
getRow(629)->
    #show2Cfg {
    id = 629,
    groupid = 168,
    taskname = "海洋城明珠",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "你好，勇敢的贝尔公主，皮皮终于找到你啦。"
    };
getRow(630)->
    #show2Cfg {
    id = 630,
    groupid = 168,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "我才不是什么公主，你们不要胡说八道！"
    };
getRow(631)->
    #show2Cfg {
    id = 631,
    groupid = 168,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "哎哎，先别急着否认哦，皮皮给你看这个！"
    };
getRow(632)->
    #show2Cfg {
    id = 632,
    groupid = 169,
    taskname = "相信",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "这是父亲的珍珠，你们是？"
    };
getRow(633)->
    #show2Cfg {
    id = 633,
    groupid = 169,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "别激动，皮皮和光明勇士是来帮助你们的，我们和你一样非常痛恨魔族。"
    };
getRow(634)->
    #show2Cfg {
    id = 634,
    groupid = 169,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "原来如此，我父亲现在的状况如何？"
    };
getRow(635)->
    #show2Cfg {
    id = 635,
    groupid = 169,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "他很好，公主不用担心。对了，我们从玛丽夫人那里得知你在寻找驱魔的原材料。这些就全都送给你好啦。"
    };
getRow(636)->
    #show2Cfg {
    id = 636,
    groupid = 170,
    taskname = "礼物",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "谢谢你们"
    };
getRow(637)->
    #show2Cfg {
    id = 637,
    groupid = 171,
    taskname = "驱魔药",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "你们怎么会驱魔药的制作方法？"
    };
getRow(638)->
    #show2Cfg {
    id = 638,
    groupid = 171,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "嘻，皮皮在东成郊平原认识了一位了不起的草药学家，他给了皮皮一张制作驱魔药的单子。如果你想学习驱魔药的制作方法，皮皮可以教你哦。"
    };
getRow(639)->
    #show2Cfg {
    id = 639,
    groupid = 171,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "太好了，贝尔要制作很多很多的驱魔药来救大家。"
    };
getRow(640)->
    #show2Cfg {
    id = 640,
    groupid = 172,
    taskname = "隐情",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "既然你们是朋友，那么我就把最近收集到的消息统统告诉你们。"
    };
getRow(641)->
    #show2Cfg {
    id = 641,
    groupid = 172,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "好啊，请公主畅所欲言。"
    };
getRow(642)->
    #show2Cfg {
    id = 642,
    groupid = 172,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "如今海洋之城进入了如此多的魔族，正是因为有海洋城内部的人与魔族暗中勾结。"
    };
getRow(643)->
    #show2Cfg {
    id = 643,
    groupid = 172,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "哼，是谁那么可恶！！！"
    };
getRow(644)->
    #show2Cfg {
    id = 644,
    groupid = 172,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "就是父亲最信赖的同伴，凡卡叔叔。"
    };
getRow(645)->
    #show2Cfg {
    id = 645,
    groupid = 173,
    taskname = "幕后黑手",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "竟然是他！哼，他脾气很坏很坏，皮皮一开始就很讨厌他。"
    };
getRow(646)->
    #show2Cfg {
    id = 646,
    groupid = 173,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "起初我不相信这个事实，毕竟凡卡叔叔效忠父亲多年。直到那一晚我亲眼看到他与魔族成员交谈，我才不得不接受了这个事实。"
    };
getRow(647)->
    #show2Cfg {
    id = 647,
    groupid = 173,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "这个坏蛋！贝尔公主，我们不如马上就去揭穿他的真面目！"
    };
getRow(648)->
    #show2Cfg {
    id = 648,
    groupid = 173,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "不行，我的父亲还在皇宫里，他不久前受了重伤，现在无法离开皇宫。"
    };
getRow(649)->
    #show2Cfg {
    id = 649,
    groupid = 173,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "那我们该怎么办呢？"
    };
getRow(650)->
    #show2Cfg {
    id = 650,
    groupid = 173,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "我的侍女伊莲娜正在训练灵兽，我想借助灵兽的力量攻打凡卡的军队并救出父亲。"
    };
getRow(651)->
    #show2Cfg {
    id = 651,
    groupid = 174,
    taskname = "寻找伊莲娜",
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "这些都是公主精心挑选出的灵兽，我要好好训练它们。等它们在长大一些，就能成为我们得力助手。"
    };
getRow(652)->
    #show2Cfg {
    id = 652,
    groupid = 174,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "奇怪，为什么皮皮会在这些灵兽身上感到一些魔气？"
    };
getRow(653)->
    #show2Cfg {
    id = 653,
    groupid = 174,
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "啊！怎么这会这样？"
    };
getRow(654)->
    #show2Cfg {
    id = 654,
    groupid = 174,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "魔族进入海洋之城的数量繁多，同时也带来了大量的魔气。这些灵兽尚且幼小，对魔气的抵抗较弱。不过别担心，看皮皮的。"
    };
getRow(655)->
    #show2Cfg {
    id = 655,
    groupid = 175,
    taskname = "伊莲娜的请求",
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "多亏你们及时发现灵兽的状况，否则我太对不起贝尔公主和国王陛下了。"
    };
getRow(656)->
    #show2Cfg {
    id = 656,
    groupid = 175,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "小事一桩，下次注意点啦"
    };
getRow(657)->
    #show2Cfg {
    id = 657,
    groupid = 175,
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "嗯，有一件事我想拜托你们，这些灵兽非常调皮顽劣，你们能帮我驯化它们么？"
    };
getRow(658)->
    #show2Cfg {
    id = 658,
    groupid = 176,
    taskname = "驯化灵兽",
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "这些灵兽身上掉落的绒毛是炼化武器的好材料，作为公主殿下的朋友，你们可以从它们身上收集一些。"
    };
getRow(659)->
    #show2Cfg {
    id = 659,
    groupid = 176,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "谢谢伊莲娜。"
    };
getRow(660)->
    #show2Cfg {
    id = 660,
    groupid = 177,
    taskname = "公主的计划",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "伊莲娜驯化的灵兽还需要一段时间才能派上用场，在发动战争之前，我请你们在去趟王宫确认一下我父亲的情况。另外，一定要告诉父亲，凡卡的真面目。"
    };
getRow(661)->
    #show2Cfg {
    id = 661,
    groupid = 177,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "没问题，可是如果那个凡卡真的背叛了国王陛下，那么国王陛下岂不是很危险。"
    };
getRow(662)->
    #show2Cfg {
    id = 662,
    groupid = 177,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "在没有得到父亲手上的生命石之前，凡卡不会也不敢对父亲下毒手的！"
    };
getRow(663)->
    #show2Cfg {
    id = 663,
    groupid = 177,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "啊，那个坏蛋也想得到生命石？"
    };
getRow(664)->
    #show2Cfg {
    id = 664,
    groupid = 177,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "生命石是海洋城的至宝，有了生命石力量的支撑，海洋城民才能安居到现在。如果生命石被其他人拿走了，那么对海洋城将是一场无法形容的灾难……"
    };
getRow(665)->
    #show2Cfg {
    id = 665,
    groupid = 177,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "……皮皮知道了，现在皮皮和光明勇士马上返回皇宫看看国王陛下的情况。"
    };
getRow(666)->
    #show2Cfg {
    id = 666,
    groupid = 178,
    taskname = "返回王宫",
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "你们找到贝尔了么？"
    };
getRow(667)->
    #show2Cfg {
    id = 667,
    groupid = 178,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "是的，夫人。哦不，是美人玛丽。"
    };
getRow(668)->
    #show2Cfg {
    id = 668,
    groupid = 178,
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "那为什么公主没有和你们在一起？"
    };
getRow(669)->
    #show2Cfg {
    id = 669,
    groupid = 178,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "公主要我们先发回王宫看看国王陛下的情况。"
    };
getRow(670)->
    #show2Cfg {
    id = 670,
    groupid = 178,
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "别回去了，凡卡总管已经代替国王发布公告，国王病重修养，不想见到任何人。"
    };
getRow(671)->
    #show2Cfg {
    id = 671,
    groupid = 179,
    taskname = "惊变",
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "国王突然宣布病重修养，这实在太奇怪了！我们的贝尔公主又下落不明，海洋城真的要完蛋了么？"
    };
getRow(672)->
    #show2Cfg {
    id = 672,
    groupid = 179,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "闭上你的乌鸦嘴，你再胡说八道，皮皮可要生气了！"
    };
getRow(673)->
    #show2Cfg {
    id = 673,
    groupid = 179,
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "你这个小可爱脾气还挺大，你这么在意国王陛下，怎么不进到王宫里面看看。"
    };
getRow(674)->
    #show2Cfg {
    id = 674,
    groupid = 179,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "哼，皮皮在想该怎么用不打架的方法进入王宫呢。"
    };
getRow(675)->
    #show2Cfg {
    id = 675,
    groupid = 179,
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "……我有个主意，嘻嘻嘻！~你们趁着王宫侍卫换班的时间打晕他们，从那里拿到侍卫的衣服就可以混入王宫了。"
    };
getRow(676)->
    #show2Cfg {
    id = 676,
    groupid = 180,
    taskname = "易装",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "咳咳，光明勇士，我们快点穿上这套衣服进入王宫。确认国王平安无事，就马上离开这里。"
    };
getRow(677)->
    #show2Cfg {
    id = 677,
    groupid = 181,
    taskname = "再入王宫",
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "你们两个是哪个卫队的成员？为什么不与自己的同伴在一块？"
    };
getRow(678)->
    #show2Cfg {
    id = 678,
    groupid = 181,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "咳咳……凡卡大人别生气，我们刚刚发现王宫外似乎有人在暗中窥伺，为了确认一下，就急忙出去了。"
    };
getRow(679)->
    #show2Cfg {
    id = 679,
    groupid = 181,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "有什么发现么？"
    };
getRow(680)->
    #show2Cfg {
    id = 680,
    groupid = 181,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "额，没有，什么也没有。"
    };
getRow(681)->
    #show2Cfg {
    id = 681,
    groupid = 182,
    taskname = "惩罚",
    npcid = 3119,
    emotion = 1,
    name = "海之国侍卫",
    side = 1,
    content = "来……人，有……额！"
    };
getRow(682)->
    #show2Cfg {
    id = 682,
    groupid = 182,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "乖乖给皮皮睡上一觉吧。可不能让你坏了大事。"
    };
getRow(683)->
    #show2Cfg {
    id = 683,
    groupid = 183,
    taskname = "再遇国王",
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "你们终于回来了，贝尔找到了么？"
    };
getRow(684)->
    #show2Cfg {
    id = 684,
    groupid = 183,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "国王陛下，贝尔公主很勇敢，她发现了幕后主使，就是凡卡这个大坏蛋。"
    };
getRow(685)->
    #show2Cfg {
    id = 685,
    groupid = 183,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "唉……凡卡他，他跟随我多年，要不是他亲自带人软禁我，我实在无法相信他竟然会背叛我。"
    };
getRow(686)->
    #show2Cfg {
    id = 686,
    groupid = 183,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "请您放心，我们一定会解救您的。对了，还请您告诉皮皮，生命石与海洋城的安危有什么关系呢？"
    };
getRow(687)->
    #show2Cfg {
    id = 687,
    groupid = 184,
    taskname = "真相",
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "这座海洋城实际上是一个火山口，需要生命石的力量来抑制，一旦这里没有了生命石则会引起火山迸发，那么海洋城将彻底消失，到那时任何城民和生灵都没有了生存的希望。"
    };
getRow(688)->
    #show2Cfg {
    id = 688,
    groupid = 184,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "原来如此，贝尔公主告诉皮皮，她亲眼看到凡卡与魔族接触。其实魔族一直在寻找生命石，它们的目的是想帮助阿尔萨德解除女神的封印。无论如何，您千万不能交出生命之石。"
    };
getRow(689)->
    #show2Cfg {
    id = 689,
    groupid = 184,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "阿尔萨德？那个大魔头！不论如何，一定要阻止他们！"
    };
getRow(690)->
    #show2Cfg {
    id = 690,
    groupid = 184,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "公主的侍女正在驯化灵兽，等那些灵兽在强大一些，我们就会带着灵兽来解救您。"
    };
getRow(691)->
    #show2Cfg {
    id = 691,
    groupid = 184,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "灵兽？！凡卡也在暗中培育魔灵兽，你们要小心！"
    };
getRow(692)->
    #show2Cfg {
    id = 692,
    groupid = 185,
    taskname = "野心",
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "你们休想离开这里！"
    };
getRow(693)->
    #show2Cfg {
    id = 693,
    groupid = 185,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "你这个大坏蛋竟然与魔族合作，皮皮讨厌你！"
    };
getRow(694)->
    #show2Cfg {
    id = 694,
    groupid = 185,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "你们只要归顺于我，待我成为新的国王，必将重用你们！"
    };
getRow(695)->
    #show2Cfg {
    id = 695,
    groupid = 185,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "休想！"
    };
getRow(696)->
    #show2Cfg {
    id = 696,
    groupid = 186,
    taskname = "阻拦",
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "你们别想跑掉，看我的魔灵兽！"
    };
getRow(697)->
    #show2Cfg {
    id = 697,
    groupid = 186,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "啊！你居然敢在王宫里圈养魔兽，你真是个疯子！"
    };
getRow(698)->
    #show2Cfg {
    id = 698,
    groupid = 187,
    taskname = "藏身",
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "发生了什么事，你们怎么这么狼狈？"
    };
getRow(699)->
    #show2Cfg {
    id = 699,
    groupid = 187,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "都是凡卡那个大坏蛋，他不仅魔灵兽咬皮皮，还派凶恶的魔族追杀我们。"
    };
getRow(700)->
    #show2Cfg {
    id = 700,
    groupid = 187,
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "你们竟然得罪了凡卡大人，还是快点离开我这里吧，不然我可要跟着你们遭殃啊！"
    };
getRow(701)->
    #show2Cfg {
    id = 701,
    groupid = 188,
    taskname = "逃跑",
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "虽然你们很狼狈，但是我还是要赞叹你们的勇气。"
    };
getRow(702)->
    #show2Cfg {
    id = 702,
    groupid = 188,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "谢谢玛丽夫人的安慰……"
    };
getRow(703)->
    #show2Cfg {
    id = 703,
    groupid = 188,
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "要叫我美人玛丽，你们的动静如此之大，凡卡那个丑八怪一定会派人全城的寻找你们，你们还是尽快与公主汇合，她可以帮助你们的。"
    };
getRow(704)->
    #show2Cfg {
    id = 704,
    groupid = 188,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "谢谢。"
    };
getRow(705)->
    #show2Cfg {
    id = 705,
    groupid = 189,
    taskname = "失控的灵宠",
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "给你一次报答我的机会，我的灵宠又开始不听话了。这一次它们闹的更凶，就委托你们帮我制服它们。"
    };
getRow(706)->
    #show2Cfg {
    id = 706,
    groupid = 190,
    taskname = "同伴的关心",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "这一次真的太辛苦你们了。"
    };
getRow(707)->
    #show2Cfg {
    id = 707,
    groupid = 190,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "幸好我们的光明勇士给力，否则皮皮真的会被抓住的。"
    };
getRow(708)->
    #show2Cfg {
    id = 708,
    groupid = 190,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "我父亲的情况如何？他有没有事？"
    };
getRow(709)->
    #show2Cfg {
    id = 709,
    groupid = 190,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "国王陛下只是被软禁，凡卡还没有拿到生命石，国王陛下暂时是安全的。不过，我们要尽快实施营救国王的行动，凡卡那个坏蛋也在暗地里饲养了魔灵兽！"
    };
getRow(710)->
    #show2Cfg {
    id = 710,
    groupid = 190,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "什么，得赶快把这个消息告诉伊莲娜！"
    };
getRow(711)->
    #show2Cfg {
    id = 711,
    groupid = 191,
    taskname = "同伴的担忧",
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "凡卡居然在饲养魔灵兽。该死！"
    };
getRow(712)->
    #show2Cfg {
    id = 712,
    groupid = 191,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "伊莲娜姐姐似乎很着急呢，我们饲养的灵兽难道比不过他们么？"
    };
getRow(713)->
    #show2Cfg {
    id = 713,
    groupid = 191,
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "魔灵兽天生含带魔气，一般的灵兽根本无法与其抗衡，让我想想该怎么增强灵兽的实力……"
    };
getRow(714)->
    #show2Cfg {
    id = 714,
    groupid = 192,
    taskname = "妙计",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "我想到一个削弱魔灵兽的办法。"
    };
getRow(715)->
    #show2Cfg {
    id = 715,
    groupid = 192,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "快点说说看！"
    };
getRow(716)->
    #show2Cfg {
    id = 716,
    groupid = 192,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "我们掌握了制作驱魔剂的方法，不妨多做一些驱魔剂，再想办法将驱魔剂悄悄的投放到魔灵兽那里去，削弱魔灵兽的实力。"
    };
getRow(717)->
    #show2Cfg {
    id = 717,
    groupid = 192,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "这是个不错的注意，皮皮可以做好多驱魔剂，只是我们怎么做才能把驱魔剂投放到魔灵兽那里还不惊动凡卡那个坏蛋呢？"
    };
getRow(718)->
    #show2Cfg {
    id = 718,
    groupid = 192,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "不急，你们做好药剂以后交给达达就可以了。"
    };
getRow(719)->
    #show2Cfg {
    id = 719,
    groupid = 193,
    taskname = "寻找达达",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "公主的计划确实不错，但是需要冒很大的风险。有了！你们跟我去见一个人。"
    };
getRow(720)->
    #show2Cfg {
    id = 720,
    groupid = 194,
    taskname = "达达的同伴",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "事情就是这样，罗米亚，请你一定要帮助他们！"
    };
getRow(721)->
    #show2Cfg {
    id = 721,
    groupid = 194,
    npcid = 3111,
    emotion = 1,
    name = "罗米亚",
    side = 1,
    content = "没问题，说实话我很佩服你们这些勇敢的人。"
    };
getRow(722)->
    #show2Cfg {
    id = 722,
    groupid = 194,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "皮皮很高兴你愿意帮助我们，你也是一个勇敢的同伴。"
    };
getRow(723)->
    #show2Cfg {
    id = 723,
    groupid = 194,
    npcid = 3111,
    emotion = 1,
    name = "罗米亚",
    side = 1,
    content = "这钥匙可以打开魔灵兽大门，午夜时刻正是魔灵兽睡觉的时候，你们要在最短的时间内投放药剂，然后立即离开那里！"
    };
getRow(724)->
    #show2Cfg {
    id = 724,
    groupid = 194,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "皮皮知道了！"
    };
getRow(725)->
    #show2Cfg {
    id = 725,
    groupid = 195,
    taskname = "狂怒的凡卡",
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "你毁了我魔灵兽，我要杀了你们！"
    };
getRow(726)->
    #show2Cfg {
    id = 726,
    groupid = 195,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "你活该，哼！"
    };
getRow(727)->
    #show2Cfg {
    id = 727,
    groupid = 196,
    taskname = "汇合",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "你们做的太棒了，魔灵兽被彻底消灭，我们有希望将他们赶出海洋城。"
    };
getRow(728)->
    #show2Cfg {
    id = 728,
    groupid = 196,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "看到那个凡卡坏蛋起冒烟的样子，皮皮好高兴呢！"
    };
getRow(729)->
    #show2Cfg {
    id = 729,
    groupid = 196,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "公主殿下已经准备差不多了，你们过去与她确认一下，大家一起行动营救国王陛下。"
    };
getRow(730)->
    #show2Cfg {
    id = 730,
    groupid = 197,
    taskname = "公主的誓言",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "忠诚的海洋城民们，我以公主的名义起誓，营救我们的国王，驱赶海洋城的叛徒，重建我们的家园！"
    };
getRow(731)->
    #show2Cfg {
    id = 731,
    groupid = 197,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "公主万岁！"
    };
getRow(732)->
    #show2Cfg {
    id = 732,
    groupid = 197,
    npcid = 3111,
    emotion = 1,
    name = "罗米亚",
    side = 1,
    content = "公主万岁！"
    };
getRow(733)->
    #show2Cfg {
    id = 733,
    groupid = 197,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "哇，贝尔公主好有气势呢，光明勇士，我们也要加油！"
    };
getRow(734)->
    #show2Cfg {
    id = 734,
    groupid = 198,
    taskname = "灵兽出击",
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "我的灵兽已经驯化完毕，它们可以随同大家一起出击。"
    };
getRow(735)->
    #show2Cfg {
    id = 735,
    groupid = 198,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "太好了，有了灵兽出战可以帮助我们很多呢。"
    };
getRow(736)->
    #show2Cfg {
    id = 736,
    groupid = 198,
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "过奖了，我要谢谢你们及时做出了驱魔药剂，不然这些小家伙恐怕无法顺利长大。"
    };
getRow(737)->
    #show2Cfg {
    id = 737,
    groupid = 199,
    taskname = "不详的预感",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "恩……"
    };
getRow(738)->
    #show2Cfg {
    id = 738,
    groupid = 199,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "贝尔公主，你没事吧？"
    };
getRow(739)->
    #show2Cfg {
    id = 739,
    groupid = 199,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "我有些担心，凡卡那个家伙与魔族合作不仅仅是为了得到王位，或许他还有更大的野心！"
    };
getRow(740)->
    #show2Cfg {
    id = 740,
    groupid = 199,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "！！是什么？"
    };
getRow(741)->
    #show2Cfg {
    id = 741,
    groupid = 199,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "禁地一带，那里是海洋城生命之核也就是生命石的所在地，除了国王没有人有资格进入那里。我担心凡卡会趁混乱引入魔族去那。"
    };
getRow(742)->
    #show2Cfg {
    id = 742,
    groupid = 199,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "那可不行，皮皮要和光明勇士去阻止他们。"
    };
getRow(743)->
    #show2Cfg {
    id = 743,
    groupid = 200,
    taskname = "前往禁地",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "罗米亚看守的地方就是禁地一带，那里十分危险，你们要小心。"
    };
getRow(744)->
    #show2Cfg {
    id = 744,
    groupid = 200,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "知道了，你也要注意保护自己。"
    };
getRow(745)->
    #show2Cfg {
    id = 745,
    groupid = 201,
    taskname = "恶战前的准备",
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "哈哈哈，海洋城要遇上一场前所为有的战斗，我可要发大财了！"
    };
getRow(746)->
    #show2Cfg {
    id = 746,
    groupid = 201,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "可恶的家伙……光明勇士马上要去收拾凡卡那个坏蛋了。你这里有没有让我们补充体力的食物呢？"
    };
getRow(747)->
    #show2Cfg {
    id = 747,
    groupid = 201,
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "当然，只是价格么，要比往常高了点~哈哈哈。"
    };
getRow(748)->
    #show2Cfg {
    id = 748,
    groupid = 202,
    taskname = "进入禁地",
    npcid = 3111,
    emotion = 1,
    name = "罗米亚",
    side = 1,
    content = "没错，我背后看守的地方就是海洋城的禁地一带，除了国王陛下任何人都不能进入这里。"
    };
getRow(749)->
    #show2Cfg {
    id = 749,
    groupid = 202,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "凡卡现在很可能就在里面，请你让我们进去，光明勇士要去阻止凡卡。"
    };
getRow(750)->
    #show2Cfg {
    id = 750,
    groupid = 202,
    npcid = 3111,
    emotion = 1,
    name = "罗米亚",
    side = 1,
    content = "这……好吧。一切就拜托你们了。禁地中很可能有极其难对付的灵兽，若需要帮忙就马上召唤向大家。"
    };
getRow(751)->
    #show2Cfg {
    id = 751,
    groupid = 203,
    taskname = "禁地恶龙",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "住手，不准在靠近生命石。"
    };
getRow(752)->
    #show2Cfg {
    id = 752,
    groupid = 203,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "哼，捣乱的来了！"
    };
getRow(753)->
    #show2Cfg {
    id = 753,
    groupid = 204,
    taskname = "禁地魔灵兽",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "咦？怎么还有魔灵兽。"
    };
getRow(754)->
    #show2Cfg {
    id = 754,
    groupid = 204,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "哈哈哈，这是我给你们这些好管闲事的人一份礼物，乖乖成为魔灵兽的食物吧！"
    };
getRow(755)->
    #show2Cfg {
    id = 755,
    groupid = 205,
    taskname = "禁地人蛇姬",
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "贝尔！从今往后你就是海洋城的主人，不要让爸爸失望！"
    };
getRow(756)->
    #show2Cfg {
    id = 756,
    groupid = 205,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "父亲，你要做什么？！不！！！！"
    };
getRow(757)->
    #show2Cfg {
    id = 757,
    groupid = 205,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "国王陛下！"
    };
getRow(758)->
    #show2Cfg {
    id = 758,
    groupid = 206,
    taskname = "告别达达",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "国王陛下他……他是海洋城最伟大的国王！"
    };
getRow(759)->
    #show2Cfg {
    id = 759,
    groupid = 206,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "呜！皮皮没想到事情会变成这样。"
    };
getRow(760)->
    #show2Cfg {
    id = 760,
    groupid = 206,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "你们已经尽力了，作为海洋城的城民我要由衷的感谢你们出手帮忙。"
    };
getRow(761)->
    #show2Cfg {
    id = 761,
    groupid = 206,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "现在，我们要离开这里了，后会有期。"
    };
getRow(762)->
    #show2Cfg {
    id = 762,
    groupid = 207,
    taskname = "告别贝尔",
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "对不起，皮皮和光明勇士还是没能解救国王……对不起。"
    };
getRow(763)->
    #show2Cfg {
    id = 763,
    groupid = 207,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "父亲为海洋国牺牲生命，他虽然离开了我以及海洋城城民，但是他永远活在我们的心里。"
    };
getRow(764)->
    #show2Cfg {
    id = 764,
    groupid = 207,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "嗯，一定是这样的，贝尔公主，哦不，贝尔女王，你一定要做一个优秀的女王，不要辜负国王陛下的期望哦！"
    };
getRow(765)->
    #show2Cfg {
    id = 765,
    groupid = 207,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "我一定会的，你们是要离开这了么？我以海洋城女王的名义为你们祝福，你们永远是海洋城民的朋友，海洋城永远欢迎你们。"
    };
getRow(766)->
    #show2Cfg {
    id = 766,
    groupid = 207,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "谢谢女王，请你和城民多多保重，我们要出发了。"
    };
getRow(767)->
    #show2Cfg {
    id = 767,
    groupid = 208,
    taskname = "离开海洋之心",
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "前面就是出口，海洋城的下面是精灵故土，那里有很多精灵族人。祝你们一切顺利。"
    };
getRow(768)->
    #show2Cfg {
    id = 768,
    groupid = 208,
    npcid = 3007,
    emotion = 1,
    name = "茜茜",
    side = 1,
    content = "伊莲娜姐姐好好保护贝尔女王，皮皮以后会来看大家的。"
    };
getRow(769)->
    #show2Cfg {
    id = 769,
    groupid = 208,
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "一定要来啊，贝尔公主，哦不，是贝尔女王还有大家都欢迎你们再来。"
    };
getRow(6000)->
    #show2Cfg {
    id = 6000,
    groupid = 6000,
    taskname = "每日任务完成",
    npcid = 230,
    emotion = 1,
    name = "拉斐尔·孟",
    side = 1,
    content = "年轻的冒险者，感谢你为冒险者公会做的一切！！"
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7},
    {8},
    {9},
    {10},
    {11},
    {12},
    {13},
    {14},
    {15},
    {16},
    {17},
    {18},
    {19},
    {20},
    {21},
    {22},
    {23},
    {24},
    {25},
    {26},
    {27},
    {28},
    {29},
    {30},
    {31},
    {32},
    {33},
    {34},
    {35},
    {36},
    {37},
    {38},
    {39},
    {40},
    {41},
    {42},
    {43},
    {44},
    {45},
    {46},
    {47},
    {48},
    {49},
    {50},
    {51},
    {52},
    {53},
    {54},
    {55},
    {56},
    {57},
    {58},
    {59},
    {60},
    {61},
    {62},
    {63},
    {64},
    {65},
    {66},
    {67},
    {68},
    {69},
    {70},
    {71},
    {72},
    {73},
    {74},
    {75},
    {76},
    {77},
    {78},
    {79},
    {80},
    {81},
    {82},
    {83},
    {84},
    {85},
    {86},
    {87},
    {88},
    {89},
    {90},
    {91},
    {92},
    {93},
    {94},
    {95},
    {96},
    {97},
    {98},
    {99},
    {100},
    {101},
    {102},
    {103},
    {104},
    {105},
    {106},
    {107},
    {108},
    {109},
    {110},
    {111},
    {112},
    {113},
    {114},
    {115},
    {116},
    {117},
    {118},
    {119},
    {120},
    {121},
    {122},
    {123},
    {124},
    {125},
    {126},
    {127},
    {128},
    {129},
    {130},
    {131},
    {132},
    {133},
    {134},
    {135},
    {136},
    {137},
    {138},
    {139},
    {140},
    {141},
    {142},
    {143},
    {144},
    {145},
    {146},
    {147},
    {148},
    {149},
    {150},
    {151},
    {152},
    {153},
    {154},
    {155},
    {156},
    {157},
    {158},
    {159},
    {160},
    {161},
    {162},
    {163},
    {164},
    {165},
    {166},
    {167},
    {168},
    {169},
    {170},
    {171},
    {172},
    {173},
    {174},
    {175},
    {176},
    {177},
    {178},
    {179},
    {180},
    {181},
    {182},
    {183},
    {184},
    {185},
    {186},
    {187},
    {188},
    {189},
    {190},
    {191},
    {192},
    {193},
    {194},
    {195},
    {196},
    {197},
    {198},
    {199},
    {200},
    {201},
    {202},
    {203},
    {204},
    {205},
    {206},
    {207},
    {208},
    {209},
    {210},
    {211},
    {212},
    {213},
    {214},
    {215},
    {216},
    {217},
    {218},
    {219},
    {220},
    {221},
    {222},
    {223},
    {224},
    {225},
    {226},
    {227},
    {228},
    {229},
    {230},
    {231},
    {232},
    {233},
    {234},
    {235},
    {236},
    {237},
    {238},
    {239},
    {240},
    {241},
    {242},
    {243},
    {244},
    {245},
    {246},
    {247},
    {248},
    {249},
    {250},
    {251},
    {252},
    {253},
    {254},
    {255},
    {256},
    {257},
    {258},
    {259},
    {260},
    {261},
    {262},
    {263},
    {264},
    {265},
    {266},
    {267},
    {268},
    {269},
    {270},
    {271},
    {272},
    {273},
    {274},
    {275},
    {276},
    {277},
    {278},
    {279},
    {280},
    {281},
    {282},
    {283},
    {284},
    {285},
    {286},
    {287},
    {288},
    {289},
    {290},
    {291},
    {292},
    {293},
    {294},
    {295},
    {296},
    {297},
    {298},
    {299},
    {300},
    {301},
    {302},
    {303},
    {304},
    {305},
    {306},
    {307},
    {308},
    {309},
    {310},
    {311},
    {312},
    {313},
    {314},
    {315},
    {316},
    {317},
    {318},
    {319},
    {320},
    {321},
    {322},
    {323},
    {324},
    {325},
    {326},
    {327},
    {328},
    {329},
    {330},
    {331},
    {332},
    {333},
    {334},
    {335},
    {336},
    {337},
    {338},
    {339},
    {340},
    {341},
    {342},
    {343},
    {344},
    {345},
    {346},
    {347},
    {348},
    {349},
    {350},
    {351},
    {352},
    {353},
    {354},
    {355},
    {356},
    {357},
    {358},
    {359},
    {360},
    {361},
    {362},
    {363},
    {364},
    {365},
    {366},
    {367},
    {368},
    {369},
    {370},
    {371},
    {372},
    {373},
    {374},
    {375},
    {376},
    {377},
    {378},
    {379},
    {380},
    {381},
    {382},
    {383},
    {384},
    {385},
    {386},
    {387},
    {388},
    {389},
    {390},
    {391},
    {392},
    {393},
    {394},
    {395},
    {396},
    {397},
    {398},
    {399},
    {400},
    {401},
    {402},
    {403},
    {404},
    {405},
    {406},
    {407},
    {408},
    {409},
    {410},
    {411},
    {412},
    {413},
    {414},
    {415},
    {416},
    {417},
    {418},
    {419},
    {420},
    {421},
    {422},
    {423},
    {424},
    {425},
    {426},
    {427},
    {428},
    {429},
    {430},
    {431},
    {432},
    {433},
    {434},
    {435},
    {436},
    {437},
    {438},
    {439},
    {440},
    {441},
    {442},
    {443},
    {444},
    {445},
    {446},
    {447},
    {448},
    {449},
    {450},
    {451},
    {452},
    {453},
    {454},
    {455},
    {456},
    {457},
    {458},
    {459},
    {460},
    {461},
    {462},
    {463},
    {464},
    {465},
    {466},
    {467},
    {468},
    {469},
    {470},
    {471},
    {472},
    {473},
    {474},
    {475},
    {476},
    {477},
    {478},
    {479},
    {480},
    {481},
    {482},
    {483},
    {484},
    {485},
    {486},
    {487},
    {488},
    {489},
    {490},
    {491},
    {492},
    {493},
    {494},
    {495},
    {496},
    {497},
    {498},
    {499},
    {500},
    {501},
    {502},
    {503},
    {504},
    {505},
    {506},
    {507},
    {508},
    {509},
    {510},
    {511},
    {512},
    {513},
    {514},
    {515},
    {516},
    {517},
    {518},
    {519},
    {520},
    {521},
    {522},
    {523},
    {524},
    {525},
    {526},
    {527},
    {528},
    {529},
    {530},
    {531},
    {532},
    {533},
    {534},
    {535},
    {536},
    {537},
    {538},
    {539},
    {540},
    {541},
    {542},
    {543},
    {544},
    {545},
    {546},
    {547},
    {548},
    {549},
    {550},
    {551},
    {552},
    {553},
    {554},
    {555},
    {556},
    {557},
    {558},
    {559},
    {560},
    {561},
    {562},
    {563},
    {564},
    {565},
    {566},
    {567},
    {568},
    {569},
    {570},
    {571},
    {572},
    {573},
    {574},
    {575},
    {576},
    {577},
    {578},
    {579},
    {580},
    {581},
    {582},
    {583},
    {584},
    {585},
    {586},
    {587},
    {588},
    {589},
    {590},
    {591},
    {592},
    {593},
    {594},
    {595},
    {596},
    {597},
    {598},
    {599},
    {600},
    {601},
    {602},
    {603},
    {604},
    {605},
    {606},
    {607},
    {608},
    {609},
    {610},
    {611},
    {612},
    {613},
    {614},
    {615},
    {616},
    {617},
    {618},
    {619},
    {620},
    {621},
    {622},
    {623},
    {624},
    {625},
    {626},
    {627},
    {628},
    {629},
    {630},
    {631},
    {632},
    {633},
    {634},
    {635},
    {636},
    {637},
    {638},
    {639},
    {640},
    {641},
    {642},
    {643},
    {644},
    {645},
    {646},
    {647},
    {648},
    {649},
    {650},
    {651},
    {652},
    {653},
    {654},
    {655},
    {656},
    {657},
    {658},
    {659},
    {660},
    {661},
    {662},
    {663},
    {664},
    {665},
    {666},
    {667},
    {668},
    {669},
    {670},
    {671},
    {672},
    {673},
    {674},
    {675},
    {676},
    {677},
    {678},
    {679},
    {680},
    {681},
    {682},
    {683},
    {684},
    {685},
    {686},
    {687},
    {688},
    {689},
    {690},
    {691},
    {692},
    {693},
    {694},
    {695},
    {696},
    {697},
    {698},
    {699},
    {700},
    {701},
    {702},
    {703},
    {704},
    {705},
    {706},
    {707},
    {708},
    {709},
    {710},
    {711},
    {712},
    {713},
    {714},
    {715},
    {716},
    {717},
    {718},
    {719},
    {720},
    {721},
    {722},
    {723},
    {724},
    {725},
    {726},
    {727},
    {728},
    {729},
    {730},
    {731},
    {732},
    {733},
    {734},
    {735},
    {736},
    {737},
    {738},
    {739},
    {740},
    {741},
    {742},
    {743},
    {744},
    {745},
    {746},
    {747},
    {748},
    {749},
    {750},
    {751},
    {752},
    {753},
    {754},
    {755},
    {756},
    {757},
    {758},
    {759},
    {760},
    {761},
    {762},
    {763},
    {764},
    {765},
    {766},
    {767},
    {768},
    {769},
    {6000}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    94,
    95,
    96,
    97,
    98,
    99,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    120,
    121,
    122,
    123,
    124,
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    132,
    133,
    134,
    135,
    136,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    147,
    148,
    149,
    150,
    151,
    152,
    153,
    154,
    155,
    156,
    157,
    158,
    159,
    160,
    161,
    162,
    163,
    164,
    165,
    166,
    167,
    168,
    169,
    170,
    171,
    172,
    173,
    174,
    175,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    187,
    188,
    189,
    190,
    191,
    192,
    193,
    194,
    195,
    196,
    197,
    198,
    199,
    200,
    201,
    202,
    203,
    204,
    205,
    206,
    207,
    208,
    209,
    210,
    211,
    212,
    213,
    214,
    215,
    216,
    217,
    218,
    219,
    220,
    221,
    222,
    223,
    224,
    225,
    226,
    227,
    228,
    229,
    230,
    231,
    232,
    233,
    234,
    235,
    236,
    237,
    238,
    239,
    240,
    241,
    242,
    243,
    244,
    245,
    246,
    247,
    248,
    249,
    250,
    251,
    252,
    253,
    254,
    255,
    256,
    257,
    258,
    259,
    260,
    261,
    262,
    263,
    264,
    265,
    266,
    267,
    268,
    269,
    270,
    271,
    272,
    273,
    274,
    275,
    276,
    277,
    278,
    279,
    280,
    281,
    282,
    283,
    284,
    285,
    286,
    287,
    288,
    289,
    290,
    291,
    292,
    293,
    294,
    295,
    296,
    297,
    298,
    299,
    300,
    301,
    302,
    303,
    304,
    305,
    306,
    307,
    308,
    309,
    310,
    311,
    312,
    313,
    314,
    315,
    316,
    317,
    318,
    319,
    320,
    321,
    322,
    323,
    324,
    325,
    326,
    327,
    328,
    329,
    330,
    331,
    332,
    333,
    334,
    335,
    336,
    337,
    338,
    339,
    340,
    341,
    342,
    343,
    344,
    345,
    346,
    347,
    348,
    349,
    350,
    351,
    352,
    353,
    354,
    355,
    356,
    357,
    358,
    359,
    360,
    361,
    362,
    363,
    364,
    365,
    366,
    367,
    368,
    369,
    370,
    371,
    372,
    373,
    374,
    375,
    376,
    377,
    378,
    379,
    380,
    381,
    382,
    383,
    384,
    385,
    386,
    387,
    388,
    389,
    390,
    391,
    392,
    393,
    394,
    395,
    396,
    397,
    398,
    399,
    400,
    401,
    402,
    403,
    404,
    405,
    406,
    407,
    408,
    409,
    410,
    411,
    412,
    413,
    414,
    415,
    416,
    417,
    418,
    419,
    420,
    421,
    422,
    423,
    424,
    425,
    426,
    427,
    428,
    429,
    430,
    431,
    432,
    433,
    434,
    435,
    436,
    437,
    438,
    439,
    440,
    441,
    442,
    443,
    444,
    445,
    446,
    447,
    448,
    449,
    450,
    451,
    452,
    453,
    454,
    455,
    456,
    457,
    458,
    459,
    460,
    461,
    462,
    463,
    464,
    465,
    466,
    467,
    468,
    469,
    470,
    471,
    472,
    473,
    474,
    475,
    476,
    477,
    478,
    479,
    480,
    481,
    482,
    483,
    484,
    485,
    486,
    487,
    488,
    489,
    490,
    491,
    492,
    493,
    494,
    495,
    496,
    497,
    498,
    499,
    500,
    501,
    502,
    503,
    504,
    505,
    506,
    507,
    508,
    509,
    510,
    511,
    512,
    513,
    514,
    515,
    516,
    517,
    518,
    519,
    520,
    521,
    522,
    523,
    524,
    525,
    526,
    527,
    528,
    529,
    530,
    531,
    532,
    533,
    534,
    535,
    536,
    537,
    538,
    539,
    540,
    541,
    542,
    543,
    544,
    545,
    546,
    547,
    548,
    549,
    550,
    551,
    552,
    553,
    554,
    555,
    556,
    557,
    558,
    559,
    560,
    561,
    562,
    563,
    564,
    565,
    566,
    567,
    568,
    569,
    570,
    571,
    572,
    573,
    574,
    575,
    576,
    577,
    578,
    579,
    580,
    581,
    582,
    583,
    584,
    585,
    586,
    587,
    588,
    589,
    590,
    591,
    592,
    593,
    594,
    595,
    596,
    597,
    598,
    599,
    600,
    601,
    602,
    603,
    604,
    605,
    606,
    607,
    608,
    609,
    610,
    611,
    612,
    613,
    614,
    615,
    616,
    617,
    618,
    619,
    620,
    621,
    622,
    623,
    624,
    625,
    626,
    627,
    628,
    629,
    630,
    631,
    632,
    633,
    634,
    635,
    636,
    637,
    638,
    639,
    640,
    641,
    642,
    643,
    644,
    645,
    646,
    647,
    648,
    649,
    650,
    651,
    652,
    653,
    654,
    655,
    656,
    657,
    658,
    659,
    660,
    661,
    662,
    663,
    664,
    665,
    666,
    667,
    668,
    669,
    670,
    671,
    672,
    673,
    674,
    675,
    676,
    677,
    678,
    679,
    680,
    681,
    682,
    683,
    684,
    685,
    686,
    687,
    688,
    689,
    690,
    691,
    692,
    693,
    694,
    695,
    696,
    697,
    698,
    699,
    700,
    701,
    702,
    703,
    704,
    705,
    706,
    707,
    708,
    709,
    710,
    711,
    712,
    713,
    714,
    715,
    716,
    717,
    718,
    719,
    720,
    721,
    722,
    723,
    724,
    725,
    726,
    727,
    728,
    729,
    730,
    731,
    732,
    733,
    734,
    735,
    736,
    737,
    738,
    739,
    740,
    741,
    742,
    743,
    744,
    745,
    746,
    747,
    748,
    749,
    750,
    751,
    752,
    753,
    754,
    755,
    756,
    757,
    758,
    759,
    760,
    761,
    762,
    763,
    764,
    765,
    766,
    767,
    768,
    769,
    6000
    ].

