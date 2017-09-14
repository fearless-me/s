%% coding: latin-1
%%: 实现
-module(cfg_monsterbox_chs).
-compile(export_all).
-include("cfg_monsterbox.hrl").
-include("logger.hrl").

getRow(1)->
    #monsterboxCfg {
    id = 1,
    monsterid = 1,
    trigger1 = [0,1,3],
    odds1 = 100,
    p0 = "请勿删除",
    p1 = "请勿删除",
    p2 = "请勿删除",
    p3 = "请勿删除",
    p4 = "请勿删除",
    p5 = "请勿删除",
    time = 1,
    trigger2 = [0,1,3],
    odds2 = 100,
    param2 = [-1,1]
    };
getRow(2)->
    #monsterboxCfg {
    id = 2,
    monsterid = 9202,
    trigger1 = [0,1,5],
    odds1 = 60,
    p0 = "大王最喜欢萝莉了！",
    p1 = "轻点，你弄疼我了！",
    p5 = "大王叫我来寻山啊啊啊啊",
    time = 10,
    odds2 = 0
    };
getRow(3)->
    #monsterboxCfg {
    id = 3,
    monsterid = 9202,
    trigger1 = [0,5],
    odds1 = 60,
    p0 = "大王最喜欢小萝莉了！",
    p5 = "今天嗓子痛，不唱歌！",
    time = 10,
    odds2 = 0
    };
getRow(4)->
    #monsterboxCfg {
    id = 4,
    monsterid = 9202,
    trigger1 = [0],
    odds1 = 60,
    p0 = "大王最喜欢头戴飘带的小萝莉了！",
    p5 = "你们唱的真难听！",
    time = 10,
    odds2 = 0
    };
getRow(5)->
    #monsterboxCfg {
    id = 5,
    monsterid = 9203,
    trigger1 = [0,5],
    odds1 = 60,
    p0 = "今晚吃些什么呢？",
    p5 = "你们这群无知的人类！",
    time = 10,
    odds2 = 0
    };
getRow(6)->
    #monsterboxCfg {
    id = 6,
    monsterid = 9203,
    trigger1 = [0],
    odds1 = 60,
    p0 = "请叫我绅士，我讨厌大王这个词儿！",
    time = 10,
    odds2 = 0
    };
getRow(7)->
    #monsterboxCfg {
    id = 7,
    monsterid = 9203,
    trigger1 = [0],
    odds1 = 60,
    p0 = "清蒸，炭烤还是油炸呢？",
    time = 10,
    odds2 = 0
    };
getRow(8)->
    #monsterboxCfg {
    id = 8,
    monsterid = 9203,
    trigger1 = [0],
    odds1 = 60,
    p0 = "我的手下都是一群音乐家~哦吼吼",
    time = 10,
    odds2 = 0
    };
getRow(9)->
    #monsterboxCfg {
    id = 9,
    monsterid = 9205,
    trigger1 = [0,1,5],
    odds1 = 60,
    p0 = "大王最喜欢萝莉了！",
    p1 = "轻点，你弄疼我了！",
    p5 = "大王叫我来寻山啊啊啊啊",
    time = 10,
    odds2 = 0
    };
getRow(10)->
    #monsterboxCfg {
    id = 10,
    monsterid = 9205,
    trigger1 = [0,5],
    odds1 = 60,
    p0 = "大王最喜欢小萝莉了！",
    p5 = "今天嗓子痛，不唱歌！",
    time = 10,
    odds2 = 0
    };
getRow(11)->
    #monsterboxCfg {
    id = 11,
    monsterid = 9205,
    trigger1 = [0],
    odds1 = 60,
    p0 = "大王最喜欢头戴飘带的小萝莉了！",
    p5 = "你们唱的真难听！",
    time = 10,
    odds2 = 0
    };
getRow(12)->
    #monsterboxCfg {
    id = 12,
    monsterid = 9207,
    trigger1 = [0,5],
    odds1 = 60,
    p0 = "今晚吃些什么呢？",
    p5 = "你们这群无知的人类！",
    time = 10,
    odds2 = 0
    };
getRow(13)->
    #monsterboxCfg {
    id = 13,
    monsterid = 9207,
    trigger1 = [0],
    odds1 = 60,
    p0 = "请叫我绅士，我讨厌大王这个词儿！",
    time = 10,
    odds2 = 0
    };
getRow(14)->
    #monsterboxCfg {
    id = 14,
    monsterid = 9207,
    trigger1 = [0],
    odds1 = 60,
    p0 = "清蒸，炭烤还是油炸呢？",
    time = 10,
    odds2 = 0
    };
getRow(15)->
    #monsterboxCfg {
    id = 15,
    monsterid = 9207,
    trigger1 = [0],
    odds1 = 60,
    p0 = "我的手下都是一群音乐家~哦吼吼",
    time = 10,
    odds2 = 0
    };
getRow(16)->
    #monsterboxCfg {
    id = 16,
    monsterid = 9208,
    trigger1 = [0,1,5],
    odds1 = 60,
    p0 = "大王最喜欢萝莉了！",
    p1 = "轻点，你弄疼我了！",
    p5 = "大王叫我来寻山啊啊啊啊",
    time = 10,
    odds2 = 0
    };
getRow(17)->
    #monsterboxCfg {
    id = 17,
    monsterid = 9208,
    trigger1 = [0,5],
    odds1 = 60,
    p0 = "大王最喜欢小萝莉了！",
    p5 = "今天嗓子痛，不唱歌！",
    time = 10,
    odds2 = 0
    };
getRow(18)->
    #monsterboxCfg {
    id = 18,
    monsterid = 9208,
    trigger1 = [0],
    odds1 = 60,
    p0 = "大王最喜欢头戴飘带的小萝莉了！",
    p5 = "你们唱的真难听！",
    time = 10,
    odds2 = 0
    };
getRow(19)->
    #monsterboxCfg {
    id = 19,
    monsterid = 9211,
    trigger1 = [0,5],
    odds1 = 60,
    p0 = "今晚吃些什么呢？",
    p5 = "你们这群无知的人类！",
    time = 10,
    odds2 = 0
    };
getRow(20)->
    #monsterboxCfg {
    id = 20,
    monsterid = 9211,
    trigger1 = [0],
    odds1 = 60,
    p0 = "请叫我绅士，我讨厌大王这个词儿！",
    time = 10,
    odds2 = 0
    };
getRow(21)->
    #monsterboxCfg {
    id = 21,
    monsterid = 9211,
    trigger1 = [0],
    odds1 = 60,
    p0 = "清蒸，炭烤还是油炸呢？",
    time = 10,
    odds2 = 0
    };
getRow(22)->
    #monsterboxCfg {
    id = 22,
    monsterid = 9211,
    trigger1 = [0],
    odds1 = 60,
    p0 = "我的手下都是一群音乐家~哦吼吼",
    time = 10,
    odds2 = 0
    };
getRow(23)->
    #monsterboxCfg {
    id = 23,
    monsterid = 9212,
    trigger1 = [0,1,5],
    odds1 = 60,
    p0 = "大王最喜欢萝莉了！",
    p1 = "轻点，你弄疼我了！",
    p5 = "大王叫我来寻山啊啊啊啊",
    time = 10,
    odds2 = 0
    };
getRow(24)->
    #monsterboxCfg {
    id = 24,
    monsterid = 9212,
    trigger1 = [0,5],
    odds1 = 60,
    p0 = "大王最喜欢小萝莉了！",
    p5 = "今天嗓子痛，不唱歌！",
    time = 10,
    odds2 = 0
    };
getRow(25)->
    #monsterboxCfg {
    id = 25,
    monsterid = 9212,
    trigger1 = [0],
    odds1 = 60,
    p0 = "大王最喜欢头戴飘带的小萝莉了！",
    p5 = "你们唱的真难听！",
    time = 10,
    odds2 = 0
    };
getRow(26)->
    #monsterboxCfg {
    id = 26,
    monsterid = 9215,
    trigger1 = [0,5],
    odds1 = 60,
    p0 = "今晚吃些什么呢？",
    p5 = "你们这群无知的人类！",
    time = 10,
    odds2 = 0
    };
getRow(27)->
    #monsterboxCfg {
    id = 27,
    monsterid = 9215,
    trigger1 = [0],
    odds1 = 60,
    p0 = "请叫我绅士，我讨厌大王这个词儿！",
    time = 10,
    odds2 = 0
    };
getRow(28)->
    #monsterboxCfg {
    id = 28,
    monsterid = 9215,
    trigger1 = [0],
    odds1 = 60,
    p0 = "清蒸，炭烤还是油炸呢？",
    time = 10,
    odds2 = 0
    };
getRow(29)->
    #monsterboxCfg {
    id = 29,
    monsterid = 9215,
    trigger1 = [0],
    odds1 = 60,
    p0 = "我的手下都是一群音乐家~哦吼吼",
    time = 10,
    odds2 = 0
    };
getRow(30)->
    #monsterboxCfg {
    id = 30,
    monsterid = 9216,
    trigger1 = [0,1,5],
    odds1 = 60,
    p0 = "大王最喜欢萝莉了！",
    p1 = "轻点，你弄疼我了！",
    p5 = "大王叫我来寻山啊啊啊啊",
    time = 10,
    odds2 = 0
    };
getRow(31)->
    #monsterboxCfg {
    id = 31,
    monsterid = 9216,
    trigger1 = [0,5],
    odds1 = 60,
    p0 = "大王最喜欢小萝莉了！",
    p5 = "今天嗓子痛，不唱歌！",
    time = 10,
    odds2 = 0
    };
getRow(32)->
    #monsterboxCfg {
    id = 32,
    monsterid = 9216,
    trigger1 = [0],
    odds1 = 60,
    p0 = "大王最喜欢头戴飘带的小萝莉了！",
    p5 = "你们唱的真难听！",
    time = 10,
    odds2 = 0
    };
getRow(33)->
    #monsterboxCfg {
    id = 33,
    monsterid = 9219,
    trigger1 = [0,5],
    odds1 = 60,
    p0 = "今晚吃些什么呢？",
    p5 = "你们这群无知的人类！",
    time = 10,
    odds2 = 0
    };
getRow(34)->
    #monsterboxCfg {
    id = 34,
    monsterid = 9219,
    trigger1 = [0],
    odds1 = 60,
    p0 = "请叫我绅士，我讨厌大王这个词儿！",
    time = 10,
    odds2 = 0
    };
getRow(35)->
    #monsterboxCfg {
    id = 35,
    monsterid = 9219,
    trigger1 = [0],
    odds1 = 60,
    p0 = "清蒸，炭烤还是油炸呢？",
    time = 10,
    odds2 = 0
    };
getRow(36)->
    #monsterboxCfg {
    id = 36,
    monsterid = 9219,
    trigger1 = [0],
    odds1 = 60,
    p0 = "我的手下都是一群音乐家~哦吼吼",
    time = 10,
    odds2 = 0
    };
getRow(37)->
    #monsterboxCfg {
    id = 37,
    monsterid = 9220,
    trigger1 = [0,1,5],
    odds1 = 60,
    p0 = "大王最喜欢萝莉了！",
    p1 = "轻点，你弄疼我了！",
    p5 = "大王叫我来寻山啊啊啊啊",
    time = 10,
    odds2 = 0
    };
getRow(38)->
    #monsterboxCfg {
    id = 38,
    monsterid = 9220,
    trigger1 = [0,5],
    odds1 = 60,
    p0 = "大王最喜欢小萝莉了！",
    p5 = "今天嗓子痛，不唱歌！",
    time = 10,
    odds2 = 0
    };
getRow(39)->
    #monsterboxCfg {
    id = 39,
    monsterid = 9220,
    trigger1 = [0],
    odds1 = 60,
    p0 = "大王最喜欢头戴飘带的小萝莉了！",
    p5 = "你们唱的真难听！",
    time = 10,
    odds2 = 0
    };
getRow(40)->
    #monsterboxCfg {
    id = 40,
    monsterid = 9223,
    trigger1 = [0,5],
    odds1 = 60,
    p0 = "今晚吃些什么呢？",
    p5 = "你们这群无知的人类！",
    time = 10,
    odds2 = 0
    };
getRow(41)->
    #monsterboxCfg {
    id = 41,
    monsterid = 9223,
    trigger1 = [0],
    odds1 = 60,
    p0 = "请叫我绅士，我讨厌大王这个词儿！",
    time = 10,
    odds2 = 0
    };
getRow(42)->
    #monsterboxCfg {
    id = 42,
    monsterid = 9223,
    trigger1 = [0],
    odds1 = 60,
    p0 = "清蒸，炭烤还是油炸呢？",
    time = 10,
    odds2 = 0
    };
getRow(43)->
    #monsterboxCfg {
    id = 43,
    monsterid = 9223,
    trigger1 = [0],
    odds1 = 60,
    p0 = "我的手下都是一群音乐家~哦吼吼",
    time = 10,
    odds2 = 0
    };
getRow(101)->
    #monsterboxCfg {
    id = 101,
    monsterid = 2000,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "黄色属于我们这些明朗、快活的勤奋派",
    p1 = "黄色属于我们这些明朗、快活的勤奋派",
    p2 = "黄色属于我们这些明朗、快活的勤奋派",
    p3 = "黄色属于我们这些明朗、快活的勤奋派",
    p4 = "黄色属于我们这些明朗、快活的勤奋派",
    p5 = "黄色属于我们这些明朗、快活的勤奋派",
    time = 10,
    odds2 = 0
    };
getRow(102)->
    #monsterboxCfg {
    id = 102,
    monsterid = 2000,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"",
    p1 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"",
    p2 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"",
    p3 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"",
    p4 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"",
    p5 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"",
    time = 10,
    odds2 = 0
    };
getRow(103)->
    #monsterboxCfg {
    id = 103,
    monsterid = 2000,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"",
    p1 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"",
    p2 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"",
    p3 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"",
    p4 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"",
    p5 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"",
    time = 10,
    odds2 = 0
    };
getRow(104)->
    #monsterboxCfg {
    id = 104,
    monsterid = 2000,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"",
    p1 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"",
    p2 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"",
    p3 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"",
    p4 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"",
    p5 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"",
    time = 10,
    odds2 = 0
    };
getRow(105)->
    #monsterboxCfg {
    id = 105,
    monsterid = 2000,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p1 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p2 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p3 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p4 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p5 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    time = 10,
    odds2 = 0
    };
getRow(106)->
    #monsterboxCfg {
    id = 106,
    monsterid = 2001,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "红色属于我们这些要实现自己愿望的行动派",
    p1 = "红色属于我们这些要实现自己愿望的行动派",
    p2 = "红色属于我们这些要实现自己愿望的行动派",
    p3 = "红色属于我们这些要实现自己愿望的行动派",
    p4 = "红色属于我们这些要实现自己愿望的行动派",
    p5 = "红色属于我们这些要实现自己愿望的行动派",
    time = 10,
    odds2 = 0
    };
getRow(107)->
    #monsterboxCfg {
    id = 107,
    monsterid = 2001,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"",
    p1 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"",
    p2 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"",
    p3 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"",
    p4 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"",
    p5 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"",
    time = 10,
    odds2 = 0
    };
getRow(108)->
    #monsterboxCfg {
    id = 108,
    monsterid = 2001,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"",
    p1 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"",
    p2 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"",
    p3 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"",
    p4 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"",
    p5 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"",
    time = 10,
    odds2 = 0
    };
getRow(109)->
    #monsterboxCfg {
    id = 109,
    monsterid = 2001,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"",
    p1 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"",
    p2 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"",
    p3 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"",
    p4 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"",
    p5 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"",
    time = 10,
    odds2 = 0
    };
getRow(110)->
    #monsterboxCfg {
    id = 110,
    monsterid = 2001,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p1 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p2 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p3 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p4 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p5 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    time = 10,
    odds2 = 0
    };
getRow(111)->
    #monsterboxCfg {
    id = 111,
    monsterid = 2002,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "绿色属于我们这些青青草原上悲剧的原谅派",
    p1 = "绿色属于我们这些青青草原上悲剧的原谅派",
    p2 = "绿色属于我们这些青青草原上悲剧的原谅派",
    p3 = "绿色属于我们这些青青草原上悲剧的原谅派",
    p4 = "绿色属于我们这些青青草原上悲剧的原谅派",
    p5 = "绿色属于我们这些青青草原上悲剧的原谅派",
    time = 10,
    odds2 = 0
    };
getRow(112)->
    #monsterboxCfg {
    id = 112,
    monsterid = 2002,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"",
    p1 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"",
    p2 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"",
    p3 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"",
    p4 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"",
    p5 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"",
    time = 10,
    odds2 = 0
    };
getRow(113)->
    #monsterboxCfg {
    id = 113,
    monsterid = 2002,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"",
    p1 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"",
    p2 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"",
    p3 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"",
    p4 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"",
    p5 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"",
    time = 10,
    odds2 = 0
    };
getRow(114)->
    #monsterboxCfg {
    id = 114,
    monsterid = 2002,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"",
    p1 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"",
    p2 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"",
    p3 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"",
    p4 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"",
    p5 = "菇菇姑姑说\"你看到我穿着红色的新衣裳了吗？\"",
    time = 10,
    odds2 = 0
    };
getRow(115)->
    #monsterboxCfg {
    id = 115,
    monsterid = 2002,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p1 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p2 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p3 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p4 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p5 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    time = 10,
    odds2 = 0
    };
getRow(116)->
    #monsterboxCfg {
    id = 116,
    monsterid = 2003,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "花花草草，我的小草在哪里?",
    p1 = "花花草草，我的小草在哪里?",
    p2 = "花花草草，我的小草在哪里?",
    p3 = "花花草草，我的小草在哪里?",
    p4 = "花花草草，我的小草在哪里?",
    p5 = "花花草草，我的小草在哪里?",
    time = 10,
    odds2 = 0
    };
getRow(117)->
    #monsterboxCfg {
    id = 117,
    monsterid = 2003,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "草草花花，你的大花在这里！",
    p1 = "草草花花，你的大花在这里！",
    p2 = "草草花花，你的大花在这里！",
    p3 = "草草花花，你的大花在这里！",
    p4 = "草草花花，你的大花在这里！",
    p5 = "草草花花，你的大花在这里！",
    time = 10,
    odds2 = 0
    };
getRow(118)->
    #monsterboxCfg {
    id = 118,
    monsterid = 2003,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "花中四君子分别是“花花，花花，花花，花花”",
    p1 = "花中四君子分别是“花花，花花，花花，花花”",
    p2 = "花中四君子分别是“花花，花花，花花，花花”",
    p3 = "花中四君子分别是“花花，花花，花花，花花”",
    p4 = "花中四君子分别是“花花，花花，花花，花花”",
    p5 = "花中四君子分别是“花花，花花，花花，花花”",
    time = 10,
    odds2 = 0
    };
getRow(119)->
    #monsterboxCfg {
    id = 119,
    monsterid = 2003,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "花儿为什么这样红，这样红，样红，红",
    p1 = "花儿为什么这样红，这样红，样红，红",
    p2 = "花儿为什么这样红，这样红，样红，红",
    p3 = "花儿为什么这样红，这样红，样红，红",
    p4 = "花儿为什么这样红，这样红，样红，红",
    p5 = "花儿为什么这样红，这样红，样红，红",
    time = 10,
    odds2 = 0
    };
getRow(120)->
    #monsterboxCfg {
    id = 120,
    monsterid = 2004,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "你看到我穿着红色的新衣裳了吗？",
    p1 = "你看到我穿着红色的新衣裳了吗？",
    p2 = "你看到我穿着红色的新衣裳了吗？",
    p3 = "你看到我穿着红色的新衣裳了吗？",
    p4 = "你看到我穿着红色的新衣裳了吗？",
    p5 = "你看到我穿着红色的新衣裳了吗？",
    time = 10,
    odds2 = 0
    };
getRow(121)->
    #monsterboxCfg {
    id = 121,
    monsterid = 2004,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "你的心跳告诉我你很紧张",
    p1 = "你的心跳告诉我你很紧张",
    p2 = "你的心跳告诉我你很紧张",
    p3 = "你的心跳告诉我你很紧张",
    p4 = "你的心跳告诉我你很紧张",
    p5 = "你的心跳告诉我你很紧张",
    time = 10,
    odds2 = 0
    };
getRow(122)->
    #monsterboxCfg {
    id = 122,
    monsterid = 2004,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "告诉我，你心中所想",
    p1 = "告诉我，你心中所想",
    p2 = "告诉我，你心中所想",
    p3 = "告诉我，你心中所想",
    p4 = "告诉我，你心中所想",
    p5 = "告诉我，你心中所想",
    time = 10,
    odds2 = 0
    };
getRow(123)->
    #monsterboxCfg {
    id = 123,
    monsterid = 2004,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "来和我玩吗，让我们手下见真章",
    p1 = "来和我玩吗，让我们手下见真章",
    p2 = "来和我玩吗，让我们手下见真章",
    p3 = "来和我玩吗，让我们手下见真章",
    p4 = "来和我玩吗，让我们手下见真章",
    p5 = "来和我玩吗，让我们手下见真章",
    time = 10,
    odds2 = 0
    };
getRow(131)->
    #monsterboxCfg {
    id = 131,
    monsterid = 2005,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "眯眯眼都是怪物，所以我的眼睛才这样囧囧有神",
    p1 = "眯眯眼都是怪物，所以我的眼睛才这样囧囧有神",
    p2 = "眯眯眼都是怪物，所以我的眼睛才这样囧囧有神",
    p3 = "眯眯眼都是怪物，所以我的眼睛才这样囧囧有神",
    p4 = "眯眯眼都是怪物，所以我的眼睛才这样囧囧有神",
    p5 = "眯眯眼都是怪物，所以我的眼睛才这样囧囧有神",
    time = 10,
    odds2 = 0
    };
getRow(132)->
    #monsterboxCfg {
    id = 132,
    monsterid = 2005,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "找个时间，谈段恋爱",
    p1 = "找个时间，谈段恋爱",
    p2 = "找个时间，谈段恋爱",
    p3 = "找个时间，谈段恋爱",
    p4 = "找个时间，谈段恋爱",
    p5 = "找个时间，谈段恋爱",
    time = 10,
    odds2 = 0
    };
getRow(133)->
    #monsterboxCfg {
    id = 133,
    monsterid = 2005,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "我很丑，可是我很温柔",
    p1 = "我很丑，可是我很温柔",
    p2 = "我很丑，可是我很温柔",
    p3 = "我很丑，可是我很温柔",
    p4 = "我很丑，可是我很温柔",
    p5 = "我很丑，可是我很温柔",
    time = 10,
    odds2 = 0
    };
getRow(134)->
    #monsterboxCfg {
    id = 134,
    monsterid = 2005,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "不知道从什么时候开始，流传着松鼠和狸猫是近亲的传说",
    p1 = "不知道从什么时候开始，流传着松鼠和狸猫是近亲的传说",
    p2 = "不知道从什么时候开始，流传着松鼠和狸猫是近亲的传说",
    p3 = "不知道从什么时候开始，流传着松鼠和狸猫是近亲的传说",
    p4 = "不知道从什么时候开始，流传着松鼠和狸猫是近亲的传说",
    p5 = "不知道从什么时候开始，流传着松鼠和狸猫是近亲的传说",
    time = 10,
    odds2 = 0
    };
getRow(135)->
    #monsterboxCfg {
    id = 135,
    monsterid = 2006,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "你看到一位优雅的大姐姐了吗，喵呜",
    p1 = "你看到一位优雅的大姐姐了吗，喵呜",
    p2 = "你看到一位优雅的大姐姐了吗，喵呜",
    p3 = "你看到一位优雅的大姐姐了吗，喵呜",
    p4 = "你看到一位优雅的大姐姐了吗，喵呜",
    p5 = "你看到一位优雅的大姐姐了吗，喵呜",
    time = 10,
    odds2 = 0
    };
getRow(136)->
    #monsterboxCfg {
    id = 136,
    monsterid = 2006,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "与我这样温柔的大姐姐在一起，有没有感到更加快乐",
    p1 = "与我这样温柔的大姐姐在一起，有没有感到更加快乐",
    p2 = "与我这样温柔的大姐姐在一起，有没有感到更加快乐",
    p3 = "与我这样温柔的大姐姐在一起，有没有感到更加快乐",
    p4 = "与我这样温柔的大姐姐在一起，有没有感到更加快乐",
    p5 = "与我这样温柔的大姐姐在一起，有没有感到更加快乐",
    time = 10,
    odds2 = 0
    };
getRow(137)->
    #monsterboxCfg {
    id = 137,
    monsterid = 2006,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "我最大的愿望就是找个松鼠，谈段恋爱",
    p1 = "我最大的愿望就是找个松鼠，谈段恋爱",
    p2 = "我最大的愿望就是找个松鼠，谈段恋爱",
    p3 = "我最大的愿望就是找个松鼠，谈段恋爱",
    p4 = "我最大的愿望就是找个松鼠，谈段恋爱",
    p5 = "我最大的愿望就是找个松鼠，谈段恋爱",
    time = 10,
    odds2 = 0
    };
getRow(138)->
    #monsterboxCfg {
    id = 138,
    monsterid = 2006,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "叮叮当，叮叮当~~",
    p1 = "叮叮当，叮叮当~~",
    p2 = "叮叮当，叮叮当~~",
    p3 = "叮叮当，叮叮当~~",
    p4 = "叮叮当，叮叮当~~",
    p5 = "叮叮当，叮叮当~~",
    time = 10,
    odds2 = 0
    };
getRow(139)->
    #monsterboxCfg {
    id = 139,
    monsterid = 2007,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "豺狼虎豹，我们豺狼家族排在第一位次！d(￣◇￣)b",
    p1 = "豺狼虎豹，我们豺狼家族排在第一位次！d(￣◇￣)b",
    p2 = "豺狼虎豹，我们豺狼家族排在第一位次！d(￣◇￣)b",
    p3 = "豺狼虎豹，我们豺狼家族排在第一位次！d(￣◇￣)b",
    p4 = "豺狼虎豹，我们豺狼家族排在第一位次！d(￣◇￣)b",
    p5 = "豺狼虎豹，我们豺狼家族排在第一位次！d(￣◇￣)b",
    time = 10,
    odds2 = 0
    };
getRow(140)->
    #monsterboxCfg {
    id = 140,
    monsterid = 2007,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "没听过我们阿豺( ﾟДﾟ)b，狼叔总听过吧",
    p1 = "没听过我们阿豺( ﾟДﾟ)b，狼叔总听过吧",
    p2 = "没听过我们阿豺( ﾟДﾟ)b，狼叔总听过吧",
    p3 = "没听过我们阿豺( ﾟДﾟ)b，狼叔总听过吧",
    p4 = "没听过我们阿豺( ﾟДﾟ)b，狼叔总听过吧",
    p5 = "没听过我们阿豺( ﾟДﾟ)b，狼叔总听过吧",
    time = 10,
    odds2 = 0
    };
getRow(141)->
    #monsterboxCfg {
    id = 141,
    monsterid = 2007,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "┗|｀O′|┛ 嗷~~，汪汪",
    p1 = "┗|｀O′|┛ 嗷~~，汪汪",
    p2 = "┗|｀O′|┛ 嗷~~，汪汪",
    p3 = "┗|｀O′|┛ 嗷~~，汪汪",
    p4 = "┗|｀O′|┛ 嗷~~，汪汪",
    p5 = "┗|｀O′|┛ 嗷~~，汪汪",
    time = 10,
    odds2 = 0
    };
getRow(142)->
    #monsterboxCfg {
    id = 142,
    monsterid = 2007,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "看着我这精悍的身材(^^)，当对得起这个\"小\"字",
    p1 = "看着我这精悍的身材(^^)，当对得起这个\"小\"字",
    p2 = "看着我这精悍的身材(^^)，当对得起这个\"小\"字",
    p3 = "看着我这精悍的身材(^^)，当对得起这个\"小\"字",
    p4 = "看着我这精悍的身材(^^)，当对得起这个\"小\"字",
    p5 = "看着我这精悍的身材(^^)，当对得起这个\"小\"字",
    time = 10,
    odds2 = 0
    };
getRow(143)->
    #monsterboxCfg {
    id = 143,
    monsterid = 2008,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "我上辈子是个人类，不要问我为什么",
    p1 = "我上辈子是个人类，不要问我为什么",
    p2 = "我上辈子是个人类，不要问我为什么",
    p3 = "我上辈子是个人类，不要问我为什么",
    p4 = "我上辈子是个人类，不要问我为什么",
    p5 = "我上辈子是个人类，不要问我为什么",
    time = 10,
    odds2 = 0
    };
getRow(144)->
    #monsterboxCfg {
    id = 144,
    monsterid = 2008,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "不要问我大海是什么样子的，劳资是条淡水鳄",
    p1 = "不要问我大海是什么样子的，劳资是条淡水鳄",
    p2 = "不要问我大海是什么样子的，劳资是条淡水鳄",
    p3 = "不要问我大海是什么样子的，劳资是条淡水鳄",
    p4 = "不要问我大海是什么样子的，劳资是条淡水鳄",
    p5 = "不要问我大海是什么样子的，劳资是条淡水鳄",
    time = 10,
    odds2 = 0
    };
getRow(145)->
    #monsterboxCfg {
    id = 145,
    monsterid = 2008,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "没钱赚的事，打手是不会做的",
    p1 = "没钱赚的事，打手是不会做的",
    p2 = "没钱赚的事，打手是不会做的",
    p3 = "没钱赚的事，打手是不会做的",
    p4 = "没钱赚的事，打手是不会做的",
    p5 = "没钱赚的事，打手是不会做的",
    time = 10,
    odds2 = 0
    };
getRow(146)->
    #monsterboxCfg {
    id = 146,
    monsterid = 2008,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "在苍茫的青青草原上，你一眼应该看不到我",
    p1 = "在苍茫的青青草原上，你一眼应该看不到我",
    p2 = "在苍茫的青青草原上，你一眼应该看不到我",
    p3 = "在苍茫的青青草原上，你一眼应该看不到我",
    p4 = "在苍茫的青青草原上，你一眼应该看不到我",
    p5 = "在苍茫的青青草原上，你一眼应该看不到我",
    time = 10,
    odds2 = 0
    };
getRow(147)->
    #monsterboxCfg {
    id = 147,
    monsterid = 2009,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "看这金灿灿的小菊就像秋日里的阳光，温暖，香馨",
    p1 = "看这金灿灿的小菊就像秋日里的阳光，温暖，香馨",
    p2 = "看这金灿灿的小菊就像秋日里的阳光，温暖，香馨",
    p3 = "看这金灿灿的小菊就像秋日里的阳光，温暖，香馨",
    p4 = "看这金灿灿的小菊就像秋日里的阳光，温暖，香馨",
    p5 = "看这金灿灿的小菊就像秋日里的阳光，温暖，香馨",
    time = 10,
    odds2 = 0
    };
getRow(148)->
    #monsterboxCfg {
    id = 148,
    monsterid = 2009,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "我们大树是蛋生？你从哪听来的歪理论",
    p1 = "我们大树是蛋生？你从哪听来的歪理论",
    p2 = "我们大树是蛋生？你从哪听来的歪理论",
    p3 = "我们大树是蛋生？你从哪听来的歪理论",
    p4 = "我们大树是蛋生？你从哪听来的歪理论",
    p5 = "我们大树是蛋生？你从哪听来的歪理论",
    time = 10,
    odds2 = 0
    };
getRow(149)->
    #monsterboxCfg {
    id = 149,
    monsterid = 2009,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "总有些鸟儿不讲文明，喜欢随处筑巢",
    p1 = "总有些鸟儿不讲文明，喜欢随处筑巢",
    p2 = "总有些鸟儿不讲文明，喜欢随处筑巢",
    p3 = "总有些鸟儿不讲文明，喜欢随处筑巢",
    p4 = "总有些鸟儿不讲文明，喜欢随处筑巢",
    p5 = "总有些鸟儿不讲文明，喜欢随处筑巢",
    time = 10,
    odds2 = 0
    };
getRow(150)->
    #monsterboxCfg {
    id = 150,
    monsterid = 2009,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "你经历过鸟儿在你身边不停叽叽喳喳吗？反正我没经历过",
    p1 = "你经历过鸟儿在你身边不停叽叽喳喳吗？反正我没经历过",
    p2 = "你经历过鸟儿在你身边不停叽叽喳喳吗？反正我没经历过",
    p3 = "你经历过鸟儿在你身边不停叽叽喳喳吗？反正我没经历过",
    p4 = "你经历过鸟儿在你身边不停叽叽喳喳吗？反正我没经历过",
    p5 = "你经历过鸟儿在你身边不停叽叽喳喳吗？反正我没经历过",
    time = 10,
    odds2 = 0
    };
getRow(151)->
    #monsterboxCfg {
    id = 151,
    monsterid = 2010,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "大绿酋长说过，酋长有义务让大家吃好，喝好",
    p1 = "大绿酋长说过，酋长有义务让大家吃好，喝好",
    p2 = "大绿酋长说过，酋长有义务让大家吃好，喝好",
    p3 = "大绿酋长说过，酋长有义务让大家吃好，喝好",
    p4 = "大绿酋长说过，酋长有义务让大家吃好，喝好",
    p5 = "大绿酋长说过，酋长有义务让大家吃好，喝好",
    time = 10,
    odds2 = 0
    };
getRow(152)->
    #monsterboxCfg {
    id = 152,
    monsterid = 2010,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "大绿酋长说过，晚上要注意关门，关窗",
    p1 = "大绿酋长说过，晚上要注意关门，关窗",
    p2 = "大绿酋长说过，晚上要注意关门，关窗",
    p3 = "大绿酋长说过，晚上要注意关门，关窗",
    p4 = "大绿酋长说过，晚上要注意关门，关窗",
    p5 = "大绿酋长说过，晚上要注意关门，关窗",
    time = 10,
    odds2 = 0
    };
getRow(153)->
    #monsterboxCfg {
    id = 153,
    monsterid = 2010,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "大绿酋长说过，下辈子不要再做酋长了",
    p1 = "大绿酋长说过，下辈子不要再做酋长了",
    p2 = "大绿酋长说过，下辈子不要再做酋长了",
    p3 = "大绿酋长说过，下辈子不要再做酋长了",
    p4 = "大绿酋长说过，下辈子不要再做酋长了",
    p5 = "大绿酋长说过，下辈子不要再做酋长了",
    time = 10,
    odds2 = 0
    };
getRow(154)->
    #monsterboxCfg {
    id = 154,
    monsterid = 2010,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "大绿酋长说过，酋长说过，说过...",
    p1 = "大绿酋长说过，酋长说过，说过...",
    p2 = "大绿酋长说过，酋长说过，说过...",
    p3 = "大绿酋长说过，酋长说过，说过...",
    p4 = "大绿酋长说过，酋长说过，说过...",
    p5 = "大绿酋长说过，酋长说过，说过...",
    time = 10,
    odds2 = 0
    };
getRow(1001)->
    #monsterboxCfg {
    id = 1001,
    monsterid = 2102,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "元素，掌控生命的奥秘",
    p4 = "元素，掌控生命的奥秘",
    time = 5,
    odds2 = 0
    };
getRow(1002)->
    #monsterboxCfg {
    id = 1002,
    monsterid = 2103,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "此山是我栽，此路是我开...阿切（打喷嚏）！不对，他娘的不对！！",
    p4 = "此山是我栽，此路是我开...阿切（打喷嚏）！不对，他娘的不对！！",
    time = 5,
    odds2 = 0
    };
getRow(1003)->
    #monsterboxCfg {
    id = 1003,
    monsterid = 2103,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "我是一位，不对！一个，不对！一头，有思想的强盗",
    p4 = "我是一位，不对！一个，不对！一头，有思想的强盗",
    time = 5,
    odds2 = 0
    };
getRow(1004)->
    #monsterboxCfg {
    id = 1004,
    monsterid = 2104,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "别动，打...打...打劫！阿切（打喷嚏），准是哥哥在想俺",
    p4 = "别动，打...打...打劫！阿切（打喷嚏），准是哥哥在想俺",
    time = 5,
    odds2 = 0
    };
getRow(1005)->
    #monsterboxCfg {
    id = 1005,
    monsterid = 2104,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "俺兄弟和俺是同父同母的兄弟！",
    p4 = "俺兄弟和俺是同父同母的兄弟！",
    time = 5,
    odds2 = 0
    };
getRow(1006)->
    #monsterboxCfg {
    id = 1006,
    monsterid = 2105,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "忙忙碌碌又一年，辛辛苦苦又一生！",
    p4 = "忙忙碌碌又一年，辛辛苦苦又一生！",
    time = 5,
    odds2 = 0
    };
getRow(1007)->
    #monsterboxCfg {
    id = 1007,
    monsterid = 2105,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "宝贝儿，我闻到了大宝贝儿的味道！",
    p4 = "宝贝儿，我闻到了大宝贝儿的味道！",
    time = 5,
    odds2 = 0
    };
getRow(1008)->
    #monsterboxCfg {
    id = 1008,
    monsterid = 2105,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "别看我笨，但我不蠢！！",
    p4 = "别看我笨，但我不蠢！！",
    time = 5,
    odds2 = 0
    };
getRow(1011)->
    #monsterboxCfg {
    id = 1011,
    monsterid = 2106,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p4 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    time = 5,
    odds2 = 0
    };
getRow(1012)->
    #monsterboxCfg {
    id = 1012,
    monsterid = 2107,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "嗷呜~嗷呜~",
    p4 = "嗷呜~嗷呜~",
    time = 5,
    odds2 = 0
    };
getRow(1013)->
    #monsterboxCfg {
    id = 1013,
    monsterid = 2108,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "我好痛苦啊~我好难受啊~我好折磨啊~啊啊啊",
    p4 = "我好痛苦啊~我好难受啊~我好折磨啊~啊啊啊",
    time = 5,
    odds2 = 0
    };
getRow(1014)->
    #monsterboxCfg {
    id = 1014,
    monsterid = 2108,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "啊咧，我怎么感觉不到任何情绪呢？？",
    p4 = "啊咧，我怎么感觉不到任何情绪呢？？",
    time = 5,
    odds2 = 0
    };
getRow(1015)->
    #monsterboxCfg {
    id = 1015,
    monsterid = 2112,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "灵魂的味道，强大的味道",
    p4 = "灵魂的味道，强大的味道",
    time = 5,
    odds2 = 0
    };
getRow(1016)->
    #monsterboxCfg {
    id = 1016,
    monsterid = 2112,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "鲜嫩可口的小羊羔！",
    p4 = "鲜嫩可口的小羊羔！",
    time = 5,
    odds2 = 0
    };
getRow(1017)->
    #monsterboxCfg {
    id = 1017,
    monsterid = 2113,
    trigger1 = [1,4],
    odds1 = 60,
    p1 = "听说你要守护我一生一世？",
    p4 = "听说你要守护我一生一世？",
    time = 5,
    odds2 = 0
    };
getRow(1018)->
    #monsterboxCfg {
    id = 1018,
    monsterid = 2114,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p4 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    time = 5,
    odds2 = 0
    };
getRow(1019)->
    #monsterboxCfg {
    id = 1019,
    monsterid = 2115,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "嗷呜~嗷呜~",
    p4 = "嗷呜~嗷呜~",
    time = 5,
    odds2 = 0
    };
getRow(1020)->
    #monsterboxCfg {
    id = 1020,
    monsterid = 2116,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "我好痛苦啊~我好难受啊~我好折磨啊~啊啊啊",
    p4 = "我好痛苦啊~我好难受啊~我好折磨啊~啊啊啊",
    time = 5,
    odds2 = 0
    };
getRow(1021)->
    #monsterboxCfg {
    id = 1021,
    monsterid = 2116,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "啊咧，我怎么感觉不到任何情绪呢？？",
    p4 = "啊咧，我怎么感觉不到任何情绪呢？？",
    time = 5,
    odds2 = 0
    };
getRow(1022)->
    #monsterboxCfg {
    id = 1022,
    monsterid = 2117,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "灵魂的味道，强大的味道",
    p4 = "灵魂的味道，强大的味道",
    time = 5,
    odds2 = 0
    };
getRow(1023)->
    #monsterboxCfg {
    id = 1023,
    monsterid = 2117,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "鲜嫩可口的小羊羔！",
    p4 = "鲜嫩可口的小羊羔！",
    time = 5,
    odds2 = 0
    };
getRow(1024)->
    #monsterboxCfg {
    id = 1024,
    monsterid = 2118,
    trigger1 = [1,4],
    odds1 = 60,
    p1 = "听说你要守护我一生一世？",
    p4 = "听说你要守护我一生一世？",
    time = 5,
    odds2 = 0
    };
getRow(1025)->
    #monsterboxCfg {
    id = 1025,
    monsterid = 2119,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "誓死为波恩领主效力！",
    p4 = "誓死为波恩领主效力！",
    time = 5,
    odds2 = 0
    };
getRow(1026)->
    #monsterboxCfg {
    id = 1026,
    monsterid = 2119,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "刻骨铭心的记忆！",
    p4 = "刻骨铭心的记忆！",
    time = 5,
    odds2 = 0
    };
getRow(1027)->
    #monsterboxCfg {
    id = 1027,
    monsterid = 2120,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "誓死为波恩领主效力！",
    p4 = "誓死为波恩领主效力！",
    time = 5,
    odds2 = 0
    };
getRow(1028)->
    #monsterboxCfg {
    id = 1028,
    monsterid = 2120,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "刻骨铭心的记忆！",
    p4 = "刻骨铭心的记忆！",
    time = 5,
    odds2 = 0
    };
getRow(1031)->
    #monsterboxCfg {
    id = 1031,
    monsterid = 2130,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "我喜欢你，但我无法原谅人类",
    p4 = "我喜欢你，但我无法原谅人类",
    time = 5,
    odds2 = 0
    };
getRow(1032)->
    #monsterboxCfg {
    id = 1032,
    monsterid = 2130,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "好人都是那些死去的人，比如我",
    p4 = "好人都是那些死去的人，比如我",
    time = 5,
    odds2 = 0
    };
getRow(1033)->
    #monsterboxCfg {
    id = 1033,
    monsterid = 2125,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "没有什么能够阻挡我！！伟大的三胖同志。",
    p4 = "没有什么能够阻挡我！！伟大的三胖同志。",
    time = 5,
    odds2 = 0
    };
getRow(1034)->
    #monsterboxCfg {
    id = 1034,
    monsterid = 2131,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "皮皮？皮皮虾吗，据说是一种凶猛的食材。",
    p4 = "皮皮？皮皮虾吗，据说是一种凶猛的食材。",
    time = 5,
    odds2 = 0
    };
getRow(1035)->
    #monsterboxCfg {
    id = 1035,
    monsterid = 2141,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "我喜欢你，但我无法原谅人类",
    p4 = "我喜欢你，但我无法原谅人类",
    time = 5,
    odds2 = 0
    };
getRow(1036)->
    #monsterboxCfg {
    id = 1036,
    monsterid = 2141,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "好人都是那些死去的人，比如我",
    p4 = "好人都是那些死去的人，比如我",
    time = 5,
    odds2 = 0
    };
getRow(1037)->
    #monsterboxCfg {
    id = 1037,
    monsterid = 2136,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "没有什么能够阻挡我！！伟大的三胖同志。",
    p4 = "没有什么能够阻挡我！！伟大的三胖同志。",
    time = 5,
    odds2 = 0
    };
getRow(1038)->
    #monsterboxCfg {
    id = 1038,
    monsterid = 2142,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "皮皮？皮皮虾吗，据说是一种凶猛的食材。",
    p4 = "皮皮？皮皮虾吗，据说是一种凶猛的食材。",
    time = 5,
    odds2 = 0
    };
getRow(2005)->
    #monsterboxCfg {
    id = 2005,
    monsterid = 25009,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "空山新雨后，兵长一米六！",
    p4 = "太阳真刺眼！ψ(｀∇´)ψ特别是那些自称后裔的家伙！！",
    time = 5,
    odds2 = 0
    };
getRow(2006)->
    #monsterboxCfg {
    id = 2006,
    monsterid = 25009,
    trigger1 = [4],
    odds1 = 60,
    p4 = "怀念我那黑漆漆的山洞，洞里的山与水，美丽的花姑娘(｀ε´)",
    time = 5,
    odds2 = 0
    };
getRow(2007)->
    #monsterboxCfg {
    id = 2007,
    monsterid = 25009,
    trigger1 = [4],
    odds1 = 60,
    p4 = "飞呀飞，飞呀飞Ψ(￣∀￣)Ψ，不管累不累",
    time = 5,
    odds2 = 0
    };
getRow(2008)->
    #monsterboxCfg {
    id = 2008,
    monsterid = 25009,
    trigger1 = [4],
    odds1 = 60,
    p4 = "我们家里有个喜欢用木刺的小哥儿，那酸爽| ｀Д´|，啧啧啧",
    time = 5,
    odds2 = 0
    };
getRow(2009)->
    #monsterboxCfg {
    id = 2009,
    monsterid = 25008,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "为了第七大魔王的正义！",
    p4 = "啊！这位美丽的小姐！可以让我欣赏一下你的胖次吗？（ლ ^ิ౪^ิ）ლ哟呵呵呵呵！",
    time = 5,
    odds2 = 0
    };
getRow(2010)->
    #monsterboxCfg {
    id = 2010,
    monsterid = 25008,
    trigger1 = [4],
    odds1 = 60,
    p4 = "活着(༎ຶꈊ༎ຶ╬)，便是最大的寂寞啊",
    time = 5,
    odds2 = 0
    };
getRow(2011)->
    #monsterboxCfg {
    id = 2011,
    monsterid = 25008,
    trigger1 = [4],
    odds1 = 60,
    p4 = "日复一日，年复一年(´༎ຶ༎ຶ)",
    time = 5,
    odds2 = 0
    };
getRow(2012)->
    #monsterboxCfg {
    id = 2012,
    monsterid = 25008,
    trigger1 = [4],
    odds1 = 60,
    p4 = "啊~美丽的小姐( º﹃º )......beau~~tiful！",
    time = 5,
    odds2 = 0
    };
getRow(2025)->
    #monsterboxCfg {
    id = 2025,
    monsterid = 25013,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "八十，八十！！",
    p4 = "虎豹豺狼，虎老大，我老二，豺老三",
    time = 5,
    odds2 = 0
    };
getRow(2026)->
    #monsterboxCfg {
    id = 2026,
    monsterid = 25013,
    trigger1 = [4],
    odds1 = 60,
    p4 = "牧羊犬？你已经过时了，你听过牧羊豹吗",
    time = 5,
    odds2 = 0
    };
getRow(2027)->
    #monsterboxCfg {
    id = 2027,
    monsterid = 25013,
    trigger1 = [4],
    odds1 = 60,
    p4 = "阿虎，阿豹，第七号兄弟笑笑",
    time = 5,
    odds2 = 0
    };
getRow(2028)->
    #monsterboxCfg {
    id = 2028,
    monsterid = 25013,
    trigger1 = [4],
    odds1 = 60,
    p4 = "想当初，像你这样的小弟，我有八十万个",
    time = 5,
    odds2 = 0
    };
getRow(2029)->
    #monsterboxCfg {
    id = 2029,
    monsterid = 25015,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "我失去理智了...（我用牙牙的声音说道）",
    p4 = "我失去理智了...（我用松鼠的声音说道）",
    time = 5,
    odds2 = 0
    };
getRow(2030)->
    #monsterboxCfg {
    id = 2030,
    monsterid = 25016,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "我失去理智了...（我用霜霜的声音说道）",
    p4 = "我失去理智了...（我用牙牙的声音说道）",
    time = 5,
    odds2 = 0
    };
getRow(2031)->
    #monsterboxCfg {
    id = 2031,
    monsterid = 25017,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "我失去理智了...（我用小熊的声音说道）",
    p4 = "我失去理智了...（我用霜霜的声音说道）",
    time = 5,
    odds2 = 0
    };
getRow(2032)->
    #monsterboxCfg {
    id = 2032,
    monsterid = 25018,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "我失去理智了...（我用松鼠的声音说道）",
    p4 = "我失去理智了...（我用小熊的声音说道）",
    time = 5,
    odds2 = 0
    };
getRow(10000)->
    #monsterboxCfg {
    id = 10000,
    monsterid = 22006,
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "烧成灰烬吧~！",
    p1 = "哼，别想打败我。",
    p3 = "大王……我还需要魔力",
    time = 5,
    odds2 = 0
    };
getRow(10001)->
    #monsterboxCfg {
    id = 10001,
    monsterid = 22007,
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "大王来得太快，就像龙卷风~",
    p1 = "将你们化成粉末！",
    p3 = "大王……我还需要魔力",
    time = 5,
    odds2 = 0
    };
getRow(10002)->
    #monsterboxCfg {
    id = 10002,
    monsterid = 22008,
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "想赢我？在修炼一百年吧。",
    p1 = "哈哈，力量至上！",
    p3 = "我不会输！",
    time = 5,
    odds2 = 0
    };
getRow(10003)->
    #monsterboxCfg {
    id = 10003,
    monsterid = 22009,
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "让我见识一下你的实力吧。",
    p1 = "哇，你好强。",
    p3 = "不愧是光明勇士",
    time = 5,
    odds2 = 0
    };
getRow(10004)->
    #monsterboxCfg {
    id = 10004,
    monsterid = 22010,
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "想跟我打架，自不量力！",
    p1 = "刀刀见血！",
    p3 = "我不会放过你的！",
    time = 5,
    odds2 = 0
    };
getRow(10005)->
    #monsterboxCfg {
    id = 10005,
    monsterid = 22011,
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "我很美，但是也很暴力。",
    p1 = "看我的花粉攻击！",
    p3 = "花蕊谢了……",
    time = 5,
    odds2 = 0
    };
getRow(10006)->
    #monsterboxCfg {
    id = 10006,
    monsterid = 22012,
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "烧成灰烬吧~！",
    p1 = "哼，别想打败我。",
    p3 = "大王……我还需要魔力",
    time = 5,
    odds2 = 0
    };
getRow(10007)->
    #monsterboxCfg {
    id = 10007,
    monsterid = 22013,
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "大王来得太快，就像龙卷风~",
    p1 = "将你们化成粉末！",
    p3 = "大王……我还需要魔力",
    time = 5,
    odds2 = 0
    };
getRow(10008)->
    #monsterboxCfg {
    id = 10008,
    monsterid = 22014,
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "记住我的名字，著名的史莱姆宝宝，超可爱。",
    p1 = "史莱姆生气啦！",
    p3 = "我……我好想吃鱼……",
    time = 5,
    odds2 = 0
    };
getRow(10009)->
    #monsterboxCfg {
    id = 10009,
    monsterid = 22015,
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "作为小弟，我们的宗旨是跟着大王吃美食。",
    p1 = "跟着大王一起进攻！",
    p3 = "跟着大王一起领便当……",
    time = 5,
    odds2 = 0
    };
getRow(10010)->
    #monsterboxCfg {
    id = 10010,
    monsterid = 22016,
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "主人，主人，有人闯进来了！",
    p1 = "呜，好疼。",
    p3 = "主人，我被打败了……",
    time = 5,
    odds2 = 0
    };
getRow(10011)->
    #monsterboxCfg {
    id = 10011,
    monsterid = 22017,
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "想跟我打架，自不量力！",
    p1 = "刀刀见血！",
    p3 = "我不会放过你的！",
    time = 5,
    odds2 = 0
    };
getRow(10012)->
    #monsterboxCfg {
    id = 10012,
    monsterid = 22018,
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "想赢我？在修炼一百年吧。",
    p1 = "哈哈，力量至上！",
    p3 = "我不会输！",
    time = 5,
    odds2 = 0
    };
getRow(10013)->
    #monsterboxCfg {
    id = 10013,
    monsterid = 22019,
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "烧成灰烬吧~！",
    p1 = "哼，别想打败我。",
    p3 = "大王……我还需要魔力",
    time = 5,
    odds2 = 0
    };
getRow(10014)->
    #monsterboxCfg {
    id = 10014,
    monsterid = 22020,
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "大王来得太快，就像龙卷风~",
    p1 = "将你们化成粉末！",
    p3 = "大王……我还需要魔力",
    time = 5,
    odds2 = 0
    };
getRow(10015)->
    #monsterboxCfg {
    id = 10015,
    monsterid = 22021,
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "我们小鱼人虽然是魔族，但是我们一点也不坏。",
    p1 = "哎呀呀，好疼，温柔一点！",
    p3 = "我不想领便当，呜呜……",
    time = 5,
    odds2 = 0
    };
getRow(10016)->
    #monsterboxCfg {
    id = 10016,
    monsterid = 22022,
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "咦？怎么又开始打架了，难道是有人来抢鱼肉吗？",
    p1 = "喵，喵喵！",
    p3 = "喵有九条命^",
    time = 5,
    odds2 = 0
    };
getRow(10017)->
    #monsterboxCfg {
    id = 10017,
    monsterid = 22023,
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "想赢我？在修炼一百年吧。",
    p1 = "哈哈，力量至上！",
    p3 = "我不会输！",
    time = 5,
    odds2 = 0
    };
getRow(10018)->
    #monsterboxCfg {
    id = 10018,
    monsterid = 22024,
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "来切磋一下么，看看谁的头更硬？",
    p1 = "别想撞过我。",
    p3 = "额……",
    time = 5,
    odds2 = 0
    };
getRow(10019)->
    #monsterboxCfg {
    id = 10019,
    monsterid = 22025,
    trigger1 = [0,1,3],
    odds1 = 60,
    p0 = "魔族是最强的！",
    p1 = "胜者为王。",
    p3 = "额……",
    time = 5,
    odds2 = 0
    };
getRow(10020)->
    #monsterboxCfg {
    id = 10020,
    monsterid = 22007,
    trigger1 = [0,4],
    odds1 = 50,
    p0 = "善良的人类，下手轻一点哟！",
    p4 = "善良的人类，下手轻一点哟！",
    time = 5,
    odds2 = 0
    };
getRow(10022)->
    #monsterboxCfg {
    id = 10022,
    monsterid = 22007,
    trigger1 = [0,4],
    odds1 = 50,
    p0 = "关爱小鱼人，人人有责。",
    p4 = "关爱小鱼人，人人有责。",
    time = 5,
    odds2 = 0
    };
getRow(10023)->
    #monsterboxCfg {
    id = 10023,
    monsterid = 22000,
    trigger1 = [0,3,4],
    odds1 = 50,
    p0 = "来追我呀，追不到，追不到…",
    p3 = "躲进龟壳你就找不到我了。",
    p4 = "躲进龟壳你就找不到我了。",
    time = 5,
    odds2 = 0
    };
getRow(10025)->
    #monsterboxCfg {
    id = 10025,
    monsterid = 22002,
    trigger1 = [0,4],
    odds1 = 50,
    p0 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    p4 = "！@#￥%……&*+（史莱姆语，意味“新吧唧”）",
    time = 5,
    odds2 = 0
    };
getRow(10026)->
    #monsterboxCfg {
    id = 10026,
    monsterid = 22002,
    trigger1 = [0,4],
    odds1 = 50,
    p0 = "你能找到谁才是本宝宝吗~~",
    p4 = "你能找到谁才是本宝宝吗~~",
    time = 5,
    odds2 = 0
    };
getRow(10027)->
    #monsterboxCfg {
    id = 10027,
    monsterid = 22002,
    trigger1 = [0,4],
    odds1 = 50,
    p0 = "你是不是猴子派来的逗比？",
    p4 = "你是不是猴子派来的逗比？",
    time = 5,
    odds2 = 0
    };
getRow(10028)->
    #monsterboxCfg {
    id = 10028,
    monsterid = 22031,
    trigger1 = [0,1,3,4],
    odds1 = 50,
    p0 = "不要以为只有玫瑰才带刺~吱(｡･･｡)",
    p1 = "看我的花粉攻击！",
    p3 = "花蕊谢了……",
    p4 = "不要以为只有玫瑰才带刺~吱(｡･･｡)",
    time = 5,
    odds2 = 0
    };
getRow(10029)->
    #monsterboxCfg {
    id = 10029,
    monsterid = 22031,
    trigger1 = [0,1,3,4],
    odds1 = 60,
    p0 = "我很美，但是也很暴力。",
    p1 = "看我的花粉攻击！",
    p3 = "花蕊谢了……",
    p4 = "我很美，但是也很暴力。",
    time = 5,
    odds2 = 0
    };
getRow(10030)->
    #monsterboxCfg {
    id = 10030,
    monsterid = 22001,
    trigger1 = [0,1,3,4],
    odds1 = 50,
    p0 = "菇菇，菇菇！进攻！",
    p1 = "别想这样战胜我们……",
    p3 = "菇菇输了……",
    p4 = "菇菇，菇菇！进攻！",
    time = 5,
    odds2 = 0
    };
getRow(10031)->
    #monsterboxCfg {
    id = 10031,
    monsterid = 22013,
    trigger1 = [0],
    odds1 = 50,
    p0 = "只想安静地看风景，偏偏老是被打扰！",
    time = 5,
    odds2 = 0
    };
getRow(10032)->
    #monsterboxCfg {
    id = 10032,
    monsterid = 22013,
    trigger1 = [0,4],
    odds1 = 50,
    p0 = "这片海岛被我承包了。",
    time = 5,
    odds2 = 0
    };
getRow(10033)->
    #monsterboxCfg {
    id = 10033,
    monsterid = 22013,
    trigger1 = [0,4],
    odds1 = 50,
    p0 = "我不想伤害你，可是我控制不住我自己啊~",
    time = 5,
    odds2 = 0
    };
getRow(10034)->
    #monsterboxCfg {
    id = 10034,
    monsterid = 22017,
    trigger1 = [0,4],
    odds1 = 50,
    p0 = "胆敢坏罗撒特大人的好事！风暴，收拾他~",
    p4 = "胆敢坏罗撒特大人的好事！风暴，收拾他~",
    time = 5,
    odds2 = 0
    };
getRow(10035)->
    #monsterboxCfg {
    id = 10035,
    monsterid = 22017,
    trigger1 = [0,4],
    odds1 = 50,
    p0 = "风暴？风暴？看来只有我先上了。",
    p4 = "风暴？风暴？看来只有我先上了。",
    time = 5,
    odds2 = 0
    };
getRow(10036)->
    #monsterboxCfg {
    id = 10036,
    monsterid = 22018,
    trigger1 = [0,4],
    odds1 = 50,
    p0 = "火焰？你叫我吗？",
    p4 = "火焰？你叫我吗？",
    time = 5,
    odds2 = 0
    };
getRow(10037)->
    #monsterboxCfg {
    id = 10037,
    monsterid = 22018,
    trigger1 = [0,4],
    odds1 = 50,
    p0 = "这个火焰，都打起来了，也不知跑哪儿去了( º﹃º )",
    p4 = "这个火焰，都打起来了，也不知跑哪儿去了( º﹃º )",
    time = 5,
    odds2 = 0
    };
getRow(10038)->
    #monsterboxCfg {
    id = 10038,
    monsterid = 22009,
    trigger1 = [0,4],
    odds1 = 50,
    p0 = "丽莎可是拥有女神灵体的力量，你可不要小瞧我了哟~",
    p4 = "丽莎可是拥有女神灵体的力量，你可不要小瞧我了哟~",
    time = 5,
    odds2 = 0
    };
getRow(10039)->
    #monsterboxCfg {
    id = 10039,
    monsterid = 22009,
    trigger1 = [0,4],
    odds1 = 50,
    p0 = "你的力量很强大呢~",
    p4 = "你的力量很强大呢~",
    time = 5,
    odds2 = 0
    };
getRow(10040)->
    #monsterboxCfg {
    id = 10040,
    monsterid = 22009,
    trigger1 = [0,4],
    odds1 = 50,
    p0 = "等到女神麻麻的神力恢复，丽莎也会变得更强大的",
    p4 = "等到女神麻麻的神力恢复，丽莎也会变得更强大的",
    time = 5,
    odds2 = 0
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
    {1001},
    {1002},
    {1003},
    {1004},
    {1005},
    {1006},
    {1007},
    {1008},
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
    {1031},
    {1032},
    {1033},
    {1034},
    {1035},
    {1036},
    {1037},
    {1038},
    {2005},
    {2006},
    {2007},
    {2008},
    {2009},
    {2010},
    {2011},
    {2012},
    {2025},
    {2026},
    {2027},
    {2028},
    {2029},
    {2030},
    {2031},
    {2032},
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
    {10022},
    {10023},
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
    {10040}
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
    1001,
    1002,
    1003,
    1004,
    1005,
    1006,
    1007,
    1008,
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
    1031,
    1032,
    1033,
    1034,
    1035,
    1036,
    1037,
    1038,
    2005,
    2006,
    2007,
    2008,
    2009,
    2010,
    2011,
    2012,
    2025,
    2026,
    2027,
    2028,
    2029,
    2030,
    2031,
    2032,
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
    10022,
    10023,
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
    10040
    ].

