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
getRow(51)->
    #monsterboxCfg {
    id = 51,
    monsterid = 991,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "唧唧复唧唧，唧唧又唧唧，唧唧唧，唧唧唧(｡･･｡)",
    p1 = "唧唧复唧唧，唧唧又唧唧，唧唧唧，唧唧唧(｡･･｡)",
    p2 = "唧唧复唧唧，唧唧又唧唧，唧唧唧，唧唧唧(｡･･｡)",
    p3 = "唧唧复唧唧，唧唧又唧唧，唧唧唧，唧唧唧(｡･･｡)",
    p4 = "唧唧复唧唧，唧唧又唧唧，唧唧唧，唧唧唧(｡･･｡)",
    p5 = "唧唧复唧唧，唧唧又唧唧，唧唧唧，唧唧唧(｡･･｡)",
    time = 10,
    odds2 = 0
    };
getRow(52)->
    #monsterboxCfg {
    id = 52,
    monsterid = 991,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "浪里个浪（๑✧∀✧๑），浪里个荡",
    p1 = "浪里个浪（๑✧∀✧๑），浪里个荡",
    p2 = "浪里个浪（๑✧∀✧๑），浪里个荡",
    p3 = "浪里个浪（๑✧∀✧๑），浪里个荡",
    p4 = "浪里个浪（๑✧∀✧๑），浪里个荡",
    p5 = "浪里个浪（๑✧∀✧๑），浪里个荡",
    time = 10,
    odds2 = 0
    };
getRow(53)->
    #monsterboxCfg {
    id = 53,
    monsterid = 991,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "眯眯眼都是怪物，所以我是个正常人^ↀᴥↀ^",
    p1 = "眯眯眼都是怪物，所以我是个正常人^ↀᴥↀ^",
    p2 = "眯眯眼都是怪物，所以我是个正常人^ↀᴥↀ^",
    p3 = "眯眯眼都是怪物，所以我是个正常人^ↀᴥↀ^",
    p4 = "眯眯眼都是怪物，所以我是个正常人^ↀᴥↀ^",
    p5 = "眯眯眼都是怪物，所以我是个正常人^ↀᴥↀ^",
    time = 10,
    odds2 = 0
    };
getRow(54)->
    #monsterboxCfg {
    id = 54,
    monsterid = 991,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "你们说我们只是虚假的守卫？怎么可能，你摸摸，这是货真价实的貂皮(◕‿◕✿)",
    p1 = "你们说我们只是虚假的守卫？怎么可能，你摸摸，这是货真价实的貂皮(◕‿◕✿)",
    p2 = "你们说我们只是虚假的守卫？怎么可能，你摸摸，这是货真价实的貂皮(◕‿◕✿)",
    p3 = "你们说我们只是虚假的守卫？怎么可能，你摸摸，这是货真价实的貂皮(◕‿◕✿)",
    p4 = "你们说我们只是虚假的守卫？怎么可能，你摸摸，这是货真价实的貂皮(◕‿◕✿)",
    p5 = "你们说我们只是虚假的守卫？怎么可能，你摸摸，这是货真价实的貂皮(◕‿◕✿)",
    time = 10,
    odds2 = 0
    };
getRow(55)->
    #monsterboxCfg {
    id = 55,
    monsterid = 991,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "狸猫王朝的开拓者，彼得·拿凯仑(✿╹◡╹)曾说过“我来，我见，我征服”",
    p1 = "狸猫王朝的开拓者，彼得·拿凯仑(✿╹◡╹)曾说过“我来，我见，我征服”",
    p2 = "狸猫王朝的开拓者，彼得·拿凯仑(✿╹◡╹)曾说过“我来，我见，我征服”",
    p3 = "狸猫王朝的开拓者，彼得·拿凯仑(✿╹◡╹)曾说过“我来，我见，我征服”",
    p4 = "狸猫王朝的开拓者，彼得·拿凯仑(✿╹◡╹)曾说过“我来，我见，我征服”",
    p5 = "狸猫王朝的开拓者，彼得·拿凯仑(✿╹◡╹)曾说过“我来，我见，我征服”",
    time = 10,
    odds2 = 0
    };
getRow(56)->
    #monsterboxCfg {
    id = 56,
    monsterid = 992,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "唧唧复唧唧，唧唧又唧唧，唧唧唧，唧唧唧(｡･･｡)",
    p1 = "唧唧复唧唧，唧唧又唧唧，唧唧唧，唧唧唧(｡･･｡)",
    p2 = "唧唧复唧唧，唧唧又唧唧，唧唧唧，唧唧唧(｡･･｡)",
    p3 = "唧唧复唧唧，唧唧又唧唧，唧唧唧，唧唧唧(｡･･｡)",
    p4 = "唧唧复唧唧，唧唧又唧唧，唧唧唧，唧唧唧(｡･･｡)",
    p5 = "唧唧复唧唧，唧唧又唧唧，唧唧唧，唧唧唧(｡･･｡)",
    time = 10,
    odds2 = 0
    };
getRow(57)->
    #monsterboxCfg {
    id = 57,
    monsterid = 992,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "浪里个浪（๑✧∀✧๑），浪里个荡",
    p1 = "浪里个浪（๑✧∀✧๑），浪里个荡",
    p2 = "浪里个浪（๑✧∀✧๑），浪里个荡",
    p3 = "浪里个浪（๑✧∀✧๑），浪里个荡",
    p4 = "浪里个浪（๑✧∀✧๑），浪里个荡",
    p5 = "浪里个浪（๑✧∀✧๑），浪里个荡",
    time = 10,
    odds2 = 0
    };
getRow(58)->
    #monsterboxCfg {
    id = 58,
    monsterid = 992,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "眯眯眼都是怪物，所以我是个正常人^ↀᴥↀ^",
    p1 = "眯眯眼都是怪物，所以我是个正常人^ↀᴥↀ^",
    p2 = "眯眯眼都是怪物，所以我是个正常人^ↀᴥↀ^",
    p3 = "眯眯眼都是怪物，所以我是个正常人^ↀᴥↀ^",
    p4 = "眯眯眼都是怪物，所以我是个正常人^ↀᴥↀ^",
    p5 = "眯眯眼都是怪物，所以我是个正常人^ↀᴥↀ^",
    time = 10,
    odds2 = 0
    };
getRow(59)->
    #monsterboxCfg {
    id = 59,
    monsterid = 992,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "你们说我们只是虚假的守卫？怎么可能，你摸摸，这是货真价实的貂皮(◕‿◕✿)",
    p1 = "你们说我们只是虚假的守卫？怎么可能，你摸摸，这是货真价实的貂皮(◕‿◕✿)",
    p2 = "你们说我们只是虚假的守卫？怎么可能，你摸摸，这是货真价实的貂皮(◕‿◕✿)",
    p3 = "你们说我们只是虚假的守卫？怎么可能，你摸摸，这是货真价实的貂皮(◕‿◕✿)",
    p4 = "你们说我们只是虚假的守卫？怎么可能，你摸摸，这是货真价实的貂皮(◕‿◕✿)",
    p5 = "你们说我们只是虚假的守卫？怎么可能，你摸摸，这是货真价实的貂皮(◕‿◕✿)",
    time = 10,
    odds2 = 0
    };
getRow(60)->
    #monsterboxCfg {
    id = 60,
    monsterid = 992,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "狸猫王朝的开拓者，彼得·拿凯仑(✿╹◡╹)曾说过“我来，我见，我征服”",
    p1 = "狸猫王朝的开拓者，彼得·拿凯仑(✿╹◡╹)曾说过“我来，我见，我征服”",
    p2 = "狸猫王朝的开拓者，彼得·拿凯仑(✿╹◡╹)曾说过“我来，我见，我征服”",
    p3 = "狸猫王朝的开拓者，彼得·拿凯仑(✿╹◡╹)曾说过“我来，我见，我征服”",
    p4 = "狸猫王朝的开拓者，彼得·拿凯仑(✿╹◡╹)曾说过“我来，我见，我征服”",
    p5 = "狸猫王朝的开拓者，彼得·拿凯仑(✿╹◡╹)曾说过“我来，我见，我征服”",
    time = 10,
    odds2 = 0
    };
getRow(61)->
    #monsterboxCfg {
    id = 61,
    monsterid = 1200,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "火焰，在末法中熊熊燃烧ლಠ益ಠ)ლ",
    p1 = "火焰，在末法中熊熊燃烧ლಠ益ಠ)ლ",
    p2 = "火焰，在末法中熊熊燃烧ლಠ益ಠ)ლ",
    p3 = "火焰，在末法中熊熊燃烧ლಠ益ಠ)ლ",
    p4 = "火焰，在末法中熊熊燃烧ლಠ益ಠ)ლ",
    p5 = "火焰，在末法中熊熊燃烧ლಠ益ಠ)ლ",
    time = 10,
    odds2 = 0
    };
getRow(62)->
    #monsterboxCfg {
    id = 62,
    monsterid = 1201,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "如果你见过艾思吉领冰川上的鲁冰花(◕▿◕✿)，你一定会感慨冰的柔情",
    p1 = "如果你见过艾思吉领冰川上的鲁冰花(◕▿◕✿)，你一定会感慨冰的柔情",
    p2 = "如果你见过艾思吉领冰川上的鲁冰花(◕▿◕✿)，你一定会感慨冰的柔情",
    p3 = "如果你见过艾思吉领冰川上的鲁冰花(◕▿◕✿)，你一定会感慨冰的柔情",
    p4 = "如果你见过艾思吉领冰川上的鲁冰花(◕▿◕✿)，你一定会感慨冰的柔情",
    p5 = "如果你见过艾思吉领冰川上的鲁冰花(◕▿◕✿)，你一定会感慨冰的柔情",
    time = 10,
    odds2 = 0
    };
getRow(63)->
    #monsterboxCfg {
    id = 63,
    monsterid = 1202,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "轻灵之舞，蹁跹婆娑(๑°⌓°๑)",
    p1 = "轻灵之舞，蹁跹婆娑(๑°⌓°๑)",
    p2 = "轻灵之舞，蹁跹婆娑(๑°⌓°๑)",
    p3 = "轻灵之舞，蹁跹婆娑(๑°⌓°๑)",
    p4 = "轻灵之舞，蹁跹婆娑(๑°⌓°๑)",
    p5 = "轻灵之舞，蹁跹婆娑(๑°⌓°๑)",
    time = 10,
    odds2 = 0
    };
getRow(64)->
    #monsterboxCfg {
    id = 64,
    monsterid = 1203,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "你是电，你是光；我是雷(〃￣ω￣〃ゞ，李雷的雷！",
    p1 = "你是电，你是光；我是雷(〃￣ω￣〃ゞ，李雷的雷！",
    p2 = "你是电，你是光；我是雷(〃￣ω￣〃ゞ，李雷的雷！",
    p3 = "你是电，你是光；我是雷(〃￣ω￣〃ゞ，李雷的雷！",
    p4 = "你是电，你是光；我是雷(〃￣ω￣〃ゞ，李雷的雷！",
    p5 = "你是电，你是光；我是雷(〃￣ω￣〃ゞ，李雷的雷！",
    time = 10,
    odds2 = 0
    };
getRow(65)->
    #monsterboxCfg {
    id = 65,
    monsterid = 1204,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "光与暗是双生子，我是姐姐(•ө•)♡，他是弟弟",
    p1 = "光与暗是双生子，我是姐姐(•ө•)♡，他是弟弟",
    p2 = "光与暗是双生子，我是姐姐(•ө•)♡，他是弟弟",
    p3 = "光与暗是双生子，我是姐姐(•ө•)♡，他是弟弟",
    p4 = "光与暗是双生子，我是姐姐(•ө•)♡，他是弟弟",
    p5 = "光与暗是双生子，我是姐姐(•ө•)♡，他是弟弟",
    time = 10,
    odds2 = 0
    };
getRow(66)->
    #monsterboxCfg {
    id = 66,
    monsterid = 1205,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "暗与光的双生子，我是哥哥( ͝סּ ͜ʖ͡סּ)，她是妹妹",
    p1 = "暗与光的双生子，我是哥哥( ͝סּ ͜ʖ͡סּ)，她是妹妹",
    p2 = "暗与光的双生子，我是哥哥( ͝סּ ͜ʖ͡סּ)，她是妹妹",
    p3 = "暗与光的双生子，我是哥哥( ͝סּ ͜ʖ͡סּ)，她是妹妹",
    p4 = "暗与光的双生子，我是哥哥( ͝סּ ͜ʖ͡סּ)，她是妹妹",
    p5 = "暗与光的双生子，我是哥哥( ͝סּ ͜ʖ͡סּ)，她是妹妹",
    time = 10,
    odds2 = 0
    };
getRow(73)->
    #monsterboxCfg {
    id = 73,
    monsterid = 1212,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "火焰，在末法中熊熊燃烧ლಠ益ಠ)ლ",
    p1 = "火焰，在末法中熊熊燃烧ლಠ益ಠ)ლ",
    p2 = "火焰，在末法中熊熊燃烧ლಠ益ಠ)ლ",
    p3 = "火焰，在末法中熊熊燃烧ლಠ益ಠ)ლ",
    p4 = "火焰，在末法中熊熊燃烧ლಠ益ಠ)ლ",
    p5 = "火焰，在末法中熊熊燃烧ლಠ益ಠ)ლ",
    time = 10,
    odds2 = 0
    };
getRow(74)->
    #monsterboxCfg {
    id = 74,
    monsterid = 1213,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "如果你见过艾思吉领冰川上的鲁冰花(◕▿◕✿)，你一定会感慨冰的柔情",
    p1 = "如果你见过艾思吉领冰川上的鲁冰花(◕▿◕✿)，你一定会感慨冰的柔情",
    p2 = "如果你见过艾思吉领冰川上的鲁冰花(◕▿◕✿)，你一定会感慨冰的柔情",
    p3 = "如果你见过艾思吉领冰川上的鲁冰花(◕▿◕✿)，你一定会感慨冰的柔情",
    p4 = "如果你见过艾思吉领冰川上的鲁冰花(◕▿◕✿)，你一定会感慨冰的柔情",
    p5 = "如果你见过艾思吉领冰川上的鲁冰花(◕▿◕✿)，你一定会感慨冰的柔情",
    time = 10,
    odds2 = 0
    };
getRow(75)->
    #monsterboxCfg {
    id = 75,
    monsterid = 1214,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "轻灵之舞，蹁跹婆娑(๑°⌓°๑)",
    p1 = "轻灵之舞，蹁跹婆娑(๑°⌓°๑)",
    p2 = "轻灵之舞，蹁跹婆娑(๑°⌓°๑)",
    p3 = "轻灵之舞，蹁跹婆娑(๑°⌓°๑)",
    p4 = "轻灵之舞，蹁跹婆娑(๑°⌓°๑)",
    p5 = "轻灵之舞，蹁跹婆娑(๑°⌓°๑)",
    time = 10,
    odds2 = 0
    };
getRow(76)->
    #monsterboxCfg {
    id = 76,
    monsterid = 1215,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "你是电，你是光；我是雷(〃￣ω￣〃ゞ，李雷的雷！",
    p1 = "你是电，你是光；我是雷(〃￣ω￣〃ゞ，李雷的雷！",
    p2 = "你是电，你是光；我是雷(〃￣ω￣〃ゞ，李雷的雷！",
    p3 = "你是电，你是光；我是雷(〃￣ω￣〃ゞ，李雷的雷！",
    p4 = "你是电，你是光；我是雷(〃￣ω￣〃ゞ，李雷的雷！",
    p5 = "你是电，你是光；我是雷(〃￣ω￣〃ゞ，李雷的雷！",
    time = 10,
    odds2 = 0
    };
getRow(77)->
    #monsterboxCfg {
    id = 77,
    monsterid = 1216,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "光与暗是双生子，我是姐姐(•ө•)♡，他是弟弟",
    p1 = "光与暗是双生子，我是姐姐(•ө•)♡，他是弟弟",
    p2 = "光与暗是双生子，我是姐姐(•ө•)♡，他是弟弟",
    p3 = "光与暗是双生子，我是姐姐(•ө•)♡，他是弟弟",
    p4 = "光与暗是双生子，我是姐姐(•ө•)♡，他是弟弟",
    p5 = "光与暗是双生子，我是姐姐(•ө•)♡，他是弟弟",
    time = 10,
    odds2 = 0
    };
getRow(78)->
    #monsterboxCfg {
    id = 78,
    monsterid = 1217,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "暗与光的双生子，我是哥哥( ͝סּ ͜ʖ͡סּ)，她是妹妹",
    p1 = "暗与光的双生子，我是哥哥( ͝סּ ͜ʖ͡סּ)，她是妹妹",
    p2 = "暗与光的双生子，我是哥哥( ͝סּ ͜ʖ͡סּ)，她是妹妹",
    p3 = "暗与光的双生子，我是哥哥( ͝סּ ͜ʖ͡סּ)，她是妹妹",
    p4 = "暗与光的双生子，我是哥哥( ͝סּ ͜ʖ͡סּ)，她是妹妹",
    p5 = "暗与光的双生子，我是哥哥( ͝סּ ͜ʖ͡סּ)，她是妹妹",
    time = 10,
    odds2 = 0
    };
getRow(85)->
    #monsterboxCfg {
    id = 85,
    monsterid = 1224,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "火焰，在末法中熊熊燃烧ლಠ益ಠ)ლ",
    p1 = "火焰，在末法中熊熊燃烧ლಠ益ಠ)ლ",
    p2 = "火焰，在末法中熊熊燃烧ლಠ益ಠ)ლ",
    p3 = "火焰，在末法中熊熊燃烧ლಠ益ಠ)ლ",
    p4 = "火焰，在末法中熊熊燃烧ლಠ益ಠ)ლ",
    p5 = "火焰，在末法中熊熊燃烧ლಠ益ಠ)ლ",
    time = 10,
    odds2 = 0
    };
getRow(86)->
    #monsterboxCfg {
    id = 86,
    monsterid = 1225,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "如果你见过艾思吉领冰川上的鲁冰花(◕▿◕✿)，你一定会感慨冰的柔情",
    p1 = "如果你见过艾思吉领冰川上的鲁冰花(◕▿◕✿)，你一定会感慨冰的柔情",
    p2 = "如果你见过艾思吉领冰川上的鲁冰花(◕▿◕✿)，你一定会感慨冰的柔情",
    p3 = "如果你见过艾思吉领冰川上的鲁冰花(◕▿◕✿)，你一定会感慨冰的柔情",
    p4 = "如果你见过艾思吉领冰川上的鲁冰花(◕▿◕✿)，你一定会感慨冰的柔情",
    p5 = "如果你见过艾思吉领冰川上的鲁冰花(◕▿◕✿)，你一定会感慨冰的柔情",
    time = 10,
    odds2 = 0
    };
getRow(87)->
    #monsterboxCfg {
    id = 87,
    monsterid = 1226,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "轻灵之舞，蹁跹婆娑(๑°⌓°๑)",
    p1 = "轻灵之舞，蹁跹婆娑(๑°⌓°๑)",
    p2 = "轻灵之舞，蹁跹婆娑(๑°⌓°๑)",
    p3 = "轻灵之舞，蹁跹婆娑(๑°⌓°๑)",
    p4 = "轻灵之舞，蹁跹婆娑(๑°⌓°๑)",
    p5 = "轻灵之舞，蹁跹婆娑(๑°⌓°๑)",
    time = 10,
    odds2 = 0
    };
getRow(88)->
    #monsterboxCfg {
    id = 88,
    monsterid = 1227,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "你是电，你是光；我是雷(〃￣ω￣〃ゞ，李雷的雷！",
    p1 = "你是电，你是光；我是雷(〃￣ω￣〃ゞ，李雷的雷！",
    p2 = "你是电，你是光；我是雷(〃￣ω￣〃ゞ，李雷的雷！",
    p3 = "你是电，你是光；我是雷(〃￣ω￣〃ゞ，李雷的雷！",
    p4 = "你是电，你是光；我是雷(〃￣ω￣〃ゞ，李雷的雷！",
    p5 = "你是电，你是光；我是雷(〃￣ω￣〃ゞ，李雷的雷！",
    time = 10,
    odds2 = 0
    };
getRow(89)->
    #monsterboxCfg {
    id = 89,
    monsterid = 1228,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "光与暗是双生子，我是姐姐(•ө•)♡，他是弟弟",
    p1 = "光与暗是双生子，我是姐姐(•ө•)♡，他是弟弟",
    p2 = "光与暗是双生子，我是姐姐(•ө•)♡，他是弟弟",
    p3 = "光与暗是双生子，我是姐姐(•ө•)♡，他是弟弟",
    p4 = "光与暗是双生子，我是姐姐(•ө•)♡，他是弟弟",
    p5 = "光与暗是双生子，我是姐姐(•ө•)♡，他是弟弟",
    time = 10,
    odds2 = 0
    };
getRow(90)->
    #monsterboxCfg {
    id = 90,
    monsterid = 1229,
    trigger1 = [0,1,2,3,4,5],
    odds1 = 60,
    p0 = "暗与光的双生子，我是哥哥( ͝סּ ͜ʖ͡סּ)，她是妹妹",
    p1 = "暗与光的双生子，我是哥哥( ͝סּ ͜ʖ͡סּ)，她是妹妹",
    p2 = "暗与光的双生子，我是哥哥( ͝סּ ͜ʖ͡סּ)，她是妹妹",
    p3 = "暗与光的双生子，我是哥哥( ͝סּ ͜ʖ͡סּ)，她是妹妹",
    p4 = "暗与光的双生子，我是哥哥( ͝סּ ͜ʖ͡סּ)，她是妹妹",
    p5 = "暗与光的双生子，我是哥哥( ͝סּ ͜ʖ͡סּ)，她是妹妹",
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
getRow(2001)->
    #monsterboxCfg {
    id = 2001,
    monsterid = 25010,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "小块头才有大智慧！",
    p4 = "豺狼虎豹，我们豺狼家族排在第一位次！d(￣◇￣)b",
    time = 5,
    odds2 = 0
    };
getRow(2002)->
    #monsterboxCfg {
    id = 2002,
    monsterid = 25010,
    trigger1 = [4],
    odds1 = 60,
    p4 = "没听过我们阿豺( ﾟДﾟ)b，狼叔总听过吧",
    time = 5,
    odds2 = 0
    };
getRow(2003)->
    #monsterboxCfg {
    id = 2003,
    monsterid = 25010,
    trigger1 = [4],
    odds1 = 60,
    p4 = "┗|｀O′|┛ 嗷~~，汪汪",
    time = 5,
    odds2 = 0
    };
getRow(2004)->
    #monsterboxCfg {
    id = 2004,
    monsterid = 25010,
    trigger1 = [4],
    odds1 = 60,
    p4 = "看着我这精悍的身材(^^)，当对得起这个\"小\"字",
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
getRow(2013)->
    #monsterboxCfg {
    id = 2013,
    monsterid = 25011,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "看我的阿姆斯特朗回旋加速喷气式阿姆斯特朗炮",
    p4 = "红色属于我们这些要实现自己愿望的行动派",
    time = 5,
    odds2 = 0
    };
getRow(2014)->
    #monsterboxCfg {
    id = 2014,
    monsterid = 25011,
    trigger1 = [4],
    odds1 = 60,
    p4 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"",
    time = 5,
    odds2 = 0
    };
getRow(2015)->
    #monsterboxCfg {
    id = 2015,
    monsterid = 25011,
    trigger1 = [4],
    odds1 = 60,
    p4 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"",
    time = 5,
    odds2 = 0
    };
getRow(2016)->
    #monsterboxCfg {
    id = 2016,
    monsterid = 25011,
    trigger1 = [4],
    odds1 = 60,
    p4 = "菇菇姑姑说\"这些蝴蝶多好看，别伤了它们\"",
    time = 5,
    odds2 = 0
    };
getRow(2017)->
    #monsterboxCfg {
    id = 2017,
    monsterid = 25012,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "看我的阿姆斯特朗回旋加速喷气式阿姆斯特朗炮",
    p4 = "黄色属于我们这些明朗、快活的勤奋派",
    time = 5,
    odds2 = 0
    };
getRow(2018)->
    #monsterboxCfg {
    id = 2018,
    monsterid = 25012,
    trigger1 = [4],
    odds1 = 60,
    p4 = "菇菇姑姑说\"画像的时候年轻，后来就不年轻了\"",
    time = 5,
    odds2 = 0
    };
getRow(2019)->
    #monsterboxCfg {
    id = 2019,
    monsterid = 25012,
    trigger1 = [4],
    odds1 = 60,
    p4 = "菇菇姑姑说\"过儿，我又害怕，又欢喜\"",
    time = 5,
    odds2 = 0
    };
getRow(2020)->
    #monsterboxCfg {
    id = 2020,
    monsterid = 25012,
    trigger1 = [4],
    odds1 = 60,
    p4 = "菇菇姑姑说\"这些蝴蝶多好看，别伤了它们\"",
    time = 5,
    odds2 = 0
    };
getRow(2021)->
    #monsterboxCfg {
    id = 2021,
    monsterid = 25014,
    trigger1 = [0,4],
    odds1 = 60,
    p0 = "让我告诉你花儿为什么这样红，这样红，样红，红",
    p4 = "花花草草，我的小草在哪里?",
    time = 5,
    odds2 = 0
    };
getRow(2022)->
    #monsterboxCfg {
    id = 2022,
    monsterid = 25014,
    trigger1 = [4],
    odds1 = 60,
    p4 = "草草花花，你的大花在这里！",
    time = 5,
    odds2 = 0
    };
getRow(2023)->
    #monsterboxCfg {
    id = 2023,
    monsterid = 25014,
    trigger1 = [4],
    odds1 = 60,
    p4 = "花中四君子分别是“花花，花花，花花，花花”",
    time = 5,
    odds2 = 0
    };
getRow(2024)->
    #monsterboxCfg {
    id = 2024,
    monsterid = 25014,
    trigger1 = [4],
    odds1 = 60,
    p4 = "花儿为什么这样红，这样红，样红，红",
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
    {73},
    {74},
    {75},
    {76},
    {77},
    {78},
    {85},
    {86},
    {87},
    {88},
    {89},
    {90},
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
    {2001},
    {2002},
    {2003},
    {2004},
    {2005},
    {2006},
    {2007},
    {2008},
    {2009},
    {2010},
    {2011},
    {2012},
    {2013},
    {2014},
    {2015},
    {2016},
    {2017},
    {2018},
    {2019},
    {2020},
    {2021},
    {2022},
    {2023},
    {2024},
    {2025},
    {2026},
    {2027},
    {2028},
    {2029},
    {2030},
    {2031},
    {2032}
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
    73,
    74,
    75,
    76,
    77,
    78,
    85,
    86,
    87,
    88,
    89,
    90,
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
    2001,
    2002,
    2003,
    2004,
    2005,
    2006,
    2007,
    2008,
    2009,
    2010,
    2011,
    2012,
    2013,
    2014,
    2015,
    2016,
    2017,
    2018,
    2019,
    2020,
    2021,
    2022,
    2023,
    2024,
    2025,
    2026,
    2027,
    2028,
    2029,
    2030,
    2031,
    2032
    ].

