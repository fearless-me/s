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
    content = "额……好痛！这是哪？我怎么会在这……"
    };
getRow(2)->
    #show2Cfg {
    id = 2,
    groupid = 1,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
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
    content = "光明勇士……你是谁？！这里是哪儿？"
    };
getRow(4)->
    #show2Cfg {
    id = 4,
    groupid = 1,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哎呀说话要温柔一点~皮皮是[fff000]露娜女神[-]灵力所化的萌物，这里是[fff000]阿克勒港口[-]。"
    };
getRow(5)->
    #show2Cfg {
    id = 5,
    groupid = 1,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "我竟然到了这里……我其他的同伴呢？"
    };
getRow(6)->
    #show2Cfg {
    id = 6,
    groupid = 1,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "这个皮皮就不清楚了，大家发现你的时候，只有你一个人。"
    };
getRow(7)->
    #show2Cfg {
    id = 7,
    groupid = 1,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "（[2becf8]难道……那个梦是真的，他们都已经不在了……[-]）"
    };
getRow(8)->
    #show2Cfg {
    id = 8,
    groupid = 1,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "咦？你怎么看起来好难过的样子，打起精神来，先跟皮皮去见见救了你的[fff000]约克大叔[-]吧。"
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
    content = "哦，年轻人你感觉好些了么？"
    };
getRow(10)->
    #show2Cfg {
    id = 10,
    groupid = 2,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "约克先生，谢谢您的关心，我已经没事了。"
    };
getRow(11)->
    #show2Cfg {
    id = 11,
    groupid = 2,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "你一定有很多疑惑吧？别急，让我来慢慢告诉你。"
    };
getRow(12)->
    #show2Cfg {
    id = 12,
    groupid = 2,
    npcid = 3000,
    emotion = 1,
    name = "约克大叔",
    side = 1,
    content = "当时我与大家在角落里发现了已经昏迷的你，我认出你是联盟军成员，就把你带回了港口。"
    };
getRow(13)->
    #show2Cfg {
    id = 13,
    groupid = 2,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "竟然是这样，那么约克大叔，你当时可还有发现其他联盟军成员么？"
    };
getRow(14)->
    #show2Cfg {
    id = 14,
    groupid = 2,
    npcid = 3000,
    emotion = 1,
    name = "约克大叔",
    side = 1,
    content = "很抱歉，除了你以外，联盟军成员无一生还……"
    };
getRow(15)->
    #show2Cfg {
    id = 15,
    groupid = 2,
    npcid = 3000,
    emotion = 1,
    name = "约克大叔",
    side = 1,
    content = "我知道这个消息会让你很难过，但是我希望你能振作起来！这是你的武器，现在我该把它还给你了！"
    };
getRow(16)->
    #show2Cfg {
    id = 16,
    groupid = 2,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "他们……我不会放过魔族的，一定不会！"
    };
getRow(17)->
    #show2Cfg {
    id = 17,
    groupid = 2,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "呀！糟糕，有魔族在偷听我们说话！"
    };
getRow(18)->
    #show2Cfg {
    id = 18,
    groupid = 2,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "来得正好，接招吧！"
    };
getRow(19)->
    #show2Cfg {
    id = 19,
    groupid = 4,
    taskname = "小试身手",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "你生气的样子好可怕！不过力量却恢复了很多呢。请你冷静一下，别让愤怒冲昏了头脑。"
    };
getRow(20)->
    #show2Cfg {
    id = 20,
    groupid = 4,
    npcid = 3000,
    emotion = 1,
    name = "约克大叔",
    side = 1,
    content = "皮皮说的没错，年轻人，联盟军的事情大家都很难过。但幸运的是你还活着，这就是战胜魔族的希望！"
    };
getRow(21)->
    #show2Cfg {
    id = 21,
    groupid = 4,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "约克大叔，我知道这里的居民仍在遭受魔族的侵扰，现在你们大家一定需要我的帮助，请尽管开口！"
    };
getRow(22)->
    #show2Cfg {
    id = 22,
    groupid = 4,
    npcid = 3000,
    emotion = 1,
    name = "约克大叔",
    side = 1,
    content = "好，你和皮皮可以去逛逛港口的各处，魔族很狡猾，喜欢藏在暗处偷袭我们。"
    };
getRow(23)->
    #show2Cfg {
    id = 23,
    groupid = 4,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "好的，露娜女神正在休眠，在她醒来之前，光明勇士就跟皮皮四处走走吧~"
    };
getRow(24)->
    #show2Cfg {
    id = 24,
    groupid = 6,
    taskname = "疗伤药剂",
    npcid = 3000,
    emotion = 1,
    name = "约克大叔",
    side = 1,
    content = "等等！这是我从阿克勒城带回来的伤药，你们拿着，它会派上用场的。"
    };
getRow(25)->
    #show2Cfg {
    id = 25,
    groupid = 6,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "这怎么好意思……您已经帮助了我太多。"
    };
getRow(26)->
    #show2Cfg {
    id = 26,
    groupid = 6,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哎哎，光明勇士，约克大叔是个热心肠的人，你就别推辞啦，快收下吧！"
    };
getRow(27)->
    #show2Cfg {
    id = 27,
    groupid = 6,
    npcid = 3000,
    emotion = 1,
    name = "约克大叔",
    side = 1,
    content = "哦，我突然想起一件事，[fff000]猫绅士[-]丢失了心爱的[ff0000]魔法器[-]，你们过去帮帮他吧。"
    };
getRow(28)->
    #show2Cfg {
    id = 28,
    groupid = 6,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "当然，皮皮我们走吧。"
    };
getRow(29)->
    #show2Cfg {
    id = 29,
    groupid = 6,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "嗯！"
    };
getRow(30)->
    #show2Cfg {
    id = 30,
    groupid = 7,
    taskname = "猫绅士的委托",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "你好，猫绅士。约克大叔告诉我们，你弄丢了自己的魔法器，我们愿意帮你找到它。"
    };
getRow(31)->
    #show2Cfg {
    id = 31,
    groupid = 7,
    npcid = 3002,
    emotion = 1,
    name = "猫绅士",
    side = 1,
    content = "喵，那是我最重要的魔法器，通过它我们可以知道关于魔族的消息。所以请你们帮帮忙吧！"
    };
getRow(32)->
    #show2Cfg {
    id = 32,
    groupid = 7,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "没问题，猫绅士，请你回忆一下，你的魔法器在哪弄丢了呢？"
    };
getRow(33)->
    #show2Cfg {
    id = 33,
    groupid = 7,
    npcid = 3002,
    emotion = 1,
    name = "猫绅士",
    side = 1,
    content = "喵，我记得好像是在港口内的草丛一带……"
    };
getRow(34)->
    #show2Cfg {
    id = 34,
    groupid = 7,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "草丛……皮皮快跟我来！"
    };
getRow(35)->
    #show2Cfg {
    id = 35,
    groupid = 8,
    taskname = "提供情报",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "猫绅士你看，你丢失的魔法器，皮皮和光明勇士一起帮你找回来了！"
    };
getRow(36)->
    #show2Cfg {
    id = 36,
    groupid = 8,
    npcid = 3002,
    emotion = 1,
    name = "猫绅士",
    side = 1,
    content = "喵！喵！喵！太好了，我的宝贝，你终于回到主人身边了！"
    };
getRow(37)->
    #show2Cfg {
    id = 37,
    groupid = 8,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "猫绅士，请你向我提供一些关于魔族的线索。"
    };
getRow(38)->
    #show2Cfg {
    id = 38,
    groupid = 8,
    npcid = 3002,
    emotion = 1,
    name = "猫绅士",
    side = 1,
    content = "喵，魔导器已经发出提示，魔族即将在露娜女神的祭坛附近出现，你们快去女神那里吧！"
    };
getRow(39)->
    #show2Cfg {
    id = 39,
    groupid = 8,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "走吧，光明勇士，跟皮皮去见露娜女神吧！"
    };
getRow(40)->
    #show2Cfg {
    id = 40,
    groupid = 9,
    taskname = "露娜的召唤",
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "我终于见到你了，命中注定的光明勇士。"
    };
getRow(41)->
    #show2Cfg {
    id = 41,
    groupid = 9,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "露娜女神，我们的光明勇士似乎对净化魔族一事很疑惑呢，请您详细的告诉他一切吧。"
    };
getRow(42)->
    #show2Cfg {
    id = 42,
    groupid = 9,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "光明勇士，魔王[fff000]阿尔赛德[-]即将破除我的封印重回魔界。找到漂浮之石净化魔族，这是避免再次发生大陆战争的唯一办法。"
    };
getRow(43)->
    #show2Cfg {
    id = 43,
    groupid = 9,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "露娜女神，我要为死去的同伴报仇！所以我愿意接受您的指引去净化魔族，请您告诉我去哪能找到漂浮之石？"
    };
getRow(44)->
    #show2Cfg {
    id = 44,
    groupid = 9,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "光明勇士不要为仇恨而蒙蔽了双眼，据我所知阿克勒城那已经出现了魔族，你们尽快前往那里找到阿克勒城主，他会告诉你们关于漂浮之石的线索。"
    };
getRow(45)->
    #show2Cfg {
    id = 45,
    groupid = 9,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "是，女神大人。"
    };
getRow(46)->
    #show2Cfg {
    id = 46,
    groupid = 9,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "啊~不好，有很强烈的魔气出现，女神大人，您快看！"
    };
getRow(47)->
    #show2Cfg {
    id = 47,
    groupid = 10,
    taskname = "女神的委托",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "女神大人！刚才那个魔头，之前就是他带领魔族大军向我们的联盟军发动了进攻。"
    };
getRow(48)->
    #show2Cfg {
    id = 48,
    groupid = 10,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "他就是现任的魔族首领[fff000]斯诺卡[-]，是一个非常可怕的对手，你们千万要小心他！"
    };
getRow(49)->
    #show2Cfg {
    id = 49,
    groupid = 10,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "女神大人，斯诺卡这个坏蛋知道我们也在找漂浮之石一定会阻拦我们的，请您帮助光明勇士再回复一些力量吧。"
    };
getRow(50)->
    #show2Cfg {
    id = 50,
    groupid = 10,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "很抱歉，光明勇士，现在的我只为你唤醒出一点点光明之力，其余的力量需要你通过不断的历练才能彻底恢复。"
    };
getRow(51)->
    #show2Cfg {
    id = 51,
    groupid = 10,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "是，女神大人。不过我察觉到这附近还有魔族的存在，让我将它们找出来全部消灭吧！"
    };
getRow(52)->
    #show2Cfg {
    id = 52,
    groupid = 11,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "光明勇士净化魔族一趟艰难的旅程，我的灵体会一直伴随你左右。为了大陆的和平与安宁，请你全力以赴吧！"
    };
getRow(53)->
    #show2Cfg {
    id = 53,
    groupid = 11,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "是！我一定不会让大家失望的！皮皮，我们去港口一带寻找出海的船吧。"
    };
getRow(54)->
    #show2Cfg {
    id = 54,
    groupid = 11,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "嗯！猫绅士对港口一带的情况有所了解，我们先去听听他的建议吧。"
    };
getRow(55)->
    #show2Cfg {
    id = 55,
    groupid = 12,
    taskname = "前往港口",
    npcid = 3002,
    emotion = 1,
    name = "猫绅士",
    side = 1,
    content = "喵，你们要出海？那就去找[fff000]夏洛特吧[-]！他是港口内最棒的船长！"
    };
getRow(56)->
    #show2Cfg {
    id = 56,
    groupid = 12,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "谢谢您的推荐，皮皮，我们去见见那位夏洛特船长吧。"
    };
getRow(57)->
    #show2Cfg {
    id = 57,
    groupid = 13,
    taskname = "船长夏洛特",
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "你们是……？"
    };
getRow(58)->
    #show2Cfg {
    id = 58,
    groupid = 13,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "夏洛克船长你好，我们要去出海前往阿克勒城，听说您是港口里最棒的船长，可以带我们一起去么？"
    };
getRow(59)->
    #show2Cfg {
    id = 59,
    groupid = 13,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "谢谢你的赞美……但是很抱歉，这段时间内我不会考虑出海了。"
    };
getRow(60)->
    #show2Cfg {
    id = 60,
    groupid = 13,
    npcid = 3002,
    emotion = 1,
    name = "猫绅士",
    side = 1,
    content = "咦……为什么！？"
    };
getRow(61)->
    #show2Cfg {
    id = 61,
    groupid = 13,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "我的货船之前被海上的怪物破坏的十分严重，我也是侥幸活下来才回到港口，现在我只想全力以赴修好货船。"
    };
getRow(62)->
    #show2Cfg {
    id = 62,
    groupid = 13,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "船长大人能让我们先看看你的货船么，或许我们可以帮你一起修复它。"
    };
getRow(63)->
    #show2Cfg {
    id = 63,
    groupid = 13,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "没问题！如果你们能帮助我修复好它，我一定陪你们出海。"
    };
getRow(64)->
    #show2Cfg {
    id = 64,
    groupid = 14,
    taskname = "损坏的货船",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "额……确实破损的很严重呢，船长大人，你需要哪些修复的材料，皮皮和光明勇士帮您找来最好的！"
    };
getRow(65)->
    #show2Cfg {
    id = 65,
    groupid = 14,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "[ff0000]红木[-]，当时那只巨大的海怪一击便弄坏了船上的横杆，这次我要换上更结实的！"
    };
getRow(66)->
    #show2Cfg {
    id = 66,
    groupid = 14,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "好的，包在我们身上！"
    };
getRow(67)->
    #show2Cfg {
    id = 67,
    groupid = 15,
    taskname = "收集红木",
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "谢谢你们，五天以后你们再来到我这儿，我亲自开船带你们去阿克勒城！"
    };
getRow(68)->
    #show2Cfg {
    id = 68,
    groupid = 15,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "好，一言为定！不过我还是很好奇，船长大人口中的巨大海怪到底长什么样子呢？"
    };
getRow(69)->
    #show2Cfg {
    id = 69,
    groupid = 15,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "似乎是一只巨大的海象……它的力量实在太惊人了。若是再次出海真希望不要碰到它！"
    };
getRow(70)->
    #show2Cfg {
    id = 70,
    groupid = 15,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "夏洛特船长，五日以后我们再见啦。"
    };
getRow(71)->
    #show2Cfg {
    id = 71,
    groupid = 15,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "光明勇士，我们去居民区一带转转吧，或许还会发现隐藏的魔族呢！"
    };
getRow(72)->
    #show2Cfg {
    id = 72,
    groupid = 18,
    taskname = "隐藏的魔族",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "光明勇士，这里有几个木箱子正在移动，好奇怪啊！"
    };
getRow(73)->
    #show2Cfg {
    id = 73,
    groupid = 18,
    npcid = 3029,
    emotion = 1,
    name = "炸弹头头",
    side = 1,
    content = "该死，居然被你这个小丫头发现了，弟兄们，一起上！不能坏了[fff000]罗撒特[-]首领大事！"
    };
getRow(74)->
    #show2Cfg {
    id = 74,
    groupid = 18,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "哼，自不量力！"
    };
getRow(75)->
    #show2Cfg {
    id = 75,
    groupid = 19,
    npcid = 3029,
    emotion = 1,
    name = "炸弹头头",
    side = 1,
    content = "你们竟敢！哼，罗撒特首领不会放过你们的！"
    };
getRow(76)->
    #show2Cfg {
    id = 76,
    groupid = 19,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "……皮皮，罗撒特是谁？能让魔族称为首领，绝不是个简单的角色。"
    };
getRow(77)->
    #show2Cfg {
    id = 77,
    groupid = 19,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "皮皮也不知道，不如等我们到了居民区问问其他人吧。"
    };
getRow(78)->
    #show2Cfg {
    id = 78,
    groupid = 19,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "恩，走吧……皮皮，我听到了女孩子的哭，就在前面不远处，我们快过去看看！"
    };
getRow(79)->
    #show2Cfg {
    id = 79,
    groupid = 20,
    taskname = "少女呼救",
    npcid = 3005,
    emotion = 1,
    name = "苏珊",
    side = 1,
    content = "不要，不要揪我的辫子！哇啊啊！放开我！"
    };
getRow(80)->
    #show2Cfg {
    id = 80,
    groupid = 20,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "住手，你们居然连小女孩也不放过，皮皮生气了！"
    };
getRow(81)->
    #show2Cfg {
    id = 81,
    groupid = 21,
    taskname = "了解情况",
    npcid = 3005,
    emotion = 1,
    name = "苏珊",
    side = 1,
    content = "呜呜呜~呜呜呜！谢……谢你们……"
    };
getRow(82)->
    #show2Cfg {
    id = 82,
    groupid = 21,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "别哭了，已经没事了。女孩子哭起来就不好看啦~！皮皮问你，你知道罗撒特是什么人呢？"
    };
getRow(83)->
    #show2Cfg {
    id = 83,
    groupid = 21,
    npcid = 3005,
    emotion = 1,
    name = "苏珊",
    side = 1,
    content = "呜呜呜~呜呜呜！哇呜呜！他是大坏蛋，除了魔族，我最讨厌的就是他了！"
    };
getRow(84)->
    #show2Cfg {
    id = 84,
    groupid = 21,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "怎么哭都更凶了，快告诉皮皮，他到底都做了哪些坏事？"
    };
getRow(85)->
    #show2Cfg {
    id = 85,
    groupid = 21,
    npcid = 3005,
    emotion = 1,
    name = "苏珊",
    side = 1,
    content = "那个大坏蛋欺负大家，总是去码头找夏洛克叔叔的麻烦。还想把戴安娜姐姐抢走做新娘……呜哇哇！"
    };
getRow(86)->
    #show2Cfg {
    id = 86,
    groupid = 21,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "皮皮知道了，这个大坏蛋竟然如此可恶，在我们离开前一定会找到他狠狠的教训一顿，你就耐心得等待我们的好消息吧。"
    };
getRow(87)->
    #show2Cfg {
    id = 87,
    groupid = 22,
    taskname = "皮皮的智慧",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "光明勇士，听了魔族和苏珊的话，皮皮的心里有一个大胆的假设，这个罗撒特会不会与魔族有关呢？如果我们能找到他，或许就能把藏在港口内的魔族一网打尽呢！"
    };
getRow(88)->
    #show2Cfg {
    id = 88,
    groupid = 22,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "现在跟着皮皮再去露娜女神那里吧，或许女神大人能给我们一些提示。"
    };
getRow(89)->
    #show2Cfg {
    id = 89,
    groupid = 23,
    taskname = "邪恶的交易",
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "据我所知，之前夏洛克船长在海上的遭遇或许与那个罗撒特有关……"
    };
getRow(90)->
    #show2Cfg {
    id = 90,
    groupid = 23,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "咦？什么意思？夏洛克的货船明明是被海怪摧毁的，难道那个罗撒特是海怪么？"
    };
getRow(91)->
    #show2Cfg {
    id = 91,
    groupid = 23,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "不，罗撒特只是个拥有怪力的普通人类，但是他却贪婪的与魔族成员做了交易。"
    };
getRow(92)->
    #show2Cfg {
    id = 92,
    groupid = 23,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "罗撒特向魔族出卖自己灵魂，从魔族那里得到力量以便于自己继续在这港口内为非作歹。"
    };
getRow(93)->
    #show2Cfg {
    id = 93,
    groupid = 23,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "好愚蠢的家伙，露娜女神，那个罗撒特的实力肯定比低级魔族要厉害许多，在找到他前，可不可以请您再次激发光明勇士的潜力呢？"
    };
getRow(94)->
    #show2Cfg {
    id = 94,
    groupid = 23,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "战斗是提升实力最有效最明显的路径，前面的木屋有很强的魔族出现，这一次就让我的[ff0000]治愈神体[-]与你们一起出战。"
    };
getRow(95)->
    #show2Cfg {
    id = 95,
    groupid = 25,
    taskname = "追赶魔族",
    npcid = 3028,
    emotion = 1,
    name = "罗撒特",
    side = 1,
    content = "弟兄们，跟我一起烧了这间屋子，只要是人类所在地方，就把他们的地盘变成一片废墟！哈哈哈哈哈"
    };
getRow(96)->
    #show2Cfg {
    id = 96,
    groupid = 25,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "罗撒特！终于找到你了！你竟然敢毁了夏洛克船长最心爱的货船，今天光明勇士在此，他要为大家狠很教训你这个坏蛋！"
    };
getRow(97)->
    #show2Cfg {
    id = 97,
    groupid = 25,
    npcid = 3028,
    emotion = 1,
    name = "罗撒特",
    side = 1,
    content = "哟，小丫头很水灵，嘿嘿嘿，本大爷就喜欢你种细皮嫩肉的小孩子，味道美味极了！弟兄们抓住这两个人，本大爷重重有赏！"
    };
getRow(98)->
    #show2Cfg {
    id = 98,
    groupid = 26,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哼，知道我们的厉害了吧，你这个坏蛋，今天我们要为大家狠狠地教训你！"
    };
getRow(99)->
    #show2Cfg {
    id = 99,
    groupid = 26,
    npcid = 3028,
    emotion = 1,
    name = "罗撒特",
    side = 1,
    content = "小丫头，你们以为这样就能打败本大爷么？！看我的海王之力！喝！！！！"
    };
getRow(100)->
    #show2Cfg {
    id = 100,
    groupid = 26,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "啊！！！"
    };
getRow(101)->
    #show2Cfg {
    id = 101,
    groupid = 26,
    npcid = 3028,
    emotion = 1,
    name = "罗撒特",
    side = 1,
    content = "知道我的厉害了么！？我的魔宠海象不费吹灰之力就摧毁了那艘该死的货船，下次就把你们一起投到海里喂鲨鱼，哈哈哈哈！"
    };
getRow(102)->
    #show2Cfg {
    id = 102,
    groupid = 27,
    taskname = "女神之力",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "露娜女神我们回来了，刚刚那个罗撒特确实是个厉害的家伙！幸亏您的治愈神体陪我们一起，不然的话……"
    };
getRow(103)->
    #show2Cfg {
    id = 103,
    groupid = 27,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "别灰心，随着光明勇士的星月之力不断恢复，治愈神体的威力也会大幅度提升，况且未来我还会分出其他神体与你们共同迎战魔族。"
    };
getRow(104)->
    #show2Cfg {
    id = 104,
    groupid = 27,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "这样的话，露娜女神你的灵力会不会……"
    };
getRow(105)->
    #show2Cfg {
    id = 105,
    groupid = 27,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "只要能净化魔族，阻止阿尔赛德重回魔界，无论任何付出和牺牲都是值得的。"
    };
getRow(106)->
    #show2Cfg {
    id = 106,
    groupid = 27,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "皮皮和光明勇士一定会努力的，光明勇士，那个叫苏珊的小女孩似乎又有麻烦了呢，我们过去看看她。"
    };
getRow(107)->
    #show2Cfg {
    id = 107,
    groupid = 30,
    taskname = "找到苏珊",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "咦，你怎么又哭了，谁欺负你啦？"
    };
getRow(108)->
    #show2Cfg {
    id = 108,
    groupid = 30,
    npcid = 3005,
    emotion = 1,
    name = "苏珊",
    side = 1,
    content = "呜呜，我最喜欢的布娃娃……那是妈妈送给我的，就在刚才被安娜摔坏了！呜呜，她和罗撒特一样，也喜欢欺负大家。魔族……魔族都是坏人！"
    };
getRow(109)->
    #show2Cfg {
    id = 109,
    groupid = 30,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哦，我明白了，这个安娜也是魔族……奇怪，既然是魔族，怎么能光明正大的生活在阿克勒港呢？"
    };
getRow(110)->
    #show2Cfg {
    id = 110,
    groupid = 30,
    npcid = 3005,
    emotion = 1,
    name = "苏珊",
    side = 1,
    content = "呜，一开始大家都不知道安娜是魔族的身份，后来被人发现以后，我们都再也不敢和她一起玩了。"
    };
getRow(111)->
    #show2Cfg {
    id = 111,
    groupid = 31,
    taskname = "魔族的线索",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "光明勇士，港口里越来越多的魔族竟然敢公开扰乱大家的生活，无论如何一定要阻止他们继续制作混乱。至于这个安娜，很可能与罗撒特是一伙人，我们不能忽视她。"
    };
getRow(112)->
    #show2Cfg {
    id = 112,
    groupid = 31,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "不如，我们找到约克大叔向他打听一下安娜的具体情况。"
    };
getRow(113)->
    #show2Cfg {
    id = 113,
    groupid = 32,
    taskname = "坏女孩安娜",
    npcid = 3000,
    emotion = 1,
    name = "约克大叔",
    side = 1,
    content = "苏珊说的没错，因为魔族的身份大家都不愿意与安娜一家来往。"
    };
getRow(114)->
    #show2Cfg {
    id = 114,
    groupid = 32,
    npcid = 3000,
    emotion = 1,
    name = "约克大叔",
    side = 1,
    content = "自从她父亲消失了以后，安娜就开始喜欢四处制造麻烦，或许她觉得自己这样做能引起大家的注意吧。"
    };
getRow(115)->
    #show2Cfg {
    id = 115,
    groupid = 32,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "约克大叔，皮皮怀疑安娜和罗撒特是一起做坏事的同伴，我们要找到她当面问清楚。请您再告诉我们一些关于她的线索吧。"
    };
getRow(116)->
    #show2Cfg {
    id = 116,
    groupid = 32,
    npcid = 3000,
    emotion = 1,
    name = "约克大叔",
    side = 1,
    content = "我可要提醒你们，那个小丫头的脾气暴躁的很啊！至于线索，你不如问问[fff000]戴安娜，维克托[-]他们。这几天安娜给他们找了不少麻烦。"
    };
getRow(117)->
    #show2Cfg {
    id = 117,
    groupid = 33,
    taskname = "丢失的项链",
    npcid = 3006,
    emotion = 1,
    name = "戴安娜",
    side = 1,
    content = "你们向我询问安娜的事？哼，我的项链被那个坏女孩抢走埋在了树底下，请你们帮我找出来好么，那可是维克托叔叔为我打造的生日礼物。"
    };
getRow(118)->
    #show2Cfg {
    id = 118,
    groupid = 33,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "没问题，不过你要告诉皮皮，安娜把项链埋在了哪棵树下了呢？"
    };
getRow(119)->
    #show2Cfg {
    id = 119,
    groupid = 33,
    npcid = 3006,
    emotion = 1,
    name = "戴安娜",
    side = 1,
    content = "嗯……我想想，应该是[fff000]龙虾人[-]附近，它每天要制作鱼丸，经常把鱼骨埋在周围的树底下。"
    };
getRow(120)->
    #show2Cfg {
    id = 120,
    groupid = 33,
    npcid = 3006,
    emotion = 1,
    name = "戴安娜",
    side = 1,
    content = "那一带到处都是腥鱼的味道，安娜为了不让我顺利找回项链，很可能把它藏在那。"
    };
getRow(121)->
    #show2Cfg {
    id = 121,
    groupid = 33,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "腥鱼……好狡猾的女孩，居然把宝贵的项链埋在那么臭的地方！放心吧，这位姐姐我们一定帮你取回项链的。"
    };
getRow(122)->
    #show2Cfg {
    id = 122,
    groupid = 33,
    npcid = 3006,
    emotion = 1,
    name = "戴安娜",
    side = 1,
    content = "好，我等着你们的好消息。不过，你们要当心，那个安娜喜欢在暗处偷袭别人……"
    };
getRow(123)->
    #show2Cfg {
    id = 123,
    groupid = 34,
    taskname = "寻找项链",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "天啊！好臭的味道。光明勇士辛苦你啦！"
    };
getRow(124)->
    #show2Cfg {
    id = 124,
    groupid = 34,
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "可恶，你们既然喜欢多管闲事，不如尝尝这个！"
    };
getRow(125)->
    #show2Cfg {
    id = 125,
    groupid = 34,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "光明勇士小心，她手上拿着的是毒药！安娜你站住！今天我们就要替大伙好好教训你！"
    };
getRow(126)->
    #show2Cfg {
    id = 126,
    groupid = 34,
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "哼哼哼！你们抓得到我么？吉娜大人研制的毒药的滋味你们就好好享受吧！"
    };
getRow(127)->
    #show2Cfg {
    id = 127,
    groupid = 34,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "咳咳！可恶居然使用毒药，光明勇士，前面那个人就是铁匠维克托先生，他是港口里最棒的铁匠，你若是需要打造武器的话，尽管找他帮忙。"
    };
getRow(128)->
    #show2Cfg {
    id = 128,
    groupid = 35,
    taskname = "失踪的戒指",
    npcid = 3008,
    emotion = 1,
    name = "维克托",
    side = 1,
    content = "你们是要去对付魔族那个臭丫头么？她不仅拿走了我为戴安娜打造的项链还抢走了我妻子的戒指，求求你们帮大家把魔族统统赶走吧，我们实在受不了！"
    };
getRow(129)->
    #show2Cfg {
    id = 129,
    groupid = 35,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "维托克先生，我们已经帮戴安娜小姐找到了项链，至于你的戒指也交给我们去寻找吧。不过，您能告诉我们一些关于安娜的事情么？"
    };
getRow(130)->
    #show2Cfg {
    id = 130,
    groupid = 35,
    npcid = 3008,
    emotion = 1,
    name = "维克托",
    side = 1,
    content = "没问题，前面最偏僻的小房子就是她的家！既然你们要去对付她，不如先把自己武器交给我来打造，保证你们使用起来更加得心应手！那个丫头很厉害！"
    };
getRow(131)->
    #show2Cfg {
    id = 131,
    groupid = 35,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "好的，不过我们还是先帮您找到戒指吧。"
    };
getRow(132)->
    #show2Cfg {
    id = 132,
    groupid = 36,
    taskname = "寻找戒指",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "咦，这枚戒指怎么落在这……维克托先生，你好像误会了，那个魔族安娜并没有拿走你的戒指哦。"
    };
getRow(133)->
    #show2Cfg {
    id = 133,
    groupid = 36,
    npcid = 3008,
    emotion = 1,
    name = "维克托",
    side = 1,
    content = "额……是么，看来是我不小心造成的，哈哈哈哈。不过呢，那个安娜平时做的坏事太多了，我还是希望你们能替大伙教训她。"
    };
getRow(134)->
    #show2Cfg {
    id = 134,
    groupid = 36,
    npcid = 3008,
    emotion = 1,
    name = "维克托",
    side = 1,
    content = "哦，我想起来了，有时候安娜出去做坏事时身旁会出现两个魔族，应该是她使用法术召唤出来的怪物，你们要小心啊！"
    };
getRow(135)->
    #show2Cfg {
    id = 135,
    groupid = 37,
    taskname = "安娜的家",
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "呵，你们居然找上门来了！怎么想跟我打架吗，难道忘了毒药的厉害？"
    };
getRow(136)->
    #show2Cfg {
    id = 136,
    groupid = 37,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "你欺负别人还理直气壮，哼，皮皮今天一定要教训你！"
    };
getRow(137)->
    #show2Cfg {
    id = 137,
    groupid = 37,
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "好啊，打输了可不许哭鼻子！"
    };
getRow(138)->
    #show2Cfg {
    id = 138,
    groupid = 38,
    taskname = "魔族之力",
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "谢谢你们救了我……可是我的父亲，魔族不会放过他的，吉娜那个恶毒女人，一定会加倍折磨我的父亲……"
    };
getRow(139)->
    #show2Cfg {
    id = 139,
    groupid = 38,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "安娜，或许你的父亲早已经被它们害死，那些魔族只是想利用你继续在阿克勒港口做坏事……"
    };
getRow(140)->
    #show2Cfg {
    id = 140,
    groupid = 38,
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "恩，其实你说的这些我早已经想到了，可是我还是抱着一丝丝侥幸，希望父亲还活着。港口的小伙伴很多是与我一起长大，我真的，真的不想做那些坏事。"
    };
getRow(141)->
    #show2Cfg {
    id = 141,
    groupid = 38,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "好了，你不需要再解释那么多，皮皮相信你虽然是魔族，但你却是一个善良的魔族。回去以后皮皮会向大家解释清楚，你放心好啦。"
    };
getRow(142)->
    #show2Cfg {
    id = 142,
    groupid = 38,
    npcid = 3009,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "好，我相信你们，并且我保证从今往后不再做坏事。对了，我知道你们在调查罗撒特的事，再过不久他会带领人手前往码头一带制造混乱，夏洛克船长的处境会很危险，请你们救救他！"
    };
getRow(143)->
    #show2Cfg {
    id = 143,
    groupid = 38,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "安娜，谢谢你告诉我们这么重要的事情，皮皮和光明勇士一定会保护好夏洛克船长还有整个在阿克勒港口生活的人，我们一定会打败魔族的！"
    };
getRow(144)->
    #show2Cfg {
    id = 144,
    groupid = 39,
    taskname = "港口美味",
    npcid = 3008,
    emotion = 1,
    name = "维克托",
    side = 1,
    content = "咦？你们说的是真的，安娜她……她不是真的要害大家？我能相信么……"
    };
getRow(145)->
    #show2Cfg {
    id = 145,
    groupid = 39,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "维克托先生就算不相信安娜的话，也该相信皮皮和光明勇士吧。皮皮亲眼所见那些魔族威胁安娜做坏事，请大家给安娜一次机会吧。"
    };
getRow(146)->
    #show2Cfg {
    id = 146,
    groupid = 39,
    npcid = 3008,
    emotion = 1,
    name = "维克托",
    side = 1,
    content = "好，我愿意相信你们！哈哈哈，你们多次帮助大家解决危机，作为这里的居民，我建议你们去尝尝港口特有的美食，就在龙虾人那，快去吧！"
    };
getRow(147)->
    #show2Cfg {
    id = 147,
    groupid = 39,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "好耶！皮皮也感到肚子有点饿了，光明勇士我快去龙虾人那里吧。"
    };
getRow(148)->
    #show2Cfg {
    id = 148,
    groupid = 42,
    taskname = "寻找龙虾人",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "龙虾人先生，皮皮听说你制作的鱼丸是港口有名的美味，皮皮想尝尝可以么？"
    };
getRow(149)->
    #show2Cfg {
    id = 149,
    groupid = 42,
    npcid = 3001,
    emotion = 1,
    name = "龙虾人",
    side = 1,
    content = "……没问题，只不过现在你们无法吃到口感最正宗的鱼丸。"
    };
getRow(150)->
    #show2Cfg {
    id = 150,
    groupid = 43,
    taskname = "购买鱼丸",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "咦，这鱼丸怎么感觉不太新鲜，龙虾人先生你……"
    };
getRow(151)->
    #show2Cfg {
    id = 151,
    groupid = 43,
    npcid = 3001,
    emotion = 1,
    name = "龙虾人",
    side = 1,
    content = "真的很抱歉，自从夏洛克的货船出事了以后，我很难从大家那购买到新鲜的鱼，这一切都是魔族造成的！"
    };
getRow(152)->
    #show2Cfg {
    id = 152,
    groupid = 43,
    npcid = 3001,
    emotion = 1,
    name = "龙虾人",
    side = 1,
    content = "我知道你们对抗魔族的事情，只要你们帮助大家赶走魔族，我愿意免费为你们制作美味的鱼丸。"
    };
getRow(153)->
    #show2Cfg {
    id = 153,
    groupid = 43,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "咳咳，打败魔族是我们的使命，不过龙虾人先生说的话一定要算数哦！"
    };
getRow(154)->
    #show2Cfg {
    id = 154,
    groupid = 44,
    taskname = "消失的鱼丸",
    npcid = 3001,
    emotion = 1,
    name = "龙虾人",
    side = 1,
    content = "对了，你们是要前往港口么？可不可以帮我把这些鱼丸送到猫绅士那里，虽然不如以往新鲜，但是猫绅士是不会介意的。"
    };
getRow(155)->
    #show2Cfg {
    id = 155,
    groupid = 0,
    npcid = 3001,
    emotion = 1,
    name = "龙虾人",
    side = 1,
    content = "咦？奇怪啊，我的鱼丸怎么会少了这么多，刚才还在的……"
    };
getRow(156)->
    #show2Cfg {
    id = 156,
    groupid = 44,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "等等，偷走你鱼丸的人就在附近，皮皮给你找出来！"
    };
getRow(157)->
    #show2Cfg {
    id = 157,
    groupid = 45,
    taskname = "史莱姆大王",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "放下龙虾人先生的鱼丸，否则皮皮不客气了！"
    };
getRow(158)->
    #show2Cfg {
    id = 158,
    groupid = 45,
    npcid = 3027,
    emotion = 1,
    name = "史莱姆大王",
    side = 1,
    content = "它鱼丸快要坏掉了，我们史莱姆好心帮它吃掉有什么不对！？"
    };
getRow(159)->
    #show2Cfg {
    id = 159,
    groupid = 45,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哼，你们偷东西还理直气壮，真是太可恶了，光明勇士，我们现在就把鱼丸抢回来！"
    };
getRow(160)->
    #show2Cfg {
    id = 160,
    groupid = 45,
    npcid = 3027,
    emotion = 1,
    name = "史莱姆大王",
    side = 1,
    content = "史莱姆的宗旨是吃光一切美味，鱼丸已经在我们的肚子里，你们再也拿不回来了！"
    };
getRow(161)->
    #show2Cfg {
    id = 161,
    groupid = 46,
    taskname = "追踪史莱姆",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "这次算是将史莱姆们一网打尽了！可是，可是鱼丸都被吃掉了…呜呜…"
    };
getRow(162)->
    #show2Cfg {
    id = 162,
    groupid = 46,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "咦？光明勇士你看，这些史莱姆体内居然有亮闪闪的石头呢，不如我们将这些石头交给猫绅士，就当是史莱姆赔偿应该给他的鱼丸吧。"
    };
getRow(163)->
    #show2Cfg {
    id = 163,
    groupid = 47,
    taskname = "再遇猫绅士",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "猫绅士，史莱姆大王吃掉龙虾人为你制作的所有的鱼丸，这些石头是我们在史莱姆大王那里发现的，就全部送给你了。"
    };
getRow(164)->
    #show2Cfg {
    id = 164,
    groupid = 47,
    npcid = 3002,
    emotion = 1,
    name = "猫绅士",
    side = 1,
    content = "喵，你们来得正好，魔导器显示，这港口附近马上要出现厉害的魔族，估计他们是冲着夏洛克来的，你们不是要跟着夏洛克出海么，可要做好准备啊！"
    };
getRow(165)->
    #show2Cfg {
    id = 165,
    groupid = 47,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "一定是罗撒特！光明勇士，安娜没有骗我们，这个罗撒特如期来到码头找夏洛克船长的麻烦，我们马上就去夏洛克船长那里看看吧！"
    };
getRow(166)->
    #show2Cfg {
    id = 166,
    groupid = 48,
    taskname = "强敌来临",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "出来吧，可恶的魔族，无论如何，我们绝不会让你们再次毁坏夏洛克船长的货船！"
    };
getRow(167)->
    #show2Cfg {
    id = 167,
    groupid = 48,
    npcid = 3028,
    emotion = 1,
    name = "罗撒特",
    side = 1,
    content = "哈哈哈，两个小不点居然想阻止本大爷？弟兄们，这两个人就交给你们，就当是热心运动吧！"
    };
getRow(168)->
    #show2Cfg {
    id = 168,
    groupid = 49,
    taskname = "罗撒特的弱点",
    npcid = 3002,
    emotion = 1,
    name = "猫绅士",
    side = 1,
    content = "喵，罗撒特带领自己全部的手下都聚集到了码头，看来是要准备动手阻止你们出海。"
    };
getRow(169)->
    #show2Cfg {
    id = 169,
    groupid = 49,
    npcid = 3002,
    emotion = 1,
    name = "猫绅士",
    side = 1,
    content = "他虽然掌握了魔族的力量，但是无法承受魔力太久，你们不妨拖延时间等待打败他的时机。"
    };
getRow(170)->
    #show2Cfg {
    id = 170,
    groupid = 49,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "谢谢猫绅士的建议，你虽然高冷了一些，但是心肠好好！"
    };
getRow(171)->
    #show2Cfg {
    id = 171,
    groupid = 49,
    npcid = 3002,
    emotion = 1,
    name = "猫绅士",
    side = 1,
    content = "喵，绅士要有绅士的风度和气度，毕竟你们之前帮过我的忙，我总要回报一些的！对了，别忘了及时召唤出女神大人的灵体，她会帮助你们渡过难关的。"
    };
getRow(172)->
    #show2Cfg {
    id = 172,
    groupid = 50,
    taskname = "会和夏洛特",
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "你们来得很及时，我的船昨晚就已经修好了。我看了看太阳，再过一个小时是出海的最佳时刻。"
    };
getRow(173)->
    #show2Cfg {
    id = 173,
    groupid = 50,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "夏洛克船长，皮皮很高兴你愿意带我出海。可是这港口附近出现了罗撒特那群坏蛋，皮皮和光明勇士一定会保护好你还有你的货船。"
    };
getRow(174)->
    #show2Cfg {
    id = 174,
    groupid = 50,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "罗撒特那个家伙一直想取代我成为阿克勒港口唯一的船长，却不知没有一颗善良的心，是永远无法被海神认可的。"
    };
getRow(175)->
    #show2Cfg {
    id = 175,
    groupid = 50,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "先不提他，我已经备好在路上所需要的食物和水，你们去仓库那里给我搬过来吧。"
    };
getRow(176)->
    #show2Cfg {
    id = 176,
    groupid = 50,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "好~皮皮和光明勇士马上回来！"
    };
getRow(177)->
    #show2Cfg {
    id = 177,
    groupid = 51,
    taskname = "准备食物",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "船长大人太棒了，他居然准备了皮皮喜欢的鱼肉！"
    };
getRow(178)->
    #show2Cfg {
    id = 178,
    groupid = 0,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "光明勇士，离开港口前，皮皮想和各位小伙伴告个别，真的很舍不得大家呢！我们就先去苏珊那里吧。"
    };
getRow(179)->
    #show2Cfg {
    id = 179,
    groupid = 52,
    taskname = "告别伙伴",
    npcid = 3005,
    emotion = 1,
    name = "苏珊",
    side = 1,
    content = "呜呜，苏珊好舍不得你们……你们走了以后，罗撒特和安娜又来欺负我们怎么办，呜呜……"
    };
getRow(180)->
    #show2Cfg {
    id = 180,
    groupid = 52,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "不哭不哭，皮皮和光明勇士要去寻找净化魔族的生命石，等事情结束后，我们会再次返回这里和大家一起生活。"
    };
getRow(181)->
    #show2Cfg {
    id = 181,
    groupid = 52,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "还有，安娜已经保证不会再欺负大家了，就请你相信她一次吧。至于罗撒特，今日光明勇士一定彻底打败他恢复港口的安宁！"
    };
getRow(182)->
    #show2Cfg {
    id = 182,
    groupid = 52,
    npcid = 3005,
    emotion = 1,
    name = "苏珊",
    side = 1,
    content = "恩恩，苏珊相信你们，等你们以后一定要来找我玩哦！"
    };
getRow(183)->
    #show2Cfg {
    id = 183,
    groupid = 53,
    taskname = "港口遇袭",
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "准备好了么，我们出发吧。"
    };
getRow(184)->
    #show2Cfg {
    id = 184,
    groupid = 53,
    npcid = 3028,
    emotion = 1,
    name = "罗撒特",
    side = 1,
    content = "夏洛特！今日本大爷带着全部的兄弟来到这里，识趣的话乖乖滚出阿克勒港口，否则本大爷的魔灵兽把你连同你的那艘破船一同扔到海里喂鲨鱼，哈哈哈哈！"
    };
getRow(185)->
    #show2Cfg {
    id = 185,
    groupid = 53,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "欺人太甚！罗撒特，你这条魔族的走狗，居然为了自己的利益而残害自己的同族，今天你便接受星月之力的制裁吧！"
    };
getRow(186)->
    #show2Cfg {
    id = 186,
    groupid = 53,
    npcid = 3028,
    emotion = 1,
    name = "罗撒特",
    side = 1,
    content = "不知天高地厚的小丫头，看我把你们统统撕成碎片！"
    };
getRow(187)->
    #show2Cfg {
    id = 187,
    groupid = 54,
    taskname = "保护货船",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "夏洛克船长！你受伤了！"
    };
getRow(188)->
    #show2Cfg {
    id = 188,
    groupid = 54,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "你们别管我，这件兵器接着！专心对付罗撒特！"
    };
getRow(189)->
    #show2Cfg {
    id = 189,
    groupid = 54,
    npcid = 3028,
    emotion = 1,
    name = "罗撒特",
    side = 1,
    content = "哈哈哈……你们以为自己赢了么？我才是真正的阿克勒港口的船长，看我的魔灵兽！喝！！！！"
    };
getRow(190)->
    #show2Cfg {
    id = 190,
    groupid = 54,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "啊！那个是！！"
    };
getRow(191)->
    #show2Cfg {
    id = 191,
    groupid = 54,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "啊，之前就是那个家伙毁了我的货船，这里的魔族交给我，拜托你们，无论如何一定要保护好货船！"
    };
getRow(192)->
    #show2Cfg {
    id = 192,
    groupid = 55,
    taskname = "夏洛特的委托",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "船长大人，您伤的很严重呢……呜！"
    };
getRow(193)->
    #show2Cfg {
    id = 193,
    groupid = 55,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "我不能与你们一起出海了，谢谢你们帮我保护了货船。我有个不情之请，希望你们能答应我。"
    };
getRow(194)->
    #show2Cfg {
    id = 194,
    groupid = 55,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "呜，只要皮皮与光明勇士能做到，就一定帮你实现！"
    };
getRow(195)->
    #show2Cfg {
    id = 195,
    groupid = 55,
    npcid = 3004,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "我的未婚妻露露在阿克勒城内，现在那里已经聚集了不少魔族……我担心她的情况，你们到了那里以后尽量分出一些精力替我保护她。"
    };
getRow(196)->
    #show2Cfg {
    id = 196,
    groupid = 55,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "嗯嗯嗯，你一定要好起来，你的心意我们一定会转达给露露的，而且皮皮和光明勇士一定会保护露露的。"
    };
getRow(197)->
    #show2Cfg {
    id = 197,
    groupid = 0,
    npcid = 0,
    emotion = 0,
    side = 0
    };
getRow(198)->
    #show2Cfg {
    id = 198,
    groupid = 56,
    taskname = "东城郊码头",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "光明勇士，这里就是[fff000]阿克勒东成郊[-]，再往前面走不远，我们就能看到阿克勒城的入口。咦？前面有个公告栏，我们过去看看。"
    };
getRow(199)->
    #show2Cfg {
    id = 199,
    groupid = 57,
    taskname = "阿克勒瘟疫",
    npcid = 3032,
    emotion = 1,
    name = "安迪",
    side = 1,
    content = "你们好，远方来的客人，你们是想进入阿克勒城么？"
    };
getRow(200)->
    #show2Cfg {
    id = 200,
    groupid = 57,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "是的没错，这位先生，皮皮刚刚看了告示栏，城内发生了可怕的瘟疫，我们想进入阿克勒城寻找城主大人。"
    };
getRow(201)->
    #show2Cfg {
    id = 201,
    groupid = 57,
    npcid = 3032,
    emotion = 1,
    name = "安迪",
    side = 1,
    content = "现在城内很危险，瘟疫发生过后大家都很害怕，已经有很多人陆续离开了。"
    };
getRow(202)->
    #show2Cfg {
    id = 202,
    groupid = 57,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "皮皮和光明勇士不怕，我们来到这正是想帮助大家驱散瘟疫。"
    };
getRow(203)->
    #show2Cfg {
    id = 203,
    groupid = 57,
    npcid = 3032,
    emotion = 1,
    name = "安迪",
    side = 1,
    content = "那真是太好了，现在我们都盼望着解毒药水能早日研制出来，前面的入口就是阿克勒城门，你们快去吧。"
    };
getRow(204)->
    #show2Cfg {
    id = 204,
    groupid = 58,
    taskname = "生命石的线索",
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "啊哈哈，太好了，终于见到拿武器的年轻人了！你们可以帮我一个忙么，我愿意出付大价钱做酬金！"
    };
getRow(205)->
    #show2Cfg {
    id = 205,
    groupid = 58,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "酬金……嗯，这位先生，你先说说看，到底发生了什么事！"
    };
getRow(206)->
    #show2Cfg {
    id = 206,
    groupid = 58,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "我在阿克勒城花大价钱买来一颗石头，它可以治疗普通人的病痛，我本打算带着它回故乡的。"
    };
getRow(207)->
    #show2Cfg {
    id = 207,
    groupid = 58,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "结果刚刚出城没多久就被一群丑陋的怪物盯上，把我的箱子抢走了，求求你们替我把它拿回来吧！"
    };
getRow(208)->
    #show2Cfg {
    id = 208,
    groupid = 58,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "[2becf8]（治疗病痛，难道是生命石……）[-]光明勇士，我们帮帮他吧！"
    };
getRow(209)->
    #show2Cfg {
    id = 209,
    groupid = 59,
    taskname = "耍赖的商人",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "[2becf8]（讨厌！竟然只是一颗紫色的宝石，好失望……）[-]杰斯先生，你的箱子，这次要收好它。"
    };
getRow(210)->
    #show2Cfg {
    id = 210,
    groupid = 59,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "太谢谢了，我记住你们了。以后我还来阿克勒城做生意，到时候一并付给你们酬金。啊哈哈！"
    };
getRow(211)->
    #show2Cfg {
    id = 211,
    groupid = 59,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哼，两句话就想打发皮皮和光明勇士！很好，我们也记住你了，以后再碰到被人抢走了宝贝，我们才不会理你呢！"
    };
getRow(212)->
    #show2Cfg {
    id = 212,
    groupid = 60,
    taskname = "琳达的委托",
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1,
    content = "嗨！我是灵兽师琳达。我的灵兽在这里秋秋跑丢了，你们可以帮我找到它么？"
    };
getRow(213)->
    #show2Cfg {
    id = 213,
    groupid = 60,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "好的啊！这位小姐姐，你要告诉皮皮，灵兽秋秋的样子啊！"
    };
getRow(214)->
    #show2Cfg {
    id = 214,
    groupid = 60,
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1,
    content = "它是一只小野猪，很淘气，喜欢吃这里的野果。"
    };
getRow(215)->
    #show2Cfg {
    id = 215,
    groupid = 60,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "让皮皮感觉一下它的气息……啊~在那里，皮皮听到声音了！"
    };
getRow(216)->
    #show2Cfg {
    id = 216,
    groupid = 61,
    taskname = "摇摆的草丛",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哇，秋秋好可爱！你该回到主人身边啦，她很担心呢！"
    };
getRow(217)->
    #show2Cfg {
    id = 217,
    groupid = 61,
    npcid = 3053,
    emotion = 1,
    name = "秋秋",
    side = 1,
    content = "秋秋不想回到主人身边，秋秋想要去冒险！你们可以带上我一起么？"
    };
getRow(218)->
    #show2Cfg {
    id = 218,
    groupid = 61,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "咦？虽然皮皮很喜欢你，但是你想要和我们一起，皮皮必须要征求你主人的同意呢！"
    };
getRow(219)->
    #show2Cfg {
    id = 219,
    groupid = 61,
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1,
    content = "既然秋秋喜欢跟着你们，那我就只好同意了，不过你们一定要仔细的照顾它哦。"
    };
getRow(220)->
    #show2Cfg {
    id = 220,
    groupid = 61,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "好哒~谢谢小姐姐，皮皮会好好照顾秋秋的！"
    };
getRow(221)->
    #show2Cfg {
    id = 221,
    groupid = 62,
    taskname = "城郊巡逻官",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "长官大人，城主大人同意我们进入东成郊区域清理魔族，请您提供给我们具体的魔族所活动的区域好么？"
    };
getRow(222)->
    #show2Cfg {
    id = 222,
    groupid = 62,
    npcid = 3035,
    emotion = 1,
    name = "巡逻官鲍勃",
    side = 1,
    content = "没问题，不过在此之前，请你们先出示进入东成郊地带的通行证，这是守城军的规定。"
    };
getRow(223)->
    #show2Cfg {
    id = 223,
    groupid = 63,
    taskname = "出示通行证",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "皮皮已经出示了通行证，长官大人请告诉我们一些关于魔族的情况吧。"
    };
getRow(224)->
    #show2Cfg {
    id = 224,
    groupid = 63,
    npcid = 3035,
    emotion = 1,
    name = "巡逻官鲍勃",
    side = 1,
    content = "这里的魔族通常在树林中的深处生活，最近几日不知为何，魔族与魔族之间还发生了争斗。"
    };
getRow(225)->
    #show2Cfg {
    id = 225,
    groupid = 63,
    npcid = 3035,
    emotion = 1,
    name = "巡逻官鲍勃",
    side = 1,
    content = "我们这些守城军亲眼所见，但是因为惧怕魔族的瘟疫，都不敢上前去看看究竟。你们要进入东成郊深处驱赶魔族，一定要小心。万一遇到了危险就马上撤退，千万不要逞强。"
    };
getRow(226)->
    #show2Cfg {
    id = 226,
    groupid = 63,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "竟有这种事！皮皮和光明勇士一定会查清事情的真相，请你们静候佳音吧！"
    };
getRow(227)->
    #show2Cfg {
    id = 227,
    groupid = 64,
    taskname = "杰斯的嘲讽",
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "哈，我们又见面了，你们这么快就要离开阿克勒城了么？不如做我的保镖，跟我回故乡发财吧！"
    };
getRow(228)->
    #show2Cfg {
    id = 228,
    groupid = 64,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "咳咳，皮皮才不和你这样的人做朋友呢，我们是要去消灭这里的魔族解救大家，杰斯先生你还是早点离开这里吧！"
    };
getRow(229)->
    #show2Cfg {
    id = 229,
    groupid = 64,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "赶走魔族，就凭你们？连护城军都应付不了魔族，我劝你们还是不要去逞强了，万一失败了岂不是太丢人了！"
    };
getRow(230)->
    #show2Cfg {
    id = 230,
    groupid = 64,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哼，别小看我们，光明勇士，我们出发！"
    };
getRow(231)->
    #show2Cfg {
    id = 231,
    groupid = 65,
    taskname = "神秘礼物",
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "你身上的这些绒毛是？让我看看……啊哈，是狐狸绒毛，你们从哪里弄到的，我愿意出大价钱收购！"
    };
getRow(232)->
    #show2Cfg {
    id = 232,
    groupid = 65,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "你之前已经骗过我们一次了，皮皮才不信你的话呢。"
    };
getRow(233)->
    #show2Cfg {
    id = 233,
    groupid = 65,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "哎哎，先别忙着走啊！就让我表现一些诚意吧，这里的魔族似乎也是因为瘟疫的事情发生了争斗，你们小心些……"
    };
getRow(234)->
    #show2Cfg {
    id = 234,
    groupid = 65,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "知道了，谢谢！"
    };
getRow(235)->
    #show2Cfg {
    id = 235,
    groupid = 66,
    taskname = "深入东成郊",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "这位先生，您一个人在这里很危险，赶快离开吧！"
    };
getRow(236)->
    #show2Cfg {
    id = 236,
    groupid = 66,
    npcid = 3036,
    emotion = 1,
    name = "卡卡",
    side = 1,
    content = "终于有人来救我了，我掉入了魔族设下的陷阱，现在无法走路了！"
    };
getRow(237)->
    #show2Cfg {
    id = 237,
    groupid = 66,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "您别害怕，我们来帮您。等等，光明勇士，这里有魔族的气味！"
    };
getRow(238)->
    #show2Cfg {
    id = 238,
    groupid = 67,
    taskname = "污秽大魔王",
    npcid = 3040,
    emotion = 1,
    name = "污秽的大恶魔",
    side = 1,
    content = "你们好过分，竟然恩将仇报！要不是我们把这个老头困在这里，他差一点就被吉娜的手下抓走了！"
    };
getRow(239)->
    #show2Cfg {
    id = 239,
    groupid = 67,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "胡说八道，你们这些散播瘟疫的魔族会救人类，光明勇士，别让他们跑掉！"
    };
getRow(240)->
    #show2Cfg {
    id = 240,
    groupid = 67,
    npcid = 3040,
    emotion = 1,
    name = "污秽的大恶魔",
    side = 1,
    content = "哼，你们别想找到我们！"
    };
getRow(241)->
    #show2Cfg {
    id = 241,
    groupid = 68,
    taskname = "乘胜追击",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哼哼，看你们往哪里跑！"
    };
getRow(242)->
    #show2Cfg {
    id = 242,
    groupid = 68,
    npcid = 3040,
    emotion = 1,
    name = "污秽的大恶魔",
    side = 1,
    content = "兄弟们，有人擅自闯入我们的地盘，来吧，让我们用粘液赶走他们！"
    };
getRow(243)->
    #show2Cfg {
    id = 243,
    groupid = 68,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "啊！粘液，好恶心！"
    };
getRow(244)->
    #show2Cfg {
    id = 244,
    groupid = 69,
    taskname = "草药迷卡卡",
    npcid = 3036,
    emotion = 1,
    name = "卡卡",
    side = 1,
    content = "谢谢你们救了我，我是城里的药剂师卡卡，进入东成郊这里寻找清除瘟疫的草药，你们又为什么会来这里？"
    };
getRow(245)->
    #show2Cfg {
    id = 245,
    groupid = 69,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "皮皮和光明使者受城主大人的委托来这里清理魔族，您一个人来这里寻找清除瘟疫的草药实在太危险了！"
    };
getRow(246)->
    #show2Cfg {
    id = 246,
    groupid = 69,
    npcid = 3036,
    emotion = 1,
    name = "卡卡",
    side = 1,
    content = "一开始我身上带着一些避魔草药，普通的魔族不敢靠近我。但是没想到居然在这里遇上了高级魔族……"
    };
getRow(247)->
    #show2Cfg {
    id = 247,
    groupid = 69,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "现在已经没事了，卡卡教授，您还是尽快回去吧，城门口的鲍勃长官会帮助您的。"
    };
getRow(248)->
    #show2Cfg {
    id = 248,
    groupid = 70,
    taskname = "卡卡的请求",
    npcid = 3036,
    emotion = 1,
    name = "卡卡",
    side = 1,
    content = "不找到草药我绝不回去，你们愿意和我一起寻找草药么，事成之后，我愿意教你们掌握制作驱除瘟疫药剂的办法。"
    };
getRow(249)->
    #show2Cfg {
    id = 249,
    groupid = 70,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "当然愿意，您再找那些草药呢？"
    };
getRow(250)->
    #show2Cfg {
    id = 250,
    groupid = 70,
    npcid = 3036,
    emotion = 1,
    name = "卡卡",
    side = 1,
    content = "[ff0000]红梅果实，橄榄果实[-]各一颗，另外我要提醒你们，刚刚我被困在陷阱里的时候，无意中听到魔族谈起一个名叫[fff000]吉娜[-]的女人，她似乎是这场瘟疫的幕后黑手。"
    };
getRow(251)->
    #show2Cfg {
    id = 251,
    groupid = 70,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "吉娜？！光明勇士，我们似乎在港口的时候见过她……卡卡教授，谢谢您告诉我们这些，皮皮和光明勇士一定会把散播瘟疫的坏蛋全部消灭的。"
    };
getRow(252)->
    #show2Cfg {
    id = 252,
    groupid = 71,
    taskname = "魔族的报复",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "呀，可恶，是谁？！竟然敢咬皮皮？！"
    };
getRow(253)->
    #show2Cfg {
    id = 253,
    groupid = 71,
    npcid = 3041,
    emotion = 1,
    name = "污秽的小恶魔",
    side = 1,
    content = "哇啊！你们这群愚蠢的人类竟然擅自拿走我们种下的果实，当然要接受我们的惩罚！"
    };
getRow(254)->
    #show2Cfg {
    id = 254,
    groupid = 71,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "来得正好，光明勇士，我们消灭这些可恶的魔族！"
    };
getRow(255)->
    #show2Cfg {
    id = 255,
    groupid = 72,
    taskname = "制作药剂",
    npcid = 3036,
    emotion = 1,
    name = "卡卡",
    side = 1,
    content = "药剂已经制作成功，你们带上它可以去净化被魔族污染的丛林。"
    };
getRow(256)->
    #show2Cfg {
    id = 256,
    groupid = 72,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "好期待！卡卡真是一个了不起的药剂师。"
    };
getRow(257)->
    #show2Cfg {
    id = 257,
    groupid = 72,
    npcid = 3036,
    emotion = 1,
    name = "卡卡",
    side = 1,
    content = "可爱的姑娘，谢谢你的夸赞。这张纸上记录了制作药剂的步骤，收好它！"
    };
getRow(258)->
    #show2Cfg {
    id = 258,
    groupid = 72,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "谢谢您。光明勇士，我们赶快试试吧。"
    };
getRow(259)->
    #show2Cfg {
    id = 259,
    groupid = 73,
    taskname = "使用药剂",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "好香！这药剂的味道皮皮很喜欢。"
    };
getRow(260)->
    #show2Cfg {
    id = 260,
    groupid = 73,
    npcid = 3036,
    emotion = 1,
    name = "卡卡",
    side = 1,
    content = "谢谢，我在制作药剂时，加了一点蜂蜜。小姑娘似乎很喜欢甜食，等我们回到阿克勒城，让你尝尝我做的蜂蜜果酱。"
    };
getRow(261)->
    #show2Cfg {
    id = 261,
    groupid = 73,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "蜂蜜果酱……皮皮口水都要流出来了呢。不急，不急，消灭魔族才是最重要的事。"
    };
getRow(262)->
    #show2Cfg {
    id = 262,
    groupid = 74,
    taskname = "禁止通行",
    npcid = 3037,
    emotion = 1,
    name = "巡逻官路易丝",
    side = 1,
    content = "请留步！前面是魔族的重灾区，普通人一律不准入内，请你们立即离开！"
    };
getRow(263)->
    #show2Cfg {
    id = 263,
    groupid = 74,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "这些勇敢的姐姐，皮皮和光明勇士受城主的委托进入这里与你们一起消灭魔族，请你让我们过去吧！"
    };
getRow(264)->
    #show2Cfg {
    id = 264,
    groupid = 74,
    npcid = 3037,
    emotion = 1,
    name = "巡逻官路易丝",
    side = 1,
    content = "抱歉，我之前没有接到城主大人的统治，我的同伴丹尼尔就在前面，你们去看看他吧。"
    };
getRow(265)->
    #show2Cfg {
    id = 265,
    groupid = 75,
    taskname = "伊凡首领",
    npcid = 3039,
    emotion = 1,
    name = "荒野魔族伊凡",
    side = 1,
    content = "喂！你们这些无礼的人类，我们在东成郊生活从来没有主动打扰你们，如果你们在继续这样下去，我们会生气的！"
    };
getRow(266)->
    #show2Cfg {
    id = 266,
    groupid = 75,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "你们在这里散播大量的瘟疫，将阿克勒的城民都病倒了，皮皮和光明使者当然要赶走你们！"
    };
getRow(267)->
    #show2Cfg {
    id = 267,
    groupid = 75,
    npcid = 3039,
    emotion = 1,
    name = "荒野魔族伊凡",
    side = 1,
    content = "魔族也分好多种，你们遭受的瘟疫不是我们散播的，是斯诺卡的手下吉娜干的好事。她以制造痛苦为乐趣，她的毒药十分可怕，就连身为魔族的我们也感到恐惧呢！"
    };
getRow(268)->
    #show2Cfg {
    id = 268,
    groupid = 75,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "额……这么说，我们误会你们了么？总之，今天来到这里，皮皮和光明勇士一定要查清这场瘟疫的真相。"
    };
getRow(269)->
    #show2Cfg {
    id = 269,
    groupid = 75,
    npcid = 3039,
    emotion = 1,
    name = "荒野魔族伊凡",
    side = 1,
    content = "我们这些魔族虽然也不喜欢你们人类，但是从没想过要害你们，瘟疫的事就连我们也饱受其害，所以没必要对你们说谎。"
    };
getRow(270)->
    #show2Cfg {
    id = 270,
    groupid = 76,
    taskname = "怀疑",
    npcid = 3037,
    emotion = 1,
    name = "巡逻官路易丝",
    side = 1,
    content = "你们真的打败了那些魔族？了不起……他们打算什么时候离开东成郊？"
    };
getRow(271)->
    #show2Cfg {
    id = 271,
    groupid = 76,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "小事一桩，不过那些魔族告诉皮皮，散播瘟疫的不是他们，而是另一伙魔族。或许我们真的误会了他们。"
    };
getRow(272)->
    #show2Cfg {
    id = 272,
    groupid = 76,
    npcid = 3037,
    emotion = 1,
    name = "巡逻官路易丝",
    side = 1,
    content = "魔族的话你居然也敢相信?既然他们说自己不是散播瘟疫的罪魁祸首，那么到底谁做的！"
    };
getRow(273)->
    #show2Cfg {
    id = 273,
    groupid = 76,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "听皮皮慢慢说，似乎是一个名叫吉娜的魔族女人散播的，皮皮曾在阿克勒港口见到过她，她的确是斯诺卡的爪牙，所以我才会相信刚才那个魔族的话。"
    };
getRow(274)->
    #show2Cfg {
    id = 274,
    groupid = 76,
    npcid = 3037,
    emotion = 1,
    name = "巡逻官路易丝",
    side = 1,
    content = "这件事必须有确切的证据才行……对了，丹尼尔长时间守在东成郊平原入口那，他经常与魔族接触，掌握的情况比我更多，你们可以到他再了解一下情况。"
    };
getRow(275)->
    #show2Cfg {
    id = 275,
    groupid = 77,
    taskname = "真话假话",
    npcid = 3038,
    emotion = 1,
    name = "巡逻官丹尼尔",
    side = 1,
    content = "其实有些魔族说的话未必是假的……我长时间在这里的驻守，来到这里生活的魔族大多都很守规矩，很少主动攻击我们。否则我们也不可能平安无事到现在。"
    };
getRow(276)->
    #show2Cfg {
    id = 276,
    groupid = 77,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哦？皮皮不懂，为什么会这样？"
    };
getRow(277)->
    #show2Cfg {
    id = 277,
    groupid = 77,
    npcid = 3038,
    emotion = 1,
    name = "巡逻官丹尼尔",
    side = 1,
    content = "曾经有几个幼小的魔族告诉我们，他们是跟随自己的父母逃离到这里，魔界似乎出了很严重的状况。"
    };
getRow(278)->
    #show2Cfg {
    id = 278,
    groupid = 77,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "这……皮皮很好奇到底发生了什么事。"
    };
getRow(279)->
    #show2Cfg {
    id = 279,
    groupid = 77,
    npcid = 3038,
    emotion = 1,
    name = "巡逻官丹尼尔",
    side = 1,
    content = "依我看，瘟疫这件事我们不妨先给他们机会解释清楚，然后再请城主大人做决定。不过，现在最要紧的是尽早恢复这里的土壤。"
    };
getRow(280)->
    #show2Cfg {
    id = 280,
    groupid = 78,
    taskname = "魔族的邀请",
    npcid = 2007,
    emotion = 1,
    name = "皮皮",
    side = 2,
    content = "好可怕的橘鬼花……这到底是怎么回事！？"
    };
getRow(281)->
    #show2Cfg {
    id = 281,
    groupid = 78,
    npcid = 3039,
    emotion = 1,
    name = "伊凡",
    side = 1,
    content = "这些橘鬼花就是吉娜之前留下的，幸好你们将它们彻底消灭。否则它们散发出的毒气，足够了毁了东成郊以及平原！"
    };
getRow(282)->
    #show2Cfg {
    id = 282,
    groupid = 78,
    npcid = 2007,
    emotion = 1,
    name = "皮皮",
    side = 2,
    content = "你们这些魔族为什么会离开自己的故乡来到这里，明明知道人类都讨厌你们！"
    };
getRow(283)->
    #show2Cfg {
    id = 283,
    groupid = 78,
    npcid = 3039,
    emotion = 1,
    name = "伊凡",
    side = 1,
    content = "哎哎呀！这可是我们魔族的秘密，既然你们能消灭橘鬼花，就有资格进入[fff000]阿克勒平原区[-]，我们的长老会告诉你们一切的。"
    };
getRow(284)->
    #show2Cfg {
    id = 284,
    groupid = 78,
    npcid = 2007,
    emotion = 1,
    name = "皮皮",
    side = 2,
    content = "哼，若是你们敢撒谎，光明使者发起怒来是很可怕的。"
    };
getRow(285)->
    #show2Cfg {
    id = 285,
    groupid = 79,
    taskname = "荒野魔族（上）",
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "你们好，我们是荒野魔族，阿克勒平原是我们宝贵的栖息之地，请不要驱逐我们……"
    };
getRow(286)->
    #show2Cfg {
    id = 286,
    groupid = 79,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "你们既然是魔族，不应该是在魔界的地域里生活么，为什么要来到人界的地盘生活呢？皮皮不懂，你快点说清楚。"
    };
getRow(287)->
    #show2Cfg {
    id = 287,
    groupid = 79,
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "这种事情只有我们的族长大人有权告诉他人，他就在前面的广场中央，你们去见他吧。"
    };
getRow(288)->
    #show2Cfg {
    id = 288,
    groupid = 79,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "魔族的族长……好吧，皮皮和光明勇士一起去看看。"
    };
getRow(289)->
    #show2Cfg {
    id = 289,
    groupid = 80,
    taskname = "族长的请求",
    npcid = 3057,
    emotion = 1,
    name = "萨博",
    side = 1,
    content = "当初我们这些魔族不满斯诺卡的统治，被斯诺卡放逐。我身为族长必须带领族人寻找一块生活的土地，所以便带着大家来到人界这里。"
    };
getRow(290)->
    #show2Cfg {
    id = 290,
    groupid = 80,
    npcid = 3057,
    emotion = 1,
    name = "萨博",
    side = 1,
    content = "瘟疫的事情我很遗憾，吉娜那个女人最擅长研制毒药和毒素，她散播出的瘟疫，连我们这些同类也受不了。所以请你们相信我的话，荒野魔族不会伤害任何人类和精灵族。"
    };
getRow(291)->
    #show2Cfg {
    id = 291,
    groupid = 80,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "皮皮愿意相信你们，族长大人，你们现在的处境很艰难，我们什么可以帮忙你们的么？"
    };
getRow(292)->
    #show2Cfg {
    id = 292,
    groupid = 80,
    npcid = 3057,
    emotion = 1,
    name = "萨博",
    side = 1,
    content = "吉娜散播出的瘟疫破坏力极强，我们魔族无法接受你们人类研制出的药剂，要是能在里面加上一些[ff0000]蓝血草[-]就可以了。"
    };
getRow(293)->
    #show2Cfg {
    id = 293,
    groupid = 80,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "蓝血草……好的，包在我们身上。"
    };
getRow(294)->
    #show2Cfg {
    id = 294,
    groupid = 82,
    taskname = "困苦的魔族",
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "谢谢你们愿意相信我们，不过我还是建议你们早些离开平原，毕竟大多数族人们还是有点不相信人类，你们在这里很容易引起其他魔族的注意。"
    };
getRow(295)->
    #show2Cfg {
    id = 295,
    groupid = 82,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "没关系，皮皮和光明勇士来到这里就是想彻底消除瘟疫，在这之前，我们不会离开的。对了，族长大人说你们曾反抗斯诺卡的统治，看来即便是同类，斯诺卡那个坏蛋还是惹人讨厌呢。"
    };
getRow(296)->
    #show2Cfg {
    id = 296,
    groupid = 82,
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "斯诺卡原本是阿尔赛德的忠实仆人，他一心想帮助阿尔赛德突破露娜女神的封印。但是我们很清楚要是阿尔萨德再次回到魔界，他肯定会号召大家再次发动战争，我们不想再打仗了。"
    };
getRow(297)->
    #show2Cfg {
    id = 297,
    groupid = 82,
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "当时族长号召了很多魔族们一起反抗斯诺卡和他的手下，却没想到他们是在太强了，我们打不过。所以到最后全都被斯诺卡放逐了……"
    };
getRow(298)->
    #show2Cfg {
    id = 298,
    groupid = 82,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "虽然你们失败了，但是你们好勇敢呢，皮皮相信你们，现在你们有什么需要帮忙的地方尽管开口。"
    };
getRow(299)->
    #show2Cfg {
    id = 299,
    groupid = 83,
    taskname = "魔族的危机",
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "斯诺卡散播的瘟疫严重破坏了阿克勒草原，这里的仅存的农田都已经被污染，再不净化农田的话，大家都要饿肚子了……"
    };
getRow(300)->
    #show2Cfg {
    id = 300,
    groupid = 83,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "该怎么做才能净化农田呢？"
    };
getRow(301)->
    #show2Cfg {
    id = 301,
    groupid = 83,
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "请你们找到一些[ff0000]薄荷草[-]，交给我的同伴艾希，她正在研制净化农田的药剂。"
    };
getRow(302)->
    #show2Cfg {
    id = 302,
    groupid = 84,
    taskname = "寻找艾希",
    npcid = 3058,
    emotion = 1,
    name = "艾希",
    side = 1,
    content = "这是薄荷草！？谢谢你们，这太让人我意外了，人类竟然愿意主动帮助我们魔族。"
    };
getRow(303)->
    #show2Cfg {
    id = 303,
    groupid = 84,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "皮皮和光明勇士已经从族长大人和努努那里知道了你们的事情，我们两人愿意帮助荒野魔族度过危机。"
    };
getRow(304)->
    #show2Cfg {
    id = 304,
    groupid = 84,
    npcid = 3058,
    emotion = 1,
    name = "艾希",
    side = 1,
    content = "是么，那真是太好了！麻烦你到我们的农田一带看看吧，斯诺卡的爪牙为了破坏大家的生活，经常去农田一带捣乱。"
    };
getRow(305)->
    #show2Cfg {
    id = 305,
    groupid = 85,
    taskname = "修复农田",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "真奇怪？薄荷草怎么没有效果呢？"
    };
getRow(306)->
    #show2Cfg {
    id = 306,
    groupid = 85,
    npcid = 3059,
    emotion = 1,
    name = "卡维尔",
    side = 1,
    content = "住手，不要靠近我们的农田。"
    };
getRow(307)->
    #show2Cfg {
    id = 307,
    groupid = 86,
    taskname = "愤怒的卡维尔",
    npcid = 3059,
    emotion = 1,
    name = "卡维尔",
    side = 1,
    content = "你们为什么要进入我们的家园，荒野魔族不欢迎人类，马上离开这里，否则我不客气了！"
    };
getRow(308)->
    #show2Cfg {
    id = 308,
    groupid = 86,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "你好凶哦！皮皮是来帮助你们消除瘟疫的，不会误会我们！"
    };
getRow(309)->
    #show2Cfg {
    id = 309,
    groupid = 86,
    npcid = 3059,
    emotion = 1,
    name = "卡维尔",
    side = 1,
    content = "人类居然会帮助我们魔族，哼，当我是小孩子么？！我再说一遍，马上离开这里！"
    };
getRow(310)->
    #show2Cfg {
    id = 310,
    groupid = 86,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哼！皮皮才不要和你这样凶的人讲话！光明勇士，我们的药剂不管用，我们去找艾希姐姐问问到底怎么回事吧。"
    };
getRow(311)->
    #show2Cfg {
    id = 311,
    groupid = 87,
    taskname = "修复药剂",
    npcid = 3058,
    emotion = 1,
    name = "艾希",
    side = 1,
    content = "农田那里的事情我已经知道了，我替卡维尔向你们道歉，她曾经被人类伤害过，所以厌恶人类……"
    };
getRow(312)->
    #show2Cfg {
    id = 312,
    groupid = 87,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哼，皮皮才不跟他一般见识呢！"
    };
getRow(313)->
    #show2Cfg {
    id = 313,
    groupid = 87,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "对了，艾希姐姐，刚刚我们净化农田，薄荷草似乎不起作用哦！"
    };
getRow(314)->
    #show2Cfg {
    id = 314,
    groupid = 87,
    npcid = 3058,
    emotion = 1,
    name = "艾希",
    side = 1,
    content = "那是因为它还没有融合我制作的药剂呢，这是我刚刚研制好的，这次你们再农田试试。"
    };
getRow(315)->
    #show2Cfg {
    id = 315,
    groupid = 88,
    taskname = "保护丹妮",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "别害怕，光明勇士了已经把斯诺卡的手下打败了，现在你已经安全啦。"
    };
getRow(316)->
    #show2Cfg {
    id = 316,
    groupid = 88,
    npcid = 3060,
    emotion = 1,
    name = "丹妮",
    side = 1,
    content = "呜呜，我的家人都被斯诺卡的树人抓走了！巴特鲁去救他们，但现在还没有回来……"
    };
getRow(317)->
    #show2Cfg {
    id = 317,
    groupid = 88,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "啊，别哭了，皮皮最受不了别人哭，你安心待着这里，我和光明勇士去救你的家人。"
    };
getRow(318)->
    #show2Cfg {
    id = 318,
    groupid = 89,
    taskname = "同伴的下落",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "光明勇士，这是魔族留下来的粘液……沿着前面走，或许就能找到他们。"
    };
getRow(319)->
    #show2Cfg {
    id = 319,
    groupid = 90,
    taskname = "寻找同伴(上)",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "喂，你们输了，你们快点放了丹妮的家人！"
    };
getRow(320)->
    #show2Cfg {
    id = 320,
    groupid = 90,
    npcid = 3067,
    emotion = 1,
    name = "独眼怪",
    side = 1,
    content = "哇，饶命啊，我们，我们只是负责抓人，刚刚抓到的那几个魔族都已经被树人老大带走了！"
    };
getRow(321)->
    #show2Cfg {
    id = 321,
    groupid = 90,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "可恶，你们这些帮凶，快说那个树人在哪里？"
    };
getRow(322)->
    #show2Cfg {
    id = 322,
    groupid = 90,
    npcid = 3067,
    emotion = 1,
    name = "独眼怪",
    side = 1,
    content = "哇，不知道，我们真的不知道，求求你们放过我们，我们保证以后再也不做坏事了！"
    };
getRow(323)->
    #show2Cfg {
    id = 323,
    groupid = 90,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哼，好吧，看在你们诚恳认错的态度上，今天皮皮就放过你们，记住自己说过的话哦！"
    };
getRow(324)->
    #show2Cfg {
    id = 324,
    groupid = 91,
    taskname = "寻找同伴(下)",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "光明勇士，皮皮预感到后面的敌人的实力很强。我们先努力提升到18级再考虑战斗吧。"
    };
getRow(325)->
    #show2Cfg {
    id = 325,
    groupid = 92,
    taskname = "心急的丹妮",
    npcid = 3060,
    emotion = 1,
    name = "丹妮",
    side = 1,
    content = "怎么样？你们找到我的家人了么……"
    };
getRow(326)->
    #show2Cfg {
    id = 326,
    groupid = 92,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "很抱歉，丹妮。皮皮刚刚发现了魔族的粘液就被那些魔族围攻，它们实在太暴躁啦！"
    };
getRow(327)->
    #show2Cfg {
    id = 327,
    groupid = 92,
    npcid = 3060,
    emotion = 1,
    name = "丹妮",
    side = 1,
    content = "斯诺卡的手下都很凶，你们要小心。对了，我听到前面有些动静，可是我不敢一个人去看，或许又是那些魔族出现了呢……"
    };
getRow(328)->
    #show2Cfg {
    id = 328,
    groupid = 92,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "好，我和光明勇士去看看。"
    };
getRow(329)->
    #show2Cfg {
    id = 329,
    groupid = 93,
    taskname = "发现踪迹",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "这次肯定错不了！光明勇士，斯诺卡的手下就在前面不远处，我们快追！"
    };
getRow(330)->
    #show2Cfg {
    id = 330,
    groupid = 94,
    taskname = "偶遇巴特鲁",
    npcid = 3061,
    emotion = 1,
    name = "巴特鲁",
    side = 1,
    content = "奇怪，人类怎么会来到这？这里很危险，你们快走吧！"
    };
getRow(331)->
    #show2Cfg {
    id = 331,
    groupid = 94,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "请问你是不是巴特鲁？"
    };
getRow(332)->
    #show2Cfg {
    id = 332,
    groupid = 94,
    npcid = 3061,
    emotion = 1,
    name = "巴特鲁",
    side = 1,
    content = "不错，你们怎么会知道我的名字？难道是丹妮喊你过来的？"
    };
getRow(333)->
    #show2Cfg {
    id = 333,
    groupid = 94,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "是的，丹妮姐姐很担心她的家人和你的安全，所以皮皮就和同伴一起来救你们了。"
    };
getRow(334)->
    #show2Cfg {
    id = 334,
    groupid = 94,
    npcid = 3061,
    emotion = 1,
    name = "巴特鲁",
    side = 1,
    content = "太好了，魔族树人就在前面，它们的数量很多，我一人不敢擅自靠近它们去救人，只能先躲在暗处等待时机。"
    };
getRow(335)->
    #show2Cfg {
    id = 335,
    groupid = 94,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "你做得很对。接下来的事情交给我们吧，我们一定把丹妮的家人救出来！"
    };
getRow(336)->
    #show2Cfg {
    id = 336,
    groupid = 95,
    taskname = "巴特鲁致谢",
    npcid = 3061,
    emotion = 1,
    name = "巴特鲁",
    side = 1,
    content = "其实刚才我有些不敢相信，居然有人类会来帮助我们魔族。这一次是你们救了大家，谢谢你们！"
    };
getRow(337)->
    #show2Cfg {
    id = 337,
    groupid = 95,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "嘻！你也是个勇敢的人啊，丹妮说，你丝毫不惧怕斯诺卡的手下，一个人就去追他们呢。"
    };
getRow(338)->
    #show2Cfg {
    id = 338,
    groupid = 95,
    npcid = 3061,
    emotion = 1,
    name = "巴特鲁",
    side = 1,
    content = "那是丹妮的家人，如果他们受伤了，丹妮一定很难过，我不想看到她难过的样子……"
    };
getRow(339)->
    #show2Cfg {
    id = 339,
    groupid = 95,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "难道你对她？哦哦哦~~"
    };
getRow(340)->
    #show2Cfg {
    id = 340,
    groupid = 95,
    npcid = 3061,
    emotion = 1,
    name = "巴特鲁",
    side = 1,
    content = "咳咳……不要说出来。对了，我想起一事，那些魔化树人的铠甲有驱除瘟疫效果，不如你们取来一些带回阿克勒城，那里的人类应该需要它。"
    };
getRow(341)->
    #show2Cfg {
    id = 341,
    groupid = 95,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "你想的真周到，光明勇士我们马上行动起来。"
    };
getRow(342)->
    #show2Cfg {
    id = 342,
    groupid = 96,
    taskname = "隐瞒",
    npcid = 3060,
    emotion = 1,
    name = "丹妮",
    side = 1,
    content = "谢谢你们救回我的家人，其实之前我向你们隐瞒了一件事……"
    };
getRow(343)->
    #show2Cfg {
    id = 343,
    groupid = 96,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "啊？什么事？"
    };
getRow(344)->
    #show2Cfg {
    id = 344,
    groupid = 96,
    npcid = 3060,
    emotion = 1,
    name = "丹妮",
    side = 1,
    content = "我也是擅长研制灵药一类的魔族。在逃离魔界时，我从吉娜那偷走了一份毒药，本打算在这和艾希姐姐一起研制出解毒的办法。却不想被吉娜发现了，于是她强行抓走了我的家人。"
    };
getRow(345)->
    #show2Cfg {
    id = 345,
    groupid = 96,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "原来如此，那你们找到解毒的办法了么？吉娜没有达到目的不会放过你们的。"
    };
getRow(346)->
    #show2Cfg {
    id = 346,
    groupid = 96,
    npcid = 3060,
    emotion = 1,
    name = "丹妮",
    side = 1,
    content = "没有……我们在这里生活毕竟能力有限，所以我希望你们带走这份毒药，在阿克勒城肯定会有更优秀的药剂师，把东西交给他们，或许能研制出克制吉娜毒药的药剂。"
    };
getRow(347)->
    #show2Cfg {
    id = 347,
    groupid = 96,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "没问题，卡卡先生是一个了不起的药剂师，他一定会对这件事情感兴趣的。那块毒药应该放在艾希姐姐那里吧，皮皮和光明勇士马上去取来。"
    };
getRow(348)->
    #show2Cfg {
    id = 348,
    groupid = 97,
    taskname = "艾希的请求",
    npcid = 3058,
    emotion = 1,
    name = "艾希",
    side = 1,
    content = "一切就拜托你们了，希望你们早日研制出解毒药剂。对了，还有一事要拜托你们，回到阿克勒城以后请向城主解释这里的情况，我们荒野魔族只是想找到一块生活的地方，绝不会打扰人类的。"
    };
getRow(349)->
    #show2Cfg {
    id = 349,
    groupid = 97,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "艾希姐姐放心，皮皮会向城主大人解释清楚的。不过呢，平原以外的地方建议你们暂时不要进入，不然被其他不明真相的人类看到又会引起误会。"
    };
getRow(350)->
    #show2Cfg {
    id = 350,
    groupid = 97,
    npcid = 3058,
    emotion = 1,
    name = "艾希",
    side = 1,
    content = "好的，你的话我会转达其他族人的。再一次谢谢你们的帮助。"
    };
getRow(351)->
    #show2Cfg {
    id = 351,
    groupid = 98,
    taskname = "族长的馈赠",
    npcid = 3057,
    emotion = 1,
    name = "萨博",
    side = 1,
    content = "你们来的正好，我知道你们在寻找生命石，斯诺卡也在寻找它！我这里藏了一块就送给你们，你们带上它赶快离开平原！"
    };
getRow(352)->
    #show2Cfg {
    id = 352,
    groupid = 98,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "族长大人到底发生了什么事？"
    };
getRow(353)->
    #show2Cfg {
    id = 353,
    groupid = 98,
    npcid = 3057,
    emotion = 1,
    name = "萨博",
    side = 1,
    content = "再过不了多久，吉娜会带领魔族袭击这里，我要带着族人与他们战斗。所以，你们两个人快点走吧！"
    };
getRow(354)->
    #show2Cfg {
    id = 354,
    groupid = 98,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "族长大人，皮皮和光明勇士很感谢您愿意把生命石交给我们，但是皮皮和光明勇士要留下帮助你们打败那些欺负你们的魔族！"
    };
getRow(355)->
    #show2Cfg {
    id = 355,
    groupid = 100,
    taskname = "告别平原",
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "你们这就要离开了？不在多待一会吗？努努第一次遇到你们这样勇敢善良的人类，很高兴能认识你们！"
    };
getRow(356)->
    #show2Cfg {
    id = 356,
    groupid = 100,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "皮皮也一样，只是现在我们必须要走啦。等有一天我们彻底打败了魔族，再回到这来看你们！"
    };
getRow(357)->
    #show2Cfg {
    id = 357,
    groupid = 100,
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "一定要说话算数哦！"
    };
getRow(358)->
    #show2Cfg {
    id = 358,
    groupid = 100,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "那当然，我们来拉拉勾！~"
    };
getRow(359)->
    #show2Cfg {
    id = 359,
    groupid = 101,
    taskname = "苍空塔守卫",
    npcid = 3072,
    emotion = 1,
    name = "科林",
    side = 1,
    content = "城主有令，陌生人必须请出示身份证明，否则马上离开苍空之塔！"
    };
getRow(360)->
    #show2Cfg {
    id = 360,
    groupid = 101,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哎！有话好好说，皮皮和光明勇士是受阿克勒城主大人的委托，前来这里调查生命之石的下落，我们是好人啦！"
    };
getRow(361)->
    #show2Cfg {
    id = 361,
    groupid = 101,
    npcid = 3072,
    emotion = 1,
    name = "科林",
    side = 1,
    content = "竟然是阿克勒城的人，看来是我误会你们了。我们的城主大人与阿克勒主人交好，既然你们是朋友，我就允许你们在城里活动，不过要注意不要影响到别人。"
    };
getRow(362)->
    #show2Cfg {
    id = 362,
    groupid = 101,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "好的，光明勇士，皮皮肚子饿了，我们去找点吃的吧。"
    };
getRow(363)->
    #show2Cfg {
    id = 363,
    groupid = 101,
    npcid = 3072,
    emotion = 1,
    name = "科林",
    side = 1,
    content = "前面有冻鱼，是苍空之塔特有的食物，你们可以去尝尝。"
    };
getRow(364)->
    #show2Cfg {
    id = 364,
    groupid = 102,
    taskname = "入侵苍空塔",
    npcid = 3072,
    emotion = 1,
    name = "科林",
    side = 1,
    content = "不久前大家知道阿克勒城那里混入了的魔族，现在那边的情况怎么样？"
    };
getRow(365)->
    #show2Cfg {
    id = 365,
    groupid = 102,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "还好啦，那些魔族都已经被我们抓住了呢！"
    };
getRow(366)->
    #show2Cfg {
    id = 366,
    groupid = 102,
    npcid = 3072,
    emotion = 1,
    name = "科林",
    side = 1,
    content = "你们竟然是除魔的勇士！请原谅我刚才的无礼，现在的苍空塔也混入了魔族，所以大家才会如此紧张。"
    };
getRow(367)->
    #show2Cfg {
    id = 367,
    groupid = 102,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "因为吃到美味的鱼肉，刚才的事皮皮已经不生气啦。城主大人在哪里，皮皮想见他。"
    };
getRow(368)->
    #show2Cfg {
    id = 368,
    groupid = 102,
    npcid = 3072,
    emotion = 1,
    name = "科林",
    side = 1,
    content = "经过前面的冰桥，你们会遇见雪莉尔长官，城主大人就在她附近。"
    };
getRow(369)->
    #show2Cfg {
    id = 369,
    groupid = 103,
    taskname = "守城长官",
    npcid = 3073,
    emotion = 1,
    name = "谢莉尔",
    side = 1,
    content = "士兵们听令，与我一起击退魔族！"
    };
getRow(370)->
    #show2Cfg {
    id = 370,
    groupid = 103,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "好帅气的女长官，光明勇士，我们和她一起去击退魔族吧。"
    };
getRow(371)->
    #show2Cfg {
    id = 371,
    groupid = 104,
    taskname = "引路",
    npcid = 3073,
    emotion = 1,
    name = "谢莉尔",
    side = 1,
    content = "谢谢你们出手帮忙，你们是从阿克勒城来到这里的么？我们的城主大人就前面里，他等你们很久了。"
    };
getRow(372)->
    #show2Cfg {
    id = 372,
    groupid = 104,
    npcid = 3073,
    emotion = 1,
    name = "谢莉尔",
    side = 1,
    content = "另外就如你们所见，苍空之塔已经混入了大量的魔族，若你们在其他地方发现了他们的踪迹，请及时通知我。"
    };
getRow(373)->
    #show2Cfg {
    id = 373,
    groupid = 105,
    taskname = "苍空塔城主",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "城主大人你好，皮皮和光明勇士受阿克勒城主之意来到苍空塔寻您，希望您透露一些关于生命之石的线索。"
    };
getRow(374)->
    #show2Cfg {
    id = 374,
    groupid = 105,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "勇士们，如果你们想得到我手中的生命之石需得帮我消灭掉苍空塔内的魔族。"
    };
getRow(375)->
    #show2Cfg {
    id = 375,
    groupid = 105,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "皮皮很乐意这样做，不过这里的魔族数量不少，我们可能要在这多待几天呢。"
    };
getRow(376)->
    #show2Cfg {
    id = 376,
    groupid = 105,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "这个没问题，只要你们能帮我驱赶魔族，我不仅奉上生命之石，还会送你们美味的鱼肉。"
    };
getRow(377)->
    #show2Cfg {
    id = 377,
    groupid = 106,
    taskname = "魔族的线索（上）",
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "那些魔族好可恶，进入苍空之塔后，抢走了我们不少鱼肉。"
    };
getRow(378)->
    #show2Cfg {
    id = 378,
    groupid = 106,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "咦？那些魔族竟然和皮皮一样也喜欢吃鱼呢！"
    };
getRow(379)->
    #show2Cfg {
    id = 379,
    groupid = 106,
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "他们尤其喜欢在晚上来偷大家准备的鱼肉，这位勇士，如果能帮大伙捉住他们，我们会支付你们酬金的。"
    };
getRow(380)->
    #show2Cfg {
    id = 380,
    groupid = 106,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "酬金！酬金！皮皮，哦不，光明勇士一定会帮助大家的。"
    };
getRow(381)->
    #show2Cfg {
    id = 381,
    groupid = 107,
    taskname = "魔族的线索（下）",
    npcid = 3073,
    emotion = 1,
    name = "谢莉尔",
    side = 1,
    content = "城主大人告诉我，你们愿意帮忙一起对付魔族？"
    };
getRow(382)->
    #show2Cfg {
    id = 382,
    groupid = 107,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "是的，皮皮要抓住那些偷鱼的家伙！"
    };
getRow(383)->
    #show2Cfg {
    id = 383,
    groupid = 107,
    npcid = 3073,
    emotion = 1,
    name = "谢莉尔",
    side = 1,
    content = "雷纳德应该已经告诉过你们，魔族喜欢在夜晚行动，几个小时以后我们再碰头。"
    };
getRow(384)->
    #show2Cfg {
    id = 384,
    groupid = 107,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "咦？那边的鱼肉怎么自己动了？哎哎，别跑啊！"
    };
getRow(385)->
    #show2Cfg {
    id = 385,
    groupid = 108,
    taskname = "偷鱼贼别跑",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哼，偷鱼贼，快点放下鱼肉，否则皮皮生气了！"
    };
getRow(386)->
    #show2Cfg {
    id = 386,
    groupid = 108,
    npcid = 3081,
    emotion = 1,
    name = "喵老大",
    side = 1,
    content = "哼，来追我们啊！"
    };
getRow(387)->
    #show2Cfg {
    id = 387,
    groupid = 109,
    taskname = "追回鱼肉",
    npcid = 3081,
    emotion = 1,
    name = "喵老大",
    side = 1,
    content = "喵呜，抢走我们的鱼，我是不会善罢甘休的！"
    };
getRow(388)->
    #show2Cfg {
    id = 388,
    groupid = 109,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "这鱼肉的味道好香，可惜皮皮已经吃不下了。光明勇士我们把抢回来的鱼肉放回原地吧。"
    };
getRow(389)->
    #show2Cfg {
    id = 389,
    groupid = 110,
    taskname = "危险的信号",
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "谢谢你们帮我们抢回了鱼肉，不过那些贪婪的魔族是不会罢休的"
    };
getRow(390)->
    #show2Cfg {
    id = 390,
    groupid = 110,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "别担心，皮皮和光明勇士已经答应了城主大人，帮你们消灭这些讨厌的魔族。"
    };
getRow(391)->
    #show2Cfg {
    id = 391,
    groupid = 110,
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "除了生命之石，苍空之塔的宝物也是他们觊觎的对象，你们要当心。"
    };
getRow(392)->
    #show2Cfg {
    id = 392,
    groupid = 110,
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "光明勇士，魔族成员很可能藏身于城主大人的帐篷周围，若有发现请立即控制住他们。"
    };
getRow(393)->
    #show2Cfg {
    id = 393,
    groupid = 111,
    taskname = "衰弱的女神",
    npcid = 3076,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "很高兴在这里见到你们，这段时间辛苦你们了！"
    };
getRow(394)->
    #show2Cfg {
    id = 394,
    groupid = 111,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "女神大人，您为什么会出现在这里？"
    };
getRow(395)->
    #show2Cfg {
    id = 395,
    groupid = 111,
    npcid = 3076,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "阿尔赛德的封印越加不稳，我不知道自己还能坚持多久……生命之石的线索你们可有发现么？"
    };
getRow(396)->
    #show2Cfg {
    id = 396,
    groupid = 111,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "我们从荒野魔族那里得到一块生命之石，女神大人，你看它在这。"
    };
getRow(397)->
    #show2Cfg {
    id = 397,
    groupid = 112,
    taskname = "袭击女神",
    npcid = 3076,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "这里有魔族的气味，你们要当心！"
    };
getRow(398)->
    #show2Cfg {
    id = 398,
    groupid = 112,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "光明勇士我们来保护女神！"
    };
getRow(399)->
    #show2Cfg {
    id = 399,
    groupid = 113,
    taskname = "女神的预言",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "女神大人，你的力量……"
    };
getRow(400)->
    #show2Cfg {
    id = 400,
    groupid = 113,
    npcid = 3076,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "没错，越来越弱……随时可能被阿尔萨德的魔力反噬。苍空之塔内已经出现了大量的魔族，在不久这里的人恐怕就要被魔气侵染了。"
    };
getRow(401)->
    #show2Cfg {
    id = 401,
    groupid = 113,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "啊，那我们该怎么办，这里没有药剂师啊！"
    };
getRow(402)->
    #show2Cfg {
    id = 402,
    groupid = 113,
    npcid = 3076,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "这些冰晶已经被我注入灵力，你们将它放到水中，可以为大家暂时抵挡魔气。"
    };
getRow(403)->
    #show2Cfg {
    id = 403,
    groupid = 114,
    taskname = "解释",
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "刚刚你们往水里投放了什么？"
    };
getRow(404)->
    #show2Cfg {
    id = 404,
    groupid = 114,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "我们察觉到魔气即将污染这里的人，所以将注入灵力的晶体投入水中，帮助大家抵御一阵。"
    };
getRow(405)->
    #show2Cfg {
    id = 405,
    groupid = 114,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "原来如此，谢谢你们……"
    };
getRow(406)->
    #show2Cfg {
    id = 406,
    groupid = 114,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "海伦夫人家的周围出现了魔族的身影，请你过去看看吧。"
    };
getRow(407)->
    #show2Cfg {
    id = 407,
    groupid = 115,
    taskname = "独居的海伦",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "这位夫人你没事吧……"
    };
getRow(408)->
    #show2Cfg {
    id = 408,
    groupid = 115,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "我还好，谢谢你们……"
    };
getRow(409)->
    #show2Cfg {
    id = 409,
    groupid = 115,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "罗宾先生发现您家中附近出现了魔族，不过它们已经被我们赶走了，你不需要在害怕了哦。"
    };
getRow(410)->
    #show2Cfg {
    id = 410,
    groupid = 115,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "！……那，那实在太好了。"
    };
getRow(411)->
    #show2Cfg {
    id = 411,
    groupid = 116,
    taskname = "奇怪的药丸",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "咦，这是什么？"
    };
getRow(412)->
    #show2Cfg {
    id = 412,
    groupid = 116,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "咳咳咳！好苦啊，原来是药丸，讨厌！"
    };
getRow(413)->
    #show2Cfg {
    id = 413,
    groupid = 117,
    taskname = "海伦母子（上）",
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "海伦夫人自从儿子病了以后就很少与大家走动，她几乎把所有时间都花在了照料儿子身上。"
    };
getRow(414)->
    #show2Cfg {
    id = 414,
    groupid = 117,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "她的孩子得了什么病，居然这么严重，难道没有大夫能治好他么？"
    };
getRow(415)->
    #show2Cfg {
    id = 415,
    groupid = 117,
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "没有，那孩子现在只能靠着昂贵的药材支撑。哎，可怜的很啊。"
    };
getRow(416)->
    #show2Cfg {
    id = 416,
    groupid = 118,
    taskname = "海伦母子（下）",
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "当初海伦的孩子病了后，海伦曾哭着求我将自己的私人医生带去家中看病。"
    };
getRow(417)->
    #show2Cfg {
    id = 417,
    groupid = 118,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "结果我的私人医生对那孩子的病也束手无策，海伦夫人当时就收到了极大的刺激。"
    };
getRow(418)->
    #show2Cfg {
    id = 418,
    groupid = 118,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "好可怜……那后来的呢？"
    };
getRow(419)->
    #show2Cfg {
    id = 419,
    groupid = 118,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "再后来，海伦就拒绝了所有医生再去她家。从那时候开始海伦就独自一人照顾孩子直到现在。"
    };
getRow(420)->
    #show2Cfg {
    id = 420,
    groupid = 118,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "呜呜……城主大人，海伦夫人好可怜，如果她需要我们帮忙的话，皮皮一定会尽力而为。"
    };
getRow(421)->
    #show2Cfg {
    id = 421,
    groupid = 119,
    taskname = "女神战甲",
    npcid = 3076,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "光明勇士，我预感到这里过不久就会有高级魔族降临，这件战甲就赐予你，它可以助你一臂之力。"
    };
getRow(422)->
    #show2Cfg {
    id = 422,
    groupid = 119,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哇！好漂亮的战甲，光明勇士你赶快穿上让皮皮看看吧。"
    };
getRow(423)->
    #show2Cfg {
    id = 423,
    groupid = 120,
    taskname = "魔族气息",
    npcid = 3076,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "魔族的气息又出现了，你们快去吧。"
    };
getRow(424)->
    #show2Cfg {
    id = 424,
    groupid = 120,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "恩……又是海伦夫人，光明勇士这次我们先藏起来，看看到底是什么情况。"
    };
getRow(425)->
    #show2Cfg {
    id = 425,
    groupid = 121,
    taskname = "疑点",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "这是！海伦夫人难道她……！"
    };
getRow(426)->
    #show2Cfg {
    id = 426,
    groupid = 122,
    taskname = "蛛丝马迹",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "光明勇士，我们得把自己发现的鳞片马上交给城主大人！海伦夫人很可能是潜入在仓库之塔内的魔族爪牙。"
    };
getRow(427)->
    #show2Cfg {
    id = 427,
    groupid = 123,
    taskname = "坦白",
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "你的意思是海伦夫人与魔族有往来，这怎么可能……小丫头你不会是看错了吧？"
    };
getRow(428)->
    #show2Cfg {
    id = 428,
    groupid = 123,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "皮皮没有认错，这是魔族特有的鳞片。"
    };
getRow(429)->
    #show2Cfg {
    id = 429,
    groupid = 123,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "好吧，我允许你们继续调查海伦的情况，只是不到万不得已不要伤害她和她的家人。"
    };
getRow(430)->
    #show2Cfg {
    id = 430,
    groupid = 124,
    taskname = "相信",
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "海伦夫人她……无论看到什么情形，请你们不要伤害她和她的孩子。"
    };
getRow(431)->
    #show2Cfg {
    id = 431,
    groupid = 124,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "先生你……皮皮知道了。"
    };
getRow(432)->
    #show2Cfg {
    id = 432,
    groupid = 125,
    taskname = "抵赖",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "夫人，这是我们在你家附近发现的魔族鳞片，请问这到底是怎么回事呢？"
    };
getRow(433)->
    #show2Cfg {
    id = 433,
    groupid = 125,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "！胡说，我的家怎么会有魔族鳞片，请你们赶快离开！"
    };
getRow(434)->
    #show2Cfg {
    id = 434,
    groupid = 125,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "做贼心虚，皮皮亲眼看到的，海伦夫人别再掩饰了！"
    };
getRow(435)->
    #show2Cfg {
    id = 435,
    groupid = 126,
    taskname = "出击",
    npcid = 3082,
    emotion = 1,
    name = "麦克",
    side = 1,
    content = "母亲，好痛啊……"
    };
getRow(436)->
    #show2Cfg {
    id = 436,
    groupid = 126,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "住手！不要伤害我的孩子！"
    };
getRow(437)->
    #show2Cfg {
    id = 437,
    groupid = 126,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "啊……他居然就是你的儿子？！"
    };
getRow(438)->
    #show2Cfg {
    id = 438,
    groupid = 127,
    taskname = "真相",
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "求求你们放过我的孩子，只要你们肯放了他，我愿意承担一切罪责！"
    };
getRow(439)->
    #show2Cfg {
    id = 439,
    groupid = 127,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "皮皮不懂？海伦夫人，你明明是人类为什么你的孩子会是魔族呢？"
    };
getRow(440)->
    #show2Cfg {
    id = 440,
    groupid = 127,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "呜，当初我的孩子已经无药可救，是魔族提供了药物才支撑到现在。"
    };
getRow(441)->
    #show2Cfg {
    id = 441,
    groupid = 127,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "可是在魔药的作用下，我的孩子渐渐变成魔族的样子，可无论怎样，他都是我的孩子啊……"
    };
getRow(442)->
    #show2Cfg {
    id = 442,
    groupid = 128,
    taskname = "劝告",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "海伦夫人，你的孩子如果继续服用魔药，总有一天会彻底变成怪物，到那时你一定会后悔的……"
    };
getRow(443)->
    #show2Cfg {
    id = 443,
    groupid = 128,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "那……那我该怎么办？"
    };
getRow(444)->
    #show2Cfg {
    id = 444,
    groupid = 128,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "皮皮有驱魔药的制作卷轴，只需要找到火龙果就可以开始制作了。"
    };
getRow(445)->
    #show2Cfg {
    id = 445,
    groupid = 129,
    taskname = "意外",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "怎么会这样……驱魔药居然不起作用！海伦夫人，我……"
    };
getRow(446)->
    #show2Cfg {
    id = 446,
    groupid = 129,
    npcid = 3077,
    emotion = 1,
    name = "海伦",
    side = 1,
    content = "现在该怎么办？我的孩子，我的孩子！"
    };
getRow(447)->
    #show2Cfg {
    id = 447,
    groupid = 130,
    taskname = "失控的孩子",
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "呜……孩子你快点清醒过来，我是你的母亲。"
    };
getRow(448)->
    #show2Cfg {
    id = 448,
    groupid = 130,
    npcid = 3082,
    emotion = 1,
    name = "麦克",
    side = 1,
    content = "母，母亲……呜哇哇！"
    };
getRow(449)->
    #show2Cfg {
    id = 449,
    groupid = 130,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "都是我不好……"
    };
getRow(450)->
    #show2Cfg {
    id = 450,
    groupid = 130,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "孩子不要怕，母亲就在这一直陪着你。"
    };
getRow(451)->
    #show2Cfg {
    id = 451,
    groupid = 131,
    taskname = "海伦的朋友",
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "海伦夫人的事情大家很遗憾，但是作为她的朋友，我还是感谢你们帮助她。"
    };
getRow(452)->
    #show2Cfg {
    id = 452,
    groupid = 131,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "很抱歉，皮皮还是没能挽救海伦夫人母子。"
    };
getRow(453)->
    #show2Cfg {
    id = 453,
    groupid = 132,
    taskname = "失窃",
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "差点忘了正事，城主大人告诉我，你们愿意协助大家对抗魔族是么？"
    };
getRow(454)->
    #show2Cfg {
    id = 454,
    groupid = 132,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "是的，现在还有什么需要帮忙？"
    };
getRow(455)->
    #show2Cfg {
    id = 455,
    groupid = 132,
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "马修传来消息，苍空之塔的宝石被盗走了，城主大人现在十分着急，下令我们竭尽全力找出盗宝者。"
    };
getRow(456)->
    #show2Cfg {
    id = 456,
    groupid = 132,
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "你们在干活前，能不能先给我寻来瓶伏特加，这该死的鬼天气太冷了。"
    };
getRow(457)->
    #show2Cfg {
    id = 457,
    groupid = 132,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "（原来西蒙先生是个酒鬼……）"
    };
getRow(458)->
    #show2Cfg {
    id = 458,
    groupid = 133,
    taskname = "西蒙的委托",
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "呵，伏特加，我的最爱！嗝~"
    };
getRow(459)->
    #show2Cfg {
    id = 459,
    groupid = 133,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "西蒙大叔，你先别顾着喝酒，快点告诉皮皮，那些盗宝的魔族去了哪？"
    };
getRow(460)->
    #show2Cfg {
    id = 460,
    groupid = 133,
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "盗宝事件发生后，城主下令全城戒严，一些低级魔族很难逃出这里。这些魔族就交给你们了！"
    };
getRow(461)->
    #show2Cfg {
    id = 461,
    groupid = 134,
    taskname = "寻找盗宝者（下）",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "抓住你们了，快说快说，宝物是不是被你们拿走了？"
    };
getRow(462)->
    #show2Cfg {
    id = 462,
    groupid = 134,
    npcid = 3083,
    emotion = 1,
    name = "吸血蝙蝠",
    side = 1,
    content = "……我们是斯诺卡大人忠实的信徒，任何事都不会告诉你们的！"
    };
getRow(463)->
    #show2Cfg {
    id = 463,
    groupid = 134,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "你们！"
    };
getRow(464)->
    #show2Cfg {
    id = 464,
    groupid = 135,
    taskname = "苍空塔禁区",
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "前面就是苍空塔禁区，只有马修守在那里，宝物失窃的事情只有他最清楚……"
    };
getRow(465)->
    #show2Cfg {
    id = 465,
    groupid = 135,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "马修是谁？"
    };
getRow(466)->
    #show2Cfg {
    id = 466,
    groupid = 135,
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "马修是城主大人的最信赖的伙伴，也是苍空塔的守门人。我要提醒你们，他的脾气很坏，你们当心些。"
    };
getRow(467)->
    #show2Cfg {
    id = 467,
    groupid = 135,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "又是凶巴巴的大叔，皮皮不喜欢……"
    };
getRow(468)->
    #show2Cfg {
    id = 468,
    groupid = 136,
    taskname = "投其所好",
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "哈哈，你们要学会投其所好。这个给你，马修见到了应该不会为难你们。"
    };
getRow(469)->
    #show2Cfg {
    id = 469,
    groupid = 137,
    taskname = "守塔人马修",
    npcid = 3079,
    emotion = 1,
    name = "马修",
    side = 1,
    content = "你们就是罗宾口中提起的光明勇士吧，来得正好。魔族已经围住了苍空塔，快来帮忙！"
    };
getRow(470)->
    #show2Cfg {
    id = 470,
    groupid = 137,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "马修大叔，西蒙很担心你。所以我们就立即赶过来了。"
    };
getRow(471)->
    #show2Cfg {
    id = 471,
    groupid = 138,
    taskname = "苍空塔魔气",
    npcid = 3079,
    emotion = 1,
    name = "马修",
    side = 1,
    content = "魔族觊觎罗宾的宝物，我要死守这里，不能让魔族得逞。"
    };
getRow(472)->
    #show2Cfg {
    id = 472,
    groupid = 138,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "马修大叔，你的灵力不足以对抗魔气。皮皮建议你还是早些离开这里，不然被魔气所侵蚀会很痛苦的。"
    };
getRow(473)->
    #show2Cfg {
    id = 473,
    groupid = 138,
    npcid = 3079,
    emotion = 1,
    name = "马修",
    side = 1,
    content = "不，我绝不离开这里。"
    };
getRow(474)->
    #show2Cfg {
    id = 474,
    groupid = 139,
    taskname = "塔顶之战",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "放下宝物，否则皮皮就不客气了！"
    };
getRow(475)->
    #show2Cfg {
    id = 475,
    groupid = 139,
    npcid = 3084,
    emotion = 1,
    name = "狂暴魔龙",
    side = 1,
    content = "小丫头不要多管闲事，否则本座就把你吃掉！"
    };
getRow(476)->
    #show2Cfg {
    id = 476,
    groupid = 140,
    taskname = "消失的宝物",
    npcid = 3079,
    emotion = 1,
    name = "马修",
    side = 1,
    content = "宝物怎么不见了？你们从魔龙那里没有发现么？"
    };
getRow(477)->
    #show2Cfg {
    id = 477,
    groupid = 140,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "咦！皮皮刚才什么也没看到啊！？"
    };
getRow(478)->
    #show2Cfg {
    id = 478,
    groupid = 140,
    npcid = 3079,
    emotion = 1,
    name = "马修",
    side = 1,
    content = "该不会是你们浑水摸鱼吧，我要把这件事告诉罗宾！"
    };
getRow(479)->
    #show2Cfg {
    id = 479,
    groupid = 140,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "你乱讲！皮皮和光明使者才没有拿走宝物呢。哼，你等着，我们一定把宝物找到！"
    };
getRow(480)->
    #show2Cfg {
    id = 480,
    groupid = 140,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "光明勇士你瞧，前面那个发光的箱子……"
    };
getRow(481)->
    #show2Cfg {
    id = 481,
    groupid = 141,
    taskname = "马修的道歉",
    npcid = 3079,
    emotion = 1,
    name = "马修",
    side = 1,
    content = "对不起，刚刚是我误会你们了……"
    };
getRow(482)->
    #show2Cfg {
    id = 482,
    groupid = 141,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "……"
    };
getRow(483)->
    #show2Cfg {
    id = 483,
    groupid = 141,
    npcid = 3079,
    emotion = 1,
    name = "马修",
    side = 1,
    content = "小姑娘不要生气了，真的是我错怪你们了。"
    };
getRow(484)->
    #show2Cfg {
    id = 484,
    groupid = 141,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "马修大叔，这一次皮皮就原谅你，希望你以后能克制你的坏脾气哦。"
    };
getRow(485)->
    #show2Cfg {
    id = 485,
    groupid = 142,
    taskname = "城主千金",
    npcid = 3080,
    emotion = 1,
    name = "伊娃",
    side = 1,
    content = "嗨，我在这里等你们久了，你们就是赶走魔族的光明勇士吧？"
    };
getRow(486)->
    #show2Cfg {
    id = 486,
    groupid = 142,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "你是？"
    };
getRow(487)->
    #show2Cfg {
    id = 487,
    groupid = 142,
    npcid = 3080,
    emotion = 1,
    name = "伊娃",
    side = 1,
    content = "哎呀，忘了自我介绍，我是伊娃，罗宾是我的父亲。"
    };
getRow(488)->
    #show2Cfg {
    id = 488,
    groupid = 142,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "原来是城主的千金，你找我们有什么事？"
    };
getRow(489)->
    #show2Cfg {
    id = 489,
    groupid = 143,
    taskname = "伊娃指路",
    npcid = 3080,
    emotion = 1,
    name = "伊娃",
    side = 1,
    content = "父亲已经把你们的事告诉我了，伊娃很感谢你们帮忙。"
    };
getRow(490)->
    #show2Cfg {
    id = 490,
    groupid = 143,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "小事一桩，伊娃姐姐，我们要继续出发了，请你告诉我们出口在哪？"
    };
getRow(491)->
    #show2Cfg {
    id = 491,
    groupid = 143,
    npcid = 3080,
    emotion = 1,
    name = "伊娃",
    side = 1,
    content = "一直往前走就是苍空之塔的出口了，接下来你们会到达海洋之心，那里居住着很多人鱼族，他们都很友好。"
    };
getRow(492)->
    #show2Cfg {
    id = 492,
    groupid = 143,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "谢谢你！对了，城主大人之前承诺过的生命石……"
    };
getRow(493)->
    #show2Cfg {
    id = 493,
    groupid = 143,
    npcid = 3080,
    emotion = 1,
    name = "伊娃",
    side = 1,
    content = "哈哈，我当然记得，这是父亲托我转交给你们的生命石，请务必收好它。"
    };
getRow(494)->
    #show2Cfg {
    id = 494,
    groupid = 144,
    taskname = "离开苍空塔",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "可恶，这些魔族居然敢偷袭我们，光明勇士前面就是出口，到了海洋之心以后继续调查生命石的下落吧。"
    };
getRow(495)->
    #show2Cfg {
    id = 495,
    groupid = 145,
    taskname = "海洋之城",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哇！皮皮第一次见到这么美丽的地方。"
    };
getRow(496)->
    #show2Cfg {
    id = 496,
    groupid = 145,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "光明勇士，你看这里好多漂亮的海藻在摆动呢，跟皮皮一起进去吧。"
    };
getRow(497)->
    #show2Cfg {
    id = 497,
    groupid = 146,
    taskname = "发现",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "咦？光明勇士快看前面那个闪闪发光的东西……"
    };
getRow(498)->
    #show2Cfg {
    id = 498,
    groupid = 147,
    taskname = "进入海之城",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "你们是什么人？国王有令，外来人不得随意进入海之城。"
    };
getRow(499)->
    #show2Cfg {
    id = 499,
    groupid = 147,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哇，你长得好可爱，皮皮很喜欢你的帽子呢！我和光明勇士受阿克勒城主的委托调查魔族入侵一事，经过苍空之塔来到这里。"
    };
getRow(500)->
    #show2Cfg {
    id = 500,
    groupid = 147,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "魔族……这么说你们很厉害喽?"
    };
getRow(501)->
    #show2Cfg {
    id = 501,
    groupid = 147,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "嗯？！"
    };
getRow(502)->
    #show2Cfg {
    id = 502,
    groupid = 147,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "动手吧，让我见识见识你们的本领！"
    };
getRow(503)->
    #show2Cfg {
    id = 503,
    groupid = 148,
    taskname = "怒火",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "喂喂喂，这到底是怎么回事啊，皮皮都夸你可爱了，你居然还这样对我们，哼！"
    };
getRow(504)->
    #show2Cfg {
    id = 504,
    groupid = 148,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "小可爱你先别生气，刚才你们的表现令我非常满意，我向请你们参加国王的悬赏，不知你们有兴趣么？"
    };
getRow(505)->
    #show2Cfg {
    id = 505,
    groupid = 148,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "国王的悬赏？那是什么情况？"
    };
getRow(506)->
    #show2Cfg {
    id = 506,
    groupid = 148,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "到我身旁的告示栏去看看，你们会明白。"
    };
getRow(507)->
    #show2Cfg {
    id = 507,
    groupid = 149,
    taskname = "国王的悬赏",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "国王陛下最宝贝的女儿突然失踪，现在他正在召集人手四处寻找公主。"
    };
getRow(508)->
    #show2Cfg {
    id = 508,
    groupid = 149,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "光明勇士，我们若能帮助他找到女儿，或许国王陛下会很乐意告诉我们关于魔族和生命石的线索呢！"
    };
getRow(509)->
    #show2Cfg {
    id = 509,
    groupid = 150,
    taskname = "接受悬赏",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "我就知道你们一定会接受我们国王的悬赏，海之国的宫殿就在前面，你们一直走就能找到。"
    };
getRow(510)->
    #show2Cfg {
    id = 510,
    groupid = 150,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "谢谢你，不过皮皮好奇你为什么要告诉我们这些呢？"
    };
getRow(511)->
    #show2Cfg {
    id = 511,
    groupid = 150,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "额……为国王分忧是我们身为城民的职责，况且贝尔公主那么善良，我们大家都希望她能早日平安回来。"
    };
getRow(512)->
    #show2Cfg {
    id = 512,
    groupid = 150,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "原来如此，等我们找到了贝尔公主，会把你的话转达给她。"
    };
getRow(513)->
    #show2Cfg {
    id = 513,
    groupid = 150,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "谢谢，不过我要提醒你们，在见到国王之前，你们会先见到国王的总管凡卡大人，想顺利见到国王陛下，你们一定要努力想办法让凡卡大人高兴。"
    };
getRow(514)->
    #show2Cfg {
    id = 514,
    groupid = 151,
    taskname = "准备礼物",
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "凡卡大人非常喜欢收集精美的宝石，不久前他却丢失了一块贵重的宝石，连续几天都闷闷不乐。"
    };
getRow(515)->
    #show2Cfg {
    id = 515,
    groupid = 151,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "丢失的精美宝石……呀，会不会是我们刚刚捡到的那颗？"
    };
getRow(516)->
    #show2Cfg {
    id = 516,
    groupid = 151,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "光明勇士，我们带着刚才捡到的那块宝石去找凡卡大人吧。"
    };
getRow(517)->
    #show2Cfg {
    id = 517,
    groupid = 152,
    taskname = "前往宫殿",
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "站住，你们是什么人，竟然敢闯入国王的宫殿！"
    };
getRow(518)->
    #show2Cfg {
    id = 518,
    groupid = 152,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "凡卡大人不要误会，皮皮刚才捡到了一颗宝石，请问它是你丢失的那颗吗？"
    };
getRow(519)->
    #show2Cfg {
    id = 519,
    groupid = 152,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "它在哪？快点交出来。"
    };
getRow(520)->
    #show2Cfg {
    id = 520,
    groupid = 153,
    taskname = "凡卡总管",
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "这块宝石你们是从哪里捡到的？"
    };
getRow(521)->
    #show2Cfg {
    id = 521,
    groupid = 153,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "嗯，就在入口附近"
    };
getRow(522)->
    #show2Cfg {
    id = 522,
    groupid = 153,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "哼，还有其他发现么？"
    };
getRow(523)->
    #show2Cfg {
    id = 523,
    groupid = 153,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "没有了，其他的皮皮什么也没看到……"
    };
getRow(524)->
    #show2Cfg {
    id = 524,
    groupid = 153,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "你们两个人行径可疑，哼，卫兵们给我拿下！"
    };
getRow(525)->
    #show2Cfg {
    id = 525,
    groupid = 154,
    taskname = "愤怒的皮皮",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "总管大人好不讲理，皮皮好心归还你丢失的宝石，你不领情也就算了，还唤来卫兵抓皮皮，皮皮生气了！"
    };
getRow(526)->
    #show2Cfg {
    id = 526,
    groupid = 154,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "啊！！这是……星月之力。"
    };
getRow(527)->
    #show2Cfg {
    id = 527,
    groupid = 154,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "原来你们是露娜女神的手下，刚才是场误会……你们来应该是想见到我们的国王陛下吧，他就在大殿内。"
    };
getRow(528)->
    #show2Cfg {
    id = 528,
    groupid = 155,
    taskname = "海洋国国王",
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "光明勇士，欢迎你们来到海洋之心。"
    };
getRow(529)->
    #show2Cfg {
    id = 529,
    groupid = 155,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "咦？国王陛下，你居然认得光明勇士。"
    };
getRow(530)->
    #show2Cfg {
    id = 530,
    groupid = 155,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "呵呵呵，你们在到达入口地带时我就查觉到了星月之力，所以我一直在等待你们打来。"
    };
getRow(531)->
    #show2Cfg {
    id = 531,
    groupid = 155,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "国王陛下，我们得知你的公主失踪了，我们愿意帮助您找回公主。"
    };
getRow(532)->
    #show2Cfg {
    id = 532,
    groupid = 155,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "找回公主的任务十分艰难，在你们行动前，不妨让我来考验你们一番。"
    };
getRow(533)->
    #show2Cfg {
    id = 533,
    groupid = 156,
    taskname = "真言",
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "光明勇士，其实贝尔的失踪是我故意安排的"
    };
getRow(534)->
    #show2Cfg {
    id = 534,
    groupid = 156,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "啊？为什么！"
    };
getRow(535)->
    #show2Cfg {
    id = 535,
    groupid = 156,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "海洋之城内混入魔族，他们以贝尔的安全来胁迫我交出生命石。我与贝尔自然不肯，所以让贝尔连夜离开皇宫，到外面安全的地方躲起来。"
    };
getRow(536)->
    #show2Cfg {
    id = 536,
    groupid = 156,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "可是贝尔公主到了外面要是被魔族找到了，岂不是更危险？"
    };
getRow(537)->
    #show2Cfg {
    id = 537,
    groupid = 156,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "我的女儿是个勇敢的公主，她有保护自己的能力，我让她离开一方面是不想被魔族威胁，另一方面也是希望她能在外面寻找对抗魔族的办法。"
    };
getRow(538)->
    #show2Cfg {
    id = 538,
    groupid = 157,
    taskname = "合作",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "国王陛下，我们能为您做什么呢？"
    };
getRow(539)->
    #show2Cfg {
    id = 539,
    groupid = 157,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "我赠送你们一颗珍珠，贝尔见到了便能相信你们是真正的伙伴，我请求你们一起帮助贝尔找到城中隐藏的魔族，保护海洋城民的安全！"
    };
getRow(540)->
    #show2Cfg {
    id = 540,
    groupid = 157,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "好，皮皮答应你！"
    };
getRow(541)->
    #show2Cfg {
    id = 541,
    groupid = 158,
    taskname = "暂别国王",
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "拜托了你们，勇敢的年轻人！"
    };
getRow(542)->
    #show2Cfg {
    id = 542,
    groupid = 158,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "我们一定会帮助你们的。"
    };
getRow(543)->
    #show2Cfg {
    id = 543,
    groupid = 158,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "城中的达达守卫和玛丽夫人都是值得信赖的伙伴，你们有什么困难可以去寻找他们帮忙。"
    };
getRow(544)->
    #show2Cfg {
    id = 544,
    groupid = 159,
    taskname = "威胁",
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "你们接受了国王的悬赏，去寻找我们的贝尔公主？"
    };
getRow(545)->
    #show2Cfg {
    id = 545,
    groupid = 159,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "是的，总管大人，您能为我们提供些关于公主的线索么？"
    };
getRow(546)->
    #show2Cfg {
    id = 546,
    groupid = 159,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "没有，不过我要提醒你们，若不能尽快找到贝尔公主，即便你们不是海洋之城的城民，我也会制裁你们的！"
    };
getRow(547)->
    #show2Cfg {
    id = 547,
    groupid = 159,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哼，好大的口气，不过皮皮一定会找到公主的。"
    };
getRow(548)->
    #show2Cfg {
    id = 548,
    groupid = 160,
    taskname = "打探",
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "嗨，你们似乎是从王宫里出来的吧，国王的悬赏你们接受了么？"
    };
getRow(549)->
    #show2Cfg {
    id = 549,
    groupid = 160,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "嗯，瑞斯先生，皮皮想请你帮一个忙。"
    };
getRow(550)->
    #show2Cfg {
    id = 550,
    groupid = 160,
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "只要你们付出的价钱让我高兴，一切好说。"
    };
getRow(551)->
    #show2Cfg {
    id = 551,
    groupid = 160,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "您知道玛丽夫人在哪么？"
    };
getRow(552)->
    #show2Cfg {
    id = 552,
    groupid = 160,
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "当然，玛丽夫人可是海洋城有名的女士之一，不过她和凡卡很像，都喜欢收集精致的东西。"
    };
getRow(553)->
    #show2Cfg {
    id = 553,
    groupid = 161,
    taskname = "美人玛丽",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "你好，玛丽夫人。"
    };
getRow(554)->
    #show2Cfg {
    id = 554,
    groupid = 161,
    npcid = 3113,
    emotion = 1,
    name = "玛丽",
    side = 1,
    content = "小姑娘，请叫我美人玛丽……"
    };
getRow(555)->
    #show2Cfg {
    id = 555,
    groupid = 161,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "美人玛丽……国王陛下说你是他信赖的伙伴，因此我们来寻你，请夫人你为我们提供一些贝尔公主的线索。"
    };
getRow(556)->
    #show2Cfg {
    id = 556,
    groupid = 161,
    npcid = 3113,
    emotion = 1,
    name = "玛丽",
    side = 1,
    content = "小姑娘，求人帮忙是需要诚意的。"
    };
getRow(557)->
    #show2Cfg {
    id = 557,
    groupid = 162,
    taskname = "玛丽的请求",
    npcid = 3113,
    emotion = 1,
    name = "玛丽",
    side = 1,
    content = "上面是我饲养的灵宠，或许是因为魔气的缘故把，它们变得很暴躁。我不喜欢它们粗暴的样子，你能替我调教它们么？"
    };
getRow(558)->
    #show2Cfg {
    id = 558,
    groupid = 162,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "好啊，玛丽夫人……哦不，是美人玛丽。"
    };
getRow(559)->
    #show2Cfg {
    id = 559,
    groupid = 163,
    taskname = "暴躁的灵宠",
    npcid = 3118,
    emotion = 1,
    name = "灵宠",
    side = 1,
    content = "呼呼，受不了，玛丽总逼我们叫她美人，真的好讨厌啊！"
    };
getRow(560)->
    #show2Cfg {
    id = 560,
    groupid = 163,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "皮皮能理解你们的心情。"
    };
getRow(561)->
    #show2Cfg {
    id = 561,
    groupid = 163,
    npcid = 3118,
    emotion = 1,
    name = "灵宠",
    side = 1,
    content = "嘘嘘，她脾气怪的很，要是被她听到的话，我们又要受罪了。"
    };
getRow(562)->
    #show2Cfg {
    id = 562,
    groupid = 163,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "……小可怜们。"
    };
getRow(563)->
    #show2Cfg {
    id = 563,
    groupid = 164,
    taskname = "线索",
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "贝尔公主其实是个强大的魔法师，就算独自一人流落在外也不会有什么危险，唯一不足的就是没有我漂亮。"
    };
getRow(564)->
    #show2Cfg {
    id = 564,
    groupid = 164,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "咳咳，玛丽夫人，事关重大，皮皮需要知道关于贝尔公主的消息，请您在提供一些有用的线索吧。"
    };
getRow(565)->
    #show2Cfg {
    id = 565,
    groupid = 164,
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "是美人玛丽，五天前，贝尔公主曾乔装打扮来到我拿走一些药物。"
    };
getRow(566)->
    #show2Cfg {
    id = 566,
    groupid = 164,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "啊，她受伤了？！"
    };
getRow(567)->
    #show2Cfg {
    id = 567,
    groupid = 164,
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "不，她拿走是一些炼制魔药的原材料，应该是为了对抗魔族而用。"
    };
getRow(568)->
    #show2Cfg {
    id = 568,
    groupid = 164,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "魔药材料，有了，光明勇士，皮皮有个计划，我们现在行动起来吧。"
    };
getRow(569)->
    #show2Cfg {
    id = 569,
    groupid = 165,
    taskname = "达达的援助",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "别担心，我来帮你们"
    };
getRow(570)->
    #show2Cfg {
    id = 570,
    groupid = 165,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "达达，小心！"
    };
getRow(571)->
    #show2Cfg {
    id = 571,
    groupid = 166,
    taskname = "再遇达达",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "嘿，这里的魔族似乎对你们很感兴趣呢！"
    };
getRow(572)->
    #show2Cfg {
    id = 572,
    groupid = 166,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "好讨厌啊。这里的魔族盯上了我们。"
    };
getRow(573)->
    #show2Cfg {
    id = 573,
    groupid = 166,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "这也说明现在的海洋城并不安全啊，处处都有魔族的爪牙，你们要是能帮助国王陛下赶走魔族，就是海洋国的大恩人啊。到时候想要什么，国王陛下都会满足你们的。"
    };
getRow(574)->
    #show2Cfg {
    id = 574,
    groupid = 166,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "咦，对了。皮皮记得你也是深受国王陛下信赖的人，快点告诉皮皮，贝尔公主在哪里？不许隐瞒哦！"
    };
getRow(575)->
    #show2Cfg {
    id = 575,
    groupid = 167,
    taskname = "引路",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "我们的公主既聪明又勇敢，她不仅在收集对抗魔族的用具，还组建了一支军队。等到时机成熟，我们便于公主一起驱赶魔族！"
    };
getRow(576)->
    #show2Cfg {
    id = 576,
    groupid = 167,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哎哎，说重点，贝尔公主在哪？"
    };
getRow(577)->
    #show2Cfg {
    id = 577,
    groupid = 167,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "公主用法术伪装了自己原来的样貌，你们往前走或许会遇到一个可爱的小女孩，她就是贝尔公主。"
    };
getRow(578)->
    #show2Cfg {
    id = 578,
    groupid = 168,
    taskname = "海洋城明珠",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "你好，勇敢的贝尔公主，皮皮终于找到你啦。"
    };
getRow(579)->
    #show2Cfg {
    id = 579,
    groupid = 168,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "我才不是什么公主，你们不要胡说八道！"
    };
getRow(580)->
    #show2Cfg {
    id = 580,
    groupid = 168,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哎哎，先别急着否认哦，皮皮给你看这个！"
    };
getRow(581)->
    #show2Cfg {
    id = 581,
    groupid = 169,
    taskname = "相信",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "这是父亲的珍珠，你们是？"
    };
getRow(582)->
    #show2Cfg {
    id = 582,
    groupid = 169,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "别激动，皮皮和光明勇士是来帮助你们的，我们和你一样非常痛恨魔族。"
    };
getRow(583)->
    #show2Cfg {
    id = 583,
    groupid = 169,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "原来如此，我父亲现在的状况如何？"
    };
getRow(584)->
    #show2Cfg {
    id = 584,
    groupid = 169,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "他很好，公主不用担心。对了，我们从玛丽夫人那里得知你在寻找驱魔的原材料。这些就全都送给你好啦。"
    };
getRow(585)->
    #show2Cfg {
    id = 585,
    groupid = 170,
    taskname = "礼物",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "谢谢你们"
    };
getRow(586)->
    #show2Cfg {
    id = 586,
    groupid = 171,
    taskname = "驱魔药",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "你们怎么会驱魔药的制作方法？"
    };
getRow(587)->
    #show2Cfg {
    id = 587,
    groupid = 171,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "嘻，皮皮在东成郊平原认识了一位了不起的草药学家，他给了皮皮一张制作驱魔药的单子。如果你想学习驱魔药的制作方法，皮皮可以教你哦。"
    };
getRow(588)->
    #show2Cfg {
    id = 588,
    groupid = 171,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "太好了，贝尔要制作很多很多的驱魔药来救大家。"
    };
getRow(589)->
    #show2Cfg {
    id = 589,
    groupid = 172,
    taskname = "隐情",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "既然你们是朋友，那么我就把最近收集到的消息统统告诉你们。"
    };
getRow(590)->
    #show2Cfg {
    id = 590,
    groupid = 172,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "好啊，请公主畅所欲言。"
    };
getRow(591)->
    #show2Cfg {
    id = 591,
    groupid = 172,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "如今海洋之城进入了如此多的魔族，正是因为有海洋城内部的人与魔族暗中勾结。"
    };
getRow(592)->
    #show2Cfg {
    id = 592,
    groupid = 172,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哼，是谁那么可恶！！！"
    };
getRow(593)->
    #show2Cfg {
    id = 593,
    groupid = 172,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "就是父亲最信赖的同伴，凡卡叔叔。"
    };
getRow(594)->
    #show2Cfg {
    id = 594,
    groupid = 173,
    taskname = "幕后黑手",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "竟然是他！哼，他脾气很坏很坏，皮皮一开始就很讨厌他。"
    };
getRow(595)->
    #show2Cfg {
    id = 595,
    groupid = 173,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "起初我不相信这个事实，毕竟凡卡叔叔效忠父亲多年。直到那一晚我亲眼看到他与魔族成员交谈，我才不得不接受了这个事实。"
    };
getRow(596)->
    #show2Cfg {
    id = 596,
    groupid = 173,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "这个坏蛋！贝尔公主，我们不如马上就去揭穿他的真面目！"
    };
getRow(597)->
    #show2Cfg {
    id = 597,
    groupid = 173,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "不行，我的父亲还在皇宫里，他不久前受了重伤，现在无法离开皇宫。"
    };
getRow(598)->
    #show2Cfg {
    id = 598,
    groupid = 173,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "那我们该怎么办呢？"
    };
getRow(599)->
    #show2Cfg {
    id = 599,
    groupid = 173,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "我的侍女伊莲娜正在训练灵兽，我想借助灵兽的力量攻打凡卡的军队并救出父亲。"
    };
getRow(600)->
    #show2Cfg {
    id = 600,
    groupid = 174,
    taskname = "寻找伊莲娜",
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "这些都是公主精心挑选出的灵兽，我要好好训练它们。等它们在长大一些，就能成为我们得力助手。"
    };
getRow(601)->
    #show2Cfg {
    id = 601,
    groupid = 174,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "奇怪，为什么皮皮会在这些灵兽身上感到一些魔气？"
    };
getRow(602)->
    #show2Cfg {
    id = 602,
    groupid = 174,
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "啊！怎么这会这样？"
    };
getRow(603)->
    #show2Cfg {
    id = 603,
    groupid = 174,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "魔族进入海洋之城的数量繁多，同时也带来了大量的魔气。这些灵兽尚且幼小，对魔气的抵抗较弱。不过别担心，看皮皮的。"
    };
getRow(604)->
    #show2Cfg {
    id = 604,
    groupid = 175,
    taskname = "伊莲娜的请求",
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "多亏你们及时发现灵兽的状况，否则我太对不起贝尔公主和国王陛下了。"
    };
getRow(605)->
    #show2Cfg {
    id = 605,
    groupid = 175,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "小事一桩，下次注意点啦"
    };
getRow(606)->
    #show2Cfg {
    id = 606,
    groupid = 175,
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "嗯，有一件事我想拜托你们，这些灵兽非常调皮顽劣，你们能帮我驯化它们么？"
    };
getRow(607)->
    #show2Cfg {
    id = 607,
    groupid = 176,
    taskname = "驯化灵兽",
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "这些灵兽身上掉落的绒毛是炼化武器的好材料，作为公主殿下的朋友，你们可以从它们身上收集一些。"
    };
getRow(608)->
    #show2Cfg {
    id = 608,
    groupid = 176,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "谢谢伊莲娜。"
    };
getRow(609)->
    #show2Cfg {
    id = 609,
    groupid = 177,
    taskname = "公主的计划",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "伊莲娜驯化的灵兽还需要一段时间才能派上用场，在发动战争之前，我请你们在去趟王宫确认一下我父亲的情况。另外，一定要告诉父亲，凡卡的真面目。"
    };
getRow(610)->
    #show2Cfg {
    id = 610,
    groupid = 177,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "没问题，可是如果那个凡卡真的背叛了国王陛下，那么国王陛下岂不是很危险。"
    };
getRow(611)->
    #show2Cfg {
    id = 611,
    groupid = 177,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "在没有得到父亲手上的生命石之前，凡卡不会也不敢对父亲下毒手的！"
    };
getRow(612)->
    #show2Cfg {
    id = 612,
    groupid = 177,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "啊，那个坏蛋也想得到生命石？"
    };
getRow(613)->
    #show2Cfg {
    id = 613,
    groupid = 177,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "生命石是海洋城的至宝，有了生命石力量的支撑，海洋城民才能安居到现在。如果生命石被其他人拿走了，那么对海洋城将是一场无法形容的灾难……"
    };
getRow(614)->
    #show2Cfg {
    id = 614,
    groupid = 177,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "……皮皮知道了，现在皮皮和光明勇士马上返回皇宫看看国王陛下的情况。"
    };
getRow(615)->
    #show2Cfg {
    id = 615,
    groupid = 178,
    taskname = "返回王宫",
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "你们找到贝尔了么？"
    };
getRow(616)->
    #show2Cfg {
    id = 616,
    groupid = 178,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "是的，夫人。哦不，是美人玛丽。"
    };
getRow(617)->
    #show2Cfg {
    id = 617,
    groupid = 178,
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "那为什么公主没有和你们在一起？"
    };
getRow(618)->
    #show2Cfg {
    id = 618,
    groupid = 178,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "公主要我们先发回王宫看看国王陛下的情况。"
    };
getRow(619)->
    #show2Cfg {
    id = 619,
    groupid = 178,
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "别回去了，凡卡总管已经代替国王发布公告，国王病重修养，不想见到任何人。"
    };
getRow(620)->
    #show2Cfg {
    id = 620,
    groupid = 179,
    taskname = "惊变",
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "国王突然宣布病重修养，这实在太奇怪了！我们的贝尔公主又下落不明，海洋城真的要完蛋了么？"
    };
getRow(621)->
    #show2Cfg {
    id = 621,
    groupid = 179,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "闭上你的乌鸦嘴，你再胡说八道，皮皮可要生气了！"
    };
getRow(622)->
    #show2Cfg {
    id = 622,
    groupid = 179,
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "你这个小可爱脾气还挺大，你这么在意国王陛下，怎么不进到王宫里面看看。"
    };
getRow(623)->
    #show2Cfg {
    id = 623,
    groupid = 179,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哼，皮皮在想该怎么用不打架的方法进入王宫呢。"
    };
getRow(624)->
    #show2Cfg {
    id = 624,
    groupid = 179,
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "……我有个主意，嘻嘻嘻！~你们趁着王宫侍卫换班的时间打晕他们，从那里拿到侍卫的衣服就可以混入王宫了。"
    };
getRow(625)->
    #show2Cfg {
    id = 625,
    groupid = 180,
    taskname = "易装",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "咳咳，光明勇士，我们快点穿上这套衣服进入王宫。确认国王平安无事，就马上离开这里。"
    };
getRow(626)->
    #show2Cfg {
    id = 626,
    groupid = 181,
    taskname = "再入王宫",
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "你们两个是哪个卫队的成员？为什么不与自己的同伴在一块？"
    };
getRow(627)->
    #show2Cfg {
    id = 627,
    groupid = 181,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "咳咳……凡卡大人别生气，我们刚刚发现王宫外似乎有人在暗中窥伺，为了确认一下，就急忙出去了。"
    };
getRow(628)->
    #show2Cfg {
    id = 628,
    groupid = 181,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "有什么发现么？"
    };
getRow(629)->
    #show2Cfg {
    id = 629,
    groupid = 181,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "额，没有，什么也没有。"
    };
getRow(630)->
    #show2Cfg {
    id = 630,
    groupid = 182,
    taskname = "惩罚",
    npcid = 3119,
    emotion = 1,
    name = "海之国侍卫",
    side = 1,
    content = "来……人，有……额！"
    };
getRow(631)->
    #show2Cfg {
    id = 631,
    groupid = 182,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "乖乖给皮皮睡上一觉吧。可不能让你坏了大事。"
    };
getRow(632)->
    #show2Cfg {
    id = 632,
    groupid = 183,
    taskname = "再遇国王",
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "你们终于回来了，贝尔找到了么？"
    };
getRow(633)->
    #show2Cfg {
    id = 633,
    groupid = 183,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "国王陛下，贝尔公主很勇敢，她发现了幕后主使，就是凡卡这个大坏蛋。"
    };
getRow(634)->
    #show2Cfg {
    id = 634,
    groupid = 183,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "唉……凡卡他，他跟随我多年，要不是他亲自带人软禁我，我实在无法相信他竟然会背叛我。"
    };
getRow(635)->
    #show2Cfg {
    id = 635,
    groupid = 183,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "请您放心，我们一定会解救您的。对了，还请您告诉皮皮，生命石与海洋城的安危有什么关系呢？"
    };
getRow(636)->
    #show2Cfg {
    id = 636,
    groupid = 184,
    taskname = "真相",
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "这座海洋城实际上是一个火山口，需要生命石的力量来抑制，一旦这里没有了生命石则会引起火山迸发，那么海洋城将彻底消失，到那时任何城民和生灵都没有了生存的希望。"
    };
getRow(637)->
    #show2Cfg {
    id = 637,
    groupid = 184,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "原来如此，贝尔公主告诉皮皮，她亲眼看到凡卡与魔族接触。其实魔族一直在寻找生命石，它们的目的是想帮助阿尔萨德解除女神的封印。无论如何，您千万不能交出生命之石。"
    };
getRow(638)->
    #show2Cfg {
    id = 638,
    groupid = 184,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "阿尔萨德？那个大魔头！不论如何，一定要阻止他们！"
    };
getRow(639)->
    #show2Cfg {
    id = 639,
    groupid = 184,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "公主的侍女正在驯化灵兽，等那些灵兽在强大一些，我们就会带着灵兽来解救您。"
    };
getRow(640)->
    #show2Cfg {
    id = 640,
    groupid = 184,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "灵兽？！凡卡也在暗中培育魔灵兽，你们要小心！"
    };
getRow(641)->
    #show2Cfg {
    id = 641,
    groupid = 185,
    taskname = "野心",
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "你们休想离开这里！"
    };
getRow(642)->
    #show2Cfg {
    id = 642,
    groupid = 185,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "你这个大坏蛋竟然与魔族合作，皮皮讨厌你！"
    };
getRow(643)->
    #show2Cfg {
    id = 643,
    groupid = 185,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "你们只要归顺于我，待我成为新的国王，必将重用你们！"
    };
getRow(644)->
    #show2Cfg {
    id = 644,
    groupid = 185,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "休想！"
    };
getRow(645)->
    #show2Cfg {
    id = 645,
    groupid = 186,
    taskname = "阻拦",
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "你们别想跑掉，看我的魔灵兽！"
    };
getRow(646)->
    #show2Cfg {
    id = 646,
    groupid = 186,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "啊！你居然敢在王宫里圈养魔兽，你真是个疯子！"
    };
getRow(647)->
    #show2Cfg {
    id = 647,
    groupid = 187,
    taskname = "藏身",
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "发生了什么事，你们怎么这么狼狈？"
    };
getRow(648)->
    #show2Cfg {
    id = 648,
    groupid = 187,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "都是凡卡那个大坏蛋，他不仅魔灵兽咬皮皮，还派凶恶的魔族追杀我们。"
    };
getRow(649)->
    #show2Cfg {
    id = 649,
    groupid = 187,
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "你们竟然得罪了凡卡大人，还是快点离开我这里吧，不然我可要跟着你们遭殃啊！"
    };
getRow(650)->
    #show2Cfg {
    id = 650,
    groupid = 188,
    taskname = "逃跑",
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "虽然你们很狼狈，但是我还是要赞叹你们的勇气。"
    };
getRow(651)->
    #show2Cfg {
    id = 651,
    groupid = 188,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "谢谢玛丽夫人的安慰……"
    };
getRow(652)->
    #show2Cfg {
    id = 652,
    groupid = 188,
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "要叫我美人玛丽，你们的动静如此之大，凡卡那个丑八怪一定会派人全城的寻找你们，你们还是尽快与公主汇合，她可以帮助你们的。"
    };
getRow(653)->
    #show2Cfg {
    id = 653,
    groupid = 188,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "谢谢。"
    };
getRow(654)->
    #show2Cfg {
    id = 654,
    groupid = 189,
    taskname = "失控的灵宠",
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "给你一次报答我的机会，我的灵宠又开始不听话了。这一次它们闹的更凶，就委托你们帮我制服它们。"
    };
getRow(655)->
    #show2Cfg {
    id = 655,
    groupid = 190,
    taskname = "同伴的关心",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "这一次真的太辛苦你们了。"
    };
getRow(656)->
    #show2Cfg {
    id = 656,
    groupid = 190,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "幸好我们的光明勇士给力，否则皮皮真的会被抓住的。"
    };
getRow(657)->
    #show2Cfg {
    id = 657,
    groupid = 190,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "我父亲的情况如何？他有没有事？"
    };
getRow(658)->
    #show2Cfg {
    id = 658,
    groupid = 190,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "国王陛下只是被软禁，凡卡还没有拿到生命石，国王陛下暂时是安全的。不过，我们要尽快实施营救国王的行动，凡卡那个坏蛋也在暗地里饲养了魔灵兽！"
    };
getRow(659)->
    #show2Cfg {
    id = 659,
    groupid = 190,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "什么，得赶快把这个消息告诉伊莲娜！"
    };
getRow(660)->
    #show2Cfg {
    id = 660,
    groupid = 191,
    taskname = "同伴的担忧",
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "凡卡居然在饲养魔灵兽。该死！"
    };
getRow(661)->
    #show2Cfg {
    id = 661,
    groupid = 191,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "伊莲娜姐姐似乎很着急呢，我们饲养的灵兽难道比不过他们么？"
    };
getRow(662)->
    #show2Cfg {
    id = 662,
    groupid = 191,
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "魔灵兽天生含带魔气，一般的灵兽根本无法与其抗衡，让我想想该怎么增强灵兽的实力……"
    };
getRow(663)->
    #show2Cfg {
    id = 663,
    groupid = 192,
    taskname = "妙计",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "我想到一个削弱魔灵兽的办法。"
    };
getRow(664)->
    #show2Cfg {
    id = 664,
    groupid = 192,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "快点说说看！"
    };
getRow(665)->
    #show2Cfg {
    id = 665,
    groupid = 192,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "我们掌握了制作驱魔剂的方法，不妨多做一些驱魔剂，再想办法将驱魔剂悄悄的投放到魔灵兽那里去，削弱魔灵兽的实力。"
    };
getRow(666)->
    #show2Cfg {
    id = 666,
    groupid = 192,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "这是个不错的注意，皮皮可以做好多驱魔剂，只是我们怎么做才能把驱魔剂投放到魔灵兽那里还不惊动凡卡那个坏蛋呢？"
    };
getRow(667)->
    #show2Cfg {
    id = 667,
    groupid = 192,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "不急，你们做好药剂以后交给达达就可以了。"
    };
getRow(668)->
    #show2Cfg {
    id = 668,
    groupid = 193,
    taskname = "寻找达达",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "公主的计划确实不错，但是需要冒很大的风险。有了！你们跟我去见一个人。"
    };
getRow(669)->
    #show2Cfg {
    id = 669,
    groupid = 194,
    taskname = "达达的同伴",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "事情就是这样，罗米亚，请你一定要帮助他们！"
    };
getRow(670)->
    #show2Cfg {
    id = 670,
    groupid = 194,
    npcid = 3111,
    emotion = 1,
    name = "罗米亚",
    side = 1,
    content = "没问题，说实话我很佩服你们这些勇敢的人。"
    };
getRow(671)->
    #show2Cfg {
    id = 671,
    groupid = 194,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "皮皮很高兴你愿意帮助我们，你也是一个勇敢的同伴。"
    };
getRow(672)->
    #show2Cfg {
    id = 672,
    groupid = 194,
    npcid = 3111,
    emotion = 1,
    name = "罗米亚",
    side = 1,
    content = "这钥匙可以打开魔灵兽大门，午夜时刻正是魔灵兽睡觉的时候，你们要在最短的时间内投放药剂，然后立即离开那里！"
    };
getRow(673)->
    #show2Cfg {
    id = 673,
    groupid = 194,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "皮皮知道了！"
    };
getRow(674)->
    #show2Cfg {
    id = 674,
    groupid = 195,
    taskname = "狂怒的凡卡",
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "你毁了我魔灵兽，我要杀了你们！"
    };
getRow(675)->
    #show2Cfg {
    id = 675,
    groupid = 195,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "你活该，哼！"
    };
getRow(676)->
    #show2Cfg {
    id = 676,
    groupid = 196,
    taskname = "汇合",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "你们做的太棒了，魔灵兽被彻底消灭，我们有希望将他们赶出海洋城。"
    };
getRow(677)->
    #show2Cfg {
    id = 677,
    groupid = 196,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "看到那个凡卡坏蛋起冒烟的样子，皮皮好高兴呢！"
    };
getRow(678)->
    #show2Cfg {
    id = 678,
    groupid = 196,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "公主殿下已经准备差不多了，你们过去与她确认一下，大家一起行动营救国王陛下。"
    };
getRow(679)->
    #show2Cfg {
    id = 679,
    groupid = 197,
    taskname = "公主的誓言",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "忠诚的海洋城民们，我以公主的名义起誓，营救我们的国王，驱赶海洋城的叛徒，重建我们的家园！"
    };
getRow(680)->
    #show2Cfg {
    id = 680,
    groupid = 197,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "公主万岁！"
    };
getRow(681)->
    #show2Cfg {
    id = 681,
    groupid = 197,
    npcid = 3111,
    emotion = 1,
    name = "罗米亚",
    side = 1,
    content = "公主万岁！"
    };
getRow(682)->
    #show2Cfg {
    id = 682,
    groupid = 197,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "哇，贝尔公主好有气势呢，光明勇士，我们也要加油！"
    };
getRow(683)->
    #show2Cfg {
    id = 683,
    groupid = 198,
    taskname = "灵兽出击",
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "我的灵兽已经驯化完毕，它们可以随同大家一起出击。"
    };
getRow(684)->
    #show2Cfg {
    id = 684,
    groupid = 198,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "太好了，有了灵兽出战可以帮助我们很多呢。"
    };
getRow(685)->
    #show2Cfg {
    id = 685,
    groupid = 198,
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "过奖了，我要谢谢你们及时做出了驱魔药剂，不然这些小家伙恐怕无法顺利长大。"
    };
getRow(686)->
    #show2Cfg {
    id = 686,
    groupid = 199,
    taskname = "不详的预感",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "恩……"
    };
getRow(687)->
    #show2Cfg {
    id = 687,
    groupid = 199,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "贝尔公主，你没事吧？"
    };
getRow(688)->
    #show2Cfg {
    id = 688,
    groupid = 199,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "我有些担心，凡卡那个家伙与魔族合作不仅仅是为了得到王位，或许他还有更大的野心！"
    };
getRow(689)->
    #show2Cfg {
    id = 689,
    groupid = 199,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "！！是什么？"
    };
getRow(690)->
    #show2Cfg {
    id = 690,
    groupid = 199,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "禁地一带，那里是海洋城生命之核也就是生命石的所在地，除了国王没有人有资格进入那里。我担心凡卡会趁混乱引入魔族去那。"
    };
getRow(691)->
    #show2Cfg {
    id = 691,
    groupid = 199,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "那可不行，皮皮要和光明勇士去阻止他们。"
    };
getRow(692)->
    #show2Cfg {
    id = 692,
    groupid = 200,
    taskname = "前往禁地",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "罗米亚看守的地方就是禁地一带，那里十分危险，你们要小心。"
    };
getRow(693)->
    #show2Cfg {
    id = 693,
    groupid = 200,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "知道了，你也要注意保护自己。"
    };
getRow(694)->
    #show2Cfg {
    id = 694,
    groupid = 201,
    taskname = "恶战前的准备",
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "哈哈哈，海洋城要遇上一场前所为有的战斗，我可要发大财了！"
    };
getRow(695)->
    #show2Cfg {
    id = 695,
    groupid = 201,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "可恶的家伙……光明勇士马上要去收拾凡卡那个坏蛋了。你这里有没有让我们补充体力的食物呢？"
    };
getRow(696)->
    #show2Cfg {
    id = 696,
    groupid = 201,
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "当然，只是价格么，要比往常高了点~哈哈哈。"
    };
getRow(697)->
    #show2Cfg {
    id = 697,
    groupid = 202,
    taskname = "进入禁地",
    npcid = 3111,
    emotion = 1,
    name = "罗米亚",
    side = 1,
    content = "没错，我背后看守的地方就是海洋城的禁地一带，除了国王陛下任何人都不能进入这里。"
    };
getRow(698)->
    #show2Cfg {
    id = 698,
    groupid = 202,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "凡卡现在很可能就在里面，请你让我们进去，光明勇士要去阻止凡卡。"
    };
getRow(699)->
    #show2Cfg {
    id = 699,
    groupid = 202,
    npcid = 3111,
    emotion = 1,
    name = "罗米亚",
    side = 1,
    content = "这……好吧。一切就拜托你们了。禁地中很可能有极其难对付的灵兽，若需要帮忙就马上召唤向大家。"
    };
getRow(700)->
    #show2Cfg {
    id = 700,
    groupid = 203,
    taskname = "禁地恶龙",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "住手，不准在靠近生命石。"
    };
getRow(701)->
    #show2Cfg {
    id = 701,
    groupid = 203,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "哼，捣乱的来了！"
    };
getRow(702)->
    #show2Cfg {
    id = 702,
    groupid = 204,
    taskname = "禁地魔灵兽",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "咦？怎么还有魔灵兽。"
    };
getRow(703)->
    #show2Cfg {
    id = 703,
    groupid = 204,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "哈哈哈，这是我给你们这些好管闲事的人一份礼物，乖乖成为魔灵兽的食物吧！"
    };
getRow(704)->
    #show2Cfg {
    id = 704,
    groupid = 205,
    taskname = "禁地人蛇姬",
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "贝尔从今往后网你就是海洋城新的女王，不要让爸爸失望！"
    };
getRow(705)->
    #show2Cfg {
    id = 705,
    groupid = 205,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "父亲，你要做什么？！不！！！！"
    };
getRow(706)->
    #show2Cfg {
    id = 706,
    groupid = 205,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "国王陛下！"
    };
getRow(707)->
    #show2Cfg {
    id = 707,
    groupid = 206,
    taskname = "告别达达",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "国王陛下他……他是海洋城最伟大的国王！"
    };
getRow(708)->
    #show2Cfg {
    id = 708,
    groupid = 206,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "呜！皮皮没想到事情会变成这样。"
    };
getRow(709)->
    #show2Cfg {
    id = 709,
    groupid = 206,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "你们已经尽力了，作为海洋城的城民我要由衷的感谢你们出手帮忙。"
    };
getRow(710)->
    #show2Cfg {
    id = 710,
    groupid = 206,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "现在，我们要离开这里了，后会有期。"
    };
getRow(711)->
    #show2Cfg {
    id = 711,
    groupid = 207,
    taskname = "告别贝尔",
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "对不起，皮皮和光明勇士还是没能解救国王……对不起。"
    };
getRow(712)->
    #show2Cfg {
    id = 712,
    groupid = 207,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "父亲为海洋国牺牲生命，他虽然离开了我以及海洋城城民，但是他永远活在我们的心里。"
    };
getRow(713)->
    #show2Cfg {
    id = 713,
    groupid = 207,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "嗯，一定是这样的，贝尔公主，哦不，贝尔女王，你一定要做一个优秀的女王，不要辜负国王陛下的期望哦！"
    };
getRow(714)->
    #show2Cfg {
    id = 714,
    groupid = 207,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "我一定会的，你们是要离开这了么？我以海洋城女王的名义为你们祝福，你们永远是海洋城民的朋友，海洋城永远欢迎你们。"
    };
getRow(715)->
    #show2Cfg {
    id = 715,
    groupid = 207,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "谢谢女王，请你和城民多多保重，我们要出发了。"
    };
getRow(716)->
    #show2Cfg {
    id = 716,
    groupid = 208,
    taskname = "离开海洋之心",
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "前面就是出口，海洋城的下面是精灵故土，那里有很多精灵族人。祝你们一切顺利。"
    };
getRow(717)->
    #show2Cfg {
    id = 717,
    groupid = 208,
    npcid = 3007,
    emotion = 1,
    name = "绿皮皮",
    side = 2,
    content = "伊莲娜姐姐好好保护贝尔女王，皮皮以后会来看大家的。"
    };
getRow(718)->
    #show2Cfg {
    id = 718,
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
    6000
    ].

