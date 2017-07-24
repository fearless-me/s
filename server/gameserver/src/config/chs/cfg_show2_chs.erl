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
    taskname = "嘿，别走神！",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "唔…我怎么睡着了，大家都去哪儿了？"
    };
getRow(2)->
    #show2Cfg {
    id = 2,
    groupid = 1,
    npcid = 3000,
    emotion = 1,
    name = "派诺",
    side = 1,
    content = "当然是参加考核去了，你还在这儿是不是想明年再来一次？…"
    };
getRow(3)->
    #show2Cfg {
    id = 3,
    groupid = 1,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "看来我得加快速度了，[fff000]派诺[-]考核官，我应该找谁考核呢？"
    };
getRow(4)->
    #show2Cfg {
    id = 4,
    groupid = 1,
    npcid = 3000,
    emotion = 1,
    name = "派诺",
    side = 1,
    content = "真是对牛弹琴呐，快去找A君进行第一项考核。"
    };
getRow(5)->
    #show2Cfg {
    id = 5,
    groupid = 1,
    npcid = 3000,
    emotion = 1,
    name = "派诺",
    side = 1
    };
getRow(6)->
    #show2Cfg {
    id = 6,
    groupid = 3,
    taskname = "考核一：舞蹈形体",
    npcid = 1117,
    emotion = 1,
    name = "A君",
    side = 1,
    content = "[fff000]【{PlayerName}】[-]，舞蹈可是每年考核的必定考核题目，现在请你展示自己最拿手的一项舞蹈，由裁判进行打分，超过60分即通过。"
    };
getRow(9)->
    #show2Cfg {
    id = 9,
    groupid = 4,
    npcid = 1110,
    emotion = 1,
    name = "B酱（裁判）",
    side = 1,
    content = "你这舞蹈倒是让人眼前一亮，现在裁判正在打分中，你稍等一下。"
    };
getRow(10)->
    #show2Cfg {
    id = 10,
    groupid = 4,
    npcid = 1118,
    emotion = 1,
    name = "喵女（裁判）",
    side = 1,
    content = "经裁判团评分，去掉一个最高分去掉一个最低分，你的分数是…"
    };
getRow(11)->
    #show2Cfg {
    id = 11,
    groupid = 4,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "呼，好紧张。"
    };
getRow(12)->
    #show2Cfg {
    id = 12,
    groupid = 4,
    npcid = 1118,
    emotion = 1,
    name = "喵女（裁判）",
    side = 1,
    content = "恭喜你，满分通过，下边去找莉安考核官进行第二项考核吧。"
    };
getRow(13)->
    #show2Cfg {
    id = 13,
    groupid = 4,
    npcid = 1118,
    emotion = 1,
    name = "喵女（裁判）",
    side = 1
    };
getRow(14)->
    #show2Cfg {
    id = 14,
    groupid = 5,
    taskname = "莉安对话",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "第二项考核我会给予你4项技能，如果你能在一场战斗中至少领悟一个并成功运用则通过。"
    };
getRow(15)->
    #show2Cfg {
    id = 15,
    groupid = 5,
    npcid = 1115,
    emotion = 1,
    name = "莉安",
    side = 1,
    content = "先到旁边去选取一把趁手的武器吧。"
    };
getRow(16)->
    #show2Cfg {
    id = 16,
    groupid = 6,
    taskname = "打败史莱姆",
    npcid = 1115,
    emotion = 1,
    name = "莉安",
    side = 1,
    content = "虽然只领悟了一项技能，不过领悟得还不错，算你通关，去找迪艾勒进行下一项考核吧。"
    };
getRow(17)->
    #show2Cfg {
    id = 17,
    groupid = 6,
    npcid = 1115,
    emotion = 1,
    name = "莉安",
    side = 1
    };
getRow(18)->
    #show2Cfg {
    id = 18,
    groupid = 8,
    taskname = "考核二：照顾苏珊",
    npcid = 3001,
    emotion = 1,
    name = "迪艾勒",
    side = 1,
    content = "[fff000]【{PlayerName}】[-]成年考核是成长的标识，不仅仅是能力的成长，更是心智的成长，这第三项考核是心智考核，你准备好了吗？"
    };
getRow(19)->
    #show2Cfg {
    id = 19,
    groupid = 8,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "准备好了，迪艾勒小姐，请出题。"
    };
getRow(20)->
    #show2Cfg {
    id = 20,
    groupid = 8,
    npcid = 3001,
    emotion = 1,
    name = "迪艾勒",
    side = 1,
    content = "看见对面那个哭泣的女孩了吗？她叫苏珊，你需要去安抚她，让她不再哭泣。"
    };
getRow(21)->
    #show2Cfg {
    id = 21,
    groupid = 8,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1
    };
getRow(22)->
    #show2Cfg {
    id = 22,
    groupid = 10,
    taskname = "接近失败，只要大白",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "小女孩都喜欢萌萌哒的小动物，我施个小法术，苏珊一定会开心。"
    };
getRow(23)->
    #show2Cfg {
    id = 23,
    groupid = 11,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1,
    content = "呼~哈~，看这里，会变身的{小姐姐/小哥哥}来陪你玩…"
    };
getRow(24)->
    #show2Cfg {
    id = 24,
    groupid = 9,
    npcid = 3005,
    emotion = 1,
    name = "苏珊",
    side = 1,
    content = "（看了一眼，哭了起来~）呜呜，我好想大白，大白不在我晚上都一直哭，睡也睡不好，可是大白被红海龟坏蛋带走了，拜托你帮我找到大白好不好。"
    };
getRow(25)->
    #show2Cfg {
    id = 25,
    groupid = 9,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "答应我找到大白就不哭了好吗？哭鼻子的娃娃会被狼叼走的。"
    };
getRow(26)->
    #show2Cfg {
    id = 26,
    groupid = 9,
    npcid = 3005,
    emotion = 1,
    name = "苏珊",
    side = 1,
    content = "呜呜，有大白陪我，我就不哭。"
    };
getRow(27)->
    #show2Cfg {
    id = 27,
    groupid = 9,
    npcid = 3005,
    emotion = 1,
    name = "苏珊",
    side = 1
    };
getRow(28)->
    #show2Cfg {
    id = 28,
    groupid = 12,
    taskname = "寻找大白1",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "考试期间，这位伙伴你怎么还有闲心在这里赏花看风景。"
    };
getRow(29)->
    #show2Cfg {
    id = 29,
    groupid = 12,
    npcid = 1129,
    emotion = 1,
    name = "学霸托比",
    side = 1,
    content = "我早已完成考核，所以一身轻松。"
    };
getRow(30)->
    #show2Cfg {
    id = 30,
    groupid = 12,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "膜拜大佬，大佬可否传授些考核技巧？我正在寻找苏珊的玩偶大白。"
    };
getRow(31)->
    #show2Cfg {
    id = 31,
    groupid = 12,
    npcid = 1129,
    emotion = 1,
    name = "学霸托比",
    side = 1,
    content = "你这速度…才在第三关，唔~我送你一程吧，给你看看我的拉风坐骑。"
    };
getRow(32)->
    #show2Cfg {
    id = 32,
    groupid = 12,
    npcid = 1129,
    emotion = 1,
    name = "学霸托比",
    side = 1
    };
getRow(33)->
    #show2Cfg {
    id = 33,
    groupid = 13,
    taskname = "寻找大白2",
    npcid = 1129,
    emotion = 1,
    name = "学霸托比",
    side = 1,
    content = "你看这地面，他们一定在前面，这套路跟我考核时一模一样，能不能有点新意。"
    };
getRow(34)->
    #show2Cfg {
    id = 34,
    groupid = 14,
    taskname = "寻找大白2",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "看这足迹，带走大白的不止红海龟一个，我们赶紧追上去吧。"
    };
getRow(35)->
    #show2Cfg {
    id = 35,
    groupid = 14,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1
    };
getRow(36)->
    #show2Cfg {
    id = 36,
    groupid = 15,
    taskname = "寻找大白3",
    npcid = 1129,
    emotion = 1,
    name = "学霸托比",
    side = 1,
    content = "看前面，他们就在那儿，那红海龟冥顽不灵，听我的，撸起袖子直接干。"
    };
getRow(37)->
    #show2Cfg {
    id = 37,
    groupid = 16,
    npcid = 1129,
    emotion = 1,
    name = "学霸托比",
    side = 1,
    content = "你这身手还不错，大白找到了，赶紧给苏珊送过去吧。"
    };
getRow(38)->
    #show2Cfg {
    id = 38,
    groupid = 16,
    npcid = 1129,
    emotion = 1,
    name = "学霸托比",
    side = 1
    };
getRow(39)->
    #show2Cfg {
    id = 39,
    groupid = 18,
    taskname = "苏珊笑了",
    npcid = 3005,
    emotion = 1,
    name = "苏珊",
    side = 1,
    content = "哇，大白，我好想你，你有没有很想我。谢谢你帮我把大白带回来。"
    };
getRow(40)->
    #show2Cfg {
    id = 40,
    groupid = 18,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "看到你笑真好！"
    };
getRow(41)->
    #show2Cfg {
    id = 41,
    groupid = 18,
    npcid = 3001,
    emotion = 1,
    name = "迪艾勒",
    side = 1,
    content = "[fff000]【{PlayerName}】[-],恭喜你通过第二项考核，下面去找戴安娜进行下一项考核吧。"
    };
getRow(42)->
    #show2Cfg {
    id = 42,
    groupid = 18,
    npcid = 3001,
    emotion = 1,
    name = "迪艾勒",
    side = 1
    };
getRow(43)->
    #show2Cfg {
    id = 43,
    groupid = 20,
    taskname = "泥煤！这人品",
    npcid = 3006,
    emotion = 1,
    name = "戴安娜",
    side = 1,
    content = "成年考核，七分靠实力，三分靠运气，本项考核需要抽取一个目标，并在规定时间内击败它。"
    };
getRow(44)->
    #show2Cfg {
    id = 44,
    groupid = 20,
    npcid = 1129,
    emotion = 1,
    name = "学霸托比",
    side = 1,
    content = "没事，抽吧，里边一共就有2只高级魔物和1只顶级魔物，其他都是小虾米，只要避开那几只，随便抽一个，妥妥的~~，我的目标就是低级史莱姆。"
    };
getRow(45)->
    #show2Cfg {
    id = 45,
    groupid = 21,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1,
    content = "扎心了，我长这么大，都还没见过顶级魔物呢，现在不仅要找到它还要打败它，我的天！"
    };
getRow(46)->
    #show2Cfg {
    id = 46,
    groupid = 21,
    npcid = 3006,
    emotion = 1,
    name = "戴安娜",
    side = 1,
    content = "这只魔物是女神专门放进抽取系统的，只要找到女神就能找到这只魔物了，加油吧。"
    };
getRow(47)->
    #show2Cfg {
    id = 47,
    groupid = 21,
    npcid = 1129,
    emotion = 1,
    name = "学霸托比",
    side = 1,
    content = "大佬，你真厉害，这我实在没能力指点你了，先走一步，祝你好运。"
    };
getRow(48)->
    #show2Cfg {
    id = 48,
    groupid = 21,
    npcid = 3006,
    emotion = 1,
    name = "戴安娜",
    side = 1
    };
getRow(49)->
    #show2Cfg {
    id = 49,
    groupid = 22,
    taskname = "考核三：打败魔物",
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "神之勇士，我等你很久了，久到我已经快忘了我为何等你。"
    };
getRow(50)->
    #show2Cfg {
    id = 50,
    groupid = 22,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "（纳闷~不管啦）露娜女神，你看我还这么小，怎么能打败顶级魔物呢，可以换一个目标吗？我如果不能通过考核，就不能出去历练，外面的世界那么大，我想去看看。"
    };
getRow(51)->
    #show2Cfg {
    id = 51,
    groupid = 22,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "我相信你，你也要相信你自己，也许你自己还不知道你具备多么大的能力，必要的时候我会帮助你。"
    };
getRow(52)->
    #show2Cfg {
    id = 52,
    groupid = 23,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "天哪！我竟然胜利了，真是不可思议。"
    };
getRow(53)->
    #show2Cfg {
    id = 53,
    groupid = 23,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1
    };
getRow(54)->
    #show2Cfg {
    id = 54,
    groupid = 24,
    taskname = "欧耶，成功通过",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "露娜女神，谢谢你刚刚帮了我，不然我肯定回不来了。"
    };
getRow(55)->
    #show2Cfg {
    id = 55,
    groupid = 24,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "你错了，是你自己打败的魔龙克拉斯，我只是用了点灵力激发了你的潜能，不过经此一战，你体内的觉醒之力已经显露出来了。"
    };
getRow(56)->
    #show2Cfg {
    id = 56,
    groupid = 24,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "觉醒之力？那是什么？"
    };
getRow(57)->
    #show2Cfg {
    id = 57,
    groupid = 24,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "等你考核通过再来找我，我会告诉你。现在你还是先去找玛格丽特夫人进行下一项考核吧。"
    };
getRow(58)->
    #show2Cfg {
    id = 58,
    groupid = 24,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1
    };
getRow(59)->
    #show2Cfg {
    id = 59,
    groupid = 25,
    taskname = "考核五：契约骑宠",
    npcid = 1121,
    emotion = 1,
    name = "玛格丽特",
    side = 1,
    content = "蓝色大陆的骑宠就像知己，可遇不可求，这最后一项考核，需要与一只骑宠达成契约，让它自愿追随你。"
    };
getRow(60)->
    #show2Cfg {
    id = 60,
    groupid = 25,
    taskname = "考核五：契约骑宠",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "（思考ing…）可是阿克勒港口的骑宠应该都有主人了，我应该去哪儿寻找？"
    };
getRow(61)->
    #show2Cfg {
    id = 61,
    groupid = 25,
    taskname = "考核五：契约骑宠",
    npcid = 1121,
    emotion = 1,
    name = "玛格丽特",
    side = 1,
    content = "考核组有放出10只骑宠在隐蔽的地方，入口可能在树林可能在船上也有可能在河边，你需要耐心寻找…"
    };
getRow(62)->
    #show2Cfg {
    id = 62,
    groupid = 25,
    taskname = "考核五：契约骑宠",
    npcid = 1121,
    emotion = 1,
    name = "玛格丽特",
    side = 1
    };
getRow(63)->
    #show2Cfg {
    id = 63,
    groupid = 26,
    taskname = "探查树林",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "入口会不会在这片树林？去看看…"
    };
getRow(64)->
    #show2Cfg {
    id = 64,
    groupid = 27,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "(感觉一道黑影掠过。)什么人？…"
    };
getRow(65)->
    #show2Cfg {
    id = 65,
    groupid = 27,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1
    };
getRow(66)->
    #show2Cfg {
    id = 66,
    groupid = 28,
    taskname = "安娜被绑架",
    npcid = 1122,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "谢谢你救了我。"
    };
getRow(67)->
    #show2Cfg {
    id = 67,
    groupid = 28,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "大家都是朋友，当然要互相帮助。"
    };
getRow(68)->
    #show2Cfg {
    id = 68,
    groupid = 28,
    npcid = 1122,
    emotion = 1,
    name = "安娜",
    side = 1
    };
getRow(69)->
    #show2Cfg {
    id = 69,
    groupid = 30,
    taskname = "打探目标",
    npcid = 1107,
    emotion = 1,
    name = "炸弹头头",
    side = 1,
    content = "大侠饶命，我们只是听命行事，是我们老大派我们来打探你的消息的。"
    };
getRow(70)->
    #show2Cfg {
    id = 70,
    groupid = 30,
    npcid = 1122,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "你们老大是谁？他找[fff000]【{PlayerName}】[-]干什么。"
    };
getRow(71)->
    #show2Cfg {
    id = 71,
    groupid = 30,
    npcid = 1107,
    emotion = 1,
    name = "炸弹头头",
    side = 1,
    content = "我们老大是魔族罗撒特，老大只是想见见你，没别的意思。"
    };
getRow(72)->
    #show2Cfg {
    id = 72,
    groupid = 30,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "真是不怀好意的约见啊，趁我没改变主意之前赶紧走吧，别让我再见到你们。"
    };
getRow(73)->
    #show2Cfg {
    id = 73,
    groupid = 30,
    npcid = 1107,
    emotion = 1,
    name = "炸弹头头",
    side = 1,
    content = "多谢大侠饶命。"
    };
getRow(74)->
    #show2Cfg {
    id = 74,
    groupid = 30,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1
    };
getRow(75)->
    #show2Cfg {
    id = 75,
    groupid = 32,
    taskname = "与安娜结盟",
    npcid = 1122,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "罗撒特？听父亲说原本是这附近海域的海盗，后来臣服魔族成为魔族的高级魔物，是个十恶不赦的家伙。"
    };
getRow(76)->
    #show2Cfg {
    id = 76,
    groupid = 32,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "原来如此，只是他为什么要找我呢？"
    };
getRow(77)->
    #show2Cfg {
    id = 77,
    groupid = 32,
    npcid = 1122,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "肯定没好事，你要小心些，我这边有些时装碎片，你去猫绅士那儿选件时装穿上吧，别让罗撒特找到你。"
    };
getRow(78)->
    #show2Cfg {
    id = 78,
    groupid = 32,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1,
    content = "谢谢你，我这就去找猫绅士。"
    };
getRow(79)->
    #show2Cfg {
    id = 79,
    groupid = 32,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1
    };
getRow(80)->
    #show2Cfg {
    id = 80,
    groupid = 34,
    taskname = "一直变身不是办法",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "猫绅士，最近有新货吗？给我推荐一个好看又划算的吧。"
    };
getRow(81)->
    #show2Cfg {
    id = 81,
    groupid = 34,
    npcid = 3002,
    emotion = 1,
    name = "喵绅士",
    side = 1,
    content = "没问题，先试试这件吧。"
    };
getRow(82)->
    #show2Cfg {
    id = 82,
    groupid = 35,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1,
    content = "这个…还有其他吗？"
    };
getRow(83)->
    #show2Cfg {
    id = 83,
    groupid = 35,
    npcid = 3002,
    emotion = 1,
    name = "喵绅士",
    side = 1,
    content = "我推荐的这个不喜欢？那去店铺里边选吧，明码标价，尺码齐全。"
    };
getRow(84)->
    #show2Cfg {
    id = 84,
    groupid = 35,
    npcid = 3002,
    emotion = 1,
    name = "喵绅士",
    side = 1
    };
getRow(85)->
    #show2Cfg {
    id = 85,
    groupid = 36,
    taskname = "打听消息",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "猫绅士，我正在寻找骑宠的神秘入口，你知道些消息吗？"
    };
getRow(86)->
    #show2Cfg {
    id = 86,
    groupid = 36,
    npcid = 3002,
    emotion = 1,
    name = "喵绅士",
    side = 1,
    content = "神秘入口我不知道，不过别忘了夏普雷班船长，他长年出海，对于神秘的地方他再熟悉不过了。"
    };
getRow(87)->
    #show2Cfg {
    id = 87,
    groupid = 36,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "对呀，我怎么把船长给忘了呢，谢谢提醒。"
    };
getRow(88)->
    #show2Cfg {
    id = 88,
    groupid = 36,
    npcid = 3002,
    emotion = 1,
    name = "喵绅士",
    side = 1
    };
getRow(89)->
    #show2Cfg {
    id = 89,
    groupid = 37,
    taskname = "得知骑宠信息",
    npcid = 3004,
    emotion = 1,
    name = "夏普雷班",
    side = 1,
    content = "咦，生面孔，找我有什么事？"
    };
getRow(90)->
    #show2Cfg {
    id = 90,
    groupid = 37,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "我想问问这附近有神秘的地方吗？骑宠喜欢的地方？"
    };
getRow(91)->
    #show2Cfg {
    id = 91,
    groupid = 37,
    npcid = 3004,
    emotion = 1,
    name = "夏普雷班",
    side = 1,
    content = "哈哈，你是在考核的对吧，只能给你一个提示[fff000](说它是辆车，可它不是车，风儿一吹来，脑袋转圈圈。)[-]"
    };
getRow(92)->
    #show2Cfg {
    id = 92,
    groupid = 37,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "（思考中…）我明白了。"
    };
getRow(93)->
    #show2Cfg {
    id = 93,
    groupid = 37,
    npcid = 3004,
    emotion = 1,
    name = "夏普雷班",
    side = 1
    };
getRow(94)->
    #show2Cfg {
    id = 94,
    groupid = 38,
    taskname = "发现入口",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "这神秘的入口果然在这里。"
    };
getRow(95)->
    #show2Cfg {
    id = 95,
    groupid = 40,
    taskname = "获得骑宠",
    npcid = 3000,
    emotion = 1,
    name = "派诺",
    side = 1,
    content = "欢迎来到兽息之地，这里有很多的骑宠，不过只有一只是没有主人的，找到它，你就有机会获得。"
    };
getRow(96)->
    #show2Cfg {
    id = 96,
    groupid = 41,
    npcid = 3000,
    emotion = 1,
    name = "派诺",
    side = 1,
    content = "恭喜你获得了骑宠【飞行萝卜】，不过这个地方进来容易出去难，出口有灵兽镇守，你可要小心。"
    };
getRow(97)->
    #show2Cfg {
    id = 97,
    groupid = 42,
    taskname = "安娜不见了",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "小萝卜头，从现在开始我就是你的主人了，今后我带你装逼你带我飞。啊哈哈哈~"
    };
getRow(98)->
    #show2Cfg {
    id = 98,
    groupid = 42,
    npcid = 1123,
    emotion = 1,
    name = "小萝卜头",
    side = 1,
    content = "什么小萝卜头，人家有名字的，我叫[fff000]“克里斯提安.拉卡亚.荒野精灵”[-]耶…"
    };
getRow(99)->
    #show2Cfg {
    id = 99,
    groupid = 42,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "小萝卜头，我们现在去哪里？"
    };
getRow(100)->
    #show2Cfg {
    id = 100,
    groupid = 42,
    npcid = 1123,
    emotion = 1,
    name = "小萝卜头",
    side = 1,
    content = "是“[fff000]荒野精灵[-]”，算了…"
    };
getRow(101)->
    #show2Cfg {
    id = 101,
    groupid = 42,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1
    };
getRow(102)->
    #show2Cfg {
    id = 102,
    groupid = 44,
    taskname = "收到考核组通知",
    npcid = 3009,
    emotion = 1,
    name = "考核组",
    side = 1,
    content = "[fff000]通知：【{PlayerName}】，恭喜您成功通过考核，成为蓝色大陆守护者中的一员，稍后派诺考核官将为您颁发成年礼物[-]"
    };
getRow(103)->
    #show2Cfg {
    id = 103,
    groupid = 44,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "欧耶，终于通过了。"
    };
getRow(104)->
    #show2Cfg {
    id = 104,
    groupid = 44,
    npcid = 3009,
    emotion = 1,
    name = "考核组",
    side = 1
    };
getRow(105)->
    #show2Cfg {
    id = 105,
    groupid = 46,
    taskname = "获得成年礼物",
    npcid = 3000,
    emotion = 1,
    name = "派诺",
    side = 1,
    content = "恭喜你通过考核，从现在开始，你就正式成年，要以保卫大陆和平为己任，可否明白？"
    };
getRow(106)->
    #show2Cfg {
    id = 106,
    groupid = 46,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "明白，我一定做到。"
    };
getRow(107)->
    #show2Cfg {
    id = 107,
    groupid = 46,
    npcid = 3000,
    emotion = 1,
    name = "派诺",
    side = 1,
    content = "现在你可以领取成年礼物，分别是：蓝色品质武器一件和珍稀材料若干，领取后找到札克，他会告诉你材料怎么用。"
    };
getRow(108)->
    #show2Cfg {
    id = 108,
    groupid = 46,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1
    };
getRow(109)->
    #show2Cfg {
    id = 109,
    groupid = 48,
    taskname = "捡到的真是宝贝",
    npcid = 3008,
    emotion = 1,
    name = "铁匠札克",
    side = 1,
    content = "打铁要趁热，让我看看你的武器和材料"
    };
getRow(110)->
    #show2Cfg {
    id = 110,
    groupid = 49,
    npcid = 3008,
    emotion = 1,
    name = "铁匠札克",
    side = 1,
    content = "你这武器虽不是极品，但品质还是不错的，现在我就教你怎么用这精炼石精炼武器，看好了。"
    };
getRow(111)->
    #show2Cfg {
    id = 111,
    groupid = 49,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1
    };
getRow(112)->
    #show2Cfg {
    id = 112,
    groupid = 50,
    taskname = "安娜出现商量对策",
    npcid = 1122,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "[fff000]【{PlayerName}】[-]，我已经了解清楚了，罗撒特是来抓你的，魔族正在寻找一个神秘物品的下落，他们认为你知道那个东西的下落。"
    };
getRow(113)->
    #show2Cfg {
    id = 113,
    groupid = 50,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "我去，啥玩意儿，我根本不知道他们找的是什么。"
    };
getRow(114)->
    #show2Cfg {
    id = 114,
    groupid = 50,
    npcid = 1109,
    emotion = 1,
    name = "风暴恶魔",
    side = 1,
    content = "哈哈，找到了。"
    };
getRow(115)->
    #show2Cfg {
    id = 115,
    groupid = 50,
    npcid = 1122,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "可恶，竟然跟踪我，[fff000]【{PlayerName}】[-]，你快走。"
    };
getRow(116)->
    #show2Cfg {
    id = 116,
    groupid = 50,
    npcid = 1122,
    emotion = 1,
    name = "安娜",
    side = 1
    };
getRow(117)->
    #show2Cfg {
    id = 117,
    groupid = 53,
    taskname = "击败罗撒特",
    npcid = 1104,
    emotion = 1,
    name = "罗撒特",
    side = 1,
    content = "跑得掉吗？小鬼，快告诉我漂浮之石在什么地方？"
    };
getRow(118)->
    #show2Cfg {
    id = 118,
    groupid = 53,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "漂什么？大爷，我是真的不知道啊。"
    };
getRow(119)->
    #show2Cfg {
    id = 119,
    groupid = 53,
    npcid = 1104,
    emotion = 1,
    name = "罗撒特",
    side = 1,
    content = "别装蒜，你体内有觉醒之力，女神还助你突破，你就是女神要找的人，怎么可能不知道漂浮之石的下落，来人，给我绑了带走。"
    };
getRow(120)->
    #show2Cfg {
    id = 120,
    groupid = 53,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "有话好好说嘛，干嘛动手呀，可恶。"
    };
getRow(126)->
    #show2Cfg {
    id = 126,
    groupid = 56,
    taskname = "蓝色大陆的危机",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "刚刚魔族罗撒特说您告诉了我漂浮之石的下落，这是怎么回事呢？"
    };
getRow(127)->
    #show2Cfg {
    id = 127,
    groupid = 56,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "之前本想告诉你的，你也感觉到了魔族的行动，千百年前，魔王作乱，灵魂被封印，如今阿尔赛德已经重生，恐怕会对蓝色大陆展开报复。"
    };
getRow(128)->
    #show2Cfg {
    id = 128,
    groupid = 56,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "那要怎么才能阻止他们呢？"
    };
getRow(129)->
    #show2Cfg {
    id = 129,
    groupid = 56,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "如今的我灵力衰减，已无力再次封印，需要借助漂浮之石的能量，而你身怀觉醒之力转世，只有你才能帮我找到漂浮之石，为蓝色大陆免去一场灾难。"
    };
getRow(130)->
    #show2Cfg {
    id = 130,
    groupid = 56,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "原来如此，我一定找到漂浮之石，不让魔王有袭击蓝色大陆的机会，只是我应该去哪儿寻找？"
    };
getRow(131)->
    #show2Cfg {
    id = 131,
    groupid = 56,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "漂浮之石流落四方，任何地方都有可能，但阿克勒城人群聚集，可能有它的消息。"
    };
getRow(132)->
    #show2Cfg {
    id = 132,
    groupid = 56,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1
    };
getRow(133)->
    #show2Cfg {
    id = 133,
    groupid = 58,
    taskname = "携伴同行",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "历练之路，艰辛无比，寻找志同道合的人携伴而行，会事半功倍哦。"
    };
getRow(134)->
    #show2Cfg {
    id = 134,
    groupid = 58,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1
    };
getRow(135)->
    #show2Cfg {
    id = 135,
    groupid = 60,
    taskname = "告别安娜",
    npcid = 1122,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "听说你要离开港口，去阿克勒城了，我们以后还会再见面吗？"
    };
getRow(136)->
    #show2Cfg {
    id = 136,
    groupid = 60,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "嗯，一定还会再见的，我会回来看望你。"
    };
getRow(137)->
    #show2Cfg {
    id = 137,
    groupid = 60,
    npcid = 1122,
    emotion = 1,
    name = "安娜",
    side = 1,
    content = "我会努力通过考核的，你也要加油，再见。"
    };
getRow(138)->
    #show2Cfg {
    id = 138,
    groupid = 60,
    npcid = 1122,
    emotion = 1,
    name = "安娜",
    side = 1
    };
getRow(139)->
    #show2Cfg {
    id = 139,
    groupid = 61,
    taskname = "觉醒之力副本",
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "这就是魔龙克拉斯，他被关押多时，怒气颇深，你可要小心。"
    };
getRow(140)->
    #show2Cfg {
    id = 140,
    groupid = 62,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "这是？"
    };
getRow(141)->
    #show2Cfg {
    id = 141,
    groupid = 62,
    npcid = 3003,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "我以我微弱之灵力助你激发体内潜能，现在去战斗吧。"
    };
getRow(400)->
    #show2Cfg {
    id = 400,
    groupid = 200,
    taskname = "加强觉醒之力",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "坐了半天的船，丽莎感觉头有点晕（︵θ︵θ︵），团长，你感觉怎么样呢？体内的觉醒之力掌握了吗？"
    };
getRow(401)->
    #show2Cfg {
    id = 401,
    groupid = 200,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "哈哈，我感觉现在已经完全掌握了觉醒之力的奥秘，可以自由运用了，丽莎，让我给你展示展示…"
    };
getRow(402)->
    #show2Cfg {
    id = 402,
    groupid = 200,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "团长大大，我们初来乍到就在东城郊动手，不太好吧！我听说有个地方叫[00ff00]【混沌灵界】[-]，在那里器灵可以幻化成实体，陪它们切磋不仅可以体验自己的觉醒之力，还能得到珍贵的[00ff00]【魔力晶体】[-]呢。"
    };
getRow(403)->
    #show2Cfg {
    id = 403,
    groupid = 200,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "也对！是有些不太好，嘿嘿…我太激动了，不过[00ff00]【魔力晶体】[-]是什么？可以吃的吗？"
    };
getRow(404)->
    #show2Cfg {
    id = 404,
    groupid = 200,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "笨蛋团长，这个可以吃，不过可不是给你吃的呢，是给你体内守护觉醒之力的小器灵吃的…呵呵哈~~"
    };
getRow(405)->
    #show2Cfg {
    id = 405,
    groupid = 200,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "那我们赶紧出发吧！…呵呵哈~~丽莎，快告诉我怎么去[00ff00]【混沌灵界】[-]…"
    };
getRow(406)->
    #show2Cfg {
    id = 406,
    groupid = 200,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(407)->
    #show2Cfg {
    id = 407,
    groupid = 202,
    taskname = "进城有些难",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "嚯哈~我们的降魔保卫团离目标又进了一步。丽莎，现在我们赶紧进城吧…"
    };
getRow(408)->
    #show2Cfg {
    id = 408,
    groupid = 202,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "咦~前边有告示牌有内容，先去看看吧"
    };
getRow(409)->
    #show2Cfg {
    id = 409,
    groupid = 203,
    npcid = 11000,
    emotion = 1,
    name = "告示牌",
    side = 1,
    content = "通知：近日城内灵兽频繁失踪，城主已将此次事件立案为[00ff00]“灵踪”[-]，在[00ff00]“灵踪”事件[-]未查明之前阿克勒城进行封城处理，无通行证者不得进出，凡提供[00ff00]“灵踪”事件[-]重要线索者重重有赏。"
    };
getRow(410)->
    #show2Cfg {
    id = 410,
    groupid = 203,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "团长，怎么办？封城了，我们要怎么进城呢？"
    };
getRow(411)->
    #show2Cfg {
    id = 411,
    groupid = 203,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "(⊙v⊙)嗯，让我想想…我们先了解了解具体情况再做打算吧。"
    };
getRow(412)->
    #show2Cfg {
    id = 412,
    groupid = 203,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(413)->
    #show2Cfg {
    id = 413,
    groupid = 204,
    taskname = "安迪的猜测",
    npcid = 3032,
    emotion = 1,
    name = "安迪",
    side = 1,
    content = "这个美丽的小精灵，你可要小心些，最近有坏人专门掳走灵兽"
    };
getRow(414)->
    #show2Cfg {
    id = 414,
    groupid = 204,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "原来你知道[00ff00]“灵踪”案件[-]，不过丽莎可不是灵兽，丽莎是女神灵体幻化而成。"
    };
getRow(415)->
    #show2Cfg {
    id = 415,
    groupid = 204,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "那你知道他们都是怎么被掳走的吗？"
    };
getRow(416)->
    #show2Cfg {
    id = 416,
    groupid = 204,
    npcid = 3032,
    emotion = 1,
    name = "安迪",
    side = 1,
    content = "我只听说那些失踪的灵兽在失踪前会莫名失常或发狂，然后便离奇消失，有人猜测是魔族所为，因为传闻魔族有位女子擅长迷魂术，身中此术的人会不受控制，然后听施术人的吩咐。"
    };
getRow(417)->
    #show2Cfg {
    id = 417,
    groupid = 204,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "原来是这样…"
    };
getRow(418)->
    #show2Cfg {
    id = 418,
    groupid = 204,
    npcid = 11001,
    emotion = 1,
    name = "灵蟹海甲",
    side = 1,
    content = "要说[00ff00]“灵踪”案件[-]，我们灵兽界的消息更准确…"
    };
getRow(419)->
    #show2Cfg {
    id = 419,
    groupid = 204,
    npcid = 3032,
    emotion = 1,
    name = "安迪",
    side = 1
    };
getRow(420)->
    #show2Cfg {
    id = 420,
    groupid = 206,
    taskname = "螃蟹的争论",
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "难道[00ff00]“灵踪”案件[-]另有凶手吗？"
    };
getRow(421)->
    #show2Cfg {
    id = 421,
    groupid = 206,
    npcid = 11001,
    emotion = 1,
    name = "灵蟹海甲",
    side = 1,
    content = "据灵兽界的消息，魔族的[fff000]吉娜[-]虽擅长迷魂术，但她每施法一次对自身的魔力消耗极大，不太可能是她。"
    };
getRow(422)->
    #show2Cfg {
    id = 422,
    groupid = 206,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "唔~这件事现在不好妄下定论。不过你们灵兽界消息灵通，我想请教你一件事。"
    };
getRow(423)->
    #show2Cfg {
    id = 423,
    groupid = 206,
    npcid = 11001,
    emotion = 1,
    name = "灵蟹海甲",
    side = 1,
    content = "好说好说…"
    };
getRow(424)->
    #show2Cfg {
    id = 424,
    groupid = 206,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "我们想进城，你知道有什么办法可以拿到通行证吗？"
    };
getRow(425)->
    #show2Cfg {
    id = 425,
    groupid = 206,
    npcid = 11001,
    emotion = 1,
    name = "灵蟹海甲",
    side = 1,
    content = "这个这个…有倒是有…不过…哎，还是告诉你吧。前边树林边有一位[fff000]商人杰斯[-]，他可能有办法，不过和商人交易是要付出一定代价的。"
    };
getRow(426)->
    #show2Cfg {
    id = 426,
    groupid = 206,
    npcid = 11001,
    emotion = 1,
    name = "灵蟹海甲",
    side = 1
    };
getRow(427)->
    #show2Cfg {
    id = 427,
    groupid = 208,
    taskname = "消息灵通的杰斯",
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "美丽的丽莎小姐，有什么我可以帮你吗？"
    };
getRow(428)->
    #show2Cfg {
    id = 428,
    groupid = 208,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "咦~你怎么知道我的名字呢！…"
    };
getRow(429)->
    #show2Cfg {
    id = 429,
    groupid = 208,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "哈哈哈…身为商人，消息不灵通可不行，我还知道你们来找我是想要[00ff00]通行证[-]进城，对吧？"
    };
getRow(430)->
    #show2Cfg {
    id = 430,
    groupid = 208,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "真是神奇，[fff000]杰斯[-]，那你知道怎么样才能获得通行证吗？"
    };
getRow(431)->
    #show2Cfg {
    id = 431,
    groupid = 208,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "我当然知道，也很乐意帮助你们进城，不过我想请美丽的丽莎小姐帮我送封信给对面的[fff000]琳达小姐[-]，她是我心仪的女子，我想约她共进晚餐"
    };
getRow(432)->
    #show2Cfg {
    id = 432,
    groupid = 208,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "啾咪~丽莎最愿意成人之美了。"
    };
getRow(433)->
    #show2Cfg {
    id = 433,
    groupid = 209,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1
    };
getRow(434)->
    #show2Cfg {
    id = 434,
    groupid = 210,
    taskname = "驯服发狂的野兽",
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "团长，前边的那只小猪是一只灵兽，看起来它好像遇难了，我们救救它吧。"
    };
getRow(435)->
    #show2Cfg {
    id = 435,
    groupid = 211,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "小灵兽，没事了，你赶紧回家吧，现在[00ff00]“灵踪”案件[-]还没结论，别到处乱跑额…"
    };
getRow(436)->
    #show2Cfg {
    id = 436,
    groupid = 211,
    npcid = 3053,
    emotion = 1,
    name = "小猪嘟嘟",
    side = 1
    };
getRow(437)->
    #show2Cfg {
    id = 437,
    groupid = 212,
    taskname = "嘟嘟加入队伍",
    npcid = 3053,
    emotion = 1,
    name = "小猪嘟嘟",
    side = 1,
    content = "主人～主人～"
    };
getRow(438)->
    #show2Cfg {
    id = 438,
    groupid = 212,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "[2becf8]（O__O\"）[-] …………这个…………这个…………"
    };
getRow(439)->
    #show2Cfg {
    id = 439,
    groupid = 212,
    npcid = 3053,
    emotion = 1,
    name = "小猪嘟嘟",
    side = 1,
    content = "主人，[fff000]嘟嘟[-]是来自精灵族的一只灵兽，我们灵兽一旦选定主人就会一直跟着他了，忠心相伴，主人，你可不能不要我啊…"
    };
getRow(440)->
    #show2Cfg {
    id = 440,
    groupid = 212,
    npcid = 3053,
    emotion = 1,
    name = "小猪嘟嘟",
    side = 1,
    content = "主人，[fff000]嘟嘟[-]不仅可以陪你聊天，还会很多的特技，可以攻击敌人可以供主人你骑乘，如果有高品质的骑宠，嘟嘟也可以助阵为主人增加属性额…"
    };
getRow(441)->
    #show2Cfg {
    id = 441,
    groupid = 212,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "好呀，[fff000]嘟嘟[-]加入的话我就可以当副团长了。呼哈～慢半拍团长，让我来给你说明一下怎么将灵兽嘟嘟加入我们保卫团吧～"
    };
getRow(442)->
    #show2Cfg {
    id = 442,
    groupid = 212,
    npcid = 3053,
    emotion = 1,
    name = "小猪嘟嘟",
    side = 1,
    content = "[00ff00]（转圈圈）[-]欧耶～主人，赶快将[fff000]嘟嘟[-]加入保卫团设置[00ff00]【出站】[-]吧…"
    };
getRow(443)->
    #show2Cfg {
    id = 443,
    groupid = 212,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "你们两个…"
    };
getRow(444)->
    #show2Cfg {
    id = 444,
    groupid = 212,
    npcid = 3053,
    emotion = 1,
    name = "小猪嘟嘟",
    side = 1
    };
getRow(445)->
    #show2Cfg {
    id = 445,
    groupid = 214,
    taskname = "原来是灵兽",
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "[fff000]琳达小姐[-]，你好，我…"
    };
getRow(446)->
    #show2Cfg {
    id = 446,
    groupid = 214,
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1,
    content = "咦，这只坐骑，我没看错的话应该是灵兽吧，传闻灵兽的基础属性比一般驯服后的野兽要高，不如让它和我的[fff000]灵兽诺拉[-]比试一场吧…"
    };
getRow(447)->
    #show2Cfg {
    id = 447,
    groupid = 214,
    npcid = 11009,
    emotion = 1,
    name = "小猪嘟嘟",
    side = 2,
    content = "天外有天，兽外有兽，嘟嘟还是第一次和其他灵兽比试…主人，嘟嘟去了"
    };
getRow(448)->
    #show2Cfg {
    id = 448,
    groupid = 214,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "可是…我们是来…"
    };
getRow(449)->
    #show2Cfg {
    id = 449,
    groupid = 215,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "还真是一言不合就开打呢…"
    };
getRow(450)->
    #show2Cfg {
    id = 450,
    groupid = 215,
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1
    };
getRow(451)->
    #show2Cfg {
    id = 451,
    groupid = 216,
    taskname = "琳达的馈赠",
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1,
    content = "虽然你没有战胜[fff000]诺拉[-]，不过以你现在初级星级的水平可以对抗这么长时间也很厉害了，主要你努力提升星级，一定会更厉害的。"
    };
getRow(452)->
    #show2Cfg {
    id = 452,
    groupid = 216,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "星级？…提升星级之后嘟嘟就会更强大吗？"
    };
getRow(453)->
    #show2Cfg {
    id = 453,
    groupid = 216,
    npcid = 11009,
    emotion = 1,
    name = "小猪嘟嘟",
    side = 2,
    content = "嗷呜…吼吼…"
    };
getRow(454)->
    #show2Cfg {
    id = 454,
    groupid = 216,
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1,
    content = "骑宠刚跟随主人都只有1星，需要使用[00ff00]“兽灵精华”[-]喂食骑宠，骑宠才会成长进行提升星级，我这里还有些多余的精华，看我们投缘，就送你一些，去那边帮我拿过来吧。"
    };
getRow(455)->
    #show2Cfg {
    id = 455,
    groupid = 217,
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1,
    content = "现在你可以喂给嘟嘟了…"
    };
getRow(456)->
    #show2Cfg {
    id = 456,
    groupid = 217,
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1
    };
getRow(457)->
    #show2Cfg {
    id = 457,
    groupid = 218,
    taskname = "琳达读信",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "哎呀，丽莎，差点忘了正事啦…我们是来送信的…"
    };
getRow(458)->
    #show2Cfg {
    id = 458,
    groupid = 218,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "呼呼～聊得太开心，我都忘了…嘿嘿…[fff000]琳达小姐[-]，对面的[fff000]杰斯先生[-]拜托我将这封信交给你…"
    };
getRow(459)->
    #show2Cfg {
    id = 459,
    groupid = 219,
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1,
    content = "[fff000]（琳达查看信后，撕掉了…)[-]"
    };
getRow(460)->
    #show2Cfg {
    id = 460,
    groupid = 219,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "这……你……"
    };
getRow(461)->
    #show2Cfg {
    id = 461,
    groupid = 219,
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1,
    content = "杰斯这个卑鄙的商人，我早已心有所属，但他却屡次骚扰我，现在他自己骚扰不成还骗取你们来帮助他"
    };
getRow(462)->
    #show2Cfg {
    id = 462,
    groupid = 219,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "这个…是不是有什么误会啊。"
    };
getRow(463)->
    #show2Cfg {
    id = 463,
    groupid = 219,
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1,
    content = "你们可不要被杰斯绅士的表象给欺骗了，反正他的邀请我是肯定不会去的。"
    };
getRow(464)->
    #show2Cfg {
    id = 464,
    groupid = 219,
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1
    };
getRow(465)->
    #show2Cfg {
    id = 465,
    groupid = 220,
    taskname = "再得【兽灵精华】",
    npcid = 11009,
    emotion = 1,
    name = "小猪嘟嘟",
    side = 2,
    content = "呼呼呼～～啊…啊…嚏…"
    };
getRow(466)->
    #show2Cfg {
    id = 466,
    groupid = 220,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "你这只小灵兽很是可爱，不如去我家里玩耍几天怎么样？我家里有很多你喜欢吃的精华额…"
    };
getRow(467)->
    #show2Cfg {
    id = 467,
    groupid = 220,
    npcid = 11009,
    emotion = 1,
    name = "小猪嘟嘟",
    side = 2,
    content = "嗯…你说的精华是吃了可以升星变强大的[00ff00]“兽灵精华”[-]吗？不行…我要陪主人一起冒险打败魔族，拯救万物，不能去你家玩耍了……"
    };
getRow(468)->
    #show2Cfg {
    id = 468,
    groupid = 220,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "虽然你不能去我家玩耍，不过精华还是赠送给你，欢迎你和你主人还有美丽的丽莎小姐一起来玩耍…"
    };
getRow(469)->
    #show2Cfg {
    id = 469,
    groupid = 221,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "唔…杰斯先生，你真是个好人…对不起，我没有帮到你…"
    };
getRow(470)->
    #show2Cfg {
    id = 470,
    groupid = 221,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "没关系，这样的回复我已经预料了，此事说来话长…"
    };
getRow(471)->
    #show2Cfg {
    id = 471,
    groupid = 221,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1
    };
getRow(472)->
    #show2Cfg {
    id = 472,
    groupid = 222,
    taskname = "伊凡很坏？",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "真的是你知道[fff000]琳达[-]已经订婚还一直骚扰她的吗？如果是这样，我绝对不会饶了你…"
    };
getRow(473)->
    #show2Cfg {
    id = 473,
    groupid = 222,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "其实最初我和[fff000]琳达[-]两情相悦，我们已经定下生死相随的誓言，可是…后来…东城郊来了一批魔族，那个魔族的[fff000]伊凡[-]，他…"
    };
getRow(474)->
    #show2Cfg {
    id = 474,
    groupid = 222,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "难道是琳达变心喜欢上他了？"
    };
getRow(475)->
    #show2Cfg {
    id = 475,
    groupid = 222,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "不是，那个伊凡使用各种手段蛊惑琳达，破坏我们之间的感情，所以…前几天他还带领魔族抢走了我的宝箱，宝箱里有我珍贵的宝物…"
    };
getRow(476)->
    #show2Cfg {
    id = 476,
    groupid = 222,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "原来是有魔族在作怪，就让我去会会他…"
    };
getRow(477)->
    #show2Cfg {
    id = 477,
    groupid = 222,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "你们前去可要小心，他们居住在树林深处，你若能制服他，取回我的宝箱，我愿意将通行证赠送给你们…"
    };
getRow(478)->
    #show2Cfg {
    id = 478,
    groupid = 222,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1
    };
getRow(479)->
    #show2Cfg {
    id = 479,
    groupid = 224,
    taskname = "巡逻兵的阻拦",
    npcid = 11002,
    emotion = 1,
    name = "魔族巡逻兵",
    side = 1,
    content = "站住，来者何人…前边是我们魔族的生活区，闲人免进…"
    };
getRow(480)->
    #show2Cfg {
    id = 480,
    groupid = 224,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "还真是猖狂呢？我找的就是你们魔族"
    };
getRow(481)->
    #show2Cfg {
    id = 481,
    groupid = 225,
    npcid = 11002,
    emotion = 1,
    name = "魔族巡逻兵",
    side = 1
    };
getRow(482)->
    #show2Cfg {
    id = 482,
    groupid = 226,
    taskname = "宝箱近在眼前",
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "团长，你看，前边那应该就是宝箱了，看来要拿到宝箱，得先消灭这群看守守卫"
    };
getRow(483)->
    #show2Cfg {
    id = 483,
    groupid = 226,
    npcid = 11003,
    emotion = 1,
    name = "宝箱守卫",
    side = 1,
    content = "啊…有人闯入…"
    };
getRow(484)->
    #show2Cfg {
    id = 484,
    groupid = 227,
    npcid = 11003,
    emotion = 1,
    name = "宝箱守卫",
    side = 1,
    content = "你们几个…赶紧去通知族内长老和首领，有人闯入。"
    };
getRow(485)->
    #show2Cfg {
    id = 485,
    groupid = 227,
    npcid = 11010,
    emotion = 1,
    name = "宝箱守卫",
    side = 2,
    content = "遵命。"
    };
getRow(486)->
    #show2Cfg {
    id = 486,
    groupid = 227,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1
    };
getRow(487)->
    #show2Cfg {
    id = 487,
    groupid = 228,
    taskname = "深入魔族取宝箱",
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "那里的宝箱应该就是[fff000]杰斯的宝箱[-]了吧？只是有好几个，哪一个才是呢？"
    };
getRow(488)->
    #show2Cfg {
    id = 488,
    groupid = 228,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "管它呢？先全部带回去…"
    };
getRow(489)->
    #show2Cfg {
    id = 489,
    groupid = 229,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "好了，咱们走吧"
    };
getRow(490)->
    #show2Cfg {
    id = 490,
    groupid = 229,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2
    };
getRow(491)->
    #show2Cfg {
    id = 491,
    groupid = 230,
    taskname = "伊凡阻拦",
    npcid = 3039,
    emotion = 1,
    name = "伊凡",
    side = 1,
    content = "你们这群强盗，抢了东西就想走，哪有那么容易"
    };
getRow(492)->
    #show2Cfg {
    id = 492,
    groupid = 230,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "说谁是强盗呢！…这箱子也是你抢来的吧…"
    };
getRow(493)->
    #show2Cfg {
    id = 493,
    groupid = 230,
    npcid = 3039,
    emotion = 1,
    name = "伊凡",
    side = 1,
    content = "不仅抢别人东西还泼脏水，看来得用实力说话了…"
    };
getRow(494)->
    #show2Cfg {
    id = 494,
    groupid = 231,
    npcid = 3039,
    emotion = 1,
    name = "伊凡",
    side = 1,
    content = "虽然我打不过你，但你这么好的身手去做强盗真是可惜了…"
    };
getRow(495)->
    #show2Cfg {
    id = 495,
    groupid = 231,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "都说了我们不是强盗了…这怎么回事呢!…"
    };
getRow(496)->
    #show2Cfg {
    id = 496,
    groupid = 231,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1,
    content = "看来只有回去问问杰斯了"
    };
getRow(497)->
    #show2Cfg {
    id = 497,
    groupid = 231,
    npcid = 3039,
    emotion = 1,
    name = "伊凡",
    side = 1
    };
getRow(498)->
    #show2Cfg {
    id = 498,
    groupid = 232,
    taskname = "杰斯的说辞",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "[fff000]杰斯[-]，你看看这是你的箱子吗？"
    };
getRow(499)->
    #show2Cfg {
    id = 499,
    groupid = 232,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "正是，非常感谢你们帮我拿出我的宝物，这个是入城的[00ff00]通行证[-]，给…"
    };
getRow(500)->
    #show2Cfg {
    id = 500,
    groupid = 233,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "谢谢你。不过我们取箱子遇到一个奇怪的事，那个[fff000]伊凡[-]说我们抢了他的东西，难道这个箱子是他的？"
    };
getRow(501)->
    #show2Cfg {
    id = 501,
    groupid = 233,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "你们别被他欺骗了，要知道魔族做了那么多恶毒的事，而且这次[00ff00]“灵踪”案件[-]也是他们来之后发生了，我怀疑他们就是[00ff00]“灵踪”[-]的真凶，他接近[00ff00]琳达[-]是想劫走琳达的灵兽们…"
    };
getRow(502)->
    #show2Cfg {
    id = 502,
    groupid = 233,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "[00ff00]“灵踪”案件[-]我们进城后一定禀告城主进行调查，如果真是[00ff00]伊凡[-]，一定会抓住他"
    };
getRow(503)->
    #show2Cfg {
    id = 503,
    groupid = 233,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1
    };
getRow(504)->
    #show2Cfg {
    id = 504,
    groupid = 234,
    taskname = "进入阿克勒城",
    npcid = 3035,
    emotion = 1,
    name = "鲍勃",
    side = 1,
    content = "站住，想要进城需要出示[00ff00]通行证[-]"
    };
getRow(505)->
    #show2Cfg {
    id = 505,
    groupid = 234,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "通行证给你"
    };
getRow(506)->
    #show2Cfg {
    id = 506,
    groupid = 235,
    npcid = 3035,
    emotion = 1,
    name = "鲍勃",
    side = 1,
    content = "好了，你们可以进城了"
    };
getRow(507)->
    #show2Cfg {
    id = 507,
    groupid = 235,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "谢谢你，丽莎，我们走"
    };
getRow(508)->
    #show2Cfg {
    id = 508,
    groupid = 235,
    npcid = 3035,
    emotion = 1,
    name = "鲍勃",
    side = 1
    };
getRow(509)->
    #show2Cfg {
    id = 509,
    groupid = 236,
    taskname = "侍卫带路",
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "哇！[00ff00]阿克勒城[-]好大好漂亮."
    };
getRow(510)->
    #show2Cfg {
    id = 510,
    groupid = 236,
    npcid = 11100,
    emotion = 1,
    name = "艾伯特",
    side = 1,
    content = "你们是谁？前边是城主的住所，闲人免进。"
    };
getRow(511)->
    #show2Cfg {
    id = 511,
    groupid = 236,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "你好，我们从阿克勒港口过来，受露娜女神的指引找城主咨询[00ff00]漂浮之石[-]的信息"
    };
getRow(512)->
    #show2Cfg {
    id = 512,
    groupid = 236,
    npcid = 11100,
    emotion = 1,
    name = "艾伯特",
    side = 1,
    content = "露娜女神的指引？(怀疑.的目光打量)"
    };
getRow(513)->
    #show2Cfg {
    id = 513,
    groupid = 236,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "是的，我是由女神灵体幻化而成的精灵丽莎，我可以作证。"
    };
getRow(514)->
    #show2Cfg {
    id = 514,
    groupid = 236,
    npcid = 11100,
    emotion = 1,
    name = "艾伯特",
    side = 1,
    content = "好吧，那你们跟我来"
    };
getRow(515)->
    #show2Cfg {
    id = 515,
    groupid = 236,
    npcid = 11100,
    emotion = 1,
    name = "艾伯特",
    side = 1
    };
getRow(516)->
    #show2Cfg {
    id = 516,
    groupid = 238,
    taskname = "城主的考验",
    npcid = 11101,
    emotion = 1,
    name = "阿姆斯特朗",
    side = 1,
    content = "你就是露娜女神派遣的光明勇士？找我有什么事？"
    };
getRow(517)->
    #show2Cfg {
    id = 517,
    groupid = 238,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "听闻魔族最近在阿克勒寻找漂浮之石帮魔王解除封印，您是阿克勒的城主，想必知道漂浮之石的消息。"
    };
getRow(518)->
    #show2Cfg {
    id = 518,
    groupid = 238,
    npcid = 11101,
    emotion = 1,
    name = "阿姆斯特朗",
    side = 1,
    content = "当年女神以全部灵力封印魔王后，便将漂浮之石交由我保管，我可以交给你去阻止魔王，不过你要先让我看到你的能力。"
    };
getRow(519)->
    #show2Cfg {
    id = 519,
    groupid = 238,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "我需要怎么做呢？"
    };
getRow(520)->
    #show2Cfg {
    id = 520,
    groupid = 238,
    npcid = 11101,
    emotion = 1,
    name = "阿姆斯特朗",
    side = 1,
    content = "最近“灵踪”案件弄得人心惶惶，那这个案件就交给你来查出凶手，你可以去找[fff000]索尔[-]了解一下案情"
    };
getRow(521)->
    #show2Cfg {
    id = 521,
    groupid = 238,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "“灵踪”让很多灵兽下落不明，就算不为漂浮之石，我也一定查明真相，找出真凶。"
    };
getRow(522)->
    #show2Cfg {
    id = 522,
    groupid = 238,
    npcid = 11101,
    emotion = 1,
    name = "阿姆斯特朗",
    side = 1
    };
getRow(523)->
    #show2Cfg {
    id = 523,
    groupid = 240,
    taskname = "找到查案官",
    npcid = 11102,
    emotion = 1,
    name = "索尔警官",
    side = 1,
    content = "[fff000]【{PlayerName}】[-]，你来了，我已经等你很久了，跟我来，我带你去案件现场看看"
    };
getRow(524)->
    #show2Cfg {
    id = 524,
    groupid = 240,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "好。"
    };
getRow(525)->
    #show2Cfg {
    id = 525,
    groupid = 241,
    npcid = 11102,
    emotion = 1,
    name = "索尔警官",
    side = 1,
    content = "这便是最近两只灵兽[fff000]“海马绅士”[-]和[fff000]“黄晶海马”[-]失踪的地方，附近的居民在它们失踪的当天有看到他们在打架，不过以为是它们两小争吵，所以并未在意。"
    };
getRow(526)->
    #show2Cfg {
    id = 526,
    groupid = 241,
    npcid = 11102,
    emotion = 1,
    name = "索尔警官",
    side = 1,
    content = "目前我们有查到所有失踪的灵兽在失踪前都会莫名发狂攻击，克拉姆医生怀疑是中毒，不过一直没有查出毒物的来源…剩下的就拜托你找出真凶了…"
    };
getRow(527)->
    #show2Cfg {
    id = 527,
    groupid = 241,
    npcid = 11102,
    emotion = 1,
    name = "索尔警官",
    side = 1
    };
getRow(528)->
    #show2Cfg {
    id = 528,
    groupid = 242,
    taskname = "嘟嘟失常疯狂",
    npcid = 3053,
    emotion = 1,
    name = "小猪嘟嘟",
    side = 1,
    content = "唔～呼呼～吼吼"
    };
getRow(529)->
    #show2Cfg {
    id = 529,
    groupid = 242,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "嘟嘟，你怎么了？你的眼睛。。。"
    };
getRow(530)->
    #show2Cfg {
    id = 530,
    groupid = 243,
    npcid = 11009,
    emotion = 1,
    name = "小猪嘟嘟",
    side = 2,
    content = "嗷～主人，对不起，我感觉我的身体不受控制了，内心很狂躁，脑袋晕晕的~~我是不是病了啊？"
    };
getRow(531)->
    #show2Cfg {
    id = 531,
    groupid = 243,
    npcid = 11102,
    emotion = 1,
    name = "索尔警官",
    side = 1,
    content = "这…正是[00ff00]“灵踪”[-]的发病症状，你们赶紧去找[fff000]克拉姆名医[-]。"
    };
getRow(532)->
    #show2Cfg {
    id = 532,
    groupid = 243,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "嘟嘟，你坚持一下，我马上带你去看医生…[fff000]索尔警官[-]，谢谢你。"
    };
getRow(533)->
    #show2Cfg {
    id = 533,
    groupid = 243,
    npcid = 3053,
    emotion = 1,
    name = "小猪嘟嘟",
    side = 1
    };
getRow(534)->
    #show2Cfg {
    id = 534,
    groupid = 244,
    taskname = "找到名医克莱姆",
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "[fff000]克拉姆医生[-]，拜托你救救我的朋友，呜呜呜~~"
    };
getRow(535)->
    #show2Cfg {
    id = 535,
    groupid = 244,
    npcid = 11103,
    emotion = 1,
    name = "克拉姆名医",
    side = 1,
    content = "别着急，让我看看…它这是…身中[00ff00]“灵踪”[-]之毒了，不过别担心，近日我才研究出来的解药，你去那边取一些过来让它服下吧…"
    };
getRow(536)->
    #show2Cfg {
    id = 536,
    groupid = 245,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "来…嘟嘟，吃了它"
    };
getRow(537)->
    #show2Cfg {
    id = 537,
    groupid = 245,
    npcid = 11009,
    emotion = 1,
    name = "小猪嘟嘟",
    side = 2,
    content = "嗷嗷嗷…主人，我感觉我已经完全好了，又可以载着主人继续闯荡了。"
    };
getRow(538)->
    #show2Cfg {
    id = 538,
    groupid = 245,
    npcid = 11103,
    emotion = 1,
    name = "克拉姆",
    side = 1,
    content = "看你这样，应该是完全解毒了，只是这毒需要服食才会生效，最近有吃什么可疑的食物吗？"
    };
getRow(539)->
    #show2Cfg {
    id = 539,
    groupid = 245,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "可疑的食物？最近嘟嘟只吃过[fff000]琳达[-]和[fff000]杰斯[-]给的[00ff00]“兽灵精华”[-]，[fff000]克拉姆医生[-]，谢谢你，我们要赶紧回东城郊查明真相了…"
    };
getRow(540)->
    #show2Cfg {
    id = 540,
    groupid = 245,
    npcid = 11103,
    emotion = 1,
    name = "克拉姆名医",
    side = 1,
    content = "等等，我教给你们一个方法，可以验证食物是不是有[00ff00]“灵踪”[-]之毒，可以帮助你们分辨凶手。"
    };
getRow(541)->
    #show2Cfg {
    id = 541,
    groupid = 245,
    npcid = 11103,
    emotion = 1,
    name = "克拉姆名医",
    side = 1
    };
getRow(542)->
    #show2Cfg {
    id = 542,
    groupid = 264,
    taskname = "有人求救",
    npcid = 11005,
    emotion = 1,
    name = "艾琳娜",
    side = 1,
    content = "救命啊…别伤害我…"
    };
getRow(543)->
    #show2Cfg {
    id = 543,
    groupid = 264,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "咦~丽莎，你有听到什么声音吗？"
    };
getRow(544)->
    #show2Cfg {
    id = 544,
    groupid = 264,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "[00ff00]（指了指树林）[-]好像从那边传来的，一个小女孩的声音。"
    };
getRow(545)->
    #show2Cfg {
    id = 545,
    groupid = 264,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "我们去看看吧…"
    };
getRow(546)->
    #show2Cfg {
    id = 546,
    groupid = 264,
    npcid = 11005,
    emotion = 1,
    name = "艾琳娜",
    side = 1
    };
getRow(547)->
    #show2Cfg {
    id = 547,
    groupid = 246,
    taskname = "解救艾琳娜",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "这里发生什么事了吗？"
    };
getRow(548)->
    #show2Cfg {
    id = 548,
    groupid = 246,
    npcid = 11005,
    emotion = 1,
    name = "艾琳娜",
    side = 1,
    content = "[00ff00]（指了指前往）[-]那些灵兽突然发狂了，冲过来攻击我，拜托帮我赶走他们"
    };
getRow(549)->
    #show2Cfg {
    id = 549,
    groupid = 246,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "咦～这不是琳达的[fff000]灵兽诺拉[-]吗？诺拉？团长，你看它的眼睛…"
    };
getRow(550)->
    #show2Cfg {
    id = 550,
    groupid = 246,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "它应该是中了“灵踪”之毒了，先让它冷静下来吧"
    };
getRow(551)->
    #show2Cfg {
    id = 551,
    groupid = 247,
    npcid = 11005,
    emotion = 1,
    name = "艾琳娜",
    side = 1
    };
getRow(552)->
    #show2Cfg {
    id = 552,
    groupid = 248,
    taskname = "灵兽诺拉倾诉",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "诺拉，来，先把这解药给吃了。"
    };
getRow(553)->
    #show2Cfg {
    id = 553,
    groupid = 249,
    npcid = 11004,
    emotion = 1,
    name = "诺拉",
    side = 1,
    content = "谢谢你，可是我怎么会在这里？我怎么记不清我为什么出来了？我得赶紧回去，主人找不到我该担心了。"
    };
getRow(554)->
    #show2Cfg {
    id = 554,
    groupid = 249,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "你这是中了“灵踪”之毒了，不过你吃了解药已经没事了…"
    };
getRow(555)->
    #show2Cfg {
    id = 555,
    groupid = 249,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "走吧，我们去找琳达"
    };
getRow(556)->
    #show2Cfg {
    id = 556,
    groupid = 249,
    npcid = 11004,
    emotion = 1,
    name = "诺拉",
    side = 1
    };
getRow(557)->
    #show2Cfg {
    id = 557,
    groupid = 250,
    taskname = "琳达洗清嫌疑",
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1,
    content = "诺拉，你去哪儿了？你知不知道我找了你好久，让我好担心，罚你今天不许吃晚饭。"
    };
getRow(558)->
    #show2Cfg {
    id = 558,
    groupid = 250,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "琳达，你别罚它，它中了“灵踪”之毒，所以行为不受控制，才会乱跑出去，不过现在已经没事了"
    };
getRow(559)->
    #show2Cfg {
    id = 559,
    groupid = 250,
    npcid = 11004,
    emotion = 1,
    name = "诺拉",
    side = 1,
    content = "主人，呜呜呜～"
    };
getRow(560)->
    #show2Cfg {
    id = 560,
    groupid = 250,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "“灵踪”之毒，这毒是通过食物生效的，最近有给诺拉吃什么可疑的食物吗？"
    };
getRow(561)->
    #show2Cfg {
    id = 561,
    groupid = 250,
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1,
    content = "没有啊，我的灵兽只吃“兽灵精华”，喂给它们的精华都是我用硬币兑换而来，不可能有毒的，不信我兑换一个给你…"
    };
getRow(562)->
    #show2Cfg {
    id = 562,
    groupid = 250,
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1
    };
getRow(563)->
    #show2Cfg {
    id = 563,
    groupid = 252,
    taskname = "杰斯的礼物",
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "检查工作就交给丽莎吧…(检查中)，团长，琳达的精华确实无毒"
    };
getRow(564)->
    #show2Cfg {
    id = 564,
    groupid = 252,
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1,
    content = "要说可疑的食物，前天那个可恶的杰斯倒是送给来一箱“兽灵精华”，说是见我最近驯养的灵兽增加，给我喂食的，不过我没给我灵兽喂…"
    };
getRow(565)->
    #show2Cfg {
    id = 565,
    groupid = 252,
    npcid = 11004,
    emotion = 1,
    name = "诺拉",
    side = 1,
    content = "唔，主人，其实，昨天我有偷吃一些…"
    };
getRow(566)->
    #show2Cfg {
    id = 566,
    groupid = 252,
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1,
    content = "你… [-][fff000]【{PlayerName}】[-]，送来的箱子在那边，你们也检查一下吧"
    };
getRow(567)->
    #show2Cfg {
    id = 567,
    groupid = 253,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "[00ff00](检查中…)[-]，团长，杰斯给的精华上是有毒的"
    };
getRow(568)->
    #show2Cfg {
    id = 568,
    groupid = 253,
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1,
    content = "0"
    };
getRow(569)->
    #show2Cfg {
    id = 569,
    groupid = 253,
    npcid = 11004,
    emotion = 1,
    name = "诺拉",
    side = 1
    };
getRow(570)->
    #show2Cfg {
    id = 570,
    groupid = 254,
    taskname = "拆穿杰斯的谎言",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "事情还没有查明，也有可能是别的人利用杰斯来伤害诺拉，之前杰斯怀疑是魔族伊凡做的…说他们魔族做了很多的坏事"
    };
getRow(571)->
    #show2Cfg {
    id = 571,
    groupid = 254,
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1,
    content = "杰斯这个奸诈的小人，他竟然这样告诉你，伊凡一族虽是魔族，可是却从未做过坏事，这个我很了解，因为我的未婚夫就是伊凡。"
    };
getRow(572)->
    #show2Cfg {
    id = 572,
    groupid = 254,
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1,
    content = "杰斯其实并不喜欢我，如果他喜欢我，在伊凡来之前就追求我了，但是他却在最近一段时间频频向我示好，想来是看上了我的灵兽，想要借机下手。"
    };
getRow(573)->
    #show2Cfg {
    id = 573,
    groupid = 254,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "原来杰斯和你一开始并不是恋人，他居然欺骗我们，竟然还让我们去伤害伊凡。"
    };
getRow(574)->
    #show2Cfg {
    id = 574,
    groupid = 254,
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1,
    content = "他之前一直想尽办法接近我，但是有伊凡在他很难靠近，所以便想利用你们除掉伊凡，你们赶紧去抓住这个罪魁祸首吧。"
    };
getRow(575)->
    #show2Cfg {
    id = 575,
    groupid = 254,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "我们一定不让他逃了，这个坏人，竟然做这么伤天害理的坏事。"
    };
getRow(576)->
    #show2Cfg {
    id = 576,
    groupid = 254,
    npcid = 3034,
    emotion = 1,
    name = "琳达",
    side = 1
    };
getRow(577)->
    #show2Cfg {
    id = 577,
    groupid = 256,
    taskname = "杰斯承认罪行",
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "你们不是去主城了吗？怎么回来了？这次是来找我需要买点什么？…"
    };
getRow(578)->
    #show2Cfg {
    id = 578,
    groupid = 256,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "杰斯，你这个奸诈的商人，竟然欺骗利用我们…"
    };
getRow(579)->
    #show2Cfg {
    id = 579,
    groupid = 256,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "别装了，我们已经知道了你就是“灵踪”案件的凶手，跟我去见城主大人吧"
    };
getRow(580)->
    #show2Cfg {
    id = 580,
    groupid = 256,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "哼，我还真小看了你们，不过就算你们知道了，又能怎么样，现身吧，魔族，帮我消灭他们"
    };
getRow(581)->
    #show2Cfg {
    id = 581,
    groupid = 257,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "还想跑…快说，那些消失的灵兽现在在什么地方？"
    };
getRow(582)->
    #show2Cfg {
    id = 582,
    groupid = 257,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1
    };
getRow(583)->
    #show2Cfg {
    id = 583,
    groupid = 258,
    taskname = "杰斯背后的凶手",
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "这个我真的不知道，求求你们，别杀我，是魔族的吉娜指使我干的，毒药也是她给我的，我只是给灵兽们下毒，至于它们的下落，我真的不知道…"
    };
getRow(584)->
    #show2Cfg {
    id = 584,
    groupid = 258,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "吉娜？她现在在什么地方？"
    };
getRow(585)->
    #show2Cfg {
    id = 585,
    groupid = 258,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "她行踪不定，只有找我才会现身，不过在去往阿克勒平原入口处有她的落脚点，附近都是她的侍卫…我这么坦白，你们就放过我吧…"
    };
getRow(586)->
    #show2Cfg {
    id = 586,
    groupid = 258,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "你这个坏蛋，居然诬陷伊凡是真凶，还向琳达的灵兽投毒，你做了这么多坏事，之前从伊凡那儿拿的箱子是不是也是你偷的…"
    };
getRow(587)->
    #show2Cfg {
    id = 587,
    groupid = 258,
    npcid = 3033,
    emotion = 1,
    name = "杰斯",
    side = 1,
    content = "这个…这个…箱子在那边"
    };
getRow(588)->
    #show2Cfg {
    id = 588,
    groupid = 259,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "这次我先留你一命，城主的守卫马上就到，你就接受城主的处罚吧。"
    };
getRow(589)->
    #show2Cfg {
    id = 589,
    groupid = 259,
    npcid = 3037,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(590)->
    #show2Cfg {
    id = 590,
    groupid = 260,
    taskname = "寻找吉娜的踪迹",
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "你们这些干坏事的魔族坏蛋…快说，吉娜在哪里？"
    };
getRow(591)->
    #show2Cfg {
    id = 591,
    groupid = 260,
    npcid = 1107,
    emotion = 1,
    name = "炸弹头头",
    side = 1,
    content = "啊哦…别打了，我告诉你，吉娜大人现在不在东城郊，她带走灵兽刚走不久，现在应该在阿克勒平原。"
    };
getRow(592)->
    #show2Cfg {
    id = 592,
    groupid = 260,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 1
    };
getRow(593)->
    #show2Cfg {
    id = 593,
    groupid = 262,
    taskname = "向伊凡道歉",
    npcid = 3039,
    emotion = 1,
    name = "魔族伊凡",
    side = 1,
    content = "你们还敢来…"
    };
getRow(594)->
    #show2Cfg {
    id = 594,
    groupid = 262,
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "别误会，我们是来道歉的，之前听信了杰斯的谎言，误会了你们，对不起，这是之前从你这里拿走的宝箱，现在还给你。"
    };
getRow(595)->
    #show2Cfg {
    id = 595,
    groupid = 263,
    npcid = 3039,
    emotion = 1,
    name = "魔族伊凡",
    side = 1,
    content = "既然你真心道歉，那我就原谅你了，我们虽是魔族，但在魔族受到吉娜的压迫，不得已才到东城郊生活的，并没有干过任何坏事"
    };
getRow(596)->
    #show2Cfg {
    id = 596,
    groupid = 263,
    npcid = 11008,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "你也认识吉娜？我们也正要去阿克勒平原找她呢？她可是“灵踪”案件的罪魁祸首，是她的毒药才让灵兽发狂失踪的。"
    };
getRow(597)->
    #show2Cfg {
    id = 597,
    groupid = 263,
    npcid = 3039,
    emotion = 1,
    name = "魔族伊凡",
    side = 1,
    content = "原来是她，这也难怪，外人只知她擅长迷魂术，却不知她最擅长的是制毒和制药，你们与她交手一定要小心"
    };
getRow(598)->
    #show2Cfg {
    id = 598,
    groupid = 263,
    npcid = 3039,
    emotion = 1,
    name = "魔族伊凡",
    side = 1
    };
getRow(700)->
    #show2Cfg {
    id = 700,
    groupid = 79,
    taskname = "荒野魔族（上）",
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "你们好，我们是荒野魔族，阿克勒平原是我们宝贵的栖息之地，请不要驱逐我们……"
    };
getRow(701)->
    #show2Cfg {
    id = 701,
    groupid = 79,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "你们既然是魔族，不应该是在魔界的地域里生活么，为什么要来到人界的地盘生活呢？丽莎不懂，你快点说清楚。"
    };
getRow(702)->
    #show2Cfg {
    id = 702,
    groupid = 79,
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "这种事情只有我们的族长大人有权告诉他人，他就在前面的广场中央，你们去见他吧。"
    };
getRow(703)->
    #show2Cfg {
    id = 703,
    groupid = 79,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "魔族的族长……好吧，丽莎和光明勇士一起去看看。"
    };
getRow(704)->
    #show2Cfg {
    id = 704,
    groupid = 79,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(705)->
    #show2Cfg {
    id = 705,
    groupid = 80,
    taskname = "族长的请求",
    npcid = 3057,
    emotion = 1,
    name = "萨博",
    side = 1,
    content = "当初我们这些魔族不满斯诺卡的统治，被斯诺卡放逐。我身为族长必须带领族人寻找一块生活的土地，所以便带着大家来到人界这里。"
    };
getRow(706)->
    #show2Cfg {
    id = 706,
    groupid = 80,
    npcid = 3057,
    emotion = 1,
    name = "萨博",
    side = 1,
    content = "瘟疫的事情我很遗憾，吉娜那个女人最擅长研制毒药和毒素，她散播出的瘟疫，连我们这些同类也受不了。所以请你们相信我的话，荒野魔族不会伤害任何人类和精灵族。"
    };
getRow(707)->
    #show2Cfg {
    id = 707,
    groupid = 80,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "丽莎愿意相信你们，族长大人，你们现在的处境很艰难，我们什么可以帮忙你们的么？"
    };
getRow(708)->
    #show2Cfg {
    id = 708,
    groupid = 80,
    npcid = 3057,
    emotion = 1,
    name = "萨博",
    side = 1,
    content = "吉娜散播出的瘟疫破坏力极强，我们魔族无法接受你们人类研制出的药剂，要是能在里面加上一些[ff0000]蓝血草[-]就可以了。"
    };
getRow(709)->
    #show2Cfg {
    id = 709,
    groupid = 80,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "蓝血草……好的，包在我们身上。"
    };
getRow(710)->
    #show2Cfg {
    id = 710,
    groupid = 80,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(711)->
    #show2Cfg {
    id = 711,
    groupid = 82,
    taskname = "困苦的魔族",
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "谢谢你们愿意相信我们，不过我还是建议你们早些离开平原，毕竟大多数族人们还是有点不相信人类，你们在这里很容易引起其他魔族的注意。"
    };
getRow(712)->
    #show2Cfg {
    id = 712,
    groupid = 82,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "没关系，丽莎和光明勇士来到这里就是想彻底消除瘟疫，在没有达到目的之前，我们不会离开这里的。对了，丽莎听族长大人说起你们在魔界时反抗斯诺卡的统治，看来即便是同类，斯诺卡那个坏蛋还是惹人讨厌呢。"
    };
getRow(713)->
    #show2Cfg {
    id = 713,
    groupid = 82,
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "斯诺卡原本是阿尔赛德的忠实仆人，他一心想帮助阿尔赛德突破露娜女神的封印。但是我们很清楚要是阿尔萨德再次回到魔界，他肯定会号召大家再次发动战争，我们不想再打仗了。"
    };
getRow(714)->
    #show2Cfg {
    id = 714,
    groupid = 82,
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "当时族长号召了很多魔族们一起反抗斯诺卡和他的手下，却没想到他们是在太强了，我们打不过。所以到最后全都被斯诺卡放逐了……"
    };
getRow(715)->
    #show2Cfg {
    id = 715,
    groupid = 82,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "虽然你们失败了，但是你们好勇敢呢，丽莎相信你们，现在你们有什么需要帮忙的地方尽管开口。"
    };
getRow(716)->
    #show2Cfg {
    id = 716,
    groupid = 82,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(717)->
    #show2Cfg {
    id = 717,
    groupid = 83,
    taskname = "魔族的危机",
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "斯诺卡散播的瘟疫严重破坏了阿克勒草原，这里的仅存的农田都已经被污染，再不净化农田的话，大家都要饿肚子了……"
    };
getRow(718)->
    #show2Cfg {
    id = 718,
    groupid = 83,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "该怎么做才能净化农田呢？"
    };
getRow(719)->
    #show2Cfg {
    id = 719,
    groupid = 83,
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "请你们找到一些[ff0000]薄荷草[-]，交给我的同伴艾希，她正在研制净化农田的药剂。"
    };
getRow(720)->
    #show2Cfg {
    id = 720,
    groupid = 83,
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1
    };
getRow(721)->
    #show2Cfg {
    id = 721,
    groupid = 84,
    taskname = "寻找艾希",
    npcid = 3058,
    emotion = 1,
    name = "艾希",
    side = 1,
    content = "这是薄荷草！？谢谢你们，这太让人我意外了，人类竟然愿意主动帮助我们魔族。"
    };
getRow(722)->
    #show2Cfg {
    id = 722,
    groupid = 84,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "丽莎和光明勇士已经从族长大人和努努那里知道了你们的事情，我们两人愿意帮助荒野魔族度过危机。"
    };
getRow(723)->
    #show2Cfg {
    id = 723,
    groupid = 84,
    npcid = 3058,
    emotion = 1,
    name = "艾希",
    side = 1,
    content = "是么，那真是太好了！麻烦你到我们的农田一带看看吧，斯诺卡的爪牙为了破坏大家的生活，经常去农田一带捣乱。"
    };
getRow(724)->
    #show2Cfg {
    id = 724,
    groupid = 84,
    npcid = 3058,
    emotion = 1,
    name = "艾希",
    side = 1
    };
getRow(725)->
    #show2Cfg {
    id = 725,
    groupid = 85,
    taskname = "修复农田",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "真奇怪？薄荷草怎么没有效果呢？"
    };
getRow(726)->
    #show2Cfg {
    id = 726,
    groupid = 85,
    npcid = 3059,
    emotion = 1,
    name = "卡维尔",
    side = 1,
    content = "住手，不要靠近我们的农田。"
    };
getRow(727)->
    #show2Cfg {
    id = 727,
    groupid = 85,
    npcid = 3059,
    emotion = 1,
    name = "卡维尔",
    side = 1
    };
getRow(728)->
    #show2Cfg {
    id = 728,
    groupid = 86,
    taskname = "愤怒的卡维尔",
    npcid = 3059,
    emotion = 1,
    name = "卡维尔",
    side = 1,
    content = "你们为什么要进入我们的家园，荒野魔族不欢迎人类，马上离开这里，否则我不客气了！"
    };
getRow(729)->
    #show2Cfg {
    id = 729,
    groupid = 86,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "你好凶哦！丽莎是来帮助你们消除瘟疫的，不会误会我们！"
    };
getRow(730)->
    #show2Cfg {
    id = 730,
    groupid = 86,
    npcid = 3059,
    emotion = 1,
    name = "卡维尔",
    side = 1,
    content = "人类居然会帮助我们魔族，哼，当我是小孩子么？！我再说一遍，马上离开这里！"
    };
getRow(731)->
    #show2Cfg {
    id = 731,
    groupid = 86,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "哼！丽莎才不要和你这样凶的人讲话！光明勇士，我们的药剂不管用，我们去找艾希姐姐问问到底怎么回事吧。"
    };
getRow(732)->
    #show2Cfg {
    id = 732,
    groupid = 86,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(733)->
    #show2Cfg {
    id = 733,
    groupid = 87,
    taskname = "修复药剂",
    npcid = 3058,
    emotion = 1,
    name = "艾希",
    side = 1,
    content = "农田那里的事情我已经知道了，我替卡维尔向你们道歉，她曾经被人类伤害过，所以厌恶人类……"
    };
getRow(734)->
    #show2Cfg {
    id = 734,
    groupid = 87,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "哼，丽莎才不跟他一般见识呢！"
    };
getRow(735)->
    #show2Cfg {
    id = 735,
    groupid = 87,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "对了，艾希姐姐，刚刚我们净化农田，薄荷草似乎不起作用哦！"
    };
getRow(736)->
    #show2Cfg {
    id = 736,
    groupid = 87,
    npcid = 3058,
    emotion = 1,
    name = "艾希",
    side = 1,
    content = "那是因为它还没有融合我制作的药剂呢，这是我刚刚研制好的，这次你们再农田试试。"
    };
getRow(737)->
    #show2Cfg {
    id = 737,
    groupid = 87,
    npcid = 3058,
    emotion = 1,
    name = "艾希",
    side = 1
    };
getRow(738)->
    #show2Cfg {
    id = 738,
    groupid = 88,
    taskname = "保护丹妮",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "别害怕，光明勇士了已经把斯诺卡的手下打败了，现在你已经安全啦。"
    };
getRow(739)->
    #show2Cfg {
    id = 739,
    groupid = 88,
    npcid = 3060,
    emotion = 1,
    name = "丹妮",
    side = 1,
    content = "呜呜，我的家人都被斯诺卡的树人抓走了！巴特鲁去救他们，但现在还没有回来……"
    };
getRow(740)->
    #show2Cfg {
    id = 740,
    groupid = 88,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "啊，别哭了，丽莎最受不了别人哭，你安心待着这里，我和光明勇士去救你的家人。"
    };
getRow(741)->
    #show2Cfg {
    id = 741,
    groupid = 88,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(742)->
    #show2Cfg {
    id = 742,
    groupid = 89,
    taskname = "同伴的下落",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "光明勇士，这是魔族留下来的粘液……沿着前面走，或许就能找到他们。"
    };
getRow(743)->
    #show2Cfg {
    id = 743,
    groupid = 89,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(744)->
    #show2Cfg {
    id = 744,
    groupid = 90,
    taskname = "寻找同伴(上)",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "喂，你们输了，你们快点放了丹妮的家人！"
    };
getRow(745)->
    #show2Cfg {
    id = 745,
    groupid = 90,
    npcid = 3067,
    emotion = 1,
    name = "独眼怪",
    side = 1,
    content = "哇，饶命啊，我们，我们只是负责抓人，刚刚抓到的那几个魔族都已经被树人老大带走了！"
    };
getRow(746)->
    #show2Cfg {
    id = 746,
    groupid = 90,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "可恶，你们这些帮凶，快说那个树人在哪里？"
    };
getRow(747)->
    #show2Cfg {
    id = 747,
    groupid = 90,
    npcid = 3067,
    emotion = 1,
    name = "独眼怪",
    side = 1,
    content = "哇，不知道，我们真的不知道，求求你们放过我们，我们保证以后再也不做坏事了！"
    };
getRow(748)->
    #show2Cfg {
    id = 748,
    groupid = 90,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "哼，好吧，看在你们诚恳认错的态度上，今天丽莎就放过你们，记住自己说过的话哦！"
    };
getRow(749)->
    #show2Cfg {
    id = 749,
    groupid = 90,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(750)->
    #show2Cfg {
    id = 750,
    groupid = 91,
    taskname = "寻找同伴(下)",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "光明勇士，丽莎预感到后面的敌人的实力很强。我们先努力实力再考虑继续战斗吧。"
    };
getRow(751)->
    #show2Cfg {
    id = 751,
    groupid = 91,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(752)->
    #show2Cfg {
    id = 752,
    groupid = 92,
    taskname = "心急的丹妮",
    npcid = 3060,
    emotion = 1,
    name = "丹妮",
    side = 1,
    content = "怎么样？你们找到我的家人了么……"
    };
getRow(753)->
    #show2Cfg {
    id = 753,
    groupid = 92,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "很抱歉，丹妮。丽莎刚刚发现了魔族的粘液就被那些魔族围攻，它们实在太暴躁啦！"
    };
getRow(754)->
    #show2Cfg {
    id = 754,
    groupid = 92,
    npcid = 3060,
    emotion = 1,
    name = "丹妮",
    side = 1,
    content = "斯诺卡的手下都很凶，你们要小心。对了，我听到前面有些动静，可是我不敢一个人去看，或许又是那些魔族出现了呢……"
    };
getRow(755)->
    #show2Cfg {
    id = 755,
    groupid = 92,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "好，我和光明勇士去看看。"
    };
getRow(756)->
    #show2Cfg {
    id = 756,
    groupid = 92,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(757)->
    #show2Cfg {
    id = 757,
    groupid = 93,
    taskname = "发现踪迹",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "这次肯定错不了！光明勇士，斯诺卡的手下就在前面不远处，我们快追！"
    };
getRow(758)->
    #show2Cfg {
    id = 758,
    groupid = 93,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(759)->
    #show2Cfg {
    id = 759,
    groupid = 94,
    taskname = "偶遇巴特鲁",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "奇怪，人类怎么会来到这？这里很危险，你们快走吧！"
    };
getRow(760)->
    #show2Cfg {
    id = 760,
    groupid = 94,
    npcid = 3061,
    emotion = 1,
    name = "巴特鲁",
    side = 1,
    content = "请问你是不是巴特鲁？"
    };
getRow(761)->
    #show2Cfg {
    id = 761,
    groupid = 94,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "不错，你们怎么会知道我的名字？难道是丹妮喊你过来的？"
    };
getRow(762)->
    #show2Cfg {
    id = 762,
    groupid = 94,
    npcid = 3061,
    emotion = 1,
    name = "巴特鲁",
    side = 1,
    content = "是的，丹妮姐姐很担心她的家人和你的安全，所以丽莎就和同伴一起来救你们了。"
    };
getRow(763)->
    #show2Cfg {
    id = 763,
    groupid = 94,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "太好了，魔族树人就在前面，它们的数量很多，我一人不敢擅自靠近它们去救人，只能先躲在暗处等待时机。"
    };
getRow(764)->
    #show2Cfg {
    id = 764,
    groupid = 94,
    npcid = 3061,
    emotion = 1,
    name = "巴特鲁",
    side = 1,
    content = "你做得很对。接下来的事情交给我们吧，我们一定把丹妮的家人救出来！"
    };
getRow(765)->
    #show2Cfg {
    id = 765,
    groupid = 94,
    npcid = 3061,
    emotion = 1,
    name = "巴特鲁",
    side = 1
    };
getRow(766)->
    #show2Cfg {
    id = 766,
    groupid = 95,
    taskname = "巴特鲁致谢",
    npcid = 3061,
    emotion = 1,
    name = "巴特鲁",
    side = 1,
    content = "其实刚才我有些不敢相信，居然有人类会来帮助我们魔族。这一次是你们救了大家，谢谢你们！"
    };
getRow(767)->
    #show2Cfg {
    id = 767,
    groupid = 95,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "嘻！你也是个勇敢的人啊，丹妮说，你丝毫不惧怕斯诺卡的手下，一个人就去追他们呢。"
    };
getRow(768)->
    #show2Cfg {
    id = 768,
    groupid = 95,
    npcid = 3061,
    emotion = 1,
    name = "巴特鲁",
    side = 1,
    content = "那是丹妮的家人，如果他们受伤了，丹妮一定很难过，我不想看到她难过的样子……"
    };
getRow(769)->
    #show2Cfg {
    id = 769,
    groupid = 95,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "难道你对她？哦哦哦~~"
    };
getRow(770)->
    #show2Cfg {
    id = 770,
    groupid = 95,
    npcid = 3061,
    emotion = 1,
    name = "巴特鲁",
    side = 1,
    content = "咳咳……不要说出来。对了，我想起一事，那些魔化树人的铠甲有驱除瘟疫效果，不如你们取来一些带回阿克勒城，那里的人类应该需要它。"
    };
getRow(771)->
    #show2Cfg {
    id = 771,
    groupid = 95,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "你想的真周到，光明勇士我们马上行动起来。"
    };
getRow(772)->
    #show2Cfg {
    id = 772,
    groupid = 95,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(773)->
    #show2Cfg {
    id = 773,
    groupid = 96,
    taskname = "隐瞒",
    npcid = 3060,
    emotion = 1,
    name = "丹妮",
    side = 1,
    content = "谢谢你们救回我的家人，其实之前我向你们隐瞒了一件事……"
    };
getRow(774)->
    #show2Cfg {
    id = 774,
    groupid = 96,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "啊？什么事？"
    };
getRow(775)->
    #show2Cfg {
    id = 775,
    groupid = 96,
    npcid = 3060,
    emotion = 1,
    name = "丹妮",
    side = 1,
    content = "我和艾希姐姐一样，是魔族中擅长研制灵药一类的魔族。在逃离魔界的时候，我从吉娜那里偷走了一份她研制的毒药，本打算来到这里和艾希姐姐一起根据这块毒药研制出解毒的办法。"
    };
getRow(776)->
    #show2Cfg {
    id = 776,
    groupid = 96,
    npcid = 3060,
    emotion = 1,
    name = "丹妮",
    side = 1,
    content = "却不想被吉娜很快发现了，所以她便来到这里强行抓走了我的家人。"
    };
getRow(777)->
    #show2Cfg {
    id = 777,
    groupid = 96,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "原来如此，那你们找到解毒的办法了么？吉娜没有达到目的不会放过你们的。"
    };
getRow(778)->
    #show2Cfg {
    id = 778,
    groupid = 96,
    npcid = 3060,
    emotion = 1,
    name = "丹妮",
    side = 1,
    content = "没有……我们在这里生活毕竟能力有限，所以我希望你们带走这份毒药，在阿克勒城肯定会有更优秀的药剂师，把东西交给他们，或许能研制出克制吉娜毒药的药剂。"
    };
getRow(779)->
    #show2Cfg {
    id = 779,
    groupid = 96,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "没问题，卡卡先生是一个了不起的药剂师，他一定会对这件事情感兴趣的。那块毒药应该放在艾希姐姐那里吧，丽莎和光明勇士马上去取来。"
    };
getRow(780)->
    #show2Cfg {
    id = 780,
    groupid = 96,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(781)->
    #show2Cfg {
    id = 781,
    groupid = 97,
    taskname = "艾希的请求",
    npcid = 3058,
    emotion = 1,
    name = "艾希",
    side = 1,
    content = "一切就拜托你们了，希望你们早日研制出解毒药剂。对了，还有一事要拜托你们，回到阿克勒城以后请向城主解释这里的情况，我们荒野魔族只是想找到一块生活的地方，绝不会打扰人类的。"
    };
getRow(782)->
    #show2Cfg {
    id = 782,
    groupid = 97,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "艾希姐姐放心，丽莎会向城主大人解释清楚的。不过呢，平原以外的地方建议你们暂时不要进入，不然被其他不明真相的人类看到又会引起误会。"
    };
getRow(783)->
    #show2Cfg {
    id = 783,
    groupid = 97,
    npcid = 3058,
    emotion = 1,
    name = "艾希",
    side = 1,
    content = "好的，你的话我会转达其他族人的。再一次谢谢你们的帮助。"
    };
getRow(784)->
    #show2Cfg {
    id = 784,
    groupid = 97,
    npcid = 3058,
    emotion = 1,
    name = "艾希",
    side = 1
    };
getRow(785)->
    #show2Cfg {
    id = 785,
    groupid = 98,
    taskname = "族长的馈赠",
    npcid = 3057,
    emotion = 1,
    name = "萨博",
    side = 1,
    content = "你们来的正好，我知道你们在寻找生命石，斯诺卡也在寻找它！我这里藏了一块就送给你们，你们带上它赶快离开平原！"
    };
getRow(786)->
    #show2Cfg {
    id = 786,
    groupid = 98,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "族长大人到底发生了什么事？"
    };
getRow(787)->
    #show2Cfg {
    id = 787,
    groupid = 98,
    npcid = 3057,
    emotion = 1,
    name = "萨博",
    side = 1,
    content = "再过不了多久，吉娜会带领魔族袭击这里，我要带着族人与他们战斗。所以，你们两个人快点走吧！"
    };
getRow(788)->
    #show2Cfg {
    id = 788,
    groupid = 98,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "族长大人，丽莎和光明勇士很感谢您愿意把生命石交给我们，但是丽莎和光明勇士要留下帮助你们打败那些欺负你们的魔族！"
    };
getRow(789)->
    #show2Cfg {
    id = 789,
    groupid = 98,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(790)->
    #show2Cfg {
    id = 790,
    groupid = 100,
    taskname = "告别平原",
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "你们这就要离开了？不在多待一会吗？努努第一次遇到你们这样勇敢善良的人类，很高兴能认识你们！"
    };
getRow(791)->
    #show2Cfg {
    id = 791,
    groupid = 100,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "丽莎也一样，只是现在我们必须要走啦。等有一天我们彻底打败了魔族，再回到这来看你们！"
    };
getRow(792)->
    #show2Cfg {
    id = 792,
    groupid = 100,
    npcid = 3056,
    emotion = 1,
    name = "努努",
    side = 1,
    content = "一定要说话算数哦！"
    };
getRow(793)->
    #show2Cfg {
    id = 793,
    groupid = 100,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "那当然，我们来拉拉勾！~"
    };
getRow(794)->
    #show2Cfg {
    id = 794,
    groupid = 100,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(795)->
    #show2Cfg {
    id = 795,
    groupid = 101,
    taskname = "苍空塔守卫",
    npcid = 3072,
    emotion = 1,
    name = "科林",
    side = 1,
    content = "城主有令，陌生人必须请出示身份证明，否则马上离开苍空之塔！"
    };
getRow(796)->
    #show2Cfg {
    id = 796,
    groupid = 101,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "哎！有话好好说，丽莎和光明勇士是受阿克勒城主大人的委托，前来这里调查生命之石的下落，我们是好人啦！"
    };
getRow(797)->
    #show2Cfg {
    id = 797,
    groupid = 101,
    npcid = 3072,
    emotion = 1,
    name = "科林",
    side = 1,
    content = "竟然是阿克勒城的人，看来是我误会你们了。我们的城主大人与阿克勒主人交好，既然你们是朋友，我就允许你们在城里活动，不过要注意不要影响到别人。"
    };
getRow(798)->
    #show2Cfg {
    id = 798,
    groupid = 101,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "好的，光明勇士，丽莎肚子饿了，我们去找点吃的吧。"
    };
getRow(799)->
    #show2Cfg {
    id = 799,
    groupid = 101,
    npcid = 3072,
    emotion = 1,
    name = "科林",
    side = 1,
    content = "前面有冻鱼，是苍空之塔特有的食物，你们可以去尝尝。"
    };
getRow(800)->
    #show2Cfg {
    id = 800,
    groupid = 101,
    npcid = 3072,
    emotion = 1,
    name = "科林",
    side = 1
    };
getRow(801)->
    #show2Cfg {
    id = 801,
    groupid = 102,
    taskname = "入侵苍空塔",
    npcid = 3072,
    emotion = 1,
    name = "科林",
    side = 1,
    content = "不久前大家知道阿克勒城那里混入了的魔族，现在那边的情况怎么样？"
    };
getRow(802)->
    #show2Cfg {
    id = 802,
    groupid = 102,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "还好啦，那些魔族都已经被我们抓住了呢！"
    };
getRow(803)->
    #show2Cfg {
    id = 803,
    groupid = 102,
    npcid = 3072,
    emotion = 1,
    name = "科林",
    side = 1,
    content = "你们竟然是除魔的勇士！请原谅我刚才的无礼，现在的苍空塔也混入了魔族，所以大家才会如此紧张。"
    };
getRow(804)->
    #show2Cfg {
    id = 804,
    groupid = 102,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "因为吃到美味的鱼肉，刚才的事丽莎已经不生气啦。城主大人在哪里，丽莎想见他。"
    };
getRow(805)->
    #show2Cfg {
    id = 805,
    groupid = 102,
    npcid = 3072,
    emotion = 1,
    name = "科林",
    side = 1,
    content = "经过前面的冰桥，你们会遇见雪莉尔长官，城主大人就在她附近。"
    };
getRow(806)->
    #show2Cfg {
    id = 806,
    groupid = 102,
    npcid = 3072,
    emotion = 1,
    name = "科林",
    side = 1
    };
getRow(807)->
    #show2Cfg {
    id = 807,
    groupid = 103,
    taskname = "守城长官",
    npcid = 3073,
    emotion = 1,
    name = "谢莉尔",
    side = 1,
    content = "士兵们听令，与我一起击退魔族！"
    };
getRow(808)->
    #show2Cfg {
    id = 808,
    groupid = 103,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "好帅气的女长官，光明勇士，我们和她一起去击退魔族吧。"
    };
getRow(809)->
    #show2Cfg {
    id = 809,
    groupid = 103,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(810)->
    #show2Cfg {
    id = 810,
    groupid = 104,
    taskname = "引路",
    npcid = 3073,
    emotion = 1,
    name = "谢莉尔",
    side = 1,
    content = "谢谢你们出手帮忙，你们是从阿克勒城来到这里的么？我们的城主大人就前面里，他等你们很久了。"
    };
getRow(811)->
    #show2Cfg {
    id = 811,
    groupid = 104,
    npcid = 3073,
    emotion = 1,
    name = "谢莉尔",
    side = 1,
    content = "另外就如你们所见，苍空之塔已经混入了大量的魔族，若你们在其他地方发现了他们的踪迹，请及时通知我。"
    };
getRow(812)->
    #show2Cfg {
    id = 812,
    groupid = 104,
    npcid = 3073,
    emotion = 1,
    name = "谢莉尔",
    side = 1
    };
getRow(813)->
    #show2Cfg {
    id = 813,
    groupid = 105,
    taskname = "苍空塔城主",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "城主大人你好，丽莎和光明勇士受阿克勒城主之意来到苍空塔寻您，希望您透露一些关于生命之石的线索。"
    };
getRow(814)->
    #show2Cfg {
    id = 814,
    groupid = 105,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "勇士们，如果你们想得到我手中的生命之石需得帮我消灭掉苍空塔内的魔族。"
    };
getRow(815)->
    #show2Cfg {
    id = 815,
    groupid = 105,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "丽莎很乐意这样做，不过这里的魔族数量不少，我们可能要在这多待几天呢。"
    };
getRow(816)->
    #show2Cfg {
    id = 816,
    groupid = 105,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "这个没问题，只要你们能帮我驱赶魔族，我不仅奉上生命之石，还会送你们美味的鱼肉。"
    };
getRow(817)->
    #show2Cfg {
    id = 817,
    groupid = 105,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1
    };
getRow(818)->
    #show2Cfg {
    id = 818,
    groupid = 106,
    taskname = "魔族的线索（上）",
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "那些魔族好可恶，进入苍空之塔后，抢走了我们不少鱼肉。"
    };
getRow(819)->
    #show2Cfg {
    id = 819,
    groupid = 106,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "咦？那些魔族竟然和丽莎一样也喜欢吃鱼呢！"
    };
getRow(820)->
    #show2Cfg {
    id = 820,
    groupid = 106,
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "他们尤其喜欢在晚上来偷大家准备的鱼肉，这位勇士，如果能帮大伙捉住他们，我们会支付你们酬金的。"
    };
getRow(821)->
    #show2Cfg {
    id = 821,
    groupid = 106,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "酬金！酬金！丽莎，哦不，光明勇士一定会帮助大家的。"
    };
getRow(822)->
    #show2Cfg {
    id = 822,
    groupid = 106,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(823)->
    #show2Cfg {
    id = 823,
    groupid = 107,
    taskname = "魔族的线索（下）",
    npcid = 3073,
    emotion = 1,
    name = "谢莉尔",
    side = 1,
    content = "城主大人告诉我，你们愿意帮忙一起对付魔族？"
    };
getRow(824)->
    #show2Cfg {
    id = 824,
    groupid = 107,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "是的，丽莎要抓住那些偷鱼的家伙！"
    };
getRow(825)->
    #show2Cfg {
    id = 825,
    groupid = 107,
    npcid = 3073,
    emotion = 1,
    name = "谢莉尔",
    side = 1,
    content = "雷纳德应该已经告诉过你们，魔族喜欢在夜晚行动，几个小时以后我们再碰头。"
    };
getRow(826)->
    #show2Cfg {
    id = 826,
    groupid = 107,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "咦？那边的鱼肉怎么自己动了？哎哎，别跑啊！"
    };
getRow(827)->
    #show2Cfg {
    id = 827,
    groupid = 107,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(828)->
    #show2Cfg {
    id = 828,
    groupid = 108,
    taskname = "偷鱼贼别跑",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "哼，偷鱼贼，快点放下鱼肉，否则丽莎生气了！"
    };
getRow(829)->
    #show2Cfg {
    id = 829,
    groupid = 108,
    npcid = 3081,
    emotion = 1,
    name = "喵老大",
    side = 1,
    content = "哼，来追我们啊！"
    };
getRow(830)->
    #show2Cfg {
    id = 830,
    groupid = 108,
    npcid = 3081,
    emotion = 1,
    name = "喵老大",
    side = 1
    };
getRow(831)->
    #show2Cfg {
    id = 831,
    groupid = 109,
    taskname = "追回鱼肉",
    npcid = 3081,
    emotion = 1,
    name = "喵老大",
    side = 1,
    content = "喵呜，抢走我们的鱼，我是不会善罢甘休的！"
    };
getRow(832)->
    #show2Cfg {
    id = 832,
    groupid = 109,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "这鱼肉的味道好香，可惜丽莎已经吃不下了。光明勇士我们把抢回来的鱼肉放回原地吧。"
    };
getRow(833)->
    #show2Cfg {
    id = 833,
    groupid = 109,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(834)->
    #show2Cfg {
    id = 834,
    groupid = 110,
    taskname = "危险的信号",
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "谢谢你们帮我们抢回了鱼肉，不过那些贪婪的魔族是不会罢休的"
    };
getRow(835)->
    #show2Cfg {
    id = 835,
    groupid = 110,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "别担心，丽莎和光明勇士已经答应了城主大人，帮你们消灭这些讨厌的魔族。"
    };
getRow(836)->
    #show2Cfg {
    id = 836,
    groupid = 110,
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "除了生命之石，苍空之塔的宝物也是他们觊觎的对象，你们要当心。"
    };
getRow(837)->
    #show2Cfg {
    id = 837,
    groupid = 110,
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "光明勇士，魔族成员很可能藏身于城主大人的帐篷周围，若有发现请立即控制住他们。"
    };
getRow(838)->
    #show2Cfg {
    id = 838,
    groupid = 110,
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1
    };
getRow(839)->
    #show2Cfg {
    id = 839,
    groupid = 111,
    taskname = "衰弱的女神",
    npcid = 3076,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "很高兴在这里见到你们，这段时间辛苦你们了！"
    };
getRow(840)->
    #show2Cfg {
    id = 840,
    groupid = 111,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "女神大人，您为什么会出现在这里？"
    };
getRow(841)->
    #show2Cfg {
    id = 841,
    groupid = 111,
    npcid = 3076,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "阿尔赛德的封印越加不稳，我不知道自己还能坚持多久……生命之石的线索你们可有发现么？"
    };
getRow(842)->
    #show2Cfg {
    id = 842,
    groupid = 111,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "我们从荒野魔族那里得到一块生命之石，女神大人，你看它在这。"
    };
getRow(843)->
    #show2Cfg {
    id = 843,
    groupid = 111,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(844)->
    #show2Cfg {
    id = 844,
    groupid = 112,
    taskname = "袭击女神",
    npcid = 3076,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "这里有魔族的气味，你们要当心！"
    };
getRow(845)->
    #show2Cfg {
    id = 845,
    groupid = 112,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "光明勇士我们来保护女神！"
    };
getRow(846)->
    #show2Cfg {
    id = 846,
    groupid = 113,
    taskname = "女神的预言",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "女神大人，你的力量……"
    };
getRow(847)->
    #show2Cfg {
    id = 847,
    groupid = 113,
    npcid = 3076,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "没错，越来越弱……随时可能被阿尔萨德的魔力反噬。苍空之塔内已经出现了大量的魔族，在不久这里的人恐怕就要被魔气侵染了。"
    };
getRow(848)->
    #show2Cfg {
    id = 848,
    groupid = 113,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "啊，那我们该怎么办，这里没有药剂师啊！"
    };
getRow(849)->
    #show2Cfg {
    id = 849,
    groupid = 113,
    npcid = 3076,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "这些冰晶已经被我注入灵力，你们将它放到水中，可以为大家暂时抵挡魔气。"
    };
getRow(850)->
    #show2Cfg {
    id = 850,
    groupid = 113,
    npcid = 3076,
    emotion = 1,
    name = "露娜女神",
    side = 1
    };
getRow(851)->
    #show2Cfg {
    id = 851,
    groupid = 114,
    taskname = "解释",
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "刚刚你们往水里投放了什么？"
    };
getRow(852)->
    #show2Cfg {
    id = 852,
    groupid = 114,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "我们察觉到魔气即将污染这里的人，所以将注入灵力的晶体投入水中，帮助大家抵御一阵。"
    };
getRow(853)->
    #show2Cfg {
    id = 853,
    groupid = 114,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "原来如此，谢谢你们……"
    };
getRow(854)->
    #show2Cfg {
    id = 854,
    groupid = 114,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "海伦夫人家的周围出现了魔族的身影，请你过去看看吧。"
    };
getRow(855)->
    #show2Cfg {
    id = 855,
    groupid = 114,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1
    };
getRow(856)->
    #show2Cfg {
    id = 856,
    groupid = 115,
    taskname = "独居的海伦",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "这位夫人你没事吧……"
    };
getRow(857)->
    #show2Cfg {
    id = 857,
    groupid = 115,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "我还好，谢谢你们……"
    };
getRow(858)->
    #show2Cfg {
    id = 858,
    groupid = 115,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "罗宾先生发现您家中附近出现了魔族，不过它们已经被我们赶走了，你不需要在害怕了哦。"
    };
getRow(859)->
    #show2Cfg {
    id = 859,
    groupid = 115,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "！……那，那实在太好了。"
    };
getRow(860)->
    #show2Cfg {
    id = 860,
    groupid = 115,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1
    };
getRow(861)->
    #show2Cfg {
    id = 861,
    groupid = 116,
    taskname = "奇怪的药丸",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "咦，这是什么？"
    };
getRow(862)->
    #show2Cfg {
    id = 862,
    groupid = 116,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "咳咳咳！好苦啊，原来是药丸，讨厌！"
    };
getRow(863)->
    #show2Cfg {
    id = 863,
    groupid = 116,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(864)->
    #show2Cfg {
    id = 864,
    groupid = 117,
    taskname = "海伦母子（上）",
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "海伦夫人自从儿子病了以后就很少与大家走动，她几乎把所有时间都花在了照料儿子身上。"
    };
getRow(865)->
    #show2Cfg {
    id = 865,
    groupid = 117,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "她的孩子得了什么病，居然这么严重，难道没有大夫能治好他么？"
    };
getRow(866)->
    #show2Cfg {
    id = 866,
    groupid = 117,
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "没有，那孩子现在只能靠着昂贵的药材支撑。哎，可怜的很啊。"
    };
getRow(867)->
    #show2Cfg {
    id = 867,
    groupid = 117,
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1
    };
getRow(868)->
    #show2Cfg {
    id = 868,
    groupid = 118,
    taskname = "海伦母子（下）",
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "当初海伦的孩子病了后，海伦曾哭着求我将自己的私人医生带去家中看病。"
    };
getRow(869)->
    #show2Cfg {
    id = 869,
    groupid = 118,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "结果我的私人医生对那孩子的病也束手无策，海伦夫人当时就收到了极大的刺激。"
    };
getRow(870)->
    #show2Cfg {
    id = 870,
    groupid = 118,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "好可怜……那后来的呢？"
    };
getRow(871)->
    #show2Cfg {
    id = 871,
    groupid = 118,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "再后来，海伦就拒绝了所有医生再去她家。从那时候开始海伦就独自一人照顾孩子直到现在。"
    };
getRow(872)->
    #show2Cfg {
    id = 872,
    groupid = 118,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "呜呜……城主大人，海伦夫人好可怜，如果她需要我们帮忙的话，丽莎一定会尽力而为。"
    };
getRow(873)->
    #show2Cfg {
    id = 873,
    groupid = 118,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(874)->
    #show2Cfg {
    id = 874,
    groupid = 119,
    taskname = "女神战甲",
    npcid = 3076,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "光明勇士，我预感到这里过不久就会有高级魔族降临，这件战甲就赐予你，它可以助你一臂之力。"
    };
getRow(875)->
    #show2Cfg {
    id = 875,
    groupid = 119,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "哇！好漂亮的战甲，光明勇士你赶快穿上让丽莎看看吧。"
    };
getRow(876)->
    #show2Cfg {
    id = 876,
    groupid = 119,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(877)->
    #show2Cfg {
    id = 877,
    groupid = 120,
    taskname = "魔族气息",
    npcid = 3076,
    emotion = 1,
    name = "露娜女神",
    side = 1,
    content = "魔族的气息又出现了，你们快去吧。"
    };
getRow(878)->
    #show2Cfg {
    id = 878,
    groupid = 120,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "恩……又是海伦夫人，光明勇士这次我们先藏起来，看看到底是什么情况。"
    };
getRow(879)->
    #show2Cfg {
    id = 879,
    groupid = 120,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(880)->
    #show2Cfg {
    id = 880,
    groupid = 121,
    taskname = "疑点",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "这是！海伦夫人难道她……！"
    };
getRow(881)->
    #show2Cfg {
    id = 881,
    groupid = 121,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(882)->
    #show2Cfg {
    id = 882,
    groupid = 122,
    taskname = "蛛丝马迹",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "光明勇士，我们得把自己发现的鳞片马上交给城主大人！海伦夫人很可能是潜入在仓库之塔内的魔族爪牙。"
    };
getRow(883)->
    #show2Cfg {
    id = 883,
    groupid = 122,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(884)->
    #show2Cfg {
    id = 884,
    groupid = 123,
    taskname = "坦白",
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "你的意思是海伦夫人与魔族有往来，这怎么可能……小丫头你不会是看错了吧？"
    };
getRow(885)->
    #show2Cfg {
    id = 885,
    groupid = 123,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "丽莎没有认错，这是魔族特有的鳞片。"
    };
getRow(886)->
    #show2Cfg {
    id = 886,
    groupid = 123,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1,
    content = "好吧，我允许你们继续调查海伦的情况，只是不到万不得已不要伤害她和她的家人。"
    };
getRow(887)->
    #show2Cfg {
    id = 887,
    groupid = 123,
    npcid = 3074,
    emotion = 1,
    name = "罗宾",
    side = 1
    };
getRow(888)->
    #show2Cfg {
    id = 888,
    groupid = 124,
    taskname = "相信",
    npcid = 3075,
    emotion = 1,
    name = "雷纳德",
    side = 1,
    content = "海伦夫人她……无论看到什么情形，请你们不要伤害她和她的孩子。"
    };
getRow(889)->
    #show2Cfg {
    id = 889,
    groupid = 124,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "先生你……丽莎知道了。"
    };
getRow(890)->
    #show2Cfg {
    id = 890,
    groupid = 124,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(891)->
    #show2Cfg {
    id = 891,
    groupid = 125,
    taskname = "抵赖",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "夫人，这是我们在你家附近发现的魔族鳞片，请问这到底是怎么回事呢？"
    };
getRow(892)->
    #show2Cfg {
    id = 892,
    groupid = 125,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "！胡说，我的家怎么会有魔族鳞片，请你们赶快离开！"
    };
getRow(893)->
    #show2Cfg {
    id = 893,
    groupid = 125,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "做贼心虚，丽莎亲眼看到的，海伦夫人别再掩饰了！"
    };
getRow(894)->
    #show2Cfg {
    id = 894,
    groupid = 125,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(895)->
    #show2Cfg {
    id = 895,
    groupid = 126,
    taskname = "出击",
    npcid = 3082,
    emotion = 1,
    name = "麦克",
    side = 1,
    content = "母亲，好痛啊……"
    };
getRow(896)->
    #show2Cfg {
    id = 896,
    groupid = 126,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "住手！不要伤害我的孩子！"
    };
getRow(897)->
    #show2Cfg {
    id = 897,
    groupid = 126,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "啊……他居然就是你的儿子？！"
    };
getRow(898)->
    #show2Cfg {
    id = 898,
    groupid = 126,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(899)->
    #show2Cfg {
    id = 899,
    groupid = 127,
    taskname = "真相",
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "求求你们放过我的孩子，只要你们肯放了他，我愿意承担一切罪责！"
    };
getRow(900)->
    #show2Cfg {
    id = 900,
    groupid = 127,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "丽莎不懂？海伦夫人，你明明是人类为什么你的孩子会是魔族呢？"
    };
getRow(901)->
    #show2Cfg {
    id = 901,
    groupid = 127,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "呜，当初我的孩子已经无药可救，是魔族提供了药物才支撑到现在。"
    };
getRow(902)->
    #show2Cfg {
    id = 902,
    groupid = 127,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "可是在魔药的作用下，我的孩子渐渐变成魔族的样子，可无论怎样，他都是我的孩子啊……"
    };
getRow(903)->
    #show2Cfg {
    id = 903,
    groupid = 127,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1
    };
getRow(904)->
    #show2Cfg {
    id = 904,
    groupid = 128,
    taskname = "劝告",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "海伦夫人，你的孩子如果继续服用魔药，总有一天会彻底变成怪物，到那时你一定会后悔的……"
    };
getRow(905)->
    #show2Cfg {
    id = 905,
    groupid = 128,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "那……那我该怎么办？"
    };
getRow(906)->
    #show2Cfg {
    id = 906,
    groupid = 128,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "丽莎有驱魔药的制作卷轴，只需要找到火龙果就可以开始制作了。"
    };
getRow(907)->
    #show2Cfg {
    id = 907,
    groupid = 128,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(908)->
    #show2Cfg {
    id = 908,
    groupid = 129,
    taskname = "意外",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "怎么会这样……驱魔药居然不起作用！海伦夫人，我……"
    };
getRow(909)->
    #show2Cfg {
    id = 909,
    groupid = 129,
    npcid = 3077,
    emotion = 1,
    name = "海伦",
    side = 1,
    content = "现在该怎么办？我的孩子，我的孩子！"
    };
getRow(910)->
    #show2Cfg {
    id = 910,
    groupid = 129,
    npcid = 3077,
    emotion = 1,
    name = "海伦",
    side = 1
    };
getRow(911)->
    #show2Cfg {
    id = 911,
    groupid = 130,
    taskname = "失控的孩子",
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "呜……孩子你快点清醒过来，我是你的母亲。"
    };
getRow(912)->
    #show2Cfg {
    id = 912,
    groupid = 130,
    npcid = 3082,
    emotion = 1,
    name = "麦克",
    side = 1,
    content = "母，母亲……呜哇哇！"
    };
getRow(913)->
    #show2Cfg {
    id = 913,
    groupid = 130,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "都是我不好……"
    };
getRow(914)->
    #show2Cfg {
    id = 914,
    groupid = 130,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1,
    content = "孩子不要怕，母亲就在这一直陪着你。"
    };
getRow(915)->
    #show2Cfg {
    id = 915,
    groupid = 130,
    npcid = 3077,
    emotion = 1,
    name = "海伦夫人",
    side = 1
    };
getRow(916)->
    #show2Cfg {
    id = 916,
    groupid = 131,
    taskname = "海伦的朋友",
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "海伦夫人的事情大家很遗憾，但是作为她的朋友，我还是感谢你们帮助她。"
    };
getRow(917)->
    #show2Cfg {
    id = 917,
    groupid = 131,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "很抱歉，丽莎还是没能挽救海伦夫人母子。"
    };
getRow(918)->
    #show2Cfg {
    id = 918,
    groupid = 131,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(919)->
    #show2Cfg {
    id = 919,
    groupid = 132,
    taskname = "失窃",
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "差点忘了正事，城主大人告诉我，你们愿意协助大家对抗魔族是么？"
    };
getRow(920)->
    #show2Cfg {
    id = 920,
    groupid = 132,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "是的，现在还有什么需要帮忙？"
    };
getRow(921)->
    #show2Cfg {
    id = 921,
    groupid = 132,
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "马修传来消息，苍空之塔的宝石被盗走了，城主大人现在十分着急，下令我们竭尽全力找出盗宝者。"
    };
getRow(922)->
    #show2Cfg {
    id = 922,
    groupid = 132,
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "你们在干活前，能不能先给我寻来瓶伏特加，这该死的鬼天气太冷了。"
    };
getRow(923)->
    #show2Cfg {
    id = 923,
    groupid = 132,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "（原来西蒙先生是个酒鬼……）"
    };
getRow(924)->
    #show2Cfg {
    id = 924,
    groupid = 132,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(925)->
    #show2Cfg {
    id = 925,
    groupid = 133,
    taskname = "西蒙的委托",
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "呵，伏特加，我的最爱！嗝~"
    };
getRow(926)->
    #show2Cfg {
    id = 926,
    groupid = 133,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "西蒙大叔，你先别顾着喝酒，快点告诉丽莎，那些盗宝的魔族去了哪？"
    };
getRow(927)->
    #show2Cfg {
    id = 927,
    groupid = 133,
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "盗宝事件发生后，城主下令全城戒严，一些低级魔族很难逃出这里。这些魔族就交给你们了！"
    };
getRow(928)->
    #show2Cfg {
    id = 928,
    groupid = 133,
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1
    };
getRow(929)->
    #show2Cfg {
    id = 929,
    groupid = 134,
    taskname = "寻找盗宝者（下）",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "抓住你们了，快说快说，宝物是不是被你们拿走了？"
    };
getRow(930)->
    #show2Cfg {
    id = 930,
    groupid = 134,
    npcid = 3083,
    emotion = 1,
    name = "吸血蝙蝠",
    side = 1,
    content = "……我们是斯诺卡大人忠实的信徒，任何事都不会告诉你们的！"
    };
getRow(931)->
    #show2Cfg {
    id = 931,
    groupid = 134,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "你们！"
    };
getRow(932)->
    #show2Cfg {
    id = 932,
    groupid = 134,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(933)->
    #show2Cfg {
    id = 933,
    groupid = 135,
    taskname = "苍空塔禁区",
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "前面就是苍空塔禁区，只有马修守在那里，宝物失窃的事情只有他最清楚……"
    };
getRow(934)->
    #show2Cfg {
    id = 934,
    groupid = 135,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "马修是谁？"
    };
getRow(935)->
    #show2Cfg {
    id = 935,
    groupid = 135,
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "马修是城主大人的最信赖的伙伴，也是苍空塔的守门人。我要提醒你们，他的脾气很坏，你们当心些。"
    };
getRow(936)->
    #show2Cfg {
    id = 936,
    groupid = 135,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "又是凶巴巴的大叔，丽莎不喜欢……"
    };
getRow(937)->
    #show2Cfg {
    id = 937,
    groupid = 135,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(938)->
    #show2Cfg {
    id = 938,
    groupid = 136,
    taskname = "投其所好",
    npcid = 3078,
    emotion = 1,
    name = "西蒙",
    side = 1,
    content = "哈哈，你们要学会投其所好。这个给你，马修见到了应该不会为难你们。"
    };
getRow(939)->
    #show2Cfg {
    id = 939,
    groupid = 137,
    taskname = "守塔人马修",
    npcid = 3079,
    emotion = 1,
    name = "马修",
    side = 1,
    content = "你们就是罗宾口中提起的光明勇士吧，来得正好。魔族已经围住了苍空塔，快来帮忙！"
    };
getRow(940)->
    #show2Cfg {
    id = 940,
    groupid = 137,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "马修大叔，西蒙很担心你。所以我们就立即赶过来了。"
    };
getRow(941)->
    #show2Cfg {
    id = 941,
    groupid = 137,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(942)->
    #show2Cfg {
    id = 942,
    groupid = 138,
    taskname = "苍空塔魔气",
    npcid = 3079,
    emotion = 1,
    name = "马修",
    side = 1,
    content = "魔族觊觎罗宾的宝物，我要死守这里，不能让魔族得逞。"
    };
getRow(943)->
    #show2Cfg {
    id = 943,
    groupid = 138,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "马修大叔，你的灵力不足以对抗魔气。丽莎建议你还是早些离开这里，不然被魔气所侵蚀会很痛苦的。"
    };
getRow(944)->
    #show2Cfg {
    id = 944,
    groupid = 138,
    npcid = 3079,
    emotion = 1,
    name = "马修",
    side = 1,
    content = "不，我绝不离开这里。"
    };
getRow(945)->
    #show2Cfg {
    id = 945,
    groupid = 138,
    npcid = 3079,
    emotion = 1,
    name = "马修",
    side = 1
    };
getRow(946)->
    #show2Cfg {
    id = 946,
    groupid = 139,
    taskname = "塔顶之战",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "放下宝物，否则丽莎就不客气了！"
    };
getRow(947)->
    #show2Cfg {
    id = 947,
    groupid = 139,
    npcid = 3084,
    emotion = 1,
    name = "狂暴魔龙",
    side = 1,
    content = "小丫头不要多管闲事，否则本座就把你吃掉！"
    };
getRow(948)->
    #show2Cfg {
    id = 948,
    groupid = 140,
    taskname = "消失的宝物",
    npcid = 3079,
    emotion = 1,
    name = "马修",
    side = 1,
    content = "宝物怎么不见了？你们从魔龙那里没有发现么？"
    };
getRow(949)->
    #show2Cfg {
    id = 949,
    groupid = 140,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "咦！丽莎刚才什么也没看到啊！？"
    };
getRow(950)->
    #show2Cfg {
    id = 950,
    groupid = 140,
    npcid = 3079,
    emotion = 1,
    name = "马修",
    side = 1,
    content = "该不会是你们浑水摸鱼吧，我要把这件事告诉罗宾！"
    };
getRow(951)->
    #show2Cfg {
    id = 951,
    groupid = 140,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "你乱讲！丽莎和光明使者才没有拿走宝物呢。哼，你等着，我们一定把宝物找到！"
    };
getRow(952)->
    #show2Cfg {
    id = 952,
    groupid = 140,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "光明勇士你瞧，前面那个发光的箱子……"
    };
getRow(953)->
    #show2Cfg {
    id = 953,
    groupid = 140,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(954)->
    #show2Cfg {
    id = 954,
    groupid = 141,
    taskname = "马修的道歉",
    npcid = 3079,
    emotion = 1,
    name = "马修",
    side = 1,
    content = "对不起，刚刚是我误会你们了……"
    };
getRow(955)->
    #show2Cfg {
    id = 955,
    groupid = 141,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "……"
    };
getRow(956)->
    #show2Cfg {
    id = 956,
    groupid = 141,
    npcid = 3079,
    emotion = 1,
    name = "马修",
    side = 1,
    content = "小姑娘不要生气了，真的是我错怪你们了。"
    };
getRow(957)->
    #show2Cfg {
    id = 957,
    groupid = 141,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "马修大叔，这一次丽莎就原谅你，希望你以后能克制你的坏脾气哦。"
    };
getRow(958)->
    #show2Cfg {
    id = 958,
    groupid = 141,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(959)->
    #show2Cfg {
    id = 959,
    groupid = 142,
    taskname = "城主千金",
    npcid = 3080,
    emotion = 1,
    name = "伊娃",
    side = 1,
    content = "嗨，我在这里等你们久了，你们就是赶走魔族的光明勇士吧？"
    };
getRow(960)->
    #show2Cfg {
    id = 960,
    groupid = 142,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "你是？"
    };
getRow(961)->
    #show2Cfg {
    id = 961,
    groupid = 142,
    npcid = 3080,
    emotion = 1,
    name = "伊娃",
    side = 1,
    content = "哎呀，忘了自我介绍，我是伊娃，罗宾是我的父亲。"
    };
getRow(962)->
    #show2Cfg {
    id = 962,
    groupid = 142,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "原来是城主的千金，你找我们有什么事？"
    };
getRow(963)->
    #show2Cfg {
    id = 963,
    groupid = 142,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(964)->
    #show2Cfg {
    id = 964,
    groupid = 143,
    taskname = "伊娃指路",
    npcid = 3080,
    emotion = 1,
    name = "伊娃",
    side = 1,
    content = "父亲已经把你们的事告诉我了，伊娃很感谢你们帮忙。"
    };
getRow(965)->
    #show2Cfg {
    id = 965,
    groupid = 143,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "小事一桩，伊娃姐姐，我们要继续出发了，请你告诉我们出口在哪？"
    };
getRow(966)->
    #show2Cfg {
    id = 966,
    groupid = 143,
    npcid = 3080,
    emotion = 1,
    name = "伊娃",
    side = 1,
    content = "一直往前走就是苍空之塔的出口了，接下来你们会到达海洋之心，那里居住着很多人鱼族，他们都很友好。"
    };
getRow(967)->
    #show2Cfg {
    id = 967,
    groupid = 143,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "谢谢你！对了，城主大人之前承诺过的生命石……"
    };
getRow(968)->
    #show2Cfg {
    id = 968,
    groupid = 143,
    npcid = 3080,
    emotion = 1,
    name = "伊娃",
    side = 1,
    content = "哈哈，我当然记得，这是父亲托我转交给你们的生命石，请务必收好它。"
    };
getRow(969)->
    #show2Cfg {
    id = 969,
    groupid = 143,
    npcid = 3080,
    emotion = 1,
    name = "伊娃",
    side = 1
    };
getRow(970)->
    #show2Cfg {
    id = 970,
    groupid = 144,
    taskname = "离开苍空塔",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "可恶，这些魔族居然敢偷袭我们，光明勇士前面就是出口，到了海洋之心以后继续调查生命石的下落吧。"
    };
getRow(971)->
    #show2Cfg {
    id = 971,
    groupid = 144,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(972)->
    #show2Cfg {
    id = 972,
    groupid = 145,
    taskname = "海洋之城",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "哇！丽莎第一次见到这么美丽的地方。"
    };
getRow(973)->
    #show2Cfg {
    id = 973,
    groupid = 145,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "光明勇士，你看这里好多漂亮的海藻在摆动呢，跟丽莎一起进去吧。"
    };
getRow(974)->
    #show2Cfg {
    id = 974,
    groupid = 145,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(975)->
    #show2Cfg {
    id = 975,
    groupid = 146,
    taskname = "发现",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "咦？光明勇士快看前面那个闪闪发光的东西……"
    };
getRow(976)->
    #show2Cfg {
    id = 976,
    groupid = 146,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(977)->
    #show2Cfg {
    id = 977,
    groupid = 147,
    taskname = "进入海之城",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "你们是什么人？国王有令，外来人不得随意进入海之城。"
    };
getRow(978)->
    #show2Cfg {
    id = 978,
    groupid = 147,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "哇，你长得好可爱，丽莎很喜欢你的帽子呢！我和光明勇士受阿克勒城主的委托调查魔族入侵一事，经过苍空之塔来到这里。"
    };
getRow(979)->
    #show2Cfg {
    id = 979,
    groupid = 147,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "魔族……这么说你们很厉害喽?"
    };
getRow(980)->
    #show2Cfg {
    id = 980,
    groupid = 147,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "嗯？！"
    };
getRow(981)->
    #show2Cfg {
    id = 981,
    groupid = 147,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "动手吧，让我见识见识你们的本领！"
    };
getRow(982)->
    #show2Cfg {
    id = 982,
    groupid = 147,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1
    };
getRow(983)->
    #show2Cfg {
    id = 983,
    groupid = 148,
    taskname = "怒火",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "喂喂喂，这到底是怎么回事啊，丽莎都夸你可爱了，你居然还这样对我们，哼！"
    };
getRow(984)->
    #show2Cfg {
    id = 984,
    groupid = 148,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "小可爱你先别生气，刚才你们的表现令我非常满意，我向请你们参加国王的悬赏，不知你们有兴趣么？"
    };
getRow(985)->
    #show2Cfg {
    id = 985,
    groupid = 148,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "国王的悬赏？那是什么情况？"
    };
getRow(986)->
    #show2Cfg {
    id = 986,
    groupid = 148,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "到我身旁的告示栏去看看，你们会明白。"
    };
getRow(987)->
    #show2Cfg {
    id = 987,
    groupid = 148,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1
    };
getRow(988)->
    #show2Cfg {
    id = 988,
    groupid = 149,
    taskname = "国王的悬赏",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "国王陛下最宝贝的女儿突然失踪，现在他正在召集人手四处寻找公主。"
    };
getRow(989)->
    #show2Cfg {
    id = 989,
    groupid = 149,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "光明勇士，我们若能帮助他找到女儿，或许国王陛下会很乐意告诉我们关于魔族和生命石的线索呢！"
    };
getRow(990)->
    #show2Cfg {
    id = 990,
    groupid = 149,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(991)->
    #show2Cfg {
    id = 991,
    groupid = 150,
    taskname = "接受悬赏",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "我就知道你们一定会接受我们国王的悬赏，海之国的宫殿就在前面，你们一直走就能找到。"
    };
getRow(992)->
    #show2Cfg {
    id = 992,
    groupid = 150,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "谢谢你，不过丽莎好奇你为什么要告诉我们这些呢？"
    };
getRow(993)->
    #show2Cfg {
    id = 993,
    groupid = 150,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "额……为国王分忧是我们身为城民的职责，况且贝尔公主那么善良，我们大家都希望她能早日平安回来。"
    };
getRow(994)->
    #show2Cfg {
    id = 994,
    groupid = 150,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "原来如此，等我们找到了贝尔公主，会把你的话转达给她。"
    };
getRow(995)->
    #show2Cfg {
    id = 995,
    groupid = 150,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "谢谢，不过我要提醒你们，在见到国王之前，你们会先见到国王的总管凡卡大人，想顺利见到国王陛下，你们一定要努力想办法让凡卡大人高兴。"
    };
getRow(996)->
    #show2Cfg {
    id = 996,
    groupid = 150,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1
    };
getRow(997)->
    #show2Cfg {
    id = 997,
    groupid = 151,
    taskname = "准备礼物",
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "凡卡大人非常喜欢收集精美的宝石，不久前他却丢失了一块贵重的宝石，连续几天都闷闷不乐。"
    };
getRow(998)->
    #show2Cfg {
    id = 998,
    groupid = 151,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "丢失的精美宝石……呀，会不会是我们刚刚捡到的那颗？"
    };
getRow(999)->
    #show2Cfg {
    id = 999,
    groupid = 151,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "光明勇士，我们带着刚才捡到的那块宝石去找凡卡大人吧。"
    };
getRow(1000)->
    #show2Cfg {
    id = 1000,
    groupid = 151,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1001)->
    #show2Cfg {
    id = 1001,
    groupid = 152,
    taskname = "前往宫殿",
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "站住，你们是什么人，竟然敢闯入国王的宫殿！"
    };
getRow(1002)->
    #show2Cfg {
    id = 1002,
    groupid = 152,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "凡卡大人不要误会，丽莎刚才捡到了一颗宝石，请问它是你丢失的那颗吗？"
    };
getRow(1003)->
    #show2Cfg {
    id = 1003,
    groupid = 152,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "它在哪？快点交出来。"
    };
getRow(1004)->
    #show2Cfg {
    id = 1004,
    groupid = 152,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1
    };
getRow(1005)->
    #show2Cfg {
    id = 1005,
    groupid = 153,
    taskname = "凡卡总管",
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "这块宝石你们是从哪里捡到的？"
    };
getRow(1006)->
    #show2Cfg {
    id = 1006,
    groupid = 153,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "嗯，就在入口附近"
    };
getRow(1007)->
    #show2Cfg {
    id = 1007,
    groupid = 153,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "哼，还有其他发现么？"
    };
getRow(1008)->
    #show2Cfg {
    id = 1008,
    groupid = 153,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "没有了，其他的丽莎什么也没看到……"
    };
getRow(1009)->
    #show2Cfg {
    id = 1009,
    groupid = 153,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "你们两个人行径可疑，哼，卫兵们给我拿下！"
    };
getRow(1010)->
    #show2Cfg {
    id = 1010,
    groupid = 153,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1
    };
getRow(1011)->
    #show2Cfg {
    id = 1011,
    groupid = 154,
    taskname = "愤怒的丽莎",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "总管大人好不讲理，丽莎好心归还你丢失的宝石，你不领情也就算了，还唤来卫兵抓丽莎，丽莎生气了！"
    };
getRow(1012)->
    #show2Cfg {
    id = 1012,
    groupid = 154,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "啊！！这是……露娜之力。"
    };
getRow(1013)->
    #show2Cfg {
    id = 1013,
    groupid = 154,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "原来你们是露娜女神的手下，刚才是场误会……你们来应该是想见到我们的国王陛下吧，他就在大殿内。"
    };
getRow(1014)->
    #show2Cfg {
    id = 1014,
    groupid = 154,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1
    };
getRow(1015)->
    #show2Cfg {
    id = 1015,
    groupid = 155,
    taskname = "海洋国国王",
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "光明勇士，欢迎你们来到海洋之心。"
    };
getRow(1016)->
    #show2Cfg {
    id = 1016,
    groupid = 155,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "咦？国王陛下，你居然认得光明勇士。"
    };
getRow(1017)->
    #show2Cfg {
    id = 1017,
    groupid = 155,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "呵呵呵，你们在到达入口地带时我就查觉到了露娜之力，所以我一直在等待你们到来。"
    };
getRow(1018)->
    #show2Cfg {
    id = 1018,
    groupid = 155,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "国王陛下，我们得知你的公主失踪了，我们愿意帮助您找回公主。"
    };
getRow(1019)->
    #show2Cfg {
    id = 1019,
    groupid = 155,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "找回公主的任务十分艰难，在你们行动前，不妨让我来考验你们一番。"
    };
getRow(1020)->
    #show2Cfg {
    id = 1020,
    groupid = 155,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1
    };
getRow(1021)->
    #show2Cfg {
    id = 1021,
    groupid = 156,
    taskname = "真言",
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "光明勇士，其实贝尔的失踪是我故意安排的"
    };
getRow(1022)->
    #show2Cfg {
    id = 1022,
    groupid = 156,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "啊？为什么！"
    };
getRow(1023)->
    #show2Cfg {
    id = 1023,
    groupid = 156,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "海洋之城内混入魔族，他们以贝尔的安全来胁迫我交出生命石。我与贝尔自然不肯，所以让贝尔连夜离开皇宫，到外面安全的地方躲起来。"
    };
getRow(1024)->
    #show2Cfg {
    id = 1024,
    groupid = 156,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "可是贝尔公主到了外面要是被魔族找到了，岂不是更危险？"
    };
getRow(1025)->
    #show2Cfg {
    id = 1025,
    groupid = 156,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "我的女儿是个勇敢的公主，她有保护自己的能力，我让她离开一方面是不想被魔族威胁，另一方面也是希望她能在外面寻找对抗魔族的办法。"
    };
getRow(1026)->
    #show2Cfg {
    id = 1026,
    groupid = 156,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1
    };
getRow(1027)->
    #show2Cfg {
    id = 1027,
    groupid = 157,
    taskname = "合作",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "国王陛下，我们能为您做什么呢？"
    };
getRow(1028)->
    #show2Cfg {
    id = 1028,
    groupid = 157,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "我赠送你们一颗珍珠，贝尔见到了便能相信你们是真正的伙伴，我请求你们一起帮助贝尔找到城中隐藏的魔族，保护海洋城民的安全！"
    };
getRow(1029)->
    #show2Cfg {
    id = 1029,
    groupid = 157,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "好，丽莎答应你！"
    };
getRow(1030)->
    #show2Cfg {
    id = 1030,
    groupid = 157,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1031)->
    #show2Cfg {
    id = 1031,
    groupid = 158,
    taskname = "暂别国王",
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "拜托了你们，勇敢的年轻人！"
    };
getRow(1032)->
    #show2Cfg {
    id = 1032,
    groupid = 158,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "我们一定会帮助你们的。"
    };
getRow(1033)->
    #show2Cfg {
    id = 1033,
    groupid = 158,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "城中的达达守卫和玛丽夫人都是值得信赖的伙伴，你们有什么困难可以去寻找他们帮忙。"
    };
getRow(1034)->
    #show2Cfg {
    id = 1034,
    groupid = 158,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1
    };
getRow(1035)->
    #show2Cfg {
    id = 1035,
    groupid = 159,
    taskname = "威胁",
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "你们接受了国王的悬赏，去寻找我们的贝尔公主？"
    };
getRow(1036)->
    #show2Cfg {
    id = 1036,
    groupid = 159,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "是的，总管大人，您能为我们提供些关于公主的线索么？"
    };
getRow(1037)->
    #show2Cfg {
    id = 1037,
    groupid = 159,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "没有，不过我要提醒你们，若不能尽快找到贝尔公主，即便你们不是海洋之城的城民，我也会制裁你们的！"
    };
getRow(1038)->
    #show2Cfg {
    id = 1038,
    groupid = 159,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "哼，好大的口气，不过丽莎一定会找到公主的。"
    };
getRow(1039)->
    #show2Cfg {
    id = 1039,
    groupid = 159,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1040)->
    #show2Cfg {
    id = 1040,
    groupid = 160,
    taskname = "打探",
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "嗨，你们似乎是从王宫里出来的吧，国王的悬赏你们接受了么？"
    };
getRow(1041)->
    #show2Cfg {
    id = 1041,
    groupid = 160,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "嗯，瑞斯先生，丽莎想请你帮一个忙。"
    };
getRow(1042)->
    #show2Cfg {
    id = 1042,
    groupid = 160,
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "只要你们付出的价钱让我高兴，一切好说。"
    };
getRow(1043)->
    #show2Cfg {
    id = 1043,
    groupid = 160,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "您知道玛丽夫人在哪么？"
    };
getRow(1044)->
    #show2Cfg {
    id = 1044,
    groupid = 160,
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "当然，玛丽夫人可是海洋城有名的女士之一，不过她和凡卡很像，都喜欢收集精致的东西。"
    };
getRow(1045)->
    #show2Cfg {
    id = 1045,
    groupid = 160,
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1
    };
getRow(1046)->
    #show2Cfg {
    id = 1046,
    groupid = 161,
    taskname = "美人玛丽",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "你好，玛丽夫人。"
    };
getRow(1047)->
    #show2Cfg {
    id = 1047,
    groupid = 161,
    npcid = 3113,
    emotion = 1,
    name = "玛丽",
    side = 1,
    content = "小姑娘，请叫我美人玛丽……"
    };
getRow(1048)->
    #show2Cfg {
    id = 1048,
    groupid = 161,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "美人玛丽……国王陛下说你是他信赖的伙伴，因此我们来寻你，请夫人你为我们提供一些贝尔公主的线索。"
    };
getRow(1049)->
    #show2Cfg {
    id = 1049,
    groupid = 161,
    npcid = 3113,
    emotion = 1,
    name = "玛丽",
    side = 1,
    content = "小姑娘，求人帮忙是需要诚意的。"
    };
getRow(1050)->
    #show2Cfg {
    id = 1050,
    groupid = 161,
    npcid = 3113,
    emotion = 1,
    name = "玛丽",
    side = 1
    };
getRow(1051)->
    #show2Cfg {
    id = 1051,
    groupid = 162,
    taskname = "玛丽的请求",
    npcid = 3113,
    emotion = 1,
    name = "玛丽",
    side = 1,
    content = "上面是我饲养的灵宠，或许是因为魔气的缘故把，它们变得很暴躁。我不喜欢它们粗暴的样子，你能替我调教它们么？"
    };
getRow(1052)->
    #show2Cfg {
    id = 1052,
    groupid = 162,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "好啊，玛丽夫人……哦不，是美人玛丽。"
    };
getRow(1053)->
    #show2Cfg {
    id = 1053,
    groupid = 162,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1054)->
    #show2Cfg {
    id = 1054,
    groupid = 163,
    taskname = "暴躁的灵宠",
    npcid = 3118,
    emotion = 1,
    name = "灵宠",
    side = 1,
    content = "呼呼，受不了，玛丽总逼我们叫她美人，真的好讨厌啊！"
    };
getRow(1055)->
    #show2Cfg {
    id = 1055,
    groupid = 163,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "丽莎能理解你们的心情。"
    };
getRow(1056)->
    #show2Cfg {
    id = 1056,
    groupid = 163,
    npcid = 3118,
    emotion = 1,
    name = "灵宠",
    side = 1,
    content = "嘘嘘，她脾气怪的很，要是被她听到的话，我们又要受罪了。"
    };
getRow(1057)->
    #show2Cfg {
    id = 1057,
    groupid = 163,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "……小可怜们。"
    };
getRow(1058)->
    #show2Cfg {
    id = 1058,
    groupid = 163,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1059)->
    #show2Cfg {
    id = 1059,
    groupid = 164,
    taskname = "线索",
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "贝尔公主其实是个强大的魔法师，就算独自一人流落在外也不会有什么危险，唯一不足的就是没有我漂亮。"
    };
getRow(1060)->
    #show2Cfg {
    id = 1060,
    groupid = 164,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "咳咳，玛丽夫人，事关重大，丽莎需要知道关于贝尔公主的消息，请您在提供一些有用的线索吧。"
    };
getRow(1061)->
    #show2Cfg {
    id = 1061,
    groupid = 164,
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "是美人玛丽，五天前，贝尔公主曾乔装打扮来到我拿走一些药物。"
    };
getRow(1062)->
    #show2Cfg {
    id = 1062,
    groupid = 164,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "啊，她受伤了？！"
    };
getRow(1063)->
    #show2Cfg {
    id = 1063,
    groupid = 164,
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "不，她拿走是一些炼制魔药的原材料，应该是为了对抗魔族而用。"
    };
getRow(1064)->
    #show2Cfg {
    id = 1064,
    groupid = 164,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "魔药材料，有了，光明勇士，丽莎有个计划，我们现在行动起来吧。"
    };
getRow(1065)->
    #show2Cfg {
    id = 1065,
    groupid = 164,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1066)->
    #show2Cfg {
    id = 1066,
    groupid = 165,
    taskname = "达达的援助",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "别担心，我来帮你们"
    };
getRow(1067)->
    #show2Cfg {
    id = 1067,
    groupid = 165,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "达达，小心！"
    };
getRow(1068)->
    #show2Cfg {
    id = 1068,
    groupid = 166,
    taskname = "再遇达达",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "嘿，这里的魔族似乎对你们很感兴趣呢！"
    };
getRow(1069)->
    #show2Cfg {
    id = 1069,
    groupid = 166,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "好讨厌啊。这里的魔族盯上了我们。"
    };
getRow(1070)->
    #show2Cfg {
    id = 1070,
    groupid = 166,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "这也说明现在的海洋城并不安全啊，处处都有魔族的爪牙，你们要是能帮助国王陛下赶走魔族，就是海洋国的大恩人啊。到时候想要什么，国王陛下都会满足你们的。"
    };
getRow(1071)->
    #show2Cfg {
    id = 1071,
    groupid = 166,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "咦，对了。丽莎记得你也是深受国王陛下信赖的人，快点告诉丽莎，贝尔公主在哪里？不许隐瞒哦！"
    };
getRow(1072)->
    #show2Cfg {
    id = 1072,
    groupid = 166,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1073)->
    #show2Cfg {
    id = 1073,
    groupid = 167,
    taskname = "引路",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "我们的公主既聪明又勇敢，她不仅在收集对抗魔族的用具，还组建了一支军队。等到时机成熟，我们便于公主一起驱赶魔族！"
    };
getRow(1074)->
    #show2Cfg {
    id = 1074,
    groupid = 167,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "哎哎，说重点，贝尔公主在哪？"
    };
getRow(1075)->
    #show2Cfg {
    id = 1075,
    groupid = 167,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "公主用法术伪装了自己原来的样貌，你们往前走或许会遇到一个可爱的小女孩，她就是贝尔公主。"
    };
getRow(1076)->
    #show2Cfg {
    id = 1076,
    groupid = 167,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1
    };
getRow(1077)->
    #show2Cfg {
    id = 1077,
    groupid = 168,
    taskname = "海洋城明珠",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "你好，勇敢的贝尔公主，丽莎终于找到你啦。"
    };
getRow(1078)->
    #show2Cfg {
    id = 1078,
    groupid = 168,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "我才不是什么公主，你们不要胡说八道！"
    };
getRow(1079)->
    #show2Cfg {
    id = 1079,
    groupid = 168,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "哎哎，先别急着否认哦，丽莎给你看这个！"
    };
getRow(1080)->
    #show2Cfg {
    id = 1080,
    groupid = 168,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1081)->
    #show2Cfg {
    id = 1081,
    groupid = 169,
    taskname = "相信",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "这是父亲的珍珠，你们是？"
    };
getRow(1082)->
    #show2Cfg {
    id = 1082,
    groupid = 169,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "别激动，丽莎和光明勇士是来帮助你们的，我们和你一样非常痛恨魔族。"
    };
getRow(1083)->
    #show2Cfg {
    id = 1083,
    groupid = 169,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "原来如此，我父亲现在的状况如何？"
    };
getRow(1084)->
    #show2Cfg {
    id = 1084,
    groupid = 169,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "他很好，公主不用担心。对了，我们从玛丽夫人那里得知你在寻找驱魔的原材料。这些就全都送给你好啦。"
    };
getRow(1085)->
    #show2Cfg {
    id = 1085,
    groupid = 169,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1086)->
    #show2Cfg {
    id = 1086,
    groupid = 170,
    taskname = "礼物",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "谢谢你们。"
    };
getRow(1087)->
    #show2Cfg {
    id = 1087,
    groupid = 170,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1
    };
getRow(1088)->
    #show2Cfg {
    id = 1088,
    groupid = 171,
    taskname = "驱魔药",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "你们怎么会驱魔药的制作方法？"
    };
getRow(1089)->
    #show2Cfg {
    id = 1089,
    groupid = 171,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "嘻，丽莎在东城郊平原认识了一位了不起的草药学家，他给了丽莎一张制作驱魔药的单子。如果你想学习驱魔药的制作方法，丽莎可以教你哦。"
    };
getRow(1090)->
    #show2Cfg {
    id = 1090,
    groupid = 171,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "太好了，贝尔要制作很多很多的驱魔药来救大家。"
    };
getRow(1091)->
    #show2Cfg {
    id = 1091,
    groupid = 171,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1
    };
getRow(1092)->
    #show2Cfg {
    id = 1092,
    groupid = 172,
    taskname = "隐情",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "既然你们是朋友，那么我就把最近收集到的消息统统告诉你们。"
    };
getRow(1093)->
    #show2Cfg {
    id = 1093,
    groupid = 172,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "好啊，请公主畅所欲言。"
    };
getRow(1094)->
    #show2Cfg {
    id = 1094,
    groupid = 172,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "如今海洋之城进入了如此多的魔族，正是因为有海洋城内部的人与魔族暗中勾结。"
    };
getRow(1095)->
    #show2Cfg {
    id = 1095,
    groupid = 172,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "哼，是谁那么可恶！！！"
    };
getRow(1096)->
    #show2Cfg {
    id = 1096,
    groupid = 172,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "就是父亲最信赖的同伴，凡卡叔叔。"
    };
getRow(1097)->
    #show2Cfg {
    id = 1097,
    groupid = 172,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1
    };
getRow(1098)->
    #show2Cfg {
    id = 1098,
    groupid = 173,
    taskname = "幕后黑手",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "竟然是他！哼，他脾气很坏很坏，丽莎一开始就很讨厌他。"
    };
getRow(1099)->
    #show2Cfg {
    id = 1099,
    groupid = 173,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "起初我不相信这个事实，毕竟凡卡叔叔效忠父亲多年。直到那一晚我亲眼看到他与魔族成员交谈，我才不得不接受了这个事实。"
    };
getRow(1100)->
    #show2Cfg {
    id = 1100,
    groupid = 173,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "这个坏蛋！贝尔公主，我们不如马上就去揭穿他的真面目！"
    };
getRow(1101)->
    #show2Cfg {
    id = 1101,
    groupid = 173,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "不行，我的父亲还在皇宫里，他不久前受了重伤，现在无法离开皇宫。"
    };
getRow(1102)->
    #show2Cfg {
    id = 1102,
    groupid = 173,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "那我们该怎么办呢？"
    };
getRow(1103)->
    #show2Cfg {
    id = 1103,
    groupid = 173,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "我的侍女伊莲娜正在训练灵兽，我想借助灵兽的力量攻打凡卡的军队并救出父亲。"
    };
getRow(1104)->
    #show2Cfg {
    id = 1104,
    groupid = 173,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1
    };
getRow(1105)->
    #show2Cfg {
    id = 1105,
    groupid = 174,
    taskname = "寻找伊莲娜",
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "这些都是公主精心挑选出的灵兽，我要好好训练它们。等它们在长大一些，就能成为我们得力助手。"
    };
getRow(1106)->
    #show2Cfg {
    id = 1106,
    groupid = 174,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "奇怪，为什么丽莎会在这些灵兽身上感到一些魔气？"
    };
getRow(1107)->
    #show2Cfg {
    id = 1107,
    groupid = 174,
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "啊！怎么这会这样？"
    };
getRow(1108)->
    #show2Cfg {
    id = 1108,
    groupid = 174,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "魔族进入海洋之城的数量繁多，同时也带来了大量的魔气。这些灵兽尚且幼小，对魔气的抵抗较弱。不过别担心，看丽莎的。"
    };
getRow(1109)->
    #show2Cfg {
    id = 1109,
    groupid = 174,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1110)->
    #show2Cfg {
    id = 1110,
    groupid = 175,
    taskname = "伊莲娜的请求",
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "多亏你们及时发现灵兽的状况，否则我太对不起贝尔公主和国王陛下了。"
    };
getRow(1111)->
    #show2Cfg {
    id = 1111,
    groupid = 175,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "小事一桩，下次注意点啦"
    };
getRow(1112)->
    #show2Cfg {
    id = 1112,
    groupid = 175,
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "嗯，有一件事我想拜托你们，这些灵兽非常调皮顽劣，你们能帮我驯化它们么？"
    };
getRow(1113)->
    #show2Cfg {
    id = 1113,
    groupid = 175,
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1
    };
getRow(1114)->
    #show2Cfg {
    id = 1114,
    groupid = 176,
    taskname = "驯化灵兽",
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "这些灵兽身上掉落的绒毛是炼化武器的好材料，作为公主殿下的朋友，你们可以从它们身上收集一些。"
    };
getRow(1115)->
    #show2Cfg {
    id = 1115,
    groupid = 176,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "谢谢伊莲娜。"
    };
getRow(1116)->
    #show2Cfg {
    id = 1116,
    groupid = 176,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1117)->
    #show2Cfg {
    id = 1117,
    groupid = 177,
    taskname = "公主的计划",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "伊莲娜驯化的灵兽还需要一段时间才能派上用场，在发动战争之前，我请你们在去趟王宫确认一下我父亲的情况。另外，一定要告诉父亲，凡卡的真面目。"
    };
getRow(1118)->
    #show2Cfg {
    id = 1118,
    groupid = 177,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "没问题，可是如果那个凡卡真的背叛了国王陛下，那么国王陛下岂不是很危险。"
    };
getRow(1119)->
    #show2Cfg {
    id = 1119,
    groupid = 177,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "在没有得到父亲手上的生命石之前，凡卡不会也不敢对父亲下毒手的！"
    };
getRow(1120)->
    #show2Cfg {
    id = 1120,
    groupid = 177,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "啊，那个坏蛋也想得到生命石？"
    };
getRow(1121)->
    #show2Cfg {
    id = 1121,
    groupid = 177,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "生命石是海洋城的至宝，有了生命石力量的支撑，海洋城民才能安居到现在。如果生命石被其他人拿走了，那么对海洋城将是一场无法形容的灾难……"
    };
getRow(1122)->
    #show2Cfg {
    id = 1122,
    groupid = 177,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "……丽莎知道了，现在丽莎和光明勇士马上返回皇宫看看国王陛下的情况。"
    };
getRow(1123)->
    #show2Cfg {
    id = 1123,
    groupid = 177,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1124)->
    #show2Cfg {
    id = 1124,
    groupid = 178,
    taskname = "返回王宫",
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "你们找到贝尔了么？"
    };
getRow(1125)->
    #show2Cfg {
    id = 1125,
    groupid = 178,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "是的，夫人。哦不，是美人玛丽。"
    };
getRow(1126)->
    #show2Cfg {
    id = 1126,
    groupid = 178,
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "那为什么公主没有和你们在一起？"
    };
getRow(1127)->
    #show2Cfg {
    id = 1127,
    groupid = 178,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "公主要我们先发回王宫看看国王陛下的情况。"
    };
getRow(1128)->
    #show2Cfg {
    id = 1128,
    groupid = 178,
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "别回去了，凡卡总管已经代替国王发布公告，国王病重修养，不想见到任何人。"
    };
getRow(1129)->
    #show2Cfg {
    id = 1129,
    groupid = 178,
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1
    };
getRow(1130)->
    #show2Cfg {
    id = 1130,
    groupid = 179,
    taskname = "惊变",
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "国王突然宣布病重修养，这实在太奇怪了！我们的贝尔公主又下落不明，海洋城真的要完蛋了么？"
    };
getRow(1131)->
    #show2Cfg {
    id = 1131,
    groupid = 179,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "闭上你的乌鸦嘴，你再胡说八道，丽莎可要生气了！"
    };
getRow(1132)->
    #show2Cfg {
    id = 1132,
    groupid = 179,
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "你这个小可爱脾气还挺大，你这么在意国王陛下，怎么不进到王宫里面看看。"
    };
getRow(1133)->
    #show2Cfg {
    id = 1133,
    groupid = 179,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "哼，丽莎在想该怎么用不打架的方法进入王宫呢。"
    };
getRow(1134)->
    #show2Cfg {
    id = 1134,
    groupid = 179,
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "……我有个主意，嘻嘻嘻！~你们趁着王宫侍卫换班的时间打晕他们，从那里拿到侍卫的衣服就可以混入王宫了。"
    };
getRow(1135)->
    #show2Cfg {
    id = 1135,
    groupid = 179,
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1
    };
getRow(1136)->
    #show2Cfg {
    id = 1136,
    groupid = 180,
    taskname = "易装",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "咳咳，光明勇士，我们快点穿上这套衣服进入王宫。确认国王平安无事，就马上离开这里。"
    };
getRow(1137)->
    #show2Cfg {
    id = 1137,
    groupid = 181,
    taskname = "再入王宫",
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "你们两个是哪个卫队的成员？为什么不与自己的同伴在一块？"
    };
getRow(1138)->
    #show2Cfg {
    id = 1138,
    groupid = 181,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "咳咳……凡卡大人别生气，我们刚刚发现王宫外似乎有人在暗中窥伺，为了确认一下，就急忙出去了。"
    };
getRow(1139)->
    #show2Cfg {
    id = 1139,
    groupid = 181,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "有什么发现么？"
    };
getRow(1140)->
    #show2Cfg {
    id = 1140,
    groupid = 181,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "额，没有，什么也没有。"
    };
getRow(1141)->
    #show2Cfg {
    id = 1141,
    groupid = 181,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1142)->
    #show2Cfg {
    id = 1142,
    groupid = 182,
    taskname = "惩罚",
    npcid = 3119,
    emotion = 1,
    name = "海之国侍卫",
    side = 1,
    content = "来……人，有……额！"
    };
getRow(1143)->
    #show2Cfg {
    id = 1143,
    groupid = 182,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "乖乖给丽莎睡上一觉吧。可不能让你坏了大事。"
    };
getRow(1144)->
    #show2Cfg {
    id = 1144,
    groupid = 182,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1145)->
    #show2Cfg {
    id = 1145,
    groupid = 183,
    taskname = "再遇国王",
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "你们终于回来了，贝尔找到了么？"
    };
getRow(1146)->
    #show2Cfg {
    id = 1146,
    groupid = 183,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "国王陛下，贝尔公主很勇敢，她发现了幕后主使，就是凡卡这个大坏蛋。"
    };
getRow(1147)->
    #show2Cfg {
    id = 1147,
    groupid = 183,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "唉……凡卡他，他跟随我多年，要不是他亲自带人软禁我，我实在无法相信他竟然会背叛我。"
    };
getRow(1148)->
    #show2Cfg {
    id = 1148,
    groupid = 183,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "请您放心，我们一定会解救您的。对了，还请您告诉丽莎，生命石与海洋城的安危有什么关系呢？"
    };
getRow(1149)->
    #show2Cfg {
    id = 1149,
    groupid = 183,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1150)->
    #show2Cfg {
    id = 1150,
    groupid = 184,
    taskname = "真相",
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "这座海洋城实际上是一个火山口，需要生命石的力量来抑制，一旦这里没有了生命石则会引起火山迸发，那么海洋城将彻底消失，到那时任何城民和生灵都没有了生存的希望。"
    };
getRow(1151)->
    #show2Cfg {
    id = 1151,
    groupid = 184,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "原来如此，贝尔公主告诉丽莎，她亲眼看到凡卡与魔族接触。其实魔族一直在寻找生命石，它们的目的是想帮助阿尔萨德解除女神的封印。无论如何，您千万不能交出生命之石。"
    };
getRow(1152)->
    #show2Cfg {
    id = 1152,
    groupid = 184,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "阿尔萨德？那个大魔头！不论如何，一定要阻止他们！"
    };
getRow(1153)->
    #show2Cfg {
    id = 1153,
    groupid = 184,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "公主的侍女正在驯化灵兽，等那些灵兽在强大一些，我们就会带着灵兽来解救您。"
    };
getRow(1154)->
    #show2Cfg {
    id = 1154,
    groupid = 184,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "灵兽？！凡卡也在暗中培育魔灵兽，你们要小心！"
    };
getRow(1155)->
    #show2Cfg {
    id = 1155,
    groupid = 184,
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1
    };
getRow(1156)->
    #show2Cfg {
    id = 1156,
    groupid = 185,
    taskname = "野心",
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "你们休想离开这里！"
    };
getRow(1157)->
    #show2Cfg {
    id = 1157,
    groupid = 185,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "你这个大坏蛋竟然与魔族合作，丽莎讨厌你！"
    };
getRow(1158)->
    #show2Cfg {
    id = 1158,
    groupid = 185,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "你们只要归顺于我，待我成为新的国王，必将重用你们！"
    };
getRow(1159)->
    #show2Cfg {
    id = 1159,
    groupid = 185,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "休想！"
    };
getRow(1160)->
    #show2Cfg {
    id = 1160,
    groupid = 185,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1161)->
    #show2Cfg {
    id = 1161,
    groupid = 186,
    taskname = "阻拦",
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "你们别想跑掉，看我的魔灵兽！"
    };
getRow(1162)->
    #show2Cfg {
    id = 1162,
    groupid = 186,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "啊！你居然敢在王宫里圈养魔兽，你真是个疯子！"
    };
getRow(1163)->
    #show2Cfg {
    id = 1163,
    groupid = 186,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1164)->
    #show2Cfg {
    id = 1164,
    groupid = 187,
    taskname = "藏身",
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "发生了什么事，你们怎么这么狼狈？"
    };
getRow(1165)->
    #show2Cfg {
    id = 1165,
    groupid = 187,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "都是凡卡那个大坏蛋，他不仅魔灵兽咬丽莎，还派凶恶的魔族追杀我们。"
    };
getRow(1166)->
    #show2Cfg {
    id = 1166,
    groupid = 187,
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "你们竟然得罪了凡卡大人，还是快点离开我这里吧，不然我可要跟着你们遭殃啊！"
    };
getRow(1167)->
    #show2Cfg {
    id = 1167,
    groupid = 187,
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1
    };
getRow(1168)->
    #show2Cfg {
    id = 1168,
    groupid = 188,
    taskname = "逃跑",
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "虽然你们很狼狈，但是我还是要赞叹你们的勇气。"
    };
getRow(1169)->
    #show2Cfg {
    id = 1169,
    groupid = 188,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "谢谢玛丽夫人的安慰……"
    };
getRow(1170)->
    #show2Cfg {
    id = 1170,
    groupid = 188,
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "要叫我美人玛丽，你们的动静如此之大，凡卡那个丑八怪一定会派人全城的寻找你们，你们还是尽快与公主汇合，她可以帮助你们的。"
    };
getRow(1171)->
    #show2Cfg {
    id = 1171,
    groupid = 188,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "谢谢。"
    };
getRow(1172)->
    #show2Cfg {
    id = 1172,
    groupid = 188,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1173)->
    #show2Cfg {
    id = 1173,
    groupid = 189,
    taskname = "失控的灵宠",
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1,
    content = "给你一次报答我的机会，我的灵宠又开始不听话了。这一次它们闹的更凶，就委托你们帮我制服它们。"
    };
getRow(1174)->
    #show2Cfg {
    id = 1174,
    groupid = 189,
    npcid = 3113,
    emotion = 1,
    name = "玛丽夫人",
    side = 1
    };
getRow(1175)->
    #show2Cfg {
    id = 1175,
    groupid = 190,
    taskname = "同伴的关心",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "这一次真的太辛苦你们了。"
    };
getRow(1176)->
    #show2Cfg {
    id = 1176,
    groupid = 190,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "幸好我们的光明勇士给力，否则丽莎真的会被抓住的。"
    };
getRow(1177)->
    #show2Cfg {
    id = 1177,
    groupid = 190,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "我父亲的情况如何？他有没有事？"
    };
getRow(1178)->
    #show2Cfg {
    id = 1178,
    groupid = 190,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "国王陛下只是被软禁，凡卡还没有拿到生命石，国王陛下暂时是安全的。不过，我们要尽快实施营救国王的行动，凡卡那个坏蛋也在暗地里饲养了魔灵兽！"
    };
getRow(1179)->
    #show2Cfg {
    id = 1179,
    groupid = 190,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "什么，得赶快把这个消息告诉伊莲娜！"
    };
getRow(1180)->
    #show2Cfg {
    id = 1180,
    groupid = 190,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1
    };
getRow(1181)->
    #show2Cfg {
    id = 1181,
    groupid = 191,
    taskname = "同伴的担忧",
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "凡卡居然在饲养魔灵兽。该死！"
    };
getRow(1182)->
    #show2Cfg {
    id = 1182,
    groupid = 191,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "伊莲娜姐姐似乎很着急呢，我们饲养的灵兽难道比不过他们么？"
    };
getRow(1183)->
    #show2Cfg {
    id = 1183,
    groupid = 191,
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "魔灵兽天生含带魔气，一般的灵兽根本无法与其抗衡，让我想想该怎么增强灵兽的实力……"
    };
getRow(1184)->
    #show2Cfg {
    id = 1184,
    groupid = 191,
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1
    };
getRow(1185)->
    #show2Cfg {
    id = 1185,
    groupid = 192,
    taskname = "妙计",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "我想到一个削弱魔灵兽的办法。"
    };
getRow(1186)->
    #show2Cfg {
    id = 1186,
    groupid = 192,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "快点说说看！"
    };
getRow(1187)->
    #show2Cfg {
    id = 1187,
    groupid = 192,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "我们掌握了制作驱魔剂的方法，不妨多做一些驱魔剂，再想办法将驱魔剂悄悄的投放到魔灵兽那里去，削弱魔灵兽的实力。"
    };
getRow(1188)->
    #show2Cfg {
    id = 1188,
    groupid = 192,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "这是个不错的注意，丽莎可以做好多驱魔剂，只是我们怎么做才能把驱魔剂投放到魔灵兽那里还不惊动凡卡那个坏蛋呢？"
    };
getRow(1189)->
    #show2Cfg {
    id = 1189,
    groupid = 192,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "不急，你们做好药剂以后交给达达就可以了。"
    };
getRow(1190)->
    #show2Cfg {
    id = 1190,
    groupid = 192,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1
    };
getRow(1191)->
    #show2Cfg {
    id = 1191,
    groupid = 193,
    taskname = "寻找达达",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "公主的计划确实不错，但是需要冒很大的风险。有了！你们跟我去见一个人。"
    };
getRow(1192)->
    #show2Cfg {
    id = 1192,
    groupid = 193,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1
    };
getRow(1193)->
    #show2Cfg {
    id = 1193,
    groupid = 194,
    taskname = "达达的同伴",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "事情就是这样，罗米亚，请你一定要帮助他们！"
    };
getRow(1194)->
    #show2Cfg {
    id = 1194,
    groupid = 194,
    npcid = 3111,
    emotion = 1,
    name = "罗米亚",
    side = 1,
    content = "没问题，说实话我很佩服你们这些勇敢的人。"
    };
getRow(1195)->
    #show2Cfg {
    id = 1195,
    groupid = 194,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "丽莎很高兴你愿意帮助我们，你也是一个勇敢的同伴。"
    };
getRow(1196)->
    #show2Cfg {
    id = 1196,
    groupid = 194,
    npcid = 3111,
    emotion = 1,
    name = "罗米亚",
    side = 1,
    content = "这钥匙可以打开魔灵兽大门，午夜时刻正是魔灵兽睡觉的时候，你们要在最短的时间内投放药剂，然后立即离开那里！"
    };
getRow(1197)->
    #show2Cfg {
    id = 1197,
    groupid = 194,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "丽莎知道了！"
    };
getRow(1198)->
    #show2Cfg {
    id = 1198,
    groupid = 194,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1199)->
    #show2Cfg {
    id = 1199,
    groupid = 195,
    taskname = "狂怒的凡卡",
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "你毁了我魔灵兽，我要杀了你们！"
    };
getRow(1200)->
    #show2Cfg {
    id = 1200,
    groupid = 195,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "你活该，哼！"
    };
getRow(1201)->
    #show2Cfg {
    id = 1201,
    groupid = 195,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1202)->
    #show2Cfg {
    id = 1202,
    groupid = 196,
    taskname = "汇合",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "你们做的太棒了，魔灵兽被彻底消灭，我们有希望将他们赶出海洋城。"
    };
getRow(1203)->
    #show2Cfg {
    id = 1203,
    groupid = 196,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "看到那个凡卡坏蛋起冒烟的样子，丽莎好高兴呢！"
    };
getRow(1204)->
    #show2Cfg {
    id = 1204,
    groupid = 196,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "公主殿下已经准备差不多了，你们过去与她确认一下，大家一起行动营救国王陛下。"
    };
getRow(1205)->
    #show2Cfg {
    id = 1205,
    groupid = 196,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1
    };
getRow(1206)->
    #show2Cfg {
    id = 1206,
    groupid = 197,
    taskname = "公主的誓言",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "忠诚的海洋城民们，我以公主的名义起誓，营救我们的国王，驱赶海洋城的叛徒，重建我们的家园！"
    };
getRow(1207)->
    #show2Cfg {
    id = 1207,
    groupid = 197,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "公主万岁！"
    };
getRow(1208)->
    #show2Cfg {
    id = 1208,
    groupid = 197,
    npcid = 3111,
    emotion = 1,
    name = "罗米亚",
    side = 1,
    content = "公主万岁！"
    };
getRow(1209)->
    #show2Cfg {
    id = 1209,
    groupid = 197,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "哇，贝尔公主好有气势呢，光明勇士，我们也要加油！"
    };
getRow(1210)->
    #show2Cfg {
    id = 1210,
    groupid = 197,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1211)->
    #show2Cfg {
    id = 1211,
    groupid = 198,
    taskname = "灵兽出击",
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "我的灵兽已经驯化完毕，它们可以随同大家一起出击。"
    };
getRow(1212)->
    #show2Cfg {
    id = 1212,
    groupid = 198,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "太好了，有了灵兽出战可以帮助我们很多呢。"
    };
getRow(1213)->
    #show2Cfg {
    id = 1213,
    groupid = 198,
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "过奖了，我要谢谢你们及时做出了驱魔药剂，不然这些小家伙恐怕无法顺利长大。"
    };
getRow(1214)->
    #show2Cfg {
    id = 1214,
    groupid = 198,
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1
    };
getRow(1215)->
    #show2Cfg {
    id = 1215,
    groupid = 199,
    taskname = "不详的预感",
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "恩……"
    };
getRow(1216)->
    #show2Cfg {
    id = 1216,
    groupid = 199,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "贝尔公主，你没事吧？"
    };
getRow(1217)->
    #show2Cfg {
    id = 1217,
    groupid = 199,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "我有些担心，凡卡那个家伙与魔族合作不仅仅是为了得到王位，或许他还有更大的野心！"
    };
getRow(1218)->
    #show2Cfg {
    id = 1218,
    groupid = 199,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "！！是什么？"
    };
getRow(1219)->
    #show2Cfg {
    id = 1219,
    groupid = 199,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "禁地一带，那里是海洋城生命之核也就是生命石的所在地，除了国王没有人有资格进入那里。我担心凡卡会趁混乱引入魔族去那。"
    };
getRow(1220)->
    #show2Cfg {
    id = 1220,
    groupid = 199,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "那可不行，丽莎要和光明勇士去阻止他们。"
    };
getRow(1221)->
    #show2Cfg {
    id = 1221,
    groupid = 199,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1222)->
    #show2Cfg {
    id = 1222,
    groupid = 1200,
    taskname = "前往禁地",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "罗米亚看守的地方就是禁地一带，那里十分危险，你们要小心。"
    };
getRow(1223)->
    #show2Cfg {
    id = 1223,
    groupid = 1200,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "知道了，你也要注意保护自己。"
    };
getRow(1224)->
    #show2Cfg {
    id = 1224,
    groupid = 1200,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1225)->
    #show2Cfg {
    id = 1225,
    groupid = 1201,
    taskname = "恶战前的准备",
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "哈哈哈，海洋城要遇上一场前所为有的战斗，我可要发大财了！"
    };
getRow(1226)->
    #show2Cfg {
    id = 1226,
    groupid = 1201,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "可恶的家伙……光明勇士马上要去收拾凡卡那个坏蛋了。你这里有没有让我们补充体力的食物呢？"
    };
getRow(1227)->
    #show2Cfg {
    id = 1227,
    groupid = 1201,
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1,
    content = "当然，只是价格么，要比往常高了点~哈哈哈。"
    };
getRow(1228)->
    #show2Cfg {
    id = 1228,
    groupid = 1201,
    npcid = 3112,
    emotion = 1,
    name = "瑞斯",
    side = 1
    };
getRow(1229)->
    #show2Cfg {
    id = 1229,
    groupid = 1202,
    taskname = "进入禁地",
    npcid = 3111,
    emotion = 1,
    name = "罗米亚",
    side = 1,
    content = "没错，我背后看守的地方就是海洋城的禁地一带，除了国王陛下任何人都不能进入这里。"
    };
getRow(1230)->
    #show2Cfg {
    id = 1230,
    groupid = 1202,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "凡卡现在很可能就在里面，请你让我们进去，光明勇士要去阻止凡卡。"
    };
getRow(1231)->
    #show2Cfg {
    id = 1231,
    groupid = 1202,
    npcid = 3111,
    emotion = 1,
    name = "罗米亚",
    side = 1,
    content = "这……好吧。一切就拜托你们了。禁地中很可能有极其难对付的灵兽，若需要帮忙就马上召唤向大家。"
    };
getRow(1232)->
    #show2Cfg {
    id = 1232,
    groupid = 1202,
    npcid = 3111,
    emotion = 1,
    name = "罗米亚",
    side = 1
    };
getRow(1233)->
    #show2Cfg {
    id = 1233,
    groupid = 1203,
    taskname = "禁地恶龙",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "住手，不准在靠近生命石。"
    };
getRow(1234)->
    #show2Cfg {
    id = 1234,
    groupid = 1203,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "哼，捣乱的来了！"
    };
getRow(1235)->
    #show2Cfg {
    id = 1235,
    groupid = 1204,
    taskname = "禁地魔灵兽",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "咦？怎么还有魔灵兽。"
    };
getRow(1236)->
    #show2Cfg {
    id = 1236,
    groupid = 1204,
    npcid = 3116,
    emotion = 1,
    name = "凡卡",
    side = 1,
    content = "哈哈哈，这是我给你们这些好管闲事的人一份礼物，乖乖成为魔灵兽的食物吧！"
    };
getRow(1237)->
    #show2Cfg {
    id = 1237,
    groupid = 1205,
    taskname = "禁地人蛇姬",
    npcid = 3117,
    emotion = 1,
    name = "爱德华",
    side = 1,
    content = "贝尔！从今往后你就是海洋城的主人，不要让爸爸失望！"
    };
getRow(1238)->
    #show2Cfg {
    id = 1238,
    groupid = 1205,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "父亲，你要做什么？！不！！！！"
    };
getRow(1239)->
    #show2Cfg {
    id = 1239,
    groupid = 1205,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "国王陛下！"
    };
getRow(1240)->
    #show2Cfg {
    id = 1240,
    groupid = 1205,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1241)->
    #show2Cfg {
    id = 1241,
    groupid = 1206,
    taskname = "告别达达",
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "国王陛下他……他是海洋城最伟大的国王！"
    };
getRow(1242)->
    #show2Cfg {
    id = 1242,
    groupid = 1206,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "呜！丽莎没想到事情会变成这样。"
    };
getRow(1243)->
    #show2Cfg {
    id = 1243,
    groupid = 1206,
    npcid = 3110,
    emotion = 1,
    name = "达达",
    side = 1,
    content = "你们已经尽力了，作为海洋城的城民我要由衷的感谢你们出手帮忙。"
    };
getRow(1244)->
    #show2Cfg {
    id = 1244,
    groupid = 1206,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "现在，我们要离开这里了，后会有期。"
    };
getRow(1245)->
    #show2Cfg {
    id = 1245,
    groupid = 1206,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1246)->
    #show2Cfg {
    id = 1246,
    groupid = 1207,
    taskname = "告别贝尔",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "对不起，丽莎和光明勇士还是没能解救国王……对不起。"
    };
getRow(1247)->
    #show2Cfg {
    id = 1247,
    groupid = 1207,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "父亲为海洋国牺牲生命，他虽然离开了我以及海洋城城民，但是他永远活在我们的心里。"
    };
getRow(1248)->
    #show2Cfg {
    id = 1248,
    groupid = 1207,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "嗯，一定是这样的，贝尔公主，哦不，贝尔女王，你一定要做一个优秀的女王，不要辜负国王陛下的期望哦！"
    };
getRow(1249)->
    #show2Cfg {
    id = 1249,
    groupid = 1207,
    npcid = 3114,
    emotion = 1,
    name = "贝尔公主",
    side = 1,
    content = "我一定会的，你们是要离开这了么？我以海洋城女王的名义为你们祝福，你们永远是海洋城民的朋友，海洋城永远欢迎你们。"
    };
getRow(1250)->
    #show2Cfg {
    id = 1250,
    groupid = 1207,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "谢谢女王，请你和城民多多保重，我们要出发了。"
    };
getRow(1251)->
    #show2Cfg {
    id = 1251,
    groupid = 1207,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(1252)->
    #show2Cfg {
    id = 1252,
    groupid = 1208,
    taskname = "离开海洋之心",
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "前面就是出口，海洋城的下面是精灵故土，那里有很多精灵族人。祝你们一切顺利。"
    };
getRow(1253)->
    #show2Cfg {
    id = 1253,
    groupid = 1208,
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1,
    content = "伊莲娜姐姐好好保护贝尔女王，丽莎以后会来看大家的。"
    };
getRow(1254)->
    #show2Cfg {
    id = 1254,
    groupid = 1208,
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1,
    content = "一定要来啊，贝尔公主，哦不，是贝尔女王还有大家都欢迎你们再来。"
    };
getRow(1255)->
    #show2Cfg {
    id = 1255,
    groupid = 1208,
    npcid = 3115,
    emotion = 1,
    name = "伊莲娜",
    side = 1
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
    content = "年轻的冒险者，感谢你为家族公会做的一切！！"
    };
getRow(6001)->
    #show2Cfg {
    id = 6001,
    groupid = 6000,
    taskname = "每日任务完成",
    npcid = 230,
    emotion = 1,
    name = "拉斐尔·孟",
    side = 1
    };
getRow(7000)->
    #show2Cfg {
    id = 7000,
    groupid = 7000,
    taskname = "支线任务",
    npcid = 3007,
    emotion = 1,
    name = "丽莎",
    side = 1
    };
getRow(10000)->
    #show2Cfg {
    id = 10000,
    groupid = 10000,
    taskname = "海盗王的宝藏1",
    npcid = 500,
    emotion = 1,
    name = "Mr.王",
    side = 1,
    content = "从大海贼时代开始，海盗王的宝藏传说便一直流传在整个蓝色大陆，那句“大海，是男人的梦想，也是男人的坟场”更是吸引了不知多少出海的热血男儿。"
    };
getRow(10001)->
    #show2Cfg {
    id = 10001,
    groupid = 10000,
    taskname = "海盗王的宝藏1",
    npcid = 500,
    emotion = 1,
    name = "Mr.王",
    side = 1,
    content = "当然这些伟大的开端都会伴着这样或那样的传闻，我们今天要探寻的便是“海盗王的宝藏”，听闻现在暂留在阿克勒港的夏洛克船长有些线索，去他那找找信息吧。"
    };
getRow(10002)->
    #show2Cfg {
    id = 10002,
    groupid = 10000,
    taskname = "海盗王的宝藏2",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "[63FFF6FF]<伸懒腰>[-]又是一个风和日丽的早晨，我们这就出发…"
    };
getRow(10003)->
    #show2Cfg {
    id = 10003,
    groupid = 10000,
    taskname = "海盗王的宝藏1",
    npcid = 500,
    emotion = 1,
    name = "Mr.王",
    side = 1,
    content = "忘了提醒你们[63FFF6FF]<微微笑>[-]，夏洛克的脾气可能有些古怪[63FFF6FF]<微笑>[-]，请一定做好心理准备[63FFF6FF]<笑>[-]…"
    };
getRow(10004)->
    #show2Cfg {
    id = 10004,
    groupid = 10000,
    taskname = "海盗王的宝藏2",
    npcid = 505,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "[63FFF6FF]<一阵冷风>[-]（...哪里来的冷风）"
    };
getRow(10005)->
    #show2Cfg {
    id = 10005,
    groupid = 10001,
    taskname = "海盗王的宝藏2",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "你好，我叫夏洛特。“夏洛特·华生”，“未来的海盗王”说的都是我，很高兴认识你。"
    };
getRow(10006)->
    #show2Cfg {
    id = 10006,
    groupid = 10001,
    taskname = "海盗王的宝藏2",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "你…"
    };
getRow(10007)->
    #show2Cfg {
    id = 10007,
    groupid = 10001,
    taskname = "海盗王的宝藏2",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "当然你也可以称我为“亲爱的华生”，“无所不知的华生”..."
    };
getRow(10008)->
    #show2Cfg {
    id = 10008,
    groupid = 10001,
    taskname = "海盗王的宝藏2",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "你好…我…"
    };
getRow(10009)->
    #show2Cfg {
    id = 10009,
    groupid = 10001,
    taskname = "海盗王的宝藏2",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "（！@#￥%……&*+）..."
    };
getRow(10010)->
    #show2Cfg {
    id = 10010,
    groupid = 10001,
    taskname = "海盗王的宝藏2",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "………"
    };
getRow(10011)->
    #show2Cfg {
    id = 10011,
    groupid = 10001,
    taskname = "海盗王的宝藏2",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "说了这么多，最后冒昧的问一句，找我有什么事情吗？如果没有，[63FFF6FF]<微笑>[-]请前方左转，慢行..."
    };
getRow(10012)->
    #show2Cfg {
    id = 10012,
    groupid = 10001,
    taskname = "海盗王的宝藏2",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "…………"
    };
getRow(10013)->
    #show2Cfg {
    id = 10013,
    groupid = 10001,
    taskname = "海盗王的宝藏2",
    npcid = 505,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "（喂...这已经不是有些古怪了吧）"
    };
getRow(10014)->
    #show2Cfg {
    id = 10014,
    groupid = 10001,
    taskname = "海盗王的宝藏2",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "[63FFF6FF]<保持微笑>[-]是这样的，夏洛克船长..."
    };
getRow(10015)->
    #show2Cfg {
    id = 10015,
    groupid = 10001,
    taskname = "海盗王的宝藏2",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "打断一下[63FFF6FF]<义正言辞状>[-]，我认为你可以在“夏洛克”这样可爱的词汇前面加上一些小字眼，例如，“伟大的”，“亲爱的”之类，这样会显得更亲切，不是吗？"
    };
getRow(10016)->
    #show2Cfg {
    id = 10016,
    groupid = 10001,
    taskname = "海盗王的宝藏2",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "[63FFF6FF]<保持笑容>[-]咳...好吧，“伟大的”，“无所不知的”，“未来的海盗王”冕下，我们为海盗王的宝藏传说而来，听闻您无所不知，知无不言，所以来寻求些信息。"
    };
getRow(10017)->
    #show2Cfg {
    id = 10017,
    groupid = 10001,
    taskname = "海盗王的宝藏2",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "[63FFF6FF]<持续笑容>[-]当然，这不是免费的，我们可以为此付上一些合理的报酬。嗯，是“合理的”报酬。"
    };
getRow(10018)->
    #show2Cfg {
    id = 10018,
    groupid = 10001,
    taskname = "海盗王的宝藏2",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "我们是朋友[63FFF6FF]<义正言辞状>[-]，朋友间怎么可能有偿索取呢，不过说了这么多，有些口渴，不知道我的朋友有没有兴趣替我找一份宾客斯的朗姆酒来润润喉。"
    };
getRow(10019)->
    #show2Cfg {
    id = 10019,
    groupid = 10001,
    taskname = "海盗王的宝藏2",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "我有故事，你有酒吗？"
    };
getRow(10020)->
    #show2Cfg {
    id = 10020,
    groupid = 10001,
    taskname = "海盗王的宝藏2",
    npcid = 505,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "（！！从未见过如此厚颜无耻的人）"
    };
getRow(10021)->
    #show2Cfg {
    id = 10021,
    groupid = 10001,
    taskname = "海盗王的宝藏2",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "[63FFF6FF]<努力保持笑容>[-]如你所愿，“伟大的”夏洛特船长！！"
    };
getRow(10022)->
    #show2Cfg {
    id = 10022,
    groupid = 10001,
    taskname = "海盗王的宝藏2",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "官方消息，阿克勒城郊的罗杰处有“免费”的朗姆酒派送。不用谢我，朋友间就应该这样大方无私[63FFF6FF]<义正言辞状>[-]。"
    };
getRow(10023)->
    #show2Cfg {
    id = 10023,
    groupid = 10001,
    taskname = "海盗王的宝藏2",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "…还是要感谢你，我的朋友。"
    };
getRow(10024)->
    #show2Cfg {
    id = 10024,
    groupid = 10002,
    taskname = "海盗王的宝藏3",
    npcid = 502,
    emotion = 1,
    name = "罗杰",
    side = 1,
    content = "夏洛克·华生？那个臭名昭著的新人船长？？海上的吝啬之王？？？"
    };
getRow(10025)->
    #show2Cfg {
    id = 10025,
    groupid = 10002,
    taskname = "海盗王的宝藏3",
    npcid = 505,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "[63FFF6FF]<点头>[-]（嗯嗯...这几句评价还是很中肯的）"
    };
getRow(10026)->
    #show2Cfg {
    id = 10026,
    groupid = 10002,
    taskname = "海盗王的宝藏3",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "没错，夏洛克船长让我到这取些免费派送的宾克斯朗姆酒"
    };
getRow(10027)->
    #show2Cfg {
    id = 10027,
    groupid = 10002,
    taskname = "海盗王的宝藏3",
    npcid = 502,
    emotion = 1,
    name = "罗杰",
    side = 1,
    content = "朗姆酒！免费的！！还是宾克斯的朗姆酒！！！"
    };
getRow(10028)->
    #show2Cfg {
    id = 10028,
    groupid = 10002,
    taskname = "海盗王的宝藏3",
    npcid = 505,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "（有种不太妙的感觉...）"
    };
getRow(10029)->
    #show2Cfg {
    id = 10029,
    groupid = 10002,
    taskname = "海盗王的宝藏3",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "[63FFF6FF]<冷汗>[-]额，大致是这样的没错..."
    };
getRow(10030)->
    #show2Cfg {
    id = 10030,
    groupid = 10002,
    taskname = "海盗王的宝藏3",
    npcid = 502,
    emotion = 1,
    name = "罗杰",
    side = 1,
    content = "[63FFF6FF]<微笑>[-]请前方右转，慢行..."
    };
getRow(10031)->
    #show2Cfg {
    id = 10031,
    groupid = 10002,
    taskname = "海盗王的宝藏3",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "………"
    };
getRow(10032)->
    #show2Cfg {
    id = 10032,
    groupid = 10002,
    taskname = "海盗王的宝藏3",
    npcid = 505,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "…………"
    };
getRow(10033)->
    #show2Cfg {
    id = 10033,
    groupid = 10002,
    taskname = "海盗王的宝藏3",
    npcid = 502,
    emotion = 1,
    name = "罗杰",
    side = 1,
    content = "……………"
    };
getRow(10034)->
    #show2Cfg {
    id = 10034,
    groupid = 10002,
    taskname = "海盗王的宝藏3",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "………………"
    };
getRow(10035)->
    #show2Cfg {
    id = 10035,
    groupid = 10002,
    taskname = "海盗王的宝藏3",
    npcid = 505,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "…………………"
    };
getRow(10036)->
    #show2Cfg {
    id = 10036,
    groupid = 10002,
    taskname = "海盗王的宝藏3",
    npcid = 502,
    emotion = 1,
    name = "罗杰",
    side = 1,
    content = "你们怎么还不走？？"
    };
getRow(10037)->
    #show2Cfg {
    id = 10037,
    groupid = 10002,
    taskname = "海盗王的宝藏3",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "…………………"
    };
getRow(10038)->
    #show2Cfg {
    id = 10038,
    groupid = 10002,
    taskname = "海盗王的宝藏3",
    npcid = 502,
    emotion = 1,
    name = "罗杰",
    side = 1,
    content = "好吧，好吧，看在今天是我和宝贝结婚纪念日的份上，帮助波特卡斯完成一个愿望，宾克斯就是你的了。"
    };
getRow(10039)->
    #show2Cfg {
    id = 10039,
    groupid = 10002,
    taskname = "海盗王的宝藏3",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "…………………"
    };
getRow(10040)->
    #show2Cfg {
    id = 10040,
    groupid = 10002,
    taskname = "海盗王的宝藏3",
    npcid = 502,
    emotion = 1,
    name = "罗杰",
    side = 1,
    content = "快走，快走，还赖在这里干什么！波特卡斯现在就在海滩！！"
    };
getRow(10041)->
    #show2Cfg {
    id = 10041,
    groupid = 10002,
    taskname = "海盗王的宝藏3",
    npcid = 505,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "[63FFF6FF]<愤怒>[-]（...这幅嘴脸简直是和夏洛克一个模子里刻出来的）"
    };
getRow(10042)->
    #show2Cfg {
    id = 10042,
    groupid = 10003,
    taskname = "海盗王的宝藏4",
    npcid = 503,
    emotion = 1,
    name = "波特卡斯",
    side = 1,
    content = "[63FFF6FF]<微笑>[-]看你们幅这幅模样，一定是刚从罗杰那里过来的，而且肯定又是夏洛克打他宾克斯的主意了…"
    };
getRow(10043)->
    #show2Cfg {
    id = 10043,
    groupid = 10003,
    taskname = "海盗王的宝藏4",
    npcid = 503,
    emotion = 1,
    name = "波特卡斯",
    side = 1,
    content = "[63FFF6FF]<义正言辞状>[-]说不定又是帮我实现一个愿望，[63FFF6FF]<无奈>[-]每年都是这样，他们俩就像是孩子，乐此不疲…"
    };
getRow(10044)->
    #show2Cfg {
    id = 10044,
    groupid = 10003,
    taskname = "海盗王的宝藏4",
    npcid = 505,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "[63FFF6FF]<真诚>[-]（有一种被套路的感觉）"
    };
getRow(10045)->
    #show2Cfg {
    id = 10045,
    groupid = 10003,
    taskname = "海盗王的宝藏4",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "那个...请问夫人，他们两个彼此很熟吗？"
    };
getRow(10046)->
    #show2Cfg {
    id = 10046,
    groupid = 10003,
    taskname = "海盗王的宝藏4",
    npcid = 503,
    emotion = 1,
    name = "波特卡斯",
    side = 1,
    content = "[63FFF6FF]<温柔>[-]啊，有些失态了。真抱歉，其实他们两个是父子。不过，夏洛克在很早的时候就离家出海了。"
    };
getRow(10047)->
    #show2Cfg {
    id = 10047,
    groupid = 10003,
    taskname = "海盗王的宝藏4",
    npcid = 503,
    emotion = 1,
    name = "波特卡斯",
    side = 1,
    content = "说来也是海盗王宝藏惹的祸，那个孩子从小便听宝藏的传说长大，罗杰现在也有些后悔，后悔讲那些故事。"
    };
getRow(10048)->
    #show2Cfg {
    id = 10048,
    groupid = 10003,
    taskname = "海盗王的宝藏4",
    npcid = 505,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "[63FFF6FF]<叹气>[-]（其实，我俩才是最后悔的）"
    };
getRow(10049)->
    #show2Cfg {
    id = 10049,
    groupid = 10003,
    taskname = "海盗王的宝藏4",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "夫人，你有什么愿望想要实现吗？看样子我们应该把传统继续下去…"
    };
getRow(10050)->
    #show2Cfg {
    id = 10050,
    groupid = 10003,
    taskname = "海盗王的宝藏4",
    npcid = 503,
    emotion = 1,
    name = "波特卡斯",
    side = 1,
    content = "[63FFF6FF]<义正言辞状>[-]按照历年的惯例，你们需要帮我收集四十份饱满的蟹钳（历年貌似是三十来着），才能在我这儿通关。"
    };
getRow(10051)->
    #show2Cfg {
    id = 10051,
    groupid = 10003,
    taskname = "海盗王的宝藏4",
    npcid = 505,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "（似乎为这位美丽的夫人办事也不是什么难受的事...）"
    };
getRow(10052)->
    #show2Cfg {
    id = 10052,
    groupid = 10004,
    taskname = "海盗王的宝藏5",
    npcid = 503,
    emotion = 1,
    name = "波特卡斯",
    side = 1,
    content = "感谢你们的帮忙，有了这些蟹钳，今年也一定能做出一桌美味的蟹钳宴，去找罗杰领取你们的报酬吧[63FFF6FF]<大笑>[-]。"
    };
getRow(10053)->
    #show2Cfg {
    id = 10053,
    groupid = 10004,
    taskname = "海盗王的宝藏5",
    npcid = 503,
    emotion = 1,
    name = "波特卡斯",
    side = 1,
    content = "[63FFF6FF]<陷入回忆>[-]还记得我们第一次见面就在这片海滩，他敞露着迷人的胸膛昏迷在那儿，水手服虽然破烂，右腿也一直有鲜血流淌，我还是一眼就相中了这个落魄的小伙子..."
    };
getRow(10054)->
    #show2Cfg {
    id = 10054,
    groupid = 10004,
    taskname = "海盗王的宝藏5",
    npcid = 505,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "（真是一位温柔多情的夫人...）"
    };
getRow(10055)->
    #show2Cfg {
    id = 10055,
    groupid = 10005,
    taskname = "海盗王的宝藏6",
    npcid = 502,
    emotion = 1,
    name = "罗杰",
    side = 1,
    content = "[63FFF6FF]<惊悚>[-]你们这么快就回来了！！"
    };
getRow(10056)->
    #show2Cfg {
    id = 10056,
    groupid = 10005,
    taskname = "海盗王的宝藏6",
    npcid = 505,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "（罗杰的声音似乎有些颤抖？？）"
    };
getRow(10057)->
    #show2Cfg {
    id = 10057,
    groupid = 10005,
    taskname = "海盗王的宝藏6",
    npcid = 502,
    emotion = 1,
    name = "罗杰",
    side = 1,
    content = "[63FFF6FF]<小声嘀咕>[-]（还是忍忍吧，每年只有一次，忍忍就过去了，男人有什么不能忍的呢…）"
    };
getRow(10058)->
    #show2Cfg {
    id = 10058,
    groupid = 10005,
    taskname = "海盗王的宝藏6",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "......（black？？？）"
    };
getRow(10059)->
    #show2Cfg {
    id = 10059,
    groupid = 10005,
    taskname = "海盗王的宝藏6",
    npcid = 502,
    emotion = 1,
    name = "罗杰",
    side = 1,
    content = ".........（black？？？black？？？）"
    };
getRow(10060)->
    #show2Cfg {
    id = 10060,
    groupid = 10005,
    taskname = "海盗王的宝藏6",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "[63FFF6FF]<无奈>[-]您还有什么事情吗？如果没有，我想取回之前说好的宾克斯朗姆酒。"
    };
getRow(10061)->
    #show2Cfg {
    id = 10061,
    groupid = 10005,
    taskname = "海盗王的宝藏6",
    npcid = 502,
    emotion = 1,
    name = "罗杰",
    side = 1,
    content = "这个一定有，听清楚了，替我转告夏洛特那个臭小子：[63FFF6FF]<手舞足蹈，唾沫四溅>[-]咳咳，下次想喝宾克斯就自己回来，如果再派人来取，看我不打断他的腿！！"
    };
getRow(10062)->
    #show2Cfg {
    id = 10062,
    groupid = 10005,
    taskname = "海盗王的宝藏6",
    npcid = 502,
    emotion = 1,
    name = "罗杰",
    side = 1,
    content = "[63FFF6FF]<一脸落寞>[-]老人家就是没人关爱，这是宾克斯...拿好...[63FFF6FF]<一脸肉疼>[-]小心点小鬼，别磕到，一年只有这一瓶儿..."
    };
getRow(10063)->
    #show2Cfg {
    id = 10063,
    groupid = 10005,
    taskname = "海盗王的宝藏6",
    npcid = 505,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "[63FFF6FF]<笑>[-]（似乎事情也有些可爱了呢）"
    };
getRow(10064)->
    #show2Cfg {
    id = 10064,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "哦，我的宾克斯，哦，我的心肝宝贝儿！！[63FFF6FF]<摩挲酒瓶>[-]你迷人的“小蛮腰”愈加让我流连忘返…"
    };
getRow(10065)->
    #show2Cfg {
    id = 10065,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 505,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "[63FFF6FF]<黑线>[-]（我应该收回我的上一句话）"
    };
getRow(10066)->
    #show2Cfg {
    id = 10066,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "[63FFF6FF]<歌声悠扬>[-]“宾克斯美酒敬上，一个人的午夜场。喝醉了，梦里回味往日的时光...”"
    };
getRow(10067)->
    #show2Cfg {
    id = 10067,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "[63FFF6FF]<被打败>[-]现在你可以告诉我们关于海盗王宝藏的故事了吧"
    };
getRow(10068)->
    #show2Cfg {
    id = 10068,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "没问题，我的朋友，等我润润喉。[63FFF6FF]<迷醉>[-]哦，我的天呐，宝贝儿的味道还是这么的芬芳…"
    };
getRow(10069)->
    #show2Cfg {
    id = 10069,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "关于海盗王的宝藏，老头子曾说过：[63FFF6FF]<一本正经>[-]“咳咳，哦，是的，也许你不相信，我曾经是伟大的上一任海贼王的船员，一名英勇无畏的海上战士。”"
    };
getRow(10070)->
    #show2Cfg {
    id = 10070,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 505,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "（...这是罗杰附体吗？）"
    };
getRow(10071)->
    #show2Cfg {
    id = 10071,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "[63FFF6FF]<向往>[-]“我们穿过死亡的魔鬼海峡，横渡莫测变换的金三角，最终来到了海的尽头，也是世界的尽头。”"
    };
getRow(10072)->
    #show2Cfg {
    id = 10072,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "[63FFF6FF]<迷醉>[-]“在那里，风在吼，金子闪闪发亮…”"
    };
getRow(10073)->
    #show2Cfg {
    id = 10073,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "………"
    };
getRow(10074)->
    #show2Cfg {
    id = 10074,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "…………"
    };
getRow(10075)->
    #show2Cfg {
    id = 10075,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "就这样？"
    };
getRow(10076)->
    #show2Cfg {
    id = 10076,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "就这样…"
    };
getRow(10077)->
    #show2Cfg {
    id = 10077,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "没了？"
    };
getRow(10078)->
    #show2Cfg {
    id = 10078,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "没了，老头子讲故事翻来覆去只有几句。[63FFF6FF]<掏耳朵>[-]可怜我反反复复听了十多年…"
    };
getRow(10079)->
    #show2Cfg {
    id = 10079,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "[63FFF6FF]<疑惑>[-]这么说，宝藏被埋在了世界的尽头？"
    };
getRow(10080)->
    #show2Cfg {
    id = 10080,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "[63FFF6FF]<掏耳朵>[-]我怎么知道，我又没去过…"
    };
getRow(10081)->
    #show2Cfg {
    id = 10081,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "……………"
    };
getRow(10082)->
    #show2Cfg {
    id = 10082,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "[63FFF6FF]<微笑>[-]宝藏这种故事多无聊，我们来聊聊今年的老头子，今年老头子也一定有话要转告给我吧？"
    };
getRow(10083)->
    #show2Cfg {
    id = 10083,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "[63FFF6FF]<无语>[-]是有的，没错…"
    };
getRow(10084)->
    #show2Cfg {
    id = 10084,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 504,
    emotion = 1,
    name = "罗杰",
    side = 2,
    content = "听清楚了，替我转告夏洛特那个臭小子：[63FFF6FF]<手舞足蹈，唾沫四溅>[-]咳咳，下次想喝宾克斯就自己回来，如果再派人来取，看我不打断他的腿！！"
    };
getRow(10085)->
    #show2Cfg {
    id = 10085,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 505,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "（...这应该是影帝附体了）"
    };
getRow(10086)->
    #show2Cfg {
    id = 10086,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "[63FFF6FF]<放声大笑>[-]哈哈哈哈哈哈，哈哈哈哈哈哈"
    };
getRow(10087)->
    #show2Cfg {
    id = 10087,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "听到这话，今年婚庆晚宴肯定也是蟹钳宴了！我已经能想象到，老头子吃蟹钳宴的情景了！！[63FFF6FF]<大笑>[-]哈哈哈哈！！！"
    };
getRow(10088)->
    #show2Cfg {
    id = 10088,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "[63FFF6FF]<黑线>[-]...你不会是因为这个原因才离家出海的吧。"
    };
getRow(10089)->
    #show2Cfg {
    id = 10089,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "怎么会，我是为了梦想与自由…"
    };
getRow(10090)->
    #show2Cfg {
    id = 10090,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "对了，这份剩下的象征自由与梦想的宾克斯，你一定要收下，[63FFF6FF]<郑重>[-]这是一份精神的传承！！"
    };
getRow(10091)->
    #show2Cfg {
    id = 10091,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 505,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "………"
    };
getRow(10092)->
    #show2Cfg {
    id = 10092,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "[63FFF6FF]<义正言辞状>[-]永远不要嫌弃朋友的赠礼，当然也不要介意里面的一丁点口水，只是些烟草味道而已，哈哈哈！！"
    };
getRow(10093)->
    #show2Cfg {
    id = 10093,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "…………"
    };
getRow(10094)->
    #show2Cfg {
    id = 10094,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 0,
    emotion = 1,
    name = "0",
    side = 2,
    content = "[63FFF6FF]<手累>[-](这应该是今天打得最多的标点了...)"
    };
getRow(10095)->
    #show2Cfg {
    id = 10095,
    groupid = 10006,
    taskname = "海盗王的宝藏7",
    npcid = 506,
    emotion = 1,
    name = "夏洛特",
    side = 1,
    content = "[63FFF6FF]<歌声悠扬>[-]“宾客斯美酒敬上，迎着风雨和巨浪。晴空下有我最爱的旗帜在飘扬，一起眺望着远方，那副画面多向往...”"
    };
getRow(10096)->
    #show2Cfg {
    id = 10096,
    groupid = 10007,
    taskname = "海盗王的宝藏8",
    npcid = 500,
    emotion = 1,
    name = "Mr.王",
    side = 1,
    content = "这份报告很有价值，感谢你们！"
    };
getRow(10097)->
    #show2Cfg {
    id = 10097,
    groupid = 10007,
    taskname = "海盗王的宝藏8",
    npcid = 500,
    emotion = 1,
    name = "Mr.王",
    side = 1,
    content = "[63FFF6FF]<邪魅一笑>[-]我想他们应该生活的不错，不是吗？"
    };
getRow(10098)->
    #show2Cfg {
    id = 10098,
    groupid = 10007,
    taskname = "海盗王的宝藏8",
    npcid = 505,
    emotion = 1,
    name = "丽莎",
    side = 2,
    content = "[63FFF6FF]<打冷战>[-]（为什么看着Mr.王在笑...有一种心惊胆战的感觉...）"
    };
getRow(10099)->
    #show2Cfg {
    id = 10099,
    groupid = 2001,
    taskname = "骑士队长",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "好像是个骑士，看样子受了很严重的伤！"
    };
getRow(10100)->
    #show2Cfg {
    id = 10100,
    groupid = 2001,
    taskname = "骑士队长",
    npcid = 5001,
    emotion = 0,
    name = "骑士队长",
    side = 1,
    content = "世间最痛苦的不是生离死别，而是看着海滩上肥美的螃蟹却只能瘫倒在这活活挨饿数日。"
    };
getRow(10101)->
    #show2Cfg {
    id = 10101,
    groupid = 2001,
    taskname = "骑士队长",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "真是可怜的人，就让我帮帮你吧~我这还有点蓝瘦香菇你先垫巴点~"
    };
getRow(10102)->
    #show2Cfg {
    id = 10102,
    groupid = 2001,
    taskname = "骑士队长",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10103)->
    #show2Cfg {
    id = 10103,
    groupid = 2002,
    taskname = "打蟹肉",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "蟹肉已经收集好了，待我先用火堆烤熟再给可怜的骑士送去。"
    };
getRow(10104)->
    #show2Cfg {
    id = 10104,
    groupid = 2002,
    taskname = "打蟹肉",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10105)->
    #show2Cfg {
    id = 10105,
    groupid = 2003,
    taskname = "烤蟹肉",
    npcid = 5001,
    emotion = 0,
    name = "骑士队长",
    side = 1,
    content = "我发誓！！这是我闻到过最香的味道，至于是不是最好吃的食物~（咽口水）快给我尝尝！"
    };
getRow(10106)->
    #show2Cfg {
    id = 10106,
    groupid = 2003,
    taskname = "烤蟹肉",
    npcid = 5001,
    emotion = 0,
    name = "骑士队长",
    side = 1,
    content = "我的天啊，这简直就是人世间究极的美味，你是皇家御厨吗？我要是能活下来，一定要高薪聘请你当我的私厨。"
    };
getRow(10107)->
    #show2Cfg {
    id = 10107,
    groupid = 2003,
    taskname = "烤蟹肉",
    npcid = 5001,
    emotion = 0,
    name = "骑士队长",
    side = 1
    };
getRow(10108)->
    #show2Cfg {
    id = 10108,
    groupid = 2004,
    taskname = "活过来了",
    npcid = 5001,
    emotion = 0,
    name = "骑士队长",
    side = 1,
    content = "我突然想起来了，魔族…魔族入侵了！我们皇家骑士团被他们伏击了，领主大人还在浴血奋战，我本想向主城求援，可是被魔族打下了马，战斗中就无法再骑上了！"
    };
getRow(10109)->
    #show2Cfg {
    id = 10109,
    groupid = 2004,
    taskname = "活过来了",
    npcid = 5001,
    emotion = 0,
    name = "骑士队长",
    side = 1,
    content = "领主大人他们就被困在西边的农场中，前面坡上的喵喵咪偷走了我很多骑宠奶酪，快去将奶酪夺回再强化一下你的骑宠，然后去帮帮被困的领主大人他们吧！"
    };
getRow(10110)->
    #show2Cfg {
    id = 10110,
    groupid = 2004,
    taskname = "活过来了",
    npcid = 5001,
    emotion = 0,
    name = "骑士队长",
    side = 1
    };
getRow(10111)->
    #show2Cfg {
    id = 10111,
    groupid = 2005,
    taskname = "营救一战",
    npcid = 5002,
    emotion = 0,
    name = "魔族小鬼头",
    side = 1,
    content = "站住！骑着那么拉风的坐骑，还让我看见了，有问过伦家的心里阴影面积吗？人走，马留下！小孩子得听话哟~"
    };
getRow(10112)->
    #show2Cfg {
    id = 10112,
    groupid = 2005,
    taskname = "营救一战",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "哈哈！想必你就是传说中的魔族熊孩子了，论年龄明显也是我年长你几岁，你奏凯，免得说我以大欺小！不听话就打你屁屁~"
    };
getRow(10113)->
    #show2Cfg {
    id = 10113,
    groupid = 2006,
    taskname = "一战过后",
    npcid = 5002,
    emotion = 0,
    name = "魔族小鬼头",
    side = 1,
    content = "5555555555~~~麻麻~麻麻~有人欺负我！"
    };
getRow(10114)->
    #show2Cfg {
    id = 10114,
    groupid = 2006,
    taskname = "一战过后",
    npcid = 5003,
    emotion = 0,
    name = "魔族女战士",
    side = 1,
    content = "是谁？是谁欺负我宝贝儿子，给我站出来！"
    };
getRow(10115)->
    #show2Cfg {
    id = 10115,
    groupid = 2006,
    taskname = "一战过后",
    npcid = 5003,
    emotion = 0,
    name = "魔族女战士",
    side = 1
    };
getRow(10116)->
    #show2Cfg {
    id = 10116,
    groupid = 2007,
    taskname = "二战过后",
    npcid = 5003,
    emotion = 0,
    name = "魔族女战士",
    side = 1,
    content = "骚年~好身手，在下技不如人、甘拜下风！"
    };
getRow(10117)->
    #show2Cfg {
    id = 10117,
    groupid = 2007,
    taskname = "二战过后",
    npcid = 5003,
    emotion = 0,
    name = "魔族女战士",
    side = 1
    };
getRow(10118)->
    #show2Cfg {
    id = 10118,
    groupid = 2008,
    taskname = "营救三",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "你就是骑士领主大人吗？可算找到你了！"
    };
getRow(10119)->
    #show2Cfg {
    id = 10119,
    groupid = 2008,
    taskname = "营救三",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "快离开这，太危险了！魔族已经把我们包围了！"
    };
getRow(10120)->
    #show2Cfg {
    id = 10120,
    groupid = 2008,
    taskname = "营救三",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "那可不行，我好不容易找到你，怎么能说走就走呢？快随我来，我护送你们安全撤离！"
    };
getRow(10121)->
    #show2Cfg {
    id = 10121,
    groupid = 2008,
    taskname = "营救三",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "那就帮我把我的宝马坐骑先护送出去吧，它受惊了需要人保护，我来给你殿后！"
    };
getRow(10122)->
    #show2Cfg {
    id = 10122,
    groupid = 2008,
    taskname = "营救三",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10123)->
    #show2Cfg {
    id = 10123,
    groupid = 2009,
    taskname = "绝地求生",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "真不敢相信，你居然成功将我们安全撤离！我在你身上看到了坚毅的骑士精神！"
    };
getRow(10124)->
    #show2Cfg {
    id = 10124,
    groupid = 2009,
    taskname = "绝地求生",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "但是，魔族入侵的危机还是没有解除，我们需要前往东侧，敲响那里的御敌警钟。不过在那之前，我们需要几套魔族士兵的服装，这样才好伪装潜入东侧。"
    };
getRow(10125)->
    #show2Cfg {
    id = 10125,
    groupid = 2009,
    taskname = "绝地求生",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1
    };
getRow(10126)->
    #show2Cfg {
    id = 10126,
    groupid = 2010,
    taskname = "集齐军服",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "军装已经收集齐备"
    };
getRow(10127)->
    #show2Cfg {
    id = 10127,
    groupid = 2010,
    taskname = "集齐军服",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "快！我们赶紧换上伪装自己~"
    };
getRow(10128)->
    #show2Cfg {
    id = 10128,
    groupid = 2010,
    taskname = "集齐军服",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1
    };
getRow(10129)->
    #show2Cfg {
    id = 10129,
    groupid = 2011,
    taskname = "穿戴军服",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "伪装完毕，我们准备出发！"
    };
getRow(10130)->
    #show2Cfg {
    id = 10130,
    groupid = 2011,
    taskname = "穿戴军服",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1
    };
getRow(10131)->
    #show2Cfg {
    id = 10131,
    groupid = 2012,
    taskname = "潜入一战后",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "嘘~~~千万别让魔族大军发现了，大家动作都轻点！能动手千万别动嘴，要动嘴也只能用咬的！"
    };
getRow(10132)->
    #show2Cfg {
    id = 10132,
    groupid = 2012,
    taskname = "潜入一战后",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1
    };
getRow(10133)->
    #show2Cfg {
    id = 10133,
    groupid = 2013,
    taskname = "潜入二",
    npcid = 5005,
    emotion = 0,
    name = "魔族卫兵",
    side = 1,
    content = "干什么的！鬼鬼祟祟想搞事情啊？"
    };
getRow(10134)->
    #show2Cfg {
    id = 10134,
    groupid = 2013,
    taskname = "潜入二",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "我们魔族当然要鬼鬼祟祟啦！不然你给我来个光明正大看看？"
    };
getRow(10135)->
    #show2Cfg {
    id = 10135,
    groupid = 2013,
    taskname = "潜入二",
    npcid = 5005,
    emotion = 0,
    name = "魔族卫兵",
    side = 1,
    content = "讨厌~如此犀利的回答，我竟无言以对，你赢了，走吧走吧！"
    };
getRow(10136)->
    #show2Cfg {
    id = 10136,
    groupid = 2013,
    taskname = "潜入二",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "（低声说）666~"
    };
getRow(10137)->
    #show2Cfg {
    id = 10137,
    groupid = 2013,
    taskname = "潜入二",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1
    };
getRow(10138)->
    #show2Cfg {
    id = 10138,
    groupid = 2014,
    taskname = "探钟",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "这就是东海望的红晶灯塔了。糟糕！红晶灯塔的能量源好像被魔族给偷走了！"
    };
getRow(10139)->
    #show2Cfg {
    id = 10139,
    groupid = 2014,
    taskname = "探钟",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "必须找到红晶灯塔的能量源，不然预警信号发送不出去，阿克勒全境就危险了！"
    };
getRow(10140)->
    #show2Cfg {
    id = 10140,
    groupid = 2014,
    taskname = "探钟",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1
    };
getRow(10141)->
    #show2Cfg {
    id = 10141,
    groupid = 2015,
    taskname = "敲钟",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "继续发送信号，让整个阿克勒境都听见这通天的红光！"
    };
getRow(10142)->
    #show2Cfg {
    id = 10142,
    groupid = 2015,
    taskname = "敲钟",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "不好，魔族看到红光往这边围攻过来了！"
    };
getRow(10143)->
    #show2Cfg {
    id = 10143,
    groupid = 2015,
    taskname = "敲钟",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "守住，给我守住！[fff000]【{PlayerName}】[-]现在情况危急，这些骑士团的顶级骑具都为你所用，一定要给我守住！"
    };
getRow(10144)->
    #show2Cfg {
    id = 10144,
    groupid = 2015,
    taskname = "敲钟",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1
    };
getRow(10145)->
    #show2Cfg {
    id = 10145,
    groupid = 2016,
    taskname = "守钟",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "魔族的大军越打越多，根本停不下来，这样下去我们迟早会耗尽体力倒下。"
    };
getRow(10146)->
    #show2Cfg {
    id = 10146,
    groupid = 2016,
    taskname = "守钟",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "（短暂思考过后）终究到了要使用那个圣物的时候了！众骑士们，让我们一同沐浴信仰的圣光。"
    };
getRow(10147)->
    #show2Cfg {
    id = 10147,
    groupid = 2016,
    taskname = "守钟",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "[fff000]【{PlayerName}】[-]这个光之号角就由你来吹响，我们将一路勇猛向前直到阿克勒城门外。"
    };
getRow(10148)->
    #show2Cfg {
    id = 10148,
    groupid = 2016,
    taskname = "守钟",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1
    };
getRow(10149)->
    #show2Cfg {
    id = 10149,
    groupid = 2017,
    taskname = "吹号",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "圣光的号角即将吹响，希望在各地的骑士们能够前来支援。"
    };
getRow(10151)->
    #show2Cfg {
    id = 10151,
    groupid = 2019,
    taskname = "吹号",
    npcid = 5001,
    emotion = 0,
    name = "众多骑士",
    side = 1,
    content = "愿誓死追随领主大人。"
    };
getRow(10152)->
    #show2Cfg {
    id = 10152,
    groupid = 2019,
    taskname = "吹号",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1,
    content = "光荣的骑士们，随我一同荣归阿克勒王城！冲啊！"
    };
getRow(10153)->
    #show2Cfg {
    id = 10153,
    groupid = 2018,
    taskname = "冲锋守护后",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "不好！城门口被金三胖给堵住了！他们往那一站谁都过不去了啊！"
    };
getRow(10154)->
    #show2Cfg {
    id = 10154,
    groupid = 2018,
    taskname = "冲锋守护后",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "据我了解胖子都怕挠痒痒，挠他们胳肢窝看他们还能稳多久。"
    };
getRow(10155)->
    #show2Cfg {
    id = 10155,
    groupid = 2018,
    taskname = "冲锋守护后",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1
    };
getRow(10156)->
    #show2Cfg {
    id = 10156,
    groupid = 2020,
    taskname = "进城",
    npcid = 5022,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "[fff000]【{PlayerName}】[-]国王听闻了你的事迹，点名要召见你，请吧！我们一起去面见陛下。"
    };
getRow(10157)->
    #show2Cfg {
    id = 10157,
    groupid = 2020,
    taskname = "进城",
    npcid = 5022,
    emotion = 0,
    name = "骑士领主",
    side = 1
    };
getRow(10158)->
    #show2Cfg {
    id = 10158,
    groupid = 2021,
    taskname = "面圣",
    npcid = 5023,
    emotion = 0,
    name = "阿克勒国王",
    side = 1,
    content = "青年的勇士哟~感谢你英勇的解除了阿克勒城的危机！我有礼物想送给你~"
    };
getRow(10159)->
    #show2Cfg {
    id = 10159,
    groupid = 2021,
    taskname = "面圣",
    npcid = 5023,
    emotion = 0,
    name = "阿克勒国王",
    side = 1,
    content = "青年的勇士哟~你是想要一把金武器？一把银武器？还是一把铜武器呢？"
    };
getRow(10160)->
    #show2Cfg {
    id = 10160,
    groupid = 2021,
    taskname = "面圣",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "这句话好像在哪听过啊喂！那个~我要金武器！"
    };
getRow(10161)->
    #show2Cfg {
    id = 10161,
    groupid = 2021,
    taskname = "面圣",
    npcid = 5023,
    emotion = 0,
    name = "阿克勒国王",
    side = 1,
    content = "没有~"
    };
getRow(10162)->
    #show2Cfg {
    id = 10162,
    groupid = 2021,
    taskname = "面圣",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "我要银武器！"
    };
getRow(10163)->
    #show2Cfg {
    id = 10163,
    groupid = 2021,
    taskname = "面圣",
    npcid = 5023,
    emotion = 0,
    name = "阿克勒国王",
    side = 1,
    content = "没有~"
    };
getRow(10164)->
    #show2Cfg {
    id = 10164,
    groupid = 2021,
    taskname = "面圣",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "我要铜武器！铜武器总有了吧！"
    };
getRow(10165)->
    #show2Cfg {
    id = 10165,
    groupid = 2021,
    taskname = "面圣",
    npcid = 5023,
    emotion = 0,
    name = "阿克勒国王",
    side = 1,
    content = "也没有~"
    };
getRow(10166)->
    #show2Cfg {
    id = 10166,
    groupid = 2021,
    taskname = "面圣",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "有一句话我不知道当不当讲！耍我呢是吧？"
    };
getRow(10167)->
    #show2Cfg {
    id = 10167,
    groupid = 2021,
    taskname = "面圣",
    npcid = 5023,
    emotion = 0,
    name = "阿克勒国王",
    side = 1,
    content = "（摊手）怪我喽~虽然我没有这些武器，但是呢~我能解答你任意一个问题！"
    };
getRow(10168)->
    #show2Cfg {
    id = 10168,
    groupid = 2021,
    taskname = "面圣",
    npcid = 5023,
    emotion = 0,
    name = "阿克勒国王",
    side = 1
    };
getRow(10169)->
    #show2Cfg {
    id = 10169,
    groupid = 2022,
    taskname = "提问",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "我差点把寻找漂浮之石的使命给忘了！陛下，你能告诉我有关漂浮之石的消息吗？"
    };
getRow(10170)->
    #show2Cfg {
    id = 10170,
    groupid = 2022,
    taskname = "提问",
    npcid = 5023,
    emotion = 0,
    name = "阿克勒国王",
    side = 1,
    content = "什么？你是怎么知道漂浮之石的？我知道一个传说，传说广场中央的露娜女神像，其胸口的一块魔石就是漂浮之石，多年前就已经被盗走了，至今下落不明，其他的我就完全不知道啦。"
    };
getRow(10171)->
    #show2Cfg {
    id = 10171,
    groupid = 2022,
    taskname = "提问",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "什么？下落不明，怎么会？城门外面的魔族大军可是蠢蠢欲动呢，得赶快找到漂浮之石对付他们。肯定还有其他关于漂浮之石的消息，我自己去调查！"
    };
getRow(10172)->
    #show2Cfg {
    id = 10172,
    groupid = 2022,
    taskname = "提问",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10173)->
    #show2Cfg {
    id = 10173,
    groupid = 2023,
    taskname = "被跟踪了1",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "给我站住！敢偷听我跟国王的谈话，胆子不小啊~看你往哪跑~"
    };
getRow(10174)->
    #show2Cfg {
    id = 10174,
    groupid = 2024,
    taskname = "被跟踪了2",
    npcid = 5024,
    emotion = 0,
    name = "跟踪者",
    side = 1,
    content = "（服下毒药）自尽"
    };
getRow(10175)->
    #show2Cfg {
    id = 10175,
    groupid = 2024,
    taskname = "被跟踪了2",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "别死啊喂！我还没问你话呢，看来王城也混入了不少奸细！得抓紧时间了，我先去问问附近的吃瓜群众有没有知道漂浮之石的消息。"
    };
getRow(10176)->
    #show2Cfg {
    id = 10176,
    groupid = 2024,
    taskname = "被跟踪了2",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10177)->
    #show2Cfg {
    id = 10177,
    groupid = 2026,
    taskname = "吃瓜群众",
    npcid = 5026,
    emotion = 0,
    name = "金融",
    side = 1,
    content = "昨天我就说要买这只股，你摇头，你看看今天涨了多少！"
    };
getRow(10178)->
    #show2Cfg {
    id = 10178,
    groupid = 2026,
    taskname = "吃瓜群众",
    npcid = 5027,
    emotion = 0,
    name = "巨鳄",
    side = 1,
    content = "无辜的看着主人（摇头~摇头）"
    };
getRow(10179)->
    #show2Cfg {
    id = 10179,
    groupid = 2026,
    taskname = "吃瓜群众",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "你们别吵啦，问你个事，请问你知道漂浮之石吗？"
    };
getRow(10180)->
    #show2Cfg {
    id = 10180,
    groupid = 2026,
    taskname = "吃瓜群众",
    npcid = 5026,
    emotion = 0,
    name = "金融",
    side = 1,
    content = "漂浮之石？听着到挺耳熟？昨天经过空中银行门口的时候好像听谁提起过，你要不去那边的空中银行问问？"
    };
getRow(10181)->
    #show2Cfg {
    id = 10181,
    groupid = 2026,
    taskname = "吃瓜群众",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1,
    content = "好的，十分感谢！祝你早日跟巨鳄合体，成为金融巨鳄！"
    };
getRow(10182)->
    #show2Cfg {
    id = 10182,
    groupid = 2026,
    taskname = "吃瓜群众",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10183)->
    #show2Cfg {
    id = 10183,
    groupid = 2028,
    taskname = "打劫1",
    npcid = 5028,
    emotion = 0,
    name = "银行职员",
    side = 1,
    content = "打！打！打！打劫啦，救命啊！"
    };
getRow(10184)->
    #show2Cfg {
    id = 10184,
    groupid = 2028,
    taskname = "打劫1",
    npcid = 5029,
    emotion = 0,
    name = "银行劫匪",
    side = 1,
    content = "叫破喉咙也没用，我看谁敢拦我们！"
    };
getRow(10185)->
    #show2Cfg {
    id = 10185,
    groupid = 2028,
    taskname = "打劫1",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "住手！"
    };
getRow(10186)->
    #show2Cfg {
    id = 10186,
    groupid = 2029,
    taskname = "打劫2",
    npcid = 5029,
    emotion = 0,
    name = "银行劫匪",
    side = 1,
    content = "石头已经到手了，我们撤！"
    };
getRow(10187)->
    #show2Cfg {
    id = 10187,
    groupid = 2029,
    taskname = "打劫2",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "站住，别跑！东西还回来！"
    };
getRow(10188)->
    #show2Cfg {
    id = 10188,
    groupid = 2029,
    taskname = "打劫2",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10189)->
    #show2Cfg {
    id = 10189,
    groupid = 2030,
    taskname = "啥丢了",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "要不要紧啊？那伙劫匪说石头到手了？到底什么被抢走了？"
    };
getRow(10190)->
    #show2Cfg {
    id = 10190,
    groupid = 2030,
    taskname = "啥丢了",
    npcid = 5028,
    emotion = 0,
    name = "银行职员",
    side = 1,
    content = "说来也奇怪，那伙劫匪金银不抢，就对一块破石头感兴趣！"
    };
getRow(10191)->
    #show2Cfg {
    id = 10191,
    groupid = 2030,
    taskname = "啥丢了",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "不好，看来漂浮之石真被他们抢走了！刚才他们逃的那么仓促肯定留下了一些线索，我先调查一下！"
    };
getRow(10192)->
    #show2Cfg {
    id = 10192,
    groupid = 2030,
    taskname = "啥丢了",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10193)->
    #show2Cfg {
    id = 10193,
    groupid = 2031,
    taskname = "蛛丝马迹1",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "这是刚才那伙劫匪掉下的匕首，上面还刻着一个怪异纹饰，我去找城中的铁匠老板询问一下线索。"
    };
getRow(10194)->
    #show2Cfg {
    id = 10194,
    groupid = 2031,
    taskname = "蛛丝马迹1",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10195)->
    #show2Cfg {
    id = 10195,
    groupid = 2032,
    taskname = "蛛丝马迹2",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "请问老板有见过这把匕首上的纹饰吗？"
    };
getRow(10196)->
    #show2Cfg {
    id = 10196,
    groupid = 2032,
    taskname = "蛛丝马迹2",
    npcid = 5030,
    emotion = 0,
    name = "铁匠老板",
    side = 1,
    content = "喔！见过见过！这就是阿克勒神秘组织“异魔人”的徽记，他们可是群难缠的家伙！你可得当心点！"
    };
getRow(10197)->
    #show2Cfg {
    id = 10197,
    groupid = 2032,
    taskname = "蛛丝马迹2",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "请问哪里能见到他们呢？"
    };
getRow(10198)->
    #show2Cfg {
    id = 10198,
    groupid = 2032,
    taskname = "蛛丝马迹2",
    npcid = 5030,
    emotion = 0,
    name = "铁匠老板",
    side = 1,
    content = "听说他们经常在阿克勒平原活动，你要想去那，得坐城中的飞空艇前往。"
    };
getRow(10199)->
    #show2Cfg {
    id = 10199,
    groupid = 2032,
    taskname = "蛛丝马迹2",
    npcid = 5030,
    emotion = 0,
    name = "铁匠老板",
    side = 1
    };
getRow(10200)->
    #show2Cfg {
    id = 10200,
    groupid = 2034,
    taskname = "大扫除1",
    npcid = 5032,
    emotion = 0,
    name = "地痞无赖",
    side = 1,
    content = "把保护费交出来，不然有你好看！"
    };
getRow(10201)->
    #show2Cfg {
    id = 10201,
    groupid = 2034,
    taskname = "大扫除1",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "这群地痞无赖可真是够让人火大的！"
    };
getRow(10202)->
    #show2Cfg {
    id = 10202,
    groupid = 2035,
    taskname = "大扫除2",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "就你们这点能力还想收保护费？还不快滚！"
    };
getRow(10203)->
    #show2Cfg {
    id = 10203,
    groupid = 2035,
    taskname = "大扫除2",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10204)->
    #show2Cfg {
    id = 10204,
    groupid = 2036,
    taskname = "通行证",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "全部搞定，那帮家伙应该不敢再来骚扰你了！"
    };
getRow(10205)->
    #show2Cfg {
    id = 10205,
    groupid = 2036,
    taskname = "通行证",
    npcid = 5031,
    emotion = 0,
    name = "黑市商人",
    side = 1,
    content = "苍天啊！大地啊！你解决了我一个心病，这“异魔人”的通行证我送给你啦！上岛后把通行证给守门人看就好了。"
    };
getRow(10206)->
    #show2Cfg {
    id = 10206,
    groupid = 2036,
    taskname = "通行证",
    npcid = 5031,
    emotion = 0,
    name = "黑市商人",
    side = 1
    };
getRow(10207)->
    #show2Cfg {
    id = 10207,
    groupid = 2037,
    taskname = "抢滩登陆",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "这里应该就是“异魔人”的秘密基地了，我看到异魔人守卫了！"
    };
getRow(10208)->
    #show2Cfg {
    id = 10208,
    groupid = 2037,
    taskname = "抢滩登陆",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10209)->
    #show2Cfg {
    id = 10209,
    groupid = 2038,
    taskname = "异魔人？？？",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "你就是异魔人的守卫吧？这是我的通行证，我要跟你们管事儿的说话！"
    };
getRow(10210)->
    #show2Cfg {
    id = 10210,
    groupid = 2038,
    taskname = "异魔人？？？",
    npcid = 5033,
    emotion = 0,
    name = "守门人",
    side = 1,
    content = "恩，我就是异魔人，有啥就跟我说吧（眼神漂浮不定，感觉有问题）"
    };
getRow(10211)->
    #show2Cfg {
    id = 10211,
    groupid = 2038,
    taskname = "异魔人？？？",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "（生疑）怎么只有你一个人？其他人呢？"
    };
getRow(10212)->
    #show2Cfg {
    id = 10212,
    groupid = 2038,
    taskname = "异魔人？？？",
    npcid = 5033,
    emotion = 0,
    name = "守门人",
    side = 1,
    content = "你话太多了，魔族的弟兄们给我干掉这个碍事的家伙！"
    };
getRow(10213)->
    #show2Cfg {
    id = 10213,
    groupid = 2038,
    taskname = "异魔人？？？",
    npcid = 5033,
    emotion = 0,
    name = "守门人",
    side = 1
    };
getRow(10214)->
    #show2Cfg {
    id = 10214,
    groupid = 2039,
    taskname = "英雄副本",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "这是什么情况啊？"
    };
getRow(10215)->
    #show2Cfg {
    id = 10215,
    groupid = 2039,
    taskname = "英雄副本",
    npcid = 5034,
    emotion = 0,
    name = "异魔人首领",
    side = 1,
    content = "我们才是真正的异魔人，他们都是魔族假冒的，为了引你上钩好干掉你！从可疑的匕首开始你就一步步踏进了他们魔族的圈套啦！"
    };
getRow(10216)->
    #show2Cfg {
    id = 10216,
    groupid = 2039,
    taskname = "英雄副本",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "（恍然大悟）我的天！这个假圈套天下第一~我被他们魔族耍的团团转啊！"
    };
getRow(10217)->
    #show2Cfg {
    id = 10217,
    groupid = 2039,
    taskname = "英雄副本",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10218)->
    #show2Cfg {
    id = 10218,
    groupid = 2040,
    taskname = "真·异魔人",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "话说你们异魔人长相跟魔族没啥区别呀，怎么分辨你们跟魔族呢？还有你知道漂浮之石的下落吗？"
    };
getRow(10219)->
    #show2Cfg {
    id = 10219,
    groupid = 2040,
    taskname = "真·异魔人",
    npcid = 5034,
    emotion = 0,
    name = "异魔人首领",
    side = 1,
    content = "首先，我们异魔人是从魔族中分裂出来的部族，所以长相没有大多区别，可能肤色会浅一些，判断异魔人最好的办法就是邀约他打架，异魔人会毅然拒绝，而魔族会犹豫或者兴致高涨的接受挑战！"
    };
getRow(10220)->
    #show2Cfg {
    id = 10220,
    groupid = 2040,
    taskname = "真·异魔人",
    npcid = 5034,
    emotion = 0,
    name = "异魔人首领",
    side = 1,
    content = "据探子消息，阿克勒平原近日突然出现了一伙神秘魔族精锐，他们好像在护送着什么，我们判断很可能就是漂浮之石。"
    };
getRow(10221)->
    #show2Cfg {
    id = 10221,
    groupid = 2040,
    taskname = "真·异魔人",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "那还等什么？我们赶快出发吧！"
    };
getRow(10222)->
    #show2Cfg {
    id = 10222,
    groupid = 2040,
    taskname = "真·异魔人",
    npcid = 5034,
    emotion = 0,
    name = "异魔人首领",
    side = 1,
    content = "不能着急，以你现在的实力，很难去跟那股魔族精锐抗衡。你现在应该晋升你的职业，获得更强大的技能与战力！你先去找城中的转职大师聊聊吧！"
    };
getRow(10223)->
    #show2Cfg {
    id = 10223,
    groupid = 2040,
    taskname = "真·异魔人",
    npcid = 5034,
    emotion = 0,
    name = "异魔人首领",
    side = 1
    };
getRow(10224)->
    #show2Cfg {
    id = 10224,
    groupid = 2041,
    taskname = "向阿克勒城进发",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "总算上岸了,我得继续前进,露娜女神说的漂浮之石很可能就在前面的阿克勒城中。"
    };
getRow(10225)->
    #show2Cfg {
    id = 10225,
    groupid = 2041,
    taskname = "向阿克勒城进发",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "等等！我好像听到了有人呼喊的声音。"
    };
getRow(10226)->
    #show2Cfg {
    id = 10226,
    groupid = 2041,
    taskname = "向阿克勒城进发",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10227)->
    #show2Cfg {
    id = 10227,
    groupid = 2042,
    taskname = "骑宠升级",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "这骑宠补给品闻着可真香，宠物吃了肯定会快速升级变强的！"
    };
getRow(10228)->
    #show2Cfg {
    id = 10228,
    groupid = 2042,
    taskname = "骑宠升级",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10229)->
    #show2Cfg {
    id = 10229,
    groupid = 2043,
    taskname = "救治伤员",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "又一个骑士伤员，还好受伤不严重。"
    };
getRow(10230)->
    #show2Cfg {
    id = 10230,
    groupid = 2043,
    taskname = "救治伤员",
    npcid = 5045,
    emotion = 0,
    name = "骑士伤员",
    side = 1,
    content = "魔族将前面的农场给围住了，领主大人还在坚守，真希望你能用得上旁边那些骑宠补给品。"
    };
getRow(10231)->
    #show2Cfg {
    id = 10231,
    groupid = 2043,
    taskname = "救治伤员",
    npcid = 5045,
    emotion = 0,
    name = "骑士伤员",
    side = 1
    };
getRow(10232)->
    #show2Cfg {
    id = 10232,
    groupid = 2044,
    taskname = "骑宠升星",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "这闪亮亮的小瓶里装着神秘的精华，我能感受到其中蕴含的强大能量，骑宠吃了这个肯定能升星变强的！"
    };
getRow(10233)->
    #show2Cfg {
    id = 10233,
    groupid = 2044,
    taskname = "骑宠升星",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10234)->
    #show2Cfg {
    id = 10234,
    groupid = 2045,
    taskname = "准备就绪",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "骑士团的伙食就是好，骑宠吃了这些补给品一下变得强悍了许多！"
    };
getRow(10235)->
    #show2Cfg {
    id = 10235,
    groupid = 2045,
    taskname = "准备就绪",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "（刮起了大风）营救骑士领主的时候到了！膝盖迎着烈风，冲啊！"
    };
getRow(10236)->
    #show2Cfg {
    id = 10236,
    groupid = 2045,
    taskname = "准备就绪",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10237)->
    #show2Cfg {
    id = 10237,
    groupid = 2046,
    taskname = "寻找能量源I",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "这些骨头兵身上沾染了不少红色的能量物质，看来红晶灯塔的能量源是被偷运到那边去了！"
    };
getRow(10238)->
    #show2Cfg {
    id = 10238,
    groupid = 2046,
    taskname = "寻找能量源I",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10239)->
    #show2Cfg {
    id = 10239,
    groupid = 2047,
    taskname = "寻找能量源II",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "方向果然没错，这地上散落了不少能量源的碎屑，前面的魔族明显增多，看来能量源应该就在那里了！"
    };
getRow(10240)->
    #show2Cfg {
    id = 10240,
    groupid = 2047,
    taskname = "寻找能量源II",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10241)->
    #show2Cfg {
    id = 10241,
    groupid = 2048,
    taskname = "寻找能量源III1",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "这些蛋蛋兵就像移动的炸弹一样危险，一定要先下手，不然等它们自爆那就完蛋了！"
    };
getRow(10242)->
    #show2Cfg {
    id = 10242,
    groupid = 2049,
    taskname = "寻找能量源III2",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "快看，能量源就在前面！"
    };
getRow(10243)->
    #show2Cfg {
    id = 10243,
    groupid = 2049,
    taskname = "寻找能量源III2",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10244)->
    #show2Cfg {
    id = 10244,
    groupid = 2050,
    taskname = "物归原处",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "能量源到手了！快，我们回去发送预警信号！"
    };
getRow(10245)->
    #show2Cfg {
    id = 10245,
    groupid = 2050,
    taskname = "物归原处",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1
    };
getRow(10246)->
    #show2Cfg {
    id = 10246,
    groupid = 2051,
    taskname = "挠痒痒I",
    npcid = 5052,
    emotion = 0,
    name = "金小胖",
    side = 1,
    content = "嘿嘿，我没痒痒肉，你挠不着~挠不着！"
    };
getRow(10247)->
    #show2Cfg {
    id = 10247,
    groupid = 2051,
    taskname = "挠痒痒I",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "哼！我就不信你另外两个兄弟也没痒痒肉！"
    };
getRow(10248)->
    #show2Cfg {
    id = 10248,
    groupid = 2051,
    taskname = "挠痒痒I",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10249)->
    #show2Cfg {
    id = 10249,
    groupid = 2052,
    taskname = "挠痒痒II",
    npcid = 5054,
    emotion = 0,
    name = "金中胖",
    side = 1,
    content = "嘿嘿，我也没痒痒肉，没！感！觉！"
    };
getRow(10250)->
    #show2Cfg {
    id = 10250,
    groupid = 2052,
    taskname = "挠痒痒II",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "你们这些胖子居然不怕痒，我就不信这个邪！"
    };
getRow(10251)->
    #show2Cfg {
    id = 10251,
    groupid = 2052,
    taskname = "挠痒痒II",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10252)->
    #show2Cfg {
    id = 10252,
    groupid = 2053,
    taskname = "挠痒痒III",
    npcid = 5056,
    emotion = 0,
    name = "金大胖",
    side = 1,
    content = "（硕大的身躯扭动起来）呼呼~别挠~呼呼~别挠了~我错了！我错了！"
    };
getRow(10253)->
    #show2Cfg {
    id = 10253,
    groupid = 2053,
    taskname = "挠痒痒III",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "哈哈，原来只有大胖才有痒痒肉的弱点，看我不挠的你生活不能自理！（狂挠）"
    };
getRow(10254)->
    #show2Cfg {
    id = 10254,
    groupid = 2053,
    taskname = "挠痒痒III",
    npcid = 5056,
    emotion = 0,
    name = "金大胖",
    side = 1,
    content = "（生气）啊，我怒了！我要踩扁你们！"
    };
getRow(10255)->
    #show2Cfg {
    id = 10255,
    groupid = 2053,
    taskname = "挠痒痒III",
    npcid = 5056,
    emotion = 0,
    name = "金大胖",
    side = 1
    };
getRow(10256)->
    #show2Cfg {
    id = 10256,
    groupid = 2054,
    taskname = "愤怒的大胖",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "万万没想到我们居然能活着回来，这都是你的功劳[fff000]【{PlayerName}】[-]，我穷的只剩下土地了！"
    };
getRow(10257)->
    #show2Cfg {
    id = 10257,
    groupid = 2054,
    taskname = "愤怒的大胖",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "为了答谢你的英勇无畏！我就赐你骑宠领地，一定要利用好你的骑宠领地啊！"
    };
getRow(10258)->
    #show2Cfg {
    id = 10258,
    groupid = 2054,
    taskname = "愤怒的大胖",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "先跟我一起进入王城吧~"
    };
getRow(10259)->
    #show2Cfg {
    id = 10259,
    groupid = 2054,
    taskname = "愤怒的大胖",
    npcid = 5004,
    emotion = 0,
    name = "骑士领主",
    side = 1
    };
getRow(10260)->
    #show2Cfg {
    id = 10260,
    groupid = 2055,
    taskname = "乘坐飞空艇",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "第一次乘坐飞空艇，心里还有些小激动呢。"
    };
getRow(10261)->
    #show2Cfg {
    id = 10261,
    groupid = 2055,
    taskname = "乘坐飞空艇",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "飞空艇我们走！向阿克勒平原进发！"
    };
getRow(10262)->
    #show2Cfg {
    id = 10262,
    groupid = 2055,
    taskname = "乘坐飞空艇",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10263)->
    #show2Cfg {
    id = 10263,
    groupid = 2056,
    taskname = "飞向平原",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "这应该就是阿克勒平原了，先问问附近的居民关于异魔人的消息吧。"
    };
getRow(10264)->
    #show2Cfg {
    id = 10264,
    groupid = 2056,
    taskname = "飞向平原",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10265)->
    #show2Cfg {
    id = 10265,
    groupid = 2057,
    taskname = "寻找异魔人",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "这位美腻的村菇，请问你知道在哪能找到异魔人吗？"
    };
getRow(10266)->
    #show2Cfg {
    id = 10266,
    groupid = 2057,
    taskname = "寻找异魔人",
    npcid = 5060,
    emotion = 0,
    name = "村菇",
    side = 1,
    content = "嘘~~~小声点，这个词在平原可是禁语，可别让那些难缠的家伙听到了！听说最近弗洛多老爷家的一块农场出了怪事情，庄稼全黑了，我看呐就是异魔人搞的鬼。"
    };
getRow(10267)->
    #show2Cfg {
    id = 10267,
    groupid = 2057,
    taskname = "寻找异魔人",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "庄稼全黑了？很蹊跷啊这个事情，能带我去看看吗？"
    };
getRow(10268)->
    #show2Cfg {
    id = 10268,
    groupid = 2057,
    taskname = "寻找异魔人",
    npcid = 5060,
    emotion = 0,
    name = "村菇",
    side = 1,
    content = "那块农场离这有些距离，你要不先去前面的山水庄园里问问弗洛多老爷本人吧？"
    };
getRow(10269)->
    #show2Cfg {
    id = 10269,
    groupid = 2057,
    taskname = "寻找异魔人",
    npcid = 5060,
    emotion = 0,
    name = "村菇",
    side = 1
    };
getRow(10270)->
    #show2Cfg {
    id = 10270,
    groupid = 2058,
    taskname = "前往山水庄园",
    npcid = 5061,
    emotion = 0,
    name = "弗洛多老爷",
    side = 1,
    content = "（恐惧的神情）不会的~怎么会~不可能~（自言自语）"
    };
getRow(10271)->
    #show2Cfg {
    id = 10271,
    groupid = 2058,
    taskname = "前往山水庄园",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "你就是弗洛多老爷吗？为何如此惶恐不安呢？"
    };
getRow(10272)->
    #show2Cfg {
    id = 10272,
    groupid = 2058,
    taskname = "前往山水庄园",
    npcid = 5061,
    emotion = 0,
    name = "弗洛多老爷",
    side = 1,
    content = "预言成真了！我们都要完蛋了...完蛋了！魔族卷土重来了，我那庄稼变黑就是证据！早知道我就该听异魔人的忠告不去动那块石头的。"
    };
getRow(10273)->
    #show2Cfg {
    id = 10273,
    groupid = 2058,
    taskname = "前往山水庄园",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "石头？异魔人？弗洛多老爷快告诉我这到底怎么回事！"
    };
getRow(10274)->
    #show2Cfg {
    id = 10274,
    groupid = 2058,
    taskname = "前往山水庄园",
    npcid = 5061,
    emotion = 0,
    name = "弗洛多老爷",
    side = 1,
    content = "跟我来吧，我们边走边说。"
    };
getRow(10275)->
    #show2Cfg {
    id = 10275,
    groupid = 2058,
    taskname = "前往山水庄园",
    npcid = 5061,
    emotion = 0,
    name = "弗洛多老爷",
    side = 1
    };
getRow(10276)->
    #show2Cfg {
    id = 10276,
    groupid = 2059,
    taskname = "边走边聊I",
    npcid = 5061,
    emotion = 0,
    name = "弗洛多老爷",
    side = 1,
    content = "事情是这样的，当年魔族内部有一分支部族因不满魔王的暴政分离出来，逃到了平原农场，我看他们可怜就好心的收留了他们，给他们吃给他们喝，还给他们机会在我农场里工作！"
    };
getRow(10277)->
    #show2Cfg {
    id = 10277,
    groupid = 2059,
    taskname = "边走边聊I",
    npcid = 5061,
    emotion = 0,
    name = "弗洛多老爷",
    side = 1,
    content = "可是好景不长，他们渐渐干腻了农场的工作，并开始拉帮结派成立了一个神秘的地下组织，并称自己是“异魔人”。"
    };
getRow(10278)->
    #show2Cfg {
    id = 10278,
    groupid = 2059,
    taskname = "边走边聊I",
    npcid = 5061,
    emotion = 0,
    name = "弗洛多老爷",
    side = 1,
    content = "这些其实都是小事，他们异魔人本质不坏，从没干什么伤天害理的坏事，倒是帮助了不少弱势群体，接下来发生的事情才是大事呐，哎，边走边说吧！"
    };
getRow(10279)->
    #show2Cfg {
    id = 10279,
    groupid = 2059,
    taskname = "边走边聊I",
    npcid = 5061,
    emotion = 0,
    name = "弗洛多老爷",
    side = 1
    };
getRow(10280)->
    #show2Cfg {
    id = 10280,
    groupid = 2060,
    taskname = "边走边聊II",
    npcid = 5061,
    emotion = 0,
    name = "弗洛多老爷",
    side = 1,
    content = "记得有一天，我在平原散步，走到封魔巨石前，看见巨石底部开始长出了许多小藤蔓，还带刺，正当我想拔除这些杂草的时候，异魔人突然叫住了我，叫我最好不要动这些邪恶的藤蔓。"
    };
getRow(10281)->
    #show2Cfg {
    id = 10281,
    groupid = 2060,
    taskname = "边走边聊II",
    npcid = 5061,
    emotion = 0,
    name = "弗洛多老爷",
    side = 1,
    content = "过了一阵子，我又来到此地，看见那些藤蔓又多了不少，强迫症晚期的我没忍住，就去拔，没想到一不小心就被刺给划破了手，滴了几点血在藤蔓上。"
    };
getRow(10282)->
    #show2Cfg {
    id = 10282,
    groupid = 2060,
    taskname = "边走边聊II",
    npcid = 5061,
    emotion = 0,
    name = "弗洛多老爷",
    side = 1,
    content = "没想到就因为这几滴血，让被巨石封印的地下魔兽有了苏醒的迹象，其邪恶的魔能逐渐开始污染这片土地，我真是手贱啊！"
    };
getRow(10283)->
    #show2Cfg {
    id = 10283,
    groupid = 2060,
    taskname = "边走边聊II",
    npcid = 5061,
    emotion = 0,
    name = "弗洛多老爷",
    side = 1,
    content = "等会见到了异魔人，我就恳求他们帮帮我净化那片污染的土地。"
    };
getRow(10284)->
    #show2Cfg {
    id = 10284,
    groupid = 2060,
    taskname = "边走边聊II",
    npcid = 5061,
    emotion = 0,
    name = "弗洛多老爷",
    side = 1
    };
getRow(10285)->
    #show2Cfg {
    id = 10285,
    groupid = 2061,
    taskname = "拜访异魔人1",
    npcid = 5065,
    emotion = 0,
    name = "失疯的异魔人",
    side = 1,
    content = "杀戮！鲜血！哇哈哈哈！"
    };
getRow(10286)->
    #show2Cfg {
    id = 10286,
    groupid = 2062,
    taskname = "拜访异魔人2",
    npcid = 5066,
    emotion = 0,
    name = "异魔人首领",
    side = 1,
    content = "快抓住这些失疯的异魔人，十分抱歉让你们受惊了！"
    };
getRow(10287)->
    #show2Cfg {
    id = 10287,
    groupid = 2062,
    taskname = "拜访异魔人2",
    npcid = 5066,
    emotion = 0,
    name = "异魔人首领",
    side = 1,
    content = "欢迎您的到来弗洛多老爷，我们正有紧急事件要找您呢。"
    };
getRow(10288)->
    #show2Cfg {
    id = 10288,
    groupid = 2062,
    taskname = "拜访异魔人2",
    npcid = 5066,
    emotion = 0,
    name = "异魔人首领",
    side = 1
    };
getRow(10289)->
    #show2Cfg {
    id = 10289,
    groupid = 2063,
    taskname = "事态紧急",
    npcid = 5061,
    emotion = 0,
    name = "弗洛多老爷",
    side = 1,
    content = "我也有要事要找你们求助呢！那块被污染的土地还请你们帮我想想办法呀！"
    };
getRow(10290)->
    #show2Cfg {
    id = 10290,
    groupid = 2063,
    taskname = "事态紧急",
    npcid = 5066,
    emotion = 0,
    name = "异魔人首领",
    side = 1,
    content = "我们所要找您的也正是此事！粗大事了，魔族得知了您触动了封印的魔兽，纷纷前往此地要把魔兽给放出来祸害人间呢！我们为了镇压邪恶的魔能扩散，被感染了好多兄弟，他们这才失疯了。"
    };
getRow(10291)->
    #show2Cfg {
    id = 10291,
    groupid = 2063,
    taskname = "事态紧急",
    npcid = 5066,
    emotion = 0,
    name = "异魔人首领",
    side = 1,
    content = "现在有两件事情非常非常重要，一是要阻止魔族破坏巨石，二是要用女神之泪来镇压魔兽的苏醒，老爷您带来的这个年轻人身手不凡，我看也能助我们一臂之力呀！"
    };
getRow(10292)->
    #show2Cfg {
    id = 10292,
    groupid = 2063,
    taskname = "事态紧急",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "不能让魔族这么猖狂下去了，不然整个阿克勒就完了，我一定全力以赴！在此之前我想先确认一件事情，异魔人首领！"
    };
getRow(10293)->
    #show2Cfg {
    id = 10293,
    groupid = 2063,
    taskname = "事态紧急",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10294)->
    #show2Cfg {
    id = 10294,
    groupid = 2064,
    taskname = "匕首的疑点",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "首领请问这是你部族的匕首吗？"
    };
getRow(10295)->
    #show2Cfg {
    id = 10295,
    groupid = 2064,
    taskname = "匕首的疑点",
    npcid = 5066,
    emotion = 0,
    name = "异魔人首领",
    side = 1,
    content = "你怎么会有这个？这的确是我们以前在魔族时用来行刺的匕首，这上面还有我族的徽记。"
    };
getRow(10296)->
    #show2Cfg {
    id = 10296,
    groupid = 2064,
    taskname = "匕首的疑点",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "那这么说你们早已经不在使用这种匕首了对吗？"
    };
getRow(10297)->
    #show2Cfg {
    id = 10297,
    groupid = 2064,
    taskname = "匕首的疑点",
    npcid = 5066,
    emotion = 0,
    name = "异魔人首领",
    side = 1,
    content = "是的！异魔人自从离开魔族后已经很久没有握过匕首了！"
    };
getRow(10298)->
    #show2Cfg {
    id = 10298,
    groupid = 2064,
    taskname = "匕首的疑点",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "果然不出我所料，这是魔族栽赃嫁祸的好手段。那么那些魔族劫匪又把漂浮之石转移到哪里去了呢？先不管漂浮之石了，眼下的两件事情更加急迫。"
    };
getRow(10299)->
    #show2Cfg {
    id = 10299,
    groupid = 2064,
    taskname = "匕首的疑点",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10300)->
    #show2Cfg {
    id = 10300,
    groupid = 2065,
    taskname = "魔族的情报",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 0,
    content = "拷打了这些魔族喽喽得知在前面的农场中，魔族正在筹划一个大阴谋，我先伪装成魔族喽喽混进入探探虚实。"
    };
getRow(10301)->
    #show2Cfg {
    id = 10301,
    groupid = 2065,
    taskname = "魔族的情报",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10302)->
    #show2Cfg {
    id = 10302,
    groupid = 2066,
    taskname = "潜入农场",
    npcid = 5070,
    emotion = 0,
    name = "魔族军官",
    side = 1,
    content = "这炸药怎么还没有运到？"
    };
getRow(10303)->
    #show2Cfg {
    id = 10303,
    groupid = 2066,
    taskname = "潜入农场",
    npcid = 5071,
    emotion = 0,
    name = "魔族士兵",
    side = 1,
    content = "报告，炸药得趁夜晚从运河偷偷运送过来，今晚就能到！"
    };
getRow(10304)->
    #show2Cfg {
    id = 10304,
    groupid = 2066,
    taskname = "潜入农场",
    npcid = 5070,
    emotion = 0,
    name = "魔族军官",
    side = 1,
    content = "很好，拿到了炸药，我们就能把巨石给炸的粉粉碎啦！哈哈。"
    };
getRow(10305)->
    #show2Cfg {
    id = 10305,
    groupid = 2066,
    taskname = "潜入农场",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "（默念）原来他们想用炸药来破解封印呀，看我去阻击他们运送炸药的部队！这地里的沙土一会准能派上大用场，我先抓点揣兜里。"
    };
getRow(10306)->
    #show2Cfg {
    id = 10306,
    groupid = 2066,
    taskname = "潜入农场",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10307)->
    #show2Cfg {
    id = 10307,
    groupid = 2067,
    taskname = "农场沙土",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 0,
    content = "收集好了，我先去运河那边看看情况吧。"
    };
getRow(10308)->
    #show2Cfg {
    id = 10308,
    groupid = 2067,
    taskname = "农场沙土",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10309)->
    #show2Cfg {
    id = 10309,
    groupid = 2068,
    taskname = "保护色",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "这土好像是黄色的…不知道能不能骗过魔族的耳目，不管了~先抹脸上再说。"
    };
getRow(10310)->
    #show2Cfg {
    id = 10310,
    groupid = 2068,
    taskname = "保护色",
    npcid = 5072,
    emotion = 0,
    name = "魔族工程师",
    side = 1,
    content = "（远处的声音）你们都给我把眼睛瞪大了，今天这批货物十分重要，千万别给我捅娄子，马上货物就要抵岸了。"
    };
getRow(10311)->
    #show2Cfg {
    id = 10311,
    groupid = 2068,
    taskname = "保护色",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "看来货物马上就要来了，我得先混进他们的魔族运输部队中去。"
    };
getRow(10312)->
    #show2Cfg {
    id = 10312,
    groupid = 2068,
    taskname = "保护色",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10313)->
    #show2Cfg {
    id = 10313,
    groupid = 2069,
    taskname = "小黄？1",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "我得趁乱混入他们当中，不管了先打起来引起混乱！"
    };
getRow(10314)->
    #show2Cfg {
    id = 10314,
    groupid = 2070,
    taskname = "小黄？2",
    npcid = 5071,
    emotion = 0,
    name = "魔族士兵",
    side = 1,
    content = "搞事情啊？这节骨眼上还再比划？"
    };
getRow(10315)->
    #show2Cfg {
    id = 10315,
    groupid = 2070,
    taskname = "小黄？2",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "老铁！咱们魔族人士得随时保持一颗好斗的心呀，你说是不？"
    };
getRow(10316)->
    #show2Cfg {
    id = 10316,
    groupid = 2070,
    taskname = "小黄？2",
    npcid = 5071,
    emotion = 0,
    name = "魔族士兵",
    side = 1,
    content = "话是没错，不过…你怎么是黄色的，我从来没见过魔族有黄皮肤的呀？"
    };
getRow(10317)->
    #show2Cfg {
    id = 10317,
    groupid = 2070,
    taskname = "小黄？2",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "我是笨纳纳一族的小黄啊？你不记得我了？去年我还给你吃大香蕉呐！"
    };
getRow(10318)->
    #show2Cfg {
    id = 10318,
    groupid = 2070,
    taskname = "小黄？2",
    npcid = 5071,
    emotion = 0,
    name = "魔族士兵",
    side = 1,
    content = "（咽口水）大香蕉？喔~喔~~小黄啊！哎呀，原来是老铁呀~下来我们再交流交流，先忙正事~忙正事！"
    };
getRow(10319)->
    #show2Cfg {
    id = 10319,
    groupid = 2070,
    taskname = "小黄？2",
    npcid = 5071,
    emotion = 0,
    name = "魔族士兵",
    side = 1
    };
getRow(10320)->
    #show2Cfg {
    id = 10320,
    groupid = 2071,
    taskname = "接货",
    npcid = 5073,
    emotion = 0,
    name = "魔族工程师",
    side = 1,
    content = "货物到啦！接货~接货！运输小队给点力，今天就靠你们啦！哦对了，你们谁是负责运送的小队长啊？"
    };
getRow(10321)->
    #show2Cfg {
    id = 10321,
    groupid = 2071,
    taskname = "接货",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "我我我！是我！"
    };
getRow(10322)->
    #show2Cfg {
    id = 10322,
    groupid = 2071,
    taskname = "接货",
    npcid = 5073,
    emotion = 0,
    name = "魔族工程师",
    side = 1,
    content = "魔族工程师：好，就交给你啦，你负责带路，给我盯紧了！出了岔子要你脑袋！"
    };
getRow(10323)->
    #show2Cfg {
    id = 10323,
    groupid = 2071,
    taskname = "接货",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "（心中默念）哼哼哼！看我不给你们带跑偏，然后把你们一个个都咔嚓~咔嚓了！"
    };
getRow(10324)->
    #show2Cfg {
    id = 10324,
    groupid = 2071,
    taskname = "接货",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10325)->
    #show2Cfg {
    id = 10325,
    groupid = 2072,
    taskname = "故入歧途",
    npcid = 5073,
    emotion = 0,
    name = "魔族工程师",
    side = 1,
    content = "（濒死）你…你是什么人！"
    };
getRow(10326)->
    #show2Cfg {
    id = 10326,
    groupid = 2072,
    taskname = "故入歧途",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "哈哈！我是小黄啊！安心的去吧！您嘞~"
    };
getRow(10327)->
    #show2Cfg {
    id = 10327,
    groupid = 2072,
    taskname = "故入歧途",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "我得赶快把这些炸药给销毁！"
    };
getRow(10328)->
    #show2Cfg {
    id = 10328,
    groupid = 2072,
    taskname = "故入歧途",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10329)->
    #show2Cfg {
    id = 10329,
    groupid = 2073,
    taskname = "小心火烛1",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "我可得小心点，这么多炸药，稍有点小磨小擦就能把我给炸上天！"
    };
getRow(10330)->
    #show2Cfg {
    id = 10330,
    groupid = 2074,
    taskname = "小心火烛2",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "总算是把炸药都给销毁了。"
    };
getRow(10331)->
    #show2Cfg {
    id = 10331,
    groupid = 2074,
    taskname = "小心火烛2",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "我想起一件事情，刚才接货旁边的空地上好像有不少魔族神神叨叨的在做什么仪式，我得去看看。"
    };
getRow(10332)->
    #show2Cfg {
    id = 10332,
    groupid = 2074,
    taskname = "小心火烛2",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10333)->
    #show2Cfg {
    id = 10333,
    groupid = 2075,
    taskname = "漂浮的水晶？",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "这些看起像魔族祭司的到底在做什么仪式啊？我得好好瞧瞧~"
    };
getRow(10334)->
    #show2Cfg {
    id = 10334,
    groupid = 2075,
    taskname = "漂浮的水晶？",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "他们围绕中间石柱在念什么咒语，石柱上面好像有个漂浮的水晶。"
    };
getRow(10335)->
    #show2Cfg {
    id = 10335,
    groupid = 2075,
    taskname = "漂浮的水晶？",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "等等~漂浮的水晶？漂浮~水晶？难道…这就是漂浮之石？不会吧？"
    };
getRow(10336)->
    #show2Cfg {
    id = 10336,
    groupid = 2075,
    taskname = "漂浮的水晶？",
    npcid = 5080,
    emotion = 0,
    name = "魔族祭司",
    side = 1,
    content = "什么人？先给我绑了再说！"
    };
getRow(10337)->
    #show2Cfg {
    id = 10337,
    groupid = 2075,
    taskname = "漂浮的水晶？",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "（身体变得好奇怪，好想睡觉）"
    };
getRow(10338)->
    #show2Cfg {
    id = 10338,
    groupid = 2075,
    taskname = "漂浮的水晶？",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10339)->
    #show2Cfg {
    id = 10339,
    groupid = 2076,
    taskname = "放开我！",
    npcid = 5082,
    emotion = 0,
    name = "露娜女神幻象",
    side = 1,
    content = "[fff000]【{PlayerName}】[-]快醒醒，蓝色大陆的守护者！"
    };
getRow(10340)->
    #show2Cfg {
    id = 10340,
    groupid = 2076,
    taskname = "放开我！",
    npcid = 5082,
    emotion = 0,
    name = "露娜女神幻象",
    side = 1
    };
getRow(10341)->
    #show2Cfg {
    id = 10341,
    groupid = 2077,
    taskname = "女神再显",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "我这是在哪里？我怎么了？露娜女神你怎么会在这？"
    };
getRow(10342)->
    #show2Cfg {
    id = 10342,
    groupid = 2077,
    taskname = "女神再显",
    npcid = 5082,
    emotion = 0,
    name = "露娜女神幻象",
    side = 1,
    content = "我感知到了漂浮之石的能量正在被魔化，就用幻象降临并制服了那群把你给催眠的祭司。"
    };
getRow(10343)->
    #show2Cfg {
    id = 10343,
    groupid = 2077,
    taskname = "女神再显",
    npcid = 5082,
    emotion = 0,
    name = "露娜女神幻象",
    side = 1,
    content = "[fff000]【{PlayerName}】[-]恭喜你找到了第一块漂浮之石，不过这块漂浮之石部分已被魔化，我需要将它带回净化才可恢复我的部分神力，干得漂亮，蓝色大陆的守护者！"
    };
getRow(10344)->
    #show2Cfg {
    id = 10344,
    groupid = 2077,
    taskname = "女神再显",
    npcid = 5082,
    emotion = 0,
    name = "露娜女神幻象",
    side = 1,
    content = "勇士，眼下还有即将复苏的魔兽等待你的镇压，这是我的神圣之泪，你肯定用得上！"
    };
getRow(10345)->
    #show2Cfg {
    id = 10345,
    groupid = 2077,
    taskname = "女神再显",
    npcid = 5082,
    emotion = 0,
    name = "露娜女神幻象",
    side = 1
    };
getRow(10346)->
    #show2Cfg {
    id = 10346,
    groupid = 2078,
    taskname = "复命",
    npcid = 5066,
    emotion = 0,
    name = "异魔人首领",
    side = 1,
    content = "[fff000]【{PlayerName}】[-]这么多天你去哪了，大家都在想办法平息复苏的魔兽呢！"
    };
getRow(10347)->
    #show2Cfg {
    id = 10347,
    groupid = 2078,
    taskname = "复命",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "说来话长，魔族的阴魔已经被我揭穿了，就在刚才我还得到了露娜女神的神圣之泪，咱们可以去镇压魔兽啦！"
    };
getRow(10348)->
    #show2Cfg {
    id = 10348,
    groupid = 2078,
    taskname = "复命",
    npcid = 5066,
    emotion = 0,
    name = "异魔人首领",
    side = 1,
    content = "（懵逼）什么！你居然把女神之泪弄到手了？到底发生了什么？时间紧迫，那么我们赶紧前往巨石祭坛镇压魔兽吧！"
    };
getRow(10349)->
    #show2Cfg {
    id = 10349,
    groupid = 2078,
    taskname = "复命",
    npcid = 5066,
    emotion = 0,
    name = "异魔人首领",
    side = 1
    };
getRow(10350)->
    #show2Cfg {
    id = 10350,
    groupid = 2079,
    taskname = "前往祭坛",
    npcid = 5066,
    emotion = 0,
    name = "异魔人首领",
    side = 1,
    content = "不好，前面出现了大批魔族，大家准备作战。"
    };
getRow(10351)->
    #show2Cfg {
    id = 10351,
    groupid = 2079,
    taskname = "前往祭坛",
    npcid = 5066,
    emotion = 0,
    name = "异魔人首领",
    side = 1
    };
getRow(10352)->
    #show2Cfg {
    id = 10352,
    groupid = 2080,
    taskname = "准备作战1",
    npcid = 5066,
    emotion = 0,
    name = "异魔人首领",
    side = 1,
    content = "前面就是巨石祭坛了，我们一定要护送[fff000]【{PlayerName}】[-]到那进行封印！"
    };
getRow(10353)->
    #show2Cfg {
    id = 10353,
    groupid = 2081,
    taskname = "准备作战2",
    npcid = 5066,
    emotion = 0,
    name = "异魔人首领",
    side = 1,
    content = "这里就交给我们了，你快去祭坛用女神之泪封印魔兽！"
    };
getRow(10354)->
    #show2Cfg {
    id = 10354,
    groupid = 2081,
    taskname = "准备作战2",
    npcid = 5066,
    emotion = 0,
    name = "异魔人首领",
    side = 1
    };
getRow(10355)->
    #show2Cfg {
    id = 10355,
    groupid = 2082,
    taskname = "净化巨石祭坛",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "女神之泪应该就这样滴在这里就好了吧？（滴下女神之泪）"
    };
getRow(10356)->
    #show2Cfg {
    id = 10356,
    groupid = 2082,
    taskname = "净化巨石祭坛",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1,
    content = "（一股魔兽之怨气喷涌而出）"
    };
getRow(10357)->
    #show2Cfg {
    id = 10357,
    groupid = 2082,
    taskname = "净化巨石祭坛",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "啊！这股魔兽的怨气十分强大，我的小心对付它！"
    };
getRow(10358)->
    #show2Cfg {
    id = 10358,
    groupid = 2082,
    taskname = "净化巨石祭坛",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10359)->
    #show2Cfg {
    id = 10359,
    groupid = 2083,
    taskname = "平息怨气",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "明明封印了魔兽，怎么又冒出来一股魔兽的怨气呢，还是问问异魔人首领吧"
    };
getRow(10360)->
    #show2Cfg {
    id = 10360,
    groupid = 2083,
    taskname = "平息怨气",
    npcid = 5066,
    emotion = 0,
    name = "异魔人首领",
    side = 1,
    content = "这股冲天的魔兽怨气真是强悍，你居然把它给清除了！[fff000]【{PlayerName}】[-]你的实力已经超出了我的想象！"
    };
getRow(10361)->
    #show2Cfg {
    id = 10361,
    groupid = 2083,
    taskname = "平息怨气",
    npcid = 5066,
    emotion = 0,
    name = "异魔人首领",
    side = 1,
    content = "是时候告诉你真相了，这只魔兽其实就是曾经的魔王坐骑冥驹，很多年前被露娜女神封印在此处，当魔王复苏之时，也就是这只魔兽归来之时，幸好你将这孽畜封印了，但是它怨念的气焰实在高涨，所以才会圣城一股魔兽怨气。"
    };
getRow(10362)->
    #show2Cfg {
    id = 10362,
    groupid = 2083,
    taskname = "平息怨气",
    npcid = 5066,
    emotion = 0,
    name = "异魔人首领",
    side = 1
    };
getRow(10363)->
    #show2Cfg {
    id = 10363,
    groupid = 2084,
    taskname = "异魔人的馈赠",
    npcid = 5066,
    emotion = 0,
    name = "异魔人首领",
    side = 1,
    content = "[fff000]【{PlayerName}】[-]你的功劳我们无人可及，我们异魔人只有薄礼相赠了！"
    };
getRow(10364)->
    #show2Cfg {
    id = 10364,
    groupid = 2084,
    taskname = "异魔人的馈赠",
    npcid = 5066,
    emotion = 0,
    name = "异魔人首领",
    side = 1,
    content = "这是异魔人珍藏的阿克勒城专职推荐信，拥有此信就可前往阿克勒城进行职业专职了，这下你可又要强大更多啦！"
    };
getRow(10365)->
    #show2Cfg {
    id = 10365,
    groupid = 2084,
    taskname = "异魔人的馈赠",
    npcid = 5066,
    emotion = 0,
    name = "异魔人首领",
    side = 1,
    content = "还有一个礼物是我们曾魔族时用来寻找漂浮之石的追踪仪，有了它，你寻找漂浮之石就更加准确方便啦！前方的路途遥远，异魔人为你祈福！"
    };
getRow(10366)->
    #show2Cfg {
    id = 10366,
    groupid = 2084,
    taskname = "异魔人的馈赠",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "（感动ING）真是太感谢这两个馈赠了，对我来说太太主要了！该说再见了，有缘再见！"
    };
getRow(10367)->
    #show2Cfg {
    id = 10367,
    groupid = 2084,
    taskname = "异魔人的馈赠",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10368)->
    #show2Cfg {
    id = 10368,
    groupid = 2085,
    taskname = "故入歧途",
    npcid = 5073,
    emotion = 0,
    name = "魔族工程师",
    side = 1,
    content = "喂喂喂~你这是带的什么路啊？前面是死路啊！来人啊，换个人给我们带路！"
    };
getRow(10369)->
    #show2Cfg {
    id = 10369,
    groupid = 2085,
    taskname = "故入歧途",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "哈哈！没错，就是你们的死路！"
    };
getRow(10370)->
    #show2Cfg {
    id = 10370,
    groupid = 2085,
    taskname = "故入歧途",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10371)->
    #show2Cfg {
    id = 10371,
    groupid = 2086,
    taskname = "魔族的黑科技1",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "转职后简直神清气爽、战力充暴增啊！我已经跃跃欲试想去尝试更高难的挑战了！"
    };
getRow(10372)->
    #show2Cfg {
    id = 10372,
    groupid = 2086,
    taskname = "魔族的黑科技1",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "我就试试这魔族黑科技的能耐吧！看看这玩意儿好不好使！"
    };
getRow(10373)->
    #show2Cfg {
    id = 10373,
    groupid = 2033,
    taskname = "魔族的黑科技2",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "（滴···滴···滴滴···滴滴滴滴····）出现了！雷达上果然发现了漂浮之石的下落，最近的一块好像在苍空之塔附近！"
    };
getRow(10374)->
    #show2Cfg {
    id = 10374,
    groupid = 2033,
    taskname = "魔族的黑科技2",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "事不宜迟，得赶紧出发！"
    };
getRow(10375)->
    #show2Cfg {
    id = 10375,
    groupid = 2033,
    taskname = "魔族的黑科技2",
    npcid = 5022,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "等等！[fff000]【{PlayerName}】[-]，就在刚才我们收到消息，苍空之塔外围被魔族攻占了！国王正下令派军增援呢，我刚才正好听见你说苍空之塔，难道你也要前去？"
    };
getRow(10376)->
    #show2Cfg {
    id = 10376,
    groupid = 2033,
    taskname = "魔族的黑科技2",
    npcid = 5022,
    emotion = 0,
    name = "骑士领主",
    side = 1
    };
getRow(10377)->
    #show2Cfg {
    id = 10377,
    groupid = 2087,
    taskname = "援军出击",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "什么？魔族已经开始行动了？他们肯定也是奔着漂浮之石去的！一定不能让他们得到漂浮之石！"
    };
getRow(10378)->
    #show2Cfg {
    id = 10378,
    groupid = 2087,
    taskname = "援军出击",
    npcid = 5022,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "又是漂浮之石！这该死的魔族，为什么总是抢先我们一步？"
    };
getRow(10379)->
    #show2Cfg {
    id = 10379,
    groupid = 2087,
    taskname = "援军出击",
    npcid = 5022,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "[fff000]【{PlayerName}】[-]走！军队已经集结完毕，我们该出发了！"
    };
getRow(10380)->
    #show2Cfg {
    id = 10380,
    groupid = 2087,
    taskname = "援军出击",
    npcid = 5022,
    emotion = 0,
    name = "骑士领主",
    side = 1
    };
getRow(10381)->
    #show2Cfg {
    id = 10381,
    groupid = 2088,
    taskname = "苍空外围",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "这就是苍空之塔外围了，我们的目的是前往苍空之塔内部阻止魔族夺取漂浮之石，接下来我们要秘密潜入敌军后方，进入苍空之塔。"
    };
getRow(10382)->
    #show2Cfg {
    id = 10382,
    groupid = 2088,
    taskname = "苍空外围",
    npcid = 5111,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "说的没错，现在魔族军队已经把守住了前往苍空之塔内部的各个通道，我们必须要渗透进去，但是我们的军队过于显眼，必须挑选出一只精英小队，先潜入进去牵制。"
    };
getRow(10383)->
    #show2Cfg {
    id = 10383,
    groupid = 2088,
    taskname = "苍空外围",
    npcid = 5111,
    emotion = 0,
    name = "骑士领主",
    side = 1,
    content = "[fff000]【{PlayerName}】[-]你在我们士兵当中挑选出一支精英小队吧！我相信你的眼光与实力！"
    };
getRow(10384)->
    #show2Cfg {
    id = 10384,
    groupid = 2088,
    taskname = "苍空外围",
    npcid = 5111,
    emotion = 0,
    name = "骑士领主",
    side = 1
    };
getRow(10385)->
    #show2Cfg {
    id = 10385,
    groupid = 2089,
    taskname = "集结号",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "恩，士兵们的表现都很出色，不过刚才有几个战士更为抢眼，我们就需要这样的队员！"
    };
getRow(10386)->
    #show2Cfg {
    id = 10386,
    groupid = 2089,
    taskname = "集结号",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "我再考验考验他们的综合素质！毕竟魔族实力远强于我们！一定要优中选优！"
    };
getRow(10387)->
    #show2Cfg {
    id = 10387,
    groupid = 2089,
    taskname = "集结号",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10388)->
    #show2Cfg {
    id = 10388,
    groupid = 2090,
    taskname = "耐力考核",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "居然能跟上我魔鬼的步伐！恭喜你们，耐力测试通过！接下来还有更严格的考核等着你们！"
    };
getRow(10389)->
    #show2Cfg {
    id = 10389,
    groupid = 2090,
    taskname = "耐力考核",
    npcid = 5115,
    emotion = 0,
    name = "队员雷加",
    side = 1,
    content = "不战斗就会输，战斗了可能也会死但也有可能活下来！"
    };
getRow(10390)->
    #show2Cfg {
    id = 10390,
    groupid = 2090,
    taskname = "耐力考核",
    npcid = 5115,
    emotion = 0,
    name = "队员雷加",
    side = 1
    };
getRow(10391)->
    #show2Cfg {
    id = 10391,
    groupid = 2091,
    taskname = "力量考核",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "能跟我扳手腕僵持住的没有几个，很好，力量测试你们也通过了！接下来是最后一项勇气考核！"
    };
getRow(10392)->
    #show2Cfg {
    id = 10392,
    groupid = 2091,
    taskname = "力量考核",
    npcid = 5117,
    emotion = 0,
    name = "队员卓耿",
    side = 1,
    content = "也许我没有什么天赋，唯有斗志，我绝不会输给任何人。"
    };
getRow(10393)->
    #show2Cfg {
    id = 10393,
    groupid = 2091,
    taskname = "力量考核",
    npcid = 5117,
    emotion = 0,
    name = "队员卓耿",
    side = 1
    };
getRow(10394)->
    #show2Cfg {
    id = 10394,
    groupid = 2092,
    taskname = "勇气考核",
    npcid = 5119,
    emotion = 0,
    name = "队员里昂",
    side = 1,
    content = "他们是猎物，而我们才是猎手"
    };
getRow(10395)->
    #show2Cfg {
    id = 10395,
    groupid = 2092,
    taskname = "勇气考核",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "非常好！看见如此恐怖的魔族能冷静与之顽强战斗到底，欢迎你们加入精英小队！勇士们！"
    };
getRow(10396)->
    #show2Cfg {
    id = 10396,
    groupid = 2092,
    taskname = "勇气考核",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "此次行动关系到整个蓝色大陆的生死存亡，我们每个人都要抱着将死的决心！"
    };
getRow(10397)->
    #show2Cfg {
    id = 10397,
    groupid = 2092,
    taskname = "勇气考核",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "现在行动开始！精英小队全员出发！"
    };
getRow(10398)->
    #show2Cfg {
    id = 10398,
    groupid = 2092,
    taskname = "勇气考核",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10399)->
    #show2Cfg {
    id = 10399,
    groupid = 2093,
    taskname = "开往前线",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "魔族军队就在前面不远处了，大家提高警惕！千万不要让魔族发现我们！"
    };
getRow(10400)->
    #show2Cfg {
    id = 10400,
    groupid = 2093,
    taskname = "开往前线",
    npcid = 5115,
    emotion = 0,
    name = "队员雷加",
    side = 1,
    content = "快看，那边有受伤的友军！"
    };
getRow(10401)->
    #show2Cfg {
    id = 10401,
    groupid = 2093,
    taskname = "开往前线",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "我们匍匐过去，不然会被发现的！"
    };
getRow(10402)->
    #show2Cfg {
    id = 10402,
    groupid = 2093,
    taskname = "开往前线",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2
    };
getRow(10403)->
    #show2Cfg {
    id = 10403,
    groupid = 2094,
    taskname = "匍匐营救",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "后面的队员跟上，我先救治眼下的受伤友军！"
    };
getRow(10404)->
    #show2Cfg {
    id = 10404,
    groupid = 2094,
    taskname = "匍匐营救",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10405)->
    #show2Cfg {
    id = 10405,
    groupid = 2095,
    taskname = "救治伤员",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "你受伤太严重了，我只能给你简单的包扎，得有人把你抬回营地去！"
    };
getRow(10406)->
    #show2Cfg {
    id = 10406,
    groupid = 2095,
    taskname = "救治伤员",
    npcid = 5123,
    emotion = 0,
    name = "友军伤员",
    side = 1,
    content = "你们要小心…魔族很厉害，加上这严寒的天气，很容易就送命了，白熊的毛皮可以御寒，你们快去弄点穿上，不然会被冻掉手脚的！"
    };
getRow(10407)->
    #show2Cfg {
    id = 10407,
    groupid = 2095,
    taskname = "救治伤员",
    npcid = 5123,
    emotion = 0,
    name = "友军伤员",
    side = 1
    };
getRow(10408)->
    #show2Cfg {
    id = 10408,
    groupid = 2096,
    taskname = "御寒之物",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "这厚重的毛皮穿上可真暖和，大家都披上，我们准备继续前进了！"
    };
getRow(10409)->
    #show2Cfg {
    id = 10409,
    groupid = 2096,
    taskname = "御寒之物",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10410)->
    #show2Cfg {
    id = 10410,
    groupid = 2097,
    taskname = "可疑的魔族",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "快看！那群魔族在翻箱倒柜的鼓捣着什么！反正肯定不是什么好事，我们先暗中观察看看！"
    };
getRow(10411)->
    #show2Cfg {
    id = 10411,
    groupid = 2097,
    taskname = "可疑的魔族",
    npcid = 5117,
    emotion = 0,
    name = "队员卓耿",
    side = 1,
    content = "这是什么味道，那群魔族正在搬的箱子里有一股臭味！"
    };
getRow(10412)->
    #show2Cfg {
    id = 10412,
    groupid = 2097,
    taskname = "可疑的魔族",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "闻着像硫磺，他们魔族用硫磺做什么，队员们我们得行动了！"
    };
getRow(10413)->
    #show2Cfg {
    id = 10413,
    groupid = 2097,
    taskname = "可疑的魔族",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10414)->
    #show2Cfg {
    id = 10414,
    groupid = 2098,
    taskname = "开始行动",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "快说这些箱桶里装的是什么！你们到底在做什么！"
    };
getRow(10415)->
    #show2Cfg {
    id = 10415,
    groupid = 2098,
    taskname = "开始行动",
    npcid = 5126,
    emotion = 0,
    name = "魔族工头",
    side = 1,
    content = "我是魔族里出了名的嘴硬，你们别想从我这套出半句话！哼~"
    };
getRow(10416)->
    #show2Cfg {
    id = 10416,
    groupid = 2098,
    taskname = "开始行动",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "哈哈，那就对不起了！来人啊，先把这个嘴硬的拖下去，砍了！"
    };
getRow(10417)->
    #show2Cfg {
    id = 10417,
    groupid = 2098,
    taskname = "开始行动",
    npcid = 5126,
    emotion = 0,
    name = "魔族工头",
    side = 1,
    content = "（惊慌失措）为什么…为什么要先杀我！等…等等，我知道一些事情！我说！"
    };
getRow(10418)->
    #show2Cfg {
    id = 10418,
    groupid = 2098,
    taskname = "开始行动",
    npcid = 5126,
    emotion = 0,
    name = "魔族工头",
    side = 1,
    content = "那些硫磺是炼金术尸大人用来制作魔能的原料！他好像要制造魔能来维持什么结界？你看我们硫磺都备好了，正准备给他送过去呢！"
    };
getRow(10419)->
    #show2Cfg {
    id = 10419,
    groupid = 2098,
    taskname = "开始行动",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "恩！那你们就送过去吧，千万不要生事，不然你第一掉脑袋！"
    };
getRow(10420)->
    #show2Cfg {
    id = 10420,
    groupid = 2098,
    taskname = "开始行动",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10421)->
    #show2Cfg {
    id = 10421,
    groupid = 2099,
    taskname = "烫手的货物",
    npcid = 5126,
    emotion = 0,
    name = "魔族工头",
    side = 1,
    content = "（神情紧张）炼..炼大人，这..这是您要的货物，都给你送..送来了！"
    };
getRow(10422)->
    #show2Cfg {
    id = 10422,
    groupid = 2099,
    taskname = "烫手的货物",
    npcid = 5129,
    emotion = 0,
    name = "炼金术尸",
    side = 1,
    content = "喂喂喂！你中邪了啊！给我把话打直了说！这魔能结界快没能量了，你快点！"
    };
getRow(10423)->
    #show2Cfg {
    id = 10423,
    groupid = 2099,
    taskname = "烫手的货物",
    npcid = 5126,
    emotion = 0,
    name = "魔族工头",
    side = 1,
    content = "快快…快…来魔啊！人类混进来啦！"
    };
getRow(10424)->
    #show2Cfg {
    id = 10424,
    groupid = 2099,
    taskname = "烫手的货物",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "该死的，我们暴露了！只能迎战了！"
    };
getRow(10425)->
    #show2Cfg {
    id = 10425,
    groupid = 2099,
    taskname = "烫手的货物",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10426)->
    #show2Cfg {
    id = 10426,
    groupid = 2100,
    taskname = "一不做二不休",
    npcid = 5129,
    emotion = 0,
    name = "炼金术尸",
    side = 1,
    content = "你们是…什么…人（咽气）"
    };
getRow(10427)->
    #show2Cfg {
    id = 10427,
    groupid = 2100,
    taskname = "一不做二不休",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "快！敌人的巡逻队马上就要来了，先把尸体都掩藏起来。"
    };
getRow(10428)->
    #show2Cfg {
    id = 10428,
    groupid = 2100,
    taskname = "一不做二不休",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10429)->
    #show2Cfg {
    id = 10429,
    groupid = 2101,
    taskname = "清理现场",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "现场已经清理干净了！我们走，刚才那炼金术尸说魔能结界什么的，我们去调查一下这个结界在哪！"
    };
getRow(10430)->
    #show2Cfg {
    id = 10430,
    groupid = 2101,
    taskname = "清理现场",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10431)->
    #show2Cfg {
    id = 10431,
    groupid = 2102,
    taskname = "寻找结界",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "结界好像也不在这啊，而且前方好像是魔族的聚集地，魔族人山人海，我们可得小心了！"
    };
getRow(10432)->
    #show2Cfg {
    id = 10432,
    groupid = 2102,
    taskname = "寻找结界",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10433)->
    #show2Cfg {
    id = 10433,
    groupid = 2103,
    taskname = "魔族渐盛",
    npcid = 5119,
    emotion = 0,
    name = "队员里昂",
    side = 1,
    content = "对面应该就是魔族的指挥所了！快看！魔族的指挥官正在指挥他的部下们！"
    };
getRow(10434)->
    #show2Cfg {
    id = 10434,
    groupid = 2103,
    taskname = "魔族渐盛",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "我们在这根本没办法听清他们说什么，我们得接近他们获取情报！"
    };
getRow(10435)->
    #show2Cfg {
    id = 10435,
    groupid = 2103,
    taskname = "魔族渐盛",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "巡逻队马上就要进过这里，我们可以利用陷阱将他们兵力分散开来，逐个击败！然后换上他们的衣服混入魔族内部！"
    };
getRow(10436)->
    #show2Cfg {
    id = 10436,
    groupid = 2103,
    taskname = "魔族渐盛",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10437)->
    #show2Cfg {
    id = 10437,
    groupid = 2104,
    taskname = "双黄弹I",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "左侧的陷阱布置完毕！！"
    };
getRow(10438)->
    #show2Cfg {
    id = 10438,
    groupid = 2104,
    taskname = "双黄弹I",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10439)->
    #show2Cfg {
    id = 10439,
    groupid = 2105,
    taskname = "双黄弹II",
    npcid = 5117,
    emotion = 0,
    name = "队员卓耿",
    side = 1,
    content = "右侧陷阱布置完毕！"
    };
getRow(10440)->
    #show2Cfg {
    id = 10440,
    groupid = 2105,
    taskname = "双黄弹II",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "快看，他们往这边过来了，我们快隐蔽！"
    };
getRow(10441)->
    #show2Cfg {
    id = 10441,
    groupid = 2105,
    taskname = "双黄弹II",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10442)->
    #show2Cfg {
    id = 10442,
    groupid = 2106,
    taskname = "各个击破I",
    npcid = 5137,
    emotion = 0,
    name = "魔族巡逻官",
    side = 1,
    content = "？？？这是什么？大家注意地上有不明物体，警戒！"
    };
getRow(10443)->
    #show2Cfg {
    id = 10443,
    groupid = 2106,
    taskname = "各个击破I",
    npcid = 5138,
    emotion = 0,
    name = "魔族巡逻兵",
    side = 1,
    content = "报告，那边也有！"
    };
getRow(10444)->
    #show2Cfg {
    id = 10444,
    groupid = 2106,
    taskname = "各个击破I",
    npcid = 5137,
    emotion = 0,
    name = "魔族巡逻官",
    side = 1,
    content = "快，你们去看边看看！"
    };
getRow(10445)->
    #show2Cfg {
    id = 10445,
    groupid = 2106,
    taskname = "各个击破I",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "好机会！他们分开了！我们上！"
    };
getRow(10446)->
    #show2Cfg {
    id = 10446,
    groupid = 2107,
    taskname = "各个击破I2",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "右侧的巡逻队还没反应过来！我乘胜追击！"
    };
getRow(10447)->
    #show2Cfg {
    id = 10447,
    groupid = 2107,
    taskname = "各个击破I2",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10448)->
    #show2Cfg {
    id = 10448,
    groupid = 2108,
    taskname = "各个击破II",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "巡逻队被我们消灭了！快我们把他们的衣服都拔下来换上。"
    };
getRow(10449)->
    #show2Cfg {
    id = 10449,
    groupid = 2108,
    taskname = "各个击破II",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10450)->
    #show2Cfg {
    id = 10450,
    groupid = 2109,
    taskname = "佯装",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "把巡逻队的军服都换上，一定要按巡逻队的方式进入。"
    };
getRow(10451)->
    #show2Cfg {
    id = 10451,
    groupid = 2109,
    taskname = "佯装",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10452)->
    #show2Cfg {
    id = 10452,
    groupid = 2110,
    taskname = "打探军情",
    npcid = 5142,
    emotion = 0,
    name = "魔族指挥官",
    side = 1,
    content = "（远处传来）你们是干什么吃的，一个结界都控制不好，苍空之塔的入口必须要被结界覆盖，不然就会暴露在人类的炮火之下！都给我加点紧！"
    };
getRow(10453)->
    #show2Cfg {
    id = 10453,
    groupid = 2110,
    taskname = "打探军情",
    npcid = 5143,
    emotion = 0,
    name = "魔族工兵",
    side = 1,
    content = "是的大人！我们这就去办！"
    };
getRow(10454)->
    #show2Cfg {
    id = 10454,
    groupid = 2110,
    taskname = "打探军情",
    npcid = 5143,
    emotion = 0,
    name = "魔族工兵",
    side = 1
    };
getRow(10455)->
    #show2Cfg {
    id = 10455,
    groupid = 2111,
    taskname = "秘密会议",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "看来结界就在苍空之塔的入口处！不过我们还需要更多的信息，现在只有冒险与魔族的指挥官接触探一探风声了！"
    };
getRow(10456)->
    #show2Cfg {
    id = 10456,
    groupid = 2111,
    taskname = "秘密会议",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "一会大家千万不要说话，就算他魔族指挥官打我们踹我们也千万别再暴露了！"
    };
getRow(10457)->
    #show2Cfg {
    id = 10457,
    groupid = 2111,
    taskname = "秘密会议",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10458)->
    #show2Cfg {
    id = 10458,
    groupid = 2112,
    taskname = "长官你好",
    npcid = 5142,
    emotion = 0,
    name = "魔族指挥官",
    side = 1,
    content = "游手好闲的东西！竖在那干什么？我很好看吗？给我干活去，你们去看守关押人类的俘虏！"
    };
getRow(10459)->
    #show2Cfg {
    id = 10459,
    groupid = 2112,
    taskname = "长官你好",
    npcid = 5142,
    emotion = 0,
    name = "魔族指挥官",
    side = 1
    };
getRow(10460)->
    #show2Cfg {
    id = 10460,
    groupid = 2113,
    taskname = "交接班",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "指挥官大人让我们过来替班！"
    };
getRow(10461)->
    #show2Cfg {
    id = 10461,
    groupid = 2113,
    taskname = "交接班",
    npcid = 5146,
    emotion = 0,
    name = "魔族看守",
    side = 1,
    content = "哈哈！太好了！我正想去打个盹儿！为这几个破俘虏我好几夜都没合眼了！小的们，我们走！"
    };
getRow(10462)->
    #show2Cfg {
    id = 10462,
    groupid = 2113,
    taskname = "交接班",
    npcid = 5146,
    emotion = 0,
    name = "魔族看守",
    side = 1
    };
getRow(10463)->
    #show2Cfg {
    id = 10463,
    groupid = 2114,
    taskname = "暗助俘虏",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "你们别怕，我们是渗透进来的友军。快告诉我们你们身上的枷锁钥匙在哪？我们好进行援救！"
    };
getRow(10464)->
    #show2Cfg {
    id = 10464,
    groupid = 2114,
    taskname = "暗助俘虏",
    npcid = 5148,
    emotion = 0,
    name = "友军俘虏",
    side = 1,
    content = "太好了，友军来就我们了！这枷锁的钥匙应该在魔族指挥官的手中，是他毒打的我们还给我们带上了这枷锁！钥匙肯定在他那！"
    };
getRow(10465)->
    #show2Cfg {
    id = 10465,
    groupid = 2114,
    taskname = "暗助俘虏",
    npcid = 5148,
    emotion = 0,
    name = "友军俘虏",
    side = 1,
    content = "哦对了，魔能结界也是他在负责！你们可得小心啊！他实在太厉害了，不然我们也不会被俘！"
    };
getRow(10466)->
    #show2Cfg {
    id = 10466,
    groupid = 2114,
    taskname = "暗助俘虏",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "放心吧！我们只有办法救你们出去！"
    };
getRow(10467)->
    #show2Cfg {
    id = 10467,
    groupid = 2114,
    taskname = "暗助俘虏",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10468)->
    #show2Cfg {
    id = 10468,
    groupid = 2115,
    taskname = "泼洒硫磺I",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "各位，我们就用刚才运来的硫磺粉把它们洒在魔族营地周围，等我们拿到了钥匙，再一把火把他们魔族给烧个精光！"
    };
getRow(10469)->
    #show2Cfg {
    id = 10469,
    groupid = 2115,
    taskname = "泼洒硫磺I",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10470)->
    #show2Cfg {
    id = 10470,
    groupid = 2116,
    taskname = "泼洒硫磺II",
    npcid = 5115,
    emotion = 0,
    name = "队员雷加",
    side = 1,
    content = "队长硫磺粉都泼洒完毕！"
    };
getRow(10471)->
    #show2Cfg {
    id = 10471,
    groupid = 2116,
    taskname = "泼洒硫磺II",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "很好！各位！考验我们刺杀水平的时候到了，听说这指挥官非常厉害，我们千万要小心行动！"
    };
getRow(10472)->
    #show2Cfg {
    id = 10472,
    groupid = 2116,
    taskname = "泼洒硫磺II",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10473)->
    #show2Cfg {
    id = 10473,
    groupid = 2117,
    taskname = "刺客信条",
    npcid = 5142,
    emotion = 0,
    name = "魔族指挥官",
    side = 1,
    content = "你们…你们是…什么人！快来…来…人（咽气）"
    };
getRow(10474)->
    #show2Cfg {
    id = 10474,
    groupid = 2117,
    taskname = "刺客信条",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "这指挥官果真厉害！刚才差点被他跑掉！"
    };
getRow(10475)->
    #show2Cfg {
    id = 10475,
    groupid = 2117,
    taskname = "刺客信条",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "（搜索）这就是枷锁的钥匙和结界的符石吧？快，点燃硫磺！魔族烧烤开始了！"
    };
getRow(10476)->
    #show2Cfg {
    id = 10476,
    groupid = 2117,
    taskname = "刺客信条",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10477)->
    #show2Cfg {
    id = 10477,
    groupid = 2118,
    taskname = "易燃易爆炸",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "快跑，硫磺被点燃了！我们去解救俘虏！"
    };
getRow(10478)->
    #show2Cfg {
    id = 10478,
    groupid = 2118,
    taskname = "易燃易爆炸",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10479)->
    #show2Cfg {
    id = 10479,
    groupid = 2119,
    taskname = "解救俘虏",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "枷锁被解开了！你们自由了！快往跑！"
    };
getRow(10480)->
    #show2Cfg {
    id = 10480,
    groupid = 2119,
    taskname = "解救俘虏",
    npcid = 5148,
    emotion = 0,
    name = "友军俘虏",
    side = 1,
    content = "你们不跟我一起逃吗？"
    };
getRow(10481)->
    #show2Cfg {
    id = 10481,
    groupid = 2119,
    taskname = "解救俘虏",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "我们还有更重要的事情要去做！快！趁乱逃出去！"
    };
getRow(10482)->
    #show2Cfg {
    id = 10482,
    groupid = 2119,
    taskname = "解救俘虏",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "各位这蓝色火光把整个魔族都惊动了！他们应该都在往这边聚集，我们也趁乱快向结界进发！"
    };
getRow(10483)->
    #show2Cfg {
    id = 10483,
    groupid = 2119,
    taskname = "解救俘虏",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10484)->
    #show2Cfg {
    id = 10484,
    groupid = 2120,
    taskname = "奔向结界",
    npcid = 5119,
    emotion = 0,
    name = "队友里昂",
    side = 1,
    content = "不好，魔族回撤的军队要跟我撞上了！"
    };
getRow(10485)->
    #show2Cfg {
    id = 10485,
    groupid = 2120,
    taskname = "奔向结界",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "快，快下水，我们先到河对面去躲避！"
    };
getRow(10486)->
    #show2Cfg {
    id = 10486,
    groupid = 2120,
    taskname = "奔向结界",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10487)->
    #show2Cfg {
    id = 10487,
    groupid = 2121,
    taskname = "冰冷的河水",
    npcid = 5117,
    emotion = 0,
    name = "队友卓耿",
    side = 1,
    content = "冷…好冷… 这河水可真是冷啊！"
    };
getRow(10488)->
    #show2Cfg {
    id = 10488,
    groupid = 2121,
    taskname = "冰冷的河水",
    npcid = 5115,
    emotion = 0,
    name = "队友雷加",
    side = 1,
    content = "（发抖中）……"
    };
getRow(10489)->
    #show2Cfg {
    id = 10489,
    groupid = 2121,
    taskname = "冰冷的河水",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "快，我们打起来，边战斗边恢复体温！"
    };
getRow(10490)->
    #show2Cfg {
    id = 10490,
    groupid = 2121,
    taskname = "冰冷的河水",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10491)->
    #show2Cfg {
    id = 10491,
    groupid = 2122,
    taskname = "切磋取暖",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "果然战斗才是最热血的取暖方式，我现在热血沸腾了！"
    };
getRow(10492)->
    #show2Cfg {
    id = 10492,
    groupid = 2122,
    taskname = "切磋取暖",
    npcid = 5119,
    emotion = 0,
    name = "队员里昂",
    side = 1,
    content = "是啊，一场战斗打下来，我们满头大汗！快看，他们魔族大部队都已经返回了！"
    };
getRow(10493)->
    #show2Cfg {
    id = 10493,
    groupid = 2122,
    taskname = "切磋取暖",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "我们走！继续向结界进发！"
    };
getRow(10494)->
    #show2Cfg {
    id = 10494,
    groupid = 2122,
    taskname = "切磋取暖",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10495)->
    #show2Cfg {
    id = 10495,
    groupid = 2123,
    taskname = "重返大路",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "前面就是苍空之塔的入口，魔能结界所在之处了！魔族虽然走得匆忙，但肯定留下了不少部队，我们还是得小心行事！先去前面观察看看具体情况！"
    };
getRow(10496)->
    #show2Cfg {
    id = 10496,
    groupid = 2123,
    taskname = "重返大路",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10497)->
    #show2Cfg {
    id = 10497,
    groupid = 2124,
    taskname = "观察魔族动向",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "太好了！魔族基本都撤回去了，现在就只剩下几股残部在驻守！我们一定能拿下他们的！"
    };
getRow(10498)->
    #show2Cfg {
    id = 10498,
    groupid = 2124,
    taskname = "观察魔族动向",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "我们上！"
    };
getRow(10499)->
    #show2Cfg {
    id = 10499,
    groupid = 2124,
    taskname = "观察魔族动向",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10500)->
    #show2Cfg {
    id = 10500,
    groupid = 2125,
    taskname = "偷袭魔族残部I",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "那边还有一股魔族残部！灭了他们！"
    };
getRow(10501)->
    #show2Cfg {
    id = 10501,
    groupid = 2125,
    taskname = "偷袭魔族残部I",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10502)->
    #show2Cfg {
    id = 10502,
    groupid = 2126,
    taskname = "偷袭魔族残部II",
    npcid = 5117,
    emotion = 0,
    name = "队友卓耿",
    side = 1,
    content = "队长，魔族残部都已经消灭掉了！"
    };
getRow(10503)->
    #show2Cfg {
    id = 10503,
    groupid = 2126,
    taskname = "偷袭魔族残部II",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "快我们去关闭结界，魔族主力肯定还会回来的！"
    };
getRow(10504)->
    #show2Cfg {
    id = 10504,
    groupid = 2126,
    taskname = "偷袭魔族残部II",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10505)->
    #show2Cfg {
    id = 10505,
    groupid = 2127,
    taskname = "关闭魔能结界",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "魔能结界关闭了！苍空之塔的大门打开了！冲啊！跟我一起进入苍空之塔！"
    };
getRow(10506)->
    #show2Cfg {
    id = 10506,
    groupid = 2127,
    taskname = "关闭魔能结界",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(10507)->
    #show2Cfg {
    id = 10507,
    groupid = 2128,
    taskname = "苍空之塔",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 2,
    content = "这里就是苍空之塔内部了！快看，这里有魔族经过留下的痕迹！"
    };
getRow(10508)->
    #show2Cfg {
    id = 10508,
    groupid = 2128,
    taskname = "苍空之塔",
    npcid = 0,
    emotion = 0,
    name = "0",
    side = 1
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
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
    {770},
    {771},
    {772},
    {773},
    {774},
    {775},
    {776},
    {777},
    {778},
    {779},
    {780},
    {781},
    {782},
    {783},
    {784},
    {785},
    {786},
    {787},
    {788},
    {789},
    {790},
    {791},
    {792},
    {793},
    {794},
    {795},
    {796},
    {797},
    {798},
    {799},
    {800},
    {801},
    {802},
    {803},
    {804},
    {805},
    {806},
    {807},
    {808},
    {809},
    {810},
    {811},
    {812},
    {813},
    {814},
    {815},
    {816},
    {817},
    {818},
    {819},
    {820},
    {821},
    {822},
    {823},
    {824},
    {825},
    {826},
    {827},
    {828},
    {829},
    {830},
    {831},
    {832},
    {833},
    {834},
    {835},
    {836},
    {837},
    {838},
    {839},
    {840},
    {841},
    {842},
    {843},
    {844},
    {845},
    {846},
    {847},
    {848},
    {849},
    {850},
    {851},
    {852},
    {853},
    {854},
    {855},
    {856},
    {857},
    {858},
    {859},
    {860},
    {861},
    {862},
    {863},
    {864},
    {865},
    {866},
    {867},
    {868},
    {869},
    {870},
    {871},
    {872},
    {873},
    {874},
    {875},
    {876},
    {877},
    {878},
    {879},
    {880},
    {881},
    {882},
    {883},
    {884},
    {885},
    {886},
    {887},
    {888},
    {889},
    {890},
    {891},
    {892},
    {893},
    {894},
    {895},
    {896},
    {897},
    {898},
    {899},
    {900},
    {901},
    {902},
    {903},
    {904},
    {905},
    {906},
    {907},
    {908},
    {909},
    {910},
    {911},
    {912},
    {913},
    {914},
    {915},
    {916},
    {917},
    {918},
    {919},
    {920},
    {921},
    {922},
    {923},
    {924},
    {925},
    {926},
    {927},
    {928},
    {929},
    {930},
    {931},
    {932},
    {933},
    {934},
    {935},
    {936},
    {937},
    {938},
    {939},
    {940},
    {941},
    {942},
    {943},
    {944},
    {945},
    {946},
    {947},
    {948},
    {949},
    {950},
    {951},
    {952},
    {953},
    {954},
    {955},
    {956},
    {957},
    {958},
    {959},
    {960},
    {961},
    {962},
    {963},
    {964},
    {965},
    {966},
    {967},
    {968},
    {969},
    {970},
    {971},
    {972},
    {973},
    {974},
    {975},
    {976},
    {977},
    {978},
    {979},
    {980},
    {981},
    {982},
    {983},
    {984},
    {985},
    {986},
    {987},
    {988},
    {989},
    {990},
    {991},
    {992},
    {993},
    {994},
    {995},
    {996},
    {997},
    {998},
    {999},
    {1000},
    {1001},
    {1002},
    {1003},
    {1004},
    {1005},
    {1006},
    {1007},
    {1008},
    {1009},
    {1010},
    {1011},
    {1012},
    {1013},
    {1014},
    {1015},
    {1016},
    {1017},
    {1018},
    {1019},
    {1020},
    {1021},
    {1022},
    {1023},
    {1024},
    {1025},
    {1026},
    {1027},
    {1028},
    {1029},
    {1030},
    {1031},
    {1032},
    {1033},
    {1034},
    {1035},
    {1036},
    {1037},
    {1038},
    {1039},
    {1040},
    {1041},
    {1042},
    {1043},
    {1044},
    {1045},
    {1046},
    {1047},
    {1048},
    {1049},
    {1050},
    {1051},
    {1052},
    {1053},
    {1054},
    {1055},
    {1056},
    {1057},
    {1058},
    {1059},
    {1060},
    {1061},
    {1062},
    {1063},
    {1064},
    {1065},
    {1066},
    {1067},
    {1068},
    {1069},
    {1070},
    {1071},
    {1072},
    {1073},
    {1074},
    {1075},
    {1076},
    {1077},
    {1078},
    {1079},
    {1080},
    {1081},
    {1082},
    {1083},
    {1084},
    {1085},
    {1086},
    {1087},
    {1088},
    {1089},
    {1090},
    {1091},
    {1092},
    {1093},
    {1094},
    {1095},
    {1096},
    {1097},
    {1098},
    {1099},
    {1100},
    {1101},
    {1102},
    {1103},
    {1104},
    {1105},
    {1106},
    {1107},
    {1108},
    {1109},
    {1110},
    {1111},
    {1112},
    {1113},
    {1114},
    {1115},
    {1116},
    {1117},
    {1118},
    {1119},
    {1120},
    {1121},
    {1122},
    {1123},
    {1124},
    {1125},
    {1126},
    {1127},
    {1128},
    {1129},
    {1130},
    {1131},
    {1132},
    {1133},
    {1134},
    {1135},
    {1136},
    {1137},
    {1138},
    {1139},
    {1140},
    {1141},
    {1142},
    {1143},
    {1144},
    {1145},
    {1146},
    {1147},
    {1148},
    {1149},
    {1150},
    {1151},
    {1152},
    {1153},
    {1154},
    {1155},
    {1156},
    {1157},
    {1158},
    {1159},
    {1160},
    {1161},
    {1162},
    {1163},
    {1164},
    {1165},
    {1166},
    {1167},
    {1168},
    {1169},
    {1170},
    {1171},
    {1172},
    {1173},
    {1174},
    {1175},
    {1176},
    {1177},
    {1178},
    {1179},
    {1180},
    {1181},
    {1182},
    {1183},
    {1184},
    {1185},
    {1186},
    {1187},
    {1188},
    {1189},
    {1190},
    {1191},
    {1192},
    {1193},
    {1194},
    {1195},
    {1196},
    {1197},
    {1198},
    {1199},
    {1200},
    {1201},
    {1202},
    {1203},
    {1204},
    {1205},
    {1206},
    {1207},
    {1208},
    {1209},
    {1210},
    {1211},
    {1212},
    {1213},
    {1214},
    {1215},
    {1216},
    {1217},
    {1218},
    {1219},
    {1220},
    {1221},
    {1222},
    {1223},
    {1224},
    {1225},
    {1226},
    {1227},
    {1228},
    {1229},
    {1230},
    {1231},
    {1232},
    {1233},
    {1234},
    {1235},
    {1236},
    {1237},
    {1238},
    {1239},
    {1240},
    {1241},
    {1242},
    {1243},
    {1244},
    {1245},
    {1246},
    {1247},
    {1248},
    {1249},
    {1250},
    {1251},
    {1252},
    {1253},
    {1254},
    {1255},
    {6000},
    {6001},
    {7000},
    {10000},
    {10001},
    {10002},
    {10003},
    {10004},
    {10005},
    {10006},
    {10007},
    {10008},
    {10009},
    {10010},
    {10011},
    {10012},
    {10013},
    {10014},
    {10015},
    {10016},
    {10017},
    {10018},
    {10019},
    {10020},
    {10021},
    {10022},
    {10023},
    {10024},
    {10025},
    {10026},
    {10027},
    {10028},
    {10029},
    {10030},
    {10031},
    {10032},
    {10033},
    {10034},
    {10035},
    {10036},
    {10037},
    {10038},
    {10039},
    {10040},
    {10041},
    {10042},
    {10043},
    {10044},
    {10045},
    {10046},
    {10047},
    {10048},
    {10049},
    {10050},
    {10051},
    {10052},
    {10053},
    {10054},
    {10055},
    {10056},
    {10057},
    {10058},
    {10059},
    {10060},
    {10061},
    {10062},
    {10063},
    {10064},
    {10065},
    {10066},
    {10067},
    {10068},
    {10069},
    {10070},
    {10071},
    {10072},
    {10073},
    {10074},
    {10075},
    {10076},
    {10077},
    {10078},
    {10079},
    {10080},
    {10081},
    {10082},
    {10083},
    {10084},
    {10085},
    {10086},
    {10087},
    {10088},
    {10089},
    {10090},
    {10091},
    {10092},
    {10093},
    {10094},
    {10095},
    {10096},
    {10097},
    {10098},
    {10099},
    {10100},
    {10101},
    {10102},
    {10103},
    {10104},
    {10105},
    {10106},
    {10107},
    {10108},
    {10109},
    {10110},
    {10111},
    {10112},
    {10113},
    {10114},
    {10115},
    {10116},
    {10117},
    {10118},
    {10119},
    {10120},
    {10121},
    {10122},
    {10123},
    {10124},
    {10125},
    {10126},
    {10127},
    {10128},
    {10129},
    {10130},
    {10131},
    {10132},
    {10133},
    {10134},
    {10135},
    {10136},
    {10137},
    {10138},
    {10139},
    {10140},
    {10141},
    {10142},
    {10143},
    {10144},
    {10145},
    {10146},
    {10147},
    {10148},
    {10149},
    {10151},
    {10152},
    {10153},
    {10154},
    {10155},
    {10156},
    {10157},
    {10158},
    {10159},
    {10160},
    {10161},
    {10162},
    {10163},
    {10164},
    {10165},
    {10166},
    {10167},
    {10168},
    {10169},
    {10170},
    {10171},
    {10172},
    {10173},
    {10174},
    {10175},
    {10176},
    {10177},
    {10178},
    {10179},
    {10180},
    {10181},
    {10182},
    {10183},
    {10184},
    {10185},
    {10186},
    {10187},
    {10188},
    {10189},
    {10190},
    {10191},
    {10192},
    {10193},
    {10194},
    {10195},
    {10196},
    {10197},
    {10198},
    {10199},
    {10200},
    {10201},
    {10202},
    {10203},
    {10204},
    {10205},
    {10206},
    {10207},
    {10208},
    {10209},
    {10210},
    {10211},
    {10212},
    {10213},
    {10214},
    {10215},
    {10216},
    {10217},
    {10218},
    {10219},
    {10220},
    {10221},
    {10222},
    {10223},
    {10224},
    {10225},
    {10226},
    {10227},
    {10228},
    {10229},
    {10230},
    {10231},
    {10232},
    {10233},
    {10234},
    {10235},
    {10236},
    {10237},
    {10238},
    {10239},
    {10240},
    {10241},
    {10242},
    {10243},
    {10244},
    {10245},
    {10246},
    {10247},
    {10248},
    {10249},
    {10250},
    {10251},
    {10252},
    {10253},
    {10254},
    {10255},
    {10256},
    {10257},
    {10258},
    {10259},
    {10260},
    {10261},
    {10262},
    {10263},
    {10264},
    {10265},
    {10266},
    {10267},
    {10268},
    {10269},
    {10270},
    {10271},
    {10272},
    {10273},
    {10274},
    {10275},
    {10276},
    {10277},
    {10278},
    {10279},
    {10280},
    {10281},
    {10282},
    {10283},
    {10284},
    {10285},
    {10286},
    {10287},
    {10288},
    {10289},
    {10290},
    {10291},
    {10292},
    {10293},
    {10294},
    {10295},
    {10296},
    {10297},
    {10298},
    {10299},
    {10300},
    {10301},
    {10302},
    {10303},
    {10304},
    {10305},
    {10306},
    {10307},
    {10308},
    {10309},
    {10310},
    {10311},
    {10312},
    {10313},
    {10314},
    {10315},
    {10316},
    {10317},
    {10318},
    {10319},
    {10320},
    {10321},
    {10322},
    {10323},
    {10324},
    {10325},
    {10326},
    {10327},
    {10328},
    {10329},
    {10330},
    {10331},
    {10332},
    {10333},
    {10334},
    {10335},
    {10336},
    {10337},
    {10338},
    {10339},
    {10340},
    {10341},
    {10342},
    {10343},
    {10344},
    {10345},
    {10346},
    {10347},
    {10348},
    {10349},
    {10350},
    {10351},
    {10352},
    {10353},
    {10354},
    {10355},
    {10356},
    {10357},
    {10358},
    {10359},
    {10360},
    {10361},
    {10362},
    {10363},
    {10364},
    {10365},
    {10366},
    {10367},
    {10368},
    {10369},
    {10370},
    {10371},
    {10372},
    {10373},
    {10374},
    {10375},
    {10376},
    {10377},
    {10378},
    {10379},
    {10380},
    {10381},
    {10382},
    {10383},
    {10384},
    {10385},
    {10386},
    {10387},
    {10388},
    {10389},
    {10390},
    {10391},
    {10392},
    {10393},
    {10394},
    {10395},
    {10396},
    {10397},
    {10398},
    {10399},
    {10400},
    {10401},
    {10402},
    {10403},
    {10404},
    {10405},
    {10406},
    {10407},
    {10408},
    {10409},
    {10410},
    {10411},
    {10412},
    {10413},
    {10414},
    {10415},
    {10416},
    {10417},
    {10418},
    {10419},
    {10420},
    {10421},
    {10422},
    {10423},
    {10424},
    {10425},
    {10426},
    {10427},
    {10428},
    {10429},
    {10430},
    {10431},
    {10432},
    {10433},
    {10434},
    {10435},
    {10436},
    {10437},
    {10438},
    {10439},
    {10440},
    {10441},
    {10442},
    {10443},
    {10444},
    {10445},
    {10446},
    {10447},
    {10448},
    {10449},
    {10450},
    {10451},
    {10452},
    {10453},
    {10454},
    {10455},
    {10456},
    {10457},
    {10458},
    {10459},
    {10460},
    {10461},
    {10462},
    {10463},
    {10464},
    {10465},
    {10466},
    {10467},
    {10468},
    {10469},
    {10470},
    {10471},
    {10472},
    {10473},
    {10474},
    {10475},
    {10476},
    {10477},
    {10478},
    {10479},
    {10480},
    {10481},
    {10482},
    {10483},
    {10484},
    {10485},
    {10486},
    {10487},
    {10488},
    {10489},
    {10490},
    {10491},
    {10492},
    {10493},
    {10494},
    {10495},
    {10496},
    {10497},
    {10498},
    {10499},
    {10500},
    {10501},
    {10502},
    {10503},
    {10504},
    {10505},
    {10506},
    {10507},
    {10508}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
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
    770,
    771,
    772,
    773,
    774,
    775,
    776,
    777,
    778,
    779,
    780,
    781,
    782,
    783,
    784,
    785,
    786,
    787,
    788,
    789,
    790,
    791,
    792,
    793,
    794,
    795,
    796,
    797,
    798,
    799,
    800,
    801,
    802,
    803,
    804,
    805,
    806,
    807,
    808,
    809,
    810,
    811,
    812,
    813,
    814,
    815,
    816,
    817,
    818,
    819,
    820,
    821,
    822,
    823,
    824,
    825,
    826,
    827,
    828,
    829,
    830,
    831,
    832,
    833,
    834,
    835,
    836,
    837,
    838,
    839,
    840,
    841,
    842,
    843,
    844,
    845,
    846,
    847,
    848,
    849,
    850,
    851,
    852,
    853,
    854,
    855,
    856,
    857,
    858,
    859,
    860,
    861,
    862,
    863,
    864,
    865,
    866,
    867,
    868,
    869,
    870,
    871,
    872,
    873,
    874,
    875,
    876,
    877,
    878,
    879,
    880,
    881,
    882,
    883,
    884,
    885,
    886,
    887,
    888,
    889,
    890,
    891,
    892,
    893,
    894,
    895,
    896,
    897,
    898,
    899,
    900,
    901,
    902,
    903,
    904,
    905,
    906,
    907,
    908,
    909,
    910,
    911,
    912,
    913,
    914,
    915,
    916,
    917,
    918,
    919,
    920,
    921,
    922,
    923,
    924,
    925,
    926,
    927,
    928,
    929,
    930,
    931,
    932,
    933,
    934,
    935,
    936,
    937,
    938,
    939,
    940,
    941,
    942,
    943,
    944,
    945,
    946,
    947,
    948,
    949,
    950,
    951,
    952,
    953,
    954,
    955,
    956,
    957,
    958,
    959,
    960,
    961,
    962,
    963,
    964,
    965,
    966,
    967,
    968,
    969,
    970,
    971,
    972,
    973,
    974,
    975,
    976,
    977,
    978,
    979,
    980,
    981,
    982,
    983,
    984,
    985,
    986,
    987,
    988,
    989,
    990,
    991,
    992,
    993,
    994,
    995,
    996,
    997,
    998,
    999,
    1000,
    1001,
    1002,
    1003,
    1004,
    1005,
    1006,
    1007,
    1008,
    1009,
    1010,
    1011,
    1012,
    1013,
    1014,
    1015,
    1016,
    1017,
    1018,
    1019,
    1020,
    1021,
    1022,
    1023,
    1024,
    1025,
    1026,
    1027,
    1028,
    1029,
    1030,
    1031,
    1032,
    1033,
    1034,
    1035,
    1036,
    1037,
    1038,
    1039,
    1040,
    1041,
    1042,
    1043,
    1044,
    1045,
    1046,
    1047,
    1048,
    1049,
    1050,
    1051,
    1052,
    1053,
    1054,
    1055,
    1056,
    1057,
    1058,
    1059,
    1060,
    1061,
    1062,
    1063,
    1064,
    1065,
    1066,
    1067,
    1068,
    1069,
    1070,
    1071,
    1072,
    1073,
    1074,
    1075,
    1076,
    1077,
    1078,
    1079,
    1080,
    1081,
    1082,
    1083,
    1084,
    1085,
    1086,
    1087,
    1088,
    1089,
    1090,
    1091,
    1092,
    1093,
    1094,
    1095,
    1096,
    1097,
    1098,
    1099,
    1100,
    1101,
    1102,
    1103,
    1104,
    1105,
    1106,
    1107,
    1108,
    1109,
    1110,
    1111,
    1112,
    1113,
    1114,
    1115,
    1116,
    1117,
    1118,
    1119,
    1120,
    1121,
    1122,
    1123,
    1124,
    1125,
    1126,
    1127,
    1128,
    1129,
    1130,
    1131,
    1132,
    1133,
    1134,
    1135,
    1136,
    1137,
    1138,
    1139,
    1140,
    1141,
    1142,
    1143,
    1144,
    1145,
    1146,
    1147,
    1148,
    1149,
    1150,
    1151,
    1152,
    1153,
    1154,
    1155,
    1156,
    1157,
    1158,
    1159,
    1160,
    1161,
    1162,
    1163,
    1164,
    1165,
    1166,
    1167,
    1168,
    1169,
    1170,
    1171,
    1172,
    1173,
    1174,
    1175,
    1176,
    1177,
    1178,
    1179,
    1180,
    1181,
    1182,
    1183,
    1184,
    1185,
    1186,
    1187,
    1188,
    1189,
    1190,
    1191,
    1192,
    1193,
    1194,
    1195,
    1196,
    1197,
    1198,
    1199,
    1200,
    1201,
    1202,
    1203,
    1204,
    1205,
    1206,
    1207,
    1208,
    1209,
    1210,
    1211,
    1212,
    1213,
    1214,
    1215,
    1216,
    1217,
    1218,
    1219,
    1220,
    1221,
    1222,
    1223,
    1224,
    1225,
    1226,
    1227,
    1228,
    1229,
    1230,
    1231,
    1232,
    1233,
    1234,
    1235,
    1236,
    1237,
    1238,
    1239,
    1240,
    1241,
    1242,
    1243,
    1244,
    1245,
    1246,
    1247,
    1248,
    1249,
    1250,
    1251,
    1252,
    1253,
    1254,
    1255,
    6000,
    6001,
    7000,
    10000,
    10001,
    10002,
    10003,
    10004,
    10005,
    10006,
    10007,
    10008,
    10009,
    10010,
    10011,
    10012,
    10013,
    10014,
    10015,
    10016,
    10017,
    10018,
    10019,
    10020,
    10021,
    10022,
    10023,
    10024,
    10025,
    10026,
    10027,
    10028,
    10029,
    10030,
    10031,
    10032,
    10033,
    10034,
    10035,
    10036,
    10037,
    10038,
    10039,
    10040,
    10041,
    10042,
    10043,
    10044,
    10045,
    10046,
    10047,
    10048,
    10049,
    10050,
    10051,
    10052,
    10053,
    10054,
    10055,
    10056,
    10057,
    10058,
    10059,
    10060,
    10061,
    10062,
    10063,
    10064,
    10065,
    10066,
    10067,
    10068,
    10069,
    10070,
    10071,
    10072,
    10073,
    10074,
    10075,
    10076,
    10077,
    10078,
    10079,
    10080,
    10081,
    10082,
    10083,
    10084,
    10085,
    10086,
    10087,
    10088,
    10089,
    10090,
    10091,
    10092,
    10093,
    10094,
    10095,
    10096,
    10097,
    10098,
    10099,
    10100,
    10101,
    10102,
    10103,
    10104,
    10105,
    10106,
    10107,
    10108,
    10109,
    10110,
    10111,
    10112,
    10113,
    10114,
    10115,
    10116,
    10117,
    10118,
    10119,
    10120,
    10121,
    10122,
    10123,
    10124,
    10125,
    10126,
    10127,
    10128,
    10129,
    10130,
    10131,
    10132,
    10133,
    10134,
    10135,
    10136,
    10137,
    10138,
    10139,
    10140,
    10141,
    10142,
    10143,
    10144,
    10145,
    10146,
    10147,
    10148,
    10149,
    10151,
    10152,
    10153,
    10154,
    10155,
    10156,
    10157,
    10158,
    10159,
    10160,
    10161,
    10162,
    10163,
    10164,
    10165,
    10166,
    10167,
    10168,
    10169,
    10170,
    10171,
    10172,
    10173,
    10174,
    10175,
    10176,
    10177,
    10178,
    10179,
    10180,
    10181,
    10182,
    10183,
    10184,
    10185,
    10186,
    10187,
    10188,
    10189,
    10190,
    10191,
    10192,
    10193,
    10194,
    10195,
    10196,
    10197,
    10198,
    10199,
    10200,
    10201,
    10202,
    10203,
    10204,
    10205,
    10206,
    10207,
    10208,
    10209,
    10210,
    10211,
    10212,
    10213,
    10214,
    10215,
    10216,
    10217,
    10218,
    10219,
    10220,
    10221,
    10222,
    10223,
    10224,
    10225,
    10226,
    10227,
    10228,
    10229,
    10230,
    10231,
    10232,
    10233,
    10234,
    10235,
    10236,
    10237,
    10238,
    10239,
    10240,
    10241,
    10242,
    10243,
    10244,
    10245,
    10246,
    10247,
    10248,
    10249,
    10250,
    10251,
    10252,
    10253,
    10254,
    10255,
    10256,
    10257,
    10258,
    10259,
    10260,
    10261,
    10262,
    10263,
    10264,
    10265,
    10266,
    10267,
    10268,
    10269,
    10270,
    10271,
    10272,
    10273,
    10274,
    10275,
    10276,
    10277,
    10278,
    10279,
    10280,
    10281,
    10282,
    10283,
    10284,
    10285,
    10286,
    10287,
    10288,
    10289,
    10290,
    10291,
    10292,
    10293,
    10294,
    10295,
    10296,
    10297,
    10298,
    10299,
    10300,
    10301,
    10302,
    10303,
    10304,
    10305,
    10306,
    10307,
    10308,
    10309,
    10310,
    10311,
    10312,
    10313,
    10314,
    10315,
    10316,
    10317,
    10318,
    10319,
    10320,
    10321,
    10322,
    10323,
    10324,
    10325,
    10326,
    10327,
    10328,
    10329,
    10330,
    10331,
    10332,
    10333,
    10334,
    10335,
    10336,
    10337,
    10338,
    10339,
    10340,
    10341,
    10342,
    10343,
    10344,
    10345,
    10346,
    10347,
    10348,
    10349,
    10350,
    10351,
    10352,
    10353,
    10354,
    10355,
    10356,
    10357,
    10358,
    10359,
    10360,
    10361,
    10362,
    10363,
    10364,
    10365,
    10366,
    10367,
    10368,
    10369,
    10370,
    10371,
    10372,
    10373,
    10374,
    10375,
    10376,
    10377,
    10378,
    10379,
    10380,
    10381,
    10382,
    10383,
    10384,
    10385,
    10386,
    10387,
    10388,
    10389,
    10390,
    10391,
    10392,
    10393,
    10394,
    10395,
    10396,
    10397,
    10398,
    10399,
    10400,
    10401,
    10402,
    10403,
    10404,
    10405,
    10406,
    10407,
    10408,
    10409,
    10410,
    10411,
    10412,
    10413,
    10414,
    10415,
    10416,
    10417,
    10418,
    10419,
    10420,
    10421,
    10422,
    10423,
    10424,
    10425,
    10426,
    10427,
    10428,
    10429,
    10430,
    10431,
    10432,
    10433,
    10434,
    10435,
    10436,
    10437,
    10438,
    10439,
    10440,
    10441,
    10442,
    10443,
    10444,
    10445,
    10446,
    10447,
    10448,
    10449,
    10450,
    10451,
    10452,
    10453,
    10454,
    10455,
    10456,
    10457,
    10458,
    10459,
    10460,
    10461,
    10462,
    10463,
    10464,
    10465,
    10466,
    10467,
    10468,
    10469,
    10470,
    10471,
    10472,
    10473,
    10474,
    10475,
    10476,
    10477,
    10478,
    10479,
    10480,
    10481,
    10482,
    10483,
    10484,
    10485,
    10486,
    10487,
    10488,
    10489,
    10490,
    10491,
    10492,
    10493,
    10494,
    10495,
    10496,
    10497,
    10498,
    10499,
    10500,
    10501,
    10502,
    10503,
    10504,
    10505,
    10506,
    10507,
    10508
    ].

